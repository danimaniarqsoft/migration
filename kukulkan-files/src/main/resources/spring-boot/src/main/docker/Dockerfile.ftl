FROM <%= DOCKER_JAVA_JRE %>

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JHIPSTER_SLEEP=0 \
    JAVA_OPTS="<%_ if (cacheProvider === 'infinispan') { _%>-Djgroups.tcp.address=NON_LOOPBACK -Djava.net.preferIPv4Stack=true<%_ } _%>"

CMD echo "The application will start in ${JHIPSTER_SLEEP}s..." && \
    sleep ${JHIPSTER_SLEEP} && \
    java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.war

EXPOSE <%= serverPort %><% if (cacheProvider === 'hazelcast') { %> 5701/udp<% } %>

ADD *.war /app.war
