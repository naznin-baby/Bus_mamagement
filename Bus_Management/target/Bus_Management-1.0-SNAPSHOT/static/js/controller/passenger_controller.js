'use strict';

app.factory('Passenger', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/Bus_Management/passenger/passenger/:passId', {passId: '@passId'},
	{
		updatePassenger: {method: 'PUT'}
	}
    );
}]);
//angular.module('myApp.services', ['ngResource']).
//  factory("geoProvider", function($resource) {
//    return {
//      states: $resource('../data/states.json', {}, {
//        query: { method: 'GET', params: {}, isArray: false }
//      }),
//      countries: $resource('../data/countries.json', {}, {
//        query: { method: 'GET', params: {}, isArray: false }
//      })
//    };
//  }); https://stackoverflow.com/questions/17160771/angularjs-a-service-that-serves-multiple-resource-urls-data-sources

app.controller('PassengerController', ['$scope', 'Passenger', function($scope, Passenger) {
    var ob = this;
    ob.objArray=[];
    ob.obj = new Passenger(); 
    ob.fetchAllObject = function(){
        ob.objArray = Passenger.query();
    };
    ob.fetchAllObject();
    ob.addObject = function(){
	console.log('Inside save');
	if($scope.objForm.$valid) {
	  ob.obj.$save(function(object){
	     console.log(object); 
	     ob.flag= 'created';	
	     ob.reset();	
	     ob.fetchAllObject();
	  },
	  function(err){
	     console.log(err.status);
	     ob.flag='failed';
	  }
          );
        }
    }; 
    ob.editObject = function(id){
	    console.log('Inside edit');
        ob.obj = Passenger.get({ passId: id}, function() {
	       ob.flag = 'edit'; 
	    });
    };    
    ob.updateObjectDetail = function(){
	console.log('Inside update');
	if($scope.objForm.$valid) {
    	   ob.obj.$updatePassenger(function(object){
    		console.log(object); 
		ob.updatedId = object.passId;
				ob.reset();
		ob.flag = 'updated'; 
    		ob.fetchAllObject();
           });
	}
    };	
    ob.deleteObject = function(id){
	    console.log('Inside delete');
	    ob.obj = Passenger.delete({ passId: id}, function() {
		ob.reset();  
		ob.flag = 'deleted';
    		ob.fetchAllObject(); 
	    });
    };		
    ob.reset = function(){
    	ob.obj = new Passenger();
        $scope.objForm.$setPristine();
    };	
    ob.cancelUpdate = function(id){
	    ob.obj = new Passenger();
	    ob.flag= '';	
   	    ob.fetchAllObject();
    };    
}]); 




