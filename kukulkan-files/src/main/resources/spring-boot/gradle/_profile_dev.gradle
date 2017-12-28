import org.gradle.internal.os.OperatingSystem

apply plugin: 'org.springframework.boot'
<%_ if(!skipClient) { _%>
apply plugin: 'com.moowork.node'
    <%_ if (clientFramework === 'angular1') { _%>
apply plugin: 'com.moowork.gulp'
    <%_ } _%>
<%_ } _%>

dependencies {
    compile "org.springframework.boot:spring-boot-devtools"
    <%_ if (devDatabaseType === 'h2Disk' || devDatabaseType === 'h2Memory') { _%>
    compile "com.h2database:h2"
    <%_ } _%>
}

def profiles = 'dev'
if (project.hasProperty('no-liquibase')) {
    profiles += ',no-liquibase'
}

bootRun {
    args = []
}

<%_ if (!skipClient) { _%>
    <%_ if (clientFramework === 'angular1') { _%>
task gulpConstantDev(type: GulpTask) {
    args = ["ngconstant:dev", "--no-notification"]
}
    <%_ } else { _%>
task webpackBuildDev(type: <%= clientPackageManager.charAt(0).toUpperCase() + clientPackageManager.slice(1) %>Task) {
    args = ["run", "webpack:build"]
}
    <%_ } _%>

war {
    <%_ if (clientFramework !== 'angular1') { _%>
    webAppDirName = '<%= CLIENT_DIST_DIR %>'
    <%_ } else { _%>
    webAppDirName = '<%= CLIENT_MAIN_SRC_DIR %>'
    <%_ } _%>
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
processResources.dependsOn gulpConstantDev
    <%_ } else { _%>
processResources.dependsOn webpackBuildDev
webpackBuildDev.onlyIf { project.hasProperty('webpack') }
    <%_ } _%>
<%_ } _%>
