version: '2'
services:
    <%= baseName.toLowerCase() %>-cassandra:
        image: <%= DOCKER_CASSANDRA %>
        # volumes:
        #     - ~/volumes/jhipster/<%= baseName %>/cassandra/:/var/lib/cassandra/data
        ports:
            - 7000:7000
            - 7001:7001
            - 7199:7199
            - 9042:9042
            - 9160:9160
    <%=baseName.toLowerCase()%>-cassandra-node:
        image: <%= DOCKER_CASSANDRA %>
        environment:
            - CASSANDRA_SEEDS=<%= baseName.toLowerCase() %>-cassandra
    <%=baseName.toLowerCase()%>-cassandra-migration:
        extends:
            file: cassandra-migration.yml
            service: <%=baseName.toLowerCase()%>-cassandra-migration
        environment:
            - CREATE_KEYSPACE_SCRIPT=create-keyspace-prod.cql