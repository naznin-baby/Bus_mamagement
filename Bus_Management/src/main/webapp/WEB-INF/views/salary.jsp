<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Salary </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="SalaryController as objCtrl">
            <h1> Salary Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Salary </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Salary for ID: {{ objCtrl.obj.salaryId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Emp Category</td>
                        <td>
                            <select ng-model="objCtrl.obj.empCategory" ng-options="x.ecid for x in mod">
</select>
                        </td>
                        <td>Emp Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.employee" ng-options="y.empName for y in em">
</select>
                        </td>
                        
                         <td>Salary type</td>
                        <td>
                            <select ng-model="objCtrl.obj.salaryType" ng-options="z.salaryType for z in st">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Basic: </td> <td><input type="text" name="basic" ng-model="objCtrl.obj.basic" required/> 
                            <span ng-show="objForm.basic.$error.required" class="msg-val">Basic: is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Num Of Trip: </td> <td><input type="text" name="noOfTrip" ng-model="objCtrl.obj.noOfTrip" required/> 
                            <span ng-show="objForm.noOfTrip.$error.required" class="msg-val">Num Of Trip is required.</span> </td>
                    </tr>
                    <tr>
                        <td>festival Fee: </td> <td> <input type="text" name="festivalFee" ng-model="objCtrl.obj.festivalFee" required/> 
                            <span ng-show="objForm.festivalFee.$error.required" class="msg-val">festival Fee is required.</span> </td>
                    </tr>
                    <tr>
                        <td>insurance-Fee: </td> <td> <input type="text" name="insuranceFee" ng-model="objCtrl.obj.insuranceFee" required/> 
                            <span ng-show="objForm.insuranceFee.$error.required" class="msg-val">insurance-Fee is required.</span> </td>
                    </tr>
                      <tr>
                        <td>total Salary: </td> <td> <input type="text" name="totalSalary" ng-model="objCtrl.obj.totalSalary" required/> 
                            <span ng-show="objForm.totalSalary.$error.required" class="msg-val">total Salary is required.</span> </td>
                    </tr>


                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Salary successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Salary already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Salary"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Salary"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Salary successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> 
                    <th>Emp Category</th> 
                    <th>Emp Name</th> 
                    <th>Salary typee</th>
                    <th>Basic</th> 
                    <th>Num Of Trip</th>
                    <th>festival Fee</th>
                    <th>insurance-Fee</th>
                <th>total Salary</th></tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.salaryId"></span></td>
                    <td><span ng-bind="row.empCategory.ecid"></span></td>
                     <td><span ng-bind="row.employee.empName"></span></td>
                      <td><span ng-bind="row.salaryType.salaryType"></span></td>
                    <td><span ng-bind="row.basic"></span></td>
                    <td><span ng-bind="row.noOfTrip"></span></td>
                    <td><span ng-bind="row.festivalFee"></span></td>
                    <td><span ng-bind="row.insuranceFee"></span></td>
                    <td><span ng-bind="row.totalSalary"></span></td>
                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.salaryId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.salaryId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.salaryId == objCtrl.updatedId" class="msg-success">schedule successfully updated.</span> </td> 
                </tr>	
<!--                <tr ng-repeat="row in objCtrl.objArray2">
                    <td><span ng-bind="row.tspName"></span></td>
                    
                </tr>-->
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/salary_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 