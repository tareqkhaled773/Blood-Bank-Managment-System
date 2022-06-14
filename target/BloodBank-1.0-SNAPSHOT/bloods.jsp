<%@ page import="Entities.Location" %>
<%@ page import="DAOs.LocationDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BloodQuantity" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bloods</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<%
    LocationDAO dao = new LocationDAO();
    List<Location> loc = dao.getLocation();
    request.setAttribute("location",loc);
    pageContext.setAttribute("location",loc,PageContext.PAGE_SCOPE);


	List<BloodQuantity> quantities = null;
    quantities = (List<BloodQuantity>) request.getAttribute("BloodQuantities");
	pageContext.setAttribute("quantities",quantities,PageContext.PAGE_SCOPE);

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
                  			<h3 class="panel-title breadcrumb">Bloods List</h3>
                		</div>
						<form action="BloodStockServlet" method="post" onsubmit = "return(validation());">

						<div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Location</label>
                            <select class="form-control" name="Location" id="exampleFormControlInput1">
                                <c:forEach items="${pageScope.location}" var="location">
                                    <option value="${location.idlocations}"> <c:out value="${location.city}"/>,<c:out value="${location.street}"/> </option>
                                </c:forEach>

                            </select>
                        </div>
							<input type="hidden" name="action" value="viewblood">
							<button type="submit" class="btn btn-primary button">Submit</button>
						</form>
						<div class="panel-body">
							<table class="table table-striped table-hover">
								<tr>
                      				<th scope="col">Blood Type</th>
                      				<th scope="col">Quantity</th>
                    			</tr>


									<c:forEach items="${pageScope.quantities}" var="quantities">
										<tr>
										<td scope="row"><c:out value="${quantities.bType}"/></td>
										<td scope="row"><c:out value="${quantities.quantity}"/></td>
										</tr>
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