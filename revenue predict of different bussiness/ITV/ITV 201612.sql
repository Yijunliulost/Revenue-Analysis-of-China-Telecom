-------------------------------------加装ITV不存在月消费大于5万的用户-------------------------------------------
	
	
	-----------------------------------------分类分析2016年到2017年ITV流失率-----------------------------------------------------------
	
	
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
	(select * from benefit_analyze.dcz_itv_prod_offer_201612 
	where limit_date>='2018-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1

	
	
	----------------------------------套餐在一年内的用户-------------------------------------
	
	drop table if exists benefit_analyze.itv_inyear_201612;
	create table benefit_analyze.itv_inyear_201612 distribute by hash (serv_id) 
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
	(select * from benefit_analyze.dcz_itv_prod_offer_201612 
	where limit_date<'2018-1-1' and limit_date>='2017-1-1') t1
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
	(select * from benefit_analyze.dcz_itv_prod_offer_201612 
	where limit_date>='2018-1-1') t1
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
	
     select * from fsdw.dcz_itv_active_201612;
	
	
	


	
	
drop table if exists benefit_analyze.itv_mix_201612;
create table benefit_analyze.itv_mix_201612
(
     serv_id                  					varchar(2000)
	
)  distribute by hash (serv_id);
	
	
	
	
	insert into
	benefit_analyze.itv_mix_201612
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 
	where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('3204','3205')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	
	

	
		insert into
	benefit_analyze.itv_mix_201612
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('47','48','51','52','56','57','950','999','1022','1023',
    '1100','2340','3881','500001200','500001741','500002660')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	

	
	
   	insert into
	benefit_analyze.itv_mix_201612
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
  	
	



	
	
	


		
	---------------------------------16年12月的分类(不存在活跃记录)--------------------------------------

	select 
	/*case when b5.serv_id is not null then '为协议支付用户'
	             else '不为协议支付用户'
	             end as is_xieyi_pay
	 case when b1.serv_id is not null then '包年下一年未到期'
	          when b2.serv_id is not null then '包年下一年到期'
	          else '其它用户'
	          end as is_baonian*/
	 case when t1.prod_id in ('3816','500000166') then '广东IPTV预付费'
	           when t1.prod_id in ('1004','500000165') then '广东IPTV后付费'
	           end as product 
	/*,case when t1.serv_grp_type='01' then '政企'
	           when t1.serv_grp_type='02' then '公众'
	           end as serv_grp_type
	 ,case when b3.serv_id is not null then '是'
	            else '否'
	            end as is_mix*/
	 ,case when b6.acc_nbr is not null and b6.login_times=0 then '1'
	             when b6.acc_nbr is not null and b6.login_times<=5 and b6.login_times>0 then '2'
	             when b6.acc_nbr is not null and b6.login_times<=10 and b6.login_times>5 then '3'
	             when b6.acc_nbr is not null and b6.login_times<=30 and b6.login_times>10 then '4'
	             when b6.acc_nbr is not null and b6.login_times>30  then '5'
	             when b6.acc_nbr is null then '不存在活跃记录'
	             end as huoyue_type
	,count( t4.serv_id_m)  as client_201612
	,sum( t4.charge_费用) as charge_201612
	,count( t5.serv_id_m)  as client_201712
	,sum( t5.charge_费用) as charge_201712
	,cast(count( t5.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun
	,case when sum( t5.charge_费用) /sum( t4.charge_费用) >=0.95 then '稳定群'
	           else '非稳定群'
	           end as  user_type
	from
	(select *
	from benefit_analyze.cust_infor_201612
	where prod_id in ('1004','3816','500000165','500000166') and state<>'box'
	) t1
	
    -----------------------------------------选出有收入的用户--------------------------------------------
	inner join
	(select * from  benefit_analyze.zyj_qrsr_201612_itv ) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------一年以上-------------------------------
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
	(select * from benefit_analyze.dcz_itv_prod_offer_201612 
	where limit_date>='2018-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	-----------------------------------一年以内----------------------------------------
	left join
	(
	select * from benefit_analyze.itv_inyear_201612
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------是否存在融合业务---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201612) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV活跃度考虑-------------------------------------------------
	left join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201612) b6
	on t1.acc_nbr=b6.acc_nbr
	-----------------------------------------以下部分为每个月的流失情况--------------------------
	left join
	(select serv_id_m,charge_费用
	from benefit_analyze.zyj_qrsr_201612_itv
	) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m,charge_费用
	from benefit_analyze.zyj_qrsr_201712_itv
	) t5
	on t1.serv_id=t5.serv_id_m
	
	where b6.acc_nbr is null
	group by 1,2
	order by 1,2
	;
	
	

	
	
	
	
		---------------------------------15年12月的分类(包年用户/存在活跃记录)--------------------------------------

	select 
/*	case when b5.serv_id is not null then '为协议支付用户'
	             else '不为协议支付用户'
	             end as is_xieyi_pay*/
	 case when b1.serv_id is not null then '包年用户'
	          else '其它用户'
	          end as is_baonian
/*	,case when t1.prod_id in ('3816','500000166') then '广东IPTV预付费'
	           when t1.prod_id in ('1004','500000165') then '广东IPTV后付费'
	           end as product */
/*	,case when t1.serv_grp_type='01' then '政企'
	           when t1.serv_grp_type='02' then '公众'
	           end as serv_grp_type*/
/*	 ,case when b3.serv_id is not null then '是'
	            else '否'
	            end as is_mix*/
/*	  ,case when b6.acc_nbr is not null and b6.login_times=0 then '1'
	             when b6.acc_nbr is not null and b6.login_times<=5 and b6.login_times>0 then '2'
	             when b6.acc_nbr is not null and b6.login_times<=10 and b6.login_times>5 then '3'
	             when b6.acc_nbr is not null and b6.login_times<=30 and b6.login_times>10 then '4'
	             when b6.acc_nbr is not null and b6.login_times>30  then '5'
	             when b6.acc_nbr is null then '不存在活跃记录'
	             end as huoyue_type*/
	,count( t4.serv_id_m)  as client_201612
	,sum( t4.charge_费用) as charge_201612
	,count( t5.serv_id_m)  as client_201712
	,sum( t5.charge_费用) as charge_201712
	,cast(count( t5.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun
	,case when sum( t5.charge_费用) /sum( t4.charge_费用) >=0.95 then '稳定群'
	           else '非稳定群'
	           end as  user_type
	from
	(select *
	from benefit_analyze.cust_infor_201612
	where prod_id in ('1004','3816','500000165','500000166') and state<>'box'
	) t1
	
    -----------------------------------------选出有收入的用户--------------------------------------------
	inner join
	(select * from  benefit_analyze.zyj_qrsr_201612_itv ) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------一年以上-------------------------------
	inner join
	(select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201612 
	where limit_date>='2018-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	-----------------------------------一年以内----------------------------------------
	left join
	(
	select * from benefit_analyze.itv_inyear_201612
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------是否存在融合业务---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201612) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV活跃度考虑-------------------------------------------------
	inner join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201612) b6
	on t1.acc_nbr=b6.acc_nbr
	-----------------------------------------以下部分为每个月的流失情况--------------------------
	left join
	(select serv_id_m,charge_费用
	from benefit_analyze.zyj_qrsr_201612_itv
	) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m,charge_费用
	from benefit_analyze.zyj_qrsr_201712_itv
	) t5
	on t1.serv_id=t5.serv_id_m
	

	group by 1
	order by 1
	;
	
	
	
	
	
	
	
	
	
		---------------------------------15年12月的分类(包年一年到期用户/存在活跃记录)--------------------------------------

	select 
/*	case when b5.serv_id is not null then '为协议支付用户'
	             else '不为协议支付用户'
	             end as is_xieyi_pay*/
	 case when b2.serv_id is not null then '包年到期用户'
	          else '其它用户'
	          end as is_baonian
	,case when t1.prod_id in ('3816','500000166') then '广东IPTV预付费'
	           when t1.prod_id in ('1004','500000165') then '广东IPTV后付费'
	           end as product 
/*	,case when t1.serv_grp_type='01' then '政企'
	           when t1.serv_grp_type='02' then '公众'
	           end as serv_grp_type*/
	 ,case when b3.serv_id is not null then '是'
	            else '否'
	            end as is_mix
	  ,case when b6.acc_nbr is not null and b6.login_times<=5 and b6.login_times>=0 then '1'
	             when b6.acc_nbr is not null and b6.login_times<=30 and b6.login_times>5 then '2'
	             when b6.acc_nbr is not null and b6.login_times>30  then '3'
	             when b6.acc_nbr is null then '不存在活跃记录'
	             end as huoyue_type
	,count( t4.serv_id_m)  as client_201612
	,sum( t4.charge_费用) as charge_201612
	,count( t5.serv_id_m)  as client_201712
	,sum( t5.charge_费用) as charge_201712
	,cast(count( t5.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun
	,case when sum( t5.charge_费用) /sum( t4.charge_费用) >=0.95 then '稳定群'
	           else '非稳定群'
	           end as  user_type
	from
	(select *
	from benefit_analyze.cust_infor_201612
	where prod_id in ('1004','3816','500000165','500000166') and state<>'box'
	) t1
	
    -----------------------------------------选出有收入的用户--------------------------------------------
	inner join
	(select * from  benefit_analyze.zyj_qrsr_201612_itv ) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------一年以上-------------------------------
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
	(select * from benefit_analyze.dcz_itv_prod_offer_201612 
	where limit_date>='2018-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	-----------------------------------一年以内----------------------------------------
	inner join
	(
	select * from benefit_analyze.itv_inyear_201612
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------是否存在融合业务---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201612) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV活跃度考虑-------------------------------------------------
	inner join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201612) b6
	on t1.acc_nbr=b6.acc_nbr
	-----------------------------------------以下部分为每个月的流失情况--------------------------
	left join
	(select serv_id_m,charge_费用
	from benefit_analyze.zyj_qrsr_201612_itv
	) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m,charge_费用
	from benefit_analyze.zyj_qrsr_201712_itv
	) t5
	on t1.serv_id=t5.serv_id_m
	

/*	where b6.acc_nbr is null*/
	group by 1,2,3,4
	order by 1,2,3,4
	;
	
	
	
	
	
	
	
	
			---------------------------------15年12月的分类(其它用户/存在活跃记录)--------------------------------------

	select 
/*	case when b5.serv_id is not null then '为协议支付用户'
	             else '不为协议支付用户'
	             end as is_xieyi_pay*/
	 case when b1.serv_id is not null then '包年用户'
	 			when b2.serv_id is not null then '包年到期用户'
	          else '其它用户'
	          end as is_baonian
	,case when t1.prod_id in ('3816','500000166') then '广东IPTV预付费'
	           when t1.prod_id in ('1004','500000165') then '广东IPTV后付费'
	           end as product 
/*	,case when t1.serv_grp_type='01' then '政企'
	           when t1.serv_grp_type='02' then '公众'
	           end as serv_grp_type*/
	 ,case when b3.serv_id is not null then '是'
	            else '否'
	            end as is_mix
	  ,case when b6.acc_nbr is not null and b6.login_times<=5 and b6.login_times>=0 then '1'
	             when b6.acc_nbr is not null and b6.login_times<=30 and b6.login_times>5 then '2'
	             when b6.acc_nbr is not null and b6.login_times>30  then '3'
	             when b6.acc_nbr is null then '不存在活跃记录'
	             end as huoyue_type
	,count( t4.serv_id_m)  as client_201612
	,sum( t4.charge_费用) as charge_201612
	,count( t5.serv_id_m)  as client_201712
	,sum( t5.charge_费用) as charge_201712
	,cast(count( t5.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun
	,case when sum( t5.charge_费用) /sum( t4.charge_费用) >=0.95 then '稳定群'
	           else '非稳定群'
	           end as  user_type
	from
	(select *
	from benefit_analyze.cust_infor_201612
	where prod_id in ('1004','3816','500000165','500000166') and state<>'box'
	) t1
	
    -----------------------------------------选出有收入的用户--------------------------------------------
	inner join
	(select * from  benefit_analyze.zyj_qrsr_201612_itv ) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------一年以上-------------------------------
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
	(select * from benefit_analyze.dcz_itv_prod_offer_201612 
	where limit_date>='2018-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	-----------------------------------一年以内----------------------------------------
	left join
	(
	select * from benefit_analyze.itv_inyear_201612
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------是否存在融合业务---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201612) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV活跃度考虑-------------------------------------------------
	inner join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201612) b6
	on t1.acc_nbr=b6.acc_nbr
	-----------------------------------------以下部分为每个月的流失情况--------------------------
	left join
	(select serv_id_m,charge_费用
	from benefit_analyze.zyj_qrsr_201612_itv
	) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m,charge_费用
	from benefit_analyze.zyj_qrsr_201712_itv
	) t5
	on t1.serv_id=t5.serv_id_m
	
	where b1.serv_id is null and b2.serv_id is null
	group by 1,2,3,4
	order by 1,2,3,4
	;