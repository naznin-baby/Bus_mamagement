'use strict';

app.factory('EmpCategory', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/empcategory/empcategory/:empCatId', {empCatId: '@empCatId'},
                {
                    updateEmpCategory: {method: 'PUT'}
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

app.controller('EmployeeController', ['$scope', 'EmpCategory', 'Employee',  function ($scope, EmpCategory, Employee) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
       
        ob.obj = new Employee();
        ob.obj2 = new EmpCategory();
        
        ob.fetchAllObject = function () {
            ob.objArray = Employee.query();
            $scope.id2 = ob.objArray2 = EmpCategory.query();
           
        };
        //$scope.names = ob.objArray2;
        console.log($scope.id2 + "hello");
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
            ob.obj = Employee.get({empId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateEmployee(function (object) {
                    console.log(object);
                    ob.updatedId = object.empId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = Employee.delete({empId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new Employee();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new Employee();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);





