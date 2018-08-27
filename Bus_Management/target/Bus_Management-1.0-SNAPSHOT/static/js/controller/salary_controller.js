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
app.factory('SalaryType', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/salarytype/salarytype/:salaryTypeId', {salaryTypeId: '@salaryTypeId'},
                {
                    updateEmployee: {method: 'PUT'}
                }
        );
    }]);
app.factory('Salary', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/salary/salary/:salaryId', {salaryId: '@salaryId'},
                {
                    updateSalary: {method: 'PUT'}
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

app.controller('SalaryController', ['$scope', 'Salary', 'EmpCategory', 'Employee', 'SalaryType', function ($scope, Salary, EmpCategory, Employee, SalaryType) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.objArray4 = [];
        ob.obj = new Salary();
        ob.obj2 = new EmpCategory();
        ob.obj3 = new Employee();
        ob.obj4 = new SalaryType();
        ob.fetchAllObject = function () {
            ob.objArray = Salary.query();
            $scope.mod = ob.objArray2 = EmpCategory.query();
            $scope.em = ob.objArray3 = Employee.query();
            $scope.st = ob.objArray4 = SalaryType.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.mod + "hello");
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
            ob.obj = Salary.get({salaryId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateSalary(function (object) {
                    console.log(object);
                    ob.updatedId = object.salaryId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = Salary.delete({salaryId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new Salary();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new Salary();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);


