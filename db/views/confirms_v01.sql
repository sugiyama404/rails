select
  `t1`.`id` AS `id`,
  `t1`.`name` AS `name`,
  `t1`.`address` AS `address`,
  `t1`.`imgname` AS `imgname`,
  `t1`.`bestname` AS `bestname`,
  `t1`.`richname` AS `richname`,
  `t1`.`fourthname` AS `fourthname`,
  `t1`.`doublename` AS `doublename`,
  `t2`.`bestvacant` AS `bestvacant`,
  `t2`.`richvacant` AS `richvacant`,
  `t2`.`fourthvacant` AS `fourthvacant`,
  `t2`.`doublevacant` AS `doublevacant`,
  `t2`.`days` AS `days`,
  `t3`.`bestprice` AS `bestprice`,
  `t3`.`richprice` AS `richprice`,
  `t3`.`fourthprice` AS `fourthprice`,
  `t3`.`doubleprice` AS `doubleprice`
from (
    (
      `railsdatabase`.`hotels` `t1`
      left join `railsdatabase`.`hoteldays` `t2` on ((`t1`.`id` = `t2`.`hotel_id`))
    )
    left join `railsdatabase`.`hotelprices` `t3` on ((`t1`.`id` = `t3`.`hotel_id`))
  )
where
  (`t2`.`days` > (curdate() - interval 1 day))