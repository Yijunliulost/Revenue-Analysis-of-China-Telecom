---------------sql逐步运行--------------
---------------第三步需加上每个月去重的表，然后加上相应月份的  ,t8.charge_费用 charge_leiji_20180x----------


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
    