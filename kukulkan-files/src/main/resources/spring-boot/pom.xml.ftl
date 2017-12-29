<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId><%= packageName %></groupId>
    <artifactId><%= dasherizedBaseName %></artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <packaging>war</packaging>
    <name><%= humanizedBaseName %></name>
    <%_ if (devDatabaseType === 'oracle' || prodDatabaseType === 'oracle') { _%>

    <!-- more information at https://blogs.oracle.com/dev2dev/entry/how_to_get_oracle_jdbc -->
    <repositories>
        <repository>
            <id>maven.oracle.com</id>
            <name>oracle-maven-repo</name>
            <url>https://maven.oracle.com</url>
            <layout>default</layout>
            <releases>
                <enabled>true</enabled>
                <updatePolicy>always</updatePolicy>
            </releases>
        </repository>
    </repositories>
    <%_ } _%>

    <properties>
        <!-- Build properties -->
        <maven.version>3.0.0</maven.version>
        <java.version><%= JAVA_VERSION %></java.version>
        <scala.version><%= SCALA_VERSION %></scala.version>
        <node.version>v<%= NODE_VERSION %></node.version>
        <%_ if (clientPackageManager === 'npm') { _%>
        <npm.version><%= NPM_VERSION %></npm.version>
        <%_ } _%>
        <%_ if (clientPackageManager === 'yarn') { _%>
        <yarn.version>v<%= YARN_VERSION %></yarn.version>
        <%_ } _%>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        <project.testresult.directory>${project.build.directory}/test-results</project.testresult.directory>
        <maven.build.timestamp.format>yyyyMMddHHmmss</maven.build.timestamp.format>
        <maven.compiler.source>${java.version}</maven.compiler.source>
        <maven.compiler.target>${java.version}</maven.compiler.target>
        <argLine>-Djava.security.egd=file:/dev/./urandom -Xmx256m</argLine>
        <m2e.apt.activation>jdt_apt</m2e.apt.activation>
        <run.addResources>false</run.addResources>
        <!-- These remain empty unless the corresponding profile is active -->
        <profile.no-liquibase />
        <profile.swagger />

        <!-- Dependency versions -->
        <jhipster-dependencies.version>0.1.5</jhipster-dependencies.version>
        <!-- The spring-boot version should match the one managed by
        https://mvnrepository.com/artifact/io.github.jhipster/jhipster-dependencies/${jhipster-dependencies.version} -->
        <spring-boot.version>1.5.9.RELEASE</spring-boot.version>
        <%_ if (databaseType === 'sql') { _%>
        <!-- The hibernate version should match the one managed by
        https://mvnrepository.com/artifact/io.github.jhipster/jhipster-dependencies/${jhipster-dependencies.version} -->
        <hibernate.version>5.2.12.Final</hibernate.version>
        <!-- The javassist version should match the one managed by
        https://mvnrepository.com/artifact/org.hibernate/hibernate-core/${hibernate.version} -->
        <javassist.version>3.20.0-GA</javassist.version>
        <!-- The liquibase version should match the one managed by
        https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies/${spring-boot.version} -->
        <liquibase.version>3.5.3</liquibase.version>
        <liquibase-hibernate5.version>3.6</liquibase-hibernate5.version>
        <validation-api.version>1.1.0.Final</validation-api.version>
        <%_ } _%>
        <mapstruct.version>1.2.0.Final</mapstruct.version>

        <!-- Plugin versions -->
        <maven-clean-plugin.version>2.6.1</maven-clean-plugin.version>
        <maven-compiler-plugin.version>3.7.0</maven-compiler-plugin.version>
        <maven-eclipse-plugin.version>2.10</maven-eclipse-plugin.version>
        <maven-enforcer-plugin.version>3.0.0-M1</maven-enforcer-plugin.version>
        <maven-resources-plugin.version>3.0.1</maven-resources-plugin.version>
        <maven-surefire-plugin.version>2.18.1</maven-surefire-plugin.version>
        <maven-war-plugin.version>2.6</maven-war-plugin.version>
        <dockerfile-maven-plugin.version>1.3.4</dockerfile-maven-plugin.version>
        <%_ if (!skipClient) { _%>
        <frontend-maven-plugin.version>1.6</frontend-maven-plugin.version>
        <%_ } _%>
        <%_ if (gatlingTests) { _%>
        <gatling-maven-plugin.version>2.2.1</gatling-maven-plugin.version>
        <%_ } _%>
        <jacoco-maven-plugin.version>0.7.9</jacoco-maven-plugin.version>
        <scala-maven-plugin.version>3.2.2</scala-maven-plugin.version>
        <sonar-maven-plugin.version>3.2</sonar-maven-plugin.version>
        <%_ if (enableSwaggerCodegen) { _%>
        <swagger-codegen-maven-plugin.version>2.2.3</swagger-codegen-maven-plugin.version>
        <%_ } _%>

        <!-- Sonar properties -->
        <%_ if (clientFramework === 'angular1') { _%>
        <sonar.exclusions><%= CLIENT_MAIN_SRC_DIR %>content/**/*.*, <%= CLIENT_MAIN_SRC_DIR %>bower_components/**/*.*, <%= CLIENT_MAIN_SRC_DIR %>i18n/*.js, <%= CLIENT_DIST_DIR %>**/*.*</sonar.exclusions>
        <%_ } else { _%>
        <sonar.exclusions><%= CLIENT_MAIN_SRC_DIR %>content/**/*.*, <%= CLIENT_MAIN_SRC_DIR %>i18n/*.js, <%= CLIENT_DIST_DIR %>**/*.*</sonar.exclusions>
        <%_ } _%>
        <sonar.issue.ignore.multicriteria>S3437,UndocumentedApi,BoldAndItalicTagsCheck</sonar.issue.ignore.multicriteria>
        <!-- Rule https://sonarqube.com/coding_rules#rule_key=Web%3ABoldAndItalicTagsCheck is ignored. Even if we agree that using the "i" tag is an awful practice, this is what is recommended by http://fontawesome.io/examples/ -->
        <sonar.issue.ignore.multicriteria.BoldAndItalicTagsCheck.resourceKey><%= CLIENT_MAIN_SRC_DIR %>app/**/*.*</sonar.issue.ignore.multicriteria.BoldAndItalicTagsCheck.resourceKey>
        <sonar.issue.ignore.multicriteria.BoldAndItalicTagsCheck.ruleKey>Web:BoldAndItalicTagsCheck</sonar.issue.ignore.multicriteria.BoldAndItalicTagsCheck.ruleKey>
        <!-- Rule https://sonarqube.com/coding_rules#rule_key=squid%3AS3437 is ignored, as a JPA-managed field cannot be transient -->
        <sonar.issue.ignore.multicriteria.S3437.resourceKey><%= MAIN_DIR %>java/**/*</sonar.issue.ignore.multicriteria.S3437.resourceKey>
        <sonar.issue.ignore.multicriteria.S3437.ruleKey>squid:S3437</sonar.issue.ignore.multicriteria.S3437.ruleKey>
        <!-- Rule http://sonarqube.com/coding_rules#rule_key=squid%3AUndocumentedApi is ignored, as we want to follow "clean code" guidelines and classes, methods and arguments names should be self-explanatory -->
        <sonar.issue.ignore.multicriteria.UndocumentedApi.resourceKey><%= MAIN_DIR %>java/**/*</sonar.issue.ignore.multicriteria.UndocumentedApi.resourceKey>
        <sonar.issue.ignore.multicriteria.UndocumentedApi.ruleKey>squid:UndocumentedApi</sonar.issue.ignore.multicriteria.UndocumentedApi.ruleKey>
        <sonar.jacoco.itReportPath>${project.testresult.directory}/coverage/jacoco/jacoco-it.exec</sonar.jacoco.itReportPath>
        <sonar.jacoco.reportPath>${project.testresult.directory}/coverage/jacoco/jacoco.exec</sonar.jacoco.reportPath>
        <sonar.java.codeCoveragePlugin>jacoco</sonar.java.codeCoveragePlugin>
        <sonar.javascript.jstestdriver.reportsPath>${project.testresult.directory}/karma</sonar.javascript.jstestdriver.reportsPath>
        <%_ if (clientFramework === 'angular1') { _%>
        <!-- For Sonar < 6.2 -->
        <sonar.javascript.lcov.reportPath>${project.testresult.directory}/coverage/report-lcov/lcov.info</sonar.javascript.lcov.reportPath>
        <!-- For Sonar >= 6.2 -->
        <sonar.javascript.lcov.reportPaths>${project.testresult.directory}/coverage/report-lcov/lcov.info</sonar.javascript.lcov.reportPaths>
        <%_ } else { _%>
        <sonar.typescript.lcov.reportPaths>${project.testresult.directory}/coverage/report-lcov/lcov.info</sonar.typescript.lcov.reportPaths>
        <%_ } _%>
        <sonar.sources>${project.basedir}/<%= MAIN_DIR %></sonar.sources>
        <sonar.surefire.reportsPath>${project.testresult.directory}/surefire-reports</sonar.surefire.reportsPath>
        <sonar.tests>${project.basedir}/<%= TEST_DIR %></sonar.tests>

        <!-- jhipster-needle-maven-property -->
    </properties>

    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>io.github.jhipster</groupId>
                <artifactId>jhipster-dependencies</artifactId>
                <version>${jhipster-dependencies.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <!-- jhipster-needle-maven-add-dependency-management -->
        </dependencies>
    </dependencyManagement>

    <dependencies>
        <%_ if (cacheProvider !== 'no') { _%>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-cache</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>io.github.jhipster</groupId>
            <artifactId>jhipster</artifactId>
        </dependency>
        <dependency>
            <groupId>io.dropwizard.metrics</groupId>
            <artifactId>metrics-core</artifactId>
        </dependency>
        <dependency>
            <groupId>io.dropwizard.metrics</groupId>
            <artifactId>metrics-annotation</artifactId>
        </dependency>
        <dependency>
            <groupId>io.dropwizard.metrics</groupId>
            <artifactId>metrics-json</artifactId>
        </dependency>
        <%_ if (['ehcache', 'infinispan'].includes(cacheProvider)) { _%>
        <dependency>
            <groupId>io.dropwizard.metrics</groupId>
            <artifactId>metrics-jcache</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>io.dropwizard.metrics</groupId>
            <artifactId>metrics-jvm</artifactId>
        </dependency>
        <dependency>
            <groupId>io.dropwizard.metrics</groupId>
            <artifactId>metrics-servlet</artifactId>
        </dependency>
        <dependency>
            <groupId>io.dropwizard.metrics</groupId>
            <artifactId>metrics-servlets</artifactId>
        </dependency>
        <%_ if (databaseType === 'sql') { _%>
        <dependency>
            <groupId>com.fasterxml.jackson.datatype</groupId>
            <artifactId>jackson-datatype-hibernate5</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>com.fasterxml.jackson.datatype</groupId>
            <artifactId>jackson-datatype-hppc</artifactId>
        </dependency>
        <dependency>
            <groupId>com.fasterxml.jackson.datatype</groupId>
            <artifactId>jackson-datatype-jsr310</artifactId>
        </dependency>
        <dependency>
            <groupId>com.fasterxml.jackson.datatype</groupId>
            <artifactId>jackson-datatype-json-org</artifactId>
        </dependency>
        <dependency>
            <groupId>com.fasterxml.jackson.module</groupId>
            <artifactId>jackson-module-afterburner</artifactId>
        </dependency>
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <scope>test</scope>
        </dependency>
        <%_ if (cacheProvider === 'hazelcast' || clusteredHttpSession === 'hazelcast' || applicationType === 'gateway') { _%>
        <dependency>
            <groupId>com.hazelcast</groupId>
            <artifactId>hazelcast</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (cacheProvider === 'hazelcast' && enableHibernateCache) { _%>
        <dependency>
            <groupId>com.hazelcast</groupId>
            <artifactId>hazelcast-hibernate52</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (cacheProvider === 'hazelcast' || clusteredHttpSession === 'hazelcast' || applicationType === 'gateway') { _%>
        <dependency>
            <groupId>com.hazelcast</groupId>
            <artifactId>hazelcast-spring</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (clusteredHttpSession === 'hazelcast') { _%>
        <dependency>
            <groupId>com.hazelcast</groupId>
            <artifactId>hazelcast-wm</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (cacheProvider === 'infinispan') { _%>
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-infinispan</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (cacheProvider === 'infinispan') { _%>
        <dependency>
            <groupId>org.infinispan</groupId>
            <artifactId>infinispan-spring-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>org.infinispan</groupId>
            <artifactId>infinispan-core</artifactId>
        </dependency>
        <dependency>
            <groupId>org.infinispan</groupId>
            <artifactId>infinispan-jcache</artifactId>
        </dependency>
        <dependency>
            <groupId>org.infinispan</groupId>
            <artifactId>infinispan-cloud</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>com.jayway.jsonpath</groupId>
            <artifactId>json-path</artifactId>
            <scope>test</scope>
            <!-- parent POM declares this dependency in default (compile) scope -->
        </dependency>
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
        </dependency>
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-bean-validators</artifactId>
        </dependency>
        <%_ if (databaseType === 'sql') { _%>
        <dependency>
            <groupId>com.mattbertolini</groupId>
            <artifactId>liquibase-slf4j</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>com.ryantenney.metrics</groupId>
            <artifactId>metrics-spring</artifactId>
        </dependency>
        <%_ if (databaseType === 'sql') { _%>
        <dependency>
            <groupId>com.zaxxer</groupId>
            <artifactId>HikariCP</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (databaseType === 'cassandra') { _%>
        <dependency>
            <groupId>commons-codec</groupId>
            <artifactId>commons-codec</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>commons-io</groupId>
            <artifactId>commons-io</artifactId>
        </dependency>
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-lang3</artifactId>
        </dependency>
        <%_ if (databaseType === 'mongodb') { _%>
        <dependency>
            <groupId>de.flapdoodle.embed</groupId>
            <artifactId>de.flapdoodle.embed.mongo</artifactId>
            <scope>test</scope>
        </dependency>
        <%_ } _%>
        <%_ if (databaseType === 'couchbase') { _%>
        <dependency>
            <groupId>com.github.differentway</groupId>
            <artifactId>couchbase-testcontainer</artifactId>
            <scope>test</scope>
        </dependency>
        <%_ } _%>
        <%_ if (gatlingTests) { _%>
        <dependency>
            <groupId>io.gatling.highcharts</groupId>
            <artifactId>gatling-charts-highcharts</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>com.jcraft</groupId>
            <artifactId>jzlib</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (['ehcache', 'hazelcast', 'infinispan'].includes(cacheProvider) || applicationType === 'gateway') { _%>
        <dependency>
            <groupId>javax.cache</groupId>
            <artifactId>cache-api</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (devDatabaseType === 'mysql' || prodDatabaseType === 'mysql') { _%>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (devDatabaseType === 'mariadb' || prodDatabaseType === 'mariadb') { _%>
        <dependency>
            <groupId>org.mariadb.jdbc</groupId>
            <artifactId>mariadb-java-client</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (databaseType === 'cassandra') { _%>
        <dependency>
            <groupId>org.lz4</groupId>
            <artifactId>lz4-java</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (devDatabaseType === 'oracle' || prodDatabaseType === 'oracle') { _%>
        <!-- more information at https://blogs.oracle.com/dev2dev/entry/how_to_get_oracle_jdbc -->
        <dependency>
            <groupId>com.oracle.jdbc</groupId>
            <artifactId>ojdbc7</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (devDatabaseType === 'mssql' || prodDatabaseType === 'mssql') { _%>
        <dependency>
            <groupId>com.microsoft.sqlserver</groupId>
            <artifactId>mssql-jdbc</artifactId>
        </dependency>
        <dependency>
            <groupId>com.github.sabomichal</groupId>
            <artifactId>liquibase-mssql</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>org.assertj</groupId>
            <artifactId>assertj-core</artifactId>
            <scope>test</scope>
        </dependency>
        <%_ if (databaseType === 'cassandra') { _%>
        <dependency>
            <groupId>org.cassandraunit</groupId>
            <artifactId>cassandra-unit-spring</artifactId>
            <scope>test</scope>
        </dependency>
        <%_ } _%>
        <%_ if (cacheProvider === 'ehcache') { _%>
        <dependency>
            <groupId>org.ehcache</groupId>
            <artifactId>ehcache</artifactId>
        </dependency>
            <%_ if (enableHibernateCache) { _%>
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-jcache</artifactId>
        </dependency>
            <%_ } _%>
        <%_ } _%>
        <%_ if (databaseType === 'sql') { _%>
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-envers</artifactId>
        </dependency>
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-validator</artifactId>
        </dependency>
        <dependency>
            <groupId>org.liquibase</groupId>
            <artifactId>liquibase-core</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>net.logstash.logback</groupId>
            <artifactId>logstash-logback-encoder</artifactId>
        </dependency>
        <%_ if (databaseType === 'mongodb') { _%>
        <dependency>
            <groupId>com.google.guava</groupId>
            <artifactId>guava</artifactId>
        </dependency>
        <dependency>
            <groupId>com.github.mongobee</groupId>
            <artifactId>mongobee</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (databaseType === 'couchbase') { _%>
        <dependency>
            <groupId>com.github.differentway</groupId>
            <artifactId>couchmove</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (devDatabaseType === 'postgresql' || prodDatabaseType === 'postgresql') { _%>
        <dependency>
            <groupId>org.postgresql</groupId>
            <artifactId>postgresql</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>org.mapstruct</groupId>
            <artifactId>mapstruct-jdk8</artifactId>
            <version>${mapstruct.version}</version>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context-support</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-autoconfigure</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-configuration-processor</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-loader-tools</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-aop</artifactId>
        </dependency>
        <%_ if (databaseType === 'sql') { _%>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (searchEngine === 'elasticsearch') { _%>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-elasticsearch</artifactId>
        </dependency>
        <dependency>
            <groupId>net.java.dev.jna</groupId>
            <artifactId>jna</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (databaseType === 'mongodb' || databaseType === 'couchbase') { _%>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-<%=databaseType%></artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (messageBroker === 'kafka') { _%>
        <!-- Kafka support -->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-stream</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-stream-binder-kafka</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-stream-test-support</artifactId>
            <scope>test</scope>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-logging</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-mail</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.security</groupId>
            <artifactId>spring-security-test</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-test</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-thymeleaf</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.zalando</groupId>
            <artifactId>problem-spring-web</artifactId>
        </dependency>
        <%_ if (websocket === 'spring-websocket') { _%>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-websocket</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (authenticationType === 'oauth2') { _%>
        <dependency>
            <groupId>org.springframework.security.oauth</groupId>
            <artifactId>spring-security-oauth2</artifactId>
        </dependency>
            <%_ if (applicationType === 'gateway' || applicationType === 'microservice') { _%>
        <dependency>
            <groupId>org.springframework.security</groupId>
            <artifactId>spring-security-jwt</artifactId>
        </dependency>
            <%_ } _%>
        <%_ } _%>
        <%_ if (authenticationType === 'jwt') { _%>
        <dependency>
            <groupId>io.jsonwebtoken</groupId>
            <artifactId>jjwt</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (authenticationType === 'uaa') { _%>
        <dependency>
            <groupId>org.springframework.security.oauth</groupId>
            <artifactId>spring-security-oauth2</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.security</groupId>
            <artifactId>spring-security-jwt</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (databaseType === 'cassandra') { _%>
        <!-- DataStax driver -->
        <dependency>
            <groupId>com.datastax.cassandra</groupId>
            <artifactId>cassandra-driver-core</artifactId>
        </dependency>
        <dependency>
            <groupId>com.datastax.cassandra</groupId>
            <artifactId>cassandra-driver-extras</artifactId>
        </dependency>
        <dependency>
            <groupId>com.datastax.cassandra</groupId>
            <artifactId>cassandra-driver-mapping</artifactId>
        </dependency>
        <%_ } _%>
        <!-- Spring Cloud -->
        <%_ if (applicationType === 'gateway') { _%>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-zuul</artifactId>
        </dependency>
        <dependency>
            <groupId>com.github.vladimir-bukhtoyarov</groupId>
            <artifactId>bucket4j-core</artifactId>
        </dependency>
        <dependency>
            <groupId>com.github.vladimir-bukhtoyarov</groupId>
            <artifactId>bucket4j-jcache</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (applicationType === 'microservice' || applicationType === 'gateway' || applicationType === 'uaa') { _%>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-ribbon</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-hystrix</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-spectator</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.retry</groupId>
            <artifactId>spring-retry</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (serviceDiscoveryType === 'eureka') { _%>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-eureka</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-config</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (serviceDiscoveryType === 'consul') { _%>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-consul-discovery</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-consul-config</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (authenticationType === 'uaa') { _%>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-security</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (applicationType === 'microservice' || applicationType === 'gateway' || applicationType === 'uaa') { _%>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-feign</artifactId>
        </dependency>
        <%_ } _%>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-spring-service-connector</artifactId>
        </dependency>
        <!-- Security -->
        <dependency>
            <groupId>org.springframework.security</groupId>
            <artifactId>spring-security-data</artifactId>
        </dependency>
        <%_ if (websocket === 'spring-websocket') { _%>
        <dependency>
            <groupId>org.springframework.security</groupId>
            <artifactId>spring-security-messaging</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (enableSocialSignIn) { _%>
        <!-- Social -->
        <dependency>
            <groupId>org.apache.httpcomponents</groupId>
            <artifactId>httpclient</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.social</groupId>
            <artifactId>spring-social-security</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.social</groupId>
            <artifactId>spring-social-google</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.social</groupId>
            <artifactId>spring-social-facebook</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.social</groupId>
            <artifactId>spring-social-twitter</artifactId>
        </dependency>
        <%_ } _%>
        <%_ if (cucumberTests) { _%>
        <!-- Cucumber -->
        <dependency>
            <groupId>info.cukes</groupId>
            <artifactId>cucumber-junit</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>info.cukes</groupId>
            <artifactId>cucumber-spring</artifactId>
            <scope>test</scope>
        </dependency>
        <%_ } _%>
        <!-- jhipster-needle-maven-add-dependency -->
    </dependencies>

    <build>
        <defaultGoal>spring-boot:run</defaultGoal>
        <%_ if (cucumberTests) { _%>
        <testResources>
            <testResource>
                <directory><%= SERVER_TEST_RES_DIR %></directory>
            </testResource>
            <testResource>
                <directory><%= TEST_DIR %>features</directory>
            </testResource>
        </testResources>
        <%_ } _%>
        <plugins>
            <%_ if (gatlingTests) { _%>
            <plugin>
                <groupId>io.gatling</groupId>
                <artifactId>gatling-maven-plugin</artifactId>
                <version>${gatling-maven-plugin.version}</version>
                <configuration>
                    <configFolder><%= TEST_DIR %>gatling/conf</configFolder>
                    <dataFolder><%= TEST_DIR %>gatling/user-files/data</dataFolder>
                    <resultsFolder>target/gatling/results/${maven.build.timestamp}/</resultsFolder>
                    <bodiesFolder><%= TEST_DIR %>gatling/user-files/bodies</bodiesFolder>
                    <simulationsFolder><%= TEST_DIR %>gatling/user-files/simulations</simulationsFolder>
                    <!-- If uncommented, these arguments below will be applied to all your gatling tests -->
                    <!--<jvmArgs>
                        <jvmArg>-Dusers=100</jvmArg>
                        <jvmArg>-Dramp=1</jvmArg>
                    </jvmArgs>-->
                    <!--
                    This will run multiple simulations one by one. Useful when doing Gatling
                    tests in CI.
                    -->
                    <runMultipleSimulations>true</runMultipleSimulations>
                    <!--
                    To run only one simulation, you need to disable the "runMultipleSimulations"
                    above, and write the name of your simulation below.
                    -->
                    <!--<simulationClass>WriteTheNameOfYourGatlingSimulation</simulationClass>-->
                </configuration>
            </plugin>
            <%_ } _%>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>${maven-compiler-plugin.version}</version>
                <configuration>
                    <annotationProcessorPaths>
                        <path>
                            <groupId>org.mapstruct</groupId>
                            <artifactId>mapstruct-processor</artifactId>
                            <version>${mapstruct.version}</version>
                        </path>
<%_ if (databaseType === 'sql') { _%>
                        <!-- For JPA static metamodel generation -->
                        <path>
                            <groupId>org.hibernate</groupId>
                            <artifactId>hibernate-jpamodelgen</artifactId>
                            <version>${hibernate.version}</version>
                        </path>
<% } %>
                    </annotationProcessorPaths>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-eclipse-plugin</artifactId>
                <version>${maven-eclipse-plugin.version}</version>
                <configuration>
                    <downloadSources>true</downloadSources>
                    <downloadJavadocs>true</downloadJavadocs>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-enforcer-plugin</artifactId>
                <version>${maven-enforcer-plugin.version}</version>
                <executions>
                    <execution>
                        <id>enforce-versions</id>
                        <goals>
                            <goal>enforce</goal>
                        </goals>
                    </execution>
                </executions>
                <configuration>
                    <rules>
                        <requireMavenVersion>
                            <message>You are running an older version of Maven. JHipster requires at least Maven ${maven.version}</message>
                            <version>[${maven.version},)</version>
                        </requireMavenVersion>
                        <requireJavaVersion>
                            <!-- Until JHipster supports JDK 9 -->
                            <message>You are running an incompatible version of Java. JHipster requires JDK ${java.version}</message>
                            <version>[1.8,1.9)</version>
                        </requireJavaVersion>
                    </rules>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-resources-plugin</artifactId>
                <version>${maven-resources-plugin.version}</version>
                <executions>
                    <execution>
                        <id>default-resources</id>
                        <phase>validate</phase>
                        <goals>
                            <goal>copy-resources</goal>
                        </goals>
                        <configuration>
                            <outputDirectory>target/classes</outputDirectory>
                            <useDefaultDelimiters>false</useDefaultDelimiters>
                            <delimiters>
                                <delimiter>#</delimiter>
                            </delimiters>
                            <resources>
                                <resource>
                                    <directory><%= SERVER_MAIN_RES_DIR %></directory>
                                    <filtering>true</filtering>
                                    <includes>
                                        <include>config/application.yml</include>
                                    </includes>
                                </resource>
                                <resource>
                                    <directory><%= SERVER_MAIN_RES_DIR %></directory>
                                    <filtering>false</filtering>
                                    <excludes>
                                        <exclude>config/application.yml</exclude>
                                    </excludes>
                                </resource>
                            </resources>
                        </configuration>
                    </execution>
                    <execution>
                        <id>docker-resources</id>
                        <phase>validate</phase>
                        <goals>
                            <goal>copy-resources</goal>
                        </goals>
                        <configuration>
                            <outputDirectory>target/</outputDirectory>
                            <resources>
                                <resource>
                                    <directory>src/main/docker/</directory>
                                    <filtering>false</filtering>
                                    <excludes>
                                        <exclude>**/*.yml</exclude>
                                    </excludes>
                                </resource>
                            </resources>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>${maven-surefire-plugin.version}</version>
                <%_ if (cucumberTests) { _%>
                <executions>
                    <execution>
                        <id>default-test</id>
                        <configuration>
                            <excludes>
                                <exclude>**/Abstract*.java</exclude>
                                <exclude>**/*Cucumber*.java</exclude>
                            </excludes>
                        </configuration>
                    </execution>
                    <execution>
                        <id>without-cucumber</id>
                        <goals>
                            <goal>test</goal>
                        </goals>
                        <configuration>
                            <includes>
                                <include>**/*Cucumber*.java</include>
                            </includes>
                        </configuration>
                    </execution>
                </executions>
                <%_ } _%>
                <configuration>
                    <!-- Force alphabetical order to have a reproducible build -->
                    <runOrder>alphabetical</runOrder>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.jacoco</groupId>
                <artifactId>jacoco-maven-plugin</artifactId>
                <version>${jacoco-maven-plugin.version}</version>
                <executions>
                    <execution>
                        <id>pre-unit-tests</id>
                        <goals>
                            <goal>prepare-agent</goal>
                        </goals>
                        <configuration>
                            <!-- Sets the path to the file which contains the execution data. -->
                            <destFile>${project.testresult.directory}/coverage/jacoco/jacoco.exec</destFile>
                        </configuration>
                    </execution>
                    <!-- Ensures that the code coverage report for unit tests is created after unit tests have been run -->
                    <execution>
                        <id>post-unit-test</id>
                        <phase>test</phase>
                        <goals>
                            <goal>report</goal>
                        </goals>
                        <configuration>
                            <dataFile>${project.testresult.directory}/coverage/jacoco/jacoco.exec</dataFile>
                            <outputDirectory>${project.testresult.directory}/coverage/jacoco</outputDirectory>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
            <plugin>
                <groupId>org.sonarsource.scanner.maven</groupId>
                <artifactId>sonar-maven-plugin</artifactId>
                <version>${sonar-maven-plugin.version}</version>
            </plugin>
            <%_ if (databaseType === 'sql') { _%>
            <plugin>
                <groupId>org.liquibase</groupId>
                <artifactId>liquibase-maven-plugin</artifactId>
                <version>${liquibase.version}</version>
                <configuration>
                    <changeLogFile><%= SERVER_MAIN_RES_DIR %>config/liquibase/master.xml</changeLogFile>
                    <diffChangeLogFile><%= SERVER_MAIN_RES_DIR %>config/liquibase/changelog/${maven.build.timestamp}_changelog.xml</diffChangeLogFile>
                    <driver><% if (devDatabaseType === 'mysql') { %>com.mysql.jdbc.Driver<% } else if (devDatabaseType === 'mariadb') { %>org.mariadb.jdbc.Driver<% } else if (devDatabaseType === 'postgresql') { %>org.postgresql.Driver<% } else if (devDatabaseType === 'h2Disk') { %>org.h2.Driver<% } else if (devDatabaseType === 'oracle') { %>oracle.jdbc.OracleDriver<% } %></driver>
                    <url><% if (devDatabaseType === 'mysql') { %>jdbc:mysql://localhost:3306/<%= baseName %><% } else if (devDatabaseType === 'mariadb') { %>jdbc:mariadb://localhost:3306/<%= baseName %><% } else if (devDatabaseType === 'postgresql') { %>jdbc:postgresql://localhost:5432/<%= baseName %><% } else if (devDatabaseType === 'h2Disk') { %>jdbc:h2:file:./target/h2db/db/<%= lowercaseBaseName %><% } else if (devDatabaseType === 'oracle') { %>jdbc:oracle:thin:@localhost:1521:<%= baseName %><% } else if (devDatabaseType === 'mssql') { %>jdbc:sqlserver://localhost:1433;database=<%= baseName %><% } %></url>
                    <defaultSchemaName><% if (devDatabaseType === 'mysql') { %><%= baseName %><% } else if (devDatabaseType === 'postgresql') { %><% } %></defaultSchemaName>
                    <username><% if (devDatabaseType === 'mysql') { %>root<% } else if (devDatabaseType === 'postgresql' || devDatabaseType === 'h2Disk' || devDatabaseType === 'h2Memory') { %><%= baseName %><% } else if (devDatabaseType === 'mssql') { %>SA<% } %></username>
                    <password><% if (devDatabaseType === 'mssql') { %>yourStrong(!)Password<% } %></password>
                    <referenceUrl>hibernate:spring:<%=packageName%>.domain?dialect=<% if (devDatabaseType === 'mysql') { %>org.hibernate.dialect.MySQL5InnoDBDialect<% } else if (devDatabaseType === 'mariadb') { %>org.hibernate.dialect.MySQL5InnoDBDialect<% } else if (devDatabaseType === 'postgresql') { %>org.hibernate.dialect.PostgreSQL82Dialect<% } else if (devDatabaseType === 'h2Disk') { %>org.hibernate.dialect.H2Dialect<% } else if (devDatabaseType === 'oracle') { %>org.hibernate.dialect.Oracle12cDialect<% } else if (devDatabaseType === 'mssql') { %>org.hibernate.dialect.SQLServerDialect<% } %>&amp;hibernate.physical_naming_strategy=org.springframework.boot.orm.jpa.hibernate.SpringPhysicalNamingStrategy&amp;hibernate.implicit_naming_strategy=org.springframework.boot.orm.jpa.hibernate.SpringImplicitNamingStrategy</referenceUrl>
                    <verbose>true</verbose>
                    <logging>debug</logging>
                    <%_ if (authenticationType === 'oauth2') { _%>
                    <diffExcludeObjects>oauth_access_token, oauth_approvals, oauth_client_details, oauth_client_token, oauth_code, oauth_refresh_token</diffExcludeObjects>
                    <%_ } _%>
                </configuration>
                <dependencies>
                    <dependency>
                        <groupId>org.javassist</groupId>
                        <artifactId>javassist</artifactId>
                        <version>${javassist.version}</version>
                    </dependency>
                    <dependency>
                        <groupId>org.liquibase.ext</groupId>
                        <artifactId>liquibase-hibernate5</artifactId>
                        <version>${liquibase-hibernate5.version}</version>
                    </dependency>
                    <dependency>
                        <groupId>org.springframework.boot</groupId>
                        <artifactId>spring-boot-starter-data-jpa</artifactId>
                        <version>${spring-boot.version}</version>
                    </dependency>
                    <dependency>
                        <groupId>javax.validation</groupId>
                        <artifactId>validation-api</artifactId>
                        <version>${validation-api.version}</version>
                    </dependency>
                </dependencies>
            </plugin>
            <%_ } _%>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <version>${spring-boot.version}</version>
                <executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                </executions>
                <configuration>
                    <mainClass>${start-class}</mainClass>
                    <executable>true</executable>
                    <fork>true</fork>
                    <!--
                    Enable the line below to have remote debugging of your application on port 5005
                    <jvmArguments>-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005</jvmArguments>
                    -->
                </configuration>
            </plugin>
            <plugin>
                <groupId>com.spotify</groupId>
                <artifactId>dockerfile-maven-plugin</artifactId>
                <version>${dockerfile-maven-plugin.version}</version>
                <!--
                Uncomment the section below to build the docker image with mvn package and and push it with mvn deploy
                <executions>
                    <execution>
                    <id>default</id>
                    <goals>
                        <goal>build</goal>
                        <goal>push</goal>
                    </goals>
                    </execution>
                </executions>
                -->
                <configuration>
                    <repository><%= baseName.toLowerCase()%></repository>
                    <tag>latest</tag>
                    <contextDirectory>${project.build.directory}</contextDirectory>
                </configuration>
            </plugin>
            <%_ if (enableSwaggerCodegen) { _%>
            <plugin>
                <!--
                    Plugin that provides API-first development using swagger-codegen to
                    generate Spring-MVC endpoint stubs at compile time from a swagger definition file
                -->
                <groupId>io.swagger</groupId>
                <artifactId>swagger-codegen-maven-plugin</artifactId>
                <version>${swagger-codegen-maven-plugin.version}</version>
                <executions>
                    <execution>
                        <goals>
                            <goal>generate</goal>
                        </goals>
                        <configuration>
                            <inputSpec>${project.basedir}/<%= SERVER_MAIN_RES_DIR %>swagger/api.yml</inputSpec>
                            <language>spring</language>
                            <apiPackage><%= packageName %>.web.api</apiPackage>
                            <modelPackage><%= packageName %>.web.api.model</modelPackage>
                            <generateSupportingFiles>false</generateSupportingFiles>
                            <configOptions>
                                <interfaceOnly>true</interfaceOnly>
                                <java8>true</java8>
                            </configOptions>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
            <%_ } _%>
            <!-- jhipster-needle-maven-add-plugin -->
        </plugins>
        <pluginManagement>
            <plugins>
                <!--
                    This plugin's configuration is used to store Eclipse m2e settings only.
                    It has no influence on the Maven build itself.
                    Remove when the m2e plugin can correctly bind to Maven lifecycle
                -->
                <plugin>
                    <groupId>org.eclipse.m2e</groupId>
                    <artifactId>lifecycle-mapping</artifactId>
                    <version>1.0.0</version>
                    <configuration>
                        <lifecycleMappingMetadata>
                            <pluginExecutions>
                                <pluginExecution>
                                    <pluginExecutionFilter>
                                        <groupId>org.jacoco</groupId>
                                        <artifactId>
                                            jacoco-maven-plugin
                                        </artifactId>
                                        <versionRange>
                                            ${jacoco-maven-plugin.version}
                                        </versionRange>
                                        <goals>
                                            <goal>prepare-agent</goal>
                                        </goals>
                                    </pluginExecutionFilter>
                                    <action>
                                        <ignore/>
                                    </action>
                                </pluginExecution>
                                <%_ if(!skipClient) { _%>
                                <pluginExecution>
                                    <pluginExecutionFilter>
                                        <groupId>com.github.eirslett</groupId>
                                        <artifactId>frontend-maven-plugin</artifactId>
                                        <versionRange>${frontend-maven-plugin.version}</versionRange>
                                        <goals>
                                            <%_ if (clientPackageManager === 'yarn') { _%>
                                            <goal>install-node-and-yarn</goal>
                                            <goal>yarn</goal>
                                            <%_ } else if (clientPackageManager === 'npm') { _%>
                                            <goal>install-node-and-npm</goal>
                                            <goal>npm</goal>
                                            <%_ } _%>
                                            <%_ if (clientFramework === 'angular1') { _%>
                                            <goal>bower</goal>
                                            <goal>gulp</goal>
                                            <%_ } _%>
                                        </goals>
                                    </pluginExecutionFilter>
                                    <action>
                                        <ignore/>
                                    </action>
                                </pluginExecution>
                                <%_ } _%>
                            </pluginExecutions>
                        </lifecycleMappingMetadata>
                    </configuration>
                </plugin>
            </plugins>
        </pluginManagement>
    </build>
    <profiles>
        <profile>
            <id>no-liquibase</id>
            <properties>
                <profile.no-liquibase>,no-liquibase</profile.no-liquibase>
            </properties>
        </profile>
        <profile>
            <id>swagger</id>
            <properties>
                <profile.swagger>,swagger</profile.swagger>
            </properties>
        </profile>
        <%_ if (!skipClient && clientFramework !== 'angular1') { _%>
        <profile>
            <id>webpack</id>
            <build>
                <plugins>
                    <plugin>
                        <groupId>com.github.eirslett</groupId>
                        <artifactId>frontend-maven-plugin</artifactId>
                        <version>${frontend-maven-plugin.version}</version>
                        <executions>
                            <%_ if (clientPackageManager === 'yarn') { _%>
                            <execution>
                                <id>install node and yarn</id>
                                <goals>
                                    <goal>install-node-and-yarn</goal>
                                </goals>
                                <configuration>
                                    <nodeVersion>${node.version}</nodeVersion>
                                    <yarnVersion>${yarn.version}</yarnVersion>
                                </configuration>
                            </execution>
                            <%_ } else if (clientPackageManager === 'npm') { _%>
                            <execution>
                                <id>install node and npm</id>
                                <goals>
                                    <goal>install-node-and-npm</goal>
                                </goals>
                                <configuration>
                                    <nodeVersion>${node.version}</nodeVersion>
                                    <npmVersion>${npm.version}</npmVersion>
                                </configuration>
                            </execution>
                            <%_ } _%>
                            <execution>
                                <id>webpack build dev</id>
                                <goals>
                                    <goal><%= clientPackageManager %></goal>
                                </goals>
                                <phase>generate-resources</phase>
                                <configuration>
                                    <arguments>run webpack:build</arguments>
                                    <%_ if (clientPackageManager === 'yarn') { _%>
                                    <yarnInheritsProxyConfigFromMaven>false</yarnInheritsProxyConfigFromMaven>
                                    <%_ } else if (clientPackageManager === 'npm') { _%>
                                    <npmInheritsProxyConfigFromMaven>false</npmInheritsProxyConfigFromMaven>
                                    <%_ } _%>
                                </configuration>
                            </execution>
                        </executions>
                    </plugin>
                </plugins>
            </build>
        </profile>
        <%_ } _%>
        <profile>
            <id>dev</id>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <dependencies>
                <dependency>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-starter-undertow</artifactId>
                </dependency>
                <dependency>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-devtools</artifactId>
                    <optional>true</optional>
                </dependency>
                <%_ if (devDatabaseType === 'h2Disk' || devDatabaseType === 'h2Memory') { _%>
                <dependency>
                    <groupId>com.h2database</groupId>
                    <artifactId>h2</artifactId>
                </dependency>
                <%_ } _%>
            </dependencies>
            <build>
                <plugins>
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-war-plugin</artifactId>
                        <version>${maven-war-plugin.version}</version>
                        <configuration>
                            <failOnMissingWebXml>false</failOnMissingWebXml>
                            <%_ if (!skipClient) { _%>
                            <warSourceDirectory><% if (clientFramework !== 'angular1') { %><%= CLIENT_DIST_DIR %><% } else { %><%= CLIENT_MAIN_SRC_DIR %><% } %></warSourceDirectory>
                            <webResources>
                                <resource>
                                    <directory>src/main/webapp</directory>
                                    <includes>
                                        <include>WEB-INF/**</include>
                                    </includes>
                                </resource>
                            </webResources>
                            <%_ } _%>
                        </configuration>
                    </plugin>
                </plugins>
            </build>
            <properties>
                <!-- default Spring profiles -->
                <spring.profiles.active>dev${profile.no-liquibase}</spring.profiles.active>
            </properties>
        </profile>
        <profile>
            <id>prod</id>
            <dependencies>
                <dependency>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-starter-undertow</artifactId>
                </dependency>
            </dependencies>
            <build>
                <plugins>
                    <plugin>
                        <artifactId>maven-clean-plugin</artifactId>
                        <version>${maven-clean-plugin.version}</version>
                        <configuration>
                            <filesets>
                                <fileset>
                                    <directory><%= CLIENT_DIST_DIR %></directory>
                                </fileset>
                            </filesets>
                        </configuration>
                    </plugin>
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-war-plugin</artifactId>
                        <version>${maven-war-plugin.version}</version>
                        <configuration>
                            <failOnMissingWebXml>false</failOnMissingWebXml>
                            <%_ if (!skipClient) { _%>
                            <warSourceDirectory><%= CLIENT_DIST_DIR %></warSourceDirectory>
                            <webResources>
                                <resource>
                                    <directory>src/main/webapp</directory>
                                    <includes>
                                        <include>WEB-INF/**</include>
                                    </includes>
                                </resource>
                            </webResources>
                            <%_ } _%>
                        </configuration>
                    </plugin>
                    <plugin>
                        <groupId>org.springframework.boot</groupId>
                        <artifactId>spring-boot-maven-plugin</artifactId>
                        <version>${spring-boot.version}</version>
                        <configuration>
                            <mainClass>${start-class}</mainClass>
                            <executable>true</executable>
                        </configuration>
                        <executions>
                            <execution>
                                <goals>
                                    <goal>build-info</goal>
                                </goals>
                            </execution>
                        </executions>
                    </plugin>
                    <%_ if (!skipClient) { _%>
                    <plugin>
                        <groupId>com.github.eirslett</groupId>
                        <artifactId>frontend-maven-plugin</artifactId>
                        <version>${frontend-maven-plugin.version}</version>
                        <executions>
                            <%_ if (clientPackageManager === 'yarn') { _%>
                            <execution>
                                <id>install node and yarn</id>
                                <goals>
                                    <goal>install-node-and-yarn</goal>
                                </goals>
                                <configuration>
                                    <nodeVersion>${node.version}</nodeVersion>
                                    <yarnVersion>${yarn.version}</yarnVersion>
                                </configuration>
                            </execution>
                            <execution>
                                <id>yarn install</id>
                                <goals>
                                    <goal>yarn</goal>
                                </goals>
                                <configuration>
                                    <%_ if (useSass) { _%>
                                    <arguments>install --force</arguments>
                                    <%_ } else { _%>
                                    <arguments>install</arguments>
                                    <%_ } _%>
                                </configuration>
                            </execution>
                            <%_ } else if (clientPackageManager === 'npm') { _%>
                            <execution>
                                <id>install node and npm</id>
                                <goals>
                                    <goal>install-node-and-npm</goal>
                                </goals>
                                <configuration>
                                    <nodeVersion>${node.version}</nodeVersion>
                                    <npmVersion>${npm.version}</npmVersion>
                                </configuration>
                            </execution>
                            <execution>
                                <id>npm install</id>
                                <goals>
                                    <goal>npm</goal>
                                </goals>
                                <configuration>
                                    <arguments>install</arguments>
                                </configuration>
                            </execution>
                                <%_ if (useSass) { _%>
                            <execution>
                                <id>npm rebuild node-sass</id>
                                <goals>
                                    <goal>npm</goal>
                                </goals>
                                <configuration>
                                    <arguments>rebuild node-sass</arguments>
                                </configuration>
                            </execution>
                                <%_ } _%>
                            <%_ } _%>
                            <%_ if (clientFramework === 'angular1') { _%>
                            <execution>
                                <id>bower install</id>
                                <goals>
                                    <goal>bower</goal>
                                </goals>
                                <configuration>
                                    <arguments>install --no-color</arguments>
                                </configuration>
                            </execution>
                            <execution>
                                <id>gulp build</id>
                                <goals>
                                    <goal>gulp</goal>
                                </goals>
                                <configuration>
                                    <arguments>build --no-notification</arguments>
                                </configuration>
                            </execution>
                            <execution>
                                <id>gulp test</id>
                                <goals>
                                    <goal>gulp</goal>
                                </goals>
                                <phase>test</phase>
                                <configuration>
                                    <arguments>test --no-notification</arguments>
                                </configuration>
                            </execution>
                            <%_ } _%>
                            <%_ if (clientFramework !== 'angular1') { _%>
                            <execution>
                                <id>webpack build test</id>
                                <goals>
                                    <goal><%= clientPackageManager %></goal>
                                </goals>
                                <phase>test</phase>
                                <configuration>
                                    <arguments>run webpack:test</arguments>
                                    <%_ if (clientPackageManager === 'yarn') { _%>
                                    <yarnInheritsProxyConfigFromMaven>false</yarnInheritsProxyConfigFromMaven>
                                    <%_ } else if (clientPackageManager === 'npm') { _%>
                                    <npmInheritsProxyConfigFromMaven>false</npmInheritsProxyConfigFromMaven>
                                    <%_ } _%>
                                </configuration>
                            </execution>
                            <execution>
                                <id>webpack build prod</id>
                                <goals>
                                    <goal><%= clientPackageManager %></goal>
                                </goals>
                                <phase>generate-resources</phase>
                                <configuration>
                                    <arguments>run webpack:prod</arguments>
                                    <%_ if (clientPackageManager === 'yarn') { _%>
                                    <yarnInheritsProxyConfigFromMaven>false</yarnInheritsProxyConfigFromMaven>
                                    <%_ } else if (clientPackageManager === 'npm') { _%>
                                    <npmInheritsProxyConfigFromMaven>false</npmInheritsProxyConfigFromMaven>
                                    <%_ } _%>
                                </configuration>
                            </execution>
                            <%_ } _%>
                        </executions>
                    </plugin>
                    <%_ } _%>
                </plugins>
            </build>
            <properties>
                <!-- default Spring profiles -->
                <spring.profiles.active>prod${profile.swagger}${profile.no-liquibase}</spring.profiles.active>
            </properties>
        </profile>
        <profile>
            <!--
                Profile for doing "continuous compilation" with the Scala Maven plugin.
                It allows automatic compilation of Java classes as soon as they are saved.
                To use it, run in 3 terminals:
                - './mvnw -Pcc scala:cc' for continuous compilation of your classes
                - './mvnw -Pcc' for hot reload of Spring boot
                - 'npm start/yarn start' for hot reload of the HTML/JavaScript asset
                Everything should hot reload automatically!
            -->
            <id>cc</id>
            <dependencies>
                <dependency>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-starter-undertow</artifactId>
                </dependency>
                <dependency>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-devtools</artifactId>
                    <optional>true</optional>
                </dependency>
            </dependencies>
            <build>
                <plugins>
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-war-plugin</artifactId>
                        <version>${maven-war-plugin.version}</version>
                        <configuration>
                            <failOnMissingWebXml>false</failOnMissingWebXml>
                            <warSourceDirectory>src/main/webapp/</warSourceDirectory>
                        </configuration>
                    </plugin>
                    <plugin>
                        <groupId>org.springframework.boot</groupId>
                        <artifactId>spring-boot-maven-plugin</artifactId>
                        <version>${spring-boot.version}</version>
                        <configuration>
                            <mainClass>${start-class}</mainClass>
                            <executable>true</executable>
                            <fork>true</fork>
                            <addResources>true</addResources>
                            <!--
                            Enable the line below to have remote debugging of your application on port 5005
                            <jvmArguments>-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005</jvmArguments>
                            -->
                        </configuration>
                    </plugin>
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-compiler-plugin</artifactId>
                        <version>${maven-compiler-plugin.version}</version>
                        <executions>
                            <execution>
                                <id>default-compile</id>
                                <phase>none</phase>
                            </execution>
                            <execution>
                                <id>default-testCompile</id>
                                <phase>none</phase>
                            </execution>
                        </executions>
                    </plugin>
                    <plugin>
                        <groupId>net.alchim31.maven</groupId>
                        <artifactId>scala-maven-plugin</artifactId>
                        <version>${scala-maven-plugin.version}</version>
                        <executions>
                            <execution>
                                <id>compile</id>
                                <phase>compile</phase>
                                <goals>
                                    <goal>add-source</goal>
                                    <goal>compile</goal>
                                </goals>
                            </execution>
                            <execution>
                                <id>test-compile</id>
                                <phase>test-compile</phase>
                                <goals>
                                    <goal>add-source</goal>
                                    <goal>testCompile</goal>
                                </goals>
                            </execution>
                        </executions>
                        <configuration>
                            <recompileMode>incremental</recompileMode>
                            <verbose>true</verbose>
                            <scalaVersion>${scala.version}</scalaVersion>
                        </configuration>
                    </plugin>
                </plugins>
            </build>
            <properties>
                <!-- default Spring profiles -->
                <spring.profiles.active>dev,swagger</spring.profiles.active>
            </properties>
        </profile>
        <profile>
            <!--
                Profile for monitoring the application with Graphite.
            -->
            <id>graphite</id>
            <dependencies>
                <dependency>
                    <groupId>io.dropwizard.metrics</groupId>
                    <artifactId>metrics-graphite</artifactId>
                </dependency>
            </dependencies>
        </profile>
        <profile>
            <!--
                Profile for monitoring the application with Prometheus.
            -->
            <id>prometheus</id>
            <dependencies>
                <dependency>
                    <groupId>io.prometheus</groupId>
                    <artifactId>simpleclient</artifactId>
                </dependency>
                <dependency>
                    <groupId>io.prometheus</groupId>
                    <artifactId>simpleclient_servlet</artifactId>
                </dependency>
                <dependency>
                    <groupId>io.prometheus</groupId>
                    <artifactId>simpleclient_dropwizard</artifactId>
                </dependency>
            </dependencies>
        </profile>
        <%_ if (serviceDiscoveryType || applicationType === 'gateway' || applicationType === 'microservice' || applicationType === 'uaa') { _%>
        <profile>
            <!--
                Profile for tracing requests with Zipkin.
            -->
            <id>zipkin</id>
            <dependencies>
                <dependency>
                    <groupId>org.springframework.cloud</groupId>
                    <artifactId>spring-cloud-starter-zipkin</artifactId>
                </dependency>
            </dependencies>
        </profile>
        <%_ } _%>
        <profile>
            <!--
                Profile for applying IDE-specific configuration.
                At the moment it only configures MapStruct, which you need when working
                with DTOs.
            -->
            <id>IDE</id>
            <dependencies>
                <dependency>
                    <groupId>org.mapstruct</groupId>
                    <artifactId>mapstruct-processor</artifactId>
                    <version>${mapstruct.version}</version>
                </dependency>
            </dependencies>
        </profile>
    </profiles>
</project>