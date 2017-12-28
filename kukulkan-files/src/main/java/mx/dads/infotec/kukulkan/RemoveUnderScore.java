package mx.dads.infotec.kukulkan;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.regex.Pattern;

/** Recursive listing with SimpleFileVisitor in JDK 7. */
public final class RemoveUnderScore {
	public static final Pattern UNDERSCORE_PATTERN = Pattern.compile("^_[\\w.-]*$");

	public static void main(String... aArgs) throws IOException {
		String ROOT = "/home/daniel/Desktop/migration/test";
		FileVisitor<Path> fileProcessor = new ProcessFile();
		Files.walkFileTree(Paths.get(ROOT), fileProcessor);
	}

	private static final class ProcessFile extends SimpleFileVisitor<Path> {
		@Override
		public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
			if (UNDERSCORE_PATTERN.matcher(file.getFileName().toString()).matches()) {
				String ftlWord = file.getFileName().toString().replaceFirst("^_", "") + ".ftl";
				System.out.println(Paths.get(file.getParent().toString(), ftlWord));
			} else {
				System.out.println(file.getFileName().toString());
			}

			return FileVisitResult.CONTINUE;
		}
	}
}