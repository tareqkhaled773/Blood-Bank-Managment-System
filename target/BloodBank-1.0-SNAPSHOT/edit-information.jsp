<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
		
		<jsp:include page="nav.jsp"/>
		<section id="main">
			<div class="container">
				<div class="row">
				<div class="col-md-3">
					<jsp:include page="sidemenu.jsp"/>
				</div>
				
				
				<div class="col-md-9" style="width:40%;">
					<div class="panel panel-default">
						<div class="panel-heading">
                  			<h3 class="panel-title breadcrumb">Edit Admin information</h3>
                		</div>
						<div class="panel-body">
							<form action="#">
									<div class="mb-3" id="error">
    									<h4>Please, fill all the forms</h4>
  									</div>
  									
  									<div class="mb-3">
    									<label for="email" class="form-label">E-mail</label>
    									<input type="email" class="form-control" id="email" name="email"/>
  									</div>
  									
  									<div class="mb-3">
    									<label for="confirm_email" class="form-label">Re-enter E-mail</label>
    									<input type="email" class="form-control" id="confirm_email" name="confirm_email"/>
  									</div>
  									
  									<div class="mb-3">
    									<label for="password" class="form-label">Password</label>
    									<input type="password" class="form-control" id="password" name="password"/>
  									</div>
  									
  									<div class="mb-3">
    									<label for="confirm_password" class="form-label">Confirm password</label>
    									<input type="password" class="form-control" id="confirm_password" name="confirm_password"/>
  									</div>
  									
  									
  									<button type="submit" class="btn btn-primary button">Save</button>
								</form>
						</div>
					</div>
				</div>
				</div>
			</div>
		</section>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
		
</body>
</html>