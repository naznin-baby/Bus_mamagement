<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Seal Account </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="SaleAccountController as objCtrl">
            <h1> Seal Account Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Seal Account </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Seal Account for ID: {{ objCtrl.obj.id}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Bus Model</td>
                        <td>
                            <select ng-model="objCtrl.obj.busInfo" ng-options="x.busModel for x in mo">
</select>
                        </td>
                        <td>Route Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.route" ng-options="y.routeName for y in rn">
</select>
                        </td>
                        
                         <td>Depart Time</td>
                        <td>
                            <select ng-model="objCtrl.obj.busSchedule" ng-options="z.departTime for z in ba">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Amount Of Ticket: </td> <td><input type="text" name="amountOfTicket" ng-model="objCtrl.obj.amountOfTicket" required/> 
                            <span ng-show="objForm.amountOfTicket.$error.required" class="msg-val">Amount Of Ticket is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Ticket Price: </td> <td><input type="text" name="ticketPrice" ng-model="objCtrl.obj.ticketPrice" required/> 
                            <span ng-show="objForm.ticketPrice.$error.required" class="msg-val">Ticket Price is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Total Price: </td> <td> <input type="text" name="totalPrice" ng-model="objCtrl.obj.totalPrice" required/> 
                            <span ng-show="objForm.totalPrice.$error.required" class="msg-val">Total Price is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Sale Date: </td> <td> <input type="date" name="saleDate" ng-model="objCtrl.obj.saleDate" required/> 
                            <span ng-show="objForm.saleDate.$error.required" class="msg-val">Sale Date is required.</span> </td>
                    </tr>


                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Seal Account successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Seal Account already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Seal Account"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Seal Account"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Seal Account successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> 
                    <th>Bus Model</th> 
                    <th>Route Name</th> 
                    <th>Depart Time</th>
                    <th>Amount Of Ticket</th> 
                    <th>Ticket Price</th>
                    <th>Total Price</th>
                    <th>Sale Date</th></tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.id"></span></td>
                    <td><span ng-bind="row.busInfo.busModel"></span></td>
                     <td><span ng-bind="row.route.routeName"></span></td>
                      <td><span ng-bind="row.busSchedule.departTime"></span></td>
                    <td><span ng-bind="row.amountOfTicket"></span></td>
                    <td><span ng-bind="row.ticketPrice"></span></td>
                    <td><span ng-bind="row.totalPrice"></span></td>
                    <td><span ng-bind="row.saleDate"></span></td>
                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.id)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.id)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.id == objCtrl.updatedId" class="msg-success">Seal Account successfully updated.</span> </td> 
                </tr>	
<!--                <tr ng-repeat="row in objCtrl.objArray2">
                    <td><span ng-bind="row.tspName"></span></td>
                    
                </tr>-->
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/sale_account_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 