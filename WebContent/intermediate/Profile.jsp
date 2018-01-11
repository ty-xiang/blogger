<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<th><a href="Homepage">Home</a></th>
				<th><a href="Profile">Personal Profile</a></th>
				<th><a href="Register">Logout</a></th>    <!--log out remove session  -->
			</tr>
		</table>
	</div>
	
<form method = "POST" action ="Profile" >
<label for="username">Username: </label> 
<input type="text" id="username1" name="username" placeholder="Your name goes here" value="${currentUser.username}" ><input type="button" value="check username" onclick="check()"/>
<div id="checkuserdiv"></div>
<br>
<label for="password">Password: </label> 
<input type="password" id="password1" name="password" placeholder="Your password goes here" value="${currentUser.passwd}">
<br>
<label for="password">Confirm your password: </label> 
<input type="password" id="password2" name="password" placeholder="Your password goes here" value="${currentUser.passwd}">
<br>

<label for="useremail">Email: </label> 
<input type="text" id="useremail" name="useremail" placeholder="Your E-mail goes here" value="${currentUser.useremail}">
<br>

<label for="fname">First name: </label> 
<input type="text" id="fname" name="fname" placeholder="" value="${currentUser.fname}">
<br>

<label for="lname">Last name: </label> 
<input type="text" id="lname" name="lname" placeholder="" value="${currentUser.lname}">
<br>

<label for="birthday">Birthday: </label> 
<input type="text" id="birthday" name="birthday" placeholder="" value="${currentUser.birthday}">
<br>

<label for="education">Education: </label> 
<input type="text" id="education" name="education" placeholder="" value="${currentUser.education}">
<br>

<input type="submit" name="action" id="save" value="save">
</form>

<form method = "POST" action ="Profile">
<input type="submit" name="action" id="delete" value="delete">
</form>

</body>
</html>