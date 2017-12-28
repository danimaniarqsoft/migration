package mx.dads.infotec.kukulkan;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class RemoveHeader {

	private static final Pattern HEADER_PATTERN = Pattern.compile("(^<%#[\\s\\w-:.//,()\":;]*-%>)(<%#[\\s\\w-:.//,()\":;]*-%>)",Pattern.DOTALL);

	public static void main(String... aArgs) throws IOException {
		// String ROOT = "/home/daniel/Desktop/migration/test";
		String ROOT = "/home/daniel/Desktop/migration/test/spring-boot";
		FileVisitor<Path> fileProcessor = new ProcessFile();
		Files.walkFileTree(Paths.get(ROOT), fileProcessor);
	}

	private static final class ProcessFile extends SimpleFileVisitor<Path> {
		@Override
		public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
			if (file.getFileName().toString().equals("_build.gradle")) {
				String content = new String(Files.readAllBytes(file));

				Matcher matcher = HEADER_PATTERN.matcher(content);
				if (matcher.find()) {
					System.out.println(matcher.group(2));
				}
				// String content = new String(Files.readAllBytes(file));
				// System.out.println(content.replaceAll("^<%#[\\s\\w-:.//,()\":;]*-%>",
				// ""));
				return FileVisitResult.TERMINATE;
			}

			return FileVisitResult.CONTINUE;
		}
	}
}