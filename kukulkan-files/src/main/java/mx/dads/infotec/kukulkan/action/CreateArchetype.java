package mx.dads.infotec.kukulkan.action;

import static mx.dads.infotec.kukulkan.util.FileUtil.ARCHETYPE_FOLDER;

import java.io.IOException;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import mx.dads.infotec.kukulkan.util.FileUtil;
import mx.dads.infotec.kukulkan.visitor.CopyFile;
import mx.dads.infotec.kukulkan.visitor.ReplaceMetaData;

public final class CreateArchetype {

    public static void main(String... aArgs) throws IOException {
        // Delete target folder
        FileUtil.delete(Paths.get("/home/daniel/archetype/angularjs-spring-mongo"));

        // Replace in place metaData
        FileVisitor<Path> replaceMetaDataProcessor = new ReplaceMetaData();
        Files.walkFileTree(Paths.get(ARCHETYPE_FOLDER), replaceMetaDataProcessor);

        // Copy files
//        FileVisitor<Path> copyFileProcessor = new CopyFile();
//        Files.walkFileTree(Paths.get(ARCHETYPE_FOLDER), copyFileProcessor);
    }
}
