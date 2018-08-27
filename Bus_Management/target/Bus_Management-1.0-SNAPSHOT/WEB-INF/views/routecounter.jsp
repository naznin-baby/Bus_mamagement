<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Route Counter </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="RouteCounterController as objCtrl">
            <center>  <h1> Route Counter Info </h1></center>
            <form name="objForm" method="POST">
                <center>
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Route Counter </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Route Counter for ID: {{ objCtrl.obj.counterId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Route Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.route" ng-options="x.routeName for x in rout">
</select>
                        </td>
                           
                    </tr>
                    <tr>
                        <td>counter Name: </td> <td> <input type="text" name="counterName" ng-model="objCtrl.obj.counterName" required/> 
                            <span ng-show="objForm.counterName.$error.required" class="msg-val">counter Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>counter Address </td> <td> <input type="text" name="counterAddress" ng-model="objCtrl.obj.counterAddress" required/> 
                            <span ng-show="objForm.counterAddress.$error.required" class="msg-val">counter Address is required.</span> </td>
                    </tr>
                    <tr>
                        <td>contact No: </td> <td> <input type="text" name="contactNo" ng-model="objCtrl.obj.contactNo" required/> 
                            <span ng-show="objForm.contactNo.$error.required" class="msg-val">contact No is required.</span> </td>
                    </tr>
                   
                    
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Route Counter successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Route Counter already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Route Counter"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Route Counter"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Route Counter successfully deleted.</span>
                    </tr>
                    </center>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> <th>Route Name</th> <th>counter Name</th> <th>counter Address</th> <th>contact No</th>  </tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.counterId"></span></td>
                    <td><span ng-bind="row.route.routeName"></span></td>
                    <td><span ng-bind="row.counterName"></span></td>
                    <td><span ng-bind="row.counterAddress"></span></td>
                    <td><span ng-bind="row.contactNo"></span></td>
                   
                   
                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.counterId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.counterId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.counterId == objCtrl.updatedId" class="msg-success">Route Counter successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/routecounter_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 