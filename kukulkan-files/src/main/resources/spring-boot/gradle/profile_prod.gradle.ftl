apply plugin: 'org.springframework.boot'
<%_ if(!skipClient) { _%>
apply plugin: 'com.moowork.node'
    <%_ if (clientFramework === 'angular1') { _%>
apply plugin: 'com.moowork.gulp'
    <%_ } _%>
<%_ } _%>

dependencies {

}

def profiles = 'prod'
if (project.hasProperty('no-liquibase')) {
    profiles += ',no-liquibase'
}

if (project.hasProperty('swagger')) {
    profiles += ',swagger'
}

bootRun {
    args = []
}

<%_ if (!skipClient) { _%>
    <%_ if (clientFramework === 'angular1') { _%>
task gulpBuildWithOpts(type: GulpTask) {
    args = ["build", "--no-notification"]
}
    <%_ } else { _%>

task webpack_test(type: <%= clientPackageManager.charAt(0).toUpperCase() + clientPackageManager.slice(1) %>Task, dependsOn: '<%= clientPackageManager %>_install') {
    args = ["run", "webpack:test"]
}

task webpack(type: <%= clientPackageManager.charAt(0).toUpperCase() + clientPackageManager.slice(1) %>Task, dependsOn: '<%= clientPackageManager %>_install') {
    args = ["run", "webpack:prod"]
}
    <%_ } _%>

war {
    webAppDirName = '<%= CLIENT_DIST_DIR %>'
}
<%_ } _%>

processResources {
    filesMatching('**/application.yml') {
        filter {
            it.replace('#project.version#', version)
        }
        <%_ if (applicationType === 'monolith') { _%>
        filter {
            it.replace('#spring.profiles.active#', profiles)
        }
        <%_ } _%>
    }
    <%_ if (applicationType === 'microservice' || applicationType === 'gateway' || applicationType === 'uaa') { _%>
    filesMatching('**/bootstrap.yml') {
        filter {
            it.replace('#spring.profiles.active#', profiles)
        }
    }
    <%_ } _%>
}

<%_ if (!skipClient) { _%>
    <%_ if (clientFramework === 'angular1') { _%>
        <%_ if (clientPackageManager === 'yarn') { _%>
// Workaround for https://github.com/srs/gradle-node-plugin/issues/134 doesn't work with yarn
if (!project.hasProperty('nodeInstall')) {
    gulpBuildWithOpts.dependsOn yarn_install
} else {
    gulpBuildWithOpts.dependsOn npm_install
}
        <%_ } else if (clientPackageManager === 'npm') { _%>
gulpBuildWithOpts.dependsOn npm_install
        <%_ } _%>
gulpBuildWithOpts.dependsOn bower
processResources.dependsOn gulpBuildWithOpts
test.dependsOn gulp_test
bootRun.dependsOn gulp_test
    <%_ } else { _%>
test.dependsOn webpack_test
processResources.dependsOn webpack
    <%_ } _%>
<%_ } _%>
