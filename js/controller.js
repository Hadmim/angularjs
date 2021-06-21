

var app = angular.module("myApp", ["ngRoute"]);
		app.config(function($routeProvider) {
			$routeProvider
			.when("/", {
				templateUrl : "home1.html"
			})
			.when("/formu", {
				templateUrl : "formulaire.html"
			})
			.when("/ecole", {
				templateUrl : "ecole.html"
			})
			.when("/enseignant", {
				
				templateUrl : "enseignant.html"
			})
             .when(undefined,{
				 templateUrl:"enseignant.html"
			 })
			

		});


app.controller('Ctrl', ['$scope', '$http', function ($scope, $http,$window) {
$http({
method: 'get',
url: 'getmodule.php'
}).then(function successCallback(response) {
// Store response data
$scope.module = response.data;
$http({
method: 'get',
url: 'getniveau.php'
}).then(function successCallback(response) {
// Store response data
$scope.niveau = response.data;
});

$scope.insertData=function(){      
$http({
    method: 'post',
     url: 'addEns.php',
     data:{
        nom:$scope.nom,
        prenom:$scope.prenom,
        tel:$scope.tel,
        numc:$scope.numc,
        email:$scope.email,
        ecoa:$scope.ecoa.id,
        tit:$scope.tit,
     }
   }).then(function successCallback(response) {
       var i=response.data.id
     
    angular.forEach($scope.checkedniveau, 
            function(item,key) {
        
                $http({
    method: 'post',
     url: 'addENV.php',
     data:{
        ide:i,
        idn:item.id,
    
     }
   }).then(function successCallback(response) {
           // module
          
         
             });
           
        });

        angular.forEach($scope.checkedmod, 
            function(item,key) {
        
                $http({
                method: 'post',
                url: 'addEM.php',
                data:{
                ide:i,
                idm:item.id,
    
            }
          }).then(function successCallback(response) {})
             alert("BIEN AJOUTER")
             });


      
    
}, function myError(response) {
    alert( response.statusText);
});
   
    }


    $scope.deleteData=function(ide){  
        
        $http({
                method: 'delete',
                url: 'delModE.php',
                data:{
                ide:ide,
               }
          }).then(function successCallback(response) {

            $http({
                method: 'delete',
                url: 'delNivE.php',
                data:{
                ide:ide,
               }
          }).then(function successCallback(response) {
            $http({
                method: 'delete',
                url: 'delEn.php',
                data:{
                ide:ide,
               }
          }).then(function successCallback(response) {
            
            //$window.location.href='/home1.html';
        //	'http://localhost/projet/index.html#!/enseignant'.reload();
        
        //$route.reload();
            

            

          })

          })
            
          })
             

 
}


});
$http({
method: 'get',
url: 'getecole.php'
}).then(function successCallback(response) {
// Store response data
$scope.ecole = response.data;
});

$http({
method: 'get',
url: 'getEns.php'
}).then(function successCallback(response) {
// Store response data

$scope.enseignants = response.data;

});


$scope.checkedniveau = [];
$scope.Checknev = function (nev) {
var idx = $scope.checkedniveau.indexOf(nev);
if (idx>-1) {
    
    $scope.checkedniveau .splice(idx, 1);
   
} else {
    
    $scope.checkedniveau.push(nev);
    
}
};

$scope.checkedmod= [];
$scope.Checkmod = function (mod) {
var idx = $scope.checkedmod.indexOf(mod);
if (idx>-1) {
    $scope.checkedmod.splice(idx, 1);
} else {
    $scope.checkedmod.push(mod);
   
}
};




}


]);



