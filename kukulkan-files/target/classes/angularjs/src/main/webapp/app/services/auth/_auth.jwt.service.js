(function() {
    'use strict';

    angular
        .module('<%=angularAppName%>')
        .factory('AuthServerProvider', AuthServerProvider);

    AuthServerProvider.$inject = ['$http', '$localStorage', '$sessionStorage', '$q'];

    function AuthServerProvider ($http, $localStorage, $sessionStorage, $q) {
        var service = {
            getToken: getToken,
            login: login,
            loginWithToken: loginWithToken,
            storeAuthenticationToken: storeAuthenticationToken,
            logout: logout
        };

        return service;

        function getToken () {
<%_ if (authenticationType === 'uaa') { _%>
            return null;
<% } else { %>
            return $localStorage.authenticationToken || $sessionStorage.authenticationToken;
<%_ } _%>
        }

        function login (credentials) {
<%_ if(authenticationType === 'uaa') { _%>
            var data = {
                username: credentials.username,
                password: credentials.password,
                rememberMe: credentials.rememberMe
            };

            return $http({
                url: '/auth/login',
                method: 'post',
                data: data
            });
<% } else { %>
            var data = {
                username: credentials.username,
                password: credentials.password,
                rememberMe: credentials.rememberMe
            };
            return $http.post('api/authenticate', data).success(authenticateSuccess);

            function authenticateSuccess (data, status, headers) {
                var bearerToken = headers('Authorization');
                if (angular.isDefined(bearerToken) && bearerToken.slice(0, 7) === 'Bearer ') {
                    var jwt = bearerToken.slice(7, bearerToken.length);
                    service.storeAuthenticationToken(jwt, credentials.rememberMe);
                    return jwt;
                }
            }
<%_ } _%>
        }

        function loginWithToken(jwt, rememberMe) {
            var deferred = $q.defer();

            if (angular.isDefined(jwt)) {
                this.storeAuthenticationToken(jwt, rememberMe);
                deferred.resolve(jwt);
            } else {
                deferred.reject();
            }

            return deferred.promise;
        }

        function storeAuthenticationToken(jwt, rememberMe) {
<%_ if(authenticationType !== 'uaa') { _%>
            if(rememberMe){
                $localStorage.authenticationToken = jwt;
            } else {
                $sessionStorage.authenticationToken = jwt;
            }
<%_ } _%>
        }

        function logout () {
<%_ if(authenticationType === 'uaa') { _%>
            return $http.post('auth/logout');
<% } else { %>
            delete $localStorage.authenticationToken;
            delete $sessionStorage.authenticationToken;
<%_ } _%>
        }
    }
})();
