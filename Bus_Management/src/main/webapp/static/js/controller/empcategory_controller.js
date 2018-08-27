'use strict';

app.factory('EmpCategory', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/Bus_Management/empcategory/empcategory/:empCatId', {empCatId: '@empCatId'},
	{
		updateEmpCategory: {method: 'PUT'}
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

app.controller('EmpCategoryController', ['$scope', 'EmpCategory', function($scope, EmpCategory) {
    var ob = this;
    ob.objArray=[];
    ob.obj = new EmpCategory(); 
    ob.fetchAllObject = function(){
        ob.objArray = EmpCategory.query();
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
        ob.obj = EmpCategory.get({ empCatId: id}, function() {
	       ob.flag = 'edit'; 
	    });
    };    
    ob.updateObjectDetail = function(){
	console.log('Inside update');
	if($scope.objForm.$valid) {
    	   ob.obj.$updateEmpCategory(function(object){
    		console.log(object); 
		ob.updatedId = object.empCatId;
				ob.reset();
		ob.flag = 'updated'; 
    		ob.fetchAllObject();
           });
	}
    };	
    ob.deleteObject = function(id){
	    console.log('Inside delete');
	    ob.obj = EmpCategory.delete({ empCatId: id}, function() {
		ob.reset();  
		ob.flag = 'deleted';
    		ob.fetchAllObject(); 
	    });
    };		
    ob.reset = function(){
    	ob.obj = new EmpCategory();
        $scope.objForm.$setPristine();
    };	
    ob.cancelUpdate = function(id){
	    ob.obj = new EmpCategory();
	    ob.flag= '';	
   	    ob.fetchAllObject();
    };    
}]); 


