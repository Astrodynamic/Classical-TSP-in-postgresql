create table TSP_DB (
    point1 varchar not null,
    point2 varchar not null,
    cost integer
);

insert into TSP_DB (point1, point2, cost)
values ('a', 'b', 10), ('a', 'c', 15), ('a', 'd', 20),
       ('b', 'a', 10), ('b', 'c', 35), ('b', 'd', 25),
       ('c', 'a', 15), ('c', 'b', 35), ('c', 'd', 30),
       ('d', 'a', 20), ('d', 'b', 25), ('d', 'c', 30);