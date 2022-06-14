<%@ page import="DAOs.LocationDAO" %>
<%@ page import="Entities.Location" %>
<%@ page import="java.util.List" %>
<%@ page import="DAOs.DonorDAO" %>
<%@ page import="Entities.Donor" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Blood</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>
<%
	LocationDAO dao = new LocationDAO();
	List<Location> loc = dao.getLocation();
	request.setAttribute("location",loc);
	pageContext.setAttribute("location",loc,PageContext.PAGE_SCOPE);

	DonorDAO dao2= new DonorDAO();
	List<Donor> donors= dao2.getDonors();
	request.setAttribute("donors",donors);
	pageContext.setAttribute("donors",donors,PageContext.PAGE_SCOPE);


%>
<body>
		<jsp:include page="nav.jsp"/>
		<section id="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3">
						<jsp:include page="sidemenu.jsp"/>
					</div>
				
				<div class="col-md-9" data-aos="fade-down" data-aos-mirror="true"data-aos-once="false" data-aos-duration="1000" data-aos-easing="ease-in-out" data-aos-anchor-placement="top-center">
					<div class="panel panel-default spacing">
						<div class="panel-heading title">
                  			<h3 class="panel-title">Add Blood</h3>
                		</div>
						<div class="panel-body">
							<div class="custom-form-content">
								<form action="BloodStockServlet" method="post" onsubmit = "return(validation());">
									<div class="mb-3" id="error">
    									<h4>Please, fill all the forms</h4>
  									</div>

									<div class="mb-3">
										<label for="donor" class="form-label">Select Donor</label>
										<select class="form-control" name="donor" id="donor">
											<c:forEach items="${pageScope.donors}" var="donors">
												<option value="${donors.iddonor}"> <c:out value="${donors.firstname} "/>,<c:out value="${donors.lastname} "/>,<c:out value="${donors.email}"/> </option>
											</c:forEach>

										</select>
									</div>

									<div class="mb-3">
										<label for="quantity" class="form-label">Quantity</label>
										<input type="number" class="form-control" id="quantity" name="quantity"/>
									</div>

  									<div class="mb-3">
  										<label for="blood_group" class="form-label">Blood Type</label>
    									<select class="form-select" name="blood_group" id="blood_group">
  											<option selected>click to choose</option>
  											<option value="A+">A+</option>
  											<option value="A-">A-</option>
  											<option value="O+">O+</option>
  											<option value="O-">O-</option>
  											<option value="B+">B+</option>
  											<option value="B-">B-</option>
										</select>
  									</div>

									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">Location</label>
										<select class="form-control" name="Location" id="exampleFormControlInput1">
											<c:forEach items="${pageScope.location}" var="location">
												<option value="${location.idlocations}"> <c:out value="${location.city}"/>,<c:out value="${location.street}"/> </option>
											</c:forEach>

										</select>
									</div>
									<input type="hidden" name="action" value="addblood">
  									<button type="submit" class="btn btn-primary button">Submit</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
		</section>
		
		<footer id="footer">
			
		</footer>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  		<script>
    		AOS.init();
  		</script>
</body>
</html>