'use strict';

app.factory('Booking', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/booking/booking/:bookId', {bookId: '@bookId'},
                {
                    updateBooking: {method: 'PUT'}
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

app.factory('Passenger', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/Bus_Management/passenger/passenger/:passId', {passId: '@passId'},
	{
		updatePassenger: {method: 'PUT'}
	}
    );
}]);

app.factory('BookingSeat', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/Bus_Management/bookingseat/bookingseat/:bookSeatId', {bookSeatId: '@bookSeatId'},
                {
                    updateBookingSeat: {method: 'PUT'}
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

app.controller('BookingSeatController', ['$scope', 'BookingSeat', 'Booking','BusInfo','Passenger',  function ($scope, BookingSeat, Booking,BusInfo,Passenger) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
       ob.objArray3 = [];
        ob.objArray4 = [];
        ob.obj = new BookingSeat();
        ob.obj2 = new Booking();
         ob.obj3 = new BusInfo();
        ob.obj4 = new Passenger();
        ob.fetchAllObject = function () {
            ob.objArray = BookingSeat.query();
            $scope.id2 = ob.objArray2 = Booking.query();
             $scope.in = ob.objArray3 = BusInfo.query();
              $scope.pa = ob.objArray4 = Passenger.query();
           
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
            ob.obj = BookingSeat.get({bookSeatId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateBookingSeat(function (object) {
                    console.log(object);
                    ob.updatedId = object.bookSeatId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = BookingSeat.delete({bookSeatId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new BookingSeat();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new BookingSeat();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);





