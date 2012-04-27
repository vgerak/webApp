<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Receipt</title>
</head>
<body>

	<%
		Cookie cookies[] = request.getCookies();
		String name, surname, phone, email, check, local, days, destination, price;
		name = "";
		surname = "";
		phone = "";
		email = "";
		check = "";
		local = "";
		
		days = "";
		destination = "";
		price = "";

		for (int i = 0; i < cookies.length; ++i) {
			if (cookies[i].getName().equals("name")) {
				name = cookies[i].getValue();
			} else if (cookies[i].getName().equals("surname")) {
				surname = cookies[i].getValue();
			} else if (cookies[i].getName().equals("phone")) {
				phone = cookies[i].getValue();
			} else if (cookies[i].getName().equals("email")) {
				email = cookies[i].getValue();
			} else if (cookies[i].getName().equals("local")) {
				local = cookies[i].getValue();
			} else if (cookies[i].getName().equals("days")) {
				days = cookies[i].getValue();
			} else if (cookies[i].getName().equals("destination")) {
				destination = cookies[i].getValue();
			} else if (cookies[i].getName().equals("price")) {
				price = cookies[i].getValue();
			}
		}
	%>
	<div><h2> Receipt Details </h2></div>
	<div><h4>Personal Details:</h4>
		<div>
			<label>Name: </label>
			<%=name%>
		</div>
		<div>
			<label>Surname: </label>
			<%=surname%>
		</div>
		<div>
			<label>Phone: </label>
			<%=phone%>
		</div>
		<div>
			<label>E-mail: </label>
			<%=email%>
		</div>
	</div>
	<div><h4>Trip Information:</h4></div>
	<ul>
		<li>
		<div>
			<%=local%>
		</div>
		</li><li>
		<div>
			<label>Destination: </label>
			<%=destination%>
		</div>
		</li><li>
		<div>
			<label>Days to stay: </label>
			<%=days%>
		</div>
		</li><li>
		<div>
			<strong>
			<label>Total Price: </label>
			<%=price%> Euros
			</strong>
		</div>
		</li>
	</ul>		

</body>
</html>