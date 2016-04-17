var geocoder;

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
		
 
		$(".aList a").on("click", function() {
				window.location.href=$(this).prop("href");											
			}); 



		function initialize() {
			var input = document.getElementById('address');
			new google.maps.places.SearchBox((input));
			geocoder = new google.maps.Geocoder();
		};
		
		function addressCheck(){
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
			
		}
	
				
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
			
			$("#city").on("focus",function(){
			
				addressCheck();
				
			});

			$.getJSON('../resources/US_STATES.json', function(data) {
					var state = $("#state");
					state.append('<option value=""></option>');
					$.each(data, function(key, val) {
						state.append('<option value="'+key+'">' + val + '</option>');
					});
				});
			
			
			
			$("#signUpButton").on("click", function(event) {
				var address = $("#address").val();
				var city= $("#city").val();
				var state= $("#state").val();
				var zipcode= $("#zipCode").val();
				var country= $("#country").val();
				var fullAddress="";
				if((address=$.trim(address))!='')
				fullAddress=fullAddress.toString()+address+',';
				if((city=$.trim(city))!='')
				fullAddress=fullAddress.toString()+city+',';
				if((state=$.trim(state))!='')
				fullAddress=fullAddress.toString()+state+',';
				if((zipcode=$.trim(zipcode))!='')
				fullAddress=fullAddress.toString()+zipcode+",";
				if((country=$.trim(country))!='')
				fullAddress=fullAddress.toString()+country;
				console.log(fullAddress.toString());
				 geocoder.geocode( { 'address': fullAddress}, function(results, status) {
						var lat=results[0].geometry.location.lat();
						var lng=results[0].geometry.location.lng();
						var searchAddressComponents = results[0].address_components;

					$.each(searchAddressComponents, function(){
					    if(this.types[0]=="postal_code"){
					    	$("#zipCode").val(searchPostalCode=this.short_name);
					    }
					});
						$("#lat").val(lat);
						$("#lng").val(lng);
						addressCheck();
						if (status == google.maps.GeocoderStatus.OK) {			
					
						/*$("#signUpButton").on("click", function() {*/
						event.preventDefault();
						
						var formData = JSON.stringify($('#agentsignupForm').serializeObject());
						$.ajax({
							url : '/BluSky/agency/signup',
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
									document.forms[0].submit();
								}
								
						})
						.fail(function(){
						console.log(arguments[1]);
						});
					/*});*/
						
					} else {
						alert("Geocode was not successful for the following reason: "
								+ status);
					}
				});
			});

			});
