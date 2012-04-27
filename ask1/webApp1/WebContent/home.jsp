<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!public String[] getTowns(String country) {
		String grTowns[] = {"Athens - 100 Euros", "Patra - 120 Euros", "Thessaloniki - 90 Euros"};
		String intTowns[] = {"Rome - 150 Euros", "Madrid - 140 Euros", "NYC - 160 Euros"};
		if (country.equals("Greece")) {
			return grTowns;
		} else {
			return intTowns;
		}

	}%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/form.css" />
<title>City Selection</title>
</head>
<body>
	<%

		Cookie cookies[] = request.getCookies();

		String re[];

		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String check = request.getParameter("check");
		String phone = request.getParameter("phone");
		String local = request.getParameter("local");

		//Redirect if age < 18
		 if (check == null) {
			String redirectURL = "http://localhost:8080/webApp1/index.html";
			response.sendRedirect(redirectURL);
		 }
		
		if (name == null || surname == null || email == null || phone == null || local == null) {
			for( int i = 0 ; i < cookies.length ; ++i ) {
				if (name == null && cookies[i].getName().equals("name")) {
					name = cookies[i].getValue();
				}
				else if (surname == null && cookies[i].getName().equals("surname")) {
					surname = cookies[i].getValue();
				}
				else if (email == null && cookies[i].getName().equals("email")) {
					email = cookies[i].getValue();
				}
				else if (phone == null && cookies[i].getName().equals("phone")) {
					phone = cookies[i].getValue();
				}
				else if (local == null && cookies[i].getName().equals("local")) {
					local = cookies[i].getValue();
				}
			}

		}
		Cookie c1 = new Cookie("name", name);
		Cookie c2 = new Cookie("surname", surname);
		Cookie c3 = new Cookie("email", email);
		Cookie c4 = new Cookie("phone", phone);
		Cookie c5 = new Cookie("local", local);
		c1.setMaxAge(120);
		c2.setMaxAge(120);
		c3.setMaxAge(120);
		c4.setMaxAge(120);
		c5.setMaxAge(120);


		response.addCookie(c1);
		response.addCookie(c2);
		response.addCookie(c3);
		response.addCookie(c4);
		response.addCookie(c5);

		re = getTowns(local);
	%>
	<h2><%=local%> Trip Details</h2>
	<form method="post" action="book.jsp">
		<div>
			<label>Days to stay:</label>
			<input type = "text" name="days">
		</div>
		<div>
			<label>Destination City:</label>
			<select name="destination">
				<option selected="selected">
					<%=re[0]%></option>
				<option>
					<%=re[1]%></option>
				<option>
					<%=re[2]%></option>
			</select>
		</div>
		<div class="actions">
			<input type="submit" value="Submit">
			<input type="reset" value="Reset" onclick="return confirm('Are you sure you wish to reset?')">
		</div>
	</form>
</body>
</html>