<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Employee Page</title>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>
<link href="../MUMScrumS5/resources/css/custom.css" rel="stylesheet">
<link href="../MUMScrumS5/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styling plus plugins -->
<link href="../MUMScrumS5/resources/css/custom.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../MUMScrumS5/resources/css/maps/jquery-jvectormap-2.0.1.css" />
<link href="../MUMScrumS5/resources/css/icheck/flat/green.css"
	rel="stylesheet" />
<link href="../MUMScrumS5/resources/css/floatexamples.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- <h1>
	Employee List
</h1> -->


	<div class="x_panel">
		<div class="x_title">
			<h2>
				Employee List <small><a href="<c:url value='/employee/add' />">Add Employee</a></small>
			</h2>
			
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"><i
						class="fa fa-wrench"></i></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Settings 1</a></li>
						<li><a href="#">Settings 2</a></li>
					</ul></li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">

			<table class="table table-striped">

				<tbody>
					<tr>
						<th style="width: 10px">ID</th>
						<th style="width: 5px">First Name</th>
						<th style="width: 5px">Last Name</th>
						<th style="width: 5px">Username</th>
						<th style="width: 5px">Email</th>
						<th style="width: 5px">Salary</th>
						<th style="width: 5px">Street</th>
						<th style="width: 5px">City</th>
						<th style="width: 5px">State</th>
						<th style="width: 5px">Zip</th>
						<th style="width: 5px">Join Date</th>
						<th style="width: 5px">Telephone</th>
						<th style="width: 5px">Edit</th>
						<th style="width: 5px">Delete</th>
					</tr>
					<c:forEach items="${listEmployees}" var="employee">
						<tr>
							<td>${employee.id}</td>
							<td>${employee.firstName}</td>
							<td>${employee.lastName}</td>
							<td>${employee.username}</td>
							<td>${employee.email}</td>
							<td>${employee.salary}</td>
							<td>${employee.street}</td>
							<td>${employee.city}</td>
							<td>${employee.state}</td>
							<td>${employee.zip}</td>
							<td>${employee.joinDate}</td>
							<td>${employee.telephone}</td>
							<td><a href="<c:url value='/edit/${employee.id}' />">Edit</a></td>
							<td><a href="<c:url value='/remove/${employee.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>



	<%-- 
<c:if test="${!empty listEmployees}">
	<table class="tg">
	<tr>
		<th width="80">ID</th>
		<th width="120">First Name</th>
		<th width="120">Last Name</th>
		<th width="120">Username</th>
		<th width="120">Email</th>
		<th width="120">Salary</th>
		<th width="120">Street</th>
		<th width="120">City</th>
		<th width="120">State</th>
		<th width="120">Zip</th>
		<th width="120">Join Date</th>
		<th width="120">Telephone</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listEmployees}" var="employee">
		<tr>
			<td>${employee.id}</td>
			<td>${employee.firstName}</td>
			<td>${employee.lastName}</td>
			<td>${employee.username}</td>
			<td>${employee.email}</td>
			<td>${employee.salary}</td>
			<td>${employee.street}</td>
			<td>${employee.city}</td>
			<td>${employee.state}</td>
			<td>${employee.zip}</td>
			<td>${employee.joinDate}</td>
			<td>${employee.telephone}</td>
			<td><a href="<c:url value='/edit/${employee.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${employee.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
 --%>

</body>
</html>
