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
        if($("#lat").val()){
        	lat=$("#lat").val();
        }
        if($("#lng").val()){
        	lng=$("#lng").val();
        }
       	var latLng = new google.maps.LatLng(lat, lng);
       	var myMapOptions = {
           		sensor: true,
           		//mapTypeControl: true,
           		zoom: 10,
           		center:latLng,
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
            google.maps.event.addListener(marker, 'mouseover', function() {
            	
            	var div='<div class="media">'+'<div class="media-left">'+		
				  '<div id="flip" class="carousel slide" data-ride="carousel">'+
			/*		'<ol class="carousel-indicators">';
            	if(jsonObj.files.length>0){
            		for(var i=0;i<jsonObj.files.length;i++){
            			if(i==0){
            			div=div+'<li data-target="#flip" data-slide-to="'+i+'" class="active"></li>';
            			}else{
            				div=div+'<li data-target="#flip" data-slide-to="'+i+'"></li>';	
            			}
					}	
            	}
            	div=div+'</ol>'+*/'<div class="carousel-inner" role="listbox">';
            	if(jsonObj.files.length>0){
            		for(var i=0;i<jsonObj.files.length;i++){
            			if(i==0){
            			div=div+'<div class="item active">'+
						'<img src="'+jsonObj.files[i].address+'" class="img-info" >'+						
						'</div>';
            			}else{
            				div=div+'<div class="item">'+
    						'<img src="'+jsonObj.files[i].address+'" class="img-info" >'+   						
    						'</div>';
            			}
					}	
            	}
            	div=div+'</div>'+
				'<a class="left carousel-control" href="#flip" role="button" data-slide="prev">'+
				'<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>'+
					'<span class="sr-only">Previous</span>'+
				'</a>'+ 
				'<a class="right carousel-control" href="#flip" role="button" data-slide="next">'+
				'<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>'+
					'<span class="sr-only">Next</span>'+
				'</a>'+
			'</div>'+	  
			  '</div>'+
			  '<div class="media-body">'+
			    '<h4 class="media-heading">Infomation:</h4>'+
			    	jsonObj.address+','+jsonObj.city+','+jsonObj.state+','+jsonObj.zipCode+','+jsonObj.country+
			  '</div>'+
			  '</div>';           	
			infowindow.setContent(div);						
                infowindow.open(map, marker); 
            	});
        	};
 
 	function codeAddress() {
		var fulladdress = $("#address").val();
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
				$("#address").val(address[0]);
				} else {
				alert("Geocode was not successful for the following reason: "+ status);
				}
			});
		}; 


	
	
	function ajaxCall() {
			deleteMarkers();
			//event.preventDefault();
            $.ajax({
                url: '/BluSky/property/display4/'+ne.lat()+'/'+ne.lng()+'/'+sw.lat()+'/'+sw.lng()+"/",     				           
            }).done(function(json){         
                   for (var i = 0; i < json.properties.length; i++) {
                        var latLng = new google.maps.LatLng(json.properties[i].lat, json.properties[i].lng);                     
                        var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/'; 
                        var marker = new MarkerWithLabel({
                        	   position: latLng,
                        	   draggable: false,
                        	   raiseOnDrag: false,
                        	   map: map,
                        	   labelContent:json.properties[i].price,
                        	   labelAnchor: new google.maps.Point(22, 0),
                        	   labelClass: "labels",
                        	   icon: iconBase+'schools_maps.png'
                        	 });
                        attachInfoWindows(marker, map, infowindow, json.properties[i]);
                        markers.push(marker);
                        };       
           		}).fail(function(xhr){
           		console.log(arguments[1]);           	
            	console.log(xhr.responseText);
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

/*function flipLeaseInfo(obj){
	if(obj.value == 'RENT'){
		$("#leaseDetails").addClass("show");
		$("#leaseDetails").removeClass("hide");
	}else{
		$("#leaseDetails").addClass("hide");
		$("#leaseDetails").removeClass("show");
	}
	
}*/

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
	$('[data-toggle="tooltip"]').tooltip();
	$(".navbar-collapse a:not(.skipThis)").on("click", function() {
		$('.collapse').collapse("hide");
	});
	$(".aList a").on("click", function() {
		window.location.href=$(this).prop("href");								

	}); 
	//var obj = document.getElementById("type");
	//flipLeaseInfo(obj);
	
	
	$("#address").val($("#addressHidden").val());
	/*
	$("#propertyButton").on("click", function(event) {		
				event.preventDefault();				
				var formData = JSON.stringify($('#propertyForm').serializeObject());
							
				 $('#propertyForm').ajaxSubmit({
			         type: 'post', // 提交方式 get/post
			         url: '/BluSky/property/upload1', // 需要提交的 url
			         data: formData,
			         success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
			             // 此处可对 data 作相关处理
			             alert('提交成功！');
			         }		       
			     });
			     return false; // 阻止表单自动提交事件
			 });
*/
				
	/*			$.ajax({
					url : '/BluSky/property/upload',
					type : 'POST',
					contentType : 'application/json', 
					data : formData,
					cache : false,
					dataType : 'json'				
				}).done(function(data){		
						$("#errorMessage").remove();
						if(data.success == false){
						$("#propertyForm input").each(function(){
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
							window.location.href="/BluSky/user/properties";
						}
						
				})
				.fail(function(){
				console.log(arguments[1]);
				});				
		});*/
	});

