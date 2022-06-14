<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <jsp:include page="inc/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<section class="section">
		<div id="section-form">
				<div class="title">
					<h3>Send a request</h3>
				</div>
				<form action="#" method="POST">
					<div class="form-content">
						<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Name</label>
  							<input type="text" class="form-control" id="exampleFormControlInput1">
						</div>
						<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Email address</label>
  							<input type="email" class="form-control" id="exampleFormControlInput1">
						</div>
						<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Phone Number</label>
  							<input type="text" class="form-control" id="exampleFormControlInput1">
						</div>
						<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Message</label>
  							<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
						</div>
					
						<button type="submit" class="btn btn-primary">SEND</button>
					</div>
				</form>
			</div>
	</section>
</body>
</html>
<jsp:include page="inc/footer.jsp"/>