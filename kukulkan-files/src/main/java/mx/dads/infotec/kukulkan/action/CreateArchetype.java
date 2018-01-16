package mx.dads.infotec.kukulkan.action;

import static mx.dads.infotec.kukulkan.domain.Technology.JAVA_SPRING_MONGO;

import java.io.IOException;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;

import mx.dads.infotec.kukulkan.domain.Technology;
import mx.dads.infotec.kukulkan.util.FileUtil;
import mx.dads.infotec.kukulkan.visitor.ReplaceMetaData;

public final class CreateArchetype {

    public static void main(String... aArgs) throws IOException {
        // Delete target folder
        FileUtil.delete(JAVA_SPRING_MONGO.getOutputPath());
        // Replace in place metaData
        FileVisitor<Path> replaceMetaDataProcessor = new ReplaceMetaData(Technology.JAVA_SPRING_MONGO);
        Files.walkFileTree(JAVA_SPRING_MONGO.getInputPath(), replaceMetaDataProcessor);
    }
}
