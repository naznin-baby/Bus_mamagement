<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Faculty </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="ScheduleController as objCtrl">
            <h1> BusSchedule Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Schedule </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Schedule for ID: {{ objCtrl.obj.scheduleId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Bus Model</td>
                        <td>
                            <select ng-model="objCtrl.obj.busInfo" ng-options="x.busModel for x in models">
</select>
                        </td>
                        <td>Route Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.route" ng-options="y.routeName for y in nam">
</select>
                        </td>
                        
                         <td>Employee Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.employee" ng-options="y.empName for y in na">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Date-schedule: </td> <td><input type="text" name="dateSchdule" ng-model="objCtrl.obj.dateSchdule" required/> 
                            <span ng-show="objForm.dateSchdule.$error.required" class="msg-val">Date-Schedule is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Depart-Time: </td> <td><input type="text" name="departTime" ng-model="objCtrl.obj.departTime" required/> 
                            <span ng-show="objForm.departTime.$error.required" class="msg-val">Depart-Time is required.</span> </td>
                    </tr>
                    <tr>
                        <td>schedule-Start: </td> <td> <input type="text" name="scheduleStart" ng-model="objCtrl.obj.scheduleStart" required/> 
                            <span ng-show="objForm.scheduleStart.$error.required" class="msg-val">schedule-Start is required.</span> </td>
                    </tr>
                    <tr>
                        <td>depart-Place: </td> <td> <input type="text" name="departPlace" ng-model="objCtrl.obj.departPlace" required/> 
                            <span ng-show="objForm.departPlace.$error.required" class="msg-val">depart-Place is required.</span> </td>
                    </tr>


                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Schedule successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Schedule already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Schedule"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Schedule"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Schedule successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> 
                    <th>Bus Model</th> 
                    <th>Route Name</th> 
                    <th>Employee Name</th>
                    <th>Date-Schedule</th> 
                    <th>Depart-Time</th>
                    <th>schedule-Start</th>
                    <th>depart-Place</th></tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.scheduleId"></span></td>
                    <td><span ng-bind="row.busInfo.busModel"></span></td>
                     <td><span ng-bind="row.route.routeName"></span></td>
                      <td><span ng-bind="row.employee.empName"></span></td>
                    <td><span ng-bind="row.dateSchdule"></span></td>
                    <td><span ng-bind="row.departTime"></span></td>
                    <td><span ng-bind="row.scheduleStart"></span></td>
                    <td><span ng-bind="row.departPlace"></span></td>
                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.scheduleId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.scheduleId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.scheduleId == objCtrl.updatedId" class="msg-success">schedule successfully updated.</span> </td> 
                </tr>	
<!--                <tr ng-repeat="row in objCtrl.objArray2">
                    <td><span ng-bind="row.tspName"></span></td>
                    
                </tr>-->
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/schedule_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 