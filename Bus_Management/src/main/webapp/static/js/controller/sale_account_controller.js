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
app.factory('BusSchedule', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/schedule/schedulelist/:scheduleId', {scheduleId: '@scheduleId'},
                {
                    updateObject: {method: 'PUT'}
                }
        );
    }]);
app.factory('SaleAccount', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/sealaccount/sealaccount/:id', {id: '@id'},
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

app.controller('SaleAccountController', ['$scope', 'BusInfo', 'Route', 'BusSchedule', 'SaleAccount', function ($scope, BusInfo, Route, BusSchedule, SaleAccount) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.objArray4 = [];
        ob.obj = new SaleAccount();
        ob.obj2 = new BusInfo();
        ob.obj3 = new Route();
        ob.obj4 = new BusSchedule();
        ob.fetchAllObject = function () {
            ob.objArray = SaleAccount.query();
            $scope.mo = ob.objArray2 = BusInfo.query();
            $scope.rn = ob.objArray3 = Route.query();
            $scope.ba = ob.objArray4 = BusSchedule.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.mo + "hello");
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
            ob.obj = SaleAccount.get({id: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateObject(function (object) {
                    console.log(object);
                    ob.updatedId = object.id;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = SaleAccount.delete({id: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new SaleAccount();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new SaleAccount();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);


