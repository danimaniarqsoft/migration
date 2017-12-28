buildscript {
    repositories {
        jcenter()
    }

    dependencies {
        classpath 'com.bmuschko:gradle-docker-plugin:3.2.0'
    }
}

apply plugin: com.bmuschko.gradle.docker.DockerRemoteApiPlugin

import com.bmuschko.gradle.docker.tasks.image.DockerBuildImage

task copyDockerFiles(type: Copy) {
    description = "Copy Dockerfile and required data to build directory"
    from 'src/main/docker'
    from "${project.buildDir}/libs"
    into { "${project.buildDir}/docker" }
    include "*"
    exclude "**/*.yml"
}

task buildDocker(type: DockerBuildImage, dependsOn: 'copyDockerFiles') {
    description = "Package application as Docker image"
    group = "Docker"
    inputDir = project.file("${project.buildDir}/docker")
    tags = ["<%= baseName.toLowerCase() %>:latest".toString(), "<%= baseName.toLowerCase() %>:${project.version}".toString()]
}

