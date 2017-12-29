{
    "id" : "jhipster",
    "realm" : "jhipster",
    "notBefore" : 0,
    "revokeRefreshToken" : false,
    "accessTokenLifespan" : 300,
    "accessTokenLifespanForImplicitFlow" : 900,
    "ssoSessionIdleTimeout" : 1800,
    "ssoSessionMaxLifespan" : 36000,
    "offlineSessionIdleTimeout" : 2592000,
    "accessCodeLifespan" : 60,
    "accessCodeLifespanUserAction" : 300,
    "accessCodeLifespanLogin" : 1800,
    "actionTokenGeneratedByAdminLifespan" : 43200,
    "actionTokenGeneratedByUserLifespan" : 300,
    "enabled" : true,
    "sslRequired" : "external",
    "registrationAllowed" : false,
    "registrationEmailAsUsername" : false,
    "rememberMe" : false,
    "verifyEmail" : false,
    "loginWithEmailAllowed" : true,
    "duplicateEmailsAllowed" : false,
    "resetPasswordAllowed" : false,
    "editUsernameAllowed" : false,
    "bruteForceProtected" : false,
    "permanentLockout" : false,
    "maxFailureWaitSeconds" : 900,
    "minimumQuickLoginWaitSeconds" : 60,
    "waitIncrementSeconds" : 60,
    "quickLoginCheckMilliSeconds" : 1000,
    "maxDeltaTimeSeconds" : 43200,
    "failureFactor" : 30,
    "roles" : {
        "realm" : [ {
            "id" : "fe2f6edb-39f3-4d04-a596-4557cf46bae1",
            "name" : "ROLE_ADMIN",
            "scopeParamRequired" : false,
            "composite" : false,
            "clientRole" : false,
            "containerId" : "jhipster"
        }, {
            "id" : "76c3b939-5a8e-491c-b71b-f35300dd469f",
            "name" : "ROLE_USER",
            "scopeParamRequired" : false,
            "composite" : false,
            "clientRole" : false,
            "containerId" : "jhipster"
        }, {
            "id" : "49011634-ad5a-4dae-a772-8ec0018a9174",
            "name" : "offline_access",
            "description" : "${role_offline-access}",
            "scopeParamRequired" : true,
            "composite" : false,
            "clientRole" : false,
            "containerId" : "jhipster"
        }, {
            "id" : "0b7bc7d5-67d2-4ee4-8ad3-6b07bb21240a",
            "name" : "uma_authorization",
            "description" : "${role_uma_authorization}",
            "scopeParamRequired" : false,
            "composite" : false,
            "clientRole" : false,
            "containerId" : "jhipster"
        } ],
        "client" : {
            "internal" : [ {
                "id" : "2692bdb6-d5f1-4414-8e1a-0d1338ec8762",
                "name" : "uma_protection",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "2828e4a9-edde-45fa-aad9-855f53e38f58"
            } ],
            "realm-management" : [ {
                "id" : "20865ba8-8818-4967-b83c-63b109194f62",
                "name" : "view-users",
                "description" : "${role_view-users}",
                "scopeParamRequired" : false,
                "composite" : true,
                "composites" : {
                    "client" : {
                        "realm-management" : [ "query-groups", "query-users" ]
                    }
                },
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "26f2a111-0a44-4a17-a8a4-d7d1812a9a77",
                "name" : "manage-events",
                "description" : "${role_manage-events}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "6012a8c4-71b3-4009-8710-4fdfddc8df23",
                "name" : "view-clients",
                "description" : "${role_view-clients}",
                "scopeParamRequired" : false,
                "composite" : true,
                "composites" : {
                    "client" : {
                        "realm-management" : [ "query-clients" ]
                    }
                },
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "1abf6ecd-4231-4ff3-a094-24f7a8608208",
                "name" : "realm-admin",
                "description" : "${role_realm-admin}",
                "scopeParamRequired" : false,
                "composite" : true,
                "composites" : {
                    "client" : {
                        "realm-management" : [ "view-users", "manage-events", "view-clients", "view-authorization", "query-clients", "view-realm", "view-identity-providers", "query-users", "manage-identity-providers", "view-events", "manage-clients", "query-groups", "manage-realm", "manage-authorization", "impersonation", "manage-users", "query-realms", "create-client" ]
                    }
                },
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "8086f36c-8a3b-4485-81c0-5c2bd31a399d",
                "name" : "view-authorization",
                "description" : "${role_view-authorization}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "35b28268-2b5a-40c9-a7dc-9ffe1e9b2cb0",
                "name" : "query-clients",
                "description" : "${role_query-clients}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "c9b5d7d4-363b-4632-9d8a-ab2f4c1b2c2e",
                "name" : "view-realm",
                "description" : "${role_view-realm}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "b227e628-307f-4780-b769-7e21c5c3b3e5",
                "name" : "view-identity-providers",
                "description" : "${role_view-identity-providers}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "97de52f2-19d4-4ba1-8d0a-19a9a2af3bdb",
                "name" : "query-users",
                "description" : "${role_query-users}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "6ae171ac-41e5-457c-9704-43e278a92c60",
                "name" : "manage-identity-providers",
                "description" : "${role_manage-identity-providers}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "4a7d9c26-4af6-4f57-85b2-13134ce7a487",
                "name" : "view-events",
                "description" : "${role_view-events}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "ad5c3def-b97d-4dab-8336-621c2fd0ca14",
                "name" : "manage-clients",
                "description" : "${role_manage-clients}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "ff06f1de-7001-428c-b3de-307cb0dd7660",
                "name" : "query-groups",
                "description" : "${role_query-groups}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "d5072ef3-eb44-46fa-8bdb-39184b72f1bd",
                "name" : "manage-realm",
                "description" : "${role_manage-realm}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "4708de9e-fe47-497c-97d6-8011dbba06e6",
                "name" : "manage-authorization",
                "description" : "${role_manage-authorization}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "b0897167-2536-4630-aedb-062e7647d33e",
                "name" : "impersonation",
                "description" : "${role_impersonation}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "cbf7bd8a-973b-4bc0-a30e-e16ef81af86f",
                "name" : "manage-users",
                "description" : "${role_manage-users}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "089c3445-d59f-4fe1-be7c-e2f61a19e1bb",
                "name" : "query-realms",
                "description" : "${role_query-realms}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            }, {
                "id" : "d7416375-6bd8-4464-81c3-7625428056f1",
                "name" : "create-client",
                "description" : "${role_create-client}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d"
            } ],
            "security-admin-console" : [ ],
            "web_app" : [ ],
            "admin-cli" : [ ],
            "broker" : [ {
                "id" : "7f19082f-2046-4c1b-b52c-ecb29a65f10b",
                "name" : "read-token",
                "description" : "${role_read-token}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "b1c17dac-42d4-43c2-96bc-53287c173deb"
            } ],
            "account" : [ {
                "id" : "8e9a64a0-3d47-4d52-b14a-83bd2a956c34",
                "name" : "view-profile",
                "description" : "${role_view-profile}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "d62f44e6-44ed-43f1-a5fd-16278f34ca06"
            }, {
                "id" : "0795e028-04d9-4959-9e80-2497856c9cc2",
                "name" : "manage-account",
                "description" : "${role_manage-account}",
                "scopeParamRequired" : false,
                "composite" : true,
                "composites" : {
                    "client" : {
                        "account" : [ "manage-account-links" ]
                    }
                },
                "clientRole" : true,
                "containerId" : "d62f44e6-44ed-43f1-a5fd-16278f34ca06"
            }, {
                "id" : "e6aa5ee2-5504-4fd4-b385-23259222ccf1",
                "name" : "manage-account-links",
                "description" : "${role_manage-account-links}",
                "scopeParamRequired" : false,
                "composite" : false,
                "clientRole" : true,
                "containerId" : "d62f44e6-44ed-43f1-a5fd-16278f34ca06"
            } ]
        }
    },
    "groups" : [ {
        "id" : "72a803d1-b661-48c9-ad6a-615da5979a9b",
        "name" : "Admins",
        "path" : "/Admins",
        "attributes" : { },
        "realmRoles" : [ "ROLE_ADMIN" ],
        "clientRoles" : { },
        "subGroups" : [ ]
    }, {
        "id" : "426a6f74-c684-4f1d-b2a5-aa34f304ec1e",
        "name" : "Users",
        "path" : "/Users",
        "attributes" : { },
        "realmRoles" : [ "ROLE_USER" ],
        "clientRoles" : { },
        "subGroups" : [ ]
    } ],
    "defaultRoles" : [ "offline_access", "uma_authorization" ],
    "requiredCredentials" : [ "password" ],
    "otpPolicyType" : "totp",
    "otpPolicyAlgorithm" : "HmacSHA1",
    "otpPolicyInitialCounter" : 0,
    "otpPolicyDigits" : 6,
    "otpPolicyLookAheadWindow" : 1,
    "otpPolicyPeriod" : 30,
    "clients" : [ {
        "id" : "d62f44e6-44ed-43f1-a5fd-16278f34ca06",
        "clientId" : "account",
        "name" : "${client_account}",
        "baseUrl" : "/auth/realms/jhipster/account",
        "surrogateAuthRequired" : false,
        "enabled" : true,
        "clientAuthenticatorType" : "client-secret",
        "secret" : "**********",
        "defaultRoles" : [ "view-profile", "manage-account" ],
        "redirectUris" : [ "/auth/realms/jhipster/account/*" ],
        "webOrigins" : [ ],
        "notBefore" : 0,
        "bearerOnly" : false,
        "consentRequired" : false,
        "standardFlowEnabled" : true,
        "implicitFlowEnabled" : false,
        "directAccessGrantsEnabled" : false,
        "serviceAccountsEnabled" : false,
        "publicClient" : false,
        "frontchannelLogout" : false,
        "protocol" : "openid-connect",
        "attributes" : { },
        "fullScopeAllowed" : false,
        "nodeReRegistrationTimeout" : 0,
        "protocolMappers" : [ {
            "id" : "e873c8dd-f992-4394-86f4-11702d0dc5c6",
            "name" : "full name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-full-name-mapper",
            "consentRequired" : true,
            "consentText" : "${fullName}",
            "config" : {
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "userinfo.token.claim" : "true"
            }
        }, {
            "id" : "48109262-aa26-42e6-86a3-8d6ef81bdfe6",
            "name" : "given name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${givenName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "firstName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "given_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "3128e16e-b291-4596-af8d-b9f023ab1106",
            "name" : "username",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${username}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "username",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "preferred_username",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "99dbc485-db90-4da5-847f-68e75b7d578a",
            "name" : "email",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${email}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "email",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "email",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "2c5e1d23-f4e4-402a-a334-c290545ed3de",
            "name" : "family name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${familyName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "lastName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "family_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "029ecb66-f9da-4039-8a45-dd0b75816f05",
            "name" : "role list",
            "protocol" : "saml",
            "protocolMapper" : "saml-role-list-mapper",
            "consentRequired" : false,
            "config" : {
                "single" : "false",
                "attribute.nameformat" : "Basic",
                "attribute.name" : "Role"
            }
        } ],
        "useTemplateConfig" : false,
        "useTemplateScope" : false,
        "useTemplateMappers" : false
    }, {
        "id" : "5c4a70b2-c206-45f6-bf5b-85d583bf135f",
        "clientId" : "admin-cli",
        "name" : "${client_admin-cli}",
        "surrogateAuthRequired" : false,
        "enabled" : true,
        "clientAuthenticatorType" : "client-secret",
        "secret" : "**********",
        "redirectUris" : [ ],
        "webOrigins" : [ ],
        "notBefore" : 0,
        "bearerOnly" : false,
        "consentRequired" : false,
        "standardFlowEnabled" : false,
        "implicitFlowEnabled" : false,
        "directAccessGrantsEnabled" : true,
        "serviceAccountsEnabled" : false,
        "publicClient" : true,
        "frontchannelLogout" : false,
        "protocol" : "openid-connect",
        "attributes" : { },
        "fullScopeAllowed" : false,
        "nodeReRegistrationTimeout" : 0,
        "protocolMappers" : [ {
            "id" : "cdd59f8e-8c6f-4081-89cd-56e9b2e731ce",
            "name" : "given name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${givenName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "firstName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "given_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "32c44bf0-929a-468a-8fca-401e98e68d8f",
            "name" : "full name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-full-name-mapper",
            "consentRequired" : true,
            "consentText" : "${fullName}",
            "config" : {
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "userinfo.token.claim" : "true"
            }
        }, {
            "id" : "aa7593c3-887c-4ee1-a7f9-cecc814b02af",
            "name" : "username",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${username}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "username",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "preferred_username",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "de72c356-7239-48b3-81cb-fcc43f43e40f",
            "name" : "email",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${email}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "email",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "email",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "ee75a1dc-a704-4b61-9f88-c8da9cf1b022",
            "name" : "role list",
            "protocol" : "saml",
            "protocolMapper" : "saml-role-list-mapper",
            "consentRequired" : false,
            "config" : {
                "single" : "false",
                "attribute.nameformat" : "Basic",
                "attribute.name" : "Role"
            }
        }, {
            "id" : "ba912e36-3130-41fd-90a9-f20973f9d2d2",
            "name" : "family name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${familyName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "lastName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "family_name",
                "jsonType.label" : "String"
            }
        } ],
        "useTemplateConfig" : false,
        "useTemplateScope" : false,
        "useTemplateMappers" : false
    }, {
        "id" : "b1c17dac-42d4-43c2-96bc-53287c173deb",
        "clientId" : "broker",
        "name" : "${client_broker}",
        "surrogateAuthRequired" : false,
        "enabled" : true,
        "clientAuthenticatorType" : "client-secret",
        "secret" : "**********",
        "redirectUris" : [ ],
        "webOrigins" : [ ],
        "notBefore" : 0,
        "bearerOnly" : false,
        "consentRequired" : false,
        "standardFlowEnabled" : true,
        "implicitFlowEnabled" : false,
        "directAccessGrantsEnabled" : false,
        "serviceAccountsEnabled" : false,
        "publicClient" : false,
        "frontchannelLogout" : false,
        "protocol" : "openid-connect",
        "attributes" : { },
        "fullScopeAllowed" : false,
        "nodeReRegistrationTimeout" : 0,
        "protocolMappers" : [ {
            "id" : "bedd96b4-b1f2-498b-8a2a-c5ea034874b4",
            "name" : "role list",
            "protocol" : "saml",
            "protocolMapper" : "saml-role-list-mapper",
            "consentRequired" : false,
            "config" : {
                "single" : "false",
                "attribute.nameformat" : "Basic",
                "attribute.name" : "Role"
            }
        }, {
            "id" : "fea24442-9a8d-4858-b3a7-fd5ff26528ad",
            "name" : "given name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${givenName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "firstName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "given_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "235062dc-848c-4bbf-bb13-4ab0b5b7fda6",
            "name" : "full name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-full-name-mapper",
            "consentRequired" : true,
            "consentText" : "${fullName}",
            "config" : {
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "userinfo.token.claim" : "true"
            }
        }, {
            "id" : "b056b77a-6a4b-44f4-aba2-d6eaefc86926",
            "name" : "family name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${familyName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "lastName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "family_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "bc1bfa51-8f65-45b4-b62f-4c6015ef3928",
            "name" : "username",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${username}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "username",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "preferred_username",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "4ed6a16d-0411-4d20-b1b2-456390e20332",
            "name" : "email",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${email}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "email",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "email",
                "jsonType.label" : "String"
            }
        } ],
        "useTemplateConfig" : false,
        "useTemplateScope" : false,
        "useTemplateMappers" : false
    }, {
        "id" : "2828e4a9-edde-45fa-aad9-855f53e38f58",
        "clientId" : "internal",
        "surrogateAuthRequired" : false,
        "enabled" : true,
        "clientAuthenticatorType" : "client-secret",
        "secret" : "internal",
        "redirectUris" : [ ],
        "webOrigins" : [ ],
        "notBefore" : 0,
        "bearerOnly" : false,
        "consentRequired" : false,
        "standardFlowEnabled" : true,
        "implicitFlowEnabled" : false,
        "directAccessGrantsEnabled" : true,
        "serviceAccountsEnabled" : true,
        "authorizationServicesEnabled" : true,
        "publicClient" : false,
        "frontchannelLogout" : false,
        "protocol" : "openid-connect",
        "attributes" : {
            "saml.assertion.signature" : "false",
            "saml.force.post.binding" : "false",
            "saml.multivalued.roles" : "false",
            "saml.encrypt" : "false",
            "saml_force_name_id_format" : "false",
            "saml.client.signature" : "false",
            "saml.authnstatement" : "false",
            "saml.server.signature" : "false",
            "saml.server.signature.keyinfo.ext" : "false",
            "saml.onetimeuse.condition" : "false"
        },
        "fullScopeAllowed" : true,
        "nodeReRegistrationTimeout" : -1,
        "protocolMappers" : [ {
            "id" : "13615b3b-ed18-4d82-80f8-6f0e9f3020dc",
            "name" : "given name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${givenName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "firstName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "given_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "f227efa6-ec1d-4cdb-8967-bdd9bdd291bc",
            "name" : "email",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${email}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "email",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "email",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "16d6d71c-a091-40b5-847b-df005fc7064d",
            "name" : "username",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${username}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "username",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "preferred_username",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "64db0631-d655-4198-bef0-bd1c36209aa5",
            "name" : "Client Host",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usersessionmodel-note-mapper",
            "consentRequired" : false,
            "consentText" : "",
            "config" : {
                "user.session.note" : "clientHost",
                "userinfo.token.claim" : "true",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "clientHost",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "92858fbd-18fb-4b71-9631-53f2fa22f21b",
            "name" : "role list",
            "protocol" : "saml",
            "protocolMapper" : "saml-role-list-mapper",
            "consentRequired" : false,
            "config" : {
                "single" : "false",
                "attribute.nameformat" : "Basic",
                "attribute.name" : "Role"
            }
        }, {
            "id" : "e437893a-071c-4c47-b68b-eef0823e15f8",
            "name" : "full name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-full-name-mapper",
            "consentRequired" : true,
            "consentText" : "${fullName}",
            "config" : {
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "userinfo.token.claim" : "true"
            }
        }, {
            "id" : "f3999b0f-12ba-4907-b74f-7805db725e62",
            "name" : "Client ID",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usersessionmodel-note-mapper",
            "consentRequired" : false,
            "consentText" : "",
            "config" : {
                "user.session.note" : "clientId",
                "userinfo.token.claim" : "true",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "clientId",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "fd941083-5c14-42e2-b38c-68dcd7c5b5fb",
            "name" : "family name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${familyName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "lastName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "family_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "faf00902-ec8b-47b9-af6e-7a8be7fa15bf",
            "name" : "Client IP Address",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usersessionmodel-note-mapper",
            "consentRequired" : false,
            "consentText" : "",
            "config" : {
                "user.session.note" : "clientAddress",
                "userinfo.token.claim" : "true",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "clientAddress",
                "jsonType.label" : "String"
            }
        } ],
        "useTemplateConfig" : false,
        "useTemplateScope" : false,
        "useTemplateMappers" : false,
        "authorizationSettings" : {
            "allowRemoteResourceManagement" : false,
            "policyEnforcementMode" : "ENFORCING",
            "resources" : [ {
                "name" : "Default Resource",
                "uri" : "/*",
                "type" : "urn:internal:resources:default"
            } ],
            "policies" : [ {
                "name" : "Default Policy",
                "description" : "A policy that grants access only for users within this realm",
                "type" : "js",
                "logic" : "POSITIVE",
                "decisionStrategy" : "AFFIRMATIVE",
                "config" : {
                    "code" : "// by default, grants any permission associated with this policy\n$evaluation.grant();\n"
                }
            }, {
                "name" : "Default Permission",
                "description" : "A permission that applies to the default resource type",
                "type" : "resource",
                "logic" : "POSITIVE",
                "decisionStrategy" : "UNANIMOUS",
                "config" : {
                    "defaultResourceType" : "urn:internal:resources:default",
                    "applyPolicies" : "[\"Default Policy\"]"
                }
            } ],
            "scopes" : [ ]
        }
    }, {
        "id" : "05e9f3e9-d74b-4d54-9005-2fc17662a35d",
        "clientId" : "realm-management",
        "name" : "${client_realm-management}",
        "surrogateAuthRequired" : false,
        "enabled" : true,
        "clientAuthenticatorType" : "client-secret",
        "secret" : "**********",
        "redirectUris" : [ ],
        "webOrigins" : [ ],
        "notBefore" : 0,
        "bearerOnly" : true,
        "consentRequired" : false,
        "standardFlowEnabled" : true,
        "implicitFlowEnabled" : false,
        "directAccessGrantsEnabled" : false,
        "serviceAccountsEnabled" : false,
        "publicClient" : false,
        "frontchannelLogout" : false,
        "protocol" : "openid-connect",
        "attributes" : { },
        "fullScopeAllowed" : false,
        "nodeReRegistrationTimeout" : 0,
        "protocolMappers" : [ {
            "id" : "ab4284ce-a884-47be-aa01-da6be943edab",
            "name" : "email",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${email}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "email",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "email",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "75376d76-5f6e-46fd-ac71-59e088a759cf",
            "name" : "given name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${givenName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "firstName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "given_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "a909e127-c1d5-41c8-8518-cb291b25f484",
            "name" : "username",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${username}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "username",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "preferred_username",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "b02ce849-dc1f-4f6d-a940-a3e4c7e5fd36",
            "name" : "full name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-full-name-mapper",
            "consentRequired" : true,
            "consentText" : "${fullName}",
            "config" : {
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "userinfo.token.claim" : "true"
            }
        }, {
            "id" : "b9f36dd6-ccb7-46f8-9bb7-6067ee01c80a",
            "name" : "family name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${familyName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "lastName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "family_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "3071ce60-b026-4d77-8277-faf2dfe0fbe4",
            "name" : "role list",
            "protocol" : "saml",
            "protocolMapper" : "saml-role-list-mapper",
            "consentRequired" : false,
            "config" : {
                "single" : "false",
                "attribute.nameformat" : "Basic",
                "attribute.name" : "Role"
            }
        } ],
        "useTemplateConfig" : false,
        "useTemplateScope" : false,
        "useTemplateMappers" : false
    }, {
        "id" : "c1419b24-cff4-43fd-92a0-1f1630485822",
        "clientId" : "security-admin-console",
        "name" : "${client_security-admin-console}",
        "baseUrl" : "/auth/admin/jhipster/console/index.html",
        "surrogateAuthRequired" : false,
        "enabled" : true,
        "clientAuthenticatorType" : "client-secret",
        "secret" : "**********",
        "redirectUris" : [ "/auth/admin/jhipster/console/*" ],
        "webOrigins" : [ ],
        "notBefore" : 0,
        "bearerOnly" : false,
        "consentRequired" : false,
        "standardFlowEnabled" : true,
        "implicitFlowEnabled" : false,
        "directAccessGrantsEnabled" : false,
        "serviceAccountsEnabled" : false,
        "publicClient" : true,
        "frontchannelLogout" : false,
        "protocol" : "openid-connect",
        "attributes" : { },
        "fullScopeAllowed" : false,
        "nodeReRegistrationTimeout" : 0,
        "protocolMappers" : [ {
            "id" : "f6d5ca93-c0e7-4899-81ac-479615903f10",
            "name" : "given name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${givenName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "firstName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "given_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "4f770c11-47eb-44ef-9e6e-4db3b1c510d5",
            "name" : "locale",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-attribute-mapper",
            "consentRequired" : false,
            "consentText" : "${locale}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "locale",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "locale",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "1422218e-a7eb-4b26-bea8-d60bcd972a07",
            "name" : "email",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${email}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "email",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "email",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "57db1205-b7bf-4629-b0ab-4c13ce4edbde",
            "name" : "role list",
            "protocol" : "saml",
            "protocolMapper" : "saml-role-list-mapper",
            "consentRequired" : false,
            "config" : {
                "single" : "false",
                "attribute.nameformat" : "Basic",
                "attribute.name" : "Role"
            }
        }, {
            "id" : "ac7e9bb5-f90a-4e94-86bc-426fa84d8950",
            "name" : "username",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${username}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "username",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "preferred_username",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "019a1374-216c-4478-995e-b0fe5960f4b9",
            "name" : "full name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-full-name-mapper",
            "consentRequired" : true,
            "consentText" : "${fullName}",
            "config" : {
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "userinfo.token.claim" : "true"
            }
        }, {
            "id" : "1f54330f-3ccc-4b85-a93d-8c20f93abe04",
            "name" : "family name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${familyName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "lastName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "family_name",
                "jsonType.label" : "String"
            }
        } ],
        "useTemplateConfig" : false,
        "useTemplateScope" : false,
        "useTemplateMappers" : false
    }, {
        "id" : "9080f291-17ef-4022-8afe-7822595006c6",
        "clientId" : "web_app",
        "rootUrl" : "http://localhost:<%= serverPort %>",
        "surrogateAuthRequired" : false,
        "enabled" : true,
        "clientAuthenticatorType" : "client-secret",
        "secret" : "web_app",
        "redirectUris" : [ "http://localhost:<%= serverPort %>/*", "http://localhost:9000/*", "http://127.0.0.1:8761/*" ],
        "webOrigins" : [ "http://localhost:<%= serverPort %>/*", "http://localhost:9000/*", "http://127.0.0.1:8761/*" ],
        "notBefore" : 0,
        "bearerOnly" : false,
        "consentRequired" : false,
        "standardFlowEnabled" : true,
        "implicitFlowEnabled" : false,
        "directAccessGrantsEnabled" : true,
        "serviceAccountsEnabled" : false,
        "publicClient" : true,
        "frontchannelLogout" : false,
        "protocol" : "openid-connect",
        "attributes" : {
            "saml.assertion.signature" : "false",
            "saml.force.post.binding" : "false",
            "saml.multivalued.roles" : "false",
            "saml.encrypt" : "false",
            "saml_force_name_id_format" : "false",
            "saml.client.signature" : "false",
            "saml.authnstatement" : "false",
            "saml.server.signature" : "false",
            "saml.server.signature.keyinfo.ext" : "false",
            "saml.onetimeuse.condition" : "false"
        },
        "fullScopeAllowed" : true,
        "nodeReRegistrationTimeout" : -1,
        "protocolMappers" : [ {
            "id" : "2ea1cf0a-cdde-4d75-9980-f2a8248c3bf7",
            "name" : "login",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-attribute-mapper",
            "consentRequired" : false,
            "config" : {
                "usermodel.realmRoleMapping.rolePrefix" : "",
                "multivalued" : "",
                "userinfo.token.claim" : "true",
                "user.attribute" : "preferred_username",
                "id.token.claim" : "",
                "access.token.claim" : "",
                "claim.name" : "login",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "8a78b62d-ef0f-4313-b611-de183ffd6d58",
            "name" : "roles",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-realm-role-mapper",
            "consentRequired" : false,
            "config" : {
                "usermodel.realmRoleMapping.rolePrefix" : "",
                "multivalued" : "true",
                "userinfo.token.claim" : "true",
                "id.token.claim" : "",
                "access.token.claim" : "false",
                "claim.name" : "roles",
                "jsonType.label" : ""
            }
        }, {
            "id" : "1e3419ad-b4fc-4071-9929-91147d253c7a",
            "name" : "email",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${email}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "email",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "email",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "537c40c1-ba08-4bfb-bc8e-3e9d4c1ebea8",
            "name" : "family name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${familyName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "lastName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "family_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "1b03de2f-240f-44a6-a2be-f3eb98188ef4",
            "name" : "full name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-full-name-mapper",
            "consentRequired" : true,
            "consentText" : "${fullName}",
            "config" : {
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "userinfo.token.claim" : "true"
            }
        }, {
            "id" : "38b57577-ac3a-40c4-84a0-013b516cc866",
            "name" : "role list",
            "protocol" : "saml",
            "protocolMapper" : "saml-role-list-mapper",
            "consentRequired" : false,
            "config" : {
                "single" : "false",
                "attribute.nameformat" : "Basic",
                "attribute.name" : "Role"
            }
        }, {
            "id" : "6ef40136-1a14-466d-87ce-c643e953fee9",
            "name" : "langKey",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-attribute-mapper",
            "consentRequired" : false,
            "config" : {
                "usermodel.realmRoleMapping.rolePrefix" : "",
                "multivalued" : "",
                "userinfo.token.claim" : "true",
                "user.attribute" : "langKey",
                "id.token.claim" : "",
                "access.token.claim" : "",
                "claim.name" : "langKey",
                "jsonType.label" : ""
            }
        }, {
            "id" : "4f71fcb7-ec61-4c64-b9ad-165300f760b1",
            "name" : "username",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${username}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "username",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "preferred_username",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "5f49aebe-c328-4078-9116-08e03afac18a",
            "name" : "given name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${givenName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "firstName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "given_name",
                "jsonType.label" : "String"
            }
        } ],
        "useTemplateConfig" : false,
        "useTemplateScope" : false,
        "useTemplateMappers" : false
    }<% if (serviceDiscoveryType === 'eureka') { %>, {
        "id" : "9080f291-17ef-4022-8afe-8822595006c6",
        "clientId" : "jhipster-registry",
        "rootUrl" : "http://localhost:8761",
        "surrogateAuthRequired" : false,
        "enabled" : true,
        "clientAuthenticatorType" : "client-secret",
        "secret" : "jhipster-registry",
        "redirectUris" : [ "http://localhost:8761/*", "http://127.0.0.1:8761/*" ],
        "webOrigins" : [ "http://localhost:8761/*", "http://127.0.0.1:8761/*" ],
        "notBefore" : 0,
        "bearerOnly" : false,
        "consentRequired" : false,
        "standardFlowEnabled" : true,
        "implicitFlowEnabled" : false,
        "directAccessGrantsEnabled" : true,
        "serviceAccountsEnabled" : false,
        "publicClient" : true,
        "frontchannelLogout" : false,
        "protocol" : "openid-connect",
        "attributes" : {
            "saml.assertion.signature" : "false",
            "saml.force.post.binding" : "false",
            "saml.multivalued.roles" : "false",
            "saml.encrypt" : "false",
            "saml_force_name_id_format" : "false",
            "saml.client.signature" : "false",
            "saml.authnstatement" : "false",
            "saml.server.signature" : "false",
            "saml.server.signature.keyinfo.ext" : "false",
            "saml.onetimeuse.condition" : "false"
        },
        "fullScopeAllowed" : true,
        "nodeReRegistrationTimeout" : -1,
        "protocolMappers" : [ {
            "id" : "2ea1cf0a-cdde-4d75-2980-f2a8248c3bf7",
            "name" : "login",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-attribute-mapper",
            "consentRequired" : false,
            "config" : {
                "usermodel.realmRoleMapping.rolePrefix" : "",
                "multivalued" : "",
                "userinfo.token.claim" : "true",
                "user.attribute" : "preferred_username",
                "id.token.claim" : "",
                "access.token.claim" : "",
                "claim.name" : "login",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "8a78b62d-ef0f-4343-b611-de183ffd6d58",
            "name" : "roles",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-realm-role-mapper",
            "consentRequired" : false,
            "config" : {
                "usermodel.realmRoleMapping.rolePrefix" : "",
                "multivalued" : "true",
                "userinfo.token.claim" : "true",
                "id.token.claim" : "",
                "access.token.claim" : "false",
                "claim.name" : "roles",
                "jsonType.label" : ""
            }
        }, {
            "id" : "1e3419ad-b4fc-4071-4929-91147d253c7a",
            "name" : "email",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${email}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "email",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "email",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "537c40c1-ba08-4bfb-bf8e-3e9d4c1ebea8",
            "name" : "family name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${familyName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "lastName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "family_name",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "1b03de2f-240f-44a6-a2de-f3eb98188ef4",
            "name" : "full name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-full-name-mapper",
            "consentRequired" : true,
            "consentText" : "${fullName}",
            "config" : {
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "userinfo.token.claim" : "true"
            }
        }, {
            "id" : "38b57577-ac3a-40c4-83a0-013b516cc866",
            "name" : "role list",
            "protocol" : "saml",
            "protocolMapper" : "saml-role-list-mapper",
            "consentRequired" : false,
            "config" : {
                "single" : "false",
                "attribute.nameformat" : "Basic",
                "attribute.name" : "Role"
            }
        }, {
            "id" : "6ef40136-1a14-466d-83ce-c643e953fee9",
            "name" : "langKey",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-attribute-mapper",
            "consentRequired" : false,
            "config" : {
                "usermodel.realmRoleMapping.rolePrefix" : "",
                "multivalued" : "",
                "userinfo.token.claim" : "true",
                "user.attribute" : "langKey",
                "id.token.claim" : "",
                "access.token.claim" : "",
                "claim.name" : "langKey",
                "jsonType.label" : ""
            }
        }, {
            "id" : "4f71fcb7-ec61-4c64-b3ad-165300f760b1",
            "name" : "username",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${username}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "username",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "preferred_username",
                "jsonType.label" : "String"
            }
        }, {
            "id" : "5f49aebe-c328-4078-9316-08e03afac18a",
            "name" : "given name",
            "protocol" : "openid-connect",
            "protocolMapper" : "oidc-usermodel-property-mapper",
            "consentRequired" : true,
            "consentText" : "${givenName}",
            "config" : {
                "userinfo.token.claim" : "true",
                "user.attribute" : "firstName",
                "id.token.claim" : "true",
                "access.token.claim" : "true",
                "claim.name" : "given_name",
                "jsonType.label" : "String"
            }
        } ],
        "useTemplateConfig" : false,
        "useTemplateScope" : false,
        "useTemplateMappers" : false
    } <% } %> ],
    "clientTemplates" : [ ],
    "browserSecurityHeaders" : {
        "xContentTypeOptions" : "nosniff",
        "xRobotsTag" : "none",
        "xFrameOptions" : "SAMEORIGIN",
        "xXSSProtection" : "1; mode=block",
        "contentSecurityPolicy" : "frame-src 'self'; frame-ancestors 'self'; object-src 'none';"
    },
    "smtpServer" : { },
    "eventsEnabled" : false,
    "eventsListeners" : [ "jboss-logging" ],
    "enabledEventTypes" : [ ],
    "adminEventsEnabled" : false,
    "adminEventsDetailsEnabled" : false,
    "components" : {
        "org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy" : [ {
            "id" : "85038162-0f84-4b9a-b943-39510bc01c1f",
            "name" : "Allowed Protocol Mapper Types",
            "providerId" : "allowed-protocol-mappers",
            "subType" : "authenticated",
            "subComponents" : { },
            "config" : {
                "allowed-protocol-mapper-types" : [ "saml-role-list-mapper", "saml-user-property-mapper", "oidc-usermodel-attribute-mapper", "oidc-usermodel-property-mapper", "saml-user-attribute-mapper", "oidc-sha256-pairwise-sub-mapper", "oidc-full-name-mapper", "oidc-address-mapper" ],
                "consent-required-for-all-mappers" : [ "true" ]
            }
        }, {
            "id" : "16148d4a-7707-4ed8-a00f-64c711c046b0",
            "name" : "Consent Required",
            "providerId" : "consent-required",
            "subType" : "anonymous",
            "subComponents" : { },
            "config" : { }
        }, {
            "id" : "3f8d044e-b2e0-41f3-be15-103d4338a7a6",
            "name" : "Allowed Client Templates",
            "providerId" : "allowed-client-templates",
            "subType" : "anonymous",
            "subComponents" : { },
            "config" : { }
        }, {
            "id" : "cbf15f83-be75-43dc-a1c4-429de3405383",
            "name" : "Allowed Client Templates",
            "providerId" : "allowed-client-templates",
            "subType" : "authenticated",
            "subComponents" : { },
            "config" : { }
        }, {
            "id" : "61450443-c0b7-4aa5-b021-ff25c420e847",
            "name" : "Max Clients Limit",
            "providerId" : "max-clients",
            "subType" : "anonymous",
            "subComponents" : { },
            "config" : {
                "max-clients" : [ "200" ]
            }
        }, {
            "id" : "6ffa5034-efbc-4c76-b4bb-756107d131b2",
            "name" : "Trusted Hosts",
            "providerId" : "trusted-hosts",
            "subType" : "anonymous",
            "subComponents" : { },
            "config" : {
                "host-sending-registration-request-must-match" : [ "true" ],
                "client-uris-must-match" : [ "true" ]
            }
        }, {
            "id" : "6004b65b-39f9-4b4c-bdb6-203bdbcfab26",
            "name" : "Allowed Protocol Mapper Types",
            "providerId" : "allowed-protocol-mappers",
            "subType" : "anonymous",
            "subComponents" : { },
            "config" : {
                "allowed-protocol-mapper-types" : [ "oidc-sha256-pairwise-sub-mapper", "oidc-address-mapper", "saml-role-list-mapper", "saml-user-property-mapper", "saml-user-attribute-mapper", "oidc-full-name-mapper", "oidc-usermodel-attribute-mapper", "oidc-usermodel-property-mapper" ],
                "consent-required-for-all-mappers" : [ "true" ]
            }
        }, {
            "id" : "676034ba-1295-4b59-8e86-5f390550f72c",
            "name" : "Full Scope Disabled",
            "providerId" : "scope",
            "subType" : "anonymous",
            "subComponents" : { },
            "config" : { }
        } ],
        "org.keycloak.keys.KeyProvider" : [ {
            "id" : "713fde19-1142-4229-b7d9-bfc1a6ef58bb",
            "name" : "rsa-generated",
            "providerId" : "rsa-generated",
            "subComponents" : { },
            "config" : {
                "privateKey" : [ "MIIEpAIBAAKCAQEAqVoQqOeF6MC6jV8gpFoZ58AUBvWP4o24u0M2Ma0EcPzD13OUagwg639kH3VSENq540nDRrbTnT+NHMavvanG0rQJBhjTUtSJod+FX/kKo35nz6OX8ZGkM4lhOx4WsPjNcs0IskED34gygagBRjcdUhOVqxIsmD/OHj+rsQQGgJH0itxqorX1aNh8xRcG58mJnfr7MFuHkHFBkFlvOHkxPRd0UvgfSAmQPjuMnoMuOolANvZbMnOqutyldbAnjU0cBbdzgBN66/4RmXU3ND8LeAmq7sNbnoOSRvPNQoJraKt4K6wHcl9qhH7H8BcM2s/n503GNbe/5hbnIhkR+cUWbwIDAQABAoIBAHdwzDs0P1+vPmOi6hTAb3DiKb3Wx4pTxixc9QYILw+5Vi7Il65Lq5QsnuMJDb5RZbWGOrHPFGTdg5r+DsjHyzCkRZEFRVYwDHoceab8sKIq7vClQu7fd13Z0LevOvXKJKyJK079R8wJ9QU5Bt0M1iMjKPYktUsUBT2UTnVkj2lxXFQTXU2qIt0wTvWomCEEdxp9xTMpEXiniADXornQg1C5c9AtpWiBPLAQtqUN+YFI0BLXEActPPbT8XMrqs9hGxU9aQ5UcGG/T1+JeemhHO6PXGis5yckbKLgO+w4P66G/uk2QX3bGwAxANAznmy/ZuJivUvBbvbrWn2EAwIMsRECgYEA/ETcojTPE9vkduBZKc0EfemG33xdEl/+tRrCl4cMaSNwUfvRQF3+f3wpqdzrUf2eEuqbDKDJJSRZHqgGJnnV3sMgZDJrwydTItpFYIVumiZOuBSZj1kdBPuRj/3hXcfQubU6iAeSH3uJBDGugnJl5aNfWPVSGmcbpDliP9ZW58sCgYEAq9tDWx2yVDZNeAI7JT1v9nniffNi0qAFMXAQVlP+rmq7acF4vjP9Usqzv+ugfHWetH6jzQiU3ZVEpBtc5cEhjmtRQEPX/5n04yqsUyBnJyN4oBtjaQVpRzExZYIa+mIiBDDq8+9vMH+bAWFnV0NwqwviScTt1XrCaBFGdtSej20CgYEAg7m9b6Gdo6QFpyE8zbv1JX5EY/w/aTHhAVZI1/C3xUqxAs44FKFAG/eMldr6saR53yzL64slnRReyMg59etWhuxixI8jgBLPsXpCEcV63Fk2b56qFJUWtxxZhNOv01VcIyyDtLYnUfMit6LtmcX8eS2Www/OYGUIpPcl22mjlYMCgYBX4sKYVyB6VmbZp3JtwfR+/KfqN0xjYDgnpyKDs2K7+ZMsKye/RUEYVNcFn88rts7ZiSXlVa0jgBFhRykDyfeKKLGdhtRwP2Bvx8Pmotx9tHMclcUJ0R2crbiQK6/2Obcho46T/u9Cww8W7qP1iWSV5HbtuMrT8Hp409TQMj2AJQKBgQCEJlZHcnxGEoJ8oWDwp6/78+hzwUIXepeEdCFP4JuGQRruWLu86i2GlPUAzouqg8FYz3Ja31t6PN4tjEoVvZ2J6PYFVWHIqmc3y+k7cgdRb4iZPY49B5x9ETLNUrIsKk8ggSWa8BsgIwH8d5hufgxaPIJ6g34aDPMIAv0MqppynA==" ],
                "certificate" : [ "MIICnzCCAYcCBgFehY6N2zANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhqaGlwc3RlcjAeFw0xNzA5MTUxMjM5MjVaFw0yNzA5MTUxMjQxMDVaMBMxETAPBgNVBAMMCGpoaXBzdGVyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqVoQqOeF6MC6jV8gpFoZ58AUBvWP4o24u0M2Ma0EcPzD13OUagwg639kH3VSENq540nDRrbTnT+NHMavvanG0rQJBhjTUtSJod+FX/kKo35nz6OX8ZGkM4lhOx4WsPjNcs0IskED34gygagBRjcdUhOVqxIsmD/OHj+rsQQGgJH0itxqorX1aNh8xRcG58mJnfr7MFuHkHFBkFlvOHkxPRd0UvgfSAmQPjuMnoMuOolANvZbMnOqutyldbAnjU0cBbdzgBN66/4RmXU3ND8LeAmq7sNbnoOSRvPNQoJraKt4K6wHcl9qhH7H8BcM2s/n503GNbe/5hbnIhkR+cUWbwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAiUny5i2W2MPry8v513ztX6yvK1eiIecS3GJKF9kG+Q39ovATWLkFG92CPd2AkeKecgoJ6DjT/s4L6fI6BopRPgvk1Ccib8Z+xTREqGmZPao+0+oMuR8YLcn7yXewcTKe0hrIwvnR/VK/ZoLEE7de6hgNcKTVMWJGMBlhAcKT8w/GRBNGLhVrgcWQ9mAEY2lptRwL/RcoR1B592T/Dxxwxb9qTaPZfXHhDhry5qkeLxv+jcxf6n57o2P/eyuirS2G4bsPZ+u0eWzpqi2yPljIz37i1bkYgH1d5YJ+4SMXCo6FJcJXTvDXVria8aZtfdX7CZYB6ORxjoYyLcMNI6xY2" ],
                "priority" : [ "100" ]
            }
        }, {
            "id" : "ce4b652e-cc0a-4362-a05a-efc173d5b23e",
            "name" : "hmac-generated",
            "providerId" : "hmac-generated",
            "subComponents" : { },
            "config" : {
                "kid" : [ "65611f1d-0e9c-436b-b6c7-58331f4f2029" ],
                "secret" : [ "xLqiN0CtiR_6MenfQ0GfF7dddR1CPl7mXOmwOwsec_0" ],
                "priority" : [ "100" ]
            }
        } ]
    },
    "internationalizationEnabled" : false,
    "supportedLocales" : [ ],
    "authenticationFlows" : [ {
        "id" : "82cb30e2-3e44-4731-9f03-23ac55f51115",
        "alias" : "Handle Existing Account",
        "description" : "Handle what to do if there is existing account with same email/username like authenticated identity provider",
        "providerId" : "basic-flow",
        "topLevel" : false,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "idp-confirm-link",
            "requirement" : "REQUIRED",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "idp-email-verification",
            "requirement" : "ALTERNATIVE",
            "priority" : 20,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "requirement" : "ALTERNATIVE",
            "priority" : 30,
            "flowAlias" : "Verify Existing Account by Re-authentication",
            "userSetupAllowed" : false,
            "autheticatorFlow" : true
        } ]
    }, {
        "id" : "a1ab3f7d-dc28-4d64-9f24-b597d0588c21",
        "alias" : "Verify Existing Account by Re-authentication",
        "description" : "Reauthentication of existing account",
        "providerId" : "basic-flow",
        "topLevel" : false,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "idp-username-password-form",
            "requirement" : "REQUIRED",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "auth-otp-form",
            "requirement" : "OPTIONAL",
            "priority" : 20,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        } ]
    }, {
        "id" : "1cba6ef8-8986-47e0-a89d-2edc34674de4",
        "alias" : "browser",
        "description" : "browser based authentication",
        "providerId" : "basic-flow",
        "topLevel" : true,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "auth-cookie",
            "requirement" : "ALTERNATIVE",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "auth-spnego",
            "requirement" : "DISABLED",
            "priority" : 20,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "identity-provider-redirector",
            "requirement" : "ALTERNATIVE",
            "priority" : 25,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "requirement" : "ALTERNATIVE",
            "priority" : 30,
            "flowAlias" : "forms",
            "userSetupAllowed" : false,
            "autheticatorFlow" : true
        } ]
    }, {
        "id" : "5458f86c-85f9-44d5-9dfa-f9babe7a3595",
        "alias" : "clients",
        "description" : "Base authentication for clients",
        "providerId" : "client-flow",
        "topLevel" : true,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "client-secret",
            "requirement" : "ALTERNATIVE",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "client-jwt",
            "requirement" : "ALTERNATIVE",
            "priority" : 20,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        } ]
    }, {
        "id" : "e9bc4ab9-733b-4de1-8c9e-8ae81d9c35d0",
        "alias" : "direct grant",
        "description" : "OpenID Connect Resource Owner Grant",
        "providerId" : "basic-flow",
        "topLevel" : true,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "direct-grant-validate-username",
            "requirement" : "REQUIRED",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "direct-grant-validate-password",
            "requirement" : "REQUIRED",
            "priority" : 20,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "direct-grant-validate-otp",
            "requirement" : "OPTIONAL",
            "priority" : 30,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        } ]
    }, {
        "id" : "f7e7024e-6c5e-45e7-94a0-2038340bf720",
        "alias" : "docker auth",
        "description" : "Used by Docker clients to authenticate against the IDP",
        "providerId" : "basic-flow",
        "topLevel" : true,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "docker-http-basic-authenticator",
            "requirement" : "REQUIRED",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        } ]
    }, {
        "id" : "934ad5e3-7b34-4001-ab80-1a9094cb850b",
        "alias" : "first broker login",
        "description" : "Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account",
        "providerId" : "basic-flow",
        "topLevel" : true,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticatorConfig" : "review profile config",
            "authenticator" : "idp-review-profile",
            "requirement" : "REQUIRED",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticatorConfig" : "create unique user config",
            "authenticator" : "idp-create-user-if-unique",
            "requirement" : "ALTERNATIVE",
            "priority" : 20,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "requirement" : "ALTERNATIVE",
            "priority" : 30,
            "flowAlias" : "Handle Existing Account",
            "userSetupAllowed" : false,
            "autheticatorFlow" : true
        } ]
    }, {
        "id" : "5239e17d-63a4-4402-80ae-b825730ad2ab",
        "alias" : "forms",
        "description" : "Username, password, otp and other auth forms.",
        "providerId" : "basic-flow",
        "topLevel" : false,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "auth-username-password-form",
            "requirement" : "REQUIRED",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "auth-otp-form",
            "requirement" : "OPTIONAL",
            "priority" : 20,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        } ]
    }, {
        "id" : "a9bec191-d192-49a0-be35-e9353e9d194f",
        "alias" : "registration",
        "description" : "registration flow",
        "providerId" : "basic-flow",
        "topLevel" : true,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "registration-page-form",
            "requirement" : "REQUIRED",
            "priority" : 10,
            "flowAlias" : "registration form",
            "userSetupAllowed" : false,
            "autheticatorFlow" : true
        } ]
    }, {
        "id" : "bef0b924-6598-4737-80a1-bc767386f66b",
        "alias" : "registration form",
        "description" : "registration form",
        "providerId" : "form-flow",
        "topLevel" : false,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "registration-user-creation",
            "requirement" : "REQUIRED",
            "priority" : 20,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "registration-profile-action",
            "requirement" : "REQUIRED",
            "priority" : 40,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "registration-password-action",
            "requirement" : "REQUIRED",
            "priority" : 50,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "registration-recaptcha-action",
            "requirement" : "DISABLED",
            "priority" : 60,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        } ]
    }, {
        "id" : "92a91e85-78b8-4184-9dcd-59452f49fbbe",
        "alias" : "reset credentials",
        "description" : "Reset credentials for a user if they forgot their password or something",
        "providerId" : "basic-flow",
        "topLevel" : true,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "reset-credentials-choose-user",
            "requirement" : "REQUIRED",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "reset-credential-email",
            "requirement" : "REQUIRED",
            "priority" : 20,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "reset-password",
            "requirement" : "REQUIRED",
            "priority" : 30,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        }, {
            "authenticator" : "reset-otp",
            "requirement" : "OPTIONAL",
            "priority" : 40,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        } ]
    }, {
        "id" : "30a96fd8-3534-4f33-8231-eded349233c1",
        "alias" : "saml ecp",
        "description" : "SAML ECP Profile Authentication Flow",
        "providerId" : "basic-flow",
        "topLevel" : true,
        "builtIn" : true,
        "authenticationExecutions" : [ {
            "authenticator" : "http-basic-authenticator",
            "requirement" : "REQUIRED",
            "priority" : 10,
            "userSetupAllowed" : false,
            "autheticatorFlow" : false
        } ]
    } ],
    "authenticatorConfig" : [ {
        "id" : "f6b03951-f43e-4f6c-8706-b36182022acb",
        "alias" : "create unique user config",
        "config" : {
            "require.password.update.after.registration" : "false"
        }
    }, {
        "id" : "648787e0-6dd7-4b83-939b-dcb7fbf11a2d",
        "alias" : "review profile config",
        "config" : {
            "update.profile.on.first.login" : "missing"
        }
    } ],
    "requiredActions" : [ {
        "alias" : "CONFIGURE_TOTP",
        "name" : "Configure OTP",
        "providerId" : "CONFIGURE_TOTP",
        "enabled" : true,
        "defaultAction" : false,
        "config" : { }
    }, {
        "alias" : "UPDATE_PASSWORD",
        "name" : "Update Password",
        "providerId" : "UPDATE_PASSWORD",
        "enabled" : true,
        "defaultAction" : false,
        "config" : { }
    }, {
        "alias" : "UPDATE_PROFILE",
        "name" : "Update Profile",
        "providerId" : "UPDATE_PROFILE",
        "enabled" : true,
        "defaultAction" : false,
        "config" : { }
    }, {
        "alias" : "VERIFY_EMAIL",
        "name" : "Verify Email",
        "providerId" : "VERIFY_EMAIL",
        "enabled" : true,
        "defaultAction" : false,
        "config" : { }
    }, {
        "alias" : "terms_and_conditions",
        "name" : "Terms and Conditions",
        "providerId" : "terms_and_conditions",
        "enabled" : false,
        "defaultAction" : false,
        "config" : { }
    } ],
    "browserFlow" : "browser",
    "registrationFlow" : "registration",
    "directGrantFlow" : "direct grant",
    "resetCredentialsFlow" : "reset credentials",
    "clientAuthenticationFlow" : "clients",
    "dockerAuthenticationFlow" : "docker auth",
    "attributes" : {
        "_browser_header.xXSSProtection" : "1; mode=block",
        "_browser_header.xFrameOptions" : "SAMEORIGIN",
        "permanentLockout" : "false",
        "quickLoginCheckMilliSeconds" : "1000",
        "_browser_header.xRobotsTag" : "none",
        "maxFailureWaitSeconds" : "900",
        "minimumQuickLoginWaitSeconds" : "60",
        "failureFactor" : "30",
        "actionTokenGeneratedByUserLifespan" : "300",
        "maxDeltaTimeSeconds" : "43200",
        "_browser_header.xContentTypeOptions" : "nosniff",
        "actionTokenGeneratedByAdminLifespan" : "43200",
        "bruteForceProtected" : "false",
        "_browser_header.contentSecurityPolicy" : "frame-src 'self'; frame-ancestors 'self'; object-src 'none';",
        "waitIncrementSeconds" : "60"
    },
    "keycloakVersion" : "3.3.0.CR1"
}