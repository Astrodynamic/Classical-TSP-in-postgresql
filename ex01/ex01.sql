with hamiltonian_paths as
         (with recursive tsp_paths as (select point1         as point1,
                                              point2         as point2,
                                              cost           as cost,
                                              1              as level,
                                              array [point1] as path,
                                              false          as cicle,
                                              array [cost]   as costs
                                       from tsp_db
                                       where point1 = 'a'

                                       union

                                       select tsp_db.point1                   as point1,
                                              tsp_db.point2                   as point2,
                                              tsp_db.cost + tsp_paths.cost    as cost,
                                              tsp_paths.level + 1             as level,
                                              tsp_paths.path || tsp_db.point1 as path,
                                              tsp_db.point1 = any (path)      as cicle,
                                              costs || tsp_db.cost            as costs
                                       from tsp_db
                                                join tsp_paths on tsp_db.point1 = tsp_paths.point2 and not cicle)
          select tsp_paths.point1                    as point1,
                 tsp_paths.point2                    as point2,
                 tsp_paths.cost - tsp_paths.costs[5] as cost,
                 tsp_paths.level                     as level,
                 tsp_paths.path                      as path,
                 tsp_paths.cicle                     as cicle,
                 tsp_paths.costs                     as costs
          from tsp_paths
          where level = 5
            and path @> array ['a', 'b', 'c', 'd']::varchar[]
            and tsp_paths.path[1] = tsp_paths.path[5])

select distinct cost as total_cost,
                path as tour
from hamiltonian_paths
where cost in (select min(cost) from hamiltonian_paths)
   or cost in (select max(cost) from hamiltonian_paths)
order by total_cost, tour;


