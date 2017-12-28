apply plugin: "net.ltgt.apt"

dependencies {
    apt "org.mapstruct:mapstruct-processor:${mapstruct_version}"
<%_ if (databaseType === 'sql') { _%>
    apt "org.hibernate:hibernate-jpamodelgen:${hibernate_version}"
<%_ } _%>
}
