<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Page</title>
<style type="text/css">

body {
	background-color: gray;
}
</style>

</head>
<body>
<h1>${msg }</h1>
<h1 style=" margin-left: 300px"> Create Entry</h1>
<br>
<form action=" save">
<label style="font-size: x-large; font-style: inherit; margin-left: 300px">Name:-</label>
<input style="background-color: rgb(211, 211, 211); border-radius: 5px; padding: 3px; width: 240px; margin-left: 42px"  type="text" placeholder="Name" name="name">
<hr>
<label style="font-size: x-large; font-style: inherit;; margin-left: 300px">City:-</label>
<input style="background-color: rgb(211, 211, 211); border-radius: 5px; padding: 3px; width: 240px; margin-left: 57px" type="text" placeholder="City" name="city" > 
<hr>
<label style="font-size: x-large; font-style: inherit;; margin-left: 300px">Email:-</label>
<input style="background-color: rgb(211, 211, 211); border-radius: 5px; padding: 3px; width: 240px; margin-left: 42px"  type="email" placeholder="Email" name="email">
<hr>
<label style="font-size: x-large; font-style: inherit;; margin-left: 300px">Phone:-</label>
<input style="background-color: rgb(211, 211, 211); border-radius: 5px; padding: 3px; width: 240px; margin-left: 42px" type="tel" placeholder="Phone" name="phone">
 <hr>
<label style="font-size: x-large; font-style: inherit;; margin-left: 300px">Passsword:-</label>
<input style="background-color: rgb(211, 211, 211); border-radius: 5px; padding: 3px; width: 240px; " type="password" placeholder="Password" name="password" > 
<hr>
<button style="background-color: rgb(211, 211, 211); border-radius: 5px; padding: 3px; width: 90px; margin-left: 450px" type="submit"> Save </button>
</form>


</body>
</html>