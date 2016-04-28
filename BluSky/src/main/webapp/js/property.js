	var lat =25;
	var lng = -84;  
 	var bounds;
 	var zipcode123;
	var geocoder;
	var map;
	var markers = [];
	var markersCenter = [];
	var infowindow;
	var ne;
    var sw ;
	function initialize() {
        geocoder = new google.maps.Geocoder();
       	var latLng = new google.maps.LatLng(lat, lng);
       	var myMapOptions = {
           		sensor: true,
           		//mapTypeControl: true,
           		zoom: 10,
           		center: new google.maps.LatLng(25, -84),
           		rotateControlOptions: false,
          		panControl: false,
           		scrollwheel: false,
          		// mapTypeId: google.maps.MapTypeId.ROADMAP
      		};
       
       	infowindow = new google.maps.InfoWindow({
       	disableAutoPan : false,
       	}); 
        map = new google.maps.Map(document.getElementById('map'), myMapOptions);
        var marker = new google.maps.Marker({
				map : map,
				position : latLng
			});
		markersCenter.push(marker);	 
		var input = document.getElementById('address');
		var searchBox = new google.maps.places.SearchBox((input));
		searchBox.addListener('places_changed', function() {
 				codeAddress();
 			});
		google.maps.event.addListener(map, 'idle', function() {
				var bounds = map.getBounds();
				ne = bounds.getNorthEast();
				sw = bounds.getSouthWest();
				ajaxCall();		 
       		});
   		};
 
 
  	function attachInfoWindows(marker, map, infowindow,jsonObj) {
            google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(
				'<div><a href="/BluSky/property/displayDetails/'+jsonObj.id+'"> <img src="'+jsonObj.files[0].address+'" width=50px height=50px  /> </div></a>'+
				'<div>'+jsonObj.address+' </div>'+
				'<div>'+jsonObj.city+' </div>'+
				'<div>'+jsonObj.zipCode+' </div>'+
				'<div>'+jsonObj.state+' </div>'+
				'<div>'+jsonObj.country+' </div>'
				);
                infowindow.open(map, marker);               
            	});
        	};
 
 	function codeAddress() {
		var fulladdress = document.getElementById("address").value;
		var address = $("#address").val().split(",");
			if(typeof address[1] != 'undefied'  && address[1]!=""){
				$("#city").val($.trim(address[1]));
			}
			if(typeof address[2] != 'undefied' && address[2]!=""){

				$("#state option").each(function(){
				if($(this).val()== $.trim(address[2])){
					$(this).prop("selected","selected");
				}
				});
			}
			if(typeof address[3] != 'undefied' && address[3]!=""){

				$("#country option").each(function(){
				if($(this).val()== $.trim(address[3]) ){
					$(this).prop("selected","selected");
				}
				});
			};
		
		 geocoder.geocode( { 'address': fulladdress}, function(results, status) {
		
				if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				
				var marker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location
				});
				lat=map.getCenter().lat();
				lng=map.getCenter().lng();
				deleteCenterMarkers();
				markersCenter.push(marker);		
				$("#lat").val(lat);
				$("#lng").val(lng);
			
				var searchAddressComponents = results[0].address_components;

				$.each(searchAddressComponents, function(){
				    if(this.types[0]=="postal_code"){
				    	$("#zipCode").val(this.short_name);
				    }
				});				
				} else {
				alert("Geocode was not successful for the following reason: "+ status);
				}
			});
		}; 


	
	
	function ajaxCall() {
			deleteMarkers();
            $.ajax({
                url: '/BluSky/property/display4/'+ne.lat()+'/'+ne.lng()+'/'+sw.lat()+'/'+sw.lng()+"/",            
            }).done(function(json){         
                   for (var i = 0; i < json.properties.length; i++) {
                        var latLng = new google.maps.LatLng(json.properties[i].lat, json.properties[i].lng);                     
                       /* var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/'; */
                        var iconBase = 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=7|FF0000|000000';
                       /*  var marker = new google.maps.Marker({map : map,position: latLng,icon : iconBase+'schools_maps.png'}); */
                        var marker = new google.maps.Marker({map : map,position: latLng,icon : iconBase});
                        attachInfoWindows(marker, map, infowindow, json.properties[i]);
                        markers.push(marker);
                        };
                     for (var j = 0; j < json.users.length; j++) {
                        var latLng = new google.maps.LatLng(json.users[i].lat, json.users[i].lng);                  
                        var marker = new google.maps.Marker({map : map,position: latLng,icon : '../image/Person.png'});
                        //attachInfoWindows(marker, map, infowindow, json.users[i]);
                        markers.push(marker);
                    };          
            }).fail(function(){
            	console.log(arguments[1]);
            });
	
	}; 
	



function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  };
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
};
function deleteCenterMarkers() {
  for (var i = 0; i < markersCenter.length; i++) {
    markersCenter[i].setMap(null);
  };
  markersCenter = [];
};





function addMore() {
	var append = '<div class="files"><div class="col-sm-2"></div><div class="col-sm-10"><div class="input-group" id="files"><input type="file" name="btnFile" class="form-control" /><div class="input-group-btn"><button type="button" class="btn btn-default" onclick="deleteThis(this);"><span class="glyphicon glyphicon-trash"> </span>&nbsp;Delete</button></div></div></div></div>';		
	$("#files").append(append);
};
function deleteThis(obj){
	$(obj).closest("div .files").remove();
}

function validateNumber(obj){
	if(isNaN(obj.value)){
		$(obj).val(0);
	}
	
}

function flipLeaseInfo(obj){
	if(obj.value == 'RENT'){
		$("#leaseDetails").addClass("show");
		$("#leaseDetails").removeClass("hide");
	}else{
		$("#leaseDetails").addClass("hide");
		$("#leaseDetails").removeClass("show");
	}
	
}

function formatCurrency(obj){
	var value=$(obj).val();
	$(obj).val(formatMoney(value));
}

function formatMoney(number, places, symbol, thousand, decimal) {
	number = number || 0;
	number = parseFloat(number.replace(/[^0-9-.]/g, '')); 
    places = !isNaN(places = Math.abs(places)) ? places : 2;
    symbol = symbol !== undefined ? symbol : "$";
    thousand = thousand || ",";
    decimal = decimal || ".";
    var negative = number < 0 ? "-" : "",
        i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
    return symbol + negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
}


$.fn.serializeObject = function(){    
   			var o = {};    
  			var a = this.serializeArray();    
   			$.each(a, function() {    
       		if (o[this.name]) {    
           if (!o[this.name].push) {    
               o[this.name] = [o[this.name]];    
           }    
           o[this.name].push(this.value || '');    
       		} else {    
           o[this.name] = this.value || '';    
       		}    
  			 });    
  			 return o;    
		};  
		
				
$(function(){
	$(".nav").singlePageNav({
		offset : 60
	});
	$('[data-toggle="tooltip"]').tooltip();
	$(".navbar-collapse a:not(.skipThis)").on("click", function() {
		$('.collapse').collapse("hide");
	});
	
	$("#agentsignupForm input[name$='Name']").prop("disabled","disabeld");
	$("#agentsignupForm input[name='email']").prop("disabled","disabeld");
	$("#agentsignupForm input[name='phone']").prop("disabled","disabeld");
	
	$(".aList a").on("click", function() {
		window.location.href=$(this).prop("href");								

	}); 
	
	$("#propertyButton").on("click", function(event) {		
				event.preventDefault();				
				var formData = JSON.stringify($('#propertyForm').serializeObject());
				$.ajax({
					url : '/BluSky/property/upload',
					type : 'POST',
					contentType : 'application/json', 
					data : formData,
					cache : false,
					dataType : 'json'				
				}).done(function(data){		
						$("#errorMessage").remove();
						if(data.success == false){
						$("#signupForm input").each(function(){
							var name = $(this).prop("name");					
						
							if(typeof data[name] != 'undefined'){
							$(this).closest('div').addClass("has-error");
							$(this).closest('div').removeClass("has-success");
							
							}else{
							$(this).closest('div').addClass("has-success");
							$(this).closest('div').removeClass("has-error");
								
							}
							});
						};
						 if(data.dumplicateEmail == true){
							$("#email").closest('div').addClass("has-error");						
							var div='<div class="alert alert-danger" id="errorMessage" role="alert">'+data.email+'</div>';
							$('#signUpModal').append(div);
						
						};
						if(data.success == true){
							window.location.href="/BluSky/user/properties"
						}
						
				})
				.fail(function(){
				console.log(arguments[1]);
				});				
		});
	});

