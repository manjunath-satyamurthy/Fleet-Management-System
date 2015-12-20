<%@ page import="com.application.Employee" %>
<%@ page import="com.application.Auth" %>
<%@ page import="com.application.LoginServlet" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%

session = request.getSession(true);

Object employeeId = session.getAttribute("employeeId");
Object password = session.getAttribute("password");
Object employee = session.getAttribute("employee");

Boolean isLoggedIn = false;

if (employeeId != null){
  isLoggedIn = Auth.validateLogin(
    employeeId.toString(),
    password.toString()
  );
}
Boolean isAdmin = true;

if (employee!=null){
  isAdmin = Auth.isAdmin((Employee) employee);
  System.out.println(isAdmin+"here");
} else {
  isAdmin = true;
}

if (isLoggedIn){
%>
<html>
  <head>
    <title>Admin</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />

    <link href="static/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="static/css/_all-skins.min.css" rel="stylesheet" type="text/css" />
  </head>

  <body class="skin-blue fixed sidebar-mini">
    <div class="wrapper">
      <header class="main-header">
        <a href="/dashboard" class="logo">
          <span class="logo-mini"><b>S F</b></span>
          <span class="logo-lg"><b>SRH Fleets</b></span>
        </a>

        <nav class="navbar navbar-static-top" role="navigation">
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"></a>
          <div class="navbar-custom-menu">
          </div>
        </nav>
      </header>

      <aside class="main-sidebar">
        <section class="sidebar">
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
              <a href="/dashboard.jsp">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
              </a>
            </li>

            <li class="treeview">
              <a href="/updateLocation.jsp">
                <i class="fa fa-dashboard"></i> <span>Update Location</span>
              </a>
            </li>

            <li class="treeview">
              <a href="/admin.jsp">
                <i class="fa fa-dashboard"></i> <span>Admin Feature</span>
              </a>
            </li>
          </ul>

        </section>
      </aside>

      <div class="content-wrapper">
        <section class="content-header">
          <h1>
          </h1>
        </section>

        <section class="content">
			<div class="row">
			<div class="col-md-6">
			  <div class="box box-primary">
			    <div class="box-header with-border">
			      <h3 class="box-title">Create Employee</h3>
			    </div>

			    <form role="form" method="post" action="/signup">
			      <div class="box-body">
			        <div class="form-group">
			          <label>Firstname</label>
			          <input class="form-control" name="firstName" placeholder="Firstname">
			        </div>
			        
			        <div class="form-group">
			          <label>Lastname</label>
			          <input class="form-control" name="lastName" placeholder="Lastname">
			        </div>

			        <div class="form-group">
			          <label>Employee Id</label>
			          <input class="form-control" name="employeeId" placeholder="employee_Id">
			        </div>

			        <div class="form-group">
			          <label>Password</label>
			          <input class="form-control" name="password" name="password" placeholder="password">
			        </div>

			        <div class="form-group">
			          <label>Phone Number</label>
			          <input class="form-control" name="phoneNumber" placeholder="Phone Number">
			        </div>

			        <div class="form-group">
			          <label>Login Time</label>
			          <input class="form-control" name="loginTime" placeholder="hh:mm:ss">
			        </div>

			        <div class="form-group">
			          <label>Logout Time</label>
			          <input class="form-control" name="logoutTime" placeholder="hh:mm:ss">
			        </div>

			        <div class="form-group">
			          <label>Employee Class</label>
			          <input class="form-control" name="employeeClass" placeholder="Employee Class">
			        </div>

			        <div class="checkbox">
			          <label>
			            <input name="isAdmin" type="checkbox"> Is Admin  
			          </label>
			        </div>

			      </div>

			      <div class="box-footer">
			        <button type="submit" class="btn btn-primary">Submit</button>
			      </div>
			    </form>
			  </div>
			</div>

			<div class="col-md-6">
			  <div class="box box-primary">
			    <div class="box-header with-border">
			      <h3 class="box-title">Create Vehicle</h3>
			    </div>

			    <form role="form" method="post" action="/createVehicle">
			      <div class="box-body">
			        <div class="form-group">
			          <label>Vehicle Number</label>
			          <input class="form-control" name="number" placeholder="Vehicle Number">
			        </div>

			        <div class="form-group">
			          <label>Seat Count</label>
			          <input class="form-control" name="seatCount" placeholder="Seat Count">
			        </div>

			        <div class="form-group">
			          <label>Odometer Reading</label>
			          <input class="form-control" name="odometer" placeholder="Odometer Reading">
			        </div>

			      </div>

			      <div class="box-footer">
			        <button type="submit" class="btn btn-primary">Submit</button>
			      </div>
			    </form>
			  </div>
			  </div>
			  <div class="col-md-3">
			    <div class="box box-primary box-solid">
			      <div class="box-header with-border">
			        <h3 class="box-title">Assign Vehicles</h3>
		        <div class="display_remaining_time box-tools pull-right">
		        </div>
			      </div>
			      <div class="box-body">
			      Assign vehicle today

			        <button id="assignVehicleBtn" class="btn btn-success btn-xs pull-right">Assign now</button>
			      </div>
			    </div>
			  </div>
			</div>

        </section>
  </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="static/js/template/app.min.js" type="text/javascript"></script>

    <script type="text/javascript">
    $("#assignVehicleBtn").on("click", function (){
	  	$.ajax({
		    url: '/admin',
		    method: 'post',
		    contentType: "application/json; charset=utf-8",
		    complete: function(result, status) {
		    	response = JSON.parse(result.responseText)
		      if (response['status'] == 'success'){
		      	alert("Assignment Complete, Thank you !")

		      	window.location.href = "http://localhost:8080/dashboard.jsp";
		      }
		      else {
		      	alert(result.responseText);
		      }
		    }
		 });
    });
    </script>
</html>
<%
}
else {
%>
<html>
<body>
Not Authorized
</body>
</html>
<%
}
%>