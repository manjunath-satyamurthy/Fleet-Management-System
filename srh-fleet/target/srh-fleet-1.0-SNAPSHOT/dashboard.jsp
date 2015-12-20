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
Boolean isAdmin = false;

if (employee!=null){
  isAdmin = Auth.isAdmin((Employee) employee);
} else {
  isAdmin = true;  
}

if (isLoggedIn){
%>
<html>
  <head>
    <title>Dashboard</title>
<%
  if (!isAdmin){
%>
<%
}
%>
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
          </h1>
        </section>

        <section class="content">
<%

if (isAdmin){

%>
<%
}
else {
%>
<%
}
%>

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