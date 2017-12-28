(function() {
    'use strict';

    angular
        .module('<%=angularAppName%>')
        .factory('PasswordResetInit', PasswordResetInit);

    PasswordResetInit.$inject = ['$resource'];

    function PasswordResetInit($resource) {
        var service = $resource('<%- apiUaaPath %>api/account/reset-password/init', {}, {});

        return service;
    }
})();
