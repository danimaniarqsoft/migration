(function () {
    'use strict';

    angular
        .module('<%=angularAppName%>')
        .factory('Register', Register);

    Register.$inject = ['$resource'];

    function Register ($resource) {
        return $resource('<%- apiUaaPath %>api/register', {}, {});
    }
})();
