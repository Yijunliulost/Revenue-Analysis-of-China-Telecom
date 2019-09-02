
	  -----------------------------------验证异常用户的存在--------------------------------------
	  select 
	  t1.serv_id_m
	  ,t1.charge_费用 as charge_201512
	  ,t2.charge_费用 as charge_201601
	  ,t3.charge_费用 as charge_201602
	  
	  from
	  (select serv_id_m ,charge_费用
	  from benefit_analyze.zyj_qrsr_201512_gh
	  where charge_费用>50000) t1
	  left join
	  (select serv_id_m ,charge_费用
	  from benefit_analyze.zyj_qrsr_201601_gh) t2
	  on t1.serv_id_m=t2.serv_id_m
	  left join
	  (select serv_id_m ,charge_费用 
	  from benefit_analyze.zyj_qrsr_201602_gh) t3
	  on t1.serv_id_m=t3.serv_id_m;
	  
	  
	  
	  select 
	  t1.serv_id_m
	  ,t1.charge_费用 as charge_201612
	  ,t2.charge_费用 as charge_201611
	  ,t3.charge_费用 as charge_201610
	  
	  from
	  (select serv_id_m ,charge_费用
	  from benefit_analyze.zyj_qrsr_201612_gh
	  where charge_费用>50000) t1
	  left join
	  (select serv_id_m ,charge_费用
	  from benefit_analyze.zyj_qrsr_201611_gh) t2
	  on t1.serv_id_m=t2.serv_id_m
	  left join
	  (select serv_id_m ,charge_费用 
	  from benefit_analyze.zyj_qrsr_201610_gh) t3
	  on t1.serv_id_m=t3.serv_id_m;
	  
	  

	  
	  


---------------结论: 不存在异常用户,charge_公允前-charge_公允前的一次性费用--------------------------------------


--------------------------------------------------分类分析2015年到2016年固话流失率-----------------------------------------------------------
	
--------------------------------------------------------------国内和国际通话时间--------------------------------------------------------------------------------

	(select * from bcust_data.ccust_guhua_records_201512) b1
	
	---------------------------------------------------------------是否协议支付用户-------------------------------------------------------------
	(select * from benefit_analyze.dcz_tmp_contract_pay_list ) b2
	
	----------------------------------------------------------------2015年12月沉默用户----------------------------------------------------------
    --------------------------------------------------------------固话近3个月通话时间-----------------------------------------------------------


drop table if exists benefit_analyze.guhua_cm_201512;
create table benefit_analyze.guhua_cm_201512 (
acc_nbr varchar(100)
,tot_thsc varchar(100)
)distribute by hash (acc_nbr)
;



insert into benefit_analyze.guhua_cm_201512
select t1.acc_nbr,t1.tot_thsc from
(select
            acc_nbr,bd_th_sc,th_sc,gat_th_sc,gj_th_sc
            ,(bd_th_sc+th_sc+gj_th_sc+gat_th_sc) as tot_thsc
from bcust_data.ccust_guhua_records_201512 ) t1
inner join
(select 
            acc_nbr,bd_all_thsc,gn_thsc,gat_thsc,gj_thsc
            ,(bd_all_thsc+gn_thsc+gj_thsc+gat_thsc) as tot_thsc
from bcust_data.ccust_guhua_records_201511) t2
on t1.acc_nbr=t2.acc_nbr
inner join
(select 
            acc_nbr,bd_all_thsc,gn_thsc,gat_thsc,gj_thsc
            ,(bd_all_thsc+gn_thsc+gj_thsc+gat_thsc) as tot_thsc
from bcust_data.ccust_guhua_records_201510) t3
on t1.acc_nbr=t3.acc_nbr
where (t1.tot_thsc=0 or t1.tot_thsc is null) and (t2.tot_thsc=0 or t2.tot_thsc is null ) and (t3.tot_thsc=0 or  t3.tot_thsc is null) 
;


	

	
	
drop table if exists benefit_analyze.gh_mix_201512;
create table benefit_analyze.gh_mix_201512
(
     serv_id                  					varchar(2000)
	
)  distribute by hash (serv_id);
	
	
	
	
	insert into
	benefit_analyze.gh_mix_201512
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 
	where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('3204','3205')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	
	

	
		insert into
	benefit_analyze.gh_mix_201512
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('47','48','51','52','56','57','950','999','1022','1023',
    '1100','2340','3881','500001200','500001741','500002660')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	

	
	
   	insert into
	benefit_analyze.gh_mix_201512
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------配置出所有资费套餐-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_本地资费套餐配置表) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
  	
	

	---------------------------------15年12月的分类(沉默用户)--------------------------------------

	select 
/*	case when b2.serv_id is not null then '为协议支付用户'
	             else '不为协议支付用户'
	             end as is_xieyi_pay*/
	 case when b4.acc_nbr is not null then '是'
	            else '否'
	            end as is_cm
	,case when t1.prod_id=13 then '固网预付费'
	           when t1.prod_id=1 then '普话后付费'
	           when t1.prod_id=3 then 'CENTREX后付费'
	           else  '其它后付费'
	           end as product
/*	,case when t1.serv_grp_type='01' then '政企'
	           when t1.serv_grp_type='02' then '公众'
	           end as serv_grp_type
	 ,case when b1.serv_id is not null then '是'
	            else '否'
	            end as is_mix*/
	  ,case when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<50 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<500 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=50 then '3'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<1000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=500 then '4'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<2000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=1000 then '5'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<4000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=2000 then '6'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=4000 then'7'
	             when b3.acc_nbr is null then '不存在语音记录'
	             end as tonghua
	,count( t4.serv_id_m)  as client_201512
	,sum( t4.charge_费用) as charge_201512
	,count( t16.serv_id_m)  as client_201612
	,sum( t16.charge_费用) as charge_201612
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_费用) /sum( t4.charge_费用) >=0.95 then '稳定群'
	           else '非稳定群'
	           end as  user_type           
	from
	(select *
	from benefit_analyze.cust_infor_201512
	where prod_id in ('1','2','3','4','6','13') and state<>'box'
	) t1
	-----------------------------------------选出有收入的用户--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201512_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------是否存在融合业务---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201512) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------固话用户国内和国际通话时间考虑------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201512) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------是否为沉默用户----------------------------------------------------
    inner join
    (select * from benefit_analyze.guhua_cm_201512) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------以下部分为每个月的流失情况--------------------------
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201512_gh) t4
	on t1.serv_id=t4.serv_id_m
    left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201601_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201602_gh) t6
	on t1.serv_id=t6.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201603_gh) t7
	on t1.serv_id=t7.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201604_gh) t8
	on t1.serv_id=t8.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201605_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201606_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201607_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201608_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201609_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201610_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201611_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201612_gh) t16
	on t1.serv_id=t16.serv_id_m
	
/*	where b4.acc_nbr is null*/
	group by 1,2,3
	order by 1,2,3
	;

	

	


		
	---------------------------------15年12月的分类(有收入)(prod_id为1的用户)--------------------------------------

	select 
/*	case when b2.serv_id is not null then '为协议支付用户'
	             else '不为协议支付用户'
	             end as is_xieyi_pay*/
	 case when b4.acc_nbr is not null then '是'
	            else '否'
	            end as is_cm
	,case when t1.prod_id=13 then '固网预付费'
	           when t1.prod_id=1 then '普话后付费'
	           when t1.prod_id=3 then 'CENTREX后付费'
	           else  '其它后付费'
	           end as product
/*	,case when t1.serv_grp_type='01' then '政企'
	           when t1.serv_grp_type='02' then '公众'
	           end as serv_grp_type*/
	 ,case when b1.serv_id is not null then '是'
	            else '否'
	            end as is_mix
	  ,case when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<500 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<1000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=500 then '3'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<2000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=1000 then '4'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<4000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=2000 then '5'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=4000 then'6'
	             when b3.acc_nbr is null then '不存在语音记录'
	             end as tonghua
	,count( t4.serv_id_m)  as client_201512
	,sum( t4.charge_费用) as charge_201512
	,count( t16.serv_id_m)  as client_201612
	,sum( t16.charge_费用) as charge_201612
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_费用) /sum( t4.charge_费用) >=0.95 then '稳定群'
	           else '非稳定群'
	           end as  user_type          
	from
	(select *
	from benefit_analyze.cust_infor_201512
	where prod_id in ('1') and state<>'box'
	) t1
	-----------------------------------------选出有收入的用户--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201512_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------是否存在融合业务---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201512) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------固话用户国内和国际通话时间考虑------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201512) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------是否为沉默用户----------------------------------------------------
    left join
    (select * from benefit_analyze.guhua_cm_201512) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------以下部分为每个月的流失情况--------------------------
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201512_gh) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201601_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201602_gh) t6
	on t1.serv_id=t6.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201603_gh) t7
	on t1.serv_id=t7.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201604_gh) t8
	on t1.serv_id=t8.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201605_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201606_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201607_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201608_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201609_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201610_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201611_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201612_gh) t16
	on t1.serv_id=t16.serv_id_m
	
	where b4.acc_nbr is null
	group by 1,2,3,4
	order by 1,2,3,4
	;
	  

	  
	  	---------------------------------15年12月的分类(有收入)(prod_id为3的用户)--------------------------------------

	select 
/*	case when b2.serv_id is not null then '为协议支付用户'
	             else '不为协议支付用户'
	             end as is_xieyi_pay*/
	 case when b4.acc_nbr is not null then '是'
	            else '否'
	            end as is_cm
	,case when t1.prod_id=13 then '固网预付费'
	           when t1.prod_id=1 then '普话后付费'
	           when t1.prod_id=3 then 'CENTREX后付费'
	           else  '其它后付费'
	           end as product
/*	,case when t1.serv_grp_type='01' then '政企'
	           when t1.serv_grp_type='02' then '公众'
	           end as serv_grp_type*/
	 ,case when b1.serv_id is not null then '是'
	            else '否'
	            end as is_mix
	  ,case when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<1000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<2000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=1000 then '3'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<4000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=2000 then '4'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=4000 then'5'
	             when b3.acc_nbr is null then '不存在语音记录'
	             end as tonghua
	,count( t4.serv_id_m)  as client_201512
	,sum( t4.charge_费用) as charge_201512
	,count( t16.serv_id_m)  as client_201612
	,sum( t16.charge_费用) as charge_201612
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_费用) /sum( t4.charge_费用) >=0.95 then '稳定群'
	           else '非稳定群'
	           end as  user_type      
	from
	(select *
	from benefit_analyze.cust_infor_201512
	where prod_id in ('3') and state<>'box'
	) t1
	-----------------------------------------选出有收入的用户--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201512_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------是否存在融合业务---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201512) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------固话用户国内和国际通话时间考虑------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201512) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------是否为沉默用户----------------------------------------------------
    left join
    (select * from benefit_analyze.guhua_cm_201512) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------以下部分为每个月的流失情况--------------------------
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201512_gh) t4
	on t1.serv_id=t4.serv_id_m
  left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201601_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201602_gh) t6
	on t1.serv_id=t6.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201603_gh) t7
	on t1.serv_id=t7.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201604_gh) t8
	on t1.serv_id=t8.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201605_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201606_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201607_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201608_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201609_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201610_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201611_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201612_gh) t16
	on t1.serv_id=t16.serv_id_m
	where b4.acc_nbr is null
	group by 1,2,3,4
	order by 1,2,3,4
	;
	  
	  
	  
	  
	  
	  	  	---------------------------------15年12月的分类(有收入)(prod_id为13的用户)--------------------------------------

	select 
/*	case when b2.serv_id is not null then '为协议支付用户'
	             else '不为协议支付用户'
	             end as is_xieyi_pay*/
	 case when b4.acc_nbr is not null then '是'
	            else '否'
	            end as is_cm
	,case when t1.prod_id=13 then '固网预付费'
	           when t1.prod_id=1 then '普话后付费'
	           when t1.prod_id=3 then 'CENTREX后付费'
	           else  '其它后付费'
	           end as product
/*	,case when t1.serv_grp_type='01' then '政企'
	           when t1.serv_grp_type='02' then '公众'
	           end as serv_grp_type*/
	 ,case when b1.serv_id is not null then '是'
	            else '否'
	            end as is_mix
	  ,case when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<500 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<2000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=500 then '3'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<4000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=2000 then '4'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=4000 then'5'
	             when b3.acc_nbr is null then '不存在语音记录'
	             end as tonghua
	,count( t4.serv_id_m)  as client_201512
	,sum( t4.charge_费用) as charge_201512
	,count( t16.serv_id_m)  as client_201612
	,sum( t16.charge_费用) as charge_201612
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_费用) /sum( t4.charge_费用) >=0.95 then '稳定群'
	           else '非稳定群'
	           end as  user_type         
	from
	(select *
	from benefit_analyze.cust_infor_201512
	where prod_id in ('13') and state<>'box'
	) t1
	-----------------------------------------选出有收入的用户--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201512_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------是否存在融合业务---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201512) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------固话用户国内和国际通话时间考虑------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201512) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------是否为沉默用户----------------------------------------------------
    left join
    (select * from benefit_analyze.guhua_cm_201512) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------以下部分为每个月的流失情况--------------------------
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201512_gh) t4
	on t1.serv_id=t4.serv_id_m
    left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201601_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201602_gh) t6
	on t1.serv_id=t6.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201603_gh) t7
	on t1.serv_id=t7.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201604_gh) t8
	on t1.serv_id=t8.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201605_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201606_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201607_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201608_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201609_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201610_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201611_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201612_gh) t16
	on t1.serv_id=t16.serv_id_m
	
	where b4.acc_nbr is null
	group by 1,2,3,4
	order by 1,2,3,4
	;
	  
	  
	  
	  
	  
	  
	  
	 		
	---------------------------------15年12月的分类(有收入)(prod_id为2,4,6的用户)--------------------------------------

	select 
/*	case when b2.serv_id is not null then '为协议支付用户'
	             else '不为协议支付用户'
	             end as is_xieyi_pay*/
/*	 case when b4.acc_nbr is not null then '是'
	            else '否'
	            end as is_cm*/
     case when t1.prod_id=13 then '固网预付费'
	           when t1.prod_id=1 then '普话后付费'
	           when t1.prod_id=3 then 'CENTREX后付费'
	           else  '其它后付费'
	           end as product
/*	,case when t1.serv_grp_type='01' then '政企'
	           when t1.serv_grp_type='02' then '公众'
	           end as serv_grp_type
	 ,case when b1.serv_id is not null then '是'
	            else '否'
	            end as is_mix
	  ,case when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<50 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<500 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=50 then '3'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<1000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=500 then '4'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<2000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=1000 then '5'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)<4000 and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=2000 then '6'
	             when b3.acc_nbr is not null and (b3.th_sc+b3.gat_th_sc+b3.gj_th_sc)>=4000 then'7'
	             when b3.acc_nbr is null then '不存在语音记录'
	             end as tonghua*/
	,count( t4.serv_id_m)  as client_201512
	,sum( t4.charge_费用) as charge_201512
	,count( t16.serv_id_m)  as client_201612
	,sum( t16.charge_费用) as charge_201612
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_费用) /sum( t4.charge_费用) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_费用) /sum( t4.charge_费用) >=0.95 then '稳定群'
	           else '非稳定群'
	           end as  user_type          
	from
	(select *
	from benefit_analyze.cust_infor_201512
	where prod_id in ('2','4','6') and state<>'box'
	) t1
	-----------------------------------------选出有收入的用户--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201512_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------是否存在融合业务---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201512) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------固话用户国内和国际通话时间考虑------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201512) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------是否为沉默用户----------------------------------------------------
    left join
    (select * from benefit_analyze.guhua_cm_201512) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------以下部分为每个月的流失情况--------------------------
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201512_gh) t4
	on t1.serv_id=t4.serv_id_m
left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201601_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201602_gh) t6
	on t1.serv_id=t6.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201603_gh) t7
	on t1.serv_id=t7.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201604_gh) t8
	on t1.serv_id=t8.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201605_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201606_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201607_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201608_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201609_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201610_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201611_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_费用
	from benefit_analyze.zyj_qrsr_201612_gh) t16
	on t1.serv_id=t16.serv_id_m
	
	where b4.acc_nbr is null
	group by 1
	order by 1
	;
	  
	  
	  
	  
	  
	  
	
