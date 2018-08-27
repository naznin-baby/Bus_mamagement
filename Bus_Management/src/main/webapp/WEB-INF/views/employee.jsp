<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
         <title> Employee </title>
        <meta charset="UTF-8" /> 
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="${pageContext.request.contextPath}/static/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .msg-val {
                color: red;
            }
            .msg-success {
                color: green;
            }
           
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
    <body ng-app="myApp">
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
                            <li><a href="#">employee Category</a></li>
                            <li><a href="#">employee detils</a></li>
                            <!--          <li><a href="#">Page 1-3</a></li>-->
                        </ul>
                    </li>
                    <!--        <li><a href="#">employee</a></li>-->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Bus Detials
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Bus Info</a></li>
                            <li><a href="#">Route Counter</a></li>
                            <li><a href="#">Route</a></li>
                            <li><a href="#">Bus schedule</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Ticket Detials
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Booking</a></li>
                            <li><a href="#">Bookingseat</a></li>
                            <li><a href="#">payment</a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Account
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Seals Account</a></li>
                            <li><a href="#">Salary Type</a></li>
                            <li><a href="#">Salary</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">

                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Registration</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
        </div>
    </nav>
        <div ng-controller="EmployeeController as objCtrl">
              <div class="container-fluid text-center">    
            <div class="row content">
                <div class="col-sm-10 text-left"> 
            <center>  <h1> Employee Info </h1></center>
            <form name="objForm" method="POST">
                <center>
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Employee </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Employee for ID: {{ objCtrl.obj.empId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>E-C-id</td>
                        <td>
                            <select ng-model="objCtrl.obj.empCategory" ng-options="x.ecid for x in id2">
</select>
                        </td>
                           
                    </tr>
                    <tr>
                        <td>emp-Name: </td> <td> <input type="text" name="empName" ng-model="objCtrl.obj.empName" required/> 
                            <span ng-show="objForm.empName.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                    <tr>
                        <td>gender: </td> <td> <input type="text" name="gender" ng-model="objCtrl.obj.gender" required/> 
                            <span ng-show="objForm.gender.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                    <tr>
                        <td>birth date: </td> <td> <input type="date" name="dob" ng-model="objCtrl.obj.dob" required/> 
                            <span ng-show="objForm.dob.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                    <tr>
                        <td>Moblic: </td> <td> <input type="text" name="moblic" ng-model="objCtrl.obj.moblic" required/> 
                            <span ng-show="objForm.moblic.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                     <tr>
                        <td>Address: </td> <td> <input type="text" name="address" ng-model="objCtrl.obj.address" required/> 
                            <span ng-show="objForm.address.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                     <tr>
                        <td>resigned-Date: </td> <td> <input type="date" name="resignedDate" ng-model="objCtrl.obj.resignedDate" required/> 
                            <span ng-show="objForm.resignedDate.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                     <tr>
                        <td>emp-Photo: </td> <td> <input type="text" name="empPhoto" ng-model="objCtrl.obj.empPhoto" required/> 
                            <span ng-show="objForm.empPhoto.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Employee successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Employee already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div><br/>
                            <div ng-if="objCtrl.flag != 'edit'">
                                <button type="submit" class="btn btn-success" ng-click="objCtrl.addObject()" value="Add Employee">Add Employee</button>
<!--                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Employee"/> -->
                                <button type="button" class="btn btn-warning" ng-click="objCtrl.reset()" value="Reset">Reset</button>
<!--                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>-->
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <button type="submit" class="btn btn-primary" ng-click="objCtrl.updateObjectDetail()" value="Update Employee">Update Employee</button>
<!--                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Employee"/> 	-->
                                <button type="button" class="btn btn-danger" ng-click="objCtrl.cancelUpdate()" value="Cancel">Cancel</button>
<!--                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   -->
                            </div> </div>
                        </td>
                            
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Employee successfully deleted.</span>
                    </tr>
                    </center>
                </table>     
            </form>
            <div></br>
            <table class="table table-striped">
                        <thead> <tr class="danger">
                                <th>ID </th>
                                <th>E-C-id</th> 
                                <th>emp-Name</th> 
                                <th>gender</th> 
                                <th>birth date</th>
                                <th>Moblic</th> 
                                <th>Address</th> 
                                <th>resigned-Date</th>
                                <th>emp-Photo</th> </tr>
                        </thead>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.empId"></span></td>
                    <td><span ng-bind="row.empCategory.ecid"></span></td>
                    <td><span ng-bind="row.empName"></span></td>
                    <td><span ng-bind="row.gender"></span></td>
                    <td><span ng-bind="row.dob"></span></td>
                    <td><span ng-bind="row.moblic"></span></td>
                    <td><span ng-bind="row.address"></span></td>
                    <td><span ng-bind="row.resignedDate"></span></td>
                    <td><span ng-bind="row.empPhoto"></span></td>
                   
                    <td>
                        <button type="button" class="btn btn-info" ng-click="objCtrl.deleteObject(row.empId)" value="Delete">Delete</button>
<!--                        <input type="button" ng-click="objCtrl.deleteObject(row.empId)" value="Delete"/>-->
<button type="button" class="btn btn-danger" ng-click="objCtrl.editObject(row.empId)" value="Edit">Edit</button>
<!--                        <input type="button" ng-click="objCtrl.editObject(row.empId)" value="Edit"/>-->
                        <span ng-if="objCtrl.flag == 'updated' && row.empId == objCtrl.updatedId" class="msg-success">Employee successfully updated.</span> </td> 
                </tr>	
            </table>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/employee_controller.js"></script>
<!--        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>-->
        
        
            </div>
        </div>
    </div>

    <footer class="container-fluid text-center">
        <p>Footer Text</p>
    </footer>
    </body>
</html> 