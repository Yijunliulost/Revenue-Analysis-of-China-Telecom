-------------------------------------------------分类分析2017年到2018年固话收入预测-----------------------------------------------------------
	
--------------------------------------------------------------国内和国际通话时间--------------------------------------------------------------------------------

	(select * from bcust_data.ccust_guhua_records_201712) b1
	
	---------------------------------------------------------------是否协议支付用户-------------------------------------------------------------
	(select * from benefit_analyze.dcz_tmp_contract_pay_list ) b2
	
	----------------------------------------------------------------2016年12月沉默用户----------------------------------------------------------
    --------------------------------------------------------------固话近3个月通话时间-----------------------------------------------------------


drop table if exists benefit_analyze.guhua_cm_201712;
create table benefit_analyze.guhua_cm_201712 (
acc_nbr varchar(100)
,tot_thsc varchar(100)
)distribute by hash (acc_nbr)
;



insert into benefit_analyze.guhua_cm_201712
select t1.acc_nbr,t1.tot_thsc from
(select
             acc_nbr,bd_all_thsc,gn_thsc,gat_thsc,gj_thsc
            ,(bd_all_thsc+gn_thsc+gj_thsc+gat_thsc) as tot_thsc
from bcust_data.ccust_guhua_records_201712) t1
inner join
(select 
            acc_nbr,bd_all_thsc,gn_thsc,gat_thsc,gj_thsc
            ,(bd_all_thsc+gn_thsc+gj_thsc+gat_thsc) as tot_thsc
from bcust_data.ccust_guhua_records_201711) t2
on t1.acc_nbr=t2.acc_nbr
inner join
(select 
            acc_nbr,bd_all_thsc,gn_thsc,gat_thsc,gj_thsc
            ,(bd_all_thsc+gn_thsc+gj_thsc+gat_thsc) as tot_thsc
from bcust_data.ccust_guhua_records_201710) t3
on t1.acc_nbr=t3.acc_nbr
where (t1.tot_thsc=0 or t1.tot_thsc is null) and (t2.tot_thsc=0 or t2.tot_thsc is null ) and (t3.tot_thsc=0 or  t3.tot_thsc is null) 
;




	
	
drop table if exists benefit_analyze.gh_mix_201712;
create table benefit_analyze.gh_mix_201712
(
     serv_id                  					varchar(2000)
	
)  distribute by hash (serv_id);
	
	
	
	
	insert into
	benefit_analyze.gh_mix_201712
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.dcz_month_4prod_201712 
	where prod_id in ('1','2','3','4','6','13')) t1
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
	benefit_analyze.gh_mix_201712
	select distinct t1.serv_id
    from
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
	benefit_analyze.gh_mix_201712
	select distinct t1.serv_id
    from
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
	) t1
	inner join
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
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	
	
	
	
	----------------------------------------------------固话协议缴费用户2017年收入---------------------------------------------------------------------
	
	drop table if exists benefit_analyze.contract_pay_charge_2017_gh;
	create table benefit_analyze.contract_pay_charge_2017_gh distribute by hash (serv_id) 
	as
	select t1.serv_id ,t2.charge_201712 ,t3.charge_201711 ,t4.charge_201710
	            ,t5.charge_201709 ,t6.charge_201708 ,t7.charge_201707 ,t8.charge_201706
	            ,t9.charge_201705 ,t10.charge_201704 ,t11.charge_201703 ,t12.charge_201702
	            ,t13.charge_201701
	from (select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) t1
	inner join
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1','2','3','4','6','13')) t0
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

	select * from benefit_analyze.contract_pay_charge_2017_gh;

	select count(serv_id),count(distinct serv_id) from benefit_analyze.contract_pay_charge_2017_gh;
	

   
   

	-----协议缴费用户2017年收入波动
	drop table if exists benefit_analyze.contract_pay_charge_2017_ghbd;
	create table benefit_analyze.contract_pay_charge_2017_ghbd distribute by hash (serv_id) as
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
	from benefit_analyze.contract_pay_charge_2017_gh t1
	) t1
	;
	select * from benefit_analyze.contract_pay_charge_2017_gh_bd;
	select count(serv_id),count(distinct serv_id) from benefit_analyze.contract_pay_charge_2017_gh_bd;




	------------------------------------------------------协议缴费用户预测----------------------------------------------------------------
	
	drop table if exists benefit_analyze.contract_pay_charge_2018_gh;
	create table benefit_analyze.contract_pay_charge_2018_gh distribute by hash (serv_id) 
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
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	benefit_analyze.contract_pay_charge_2017_gh t2       ----收入
	on t1.serv_id=t2.serv_id
	left join
	benefit_analyze.contract_pay_charge_2017_gh_bd t3    ----收入波动
	on t2.serv_id=t3.serv_id 
	) t1;
	
	
	
	
	
select * from 	benefit_analyze.contract_pay_charge_2018_gh;

benefit_analyze.contract_pay_charge_2017_gh



	drop table if exists benefit_analyze.contract_2018_gh;
	create table benefit_analyze.contract_2018_gh distribute by hash (serv_id) 
	as
	select 
	t1.serv_id
    ,case when 1=1 then '03000001' end as group_id 
	,t1.serv_grp_type 
	,t1.area 
	,t1.manage_area
	,case when 1=1 then '特殊群' end as user_type
	,case when 1=1 then '固话1' end as user_type2
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
    (select * from benefit_analyze.contract_pay_charge_2018_gh) t1
    left join
    (select * from benefit_analyze.contract_pay_charge_2017_gh) t2
    on t1.serv_id=t2.serv_id






select * from  benefit_analyze.contract_2018_gh;




----------------------------------------------------固话排除协议用户2017年收入---------------------------------------------------------------------
	
	drop table if exists benefit_analyze.ex_contract_2017_gh;
	create table benefit_analyze.ex_contract_2017_gh distribute by hash (serv_id) 
	as
	select t1.serv_id ,coalesce(t2.charge_201712,0) charge_201712,t3.charge_201711 ,t4.charge_201710
	            ,t5.charge_201709 ,t6.charge_201708 ,t7.charge_201707 ,t8.charge_201706
	            ,t9.charge_201705 ,t10.charge_201704 ,t11.charge_201703 ,t12.charge_201702
	            ,t13.charge_201701
    from
	(select serv_id from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1','2','3','4','6','13') ) t1
	left join
	(select serv_id from (select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) t) t0
	on t1.serv_id=t0.serv_id
	left join 
	(select serv_id_m,charge_费用 as charge_201712
	from benefit_analyze.zyj_qrsr_201712_gh) t2
	on t1.serv_id=t2.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201711
	from benefit_analyze.zyj_qrsr_201711_gh) t3
	on t1.serv_id=t3.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201710
	from benefit_analyze.zyj_qrsr_201710_gh) t4
	on t1.serv_id=t4.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201709
	from benefit_analyze.zyj_qrsr_201709_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201708
	from benefit_analyze.zyj_qrsr_201708_gh) t6
	on t1.serv_id=t6.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201707
	from benefit_analyze.zyj_qrsr_201707_gh) t7
	on t1.serv_id=t7.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201706
	from benefit_analyze.zyj_qrsr_201706_gh) t8
	on t1.serv_id=t8.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201705
	from benefit_analyze.zyj_qrsr_201705_gh) t9
	on t1.serv_id=t9.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201704
	from benefit_analyze.zyj_qrsr_201704_gh) t10
	on t1.serv_id=t10.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201703
	from benefit_analyze.zyj_qrsr_201703_gh) t11
	on t1.serv_id=t11.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201702
	from benefit_analyze.zyj_qrsr_201702_gh) t12
	on t1.serv_id=t12.serv_id_m
	left join 
	(select serv_id_m,charge_费用 as charge_201701
	from benefit_analyze.zyj_qrsr_201701_gh) t13
	on t1.serv_id=t13.serv_id_m
	where t0.serv_id is null
	;

	select * from benefit_analyze.ex_contract_2017_gh;

	select count(serv_id),count(distinct serv_id) from benefit_analyze.ex_contract_2017_gh;
	


   

   
   
   
   
   

	-----协议缴费用户2017年收入波动
	drop table if exists benefit_analyze.ex_contract_2017_ghbd;
	create table benefit_analyze.ex_contract_2017_ghbd distribute by hash (serv_id) as
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
	from benefit_analyze.ex_contract_2017_gh t1
	) t1
	;
	
	
	select * from benefit_analyze.ex_contract_2017_ghbd;
	select count(serv_id),count(distinct serv_id) from benefit_analyze.ex_contract_2017_ghbd;




	------------------------------------------------------固话用户/排除协议缴费用户预测(出账为是)----------------------------------------------------------------
	
	drop table if exists benefit_analyze.ex_contract_2018_gh1;
	create table benefit_analyze.ex_contract_2018_gh1 distribute by hash (serv_id) 
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
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1','2','3','4','6','13') and is_cz='是') t1
	inner join
	benefit_analyze.ex_contract_2017_gh t2       ----收入
	on t1.serv_id=t2.serv_id
	left join
	benefit_analyze.ex_contract_2017_ghbd t3    ----收入波动
	on t2.serv_id=t3.serv_id 
	) t1
	;
	
   select * from 	benefit_analyze.ex_contract_2018_gh;






	------------------------------------------------------固话用户/排除协议缴费用户预测(出账为否)----------------------------------------------------------------
	
	drop table if exists benefit_analyze.ex_contract_2018_gh2;
	create table benefit_analyze.ex_contract_2018_gh2 distribute by hash (serv_id) 
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
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1','2','3','4','6','13') and is_cz='否') t1
	inner join
	benefit_analyze.ex_contract_2017_gh t2       ----收入
	on t1.serv_id=t2.serv_id
	left join
	benefit_analyze.ex_contract_2017_ghbd t3    ----收入波动
	on t2.serv_id=t3.serv_id 
	) t1
	;
	
	
	select sum(pre_charge_2018) from benefit_analyze.ex_contract_2018_gh2;
	
	
	drop table if exists benefit_analyze.ex_contract_2018_gh;
	create table benefit_analyze.ex_contract_2018_gh
	as select * from
    benefit_analyze.ex_contract_2018_gh1;
    
    insert into benefit_analyze.ex_contract_2018_gh
    select * from
    benefit_analyze.ex_contract_2018_gh2;


  select count(serv_id), count(distinct serv_id) from benefit_analyze.ex_contract_2018_gh;





    select * from fsbd.all_product_pre_charge;




---------------------------------16年12月的分类(沉默用户/排除协议用户)--------------------------------------

select * from fsbd.all_product_pre_charge;


	drop table if exists benefit_analyze.cm_charge_2018_gh;
	create table benefit_analyze.cm_charge_2018_gh distribute by hash (serv_id) 
	as
	select 
    t1.serv_id
   ,case when t0.prod_id='3' then  '03000002'
           when t0.prod_id='1' then   '03000003'
           else '03000004' end as group_id 
   ,t1.serv_grp_type 
    ,t1.area 
   ,t1.manage_area
    ,case when t0.prod_id='3' then  '特殊群'
	           when t0.prod_id='1' then   '特殊群'
	           else '特殊群' end as user_type
   ,case when t0.prod_id='3' then  '固话2'
	           when t0.prod_id='1' then   '固话3'
	           else '固话4' end as user_type2
   ,t1.charge_type
   ,t1.pre_charge_2018
   ,t1.avg_charge_3
   ,t1.avg_charge_6
   ,t1.avg_charge_12
   ,t1.charge_201712 as charge_dy_201712
   ,case when t0.prod_id='3' then  t1.pre_charge_2018*1
	           when t0.prod_id='1' then t1.pre_charge_2018*1
	           else t1.pre_charge_2018*1
   end as  pre_charge_201801
   ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^2
	           when t0.prod_id='1' then t1.pre_charge_2018*1^2
	           else t1.pre_charge_2018*1
   end as  pre_charge_201802
   ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^3
	           when t0.prod_id='1' then t1.pre_charge_2018*1^3
	           else t1.pre_charge_2018*1
   end as  pre_charge_201803
      ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^4
	           when t0.prod_id='1' then t1.pre_charge_2018*1^4
	           else t1.pre_charge_2018*1
    end as  pre_charge_201804
       ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^5
	           when t0.prod_id='1' then t1.pre_charge_2018*1^5
	           else t1.pre_charge_2018*1
   end as  pre_charge_201805
          ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^6
	           when t0.prod_id='1' then t1.pre_charge_2018*1^6
	           else t1.pre_charge_2018*1
   end as  pre_charge_201806
          ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^7
	           when t0.prod_id='1' then t1.pre_charge_2018*1^7
	           else t1.pre_charge_2018*1
   end as  pre_charge_201807
          ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^8
	           when t0.prod_id='1' then t1.pre_charge_2018*1^8
	           else t1.pre_charge_2018*1
   end as  pre_charge_201808
          ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^9
	           when t0.prod_id='1' then t1.pre_charge_2018*1^9
	           else t1.pre_charge_2018*0.8848755
   end as  pre_charge_201809
	     ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^10
	           when t0.prod_id='1' then t1.pre_charge_2018*1^10
	           else t1.pre_charge_2018*0.7500575
   end as  pre_charge_201810    
   	    , case when t0.prod_id='3' then  t1.pre_charge_2018*1^11
	           when t0.prod_id='1' then t1.pre_charge_2018*1^11
	           else t1.pre_charge_2018*0.747779
   end as  pre_charge_201811
       ,case when t0.prod_id='3' then  t1.pre_charge_2018*1^12
	           when t0.prod_id='1' then t1.pre_charge_2018*1^12
	           else t1.pre_charge_2018*0.769661
   end as  pre_charge_201812
        ,t3.charge_201701
        ,t3.charge_201702
        ,t3.charge_201703
        ,t3.charge_201704
        ,t3.charge_201705
        ,t3.charge_201706
        ,t3.charge_201707
        ,t3.charge_201708
        ,t3.charge_201709
        ,t3.charge_201710
        ,t3.charge_201711
        ,t3.charge_201712
        
	from
	(select *
	from benefit_analyze.ex_contract_2018_gh
	) t1
    inner join
    (select * from benefit_analyze.dcz_month_4prod_201712
    ) t0
    on t1.serv_id=t0.serv_id
    left join
    (select * from benefit_analyze.ex_contract_2017_gh
    ) t3
    on t1.serv_id=t3.serv_id
	
    ---------------------------------------------是否为沉默用户----------------------------------------------------
    inner join
    (select * from benefit_analyze.guhua_cm_201712) b4
    on t0.acc_nbr=b4.acc_nbr
    ;
    
    

 

 
 
 
    select * from benefit_analyze.cm_charge_2018_gh;
	



select * from fsbd.all_product_pre_charge;


select * from benefit_analyze.contract_pay_charge_2018_gh;

select * from benefit_analyze.ex_contract_pay_charge_2018_gh;