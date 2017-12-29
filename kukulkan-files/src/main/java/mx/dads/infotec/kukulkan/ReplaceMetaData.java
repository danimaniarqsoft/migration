package mx.dads.infotec.kukulkan;

import static mx.dads.infotec.kukulkan.FileUtil.ROOT;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.regex.Pattern;

import mx.dads.infotec.kukulkan.domain.Tupla;

/** Recursive listing with SimpleFileVisitor in JDK 7. */
public final class ReplaceMetaData {
    public static final Pattern UNDERSCORE_PATTERN = Pattern.compile(".*_+.*");

    public static void main(String... aArgs) throws IOException {
        FileVisitor<Path> fileProcessor = new ProcessFile();
        Files.walkFileTree(Paths.get(ROOT), fileProcessor);
    }

    private static final class ProcessFile extends SimpleFileVisitor<Path> {
        @Override
        public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
            if (file.getFileName().toString().equals("pom.xml.ftl")) {
                String sContent = new String(Files.readAllBytes(file));
                for (Tupla tupla : FileUtil.getTuplas()) {
                    sContent = sContent.replaceAll(tupla.getFrom(), tupla.getTo());
                }
                System.out.println(sContent);
            }
            return FileVisitResult.CONTINUE;
        }
    }
}
