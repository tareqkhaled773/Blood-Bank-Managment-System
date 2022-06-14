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
		<div class="login-section">
			<div class="title">
				<h3>Log in</h3>
			</div>
			<div class="login-form">
				<form action="Login" method="post">
					<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Name</label>
  							<input type="text" class="form-control" id="exampleFormControlInput1" name="username">
						</div>
						<div class="mb-3">
  							<label for="exampleFormControlInput1" class="form-label">Email address</label>
  							<input type="password" class="form-control" id="exampleFormControlInput1" name="password">
						</div>
						
						<div class="mb-3">
							<button type="submit" class="btn btn-primary ">Send</button>
						</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>

<jsp:include page="inc/footer.jsp"/>