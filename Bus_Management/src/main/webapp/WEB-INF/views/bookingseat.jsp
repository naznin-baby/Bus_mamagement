<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <title> Booking Seat </title>
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
    <div ng-controller="BookingSeatController as objCtrl">
        <div class="container-fluid text-center">    
            <div class="row content">
                <div class="col-sm-9 text-left">   

                    <h1>  Booking Seat Info </h1>
                    <form name="objForm" method="POST">
                        <table>
                            <tr><td colspan="2">
                                    <div ng-if="objCtrl.flag != 'edit'">
                                        <h3> Add New  Booking Seat </h3> 
                                    </div>
                                    <div ng-if="objCtrl.flag == 'edit'">
                                        <h3> Update  Booking Seat for ID: {{ objCtrl.obj.bookSeatId}} </h3> 
                                    </div> </td>
                            </tr>
                            <tr>

                                <td>book-Id</td>
                                <td>
                                    <select ng-model="objCtrl.obj.booking" ng-options="x.bookId for x in id2">
                                    </select>
                                </td>

                            </tr>
                            <tr>
                                <td>book-Id</td>
                                <td>
                                    <select ng-model="objCtrl.obj.booking" ng-options="x.bookDate for x in id2">
                                    </select>
                                </td>

                            </tr>
                            <tr>
                                <td>book-time</td>
                                <td>
                                    <select ng-model="objCtrl.obj.booking" ng-options="x.busSchedule.departTime for x in id2">
                                    </select>
                                </td>

                            </tr>


                            <tr>
                                <td>busNo</td>
                                <td>
                                    <select ng-model="objCtrl.obj.busInfo" ng-options="x.busNo for x in in">
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>busCapacity</td>
                                <td>
                                    <select ng-model="objCtrl.obj.busInfo" ng-options="x.busCapacity for x in in">
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>busType</td>
                                <td>
                                    <select ng-model="objCtrl.obj.busInfo" ng-options="x.busType for x in in">
                                    </select>
                                </td>
                            </tr>
                            <tr>

                                <td>passName</td>
                                <td>
                                    <select ng-model="objCtrl.obj.passenger" ng-options="x.passName for x in pa">
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td>seat-No: </td> <td><input type="text" name="seatNo" ng-model="objCtrl.obj.seatNo" required/> 
                                    <span ng-show="objForm.seatNo.$error.required" class="msg-val">seat-No is required.</span> </td>
                            </tr>
                            <!--                          <tr>
                                                        <td>seat-Name: </td> <td><input type="text" name="seatName" ng-model="objCtrl.obj.seatName" required/> 
                                                            <span ng-show="objForm.seatName.$error.required" class="msg-val">seat-Name is required.</span> </td>
                                                    </tr>-->
                                  <tr>
                                <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Bookingseat successfully added.</span>
                                    <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Bookingseat already exists.</span> </td>
                            </tr>
                            <tr><td colspan="2">
                                    <div><br/>
                                        <div ng-if="objCtrl.flag != 'edit'">
                                            <button type="submit" class="btn btn-success" ng-click="objCtrl.addObject()" value="Add Booking Seat">Add Booking seat</button>
                                            <!--                                        <input  type="submit" ng-click="objCtrl.addObject()" value="Add Booking Seat"/> -->
                                            <button type="button" class="btn btn-warning"  ng-click="objCtrl.reset()" value="Reset">Reseat</button>
                                            <!--                                        <input type="button" ng-click="objCtrl.reset()" value="Reset"/>-->
                                        </div>
                                        <div ng-if="objCtrl.flag == 'edit'">
                                            <button type="submit" class="btn btn-primary" ng-click="objCtrl.updateObjectDetail()" value="Update Booking Seat">Update Booking Seat</button>
                                            <!--                                        <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Booking Seat"/> 	-->
                                            <button type="button" class="btn btn-danger" ng-click="objCtrl.cancelUpdate()" value="Cancel">Cancel</button>
                                            <!--                                        <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   -->
                                        </div>
                                    </div>
                                </td>
                            </tr>


                            <tr>
                                <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Booking Seat successfully deleted.</span></td>
                            </tr>
                        </table>     
                    </form>
                    <br>
                    <br>
                    <table class="table table-striped">
                        <thead> 
                            <tr class="danger"><th>ID </th> 
                                <th>book-Id</th> 
                                <th>book-date</th> 
                                <th>book-time</th> 
                                <th>bus-no</th> 
                                <th>bus-Capacity</th> 
                                <th>bus-Type</th> 
                                <th>pass-Name</th> 
                                <th>seat-No</th> 
                            </tr>
                        </thead>
                        <!--                         <th>seat_Name</th> -->






                        <tr ng-repeat="row in objCtrl.objArray">
                            <td><span ng-bind="row.bookSeatId"></span></td>
                            <td><span ng-bind="row.booking.bookId"></span></td>
                            <td><span ng-bind="row.booking.bookDate"></span></td>
                            <td><span ng-bind="row.booking.busSchedule.departTime"></span></td>
                            <td><span ng-bind="row.busInfo.busNo"></span></td>
                            <td><span ng-bind="row.busInfo.busCapacity"></span></td>
                            <td><span ng-bind="row.busInfo.busType"></span></td>
                            <td><span ng-bind="row.passenger.passName"></span></td>
                            <td><span ng-bind="row.seatNo"></span></td>
                            <!--                        <td><span ng-bind="row.seatName"></span></td>-->
                            <td>
                                <button type="button" class="btn btn-info" ng-click="objCtrl.deleteObject(row.bookSeatId)" value="Delete">Delete</button>
                                <!--                                <input type="button" ng-click="objCtrl.deleteObject(row.bookSeatId)" value="Delete"/>-->
                                <button type="button" class="btn btn-danger" ng-click="objCtrl.editObject(row.bookSeatId)" value="Edit">Edit</button>
                                <!--                                <input type="button" ng-click="objCtrl.editObject(row.bookSeatId)" value="Edit"/>-->
                                <span ng-if="objCtrl.flag == 'updated' && row.bookSeatId == objCtrl.updatedId" class="msg-success">Booking Seat successfully updated.</span> </td> 
                        </tr>	

                    </table>
                </div>
                <div class="container-fluid">
                    <div class="row content">
                        <div class="col-sm-3 sidenav">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search Blankseat..">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </span>

                            </div>
                            <br>
                            <br>
                            <!--                  <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Busno and route
                                <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                  <li><a href="#">6(Dhaka-Rajshahi)</a></li>
                                  <li><a href="#">CSS</a></li>
                                  <li><a href="#">JavaScript</a></li>
                                </ul>
                              </div>-->
                            <div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-info">A1</button>
                                    <button type="button" class="btn btn-info">A2</button>
                                    <button type="button" class="btn btn-info">A3</button>
                                    <button type="button" class="btn btn-info">A4</button>
                                    <button type="button" class="btn btn-info">A5</button>
                                    <button type="button" class="btn btn-info">A6</button>
                                    <button type="button" class="btn btn-info">A7</button>
                                    <button type="button" class="btn btn-info">A8</button>
                                    <button type="button" class="btn btn-info">A9</button>
                                    <button type="button" class="btn btn-info">A10</button>

                                </div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-info" onclick="">B1</button>
                                    <button type="button" class="btn btn-info">B2</button>
                                    <button type="button" class="btn btn-info">B3</button>
                                    <button type="button" class="btn btn-info">B4</button>
                                    <button type="button" class="btn btn-info">B5</button>
                                    <button type="button" class="btn btn-info">B6</button>
                                    <button type="button" class="btn btn-info">B7</button>
                                    <button type="button" class="btn btn-info">B8</button>
                                    <button type="button" class="btn btn-info">B9</button>
                                    <button type="button" class="btn btn-info">B10</button>


                                </div>
                                <div class="col-sm-4">
                                    <tr>
                                        <td>busNo</td>
                                        <td>
                                            <select button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" ng-model="objCtrl.obj.busInfo" ng-options="x.busNo for x in in">
                                            </select>
                                        </td>
                                    </tr>
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-info">C1</button>
                                    <button type="button" class="btn btn-info">C2</button>
                                    <button type="button" class="btn btn-info">C3</button>
                                    <button type="button" class="btn btn-info">C4</button>
                                    <button type="button" class="btn btn-info">C5</button>
                                    <button type="button" class="btn btn-info">C6</button>
                                    <button type="button" class="btn btn-info">C7</button>
                                    <button type="button" class="btn btn-info">C8</button>
                                    <button type="button" class="btn btn-info">C9</button>
                                    <button type="button" class="btn btn-info">C10</button>
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-info">D1</button>
                                    <button type="button" class="btn btn-info">D2</button>
                                    <button type="button" class="btn btn-info">D3</button>
                                    <button type="button" class="btn btn-info">D4</button>
                                    <button type="button" class="btn btn-info">D5</button>
                                    <button type="button" class="btn btn-info">D6</button>
                                    <button type="button" class="btn btn-info">D7</button>
                                    <button type="button" class="btn btn-info">D8</button>
                                    <button type="button" class="btn btn-info">D9</button>
                                    <button type="button" class="btn btn-info">D10</button>

                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
                    <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
                    <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
                    <script src="${pageContext.request.contextPath}/static/js/controller/bookingseat_controller.js"></script>
        <!--            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>-->

                </div>
            </div>
        </div>
        <div>
            <footer class="container-fluid text-center">
                <p>Footer Text</p>
            </footer>
        </div>
</body>
</html> 