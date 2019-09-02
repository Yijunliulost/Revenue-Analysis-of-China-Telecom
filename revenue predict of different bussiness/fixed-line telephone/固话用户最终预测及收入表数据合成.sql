select count(*) from benefit_analyze.contract_2018_gh;
select count(*) from  benefit_analyze.cm_charge_2018_gh;
select count(*) from  benefit_analyze.pgh_charge_2018_gh;
select count(*) from benefit_analyze.centrex_charge_2018_gh;
select count(*) from  benefit_analyze.yugh_charge_2018_gh;
select count(*) from benefit_analyze.qita_charge_2018_gh;







drop table if exists benefit_analyze.charge_2018_gh_example;
create table benefit_analyze.charge_2018_gh_example
as SELECT	serv_id, group_id, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712
FROM	benefit_analyze.contract_2018_gh;

insert into benefit_analyze.charge_2018_gh_example
SELECT	serv_id, group_id, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712
FROM	benefit_analyze.cm_charge_2018_gh; 


insert into benefit_analyze.charge_2018_gh_example
SELECT	serv_id, group_id, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712
FROM	benefit_analyze.pgh_charge_2018_gh; 



insert into benefit_analyze.charge_2018_gh_example
SELECT	serv_id, group_id, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712
FROM	benefit_analyze.centrex_charge_2018_gh; 



insert into benefit_analyze.charge_2018_gh_example
SELECT	serv_id, group_id, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712
FROM	benefit_analyze.yugh_charge_2018_gh; 




insert into benefit_analyze.charge_2018_gh_example
SELECT	serv_id, group_id, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712
FROM	benefit_analyze.qita_charge_2018_gh; 



drop table if exists benefit_analyze.charge_2018_gh;
create table benefit_analyze.charge_2018_gh
as select 
t1.serv_id, t1.group_id, case when 1=1 then '固话' end as serv_type, t2.is_cz, t1.serv_grp_type, t1.area, t1.manage_area, t1.user_type,
		t1.user_type2, t1.charge_type, t1.pre_charge_2018, t1.avg_charge_3, t1.avg_charge_6,
		t1.avg_charge_12, t1.charge_dy_201712, t1.pre_charge_201801, t1.pre_charge_201802,
		t1.pre_charge_201803, t1.pre_charge_201804, t1.pre_charge_201805, t1.pre_charge_201806,
		t1.pre_charge_201807, t1.pre_charge_201808, t1.pre_charge_201809, t1.pre_charge_201810,
		t1.pre_charge_201811, t1.pre_charge_201812, t1.charge_201701, t1.charge_201702,
		t1.charge_201703, t1.charge_201704, t1.charge_201705, t1.charge_201706, t1.charge_201707,
		t1.charge_201708, t1.charge_201709, t1.charge_201710, t1.charge_201711, t1.charge_201712
from
benefit_analyze.charge_2018_gh_example t1
left join
benefit_analyze.dcz_month_4prod_201712 t2
on t1.serv_id=t2.serv_id


select count(serv_id), count(distinct serv_id) from benefit_analyze.charge_2018_gh;


select charge_type, count(charge_type) from benefit_analyze.charge_2018_gh where is_cz='否' group by 1;


select
sum(pre_charge_201801) 
,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)
from
benefit_analyze.charge_2018_gh;

select
   t1.serv_type
  ,t1.area
 ,t1.manage_area
 ,count(t1.serv_id)
 ,sum(t1.pre_charge_201801)
 ,sum(t2.charge_费用)
 ,sum(t2.charge_费用)-sum(t1.pre_charge_201801) 
 ,(sum(t2.charge_费用)-sum(t1.pre_charge_201801))/count(t1.serv_id)
 ,(1-sum(t1.pre_charge_201801)/sum(t2.charge_费用)) rate
from
benefit_analyze.charge_2018_gh t1
left join
benefit_analyze.zyj_qrsr_201801_gh t2
on t1.serv_id=t2.serv_id_m
group by 1,2,3
;



select count(serv_id), count(distinct serv_id) from benefit_analyze.charge_2018_gh;

  select
  sum(pre_charge_201801)
    ,sum(t2.charge_费用)
 from
 (select * from benefit_analyze.charge_2018_gh where is_cz='否') t1
 left join
    (select * from benefit_analyze.zyj_qrsr_201801_res) t2
    on t1.serv_id=t2.serv_id_m
;





select * from benefit_analyze.zyj_qrsr_201801_res  --2018年1月实际收入




drop table if exists fsbd.all_product_pre_charge;
create table fsbd.all_product_pre_charge
as select 
 serv_id, group_id, serv_type, is_cz, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712  
from
benefit_analyze.dwh_pre_charge_2018
;



insert into  fsbd.all_product_pre_charge
select
 serv_id, group_id, serv_type, is_cz, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712  
 from benefit_analyze.ctt_yd__pre_charge;


insert into  fsbd.all_product_pre_charge
select
  serv_id, group_id, serv_type, is_cz, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712   
 from benefit_analyze.charge_2018_gh;


insert into  fsbd.all_product_pre_charge
select
  serv_id, group_id, serv_type, is_cz, serv_grp_type, area, manage_area, user_type,
		user_type2, charge_type, pre_charge_2018, avg_charge_3, avg_charge_6,
		avg_charge_12, charge_dy_201712, pre_charge_201801, pre_charge_201802,
		pre_charge_201803, pre_charge_201804, pre_charge_201805, pre_charge_201806,
		pre_charge_201807, pre_charge_201808, pre_charge_201809, pre_charge_201810,
		pre_charge_201811, pre_charge_201812, charge_201701, charge_201702,
		charge_201703, charge_201704, charge_201705, charge_201706, charge_201707,
		charge_201708, charge_201709, charge_201710, charge_201711, charge_201712  
 from benefit_analyze.charge_2018_itv;





drop table if exists fsbd.all_product_pre_charge_old;
create table fsbd.all_product_pre_charge_old
as
select * from fsbd.all_product_pre_charge;



 360,659,412.3814
 383,048,535.8620
 
 
select sum(pre_charge_201801) from fsbd.all_product_pre_charge;
select sum(pre_charge_201801) from fsbd.all_product_pre_charge_old;


select sum(charge_费用) from benefit_analyze.zyj_qrsr_201801_gh;




select
serv_type
,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)
from
fsbd.all_product_pre_charge
group by 1
;

select count(serv_id), count(distinct serv_id) from fsbd.all_product_pre_charge;


drop table if exists fsbd.all_product_pre_charge_example;
create table fsbd.all_product_pre_charge_example
as
select * from fsbd.all_product_pre_charge;



drop table if exists fsbd.all_product_pre_charge ;
Create Table fsbd.all_product_pre_charge (
serv_id   varchar(2000),
group_id   varchar(2000),                    
serv_type varchar(2000),
is_cz         varchar(2000),
serv_grp_type varchar(2000),
area  varchar(2000),
manage_area  varchar(2000),
conf_id    varchar(2000),
user_type   varchar(2000),
user_type2   varchar(2000),
charge_type   varchar(2000),
pre_charge_2018 double precision,
avg_charge_3  DECIMAL(18,4),
avg_charge_6  DECIMAL(18,4),
avg_charge_12 DECIMAL(18,4),
charge_dy_201712 DECIMAL(18,4),
pre_charge_201801 DECIMAL(18,4),
pre_charge_201802 DECIMAL(18,4),
pre_charge_201803 DECIMAL(18,4),
pre_charge_201804 DECIMAL(18,4),
pre_charge_201805 DECIMAL(18,4),
pre_charge_201806 DECIMAL(18,4),
pre_charge_201807 DECIMAL(18,4),
pre_charge_201808 DECIMAL(18,4),
pre_charge_201809 DECIMAL(18,4),
pre_charge_201810 DECIMAL(18,4),
pre_charge_201811 DECIMAL(18,4),
pre_charge_201812 DECIMAL(18,4),

charge_201701	DECIMAL(18,4),
charge_201702	DECIMAL(18,4),
charge_201703	DECIMAL(18,4),
charge_201704	DECIMAL(18,4),
charge_201705	DECIMAL(18,4),
charge_201706	DECIMAL(18,4),
charge_201707	DECIMAL(18,4),
charge_201708	DECIMAL(18,4),
charge_201709	DECIMAL(18,4),
charge_201710	DECIMAL(18,4),
charge_201711	DECIMAL(18,4),
charge_201712	DECIMAL(18,4),

charge_leiji_201801	DECIMAL(18,4),
charge_leiji_201802	DECIMAL(18,4),
charge_leiji_201803	DECIMAL(18,4),
charge_leiji_201804	DECIMAL(18,4),
charge_leiji_201805	DECIMAL(18,4),
charge_leiji_201806	DECIMAL(18,4),
charge_leiji_201807	DECIMAL(18,4),
charge_leiji_201808	DECIMAL(18,4),
charge_leiji_201809	DECIMAL(18,4),
charge_leiji_201810	DECIMAL(18,4),
charge_leiji_201811	DECIMAL(18,4),
charge_leiji_201812	DECIMAL(18,4)
)distribute  by hash(serv_id);



	insert into fsbd.all_product_pre_charge 
	select 
	t1.serv_id, t1.group_id, t1.serv_type, t1.is_cz, t1.serv_grp_type, t1.area, t1.manage_area, t1.conf_id, t1.user_type,
	t1.user_type2, t1.charge_type, t1.pre_charge_2018, t1.avg_charge_3, t1.avg_charge_6,
	t1.avg_charge_12, t1.charge_dy_201712, t1.pre_charge_201801, t1.pre_charge_201802,
	t1.pre_charge_201803, t1.pre_charge_201804, t1.pre_charge_201805, t1.pre_charge_201806,
	t1.pre_charge_201807, t1.pre_charge_201808, t1.pre_charge_201809, t1.pre_charge_201810,
	t1.pre_charge_201811, t1.pre_charge_201812, t1.charge_201701, t1.charge_201702,
	t1.charge_201703, t1.charge_201704, t1.charge_201705, t1.charge_201706, t1.charge_201707,
	t1.charge_201708, t1.charge_201709, t1.charge_201710, t1.charge_201711, t1.charge_201712
	,t2.charge_费用 charge_leiji_201801
	,t3.charge_费用 charge_leiji_201802
	,t4.charge_费用 charge_leiji_201803
	,t5.charge_费用 charge_leiji_201804
    ,t6.charge_费用 charge_leiji_201805
    ,t7.charge_费用 charge_leiji_201806
    ,t8.charge_费用 charge_leiji_201807
	from
    fsbd.all_product_pre_charge_example t1
    left join
    benefit_analyze.zyj_qrsr_201801_res_去重 t2
    on t1.serv_id=t2.serv_id_m
    left join
    benefit_analyze.zyj_qrsr_201802_res_去重 t3
    on t1.serv_id=t3.serv_id_m
    left join
    benefit_analyze.zyj_qrsr_201803_res_去重 t4
    on t1.serv_id=t4.serv_id_m
    left join
    benefit_analyze.zyj_qrsr_201804_res_去重 t5
    on t1.serv_id=t5.serv_id_m
    left join
    benefit_analyze.zyj_qrsr_201805_res_去重 t6
    on t1.serv_id=t6.serv_id_m
    left join
    benefit_analyze.zyj_qrsr_201806_res_去重 t7
    on t1.serv_id=t7.serv_id_m
    left join
    benefit_analyze.zyj_qrsr_201807_res_去重 t8
    on t1.serv_id=t8.serv_id_m
    ;
    

    
    

    
    
    
    select * from  benefit_analyze.zyj_qrsr_201801_res_去重;
    
    
   select * from fsbd.all_product_pre_charge; 
   
   
	     
	drop table if exists fsbd.all_product_pre_charge_example;
	create table fsbd.all_product_pre_charge_example
	as
	select * from fsbd.all_product_pre_charge;
	     
     
    	select sum(charge_leiji_201802)-sum(pre_charge_201802) from fsbd.all_product_pre_charge where serv_type='宽带';


    
        select * from fsbd.pre_charge_user;
        
       drop table if exists fsbd.pre_charge_user ;
       Create Table fsbd.pre_charge_user 
       (group_id  varchar(2000), group_name  varchar(2000), user_type  varchar(2000),
		user_type2  varchar(2000), user_type3  varchar(2000), group_back_column  varchar(2000),
		group_back_column2  varchar(2000), charge_reserve_201801  varchar(2000),
		charge_reserve_201802  varchar(2000), charge_reserve_201803  varchar(2000),
		charge_reserve_201804  varchar(2000), charge_reserve_201805  varchar(2000),
		charge_reserve_201806  varchar(2000), charge_reserve_201807  varchar(2000),
		charge_reserve_201808  varchar(2000), charge_reserve_201809  varchar(2000),
		charge_reserve_201810  varchar(2000), charge_reserve_201811  varchar(2000),
		charge_reserve_201812  varchar(2000), group_description  varchar(2000))
		distribute  by hash(group_id);
        
    drop table if exists fsbd.pre_charge_user_example;
create table fsbd.pre_charge_user_example
as
select * from fsbd.pre_charge_user;


    insert into fsbd.pre_charge_user
    select * from fsbd.pre_charge_user_example;
    
    delete from fsbd.pre_charge_user;
    
    
    
    
    select * from  fsbd.all_product_pre_charge_example where serv_type='固话';
    
   select * from benefit_analyze.zyj_qrsr_201801_res
    
    select serv_type
    ,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)
    from  fsbd.all_product_pre_charge group by 1 order by 1;
    
    
    select t1.*, t2.group_description
    from
    (
    select 
    group_id
    ,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)  charge_2018
     from fsbd.all_product_pre_charge where area like '禅城%' group by 1 order by 2 desc limit 10
    ) t1
    left join
    fsbd.pre_charge_user t2
    on t1.group_id=t2.group_id
    order by charge_2018 desc
    ;
    
    

    
    select group_id, count(group_id) from fsbd.all_product_pre_charge group by 1;
    
    
  select * from fsbd.all_product_pre_charge where charge_leiji_201801>=50000 and serv_type in ('移动','固话','ITV','宽带');
  
  select * from fsbd.all_product_pre_charge where serv_type='ITV' and charge_leiji_201801>=50000;


select
serv_type
,sum(charge_201712)
,sum(pre_charge_201801)
,sum(charge_leiji_201801)   
,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)
 from fsbd.all_product_pre_charge group by 1;
 
 select
 area
,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)
 from fsbd.all_product_pre_charge group by 1;
 
 
 
 
 
  select * from fsbd.all_product_pre_charge where serv_id='F0FA8BCC6DC51FA457569B637C5097DC';
  

--------------------------------------------------修改区局名----------------------------------------------------------
	
	drop table if exists fsbd.all_product_pre_charge_example;
	create table fsbd.all_product_pre_charge_example
	as
	select * from fsbd.all_product_pre_charge;



		drop table if exists fsbd.all_product_pre_charge ;
	Create Table fsbd.all_product_pre_charge as
	select 
	t1.serv_id, t1.group_id, t1.serv_type, t1.is_cz, t1.serv_grp_type, t1.AREA, t1.MANAGE_AREA, t2.conf_id, t1.user_type,
	t1.user_type2, t1.charge_type, t1.pre_charge_2018, t1.avg_charge_3, t1.avg_charge_6,
	t1.avg_charge_12, t1.charge_dy_201712, t1.pre_charge_201801, t1.pre_charge_201802,
	t1.pre_charge_201803, t1.pre_charge_201804, t1.pre_charge_201805, t1.pre_charge_201806,
	t1.pre_charge_201807, t1.pre_charge_201808, t1.pre_charge_201809, t1.pre_charge_201810,
	t1.pre_charge_201811, t1.pre_charge_201812, t1.charge_201701, t1.charge_201702,
	t1.charge_201703, t1.charge_201704, t1.charge_201705, t1.charge_201706, t1.charge_201707,
	t1.charge_201708, t1.charge_201709, t1.charge_201710, t1.charge_201711, t1.charge_201712
	,t1.charge_leiji_201801  charge_leiji_201801
	,t1.charge_leiji_201802  charge_leiji_201802
	,t1.charge_leiji_201803  charge_leiji_201803
	,t1.charge_leiji_201804  charge_leiji_201804
	,t1.charge_leiji_201805  charge_leiji_201805
	,t1.charge_leiji_201806  charge_leiji_201806
	,t1.charge_leiji_201807  charge_leiji_201807
	,t1.charge_leiji_201808  charge_leiji_201808
	,t1.charge_leiji_201809  charge_leiji_201809
	,t1.charge_leiji_201810  charge_leiji_201810
	,t1.charge_leiji_201811  charge_leiji_201811
	,t1.charge_leiji_201812  charge_leiji_201812
	from
	fsbd.all_product_pre_charge_example t1
	left join
	benefit_analyze.hx_duty_result_201712 t2
    on t1.serv_id=t2.serv_id_m
    left join
    benefit_analyze.v_area_sales_config t3
    on
	t2.SALES_CENTER_ID=t3.MANAGE_AREA_ID 
    ;
    
    

    
    
   select manage_area, count( serv_id) from  fsbd.all_product_pre_charge group by 1;
    
   select * from  fsbd.all_product_pre_charge where charge_201712>10000;

 
  
--Studio中导入
drop table if exists benefit_analyze.v_area_sales_config;
create table benefit_analyze.v_area_sales_config
(   
     AREA_ID          varchar(2000)
     ,AREA               varchar(2000)
     ,MANAGE_AREA_ID               varchar(2000)
     ,MANAGE_AREA               varchar(2000)
)  distribute by hash (AREA_ID);






-------------------------------------------------------------对2017年12月的本部的数据进行更新--------------------------------------------------
	
	drop table if exists fsbd.all_product_pre_charge_example;
	create table fsbd.all_product_pre_charge_example
	as
	select * from fsbd.all_product_pre_charge;




		drop table if exists fsbd.all_product_pre_charge ;
	Create Table fsbd.all_product_pre_charge as
	select 
	t1.serv_id, t1.group_id, t1.serv_type, t1.is_cz, t1.serv_grp_type
	
	,case when t1.manage_area is not null and t1.manage_area like '%本部' then t3.AREA
	           when t1.manage_area is not null and t1.manage_area like '%本部1' then t3.AREA
	           else t1.area end as AREA
	,case when t1.manage_area is not null and t1.manage_area like '%本部' then t3.MANAGE_AREA
	          when t1.manage_area is not null and t1.manage_area like '%本部1' then t3.MANAGE_AREA
	          else t1.MANAGE_AREA end as MANAGE_AREA
	,case when t1.manage_area is not null and t1.manage_area like '%本部' then t2.conf_id
	when t1.manage_area is not null and t1.manage_area like '%本部1' then t2.conf_id
	else t1.conf_id end as conf_id
	
	,t1.user_type,
	t1.user_type2, t1.charge_type, t1.pre_charge_2018, t1.avg_charge_3, t1.avg_charge_6,
	t1.avg_charge_12, t1.charge_dy_201712, t1.pre_charge_201801, t1.pre_charge_201802,
	t1.pre_charge_201803, t1.pre_charge_201804, t1.pre_charge_201805, t1.pre_charge_201806,
	t1.pre_charge_201807, t1.pre_charge_201808, t1.pre_charge_201809, t1.pre_charge_201810,
	t1.pre_charge_201811, t1.pre_charge_201812, t1.charge_201701, t1.charge_201702,
	t1.charge_201703, t1.charge_201704, t1.charge_201705, t1.charge_201706, t1.charge_201707,
	t1.charge_201708, t1.charge_201709, t1.charge_201710, t1.charge_201711, t1.charge_201712
	,t1.charge_leiji_201801  charge_leiji_201801
	,t1.charge_leiji_201802  charge_leiji_201802
	,t1.charge_leiji_201803  charge_leiji_201803
	,t1.charge_leiji_201804  charge_leiji_201804
	,t1.charge_leiji_201805  charge_leiji_201805
	,t1.charge_leiji_201806  charge_leiji_201806
	,t1.charge_leiji_201807  charge_leiji_201807
	,t1.charge_leiji_201808  charge_leiji_201808
	,t1.charge_leiji_201809  charge_leiji_201809
	,t1.charge_leiji_201810  charge_leiji_201810
	,t1.charge_leiji_201811  charge_leiji_201811
	,t1.charge_leiji_201812  charge_leiji_201812
	from
	fsbd.all_product_pre_charge_example t1
	left join
	benefit_analyze.hx_duty_result_201802 t2
    on t1.serv_id=t2.serv_id_m
    left join
    benefit_analyze.v_area_sales_config t3
    on
	t2.SALES_CENTER_ID=t3.MANAGE_AREA_ID 
    ;



select * from fsbd.all_product_pre_charge where manage_area='城区营销服务中心'

城区营销服务中心要全部删除



select
  sum(pre_charge_201801)
 ,sum(charge_leiji_201801)
,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)
 from fsbd.all_product_pre_charge
 ;
 
 
 
 
 
 
 
 select serv_type, sum(charge_dy_201712), sum(charge_201712), sum(charge_leiji_201801)-sum(pre_charge_201801) from fsbd.all_product_pre_charge group by 1;
 
  select serv_type, sum(charge_dy_201712), sum(charge_201712), sum(charge_leiji_201802)-sum(pre_charge_201802) from fsbd.all_product_pre_charge group by 1;


select * from fsbd.all_product_pre_charge_example;

select count(serv_id) from fsbd.all_product_pre_charge where manage_area is null;

select manage_area, count(serv_id) from fsbd.all_product_pre_charge group by 1; 

select manage_area, count(serv_id) from fsbd.all_product_pre_charge_example group by 1; 



select * from benefit_analyze.v_area_sales_config;


delete from fsbd.sum_charge;

select * from  fsbd.sum_charge;



	drop table if exists fsbd.all_product_pre_charge_example;
	create table fsbd.all_product_pre_charge_example
	as
	select * from fsbd.all_product_pre_charge;




select serv_type, count(serv_id) from fsbd.all_product_pre_charge_part group by 1;

select serv_type, count(serv_id) from fsbd.all_product_pre_charge group by 1;

39,515

3,049,449


 select
  t1.*
 from
 fsbd.all_product_pre_charge t1
 left join
 fsbd.pre_charge_user t2
 on t1.group_id=t2.group_id
 where t2.group_id is null
 ;




select * from  fsbd.pre_charge_user;

select * from fsbd.pre_charge_user where group_id='2030102' ;



select group_id, count(serv_id) from fsbd.all_product_pre_charge group by 1;



select serv_type, sum(pre_charge_201804), sum(charge_leiji_201804) from  fsbd.all_product_pre_charge group by 1;



select * from  fsbd.all_product_pre_charge where serv_type='固话' and charge_leiji_201804>10000;



select serv_type, sum(pre_charge_201805), sum(charge_leiji_201805) from fsbd.all_product_pre_charge group by 1;




drop table if exists fsbd.all_product_pre_charge_example;
create table  fsbd.all_product_pre_charge_example
as select 
     t1.serv_id 
	, t1.group_id, t1.serv_type, t1.is_cz, t1.serv_grp_type, t1.area, t1.manage_area, t1.conf_id, t1.user_type,
	t1.user_type2, t1.charge_type, t1.pre_charge_2018, t1.avg_charge_3, t1.avg_charge_6,
	t1.avg_charge_12, t1.charge_dy_201712, 
	
	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201801
	           end as pre_charge_201801, 
	           
	           	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201802
	           end as pre_charge_201802,
	           
           	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201803
	           end as pre_charge_201803,
	           
	                     	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201804
	           end as pre_charge_201804,
	           
	                      	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201805
	           end as pre_charge_201805,
	           
	                      	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201806
	           end as pre_charge_201806,


           	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201807
	           end as pre_charge_201807,
	           
	           
           	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201808
	           end as pre_charge_201808,

           	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201809
	           end as pre_charge_201809,
	           
	           
	                     	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201810
	           end as pre_charge_201810, 
	           
	               	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201811
	           end as pre_charge_201811,
	           
	           
	                     	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.pre_charge_201812
	           end as pre_charge_201812,
	
	t1.charge_201701, t1.charge_201702,t1.charge_201703, t1.charge_201704, 
	t1.charge_201705, t1.charge_201706, t1.charge_201707, t1.charge_201708, 
	t1.charge_201709, t1.charge_201710, t1.charge_201711, 
	
	                     	case when t1.serv_id in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') then 0
	           else t1.charge_201712
	           end as charge_201712
	
	,t1.charge_leiji_201801
	,t1.charge_leiji_201802
	,t1.charge_leiji_201803
	,t1.charge_leiji_201804
	,t1.charge_leiji_201805
	,t1.charge_leiji_201806
	,t1.charge_leiji_201807
	,t1.charge_leiji_201808
	,t1.charge_leiji_201809
	,t1.charge_leiji_201810
	,t1.charge_leiji_201811
	,t1.charge_leiji_201812 


from
fsbd.all_product_pre_charge t1;







select * from fsbd.all_product_pre_charge_example where serv_id not in ('EB8AE30BB2F6D931934752FFAF31A7DB', 'D5CC6C966C3671712E46146D97FC172B', 'F6EA5DE95D16FD8288F3FC2E69319B0F', 
	'059CA3B3E42A7C0BA1AE1F6C8A93B6AC', 'FC43B07C402E3869264C5126AE0DD51A', '02829E12D16EE1D56E42F76046AD35B1', 
	'336C2E28B094CC9817C1CE130219FF30', '1C4BCEA8454B60F3E6746D11A88FDA79', '428E5BFB05F49F9601C0F0DF5D17FA16', 
	'E38E55234017539451E67AB604F642E1', '0AA6DD34D55FD608E22B67C2CB21BA1F', 'D665B333A7C837E7FFB233DFC19C53C8', 
	'C7C0B803E0765ECBD5140EA7B16187D0') ;
	
	
	select sum(pre_charge_201804), sum(charge_leiji_201804) from fsbd.all_product_pre_charge_example where serv_type='组网专线';
	
	select sum(pre_charge_201805) from fsbd.all_product_pre_charge where serv_type='组网专线';
	

	drop table if exists fsbd.all_product_pre_charge;
	create table fsbd.all_product_pre_charge
	as
	select * from fsbd.all_product_pre_charge_example;
	
	
	
	
	
	
		
	select area, 
	serv_grp_type,
	sum(charge_201712),
	sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)   charge_pre_sum
	from  fsbd.all_product_pre_charge
	group by 1,2
	order by case when area ='顺德' then 1
	                       when area='南海' then 2
	                       when area='禅城' then 3
	                       when area='三水' then 4
	                       when area='高明' then 5 
	             else 6
	             end, 2
	;
	
	
	
	
	
	
	
	
	
	
	select area, 
	sum(charge_201712),
	sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)   charge_pre_sum
	from  fsbd.all_product_pre_charge
	group by 1
	order by case when area ='顺德' then 1
	                       when area='南海' then 2
	                       when area='禅城' then 3
	                       when area='三水' then 4
	                       when area='高明' then 5 
	             else 6
	             end
	;
	
	
	
		select
	sum(charge_201712),
	sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)
+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807)+sum(pre_charge_201808)
+sum(pre_charge_201809)+sum(pre_charge_201810)+sum(pre_charge_201811)+sum(pre_charge_201812)   charge_pre_sum
	from  fsbd.all_product_pre_charge

	;
	
	
	
	
	
	select 
	sum(pre_charge_201801), sum(pre_charge_201802), sum(pre_charge_201803), sum(pre_charge_201804), 
	sum(pre_charge_201805), sum(pre_charge_201806), sum(pre_charge_201807), sum(pre_charge_201808),
	sum(pre_charge_201809), sum(pre_charge_201810), sum(pre_charge_201811), sum(pre_charge_201812)
	 from  fsbd.all_product_pre_charge
	 ;
	
	
	
	
	select 
	serv_type
	,sum(charge_leiji_201806)
	,sum(pre_charge_201806)
	from  fsbd.all_product_pre_charge
	group by 1
	;
	
	
	
	
	
	select * from  fsbd.all_product_pre_charge;
	
	


	
	
	

	

	
	
	
	