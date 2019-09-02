
	
	-----------------------------------------分类分析2018年ITV用户收入预测-----------------------------------------------------------
	
	
	---------------------------------------套餐在一年外的用户---------------------------------
	

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

	
	
	----------------------------------套餐在一年内的用户-------------------------------------
	
	drop table if exists benefit_analyze.itv_inyear_201712;
	create table benefit_analyze.itv_inyear_201712 distribute by hash (serv_id) 
	as
	select
	distinct b2.serv_id
	from
	(
	select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201712 
	where limit_date<'2019-1-1' and limit_date>='2018-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a2
	) b2
	left join
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
	on b2.serv_id=b1.serv_id
	where b1.serv_id is null
	;
	


	
	
	------------------------------------------是否协议支付用户-------------------------------------------
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	
	
	------------------------------------------ITV活跃度考虑-------------------------------------------------
	
     select * from fsdw.dcz_itv_active_201712;
	
	
	


	
	
drop table if exists benefit_analyze.itv_mix_201712;
create table benefit_analyze.itv_mix_201712
(
     serv_id                  					varchar(2000)
	
)  distribute by hash (serv_id);
	
	

	
	insert into
	benefit_analyze.itv_mix_201712
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.dcz_month_4prod_201712 
	where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201712) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('3204','3205')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201712) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	
	

	
		insert into
	benefit_analyze.itv_mix_201712
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201712) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('47','48','51','52','56','57','950','999','1022','1023',
    '1100','2340','3881','500001200','500001741','500002660')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201712) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	

	
	
   	insert into
	benefit_analyze.itv_mix_201712
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201712) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201712) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
  	
  	
  	
  	
  	
  	
  	----------------------------------------------------固话协议缴费用户2017年收入---------------------------------------------------------------------
	
	drop table if exists benefit_analyze.contract_pay_charge_2017_itv;
	create table benefit_analyze.contract_pay_charge_2017_itv distribute by hash (serv_id) 
	as
	select t1.serv_id ,t2.charge_201712 ,t3.charge_201711 ,t4.charge_201710
	            ,t5.charge_201709 ,t6.charge_201708 ,t7.charge_201707 ,t8.charge_201706
	            ,t9.charge_201705 ,t10.charge_201704 ,t11.charge_201703 ,t12.charge_201702
	            ,t13.charge_201701
	from (select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) t1
	inner join
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166')) t0
	on t1.serv_id=t0.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201712
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201712') t2
	on t1.serv_id=t2.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201711
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201711') t3
	on t1.serv_id=t3.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201710
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201710') t4
	on t1.serv_id=t4.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201709
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201709') t5
	on t1.serv_id=t5.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201708
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201708') t6
	on t1.serv_id=t6.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201707
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201707') t7
	on t1.serv_id=t7.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201706
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201706') t8
	on t1.serv_id=t8.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201705
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201705') t9
	on t1.serv_id=t9.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201704
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201704') t10
	on t1.serv_id=t10.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201703
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201703') t11
	on t1.serv_id=t11.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201702
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201702') t12
	on t1.serv_id=t12.serv_id
	left join 
	(select serv_id,coalesce(xcl_charge,0) as charge_201701
	from benefit_analyze.DCZ_LJP_IMP_CHARGE where months='201701') t13
	on t1.serv_id=t13.serv_id
	;

	select * from benefit_analyze.contract_pay_charge_2017_itv;
	


	select count(serv_id),count(distinct serv_id) from benefit_analyze.contract_pay_charge_2017_itv;
	
	
	
	-----协议缴费用户2017年收入波动
	drop table if exists benefit_analyze.contract_pay_charge_2017_itvbd;
	create table benefit_analyze.contract_pay_charge_2017_itvbd distribute by hash (serv_id) as
	select t1.serv_id,t1.charge_201712,t1.avg_charge_12,t1.avg_charge_6,t1.avg_charge_3,
	case when t1.avg_charge_12=0 then 0 else abs((t1.charge_201712-t1.avg_charge_12)/t1.avg_charge_12) end as charge_rate_12,           
	case when t1.avg_charge_6=0 then 0 else abs((t1.charge_201712-t1.avg_charge_6)/t1.avg_charge_6) end as charge_rate_6,            
	case when t1.avg_charge_3=0 then 0 else abs((t1.charge_201712-t1.avg_charge_3)/t1.avg_charge_3) end as charge_rate_3          
	from 
	(select t1.serv_id,t1.charge_201712,
	(coalesce(t1.charge_201712,0)+coalesce(t1.charge_201711,0)+coalesce(t1.charge_201710,0)+coalesce(t1.charge_201709,0)
	+coalesce(t1.charge_201708,0)+coalesce(t1.charge_201707,0)+coalesce(t1.charge_201706,0)+coalesce(t1.charge_201705,0)
	+coalesce(t1.charge_201704,0)+coalesce(t1.charge_201703,0)+coalesce(t1.charge_201702,0)+coalesce(t1.charge_201701,0))/
	(case when ((case when t1.charge_201712 is null then 0 else 1 end)+(case when t1.charge_201711 is null then 0 else 1 end)
	+(case when t1.charge_201710 is null then 0 else 1 end)+(case when t1.charge_201709 is null then 0 else 1 end)
	+(case when t1.charge_201708 is null then 0 else 1 end)+(case when t1.charge_201707 is null then 0 else 1 end)
	+(case when t1.charge_201706 is null then 0 else 1 end)+(case when t1.charge_201705 is null then 0 else 1 end)
	+(case when t1.charge_201704 is null then 0 else 1 end)+(case when t1.charge_201703 is null then 0 else 1 end)
	+(case when t1.charge_201702 is null then 0 else 1 end)+(case when t1.charge_201701 is null then 0 else 1 end))=0 
	then 0.0000000001 else ((case when t1.charge_201712 is null then 0 else 1 end)+(case when t1.charge_201711 is null then 0 else 1 end)
	+(case when t1.charge_201710 is null then 0 else 1 end)+(case when t1.charge_201709 is null then 0 else 1 end)
	+(case when t1.charge_201708 is null then 0 else 1 end)+(case when t1.charge_201707 is null then 0 else 1 end)
	+(case when t1.charge_201706 is null then 0 else 1 end)+(case when t1.charge_201705 is null then 0 else 1 end)
	+(case when t1.charge_201704 is null then 0 else 1 end)+(case when t1.charge_201703 is null then 0 else 1 end)
	+(case when t1.charge_201702 is null then 0 else 1 end)+(case when t1.charge_201701 is null then 0 else 1 end)) end) as avg_charge_12,

	(coalesce(t1.charge_201712,0)+coalesce(t1.charge_201711,0)+coalesce(t1.charge_201710,0)+coalesce(t1.charge_201709,0)
	+coalesce(t1.charge_201708,0)+coalesce(t1.charge_201707,0))/
	(case when ((case when t1.charge_201712 is null then 0 else 1 end)+(case when t1.charge_201711 is null then 0 else 1 end)
	+(case when t1.charge_201710 is null then 0 else 1 end)+(case when t1.charge_201709 is null then 0 else 1 end)
	+(case when t1.charge_201708 is null then 0 else 1 end)+(case when t1.charge_201707 is null then 0 else 1 end))=0 
	then 0.0000000001 else ((case when t1.charge_201712 is null then 0 else 1 end)+(case when t1.charge_201711 is null then 0 else 1 end)
	+(case when t1.charge_201710 is null then 0 else 1 end)+(case when t1.charge_201709 is null then 0 else 1 end)
	+(case when t1.charge_201708 is null then 0 else 1 end)+(case when t1.charge_201707 is null then 0 else 1 end)) end) as avg_charge_6,

	(coalesce(t1.charge_201712,0)+coalesce(t1.charge_201711,0)+coalesce(t1.charge_201710,0))/(case when ((case when t1.charge_201712 is null then 0 else 1 end)
	+(case when t1.charge_201711 is null then 0 else 1 end)+(case when t1.charge_201710 is null then 0 else 1 end))=0 
	then 0.0000000001 else ((case when t1.charge_201712 is null then 0 else 1 end)
	+(case when t1.charge_201711 is null then 0 else 1 end)+(case when t1.charge_201710 is null then 0 else 1 end)) end) as avg_charge_3	
	from benefit_analyze.contract_pay_charge_2017_itv t1
	) t1
	;



	------------------------------------------------------协议缴费用户预测----------------------------------------------------------------
	
	drop table if exists benefit_analyze.contract_pay_charge_2018_itv;
	create table benefit_analyze.contract_pay_charge_2018_itv distribute by hash (serv_id) 
	as
	select t1.serv_id,t1.serv_type,t1.serv_grp_type,t1.area,t1.manage_area,t1.charge_type
	,case when t1.charge_type=1 then t1.charge_201712
	          when t1.charge_type=2 then t1.avg_charge_12 
	          end as pre_charge_2018
	 ,t1.avg_charge_3,t1.avg_charge_6,t1.avg_charge_12,t1.charge_201712
	from 
	(select t1.*,t3.charge_201712,t3.avg_charge_12,t3.avg_charge_6,t3.avg_charge_3
	,case when t3.charge_rate_12<=0.1 then 1
	          when t3.charge_rate_12>0.1 and t3.charge_rate_3<=0.1 then 1
	          when t3.charge_rate_12>0.1 and t3.charge_rate_3>0.1 then 2 
	          end as charge_type
	from
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	benefit_analyze.contract_pay_charge_2017_itv t2       ----收入
	on t1.serv_id=t2.serv_id
	left join
	benefit_analyze.contract_pay_charge_2017_itvbd t3    ----收入波动
	on t2.serv_id=t3.serv_id 
	) t1;
	
	
	select * from benefit_analyze.contract_pay_charge_2018_itv;
	
	
	
	drop table if exists benefit_analyze.contract_2018_itv;
	create table benefit_analyze.contract_2018_itv distribute by hash (serv_id) 
	as
	select 
	t1.serv_id
	,case when 1=1 then '04000001' end as group_id
	,t1.serv_grp_type 
	,t1.area 
	,t1.manage_area
	,case when 1=1 then '特殊群' end as user_type
	,case when 1=1 then 'itv1' end as user_type2
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
    (select * from benefit_analyze.contract_pay_charge_2018_itv) t1
    left join
    (select * from benefit_analyze.contract_pay_charge_2017_itv) t2
    on t1.serv_id=t2.serv_id
    ;
    
    
    
    
    ----------------------------------------------------itv排除协议用户2017年收入---------------------------------------------------------------------
	
	drop table if exists benefit_analyze.ex_contract_2017_itv;
	create table benefit_analyze.ex_contract_2017_itv distribute by hash (serv_id) 
	as
	select t1.serv_id ,coalesce(t2.charge_201712,0) charge_201712,t3.charge_201711 ,t4.charge_201710
	            ,t5.charge_201709 ,t6.charge_201708 ,t7.charge_201707 ,t8.charge_201706
	            ,t9.charge_201705 ,t10.charge_201704 ,t11.charge_201703 ,t12.charge_201702
	            ,t13.charge_201701
    from
	(select serv_id from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166') ) t1
	left join
	(select serv_id from (select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) t) t0
	on t1.serv_id=t0.serv_id
	left join 
	(select serv_id_m,charge_费用 as charge_201712
	from benefit_analyze.zyj_qrsr_201712_itv) t2
	on t1.serv_id=t2.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201711
	from benefit_analyze.zyj_qrsr_201711_itv) t3
	on t1.serv_id=t3.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201710
	from benefit_analyze.zyj_qrsr_201710_itv) t4
	on t1.serv_id=t4.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201709
	from benefit_analyze.zyj_qrsr_201709_itv) t5
	on t1.serv_id=t5.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201708
	from benefit_analyze.zyj_qrsr_201708_itv) t6
	on t1.serv_id=t6.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201707
	from benefit_analyze.zyj_qrsr_201707_itv) t7
	on t1.serv_id=t7.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201706
	from benefit_analyze.zyj_qrsr_201706_itv) t8
	on t1.serv_id=t8.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201705
	from benefit_analyze.zyj_qrsr_201705_itv) t9
	on t1.serv_id=t9.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201704
	from benefit_analyze.zyj_qrsr_201704_itv) t10
	on t1.serv_id=t10.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201703
	from benefit_analyze.zyj_qrsr_201703_itv) t11
	on t1.serv_id=t11.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201702
	from benefit_analyze.zyj_qrsr_201702_itv) t12
	on t1.serv_id=t12.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201701
	from benefit_analyze.zyj_qrsr_201701_itv) t13
	on t1.serv_id=t13.serv_id_m
	where t0.serv_id is null
	;

	select sum(charge_201712) from benefit_analyze.ex_contract_2017_itv;   11,662,710.44
	select  sum(charge_费用) from  benefit_analyze.zyj_qrsr_201712_itv;     11,720,203.57
	

   
  

	---------------------------------------------排除协议缴费用户2017年收入波动-----------------------------------------
	drop table if exists benefit_analyze.ex_contract_2017_itvbd;
	create table benefit_analyze.ex_contract_2017_itvbd distribute by hash (serv_id) as
	select t1.serv_id, t1.charge_201712 ,t1.avg_charge_12,t1.avg_charge_6,t1.avg_charge_3,
	case when t1.avg_charge_12=0 then 0 else abs((t1.charge_201712-t1.avg_charge_12)/t1.avg_charge_12) end as charge_rate_12,           
	case when t1.avg_charge_6=0 then 0 else abs((t1.charge_201712-t1.avg_charge_6)/t1.avg_charge_6) end as charge_rate_6,            
	case when t1.avg_charge_3=0 then 0 else abs((t1.charge_201712-t1.avg_charge_3)/t1.avg_charge_3) end as charge_rate_3          
	from 
	(select t1.serv_id, t1.charge_201712,
	(coalesce(t1.charge_201712,0)+coalesce(t1.charge_201711,0)+coalesce(t1.charge_201710,0)+coalesce(t1.charge_201709,0)
	+coalesce(t1.charge_201708,0)+coalesce(t1.charge_201707,0)+coalesce(t1.charge_201706,0)+coalesce(t1.charge_201705,0)
	+coalesce(t1.charge_201704,0)+coalesce(t1.charge_201703,0)+coalesce(t1.charge_201702,0)+coalesce(t1.charge_201701,0))/
	(case when ((case when t1.charge_201712 is null then 0 else 1 end)+(case when t1.charge_201711 is null then 0 else 1 end)
	+(case when t1.charge_201710 is null then 0 else 1 end)+(case when t1.charge_201709 is null then 0 else 1 end)
	+(case when t1.charge_201708 is null then 0 else 1 end)+(case when t1.charge_201707 is null then 0 else 1 end)
	+(case when t1.charge_201706 is null then 0 else 1 end)+(case when t1.charge_201705 is null then 0 else 1 end)
	+(case when t1.charge_201704 is null then 0 else 1 end)+(case when t1.charge_201703 is null then 0 else 1 end)
	+(case when t1.charge_201702 is null then 0 else 1 end)+(case when t1.charge_201701 is null then 0 else 1 end))=0 
	then 0.0000000001 else ((case when t1.charge_201712 is null then 0 else 1 end)+(case when t1.charge_201711 is null then 0 else 1 end)
	+(case when t1.charge_201710 is null then 0 else 1 end)+(case when t1.charge_201709 is null then 0 else 1 end)
	+(case when t1.charge_201708 is null then 0 else 1 end)+(case when t1.charge_201707 is null then 0 else 1 end)
	+(case when t1.charge_201706 is null then 0 else 1 end)+(case when t1.charge_201705 is null then 0 else 1 end)
	+(case when t1.charge_201704 is null then 0 else 1 end)+(case when t1.charge_201703 is null then 0 else 1 end)
	+(case when t1.charge_201702 is null then 0 else 1 end)+(case when t1.charge_201701 is null then 0 else 1 end)) end) as avg_charge_12,

	(coalesce(t1.charge_201712,0)+coalesce(t1.charge_201711,0)+coalesce(t1.charge_201710,0)+coalesce(t1.charge_201709,0)
	+coalesce(t1.charge_201708,0)+coalesce(t1.charge_201707,0))/
	(case when ((case when t1.charge_201712 is null then 0 else 1 end)+(case when t1.charge_201711 is null then 0 else 1 end)
	+(case when t1.charge_201710 is null then 0 else 1 end)+(case when t1.charge_201709 is null then 0 else 1 end)
	+(case when t1.charge_201708 is null then 0 else 1 end)+(case when t1.charge_201707 is null then 0 else 1 end))=0 
	then 0.0000000001 else ((case when t1.charge_201712 is null then 0 else 1 end)+(case when t1.charge_201711 is null then 0 else 1 end)
	+(case when t1.charge_201710 is null then 0 else 1 end)+(case when t1.charge_201709 is null then 0 else 1 end)
	+(case when t1.charge_201708 is null then 0 else 1 end)+(case when t1.charge_201707 is null then 0 else 1 end)) end) as avg_charge_6,

	(coalesce(t1.charge_201712,0)+coalesce(t1.charge_201711,0)+coalesce(t1.charge_201710,0))/(case when ((case when t1.charge_201712 is null then 0 else 1 end)
	+(case when t1.charge_201711 is null then 0 else 1 end)+(case when t1.charge_201710 is null then 0 else 1 end))=0 
	then 0.0000000001 else ((case when t1.charge_201712 is null then 0 else 1 end)
	+(case when t1.charge_201711 is null then 0 else 1 end)+(case when t1.charge_201710 is null then 0 else 1 end)) end) as avg_charge_3	
	from benefit_analyze.ex_contract_2017_itv t1
	) t1
	;
	
	
	select * from benefit_analyze.ex_contract_2017_itvbd;
	select count(serv_id),count(distinct serv_id) from benefit_analyze.ex_contract_2017_itvbd;




	------------------------------------------------------固话用户/排除协议缴费用户预测----------------------------------------------------------------
	
	drop table if exists benefit_analyze.ex_contract_2018_itv1;
	create table benefit_analyze.ex_contract_2018_itv1 distribute by hash (serv_id) 
	as
	select t1.serv_id,t1.serv_type,t1.serv_grp_type,t1.area,t1.manage_area,t1.charge_type
	,case when t1.charge_type=1 then t1.charge_201712
	          when t1.charge_type=2 then t1.avg_charge_12 
	          end as pre_charge_2018
	 ,t1.avg_charge_3,t1.avg_charge_6,t1.avg_charge_12,t1.charge_201712
	from 
	(select t1.*, t3.charge_201712,t3.avg_charge_12,t3.avg_charge_6,t3.avg_charge_3
	,case when t3.charge_rate_12<=0.1 then 1
	          when t3.charge_rate_12>0.1 and t3.charge_rate_3<=0.1 then 1
	          when t3.charge_rate_12>0.1 and t3.charge_rate_3>0.1 then 2 
	          end as charge_type
	from
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166') and is_cz='是' ) t1
	inner join
	benefit_analyze.ex_contract_2017_itv t2       ----收入
	on t1.serv_id=t2.serv_id
	left join
	benefit_analyze.ex_contract_2017_itvbd t3    ----收入波动
	on t2.serv_id=t3.serv_id 
	) t1
	;
    
    
    
    
    
    	drop table if exists benefit_analyze.ex_contract_2018_itv2;
	create table benefit_analyze.ex_contract_2018_itv2 distribute by hash (serv_id) 
	as
	select t1.serv_id,t1.serv_type,t1.serv_grp_type,t1.area,t1.manage_area,case when 1=1 then 1 end as charge_type
	,case when t1.charge_type=1 then t1.charge_201712
	          when t1.charge_type=2 then t1.charge_201712 
	          end as pre_charge_2018
	 ,t1.avg_charge_3,t1.avg_charge_6,t1.avg_charge_12,t1.charge_201712
	from 
	(select t1.*, t3.charge_201712,t3.avg_charge_12,t3.avg_charge_6,t3.avg_charge_3
	,case when t3.charge_rate_12<=0.1 then 1
	          when t3.charge_rate_12>0.1 and t3.charge_rate_3<=0.1 then 1
	          when t3.charge_rate_12>0.1 and t3.charge_rate_3>0.1 then 2 
	          end as charge_type
	from
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166') and is_cz='否' ) t1
	inner join
	benefit_analyze.ex_contract_2017_itv t2       ----收入
	on t1.serv_id=t2.serv_id
	left join
	benefit_analyze.ex_contract_2017_itvbd t3    ----收入波动
	on t2.serv_id=t3.serv_id 
	) t1
	;
    
    select sum(pre_charge_2018) from benefit_analyze.ex_contract_2018_itv2;
    
 
 drop table if exists benefit_analyze.ex_contract_2018_itv;
	create table benefit_analyze.ex_contract_2018_itv
	as select * from
    benefit_analyze.ex_contract_2018_itv1;
    
    insert into benefit_analyze.ex_contract_2018_itv
    select * from
    benefit_analyze.ex_contract_2018_itv2;
 
 
 
    
 select * from benefit_analyze.ex_contract_2018_itv;
 select count(serv_id),count(distinct serv_id) from benefit_analyze.ex_contract_2018_itv;


---------------------------------------------------------------------------免费一年的收入预测-----------------------------------------------------------------
----------------------------------------------------------------------------首年免费套餐---------------------------------------------------

-------------------------------------------------手动修改收入预测取当月-------------------------------------


select t1.*
from   
(select * from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4' ) t1

;

select msinfo_open_date, count(msinfo_open_date) from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4' group by 1;



	drop table if exists benefit_analyze.snmf_2018_itv;
	create table benefit_analyze.snmf_2018_itv distribute by hash (serv_id) 
	as
	select 
	t1.serv_id
    ,case when 1=1 then '04000002' end as group_id
	,t1.serv_grp_type 
	,t1.area 
	,t1.manage_area
	,case when 1=1 then '特殊群' end as user_type
	,case when 1=1 then 'itv2' end as user_type2
	,case when 1=1 then '1' end as charge_type
	,t1.charge_201712  pre_charge_2018
	,t1.avg_charge_3
	,t1.avg_charge_6
	,t1.avg_charge_12
	,t1.charge_201712 as charge_dy_201712
	,t1.charge_201712 as pre_charge_201801
	,t1.charge_201712 as pre_charge_201802
	,t1.charge_201712 as pre_charge_201803
	,t1.charge_201712 as pre_charge_201804
	,t1.charge_201712 as pre_charge_201805
	,t1.charge_201712 as pre_charge_201806
	,case when t3.serv_id is not null then t1.charge_201712+20
	 else t1.charge_201712 end as pre_charge_201807
	,case when t3.serv_id is not null then t1.charge_201712+20
	           when t4.serv_id is not null then t1.charge_201712+20
	 else t1.charge_201712 end as pre_charge_201808
   ,case when t3.serv_id is not null then t1.charge_201712+20
	          when t4.serv_id is not null then t1.charge_201712+20
	          when t5.serv_id is not null then t1.charge_201712+20
	 else t1.charge_201712 end as pre_charge_201809
  ,case when t3.serv_id is not null then t1.charge_201712+20
	          when t4.serv_id is not null then t1.charge_201712+20
	          when t5.serv_id is not null then t1.charge_201712+20
	          when t6.serv_id is not null then t1.charge_201712+20
	 else t1.charge_201712 end as pre_charge_201810
	   ,case when t3.serv_id is not null then t1.charge_201712+20
	          when t4.serv_id is not null then t1.charge_201712+20
	          when t5.serv_id is not null then t1.charge_201712+20
	          when t6.serv_id is not null then t1.charge_201712+20
	          when  t7.serv_id is not null then t1.charge_201712+20
	 else t1.charge_201712 end as pre_charge_201811
	 	   ,case when t3.serv_id is not null then t1.charge_201712+20
	          when t4.serv_id is not null then t1.charge_201712+20
	          when t5.serv_id is not null then t1.charge_201712+20
	          when t6.serv_id is not null then t1.charge_201712+20
	          when  t7.serv_id is not null then t1.charge_201712+20
	          when  t8.serv_id is not null then t1.charge_201712+20
	 else t1.charge_201712 end as pre_charge_201812
	 
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
    (select * from benefit_analyze.ex_contract_2018_itv ) t1
    inner join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4') t0
    on t1.serv_id=t0.serv_id
    left join
    (select * from benefit_analyze.ex_contract_2017_itv) t2
    on t1.serv_id=t2.serv_id
    left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4' and msinfo_open_date='2017-7-1' ) t3
    on t1.serv_id=t3.serv_id
     left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4' and msinfo_open_date='2017-8-1' ) t4
    on t1.serv_id=t4.serv_id
      left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4' and msinfo_open_date='2017-9-1' ) t5
    on t1.serv_id=t5.serv_id
     left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4' and msinfo_open_date='2017-10-1' ) t6
    on t1.serv_id=t6.serv_id
     left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4' and msinfo_open_date='2017-11-1' ) t7
    on t1.serv_id=t7.serv_id
    left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4' and msinfo_open_date='2017-12-1' ) t8
    on t1.serv_id=t8.serv_id
     left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4' and msinfo_open_date='2018-1-1' ) t9
    on t1.serv_id=t9.serv_id
    ;

	
	
	

select sum(charge_201701),sum(charge_201712),sum(pre_charge_2018), sum(pre_charge_201801) from benefit_analyze.snmf_2018_itv;


select count(serv_id), count(distinct serv_id) from benefit_analyze.snmf_2018_itv;

select count(serv_id), count(distinct serv_id) from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4';




----------------------------------------------------------------------直接免费一年的客户------------------------------------------------------------------------

select count(t1.serv_id)
from   
(select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' ) t1
;

select * from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013';


select msinfo_open_date, count(msinfo_open_date) from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date>='2017-1-1' group by 1; 


    drop table if exists benefit_analyze.cjmf_2018_itv;
	create table benefit_analyze.cjmf_2018_itv distribute by hash (serv_id) 
	as
	select 
	t1.serv_id
	,case when 1=1 then '04000003' end as group_id
	,t1.serv_grp_type 
	,t1.area 
	,t1.manage_area
	,case when 1=1 then '特殊群' end as user_type
	,case when 1=1 then 'itv3' end as user_type2
	,case when 1=1 then '1' end as charge_type 
	,t1.charge_201712 pre_charge_2018
	,t1.avg_charge_3
	,t1.avg_charge_6
	,t1.avg_charge_12
	,t1.charge_201712 as charge_dy_201712
	
    ,t1.charge_201712 as pre_charge_201801
	,t1.charge_201712 as pre_charge_201802
	,t1.charge_201712 as pre_charge_201803
	,t1.charge_201712 as pre_charge_201804
	,t1.charge_201712 as pre_charge_201805
	,t1.charge_201712 as pre_charge_201806
	,case when t3.serv_id is not null then 0
	 else t1.charge_201712 end as pre_charge_201807
	,case when t3.serv_id is not null then 0
	           when t4.serv_id is not null then 0
	 else t1.charge_201712 end as pre_charge_201808
   ,case when t3.serv_id is not null then 0
	          when t4.serv_id is not null then 0
	          when t5.serv_id is not null then 0
	 else t1.charge_201712 end as pre_charge_201809
  ,case when t3.serv_id is not null then 0
	          when t4.serv_id is not null then 0
	          when t5.serv_id is not null then 0
	          when t6.serv_id is not null then 0
	 else t1.charge_201712 end as pre_charge_201810
	   ,case when t3.serv_id is not null then 0
	          when t4.serv_id is not null then 0
	          when t5.serv_id is not null then 0
	          when t6.serv_id is not null then 0
	          when  t7.serv_id is not null then 0
	 else t1.charge_201712 end as pre_charge_201811
	 	   ,case when t3.serv_id is not null then 0
	          when t4.serv_id is not null then 0
	          when t5.serv_id is not null then 0
	          when t6.serv_id is not null then 0
	          when  t7.serv_id is not null then 0
	          when  t8.serv_id is not null then 0
	 else t1.charge_201712 end as pre_charge_201812
	 
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
    (select * from benefit_analyze.ex_contract_2018_itv ) t1
    inner join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date>='2017-1-1') t0
    on t1.serv_id=t0.serv_id
    left join
    (select * from benefit_analyze.ex_contract_2017_itv) t2
    on t1.serv_id=t2.serv_id
    left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date='2017-7-1' ) t3
    on t1.serv_id=t3.serv_id
     left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date='2017-8-1' ) t4
    on t1.serv_id=t4.serv_id
      left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date='2017-9-1' ) t5
    on t1.serv_id=t5.serv_id
     left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date='2017-10-1' ) t6
    on t1.serv_id=t6.serv_id
     left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date='2017-11-1' ) t7
    on t1.serv_id=t7.serv_id
    left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date='2017-12-1' ) t8
    on t1.serv_id=t8.serv_id
     left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date='2018-1-1' ) t9
    on t1.serv_id=t9.serv_id
    ;



select sum(charge_201701),sum(charge_201712),sum(pre_charge_2018), sum(pre_charge_201801) from benefit_analyze.cjmf_2018_itv;




select t1.serv_id, t2.charge_费用, t3.charge_费用
from
(select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4') t1
left join
(select * from benefit_analyze.zyj_qrsr_201712_itv) t2
on t1.serv_id=t2.serv_id_m
left join
(select * from benefit_analyze.zyj_qrsr_201711_itv) t3
on t1.serv_id=t3.serv_id_m
;