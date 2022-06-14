<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  			<div class="container-fluid">
    			<a class="navbar-brand" href="#">
    				<img id="adminImg" src="images/admin.png"/>
    				<span class="nav-text">Admin</span>
    			</a>
    			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
     	 			<span class="navbar-toggler-icon"></span>
    			</button>
    			<div class="collapse navbar-collapse" id="navbarSupportedContent">
      				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        				<li class="nav-item">
          					<span class="nav-text">Welcome Ahmed Camara</span>
        				</li>
      				</ul>
      				
      				<form class="d-flex" action="#" method="POST">
        				<button class="btn btn-outline-success log-btn" type="submit">Log out</button>
      				</form>
    			</div>
  			</div>
		</nav>
		
		<header id="header">
			<div class="container ">
				<div class="dropdown dropdown-content">
  					<button class="btn btn-secondary color dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
    					Content
  					</button>
  					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    					<li><a class="dropdown-item" href="add-donor.jsp">Add Donor</a></li>
    					<li><a class="dropdown-item" href="add-blood.jsp">Add Blood</a></li>
  					</ul>
				</div>
			</div>
		</header>
</body>
</html>