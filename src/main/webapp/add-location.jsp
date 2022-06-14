<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Location</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>
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
                  			<h3 class="panel-title">New Location</h3>
                		</div>
						<div class="panel-body">
							<div class="custom-form-content">
								<form action="LocationServlet" onsubmit = "return(validation());">
									<div class="mb-3" id="error">
    									<h4>Please, fill all the forms</h4>
  									</div>
  									
  									<div class="mb-3">
    									<label for="location" class="form-label">City</label>
    									<input type="text" class="form-control" id="location" name="city"/>
  									</div>
  									
  									<div class="mb-3">
    									<label for="street" class="form-label">Street</label>
    									<input type="text" class="form-control" id="street" name="street"/>
  									</div>
  									
  									<button type="submit" class="btn btn-primary button">Submit</button>
									<input type="hidden" value="savelocation" name="action">
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