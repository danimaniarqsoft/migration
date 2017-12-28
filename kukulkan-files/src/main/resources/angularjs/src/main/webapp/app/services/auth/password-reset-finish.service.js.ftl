(function() {
    'use strict';

    angular
        .module('<%=angularAppName%>')
        .factory('PasswordResetFinish', PasswordResetFinish);

    PasswordResetFinish.$inject = ['$resource'];

    function PasswordResetFinish($resource) {
        var service = $resource('<%- apiUaaPath %>api/account/reset-password/finish', {}, {});

        return service;
    }
})();
