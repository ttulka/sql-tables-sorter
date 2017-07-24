package cz.net21.ttulka.tools;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.apache.commons.io.IOUtils;

import lombok.Getter;

/**
 * Created by ttulka
 * <p>
 * Parses a SQL script with tables creation.
 */
@Getter
public class TablesParser {

    private static final String CREATE_TABLE = "CREATE TABLE";
    private static final String IF_NOT_EXISTS = "IF NOT EXISTS";
    private static final String REFERENCES = "REFERENCES";

    /**
     * Returns the table names in the creation order.
     *
     * @param path the path to the creation SQL script
     * @return the table names
     * @throws IOException if cannot read the script
     */
    public static List<String> getTableNamesInOrder(Path path) throws IOException {
        String content = IOUtils.toString(Files.newInputStream(path));

        List<Table> tables = parseTables(content);
        return sortTables(tables);
    }

    static List<Table> parseTables(String content) {
        content = removeComments(content);
        content = content.replaceAll("\\s+", " ");

        List<Table> toReturn = new ArrayList<>();

        int i = 0;
        while (i < content.length()) {
            if ('\'' == content.charAt(i)) {
                i = consumeString(i + 1, content);
            } else {
                String next = content.substring(i, Math.min(i + CREATE_TABLE.length(), content.length()));
                if (next.toUpperCase().startsWith(CREATE_TABLE)) {
                    Table table = parseTable(i + 1 + CREATE_TABLE.length(), content);
                    toReturn.add(table);

                    i += CREATE_TABLE.length();
                }
            }
            i++;
        }
        return toReturn;
    }

    private static Table parseTable(int start, String content) {
        content = content.substring(start);
        content = extractCreateTableSnippet(content);

        String tableName = parseTableName(content);
        Set<String> parseTableReferences = parseTableReferences(content);

        return new Table(tableName, parseTableReferences);
    }

    static String extractCreateTableSnippet(String content) {
        int brackets = 0;
        int i = 0;
        while (i < content.length()) {
            if ('(' == content.charAt(i)) {
                brackets++;
            }
            if (')' == content.charAt(i)) {
                brackets--;

                if (brackets == 0) {
                    return content.substring(0, i + 1);
                }
            }
            i++;
        }
        throw new IllegalStateException("Cannot extract CREATE TABLE snippet close to \""
                                        + content.substring(0, Math.min(50, content.length())) + "\"");
    }

    static String parseTableName(String content) {
        content = content.replaceAll("\\s+", " ");
        if (content.toUpperCase().startsWith(CREATE_TABLE)) {
            content = content.substring(CREATE_TABLE.length() + 1);
        }
        if (content.toUpperCase().startsWith(IF_NOT_EXISTS)) {
            content = content.substring(IF_NOT_EXISTS.length() + 1);
        }
        return parseName(content);
    }

    static Set<String> parseTableReferences(String content) {
        content = content.replaceAll("\\s+", " ");
        Set<String> toReturn = new HashSet<>();
        int start;
        while ((start = content.indexOf(REFERENCES)) != -1) {
            content = content.substring(start + 1 + REFERENCES.length());
            toReturn.add(parseName(content));
        }
        return toReturn;
    }

    static String parseName(String content) {
        Matcher matcher;
        matcher = Pattern.compile("^`(.+)`\\s*\\.\\s*`(.+)`(\\s|\\()(.*)").matcher(content);
        if (matcher.matches()) {
            return matcher.group(1) + "`" + matcher.group(2);
        }
        matcher = Pattern.compile("^([^`\\s.]+)\\s*\\.\\s*([^`\\s.]+)(\\s|\\()(.*)").matcher(content);
        if (matcher.matches()) {
            return matcher.group(1) + "`" + matcher.group(2);
        }
        matcher = Pattern.compile("^([^`\\s.]+)\\s*\\.\\s*`([^`]+)`(\\s|\\()(.*)").matcher(content);
        if (matcher.matches()) {
            return matcher.group(1) + "`" + matcher.group(2);
        }
        matcher = Pattern.compile("^`([^`]+)`\\s*\\.\\s*([^`\\s.]+)(\\s|\\()(.*)").matcher(content);
        if (matcher.matches()) {
            return matcher.group(1) + "`" + matcher.group(2);
        }
        matcher = Pattern.compile("^`([^`]+)`(\\s|\\()(.*)").matcher(content);
        if (matcher.matches()) {
            return matcher.group(1);
        }
        matcher = Pattern.compile("^([^`\\s.]+)\\((.*)").matcher(content);
        if (matcher.matches()) {
            return matcher.group(1);
        }
        matcher = Pattern.compile("^([^`\\s.]+)\\s(.*)").matcher(content);
        if (matcher.matches()) {
            return matcher.group(1);
        }
        throw new IllegalStateException("Cannot parse a name close to \""
                                        + content.substring(0, Math.min(50, content.length())) + "\"");
    }

    private static int consumeString(int start, String content) {
        int i = start;
        while (i < content.length()) {
            if ('\\' == content.charAt(i)) {
                i++;
                continue;
            }
            if ('\'' == content.charAt(i)) {
                break;
            }
            i++;
        }
        return i;
    }

    static String removeComments(String content) {
        return content
                .replaceAll("/\\*(.*)\\*/", "")
                .replaceAll("//(.*)(\n|$)", "$2")
                .replaceAll("--(.*)(\n|$)", "$2");
    }

    static List<String> sortTables(List<Table> tables) {
        return tables.stream()
                .map(Table::getName)
                .flatMap(tableName -> resolveTableOrder(tables, tableName).stream())
                .distinct()
                .collect(Collectors.toList());
    }

    private static List<String> resolveTableOrder(List<Table> tables, String tableName) {
        Table table = tables.stream()
                .filter(t -> tableName.equals(t.getName()))
                .findAny()
                .get();

        List<String> toReturn = new ArrayList<>();
        if (!table.getReferences().isEmpty()) {
            table.getReferences().stream()
                    .flatMap(ref -> resolveTableOrder(tables, ref).stream())
                    .distinct()
                    .forEach(toReturn::add);
        }
        toReturn.add(tableName);
        return toReturn;
    }
}
