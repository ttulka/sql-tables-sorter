package cz.net21.ttulka.tools;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.junit.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.contains;
import static org.hamcrest.Matchers.containsInAnyOrder;

/**
 * Created by ttulka
 */
public class TablesParserTest {

    @Test
    public void parseTablesTest() {
        String content = "CREATE TABLE `mytable` (\n" +
                         "  id INT, \n" +
                         "  name VARCHAR(100),\n" +
                         "  content TEXT,\n" +
                         "  test1_id INT,\n" +
                         "  test2_id INT,\n" +
                         "  CONSTRAINT `fk_test1` FOREIGN KEY (`test1_id`) REFERENCES `test1` (`id`)\n" +
                         "  CONSTRAINT `fk_test2` FOREIGN KEY (`test2_id`) REFERENCES `test2` (`id`)\n" +
                         ");" +
                         "CREATE TABLE test(id INT);";
        List<Table> tables = TablesParser.parseTables(content);

        List<String> names = tables.stream()
                .map(Table::getName)
                .collect(Collectors.toList());
        assertThat(names, containsInAnyOrder("mytable", "test"));

        List<String> references = tables.stream()
                .flatMap(table -> table.getReferences().stream())
                .collect(Collectors.toList());
        assertThat(references, containsInAnyOrder("test1", "test2"));
    }

    @Test
    public void sortTablesTest() {
        List<Table> tables = new ArrayList<>();
        tables.add(new Table("a", new HashSet<>(Arrays.asList("b", "c"))));
        tables.add(new Table("b", new HashSet<>(Arrays.asList("c"))));
        tables.add(new Table("c", Collections.emptySet()));

        List<String> sortedTables = TablesParser.sortTables(tables);
        assertThat(sortedTables, contains("c", "b", "a"));
    }

    @Test
    public void removeCommentsTest() {
        String content = "1 /*abc def*/2 -- aaaa\n// sdsd\n3\n4 --qwerty";
        String result = TablesParser.removeComments(content);

        assertThat("All comment should be removed.", result, is("1 2 \n\n3\n4 "));
    }

    @Test
    public void extractCreateTableSnippetTest() {
        String createTable = "CREATE TABLE `mytable` (\n" +
                             "  id INT, \n" +
                             "  name VARCHAR(100),\n" +
                             "  content TEXT,\n" +
                             "  document_id INT,\n" +
                             "  CONSTRAINT `fk_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)\n" +
                             ")";
        String content = createTable + "; CREATE TABLE test(id INT);";
        String result = TablesParser.extractCreateTableSnippet(content);

        assertThat(result, is(createTable));
    }

    @Test
    public void parseNameTest() {
        assertThat(TablesParser.parseName("`test` abc"), is("test"));
        assertThat(TablesParser.parseName("test abc"), is("test"));
        assertThat(TablesParser.parseName("`schema`.`test` abc"), is("schema`test"));
        assertThat(TablesParser.parseName("schema.test abc"), is("schema`test"));
        assertThat(TablesParser.parseName("`schema` . `test` abc"), is("schema`test"));
        assertThat(TablesParser.parseName("schema . test abc"), is("schema`test"));
        assertThat(TablesParser.parseName("`schema` . test abc"), is("schema`test"));
        assertThat(TablesParser.parseName("schema . `test` abc"), is("schema`test"));
    }

    @Test
    public void parseTableNameTest() {
        String createTable = "CREATE TABLE `test` (\n" +
                             "  id INT, \n" +
                             "  name VARCHAR(100),\n" +
                             "  content TEXT,\n" +
                             "  document_id INT,\n" +
                             "  CONSTRAINT `fk_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)\n" +
                             ")";
        String tableName = TablesParser.parseTableName(createTable);
        assertThat(tableName, is("test"));

        createTable = "CREATE TABLE IF NOT EXISTS test (\n" +
                      "  id INT, \n" +
                      "  name VARCHAR(100),\n" +
                      "  content TEXT,\n" +
                      "  document_id INT,\n" +
                      "  CONSTRAINT `fk_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)\n" +
                      ")";
        tableName = TablesParser.parseTableName(createTable);
        assertThat(tableName, is("test"));
    }

    @Test
    public void parseTableReferencesTest() {
        String content = "CREATE TABLE `mytable` (\n" +
                         "  id INT, \n" +
                         "  name VARCHAR(100),\n" +
                         "  content TEXT,\n" +
                         "  test1_id INT,\n" +
                         "  test2_id INT,\n" +
                         "  CONSTRAINT `fk_test1` FOREIGN KEY (`test1_id`) REFERENCES `test1` (`id`)\n" +
                         "  CONSTRAINT `fk_test2` FOREIGN KEY (`test2_id`) REFERENCES `test2` (`id`)\n" +
                         ")";
        Set<String> tableReferences = TablesParser.parseTableReferences(content);
        assertThat(tableReferences, containsInAnyOrder("test1", "test2"));
    }
}
