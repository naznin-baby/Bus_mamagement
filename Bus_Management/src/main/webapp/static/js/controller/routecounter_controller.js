'use strict';

app.factory('Route', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/route/route/:routeId', {routeId: '@routeId'},
                {
                    updateRoute: {method: 'PUT'}
                }
        );
    }]);

app.factory('RouteCounter', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/routecounter/routecounter/:counterId', {counterId: '@counterId'},
                {
                    updateRouteCounter: {method: 'PUT'}
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

app.controller('RouteCounterController', ['$scope', 'Route', 'RouteCounter',  function ($scope, Route, RouteCounter) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
       
        ob.obj = new RouteCounter();
        ob.obj2 = new Route();
        
        ob.fetchAllObject = function () {
            ob.objArray = RouteCounter.query();
            $scope.rout = ob.objArray2 = Route.query();
           
        };
        //$scope.names = ob.objArray2;
        console.log($scope.rout + "hello");
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
            ob.obj = RouteCounter.get({counterId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateRouteCounter(function (object) {
                    console.log(object);
                    ob.updatedId = object.counterId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = RouteCounter.delete({counterId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new RouteCounter();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new RouteCounter();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);





