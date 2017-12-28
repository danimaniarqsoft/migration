package mx.dads.infotec.kukulkan;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.StandardOpenOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.regex.Pattern;

public final class RemoveHeader {

	public static void main(String... aArgs) throws IOException {
		String ROOT = "/home/daniel/git/migration/kukulkan-files/src/main/resources";
		FileVisitor<Path> fileProcessor = new ProcessFile();
		Files.walkFileTree(Paths.get(ROOT), fileProcessor);
	}

	private static final class ProcessFile extends SimpleFileVisitor<Path> {
		@Override
		public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
			String sContent = null;
			try (BufferedReader br = new BufferedReader(new FileReader(file.toFile()))) {
				String line;
				String firstLine = br.readLine();
				if (firstLine != null && firstLine.matches("^<%#[\\w\n]*")) {
					while (!(line = br.readLine()).matches("-%>")) {
					}
					StringBuilder content = new StringBuilder();
					while ((line = br.readLine()) != null) {
						content.append(line).append("\n");
					}
					sContent = content.toString();
					saveToFile(file, sContent);
					System.out.println("changed: " + file);
				} else {
				}
			}

			return FileVisitResult.CONTINUE;
		}
	}

	private static boolean saveToFile(Path pathToSave, String content) {
		createDirectories(pathToSave);
		try (final BufferedWriter out = Files.newBufferedWriter(pathToSave, StandardCharsets.UTF_8,
				StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING)) {
			out.write(content);
			return true;
		} catch (IOException ioe) {
			return false;
		}
	}

	private static boolean createDirectories(Path path) {
		try {
			Files.createDirectories(path.getParent());
			return true;
		} catch (IOException e) {
			return false;
		}
	}
}