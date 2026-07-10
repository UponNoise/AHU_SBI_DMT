# Important Concepts in Database Course (L3-L17)

## L03-SingleEntity-Basics

### 1. Relational Model Basics
- **Concept**: Foundation of most modern DBMS, proposed by Codd in 1970 based on mathematical set theory
- **Components**: Relations (tables), attributes (columns), tuples (rows)
- **Characteristics**: All rows store same type of items, each row uniquely identified

### 2. Entities and Attributes
- **Entity**: Corresponds to concrete objects in application domain, represented as rectangles
- **Attributes**: Discrete data elements describing entities with meaningful names
- **Example**:
  ```
  Shares (Entity)
  - code (Attribute)
  - name 
  - price
  - quantity
  - dividend
  - pe
  ```

### 3. Identifiers/Primary Keys
- **Purpose**: Uniquely identify entity instances
- **Best practice**: Use domain-independent identifiers (like ID) for guaranteed uniqueness
- **Notation**: Asterisk (*) or "PK" marking
- **Example**:
  ```
  Shares
  *ID code name price quantity dividend pe
  ```

### 4. Naming Conventions
- **Table names**: Plural form, Upper Camel Case (e.g., OrganizationNames)
- **Column names**: Singular form, Lower Camel Case (e.g., organizationName)
- **Primary key field**: Consistently use ID
- **Avoid**: Abbreviations and acronyms (unless well-known)

### 5. SQL Data Types
- **Numeric**: integer, smallint, float(p), decimal(p,q)
- **String**: char(n), varchar(n), text
- **Date/time**: date, time, timestamp, time with time zone

## L04-SingleEntity-Other

### 1. WHERE Clause Predicates
- **Basic comparisons**: =, <>, >, >=, <, <=
- **IN/NOT IN**: Value in/not in a set
  ```sql
  SELECT * FROM Shares WHERE code IN ('FC', 'AR', 'SLG');
  ```
- **BETWEEN**: Range queries
- **LIKE**: Pattern matching (using * or % as wildcards)
- **IS NULL/IS NOT NULL**: Null value checks

### 2. Ordering Output
- **ORDER BY**: Specifies sort order (ASC ascending default, DESC descending)
  ```sql
  SELECT * FROM Shares WHERE pe >= 12 ORDER BY pe DESC, shareName;
  ```

### 3. Derived Data
- Calculated columns can be query results
  ```sql
  SELECT shareName, price, quantity, (dividend/price)*100 AS yield FROM Shares;
  ```

### 4. Built-in Functions
- **Aggregate functions**: COUNT, AVG, SUM, MIN, MAX
- **Example**:
  ```sql
  SELECT AVG(dividend) AS averageDividend FROM Shares;
  ```

### 5. GROUP BY
- Projects rows with common values into smaller row sets
- Often used with aggregate functions
  ```sql
  SELECT sponsorName, AVG(budget) AS averageBudget 
  FROM Awards GROUP BY sponsorName;
  ```

## L05-SingleEntity-GUI-Interface

### 1. Access Design View
- **Characteristics**: Graphical query builder, easier than pure SQL but less powerful
- **Process**: Select table → choose columns → set criteria → view generated SQL

### 2. Design View Components
- **Field selection**: Specify columns to include in results
- **Sorting**: Select ascending/descending via dropdown
- **Criteria**: Enter filter conditions in Criteria row
- **Totals**: Add aggregate functions (Group By, Count, Sum etc.)

### 3. Adjusting Result Appearance
- Use Property Sheet to change column formatting
- Can set number formats (e.g., currency), decimal places etc.

## L06-OneToMany

### 1. DB Design Diagrams
- **ERD (Entity-Relationship Diagram)**: High-level abstraction, DB implementation independent
- **RDM (Relational Data Model)**: Assumes relational implementation, deals with tables/relations

### 2. One-to-Many Relationship
- **Notation**: "Crow's foot" notation (many side shows crow's foot)
- **Implementation**: Through primary/foreign key pairs
- **Example**:
  ```
  Nations (1) —— (many) Shares
  Shares table contains nationID foreign key referencing Nations table's ID primary key
  ```

### 3. Referential Integrity Constraint
- **Rule**: Every foreign key value must match an existing primary key value
- **Requirements**:
  - Foreign keys cannot be null
  - Primary keys must exist before defining foreign keys

### 4. Creating Relationships in Access
- Steps: Database Tools → Relationships → Create New → Select tables/columns → Enforce referential integrity

## L07-MultiTableQueries

### 1. Multi-table Query Basics
- **Process**:
  1. Join tables to form new table
  2. Execute SQL query on joined table

### 2. JOIN Operation
- **Explicit join**: Using INNER JOIN syntax
  ```sql
  FROM Nations INNER JOIN Shares ON Nations.ID = Shares.nationID
  ```
- **Implicit join**: Specifying join condition in WHERE clause
  ```sql
  FROM Shares, Nations WHERE Shares.nationID = Nations.ID
  ```

### 3. HAVING Clause
- Filters GROUP BY results
- Must be used with GROUP BY
  ```sql
  GROUP BY Nations.nationName HAVING Count(*)>=2;
  ```

### 4. Subqueries
- Queries nested within other queries
- **Example**: Report all Australian stocks
  ```sql
  SELECT shareName FROM Shares
  WHERE Shares.nationID IN (SELECT ID FROM Nations WHERE nationName = 'Australia');
  ```

## L08-WorkbenchModeling

### 1. Data Modeling Approaches
- **Classical**: ER diagram first, then convert to physical DB model
- **Pragmatic**: Directly model as RDM (assuming relational implementation)

### 2. Workbench Modeling
- **Creating tables**: Add tables and define columns with properties
- **Column properties**:
  - PK: Primary key
  - NN: Not null
  - UQ: Unique
  - AI: Auto-increment

### 3. Creating Relationships
- Use graphical tools to create table relationships
- Use Foreign Keys tab to define relationships

## L09-ManyToMany

### 1. Many-to-Many Relationship Modeling
- **Problem**: Cannot be directly represented in relational databases
- **Solution**: Introduce associative entity (junction table) converting to two one-to-many relationships

### 2. Associative Entity
- **Characteristics**:
  - Contains two foreign keys (pointing to each entity)
  - Can include relationship-specific attributes (e.g., quantity, price)
- **Example**:
  ```
  Sales (1) —— (many) LineItems (many) —— (1) Items
  ```

### 3. Three-Table Join Query
- **Example**: List sale dates, item names and quantities
  ```sql
  SELECT saleNo, saleDate, itemName, quantity 
  FROM Sales, LineItems, Items
  WHERE Sales.ID = LineItems.saleID AND Items.ID = LineItems.itemID;
  ```

### 4. EXISTS/NOT EXISTS
- **EXISTS**: Returns true if subquery returns at least one row
- **NOT EXISTS**: Returns true if subquery returns no rows
  ```sql
  SELECT itemName FROM Items 
  WHERE itemtype = 'C' AND EXISTS (SELECT * FROM LineItems WHERE LineItems.itemID = Items.ID);
  ```

## L10-OneToOne

### 1. One-to-One Relationship
- **Implementation choice**: Foreign key can be placed in either table
- **Example**: Department to department head relationship
  ```
  Departments table contains deptHeadID foreign key pointing to Employees table
  ```

### 2. Recursive Relationship
- **Definition**: Relationship where entity relates to itself
- **Example**: Employee to supervisor relationship
  ```
  Employees table contains bossID foreign key pointing to same table's ID primary key
  ```

### 3. Recursive Relationship Query
- **Technique**: Create aliases for the same table
  ```sql
  SELECT E.firstName AS Employee, B.firstName AS Boss
  FROM Employees E, Employees B
  WHERE E.bossID = B.ID;
  ```

## L11-Normalization

### 1. Normalization Purpose
- Eliminate redundant data
- Avoid insertion, update and deletion anomalies
- Enable data modifications in just one table

### 2. Functional Dependency
- **Definition**: One or more attributes determine another attribute's value
- **Notation**: A → B (A determines B)
- **Full functional dependency**: Requires all attributes to determine another

### 3. Normal Forms
- **1NF**:
  - All rows have same number of columns
  - Contains single-valued attributes only
- **2NF**:
  - Already in 1NF
  - Non-key columns must fully depend on entire primary key (mainly for composite keys)
- **3NF**:
  - Already in 2NF
  - Non-key columns cannot depend on other non-key columns (no transitive dependencies)

### 4. Update Anomalies
- **Insertion anomaly**: Cannot insert distribution center without employees
- **Deletion anomaly**: Deleting last employee accidentally deletes distribution center info
- **Modification anomaly**: Changing distribution center requires multiple record updates

## L12-Examples

### 1. Normalization Process Example
- **Unnormalized table**:
  ```
  StaffDistributionCenter(ID, staffNo, staffName, position, salary, dCenterNo, dAddress, dTelNo)
  ```
- **Problem**: dAddress and dTelNo depend on dCenterNo not primary key ID

### 2. Normalized Solution
- **Decomposed into two tables**:
  ```
  Staff(ID, staffNo, staffName, position, salary, dCenterID)
  DistributionCenters(ID, dCenterNo, dAddress, dTelNo)
  ```

### 3. Dentist Database Normalization
- **Original table problems**:
  - dentistName depends on staffNo
  - patName depends on patNo
  - surgeryNo doesn't depend on any above
- **Normalized design**:
  ```
  Dentists(staffNo, firstName, lastName)
  Patients(patNo, firstName, lastName)
  Appointments(ID, staffNo, patNo, apDate, apTime, surgeryNo)
  ```

## L13-DataModeling

### 1. Data Modeling Fundamentals
- **Goal**: Identify structure of data to be stored in database
- **Collaborative process**: Between client and analyst
- **Industry title**: Typically Business Analyst

### 2. Building Blocks
- **Entities**: Real-world objects
- **Attributes**: Characteristics describing entities
- **Relationships**: Connections between entities
- **Identifiers**: Uniquely identify entity instances

### 3. Well-Formed Data Model Characteristics
- Follows organizational conventions
- No ambiguity
- All components (entities, attributes, relationships, identifiers) defined
- Names meaningful to client

## L14-Views & Forms

### 1. Views
- **Definition**: Derived tables (virtual tables), behave like base tables but don't physically exist
- **Advantages**:
  - Reduce impact of database changes
  - Simplify database usage
  - Restrict data access
  - Customize DB appearance

### 2. Hierarchical Forms
- **Components**: Main form and subform
- **Purpose**: Attractive interface for 1:M relationships
- **Types**:
  - Detail forms (single data source)
  - Split forms (detail form + datasheet)
  - Subforms (parent-child forms)
  - Multiple item forms

### 3. Form Design Steps
- Select data source (table or query)
- Choose form type
- Rearrange or delete controls after initial creation

## L15-Reports

### 1. Hierarchical Reports
- **Characteristics**: Use nesting/indentation for visually appealing layouts
- **Includes**: Subtotals and groupings
- **Terminology**:
  - Group: Sorted field, typically indented
  - Detail line: Innermost field

### 2. Report Components
- **Report sections**:
  - Report header/footer
  - Page header/footer
  - Group header/footer
  - Detail
- **Report layouts**:
  - Tabular (spreadsheet-like)
  - Stacked (too many fields for tabular)
  - Mixed

### 3. Using Report Wizard
- Specify grouping and sorting
- Modify report in Design View
- Can add subtotals and grand totals

## L16-MySQL

### 1. MySQL Workbench Access
- **Connection parameters**:
  - Server: mysql1.cs.stonybrook.edu
  - Port: 3306
  - Username: NetID
  - Password: Stony Brook ID
  - Default schema: Same as username

### 2. MySQL Data Operations
- **Executing queries**: Write and execute SQL in SQL pane
- **Table definition**:
  ```sql
  CREATE TABLE Shares(
    code CHAR(3),
    firm VARCHAR(20) NOT NULL,
    price DECIMAL(6,2),
    qty DECIMAL(8),
    div DECIMAL(5,2),
    pe DECIMAL(2),
    PRIMARY KEY(code));
  ```

## L17-DataModeling-Leftovers

### 1. Entity Types
- **Independent entities**: Starting points, prominent in client's mind
- **Dependent entities**: Rely on others for existence/identification
- **Associative entities**: Byproduct of m:m relationships
- **Aggregate entities**: Created from entities with common prefixes/suffixes
- **Subordinate entities**: Data varies among instances

### 2. Generalization
- **Definition**: Relationship between more general and specific elements
- **Mapping**: One table per entity, subtype PK same as supertype

### 3. Aggregation
- **Definition**: Part-whole relationship between entities
- **Types**:
  - Shared aggregation: One entity owns another but others can too
  - Composite aggregation: One entity exclusively owns another

### 4. Data Modeling Tips
- Models expand and contract
- Create identifiers when necessary
- Identifiers should have single purpose - identification
- Data models don't imply ordering
- Create attributes if ordering needed
- Attribute meanings must be consistent