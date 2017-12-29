package mx.dads.infotec.kukulkan.visitor;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;

import mx.dads.infotec.kukulkan.domain.Tupla;
import mx.dads.infotec.kukulkan.util.FileUtil;

public class ReplaceMetaData extends AbstractFileVisitor {
    @Override
    public FileVisitResult processVisitFile(Path file) throws IOException {
        if (file.getFileName().toString().equals("pom.xml")) {
            String sContent = new String(Files.readAllBytes(file));
            for (Tupla tupla : FileUtil.getTuplas()) {
                sContent = sContent.replaceAll(tupla.getFrom(), tupla.getTo());
            }
            System.out.println(sContent);
        }
        return FileVisitResult.CONTINUE;
    }
}