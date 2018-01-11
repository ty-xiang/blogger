<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>OpenArticle</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<th><a href="Homepage">Home</a></th>
				<th><a href="Profile">Personal Profile</a></th>
				<th><a href="Register">Logout</a></th>
				<!--log out remove session  -->
			</tr>
		</table>
	</div>
	<hr>
	<h2>${article.article_title}</h2>
	<h3>Author id: ${article.user_id}</h3>
	<h3>Username: ${currentUser.username}</h3>
	<br>
	<hr>
	<p>${article.postDate}***${article.postTime}***${article.fullTime}***${article.update_time}***${article.likes}***${article.likeNames}</p>
	<p>${article.author}</p>
	<p>${article.article_text}</p>

	<c:if test="${article.user_id==currentUser.user_id}">
		<form action="OpenArticle" method="GET">
			<input type="hidden" id="articleIdDelete" name="article_id"
				value="${article.article_id}"> <input type="submit"
				id="delete" name="delete" value="delete" />
		</form>
		<a
			href="PostArticle?editarticle=edit&article_id=${article.article_id}"><input
			type="button" id="editarticle" value="edit article"></a>
	</c:if>
	<br>

	<c:forEach items="${photoLinks}" var="photolink">
		<img src="${photolink}" height="320" width="320" />
		<br>
		<br>
	</c:forEach>

	<c:forEach items="${audioLinks}" var="audiolink">
		<audio controls> <source src="${audiolink}" type="audio/ogg">
		<source src="${audiolink}" type="audio/mpeg"></audio>
		<br>
		<br>
	</c:forEach>

	<c:forEach items="${videoLinks}" var="videolink">
		<video width="320" height="320" controls> <source
			src="${videolink}" type="video/ogg"> <source
			src="${videolink}" type="video/mp4"></video>
		<br>
		<br>
	</c:forEach>



	<br>
	<hr>
	<fieldset>
		<legend>Comment</legend>
		<c:forEach items="${currentArticleComments}" var="comment">
			<p>author: ${comment.author}</p>
			<p>comment: ${comment.comment_text}</p>
			<p>${comment.comment_postDate}---${comment.comment_postTime}</p>

			<c:if
				test="${comment.user_id==currentUser.user_id||article.user_id==currentUser.user_id}">
				<form action="OpenArticle" method="POST">
					<input type="hidden" id="articleIdforcomment" name="article_id"
						value="${article.article_id}"> <input type="hidden"
						id="commentID" name="comment_id" value="${comment.comment_id}">
					<input type="hidden" id="commentText" name="comment_text"
						value="newcomment"> <input type="submit"
						id="editcommentID" name="editcomment" value="edit">
				</form>

				<form action="OpenArticle" method="GET">
					<input type="hidden" id="articleIdDeleteforcomment"
						name="article_id" value="${article.article_id}"> <input
						type="hidden" id="commentID" name="comment_id"
						value="${comment.comment_id}"> <input type="submit"
						id="delete" name="delete" value="Delete" />
				</form>
			</c:if>
		</c:forEach>
	</fieldset>

	<form action="OpenArticle" method="POST">
		<fieldset>
			<input type="hidden" id="article_id" name="article_id"
				value="${article.article_id}"> <input type="text"
				id="comment_text" name="comment_text"> <input type="submit"
				id="submit" name="submit" value="post">
		</fieldset>
	</form>

	<script type="text/javascript">
		
	</script>
</body>
</html>