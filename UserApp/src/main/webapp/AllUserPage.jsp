<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All User Page</title>
<style type="text/css">

body {
	background-color: gray;
}


table{

margin: auto;
font-size: 20px;
border-collapse: collapse;
box-shadow: black;
background-color:rgb(211, 211, 211); ;
}

</style>
</head>
<body>

<h1 id="msg"> ${msg } </h1>
<h1> All Users:-</h1>

<a  href="createpage"> <button style="background-color: rgb(211, 211, 211); border-radius: 5px;"> Create Entry</button></a>
<br>
<br>
<a  href="home"> <button style="background-color: rgb(211, 211, 211); border-radius: 5px; width: 90px"> Home Page</button></a>
<br>
<br>


<form style="margin: auto;" name="searchb" action="search">
<input style="padding: 5px;
	border-radius: 5px;
	width: 36%;
	margin: auto;
	margin-left: 280px;
	background-color: rgb(211, 211, 211);" type="text" name="sq" placeholder="Search Here">
<button style="padding: 5px; border-radius: 10px; margin-left: 10px; background-color: rgb(211, 211, 211);" type="submit"> Submit</button>
</form>

<br>
<br>

<table border="5" cellpadding="10" cellspacing="10">
<thead >
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Password</th>
<th colspan="2">Action</th>
</tr>
 </thead>
 
 <c:forEach var="u" items="${users }">
 <tr>
 <td>${u.getId() }</td>
 <td>${u.getName() }</td>
 <td>${u.getEmail() }</td>
 <td>${u.getCity() }</td>
 <td>${u.getPassword() }</td>
 <td><a href="updatepage?id=${u.getId() }"> <button> Update</button> </a></td>
 <td><a href="delete?id=${u.getId() }"> <button> Delete</button> </a></td>
 </tr>
 </c:forEach>
</table>

<script type="text/javascript">

		const msgEle  = document.getElementById("msg");
		console.log(msgEle);
		setTimeout(()=>{
			msgEle.style.display="none";
		},3000);

</script>
</body>
</html>