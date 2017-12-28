(function() {
    'use strict';

    angular
        .module('<%=angularAppName%>')
        .factory('translationHandler', translationHandler);

    <%_ if (enableI18nRTL) { _%>
    translationHandler.$inject = ['$rootScope', '$window', '$state', '$translate', 'findLanguageRtlFromKeyFilter'];

    function translationHandler($rootScope, $window, $state, $translate, findLanguageRtlFromKeyFilter) {
    <%_ } else { _%>
    translationHandler.$inject = ['$rootScope', '$window', '$state', '$translate'];

    function translationHandler($rootScope, $window, $state, $translate) {
    <%_ } _%>
        return {
            initialize: initialize,
            updateTitle: updateTitle
        };

        function initialize() {
            // if the current translation changes, update the window title
            var translateChangeSuccess = $rootScope.$on('$translateChangeSuccess', function() {
                updateTitle();
                <%_ if (enableI18nRTL) { _%>
                updatePageDirection();
                <%_ } _%>
            });

            $rootScope.$on('$destroy', function () {
                if(angular.isDefined(translateChangeSuccess) && translateChangeSuccess !== null){
                    translateChangeSuccess();
                }
            });
        }

        <%_ if (enableI18nRTL) { _%>
        // Update language and direction in index.html, e.g. <html dir="ltr" or <html dir="rtl"
        function updatePageDirection() {
          var currentLang = $translate.proposedLanguage() || $translate.use();
          angular.element('html').attr('lang', currentLang);
          angular.element('html').attr('dir', isRTL(currentLang) ? 'rtl' : 'ltr');
        }

        // Returns true if passed language key is a Right-to-Left language key
        function isRTL(langKey) {
          return findLanguageRtlFromKeyFilter(langKey);
        }
        <%_ } _%>

        // update the window title using params in the following
        // precedence
        // 1. titleKey parameter
        // 2. $state.$current.data.pageTitle (current state page title)
        // 3. 'global.title'
        function updateTitle(titleKey) {
            if (!titleKey && $state.$current.data && $state.$current.data.pageTitle) {
                titleKey = $state.$current.data.pageTitle;
            }
            $translate(titleKey || 'global.title').then(function (title) {
                $window.document.title = title;
            });
        }
    }
})();
