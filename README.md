## Classical TSP in Postgresql

This project focuses on solving the classical Traveling Salesman Problem (TSP) using PostgreSQL. The goal is to find the cheapest route that visits all cities and returns to the starting point.

### Exercise 00: Classical TSP

#### Turn-in Directory
ex00

#### Files to Turn-in
- ex00.sql: DDL for table creation with INSERTs of data; SQL DML statement

#### Allowed

- Language: ANSI SQL
- SQL Syntax Pattern: Recursive Query

#### Problem Description

Please refer to the graph on the left. It represents four cities (a, b, c, and d) connected by arcs with associated costs (or taxation). The cost between cities (a,b) is equal to the cost between (b,a). 

Your task is to create a table named "nodes" with the following structure: {point1, point2, cost}. Fill the table with data based on the given picture, considering both direct and reverse paths between two nodes.

Write a single SQL statement that returns all tours (paths) with the minimum traveling cost if we start from city "a". The tours should be sorted by total_cost and then by tour.

Example output data:

```
total_cost | tour
-----------+-----------------
80         | {a,b,d,c,a}
...        | ...
```

#### Exercise 01: Opposite TSP

#### Turn-in Directory
ex01

#### Files to Turn-in
- ex01.sql: SQL DML statement

#### Allowed

- Language: ANSI SQL
- SQL Syntax Pattern: Recursive Query

#### Problem Description

In this exercise, you need to modify the SQL query from the previous exercise to include additional rows with the highest cost. The sample output data below demonstrates the expected result, sorted by total_cost and then by tour.

Example output data:

```
total_cost | tour
-----------+-----------------
80         | {a,b,d,c,a}
...        | ...
95         | {a,d,c,b,a}
```