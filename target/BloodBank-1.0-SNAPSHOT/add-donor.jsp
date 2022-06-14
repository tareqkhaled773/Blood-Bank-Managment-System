<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Donor</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link type="text/css" rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>
<body>
		<jsp:include page="nav.jsp"/>
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<jsp:include page="sidemenu.jsp"/>
					</div>
				
				<div class="col-md-9" data-aos="fade-down" data-aos-mirror="true"data-aos-once="false" data-aos-duration="1000" data-aos-easing="ease-in-out" data-aos-anchor-placement="top-center">
					<div class="panel panel-default spacing">
						<div class="panel-heading title">
                  			<h3 class="panel-title">Add new Donor</h3>
                		</div>
						<div class="panel-body">
							<div class="custom-form-content">
								<form action="DonorServlet" method="POST" enctype="multipart/form-data" onsubmit = "return(validation());">
									<div class="mb-3" id="error">
    									<h4>Please, fill all the forms</h4>
  									</div>
  									
  									<div class="mb-3">
    									<label for="first_name" class="form-label">First Name</label>
    									<input type="text" class="form-control" id="first_name" name="first_name"/>
  									</div>
  									
  									<div class="mb-3">
    									<label for="last_name" class="form-label">Last Name</label>
    									<input type="text" class="form-control" id="last_name" name="last_name"/>
  									</div>
  									
  									<div class="mb-3">
    									<label for="email" class="form-label">E-mail</label>
    									<input type="email" class="form-control" id="email" name="email"/>
  									</div>
  									
  									<div class="mb-3">
    									<label for="phone_number" class="form-label">Phone Number</label>
    									<input type="text" class="form-control" id="phone_number" name="phone_number"/>
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
    									<label for="donor_picture" class="form-label">Donor picture</label>
    									<input type="file" class="form-control" id="donor_picture" name="donor_picture"/>
  									</div>
									<input type="hidden" value="savedonor" name="action"/>
  									
  									
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