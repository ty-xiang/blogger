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
	
	var username = false;
	var useremail = false;
	var passwd = false;
	
	// Check user name if exist
	$('#register_username').blur(function(){
	var check = $('#register_username').val();
	var patt = new RegExp("[0-9A-Za-z]{6,14}");
	if(check==""){
		return;
	}else if(!patt.test(check)){
		console.log("username unmatch");
		$('#register_username').attr("data-content","Username invalid (6 characters)");
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
					username = true;
					return;
				}else{
					$('#register_username').attr("data-content","Username existed");
					$('#register_username').popover("show");
					username = false;
				}
				
			}
		});
	});
	
	// check useremail exist in register
	$('#register_useremail').blur(function(){
		var check = $('#register_useremail').val();
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

	//test password1 match user in register
	$('#password1').blur(function(){  
		var password = $('#password1').val();
		var patt = new RegExp("[0-9A-Za-z]{6,14}");
		if(!patt.test(password)){
			$('#password1').popover("show");
			passwd = false;
		}else{
			$('#password1').popover("hide");
			passwd = true;
		}
	});

	//test confirm password match user in register
	$('#confirm-password').blur(function(){ 
		var password = $('#confirm-password').val();
		
		if($('#password1').val()!=password){
			$('#confirm-password').popover("show");
		}else{
			$('#confirm-password').popover("hide");
		}
	});

	//test password match user in login
	$('#password').blur(function(){ 
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
					return true;
				}else{
					$('#password').popover("show");
					
				}
			    	
			}	
		});
	})
	
	//test password match user in login
	$('#login-submit').click(function(){ 
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
					$('#login-form').submit();
				}else{
					$('#password').popover("show");
					
				}
			    	
			}	
		});
	})
	
	//register:
	$("#registerBody").click(function(){
		$(".caption").fadeOut(500);
		$(".container").fadeIn(500);
	});
			
	   
		
	$('#login-form-link').click(function(){
	    $("[data-toggle='popover']").popover('hide');
	});
	$('#register-form-link').click(function(){
	    $("[data-toggle='popover']").popover('hide');
	});

	//Recaptcha
	$('#register-submit').click(function(){  
		var response = grecaptcha.getResponse();
		console.log(response);
	    if(response.length == 0){
	    	console.log("NOT VALID");
	    }
	    else{
	    	console.log("VALID");
	    	submiting();
	    }
	})

	// to make sure all content are correctly input in the form, then submit.
	function submiting(){ 
		console.log("123"+passwd);
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
		if(check3==""||passwd==false){
			console.log("check3");
			$('#password1').popover("show");
			return;
		}
		$('#register-form').submit();
	}
	/**
	 *  JS in home pages
	 */
	
	//search
	$("#button_search").click(
			function() {
				var word = $('#search').val().trim().toLowerCase();
				
				if (word == "") {
					console.log("null");
					return;
				}
				window.location
						.assign("Searching?sort=title&order=ASC&word="
								+ word);
			});

	$(".glyphicon-heart").click(function() {
		var article_id = $(this).attr("name");
		var object = $(this);
		console.log(article_id);
		$.ajax({
			type : "POST",
			url : "Likes",
			data : "article_id=" + article_id,
			success : function(response) {
				object.next().text(" " + response);
			}
		});
	});

	$('.articles').each(function() {
		var length = $(this).text().length;
		if (length > 400) {
			var article = $(this).text().substring(0, 400);
			$(this).text(article);
		}
	})
	
	//back to top
	if ($('.back-to-top').length) {
	    var scrollTrigger = 100, 
	        backToTop = function () {
	            var scrollTop = $(window).scrollTop();
	            if (scrollTop > scrollTrigger) {
	                $('.back-to-top').addClass('show');
	            } else {
	                $('.back-to-top').removeClass('show');
	            }
	        };
	    backToTop();
	    
	    $(window).on('scroll', function () {
	        backToTop();
	    });
	    
	    $('.back-to-top').on('click', function (e) {
	        e.preventDefault();
	        $('html,body').animate({
	            scrollTop: 0
	        }, 700);
	    });
	}
	
	//profile test two passwd are same
	$('#password1').blur(function(){
		var password1 = $('#password1').val();
		if(password1.length>=6){
			$('#password1').popover("hide");
		}else{
			$('#password1').popover("show");
		}
	})
	$('#password2').blur(function(){
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		if(password1==password2){
			$('#password2').popover("hide");
		}else{
			$('#password2').popover("show");
		}
	})
	
	
});





