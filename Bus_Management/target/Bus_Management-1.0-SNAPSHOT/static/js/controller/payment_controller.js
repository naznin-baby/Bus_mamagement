'use strict';

app.factory('Passenger', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/passenger/passenger/:passId', {passId: '@passId'},
                {
                    updatePassenger: {method: 'PUT'}
                }
        );
    }]);

app.factory('Payment', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/payment/payment/:payId', {payId: '@payId'},
                {
                    updatePayment: {method: 'PUT'}
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

app.controller('PaymentController', ['$scope', 'Payment', 'Passenger',  function ($scope, Payment, Passenger) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
       
       ob.obj = new Payment();
//        ob.obj2 = new Passenger();
//        ob.priceOfTicket=0;
//        ob.numberOfTicket=0;
//        ob.totalFair=ob.priceOfTicket*ob.numberOfTicket;
//        ob.obj = {'priceOfTicket':ob.priceOfTicket,
//            'numberOfTicket':ob.numberOfTicket,
//            'totalFair':ob.totalFair};
//        
//        ob.totalFair=function(){
//            console.log('key up')
//            ob.totalFair=ob.priceOfTicket*ob.numberOfTicket;
//            ob.obj = {'priceOfTicket':ob.priceOfTicket,
//            'numberOfTicket':ob.numberOfTicket,
//            'totalFair':ob.totalFair};
        
        
        ob.obj2 = new Passenger();
        
        ob.fetchAllObject = function () {
            ob.objArray = Payment.query();
            $scope.name = ob.objArray2 = Passenger.query();
           
        };
        //$scope.names = ob.objArray2;
        console.log($scope.name + "hello");
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
            ob.obj = Payment.get({payId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updatePayment(function (object) {
                    console.log(object);
                    ob.updatedId = object.payId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = Payment.delete({payId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new Payment();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new Payment();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);




