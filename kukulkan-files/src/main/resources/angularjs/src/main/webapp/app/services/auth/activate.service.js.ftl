(function() {
    'use strict';

    angular
        .module('<%=angularAppName%>')
        .factory('Activate', Activate);

    Activate.$inject = ['$resource'];

    function Activate ($resource) {
        var service = $resource('<%- apiUaaPath %>api/activate', {}, {
            'get': { method: 'GET', params: {}, isArray: false}
        });

        return service;
    }
})();