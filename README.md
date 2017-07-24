# SQL Tables Sorter

Calculates the right order of the tables from a SQL creation script (for example an SQL script generated from `mysqldump` etc.).

## Prerequisites
- Java 8
- Maven 

## Usage

First, clone or fork the repository:
```
$ git clone git@github.com:ttulka/sql-tables-sorter.git
$ cd sql-tables-sorter
```
Now build it:
```
$ mvn clean package
```
And finally run it: 
```
$ java -jar target/SqlTablesSorter-1.0-SNAPSHOT.jar -f <path_to_SQL_creaton_script>
```

### Example

*dump.sql*
```sql
CREATE TABLE `attachment` (
    id INT, 
    name VARCHAR(100),
    content TEXT,
    document_id INT,
    CONSTRAINT `fk_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
  );
CREATE TABLE `document` (
  id INT,
  title VARCHAR(100),
  content TEXT,
  patient_id INT,
  CONSTRAINT `fk_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
);
CREATE TABLE `patient` (
  id INT, 
  full_name VARCHAR(100)
);
```
```
$ java -jar target/SqlTablesSorter-1.0-SNAPSHOT.jar -f dump.sql
```
Output
```
patient
document
attachment
```


## License

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
