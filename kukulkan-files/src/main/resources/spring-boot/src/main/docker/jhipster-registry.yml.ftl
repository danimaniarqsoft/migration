version: '2'
services:
    jhipster-registry:
        image: <%= DOCKER_JHIPSTER_REGISTRY %>
        volumes:
            - ./central-server-config:/central-config
        # When run with the "dev" Spring profile, the JHipster Registry will
        # read the config from the local filesystem (central-server-config directory)
        # When run with the "prod" Spring profile, it will read the configuration from a Git repository
        # See http://www.jhipster.tech/microservices-architecture/#registry_app_configuration
        environment:
            - SPRING_PROFILES_ACTIVE=dev<% if (authenticationType === 'oauth2') { %>,oauth2<% } %>
            - SECURITY_USER_PASSWORD=admin
            - JHIPSTER_REGISTRY_PASSWORD=admin
            - SPRING_CLOUD_CONFIG_SERVER_NATIVE_SEARCH_LOCATIONS=file:./central-config/localhost-config/
            # - GIT_URI=https://github.com/jhipster/jhipster-registry/
            # - GIT_SEARCH_PATHS=central-config
            <%_ if (authenticationType === 'oauth2') { _%>
            # For keycloak to work, you need to add '127.0.0.1 keycloak' to your hosts file
            - SECURITY_OAUTH2_CLIENT_ACCESS_TOKEN_URI=http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/token
            - SECURITY_OAUTH2_CLIENT_USER_AUTHORIZATION_URI=http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/auth
            - SECURITY_OAUTH2_RESOURCE_USER_INFO_URI=http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/userinfo
            - SECURITY_OAUTH2_RESOURCE_TOKEN_INFO_URI=http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/token/introspect
            - SECURITY_OAUTH2_RESOURCE_JWT_KEY_URI=http://keycloak:9080/auth/realms/jhipster
            <%_ } _%>
        ports:
            - 8761:8761