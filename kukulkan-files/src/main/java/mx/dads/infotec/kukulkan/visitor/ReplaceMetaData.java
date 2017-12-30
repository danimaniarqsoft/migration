package mx.dads.infotec.kukulkan.visitor;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import mx.dads.infotec.kukulkan.domain.Tupla;
import mx.dads.infotec.kukulkan.util.FileUtil;

public class ReplaceMetaData extends AbstractFileVisitor {
    @Override
    public FileVisitResult processVisitFile(Path file) throws IOException {
        Path to = Paths.get(file.toString().replaceFirst("/git/", "/archetype/")
                .replaceFirst("mx/infotec/dads/archetype", "package"));
        if (isTemplate(file)) {
            String sContent = new String(Files.readAllBytes(file)).replaceAll("(\\$\\{.*?\\})", "\\${r\"$1\"}");
            for (Tupla tupla : FileUtil.getTuplas()) {
                sContent = sContent.replaceAll(tupla.getFrom(), tupla.getTo());
            }
            // System.out.println(Paths.get(to.toString() + ".ftl"));
            formatOutput(to.toString() + ".ftl");

            FileUtil.saveToFile(Paths.get(to.toString() + ".ftl"), sContent);

        } else {
            // System.out.println(Paths.get(to.toString()));
            formatOutput(to.toString());
            FileUtil.copy(file, to);
        }
        return FileVisitResult.CONTINUE;
    }

    private boolean isTemplate(Path file) {
        for (String word : FileUtil.EXCLUDED_PROCESS_FILES) {
            if (file.getFileName().toString().equals(word)) {
                return false;
            }
        }
        return true;
    }

    private void formatOutput(String from) {
        System.out.println("templates.add(\"" + from + "\");");
    }
}