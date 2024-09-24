<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<style type="text/css">

body {
	background-color: gray;
}
</style>
</head>
<body>

<h1>Update Page</h1>
<form action=" update">
<label>Id</label>
<input  type="number" name="id" readonly="readonly" value="${users.getId() }">
<hr>
<label>Name</label>
<input  type="text" name="name" value="${users.getName() }">
<hr>
<label>City</label>
<input type="text" name="city" value="${users.getCity() }" > 
<hr>
<label>Email</label>
<input  type="email" name="email" value="${users.getEmail() }">
<hr>
<label>Phone</label>
<input  type="tel" name="phone" value="${users.getPhone() }">
 <hr>
<label>Passsword</label>
<input type="password" name="password" value="${users.getPassword() }" > 
<hr>
<button  type="submit"> Update </button>
</form>

</body>
</html>