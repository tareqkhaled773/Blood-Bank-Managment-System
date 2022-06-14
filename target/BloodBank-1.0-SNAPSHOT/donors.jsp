<%@ page import="DAOs.DonorDAO" %>
<%@ page import="Entities.Donor" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Donors</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<%
	DonorDAO dao = new DonorDAO();
	List<Donor> don = dao.getDonors();
	pageContext.setAttribute("donors",don,PageContext.PAGE_SCOPE);
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
						<div class="panel-heading">
                  			<h3 class="panel-title breadcrumb">Donors List</h3>
                		</div>

						<div class="panel-body">
							<table class="table table-striped table-hover">
								<tr>
                      				<th scope="col">Name</th>
                      				<th scope="col">Email</th>
                      				<th scope="col">Phone</th>
									<th scope="col">blood type</th>
                      				<th scope="col">Picture</th>
                      				<th scope="col">Action</th>
                    			</tr>

								<c:forEach items="${pageScope.donors}" var="donor">
								<form action="DonorServlet" method="post" onsubmit = "return(validation());">

								<tr>
										<td scope="row"><c:out value="${donor.firstname}"/> <c:out value="${donor.lastname}"/> </td>
										<td scope="row"><c:out value="${donor.email}"/></td>
										<td scope="row"><c:out value="${donor.phone}"/></td>
										<td scope="row"><c:out value="${donor.bloodtype}"/></td>
										<td scope="row"><img alt="img" src="data:image/jpeg;base64,${donor.base64}"/>
										</td>

										<td><button type="submit" class="btn btn-primary button" name="todo" value="accept">Edit</button>
											</td>

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