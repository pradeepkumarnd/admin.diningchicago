'use strict';

MetronicApp.controller('DashboardController', function($rootScope, $scope, $http, $timeout) {
    $scope.$on('$viewContentLoaded', function() {
        // initialize core components
        Metronic.initAjax();
        console.log ("Metronic.initAjax()");
    });

    // set sidebar closed and body solid layout mode
    $rootScope.settings.layout.pageBodySolid = true;
    $rootScope.settings.layout.pageSidebarClosed = false;

    // $rootScope.$on('$stateChangeStart',function(event, toState, toParams, fromState, fromParams){
    //   console.log('$stateChangeStart to '+toState.to+'- fired when the transition begins. toState,toParams : \n',toState, toParams);
    // });
    // $rootScope.$on('$stateChangeError',function(event, toState, toParams, fromState, fromParams){
    //   console.log('$stateChangeError - fired when an error occurs during transition.');
    //   console.log(arguments);
    // });
    // $rootScope.$on('$stateChangeSuccess',function(event, toState, toParams, fromState, fromParams){
    //   console.log('$stateChangeSuccess to '+toState.name+'- fired once the state transition is complete.');
    // });
    // // $rootScope.$on('$viewContentLoading',function(event, viewConfig){
    // //   // runs on individual scopes, so putting it in "run" doesn't work.
    // //   console.log('$viewContentLoading - view begins loading - dom not rendered',viewConfig);
    // // });
    // $rootScope.$on('$viewContentLoaded',function(event){
    //   console.log('$viewContentLoaded - fired after dom rendered',event);
    // });
    // $rootScope.$on('$stateNotFound',function(event, unfoundState, fromState, fromParams){
    //   console.log('$stateNotFound '+unfoundState.to+'  - fired when a state cannot be found by its name.');
    //   console.log(unfoundState, fromState, fromParams);
    // });
    // $rootScope.$on('$routeChangeError', function(current, previous, rejection) {
    //     console.log("routeChangeError", currrent, previous, rejection);
    // });

    // $rootScope.$on('$routeChangeStart', function(next, current) {
    //     console.log("routeChangeStart");
    //     console.dir(next);
    //     console.dir(current);
    // });

    // $rootScope.$on('$routeChangeSuccess', function(current, previous) {
    //     console.log("routeChangeSuccess");
    //     console.dir(current);
    //     console.dir(previous);
    // });

    // $rootScope.$on('$routeUpdate', function(rootScope) {
    //     console.log("routeUpdate", rootScope);
    // });
});
