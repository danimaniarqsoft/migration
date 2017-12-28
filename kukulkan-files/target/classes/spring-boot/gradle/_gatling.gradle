
project.sourceSets {
    gatling {
        scala.srcDirs = ['<%= TEST_DIR %>/gatling']
        resources.srcDirs = ['<%= TEST_DIR %>/gatling/user-files/simulations',
                '<%= TEST_DIR %>/gatling/user-files/data', '<%= TEST_DIR %>/gatling/user-files/body', '<%= TEST_DIR %>/gatling/conf']
    }
}

gatling {
    toolVersion = '2.2.5'
    scalaVersion = '2.11.8'
    sourceRoot = '<%= TEST_DIR %>/gatling'
    simulationsDir = 'user-files/simulations'
    dataDir = 'user-files/data'
    bodiesDir = 'user-files/bodies'
    confDir = 'conf'
    simulations = {
        include "**/*GatlingTest.scala"
    }
}
