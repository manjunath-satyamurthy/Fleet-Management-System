<%@ page import="com.application.Employee" %>
<%@ page import="com.application.Auth" %>
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
%>

<%
if (isLoggedIn){
%>

<html>
  <head>
    <title>Update Location</title>
    <link href="static/css/google-maps.css" rel="stylesheet" type="text/css" />  
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
              <a href="updateLocation.jsp">
                <i class="fa fa-dashboard"></i> <span>Update Location</span>
              </a>
            </li>

            <li class="treeview">
              <a href="/dashboard.jsp">
                <i class="fa fa-dashboard"></i> <span>Caleander</span>
              </a>
            </li>

          </ul>
        </section>
      </aside>

      <div class="content-wrapper">
        <section class="content-header">
          <h1>
          Update Location
          <small>Choose your drop off point.</small>
          </h1>
        </section>

        <section class="content">

          <div class="row">
            <div class="col-md-12 center-block">
            <input id="pac-input" class="controls" type="text" placeholder="Search Box">
            <div id="map"></div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">  
              <button class="btn btn-success center-block" type="button" id="updateLocationBtn">Update</button>
            </div>
          </div>

        </section>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="static/js/template/app.min.js" type="text/javascript"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzubdgNMsq0gS1Z70IH2c2UewYAWDHA0Y&libraries=places&callback=initAutocomplete" async defer></script>
    <script src="static/js/template/google-maps-search.js" type="text/javascript"></script>

  </body>
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