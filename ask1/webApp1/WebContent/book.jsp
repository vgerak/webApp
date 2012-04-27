<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!	public int calcPrice(String select, String days) {
		int d = Integer.parseInt(days);
    	if(select.equals("Athens - 100 Euros")) {
    		return 100*d;
    	}
    	else if (select.equals("Patra - 120 Euros")) {
    		return 120*d;
    	}
    	else if(select.equals("Thessaloniki - 90 Euros")) {
    		return 90*d;
    	}
    	else if(select.equals("Rome - 150 Euros")) {
    		return 150*d;
    	}
    	else if(select.equals("Madrid - 140 Euros")) {
    		return 140*d;
    	}
    	else if(select.equals("NYC - 160 Euros")) {
    		return 160*d;
    	}
    return 0;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http -//www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/form.css" />
<title>Booking Details</title>
</head>
<body>
	<%
		Cookie cookies[] = request.getCookies();
		String dest= request.getParameter("destination");
		Cookie c1 = new Cookie("destination",dest);
		response.addCookie(c1);
		String days = request.getParameter("days");
		Cookie c2 = new Cookie("days",days);
		response.addCookie(c2);
		Cookie c3 = new Cookie("price",""+calcPrice(dest, days));
		response.addCookie(c3);
	%>
	
	<div><h2>Total Cost: <%=calcPrice(dest, days) %> Euros</h2></div>
		<form method="post" action="receipt.jsp"> 
			<div class="actions">
				<input type="submit" value="Book now!">
			</div>
		</form>
		<form method="post" action="home.jsp"> 
			<div class="actions">
				<input type="submit" value="Cancel">
			</div>
		</form>	
</body>
</html>