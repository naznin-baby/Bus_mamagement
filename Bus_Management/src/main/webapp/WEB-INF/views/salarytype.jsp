<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title>Salary Type </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="SalaryTypeController as objCtrl">
            <center>  <h1> Salary Type Info </h1></center>
            <form name="objForm" method="POST">
                <center>
                    <table>
                        <tr><td colspan="2">
                                <div ng-if="objCtrl.flag != 'edit'">
                                    <h3> Add New Salary Type </h3> 
                                </div>
                                <div ng-if="objCtrl.flag == 'edit'">
                                    <h3> Update Salary Type for ID: {{ objCtrl.obj.salaryTypeId}} </h3> 
                                </div> </td>
                        </tr>
                        
                        <tr>
                            <td>salary Type: </td> <td> <input type="text" name="salaryType" ng-model="objCtrl.obj.salaryType" required/> 
                                <span ng-show="objForm.salaryType.$error.required" class="msg-val">salary Type is required.</span> </td>
                        </tr>
                       

                        <tr>
                            <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">salary Type successfully added.</span>
                                <span ng-if="objCtrl.flag == 'failed'" class="msg-val">salary Type already exists.</span> </td>
                        </tr>
                        <tr><td colspan="2">
                                <div ng-if="objCtrl.flag != 'edit'">
                                    <input  type="submit" ng-click="objCtrl.addObject()" value="Add salary Type"/> 
                                    <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                                </div>
                                <div ng-if="objCtrl.flag == 'edit'">
                                    <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update salary Type"/> 	
                                    <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                                </div> </td>
                        </tr>
                        <tr>
                            <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">salary Type successfully deleted.</span>
                        </tr>
                </center>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> <td>salary Type</td>   </tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.salaryTypeId"></span></td>
                   
                    <td><span ng-bind="row.salaryType"></span></td>
                   

                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.salaryTypeId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.salaryTypeId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.salaryTypeId == objCtrl.updatedId" class="msg-success">salary Type successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/salary_type_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 