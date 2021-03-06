<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    #header{
        min-height: 100px;
        height: 100x;
        background-color: #269abc;
        border:2px solid;
        font-size: 80px;
        font-family: monospace;
        color:white;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>
   <div id="header">
            <div id="header1"></div>
            <div id="header_tab2">
               <div id="header2">
                     BRTC Corporation
                </div>
               
                

                </div>
            </div>
          
        </div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">employee
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/empcategory/home">employee Category</a></li>
          <li><a href="${pageContext.request.contextPath}/employee/home">employee detils</a></li>
<!--          <li><a href="#">Page 1-3</a></li>-->
        </ul>
      </li>
<!--        <li><a href="#">employee</a></li>-->
        <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Bus Detials
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/businfo/home">Bus Info</a></li>
          <li><a href="${pageContext.request.contextPath}/routecounter/home">Route Counter</a></li>
          <li><a href="${pageContext.request.contextPath}/route/home">Route</a></li>
          <li><a href="${pageContext.request.contextPath}/schedule/home">Bus schedule</a></li>
        </ul>
      </li>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Ticket Detials
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/booking/home">Booking</a></li>
          <li><a href="${pageContext.request.contextPath}/bookingseat/home">Bookingseat</a></li>
          <li><a href="${pageContext.request.contextPath}/payment/home">payment</a></li>
        </ul>
      </li>
      
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Account
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/sealaccount/home">Seals Account</a></li>
          <li><a href="${pageContext.request.contextPath}/salarytype/home">Salary Type</a></li>
          <li><a href="${pageContext.request.contextPath}/salary/home">Salary</a></li>
        </ul>
      </li>
        <li><a href="${pageContext.request.contextPath}/">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
            
          <li><a href="#"><span class="glyphicon glyphicon-user"></span> Registration</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-6 text-left"> 
      <h1>Welcome</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <hr>
      <h3>Test</h3>
      <p>Lorem ipsum...</p>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
