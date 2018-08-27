'use strict';

app.factory('BusInfo', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/businfo/businfo/:busId', {busId: '@busId'},
                {
                    updateBusInfo: {method: 'PUT'}
                }
        );
    }]);
app.factory('Route', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/route/route/:routeId', {routeId: '@routeId'},
                {
                    updateRoute: {method: 'PUT'}
                }
        );
    }]);
app.factory('Employee', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/employee/employee/:empId', {empId: '@empId'},
                {
                    updateEmployee: {method: 'PUT'}
                }
        );
    }]);
app.factory('BusSchedule', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/schedule/schedulelist/:scheduleId', {scheduleId: '@scheduleId'},
                {
                    updateObject: {method: 'PUT'}
                }
        );
    }]);
//var app = angular.module('myApp.services', ['ngResource']);
//app.factory('TspFaculty', ['$resource', function ($resource) {
//        return {
//            faculty: $resource('http://localhost:8080/ProjectStarter/faculty/facultylist/:facultyId', {facultyId: '@facultyId'}, {
//                query: {method: 'GET', params: {}, isArray: false},
//                updateFaculty: {method: 'PUT'}
//            }),
//            tsp: $resource('http://localhost:8080/ProjectStarter/tsp/tsplist/:tspId', {tspId: '@tspId'}, {
//                query: {method: 'GET', params: {}, isArray: false},
//                updateTsp: {method: 'PUT'}
//            })
//        };
//    }]);

//  https://stackoverflow.com/questions/17160771/angularjs-a-service-that-serves-multiple-resource-urls-data-sources

app.controller('ScheduleController', ['$scope', 'BusSchedule', 'BusInfo', 'Route', 'Employee', function ($scope, BusSchedule, BusInfo, Route, Employee) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.objArray4 = [];
        ob.obj = new BusSchedule();
        ob.obj2 = new BusInfo();
        ob.obj3 = new Route();
        ob.obj4 = new Employee();
        ob.fetchAllObject = function () {
            ob.objArray = BusSchedule.query();
            $scope.models = ob.objArray2 = BusInfo.query();
            $scope.nam = ob.objArray3 = Route.query();
            $scope.na = ob.objArray4 = Employee.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.models + "hello");
        ob.fetchAllObject();
        ob.addObject = function () {
            console.log('Inside save');
            if ($scope.objForm.$valid) {
                //ob.obj.tspInfo= ob.obj2;
                ob.obj.$save(function (object) {
                    console.log(object);
                    ob.flag = 'created';
                    ob.reset();
                    ob.fetchAllObject();
                },
                        function (err) {
                            console.log(err.status);
                            ob.flag = 'failed';
                        }
                );
            }
        };
        ob.editObject = function (id) {
            console.log('Inside edit');
            ob.obj = BusSchedule.get({scheduleId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateObject(function (object) {
                    console.log(object);
                    ob.updatedId = object.scheduleId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = BusSchedule.delete({scheduleId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new BusSchedule();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new BusSchedule();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);


