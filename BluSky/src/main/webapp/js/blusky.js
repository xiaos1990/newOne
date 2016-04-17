
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
	
	
		$(function() {
			$(".nav").singlePageNav({
				offset : 60
			});
			$('[data-toggle="tooltip"]').tooltip();
			$(".navbar-collapse a:not(.skipThis)").on("click", function() {
				$('.collapse').collapse("hide");
			});

			$("#signUpButton").on("click", function() {
				event.preventDefault();
				
				var formData = JSON.stringify($('#signupForm').serializeObject());
			
				$.ajax({
					url : '/BluSky/user/signup',
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
							$("#signUp").modal('hide');
							$("#signInLi,#signUpLi").css("display","none");
							$("#dropDownLog").addClass("show");
							$("#dropDownLog").removeClass("hide");
						}
						
				})
				.fail(function(){
				console.log(arguments[1]);
				});
			});
			 
			
			$("#signInButton").on("click", function() {
				event.preventDefault();
				var forward = window.location.pathname;
				var formData = JSON.stringify($('#signInForm').serializeObject());
			
				$.ajax({
					url : '/BluSky/user/signin',
					type : 'POST',
					contentType : 'application/json', 
					data : formData,
					cache : false,
					dataType : 'json'				
				}).done(function(data){		
					$("#message").remove();					
						 if(data.success == false){
							$("#email").closest('div').addClass("has-error");												
							var div='<div class="alert alert-danger" id="message" role="alert">'+data.message+'</div>';
							$('#signInModal').append(div);						
						}else{
						if($("#rememberMe").is(":checked")){
							$("input[name='pathName']").val(forward);
							$('#signInForm').prop("action","/BluSky/user/signinSave");
							$('#signInForm').submit();
						}
						 	$("#signIn").modal('hide');
							$("#signInLi,#signUpLi").css("display","none");
							$("#dropDownLog").addClass("show");
							$("#dropDownLog").removeClass("hide"); 
						}												
				})
				.fail(function(){
				console.log(arguments[1]);
				});
			}); 
		});
		
		
		
 
		$(".aList a").on("click", function() {
				window.location.href=$(this).prop("href");								
				/*
				 $.ajax({
					url : '/BluSky/user/signOff',
					type : 'GET',
					contentType : 'application/json', 
					cache : false,
					dataType : 'json'				
				}).done(function(data){		
					$("#signInLi,#signUpLi").css("display","block");
						$("#dropDownLog").addClass("hide");
						$("#dropDownLog").removeClass("show");								
				})
				.fail(function(){
				console.log(arguments[1]);
				}); */
			}); 



		function initialize() {
			var input = document.getElementById('address');
			new google.maps.places.SearchBox((input));
		}
		new WOW().init();