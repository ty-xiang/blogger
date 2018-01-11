$(function() {
    /* register,login page functions */
    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
    
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	
	
	$('[data-toggle="popover"]').popover({
	    container: 'body'
	});
	
	
	$('.popover-dismiss').popover({
		  trigger: 'focus'
		})
	
	var username = false;
	var useremail = false;
	var passwoed = false;
	// Check user name if exist?  LXC  in register
	$('#register_username').blur(function(){
	var check = $('#register_username').val();
	var patt = new RegExp("[0-9A-Za-z]{6,25}");
	if(check==""){
		return;
	}else if(!patt.test(check)){
		console.log("username unmatch");
		$('#register_username').attr("data-content","Username invalid");
		$('#register_username').popover("show");
		username = false;
		return;
	}
	$.ajax({
			type : "POST",
			url : "Register",
			data : "username=" + check+"&check=username",
			success : function(response) {
				console.log(response);
				if(response=="userNameOk"){
					$('#register_username').popover("hide");
					//$('#register-submit').addClass("active");
					username = true;
					return;
				}else{
					$('#register_username').attr("data-content","Username existed");
					$('#register_username').popover("show");
					//$('#register-submit').prop("disabled",true);
					username = false;
				}
				
			}
		});
	});
	// check useremail exist	 in register
	$('#register_useremail').blur(function(){
		var check = $('#register_useremail').val();
		//var patt = new RegExp("^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$");
		var re = /\S+@\S+\.\S+/;
		if(check==""){
			return;
		}else if(!re.test(check)){
			console.log("email unmatch");
			$('#register_useremail').attr("data-content","email invalid");
			$('#register_useremail').popover("show");
			useremail = false;
			return;
		}
		$.ajax({
			type : "POST",
			url : "Register",
			data : "useremail=" + $('#register_useremail').val()
					+ "&check=useremail",
			success : function(response) {
				console.log(response);
				if(response=="userEmailOk"){
					$('#register_useremail').popover("hide"); 
					useremail = true;
					return;
				}else{
					$('#register_useremail').attr("data-content","email existed");
					$('#register_useremail').popover("show");
					useremail = false;
				}
			    	
			}	
		});
	})


	$('#password1').blur(function(){  //test password1 match user in register
		var password = $('#password1').val();
		var patt = new RegExp("[0-9A-Za-z]{6,25}");
		if(!patt.test(password)){
			$('#password1').popover("show");
			password = false;
		}else{
			$('#password1').popover("hide");
			password = true;
		}
	});

	$('#confirm-password').blur(function(){  //test confirm password match user in register
		var password = $('#confirm-password').val();
		
		if($('#password1').val()!=password){
			$('#confirm-password').popover("show");
		}else{
			$('#confirm-password').popover("hide");
		}
	});

	$('#password').blur(function(){  //test password match user in login
		var username = $('#username').val();
		var password = $('#password').val();
		if(username==""||password==""){
			return;
		}
		$.ajax({
			type : "POST",
			url : "Register",
			data : "username=" + username + "&password=" + password + "&check=passwd",
			success : function(response) {
				console.log(response);
				if(response=="ok"){
					$('#password').popover("hide");
					$('#login-submit').addClass("active");
					$('#login-submit').attr("type","submit");
				}else{
					$('#password').popover("show");
					//$('#login-submit').addClass("disabled");
					
				}
			    	
			}	
		});
	})

	$(document).ready(function(){
			$(".caption").click(function(){
				$(this).fadeOut(500);
				$(".container").fadeIn(500);
			});
			
	   
		});
		
	$('#login-form-link').click(function(){
	    $("[data-toggle='popover']").popover('hide');
	});
	$('#register-form-link').click(function(){
	    $("[data-toggle='popover']").popover('hide');
	});

	/* var onloadCallback = function() {  //Recaptcha
	    grecaptcha.render('hidenChecker',{'sitekey' : '6Ld_nBUUAAAAAGvp8HxgDUtNjHj0xpIwnymRfUrs'});
	}; */
	$('#register-submit').click(function(){  //Recaptcha
		var response = grecaptcha.getResponse();
		console.log(response);
	    if(response.length == 0){
	    	console.log("NOT VALID");
	    }
	    else{
	    	console.log("VALID");
	    	submiting();
	    	//$('#register-form').submit();
	    }
	})

	function submiting(){
		console.log("123");
		var check = $('#register_username').val();
		var check1 = $('#register_useremail').val();
		var check2 = $('#confirm-password').val();
		var check3 = $('#password1').val();
		if(check==""||username==false){
			$('#register_username').popover("show");
			return;
		}
		if(check1==""||useremail==false){
			$('#register_useremail').popover("show");
			return;
		}
		if(check2==""||check2!=check3){
			$('#confirm-password').popover("show");
			return;
		}
		if(check3==""||password==false){
			$('#password1').popover("show");
			return;
		}
		$('#register-form').submit();
	}


	
	/*<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
	        async defer>*/
		 
   
    
});




