package mx.dads.infotec.kukulkan;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

import mx.dads.infotec.kukulkan.domain.Tupla;

public class FileUtil {

    public static final String ROOT = "/home/daniel/git/migration/kukulkan-files/src/main/resources";

    private FileUtil() {

    }

    public static boolean saveToFile(Path pathToSave, String content) {
        createDirectories(pathToSave);
        try (final BufferedWriter out = Files.newBufferedWriter(pathToSave, StandardCharsets.UTF_8,
                StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING)) {
            out.write(content);
            return true;
        } catch (IOException ioe) {
            return false;
        }
    }

    public static boolean createDirectories(Path path) {
        try {
            Files.createDirectories(path.getParent());
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public static List<Tupla> getTuplas() {
        List<Tupla> tuplas = new ArrayList<>();
        //tuplas.add(new Tupla("", "\\$\\{project.id\\}"));
        //tuplas.add(new Tupla("", "\\$\\{project.groupId\\}"));
        tuplas.add(new Tupla("<%=\\s*packageName\\s*%>", "\\$\\{project.packaging\\}"));
        //tuplas.add(new Tupla("", ""));
        //tuplas.add(new Tupla("", ""));
        //tuplas.add(new Tupla("", ""));
        return tuplas;
    }
}
