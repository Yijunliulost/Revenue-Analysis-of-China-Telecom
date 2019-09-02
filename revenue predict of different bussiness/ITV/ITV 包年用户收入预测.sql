	drop table if exists benefit_analyze.bn_2018_itv;
	create table benefit_analyze.bn_2018_itv distribute by hash (serv_id) 
	as
	select 
	t1.serv_id
	,case when 1=1 then '04000005' end as group_id
	,t1.serv_grp_type 
	,t1.area 
	,t1.manage_area
	,case when 1=1 then '稳定群' end as user_type
	,case when 1=1 then 'itv5' end as user_type2
	,t1.charge_type
	,t1.pre_charge_2018
	,t1.avg_charge_3
	,t1.avg_charge_6
	,t1.avg_charge_12
	,t1.charge_201712 as charge_dy_201712
	,t1.pre_charge_2018 as pre_charge_201801
	,t1.pre_charge_2018 as pre_charge_201802
	,t1.pre_charge_2018 as pre_charge_201803
	,t1.pre_charge_2018 as pre_charge_201804
	,t1.pre_charge_2018 as pre_charge_201805
	,t1.pre_charge_2018 as pre_charge_201806
	,t1.pre_charge_2018 as pre_charge_201807
	,t1.pre_charge_2018 as pre_charge_201808
	,t1.pre_charge_2018 as pre_charge_201809
	,t1.pre_charge_2018 as pre_charge_201810
	,t1.pre_charge_2018 as pre_charge_201811
	,t1.pre_charge_2018 as pre_charge_201812
	,t2.charge_201701
	,t2.charge_201702
	,t2.charge_201703
	,t2.charge_201704
	,t2.charge_201705
	,t2.charge_201706
	,t2.charge_201707
	,t2.charge_201708
	,t2.charge_201709
	,t2.charge_201710
	,t2.charge_201711
	,t2.charge_201712
	
	
	from
	(select * from benefit_analyze.ex_contract_2018_itv) t1
	inner join
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166')) t0
	on t1.serv_id=t0.serv_id
	left join
	(select * from benefit_analyze.ex_contract_2017_itv) t2
	on t1.serv_id=t2.serv_id
	
	--------------------------------------------一年以上-------------------------------
	inner  join
	(select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201712 
	where limit_date>='2019-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	--------------------------------------一年以内----------------------------------------
	left join
	(
	select * from benefit_analyze.itv_inyear_201712
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------是否存在融合业务---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201712) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV活跃度考虑-------------------------------------------------
	left join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201712) b6
	on t0.acc_nbr=b6.acc_nbr
	
	-----------------------------------------排除已经计算的群-----------------------------------------------
	left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4') c1
    on t1.serv_id=c1.serv_id
    left join
	(select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date>='2017-1-1')  c2
     on t1.serv_id=c2.serv_id
     where c1.serv_id is null and c2.serv_id is null and b6.acc_nbr is not null
	;
	
	
	
	select * from benefit_analyze.bn_2018_itv;
	select count(serv_id), count(distinct serv_id) from benefit_analyze.bn_2018_itv;
	