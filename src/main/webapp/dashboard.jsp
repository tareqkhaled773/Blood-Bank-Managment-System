<%@ page import="DAOs.RequestDAO" %>
<%@ page import="Entities.Request" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link type="text/css" rel="stylesheet" href="css/style.css"></head>
<%
	RequestDAO dao = new RequestDAO();
	List<Request> req = dao.getRequests();
	pageContext.setAttribute("requests",req,PageContext.PAGE_SCOPE);
%>
<body>
		
		<jsp:include page="nav.jsp"/>
		<section id="main">
			<div class="container">
				<div class="row">
				<div class="col-md-3">
					<jsp:include page="sidemenu.jsp"/>
				</div>
				
				
				<div class="col-md-9">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<div class="well dashboard-main">
										<h2> <span></span> </h2>
										<h4>Donors</h4>
										<a href="donors.jsp">See Donors</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="well dashboard-main">
										<h2> <span></span> </h2>
										<h4>Requests</h4>
										<a href="requests.jsp">See Requests</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="well dashboard-main">
										<h2> <span></span> </h2>
										<h4>Bloods</h4>
										<a href="bloods.jsp">See available bloods</a>
									</div>
								</div>
								<div class="col-md-3">
									<div class="well dashboard-main">
										<h2> <span></span> </h2>
										<h4>Profil</h4>
										<a href="edit-information.jsp">See profil</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default spacing">
						<div class="panel-heading">
                  			<h3 class="panel-title">Latest Request</h3>
                		</div>
						<div class="panel-body">
							<table class="table table-striped table-hover">
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Location</th>
									<th>blood type</th>
									<th>Quantity</th>
									<th>Request Date</th>
									<th>Action</th>
								</tr>

								<c:forEach items="${pageScope.requests}" var="request">
									<form action="RequestServlet" method="post" onsubmit = "return(validation());">

										<tr>
											<td scope="row"><c:out value="${request.first_Name}"/> <c:out value="${request.last_Name}"/> </td>
											<td scope="row"><c:out value="${request.email}"/></td>
											<td scope="row"><c:out value="${request.phone}"/></td>
											<td scope="row"><c:out value="${request.address}"/></td>
											<td scope="row"><c:out value="${request.bloodgroup}"/></td>
											<td scope="row"><c:out value="${request.quantity}"/></td>
											<td scope="row"><c:out value="${request.timestamp}"/></td>
											<input type="hidden" name = "request_id" value="${request.ID}">
											<input type="hidden" name="action" value="accept_cancel">
											<td><button type="submit" class="btn btn-primary button" name="todo" value="accept">Accept</button>
												| <button type="submit" class="btn btn-primary button" name="todo" value="cancel">Cancel</button></td>

										</tr>
									</form>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				</div>
			</div>
		</section>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
		
</body>
</html>