<%@ page import="com.application.Employee" %>
<%@ page import="com.application.Vehicle" %>
<%@ page import="java.util.List" %>
<%@ page import="com.application.DatabaseApi" %>
<%@ page import="com.application.Auth" %>
<%@ page import="com.application.LoginServlet" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%

session = request.getSession(true);

String employeeId = (String) session.getAttribute("employeeId");
String password = (String) session.getAttribute("password");
Employee employee = (Employee) session.getAttribute("employee");

System.out.println(employee);

Vehicle vehicle = DatabaseApi.getEmployeeVehicle(employee);

List<Vehicle> allVehicles = ObjectifyService.ofy()
          .load().type(Vehicle.class).list();

System.out.println("here I also am");
System.out.println(allVehicles);



if (allVehicles != null){
  pageContext.setAttribute("allVehicles", allVehicles);
}


pageContext.setAttribute("username", employee.firstName);
pageContext.setAttribute("class", employee.employeeClass);
pageContext.setAttribute("sector", employee.direction);


Boolean isLoggedIn = false;

if (employeeId != null){
  isLoggedIn = Auth.validateLogin(
    employeeId,
    password
  );
}
Boolean isAdmin = false;

if (employee!=null){
  isAdmin = Auth.isAdmin(employee);
} else {
  isAdmin = true;  
}

if (isLoggedIn){
%>
<html>
  <head>
    <title>Dashboard</title>
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
<%
  if (isAdmin){
%>
            <li class="treeview">
              <a href="/admin.jsp">
                <i class="fa fa-dashboard"></i> <span>Admin Feature</span>
              </a>
            </li>
<%
}
%>

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
            <div class="col-md-4">
              <div class="box box-widget widget-user-2 bg-yellow">
                <div class="widget-user-header bg-yellow">
                  <h3 class="widget-user-username" style="padding:5px;">Hello ${ username }</h3>
                </div>
                <div class="box-footer no-padding">
                  <ul class="nav nav-stacked">
                    <li><a href="#">Vehicle number <span class="pull-right 
                    badge bg-blue">
                    <%
                    if (vehicle.number != null){
pageContext.setAttribute("vnumber", vehicle.number);
                    %>
                    ${ vnumber }
                    <%
                    }
                    else{
                    %>
                    Not Assigned
                    <%
                    }
                    %>
                    </span></a></li>
                    <li><a href="#">Employee Class <span class="pull-right badge bg-aqua">
                      ${ class }
                    </span></a></li>
                    <li><a href="#">Drop Off Sector<span class="pull-right badge bg-green">
                      ${ sector }                      
                    </span></a></li>
                  </ul>
                </div>
              </div><!-- /.widget-user -->
            </div><!-- /.col -->

          <div class="col-md-4">
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Update Holidays - Current month</h3>
          </div>

          <form role="form" method="post" action="/updateHolidays">
            <div class="box-body">
              <div class="form-group">
                <label>Choose the date</label>
                  <select class="form-control" id="holiday" name="holiday">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                    <option>13</option>
                    <option>14</option>
                    <option>15</option>
                    <option>16</option>
                    <option>17</option>
                    <option>18</option>
                    <option>19</option>
                    <option>20</option>
                    <option>12</option>
                    <option>22</option>
                    <option>23</option>
                    <option>24</option>
                    <option>25</option>
                    <option>26</option>
                    <option>27</option>
                    <option>28</option>
                    <option>29</option>
                    <option>30</option>
                    <option>31</option>
                  </select>
              </div>

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
            </div>
          </div>

            </div>
</div>

        </section>
  </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="static/js/template/app.min.js" type="text/javascript"></script>
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