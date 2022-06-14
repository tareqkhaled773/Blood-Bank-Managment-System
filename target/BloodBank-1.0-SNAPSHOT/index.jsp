<%@ page import="Beans.JSPBean" %>
<%@ page import="Entities.Location" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
 <jsp:include page="inc/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<%
		JSPBean bean = new JSPBean();
		List<Location> loc = bean.getLocation();
		request.setAttribute("location",loc);
		pageContext.setAttribute("location",loc,PageContext.PAGE_SCOPE);

	%>
	<%
		String msg= request.getParameter("msg");
		if(msg != null){
			if(msg.equals("valid")){
				pageContext.setAttribute("message","The Blood you requested is available",PageContext.PAGE_SCOPE);
				System.out.println("Message set");
			}
			else if(msg.equals("invalid")) {
				pageContext.setAttribute("message","The Blood you requested is not available for now",PageContext.PAGE_SCOPE);

			}
		}

	%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>

	<section class="section">
	
		<div class="section-container">
			<div id="section-image">
				<img src="images/img.png" id="img"/>
			</div>
			
			
			<div id="section-form">
				<div class="title">
					<h3>
						Send a request <br>
						<c:out value="${message}"/>
					</h3>

				</div>

				<form action="RequestServlet" method="POST">
					<div class="form-content">

						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">First Name</label>
							<input type="text" class="form-control" id="exampleFormControlInput1" name="first_name">
						</div>

						<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Last Name</label>
  							<input type="text" class="form-control" id="exampleFormControlInput1" name="last_name">
						</div>
						<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Email address</label>
  							<input type="email" class="form-control" id="exampleFormControlInput1" name="email">
						</div>
						<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Address (Location)</label>
  							<input type="text" class="form-control" id="exampleFormControlInput1" name="address">
						</div>
						<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Phone Number</label>
  							<input type="text" class="form-control" id="exampleFormControlInput1" name="phone">
						</div>

						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Blood Group</label>
							<select class="form-control" name="bloodgroup" id="exampleFormControlInput1">
								<option value="A-">A-</option>
								<option value="A+">A+</option>
								<option value="B-">B-</option>
								<option value="B+">B+</option>
								<option value="O-">O-</option>
								<option value="O+">O+</option>
								<option value="AB-">AB-</option>
								<option value="AB+">AB+</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Quantity</label>
							<input type="text" class="form-control" id="exampleFormControlInput1" name="Quantity">
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Location</label>
							<select class="form-control" name="Location" id="exampleFormControlInput1">
								<c:forEach items="${pageScope.location}" var="location">
									<option value="${location.idlocations}"> <c:out value="${location.city}"/>,<c:out value="${location.street}"/> </option>
								</c:forEach>

							</select>
						</div>
						
						<div class="mb-3">
  							<div class="btn-group">
  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Action
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <a class="dropdown-item" href="#">Something else here</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#">Separated link</a>
  </div>
</div>
						</div>
						
						<div class="mb-3">
							<button type="submit" class="btn btn-primary ">Submit</button>
						</div>
						
					</div>
					<input type="hidden" name="action" value="newrequest">
				</form>
			</div>
		</div>
	</section>
</body>
</html>
<jsp:include page="inc/footer.jsp"/>