<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="all_css.jsp" %>
</head>
<body>

<%@include file="navbar.jsp" %>
<div class="container p-4">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<div class="card">
				<div class="card-body">
				<p class="fs-3 text-center p-2">Add Employee</p>
				<pre>
				<form action="insertData" method="post">
				 <div class="mb-3">
				 	
					<label class="form-label">employee name</label>
					<input type="text" name="empName" class="form-control"><br>  
					<label class="form-label">employee location</label>
					<input type="text" name="empLoc" class="form-control"><br>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
				</form>
				</pre>
				</div>
		    </div>
		</div>
    </div>
    </div>

</body>
</html>