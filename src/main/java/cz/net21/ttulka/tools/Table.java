package cz.net21.ttulka.tools;

import java.util.HashSet;
import java.util.Set;

import lombok.Data;

/**
 * Created by ttulka
 * <p>
 * Simple representation of a SQL table.
 */
@Data
public class Table {

    private final String name;
    private final Set<String> references;
}
