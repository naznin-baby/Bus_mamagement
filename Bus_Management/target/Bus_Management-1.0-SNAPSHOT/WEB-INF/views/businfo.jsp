<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
         <title> BusInfo </title>
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
        <div ng-controller="BusInfoController as objCtrl">
             <div class="container-fluid text-center">    
            <div class="row content">
                <div class="col-sm-12 text-left"> 
                    <form name="objForm" method="POST">

            <center>  <h1> Bus Info </h1></center>
            <form name="objForm" method="POST">
                <center>
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Bus </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Bus for ID: {{ objCtrl.obj.busId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Bus_No: </td> <td><input type="text" name="busNo" ng-model="objCtrl.obj.busNo" required/> 
                            <span ng-show="objForm.busNo.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                    <tr>
                        <td>Bus-Reg-No: </td> <td> <input type="text" name="busRegNo" ng-model="objCtrl.obj.busRegNo" required/> 
                            <span ng-show="objForm.busRegNo.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                    <tr>
                        <td>Bus-Model: </td> <td> <input type="text" name="busModel" ng-model="objCtrl.obj.busModel" required/> 
                            <span ng-show="objForm.busModel.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                    <tr>
                        <td>Bus-Capacity: </td> <td> <input type="text" name="busCapacity" ng-model="objCtrl.obj.busCapacity" required/> 
                            <span ng-show="objForm.busCapacity.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                    <tr>
                        <td>Purchase-Date: </td> <td> <input type="text" name="purchaseDate" ng-model="objCtrl.obj.purchaseDate" required/> 
                            <span ng-show="objForm.purchaseDate.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                     <tr>
                        <td>Insurance-Status: </td> <td> <input type="text" name="insuranceStatus" ng-model="objCtrl.obj.insuranceStatus" required/> 
                            <span ng-show="objForm.insuranceStatus.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                     <tr>
                        <td>Insurance-Date: </td> <td> <input type="text" name="insuranceDate" ng-model="objCtrl.obj.insuranceDate" required/> 
                            <span ng-show="objForm.insuranceDate.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                     <tr>
                        <td>Insurance-Expiry: </td> <td> <input type="text" name="insuranceExpiry" ng-model="objCtrl.obj.insuranceExpiry" required/> 
                            <span ng-show="objForm.insuranceExpiry.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                     <tr>
                        <td>Bus-Type: </td> <td> <input type="text" name="busType" ng-model="objCtrl.obj.busType" required/> 
                            <span ng-show="objForm.busType.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                     <tr>
                        <td>Bus-Photo: </td> <td> <input type="text" name="busPhoto" ng-model="objCtrl.obj.busPhoto" required/> 
                            <span ng-show="objForm.busPhoto.$error.required" class="msg-val" style="color: blue">***</span> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Bus successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Bus already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <button type="submit" class="btn btn-success" ng-click="objCtrl.addObject()" value="Add Bus">Add Bus</button>
<!--                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Bus"/> -->
                                <button type="button" class="btn btn-warning" ng-click="objCtrl.reset()" value="Reset">Reset</button>
<!--                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>-->
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <button type="submit" class="btn btn-primary" ng-click="objCtrl.updateObjectDetail()" value="Update Bus">Update Bus</button>
<!--                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Bus"/> 	-->
<button type="button" class="btn btn-danger" ng-click="objCtrl.cancelUpdate()" value="Cancel">Cancel</button>
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Bus successfully deleted.</span>
                    </tr>
                    </center>
                </table>     
            </form>
             <table class="table table-striped">
                        <thead> <tr class="danger">
                <th>ID </th> 
                    <th>Bus_no</th> 
                    <th>Bus_reg_No</th> 
                    <th>Bus-Model</th> 
                    <th>Bus-Capacity</th> 
                    <th>Purchase-Date</th> 
                    <th>Insurance-Status</th> 
                    <th>Insurance-Date</th>
                    <th>Insurance-Expiry</th>
                    <th>Bus-Type</th> 
                    <th>Bus-Photo</th></tr>
                        </thead>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.busId"></span></td>
                    <td><span ng-bind="row.busNo"></span></td>
                    <td><span ng-bind="row.busRegNo"></span></td>
                    <td><span ng-bind="row.busModel"></span></td>
                    <td><span ng-bind="row.busCapacity"></span></td>
                    <td><span ng-bind="row.purchaseDate"></span></td>
                    <td><span ng-bind="row.insuranceStatus"></span></td>
                    <td><span ng-bind="row.insuranceDate"></span></td>
                    <td><span ng-bind="row.insuranceExpiry"></span></td>
                    <td><span ng-bind="row.busType"></span></td>
                    <td><span ng-bind="row.busPhoto"></span></td>
                    <td>
                        <button type="button" class="btn btn-info" ng-click="objCtrl.deleteObject(row.busId)" value="Delete">Delete</button>
<!--                        <input type="button" ng-click="objCtrl.deleteObject(row.busId)" value="Delete"/>-->
                        <button type="button" class="btn btn-danger" ng-click="objCtrl.editObject(row.busId)" value="Edit">Edit</button>
<!--                        <input type="button" ng-click="objCtrl.editObject(row.busId)" value="Edit"/>-->
                        <span ng-if="objCtrl.flag == 'updated' && row.busId == objCtrl.updatedId" class="msg-success">Bus successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/bus_info_controller.js"></script>
<!--        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>-->
        
        
            </div>
        </div>
    </div>

    <footer class="container-fluid text-center">
        <p>Footer Text</p>
    </footer>
    </body>
</html> 