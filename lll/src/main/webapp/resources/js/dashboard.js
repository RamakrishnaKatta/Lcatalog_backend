
app.controller('dashboardStats',function($scope,$http){
  		$http.get(getApi(Urls.GET_DASHBOARD_STATS))
	    .then(function(response) {
	    	console.log(response);
	        $scope.vendorCount = response.data.resp.vendors;
	        $scope.articleCount = response.data.resp.articles;
	        $scope.userCount = response.data.resp.users;
	        $scope.requestCount = response.data.resp.vendorReqs;
	    });
})


