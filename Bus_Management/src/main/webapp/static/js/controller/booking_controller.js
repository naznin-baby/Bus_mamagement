'use strict';

app.factory('Passenger', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/passenger/passenger/:passId', {passId: '@passId'},
                {
                    updatePassenger: {method: 'PUT'}
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
app.factory('RouteCounter', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/routecounter/routecounter/:counterId', {counterId: '@counterId'},
                {
                    updateRouteCounter: {method: 'PUT'}
                }
        );
    }]);

app.factory('BusInfo', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/Bus_Management/businfo/businfo/:busId', {busId: '@busId'},
	{
		updateBus: {method: 'PUT'}
	}
    );
}]);

app.factory('Booking', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/booking/booking/:bookId', {bookId: '@bookId'},
                {
                    updateBooking: {method: 'PUT'}
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

app.controller('BookingController', ['$scope', 'Booking', 'Passenger', 'BusSchedule', 'RouteCounter','BusInfo', function ($scope, Booking,Passenger, BusSchedule, RouteCounter,BusInfo) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.objArray4 = [];
        ob.obj = new Booking();
        ob.obj2 = new Passenger();
        ob.obj3 = new BusSchedule();
        ob.obj4 = new RouteCounter();
         ob.obj5 = new BusInfo();
        ob.fetchAllObject = function () {
            ob.objArray = Booking.query();
            $scope.models = ob.objArray2 = Passenger.query();
            $scope.place = ob.objArray3 = BusSchedule.query();
            $scope.na = ob.objArray4 = RouteCounter.query();
            $scope.ba = ob.objArray5 = BusInfo.query();
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
            ob.obj = Booking.get({bookId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateBooking(function (object) {
                    console.log(object);
                    ob.updatedId = object.bookId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = Booking.delete({bookId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new Booking();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new Booking();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);


