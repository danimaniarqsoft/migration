package mx.dads.infotec.kukulkan.action;

import static mx.dads.infotec.kukulkan.util.FileUtil.ARCHETYPE_INPUT_FOLDER;
import static mx.dads.infotec.kukulkan.util.FileUtil.ARCHETYPE_OUTPUT_FOLDER;

import java.io.IOException;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import mx.dads.infotec.kukulkan.util.FileUtil;
import mx.dads.infotec.kukulkan.visitor.ReplaceMetaData;

public final class CreateArchetype {

    public static void main(String... aArgs) throws IOException {
        // Delete target folder
        FileUtil.delete(Paths.get(ARCHETYPE_OUTPUT_FOLDER));
        System.out.println("************************");
        System.out.println("************************");
        System.out.println("************************");
        System.out.println("************************");
        System.out.println("************************");
        System.out.println("************************");
        // Replace in place metaData
        FileVisitor<Path> replaceMetaDataProcessor = new ReplaceMetaData();
        Files.walkFileTree(Paths.get(ARCHETYPE_INPUT_FOLDER), replaceMetaDataProcessor);
    }
}
