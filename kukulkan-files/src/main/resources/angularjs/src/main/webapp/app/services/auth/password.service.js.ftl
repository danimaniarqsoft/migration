(function() {
    'use strict';

    angular
        .module('<%=angularAppName%>')
        .factory('Password', Password);

    Password.$inject = ['$resource'];

    function Password($resource) {
        var service = $resource('<%- apiUaaPath %>api/account/change-password', {}, {});

        return service;
    }
})();
