<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Route </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="RouteController as objCtrl">
            <center>  <h1> Route Info </h1></center>
            <form name="objForm" method="POST">
                <center>
                    <table>
                        <tr><td colspan="2">
                                <div ng-if="objCtrl.flag != 'edit'">
                                    <h3> Add New Route </h3> 
                                </div>
                                <div ng-if="objCtrl.flag == 'edit'">
                                    <h3> Update Route for ID: {{ objCtrl.obj.routeId}} </h3> 
                                </div> </td>
                        </tr>
                        <td>Bus Model</td>
                        <td>
                            <select ng-model="objCtrl.obj.busInfo" ng-options="x.busModel for x in models">
                            </select>
                        </td>
                        <td>Employee Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.employee" ng-options="y.empName for y in emp">
                            </select>
                        </td>
                        <tr>
                            <td>route-No: </td> <td><input type="text" name="routeNo" ng-model="objCtrl.obj.routeNo" required/> 
                                <span ng-show="objForm.routeNo.$error.required" class="msg-val">route-No is required.</span> </td>
                        </tr>
                        <tr>
                            <td>route-Name: </td> <td> <input type="text" name="routeName" ng-model="objCtrl.obj.routeName" required/> 
                                <span ng-show="objForm.routeName.$error.required" class="msg-val">route-Name is required.</span> </td>
                        </tr>
                        <tr>
                            <td>depot: </td> <td> <input type="text" name="depot" ng-model="objCtrl.obj.depot" required/> 
                                <span ng-show="objForm.depot.$error.required" class="msg-val">depot is required.</span> </td>
                        </tr>
                        <tr>
                            <td>destination: </td> <td> <input type="text" name="destination" ng-model="objCtrl.obj.destination" required/> 
                                <span ng-show="objForm.destination.$error.required" class="msg-val">destination is required.</span> </td>
                        </tr>
                        <tr>
                            <td>distance: </td> <td> <input type="text" name="distance" ng-model="objCtrl.obj.distance" required/> 
                                <span ng-show="objForm.distance.$error.required" class="msg-val">distance is required.</span> </td>
                        </tr>
                        <tr>
                            <td>Ac-Charge: </td> <td> <input type="text" name="acCharge" ng-model="objCtrl.obj.acCharge" required/> 
                                <span ng-show="objForm.acCharge.$error.required" class="msg-val">Ac-Charge is required.</span> </td>
                        </tr>
                        <tr>
                            <td>Non-AcCharge: </td> <td> <input type="text" name="nonAcCharge" ng-model="objCtrl.obj.nonAcCharge" required/> 
                                <span ng-show="objForm.nonAcCharge.$error.required" class="msg-val">Non-AcCharge is required.</span> </td>
                        </tr>

                        <tr>
                            <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Route successfully added.</span>
                                <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Route already exists.</span> </td>
                        </tr>
                        <tr><td colspan="2">
                                <div ng-if="objCtrl.flag != 'edit'">
                                    <input  type="submit" ng-click="objCtrl.addObject()" value="Add Route"/> 
                                    <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                                </div>
                                <div ng-if="objCtrl.flag == 'edit'">
                                    <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Route"/> 	
                                    <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                                </div> </td>
                        </tr>
                        <tr>
                            <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Route successfully deleted.</span>
                        </tr>
                </center>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> <td>Bus Model</td>  <td>Employee Name</td> <th>route-No</th> <th>route-Name</th> <th>depot</th> <th>destination</th> <th>distance</th> <th>Ac-Charge</th> <th>Non-AcCharge</th> </tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.routeId"></span></td>
                    <td><span ng-bind="row.busInfo.busModel"></span></td>
                    <td><span ng-bind="row.employee.empName"></span></td>
                    <td><span ng-bind="row.routeNo"></span></td>
                    <td><span ng-bind="row.routeName"></span></td>
                    <td><span ng-bind="row.depot"></span></td>
                    <td><span ng-bind="row.destination"></span></td>
                    <td><span ng-bind="row.distance"></span></td>
                    <td><span ng-bind="row.acCharge"></span></td>
                    <td><span ng-bind="row.nonAcCharge"></span></td>

                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.routeId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.routeId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.routeId == objCtrl.updatedId" class="msg-success">Route successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/route_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 