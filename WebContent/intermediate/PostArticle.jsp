<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="PostArticle" method="post" enctype="multipart/form-data">
<input type="text" name="user_id" value="${currentUser.user_id}"/>
<input type="text" name="username" value="${currentUser.username}"/>
<hr>
<label for="article_title">Title:</label>
<input type="text" id="article_title" name="article_title" value="${article.article_title}">
<br><br>
<label for="article_text">text:</label>
<input type="text" id="article_text" name="article_text" value="${article.article_text}">
<input type="hidden" id="article_id" name="article_id" value="${article.article_id}">

<br><br>
<input type="submit" name="post" id="post" value="post">
<input type="submit" name="post" id="edit" value="edit">

<br><br>
<input type="hidden" name="articleId" value="${article.article_id}">
<input type="file" name="multimedia" multiple>
<!-- <input type="submit" name="upload" id="upload" value="Upload"> -->
<p>${message}</p>
<%-- </form>
<form action="Multimedia" method="post" enctype="multipart/form-data">

<input type="hidden" name="articleId" value="${article.article_id}">
<input type="file" name="multimedia" multiple>
<input type="submit" name="upload" id="upload" value="Upload">
<p>${message}</p>
</form> --%>

</body>
</html>