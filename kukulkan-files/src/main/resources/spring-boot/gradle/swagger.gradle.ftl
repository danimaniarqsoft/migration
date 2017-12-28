/*
 * Plugin that provides API-first development using swagger-codegen to
 * generate Spring-MVC endpoint stubs at compile time from a swagger definition file
 */

apply plugin: "org.detoeuf.swagger-codegen"

swagger {
    inputSpec = file('<%= SERVER_MAIN_RES_DIR %>swagger/api.yml').absolutePath
    outputDir = file('build/swagger')
    lang = 'spring'

    addDynamicProperty 'interfaceOnly', true
    addDynamicProperty 'java8', true

    additionalProperties = [
        'modelPackage' : '<%= packageName %>.web.api.model',
        'apiPackage'   : '<%= packageName %>.web.api'
    ]

    systemProperties = [
        'models' : '',
        'apis'   : ''
    ]
}

sourceSets {
    main {
        java {
            srcDir file("${project.buildDir.path}/swagger/src/main/java")
        }
    }
}

compileJava.dependsOn('swagger')
