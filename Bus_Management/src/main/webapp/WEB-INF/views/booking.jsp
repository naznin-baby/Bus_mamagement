<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <title> Faculty </title>
        <meta charset="UTF-8" /> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="${pageContext.request.contextPath}/static/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>

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

<body ng-app="myApp">
    <div ng-controller="BookingController as objCtrl">
        <div class="container-fluid text-center">    
            <div class="row content">
                <div class="col-sm-10 text-left"> 
                    <h1> Booking Info </h1>
                    <form name="objForm" method="POST">
                        <table>
                            <tr><td colspan="2">
                                    <div ng-if="objCtrl.flag != 'edit'">
                                        <h3> Add New Booking </h3> 
                                    </div>
                                    <div ng-if="objCtrl.flag == 'edit'">
                                        <h3> Update Booking for ID: {{ objCtrl.obj.bookId}} </h3> 
                                    </div> </td>
                            </tr>
                            <tr>
                                <td>pass-Name</td>
                                <td>
                                    <select ng-model="objCtrl.obj.passenger" ng-options="x.passName for x in models">
                                    </select>
                                </td>
                                <td>depart-Place</td>
                                <td>
                                    <select ng-model="objCtrl.obj.busSchedule" ng-options="y.departPlace for y in place">
                                    </select>
                                </td>


                                <!--                        <td>
                                                            <select ng-model="objCtrl.obj.busSchedule" ng-options="y.busSchedule. for y in place">
                                </select>
                                                        </td>-->

                                <td>counter-Name</td>
                                <td>
                                    <select ng-model="objCtrl.obj.routeCounter" ng-options="z.counterName for z in na">
                                    </select>
                                </td>

                                <td>bus_No</td>
                                <td>
                                    <select ng-model="objCtrl.obj.busInfo" ng-options="z.busNo for z in ba">
                                    </select>
                                </td>

                                <td>bus_capacity</td>
                                <td>
                                    <select ng-model="objCtrl.obj.busInfo" ng-options="z.busCapacity for z in ba">
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Book-Date: </td> <td><input type="date" name="bookDate" ng-model="objCtrl.obj.bookDate" required/> 
                                    <span ng-show="objForm.bookDate.$error.required" class="msg-val" style="color: red">***</span> </td>
                            </tr>
                            <tr>
                                <td>Book-Status: </td> <td><input type="text" name="bookStatus" ng-model="objCtrl.obj.bookStatus" required/> 
                                    <span ng-show="objForm.bookStatus.$error.required" class="msg-val" style="color: red">***</span> </td>
                            </tr>
                            <tr>
                                <td>total-Seat: </td> <td> <input type="text" name="totalSeat" ng-model="objCtrl.obj.totalSeat" maxlength="1" required/> 
                                    <span ng-show="objForm.totalSeat.$error.required" class="msg-val" style="color: red">***</span> </td>
                            </tr>


                            <tr>
                                <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Booking successfully added.</span>
                                    <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Employee already exists.</span> </td>
                            </tr>
                            <tr><td colspan="2">
                                    <div ng-if="objCtrl.flag != 'edit'">
                                        <button type="submit" class="btn btn-success" ng-click="objCtrl.addObject()" value="Add Booking">Add Booking</button>
                                        <!--                                        <input  type="submit" ng-click="objCtrl.addObject()" value="Add Booking"/> -->
                                        <button type="button" class="btn btn-warning" ng-click="objCtrl.reset()" value="Reset">Reset</button>
                                        <!--                                        <input type="button" ng-click="objCtrl.reset()" value="Reset"/>-->
                                    </div>
                                    <div ng-if="objCtrl.flag == 'edit'">
                                        <button type="submit" class="btn btn-primary" ng-click="objCtrl.updateObjectDetail()" value="Update Booking">Update Booking</button>
<!--                                        <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Booking"/> 	--> 
                                       <button type="button" class="btn btn-danger" ng-click="objCtrl.cancelUpdate()" value="Cancel">Cancel</button>
<!--                                        <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   -->
                                    </div> </td>
                            </tr>
                            <tr>
                                <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Booking successfully deleted.</span></td>
                            </tr>
                        </table>     
                    </form>
                    <br>
                    <br>
                    <table class="table table-striped">
                        <thead> 
                            <tr class="danger">
                                <th>ID </th> 
                                <th>pass-Name</th> 
                                <th>depart-Place</th> 
                                <th>counter-Name</th>
                                <th>bus-No</th>
                                <th>bus-capacity</th>
                                <th>Book-Date</th> 
                                <th>Book-Status</th>
                                <th>total-Seat</th>
                            </tr>
                        </thead>
                        <tr ng-repeat="row in objCtrl.objArray">
                            <td><span ng-bind="row.bookId"></span></td>
                            <td><span ng-bind="row.passenger.passName"></span></td>
                            <td><span ng-bind="row.busSchedule.departPlace"></span></td>
                            <td><span ng-bind="row.routeCounter.counterName"></span></td>
                            <td><span ng-bind="row.busInfo.busNo"></span></td>
                            <td><span ng-bind="row.busInfo.busCapacity"></span></td>
                            <td><span ng-bind="row.bookDate"></span></td>
                            <td><span ng-bind="row.bookStatus"></span></td>
                            <td><span ng-bind="row.totalSeat"></span></td>

                            <td>
                                <button type="button" class="btn btn-info" ng-click="objCtrl.deleteObject(row.bookId)" value="Delete">Delete</button>
<!--                                <input type="button" ng-click="objCtrl.deleteObject(row.bookId)" value="Delete"/>-->
                               <button type="button" class="btn btn-danger" ng-click="objCtrl.editObject(row.bookId)" value="Edit">Edit</button>
<!--                                <input type="button" ng-click="objCtrl.editObject(row.bookId)" value="Edit"/>-->
                                <span ng-if="objCtrl.flag == 'updated' && row.bookId == objCtrl.updatedId" class="msg-success">Booking successfully updated.</span> </td> 
                        </tr>	
                        <!--                <tr ng-repeat="row in objCtrl.objArray2">
                                            <td><span ng-bind="row.tspName"></span></td>
                                            
                                        </tr>-->
                    </table>
                </div>
                <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
                <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
                <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
                <script src="${pageContext.request.contextPath}/static/js/controller/booking_controller.js"></script>
        <!--        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>-->


            </div>
        </div>
    </div>

    <footer class="container-fluid text-center">
        <p>Footer Text</p>
    </footer>
</body>
</html> 