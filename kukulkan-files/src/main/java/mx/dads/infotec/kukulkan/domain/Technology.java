package mx.dads.infotec.kukulkan.domain;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import mx.dads.infotec.kukulkan.util.ExcludeFiles;

public enum Technology {

    ANGULAR_JS("angularjs", "@NULL"), JAVA_SPRING_JPA("angularjs-spring-jpa",
            "mx/infotec/dads/archetype"), JAVA_SPRING_MONGO("angularjs-spring-mongo", "mx/infotec/dads/archetype");

    private String folderName;
    private String packaging;

    public static final String INPUT_FOLDER_NAME = "/git/";
    public static final String OUTPUT_FOLDER_NAME = "/archetypes/";

    private static final Path INPUT_FOLDER = Paths.get(System.getProperty("user.home"), INPUT_FOLDER_NAME);
    private static final Path OUTPUT_FOLDER = Paths.get(System.getProperty("user.home"), OUTPUT_FOLDER_NAME);

    private Technology(String folderName, String packaging) {
        this.folderName = folderName;
        this.packaging = packaging;
    }

    public Path getOutputPath() {
        return OUTPUT_FOLDER.resolve(folderName);
    }

    public Path getInputPath() {
        return INPUT_FOLDER.resolve(folderName);
    }

    public String getPackaging() {
        return this.packaging;
    }

    public List<String> getExcludedFiles() {
        if (this.equals(JAVA_SPRING_JPA) || this.equals(JAVA_SPRING_MONGO)) {
            return ExcludeFiles.getAngularExclusion();
        } else {
            return new ArrayList<>();
        }
    }

    public List<String> getExcludedFolders() {
        if (this.equals(JAVA_SPRING_JPA) || this.equals(JAVA_SPRING_MONGO)) {
            return ExcludeFiles.getWebAppExclusion();
        } else {
            return new ArrayList<>();
        }
    }

    public List<String> getNoProcessedAndCopyFiles() {
        return new ArrayList<>();
    }
}
