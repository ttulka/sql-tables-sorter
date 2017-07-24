package cz.net21.ttulka.tools;

import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

import lombok.extern.apachecommons.CommonsLog;

/**
 * Created by ttulka
 */
@CommonsLog
public class SqlTablesSorter {

    public static void main(String[] args) {
        Options cmdOptions = new Options();
        cmdOptions.addRequiredOption("f", "file", true, "Path to the SQL creating script.");

        try {
            CommandLine cmdLine = new DefaultParser().parse(cmdOptions, args);
            String filename = cmdLine.getOptionValue("f");

            List<String> tableNames = TablesParser.getTableNamesInOrder(Paths.get(filename));
            tableNames.forEach(System.out::println);

        } catch (ParseException e) {
            new HelpFormatter().printHelp(SqlTablesSorter.class.getName(), cmdOptions);
            System.exit(1);

        } catch (Exception e) {
            log.error(e);
            System.exit(-1);
        }
        System.exit(0);
    }
}
