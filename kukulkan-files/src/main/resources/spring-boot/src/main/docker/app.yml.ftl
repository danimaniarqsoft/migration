version: '2'
services:
    <%= baseName.toLowerCase() %>-app:
        image: <%= baseName.toLowerCase() %>
        environment:
            - SPRING_PROFILES_ACTIVE=prod,swagger
            <%_ if (serviceDiscoveryType === 'consul') { _%>
            - SPRING_CLOUD_CONSUL_HOST=consul
            - SPRING_CLOUD_CONSUL_PORT=8500
            <%_ } _%>
            <%_ if (serviceDiscoveryType === 'eureka') { _%>
            - EUREKA_CLIENT_SERVICE_URL_DEFAULTZONE=http://admin:$${jhipster.registry.password}@jhipster-registry:8761/eureka
            - SPRING_CLOUD_CONFIG_URI=http://admin:$${jhipster.registry.password}@jhipster-registry:8761/config
            <%_ } _%>
            <%_ if (prodDatabaseType === 'mysql') { _%>
            - SPRING_DATASOURCE_URL=jdbc:mysql://<%= baseName.toLowerCase() %>-mysql:3306/<%= baseName.toLowerCase() %>?useUnicode=true&characterEncoding=utf8&useSSL=false
            <%_ } _%>
            <%_ if (prodDatabaseType === 'mariadb') { _%>
            - SPRING_DATASOURCE_URL=jdbc:mariadb://<%= baseName.toLowerCase() %>-mariadb:3306/<%= baseName.toLowerCase() %>
            <%_ } _%>
            <%_ if (prodDatabaseType === 'postgresql') { _%>
            - SPRING_DATASOURCE_URL=jdbc:postgresql://<%= baseName.toLowerCase() %>-postgresql:5432/<%= baseName %>
            <%_ } _%>
            <%_ if (prodDatabaseType === 'mssql') { _%>
            - SPRING_DATASOURCE_URL=jdbc:sqlserver://<%= baseName.toLowerCase() %>-mssql:1433;database=jhitest
            <%_ } _%>
            <%_ if (prodDatabaseType === 'oracle') { _%>
            - SPRING_DATASOURCE_URL=jdbc:oracle:thin:@<%= baseName.toLowerCase() %>-oracle:1521:<%= baseName %>
            <%_ } _%>
            <%_ if (prodDatabaseType === 'mongodb') { _%>
            - SPRING_DATA_MONGODB_URI=mongodb://<%= baseName.toLowerCase() %>-mongodb:27017
            - SPRING_DATA_MONGODB_DATABASE=<%= baseName %>
            <%_ } _%>
            <%_ if (prodDatabaseType === 'couchbase') { _%>
            - SPRING_COUCHBASE_BOOTSTRAP_HOSTS=<%= baseName.toLowerCase() %>-couchbase
            - SPRING_COUCHBASE_BUCKET_NAME=<%= baseName %>
            <%_ } _%>
            <%_ if (authenticationType === 'oauth2') { _%>
            # For keycloak to work, you need to add '127.0.0.1 keycloak' to your hosts file
            - SECURITY_OAUTH2_CLIENT_ACCESS_TOKEN_URI=http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/token
            - SECURITY_OAUTH2_CLIENT_USER_AUTHORIZATION_URI=http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/auth
            - SECURITY_OAUTH2_RESOURCE_USER_INFO_URI=http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/userinfo
            - SECURITY_OAUTH2_RESOURCE_TOKEN_INFO_URI=http://keycloak:9080/auth/realms/jhipster/protocol/openid-connect/token/introspect
                <%_ if (applicationType === 'gateway' || applicationType === 'microservice') { _%>
            - SECURITY_OAUTH2_RESOURCE_JWT_KEY_URI=http://keycloak:9080/auth/realms/jhipster
                <%_ } _%>
            <%_ } _%>
            <%_ if (prodDatabaseType === 'cassandra') { _%>
            - SPRING_DATA_CASSANDRA_CONTACTPOINTS=<%= baseName.toLowerCase() %>-cassandra
                <%_ if (authenticationType === 'uaa') { _%>
            - JHIPSTER_SLEEP=80 # gives time for uaa and the Cassandra cluster to start and execute the migration scripts
                <%_ } else { _%>
            - JHIPSTER_SLEEP=30 # gives time for the Cassandra cluster to start and execute the migration scripts
                <%_ } _%>
            <%_ } else { _%>
                <%_ if (serviceDiscoveryType === 'eureka') { _%>
            - JHIPSTER_SLEEP=30 # gives time for the JHipster Registry to boot before the application
                <%_ } else { _%>
            - JHIPSTER_SLEEP=10 # gives time for the database to boot before the application
                <%_ } _%>
            <%_ } _%>
            <%_ if (searchEngine === 'elasticsearch') { _%>
            - SPRING_DATA_ELASTICSEARCH_CLUSTER_NODES=<%= baseName.toLowerCase() %>-elasticsearch:9300
            <%_ } _%>
            <%_ if (messageBroker === 'kafka') { _%>
            - SPRING_CLOUD_STREAM_KAFKA_BINDER_BROKERS=kafka
            - SPRING_CLOUD_STREAM_KAFKA_BINDER_ZK_NODES=zookeeper
            <%_ } _%>
            <%_ if (cacheProvider === 'infinispan') { _%>
            - JAVA_OPTS=-Djgroups.tcp.address=NON_LOOPBACK -Djava.net.preferIPv4Stack=true
            <%_ } _%>
        <%_ if (applicationType === 'monolith' || applicationType === 'gateway') { _%>
        ports:
            - <%= serverPort %>:<%= serverPort %>
        <%_ } _%>
    <%_ if (prodDatabaseType === 'mysql') { _%>
    <%= baseName.toLowerCase() %>-mysql:
        extends:
            file: mysql.yml
            service: <%= baseName.toLowerCase() %>-mysql
    <%_ } _%>
    <%_ if (prodDatabaseType === 'mariadb') { _%>
    <%= baseName.toLowerCase() %>-mariadb:
        extends:
            file: mariadb.yml
            service: <%= baseName.toLowerCase() %>-mariadb
    <%_ } _%>
    <%_ if (prodDatabaseType === 'postgresql') { _%>
    <%= baseName.toLowerCase() %>-postgresql:
        extends:
            file: postgresql.yml
            service: <%= baseName.toLowerCase() %>-postgresql
    <%_ } _%>
    <%_ if (prodDatabaseType === 'mongodb') { _%>
    <%= baseName.toLowerCase() %>-mongodb:
        extends:
            file: mongodb.yml
            service: <%= baseName.toLowerCase() %>-mongodb
    <%_ } _%>
    <%_ if (prodDatabaseType === 'couchbase') { _%>
    <%= baseName.toLowerCase() %>-couchbase:
        extends:
            file: couchbase.yml
            service: <%= baseName.toLowerCase() %>-couchbase
    <%_ } _%>
    <%_ if (prodDatabaseType === 'mssql') { _%>
    <%= baseName.toLowerCase() %>-mssql:
        extends:
            file: mssql.yml
            service: <%= baseName.toLowerCase() %>-mssql
    <%_ } _%>
    <%_ if (prodDatabaseType === 'cassandra') { _%>
    <%= baseName.toLowerCase() %>-cassandra:
        extends:
            file: cassandra-cluster.yml
            service: <%= baseName.toLowerCase() %>-cassandra
    <%= baseName.toLowerCase() %>-cassandra-node:
        image: <%= DOCKER_CASSANDRA %>
        environment:
            - CASSANDRA_SEEDS=<%= baseName.toLowerCase() %>-cassandra
    <%= baseName.toLowerCase() %>-cassandra-migration:
        extends:
            file: cassandra-migration.yml
            service: <%= baseName.toLowerCase() %>-cassandra-migration
        environment:
            - CREATE_KEYSPACE_SCRIPT=create-keyspace-prod.cql
    <%_ } _%>
    <%_ if (searchEngine === 'elasticsearch') { _%>
    <%= baseName.toLowerCase() %>-elasticsearch:
        extends:
            file: elasticsearch.yml
            service: <%= baseName.toLowerCase() %>-elasticsearch
    <%_ } _%>
    <%_ if (messageBroker === 'kafka') { _%>
    kafka:
        extends:
            file: kafka.yml
            service: kafka
        environment:
            - KAFKA_ADVERTISED_HOST_NAME=kafka
    zookeeper:
        extends:
            file: kafka.yml
            service: zookeeper
    <%_ } _%>
    <%_ if (serviceDiscoveryType === 'eureka') { _%>
    jhipster-registry:
        extends:
            file: jhipster-registry.yml
            service: jhipster-registry
        environment:
            - SPRING_CLOUD_CONFIG_SERVER_NATIVE_SEARCH_LOCATIONS=file:./central-config/docker-config/
     <%_ } _%>
    <%_ if (serviceDiscoveryType === 'consul') { _%>
    consul:
        image: <%= DOCKER_CONSUL %>
        command: consul agent -dev -ui -client 0.0.0.0
        ports:
            - 8300:8300
            - 8500:8500
            - 8600:8600

    consul-config-loader:
        image: <%= DOCKER_CONSUL_CONFIG_LOADER %>
        volumes:
            - ./central-server-config:/config
        environment:
            - INIT_SLEEP_SECONDS=5
            - CONSUL_URL=consul
            - CONSUL_PORT=8500
        # Uncomment to load configuration into Consul from a Git repository
        # as configured in central-server-config/git2consul.json
        # Also set SPRING_CLOUD_CONSUL_CONFIG_FORMAT=files on your apps
        #    - CONFIG_MODE=git
    <%_ } _%>
    <%_ if (authenticationType === 'oauth2') { _%>
    keycloak:
        extends:
            file: keycloak.yml
            service: keycloak
    <%_ } _%>