<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Payment </title>
     
        <title>Home Page</title>
        
           
    </head>
    <body ng-app="myApp">
        <div ng-controller="PaymentController as objCtrl">
            <h1> Payment Info </h1>
<!--            <div class="container">
                <div class="row">
                    <div class="header col-md-12">
                        <h1><a href="">Welcome to CareerHub!</a></h1>
                    </div>
                    <div class="menu col-md-12">
                        <!DOCTYPE html>
                        <html lang="en">
                            <head>
                                <title>Bootstrap Example</title>
                                <meta charset="utf-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1">
                                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                            </head>
                            <body>

                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="active"><a href="#">Home</a></li>
                                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Page 1-1</a></li>
                                                    <li><a href="#">Page 1-2</a></li>
                                                    <li><a href="#">Page 1-3</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Page 2</a></li>
                                        </ul>
                                        <ul class="nav navbar-nav navbar-right">
                                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                        </ul>
                                    </div>
                                </nav>





                                                    <div class="row">
                                                        <nav class="navbar navbar-default">
                                                            <div class="container-fluid">
                                
                                                                <ul class="nav navbar-nav">
                                                                    <li><a href="http://careerhub.idb-bisew.info/">CareerHub</a></li>
                                                                    <li><a href="index.html">Home</a></li>
                                                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Profile <span class="caret"></span></a>
                                                                        <ul class="dropdown-menu">
                                                                            <li><a href="#">Trainee's Status</a></li>
                                                                            <li><a href="monRecord.html">Trainee's Record</a></li>
                                                                            <li><a href="personalInfo.html">Personal Information</a></li>
                                                                            <li><a href="bankAccount.html">Bank Account</a></li>
                                                                            <li><a href="acdemic.html">Academic Details</a></li>
                                                                            <li><a href="reference.html">Trainee References</a></li>
                                                                            <li><a href="#">Course Projects</a></li>
                                                                            <li><a href="#">View CV</a></li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><a href="feedback.html">Feedback</a></li>
                                                                    <li><a href="#" data-toggle="tooltip" data-placement="top" title="Change Password!">Manage</a></li>

                                -->
                   
           
                        <form name="objForm" method="POST">
                            <center>
                                <table>
                                    <tr><td colspan="2">
                                            <div ng-if="objCtrl.flag != 'edit'">
                                                <h2> Add New Payment </h2> 
                                            </div>
                                            <div ng-if="objCtrl.flag == 'edit'">
                                                <h3> Update Payment for ID: {{ objCtrl.obj.payId}} </h3> 
                                            </div> </td>
                                    </tr>
                                    <tr>
                                        <td>Pass_Name</td>
                                        <td>
                                            <select ng-model="objCtrl.obj.passenger" ng-options="x.passName for x in name">
                                            </select>
                                        </td>

                                    <tr>
                                        <td>pay-Date: </td> <td><input type="date" name="payDate" ng-model="objCtrl.obj.payDate" required/> 
                                            <span ng-show="objForm.payDate.$error.required" class="msg-val">pay-Date is required.</span> </td>
                                    </tr>
                                    <tr>
                                        <td>price-Of-Ticket: </td> <td><input type="double" name="priceOfTicket" ng-model="objCtrl.obj.priceOfTicket" required/> 
                                            <span ng-show="objForm.priceOfTicket.$error.required" class="msg-val">price-Of-Ticket is required.</span> </td>
                                    </tr>
                                    <tr>
                                        <td>number-Of-Ticket: </td> <td> <input type="text" name="numberOfTicket" ng-model="objCtrl.obj.numberOfTicket" ng-keyup="objCtrl.totalFair()" required/> 
                                            <span ng-show="objForm.numberOfTicket.$error.required" class="msg-val">ticket more then 4 not allowed.</span> </td>
                                    </tr>
<!--                                    <tr>
                                        <td>total-Fair: </td> <td> <input type="double" name="totalFair" ng-model="objCtrl.obj.totalFair" /> 
                                            
                                    </tr>-->
                                    <tr>
                                        <td>trans-Id: </td> <td> <input type="text" name="transcationId" ng-model="objCtrl.obj.transcationId" required/> 
                                            <span ng-show="objForm.transcationId.$error.required" class="msg-val">trans-Id is required.</span> </td>
                                    </tr>


                                    <tr>
                                        <td colspan="2">
                                            <span ng-if="objCtrl.flag == 'created'" class="msg-success">ticket more then 4 not allowed.</span>
                                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Payment successfully adedd.</span>
                                        </td>
                                    </tr>
                                    <tr><td colspan="2">
                                            <div ng-if="objCtrl.flag != 'edit'">
                                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Payment"/> 
                                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                                            </div>
                                            <div ng-if="objCtrl.flag == 'edit'">
                                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Payment"/> 	
                                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                                            </div> </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Payment successfully deleted.</span></td>
                                    </tr>
                                </table>     
                        </form>
                        <table>
                            <tr><th>ID </th> 
                                <th>Pass_Name</th> 
                                <th>pay-Date</th> 
                                <th>price-Of-Ticket</th>
                                <th>number-Of-Ticket</th> 
                                <th>total-Fair</th>
                                <th>trans-Id</th>

                            <tr ng-repeat="row in objCtrl.objArray">
                                <td><span ng-bind="row.payId"></span></td>
                                <td><span ng-bind="row.passenger.passName"></span></td>
                                <td><span ng-bind="row.payDate"></span></td>
                                <td><span ng-bind="row.priceOfTicket"></span></td>
                                <td><span ng-bind="row.numberOfTicket"></span></td>
                                <td><span ng-bind="row.totalFair"></span></td>
                                <td><span ng-bind="row.transcationId"></span></td>
                                <td>
                                    <input type="button" ng-click="objCtrl.deleteObject(row.payId)" value="Delete"/>
                                    <input type="button" ng-click="objCtrl.editObject(row.payId)" value="Edit"/>
                                    <span ng-if="objCtrl.flag == 'updated' && row.payId == objCtrl.updatedId" class="msg-success">Payment successfully updated.</span> </td> 
                            </tr>	
                            </center>

                        </table>
                    </div>
                    <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
                    <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
                    <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
                    <script src="${pageContext.request.contextPath}/static/js/controller/payment_controller.js"></script>
                    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
                    
                </div>
            </div>
        </div>
        
    </div>
</div>

</body>
</html> 