select count(serv_id) from benefit_analyze.contract_2018_itv;  34
select count(serv_id) from benefit_analyze.snmf_2018_itv;    13976
select count(serv_id) from benefit_analyze.cjmf_2018_itv;      3796
select count(serv_id) from benefit_analyze.wuhy_2018_itv;     1140
select count(serv_id) from benefit_analyze.bn_2018_itv;           15419
select count(serv_id) from benefit_analyze.bndq_2018_itv;          138157
select count(serv_id) from benefit_analyze.qita_2018_itv;             635532


select count(serv_id) from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166');      808054



		drop table if exists benefit_analyze.charge_2018_itv_example;
		create table benefit_analyze.charge_2018_itv_example distribute by hash (serv_id) 
		as
		select *
		from benefit_analyze.contract_2018_itv;
		
		INSERT	INTO benefit_analyze.charge_2018_itv_example
select
serv_id, group_id, serv_grp_type, area, manage_area, user_type, user_type2,
		charge_type, pre_charge_2018, avg_charge_3, avg_charge_6, avg_charge_12,
		charge_dy_201712, pre_charge_201801, pre_charge_201802, pre_charge_201803,
		pre_charge_201804, pre_charge_201805, pre_charge_201806, pre_charge_201807,
		pre_charge_201808, pre_charge_201809, pre_charge_201810, pre_charge_201811,
		pre_charge_201812, charge_201701, charge_201702, charge_201703,
		charge_201704, charge_201705, charge_201706, charge_201707, charge_201708,
		charge_201709, charge_201710, charge_201711, charge_201712
from benefit_analyze.snmf_2018_itv; 

	

	
	
		INSERT	INTO benefit_analyze.charge_2018_itv_example
select
serv_id, group_id, serv_grp_type, area, manage_area, user_type, user_type2,
		charge_type, pre_charge_2018, avg_charge_3, avg_charge_6, avg_charge_12,
		charge_dy_201712, pre_charge_201801, pre_charge_201802, pre_charge_201803,
		pre_charge_201804, pre_charge_201805, pre_charge_201806, pre_charge_201807,
		pre_charge_201808, pre_charge_201809, pre_charge_201810, pre_charge_201811,
		pre_charge_201812, charge_201701, charge_201702, charge_201703,
		charge_201704, charge_201705, charge_201706, charge_201707, charge_201708,
		charge_201709, charge_201710, charge_201711, charge_201712
from benefit_analyze.cjmf_2018_itv;




		INSERT	INTO benefit_analyze.charge_2018_itv_example
select
serv_id, group_id, serv_grp_type, area, manage_area, user_type, user_type2,
		charge_type, pre_charge_2018, avg_charge_3, avg_charge_6, avg_charge_12,
		charge_dy_201712, pre_charge_201801, pre_charge_201802, pre_charge_201803,
		pre_charge_201804, pre_charge_201805, pre_charge_201806, pre_charge_201807,
		pre_charge_201808, pre_charge_201809, pre_charge_201810, pre_charge_201811,
		pre_charge_201812, charge_201701, charge_201702, charge_201703,
		charge_201704, charge_201705, charge_201706, charge_201707, charge_201708,
		charge_201709, charge_201710, charge_201711, charge_201712
from benefit_analyze.wuhy_2018_itv; 



		INSERT	INTO benefit_analyze.charge_2018_itv_example
select
serv_id, group_id, serv_grp_type, area, manage_area, user_type, user_type2,
		charge_type, pre_charge_2018, avg_charge_3, avg_charge_6, avg_charge_12,
		charge_dy_201712, pre_charge_201801, pre_charge_201802, pre_charge_201803,
		pre_charge_201804, pre_charge_201805, pre_charge_201806, pre_charge_201807,
		pre_charge_201808, pre_charge_201809, pre_charge_201810, pre_charge_201811,
		pre_charge_201812, charge_201701, charge_201702, charge_201703,
		charge_201704, charge_201705, charge_201706, charge_201707, charge_201708,
		charge_201709, charge_201710, charge_201711, charge_201712
from benefit_analyze.bn_2018_itv;    



		INSERT	INTO benefit_analyze.charge_2018_itv_example
select
serv_id, group_id, serv_grp_type, area, manage_area, user_type, user_type2,
		charge_type, pre_charge_2018, avg_charge_3, avg_charge_6, avg_charge_12,
		charge_dy_201712, pre_charge_201801, pre_charge_201802, pre_charge_201803,
		pre_charge_201804, pre_charge_201805, pre_charge_201806, pre_charge_201807,
		pre_charge_201808, pre_charge_201809, pre_charge_201810, pre_charge_201811,
		pre_charge_201812, charge_201701, charge_201702, charge_201703,
		charge_201704, charge_201705, charge_201706, charge_201707, charge_201708,
		charge_201709, charge_201710, charge_201711, charge_201712
from benefit_analyze.bndq_2018_itv; 



		INSERT	INTO benefit_analyze.charge_2018_itv_example
select
serv_id, group_id, serv_grp_type, area, manage_area, user_type, user_type2,
		charge_type, pre_charge_2018, avg_charge_3, avg_charge_6, avg_charge_12,
		charge_dy_201712, pre_charge_201801, pre_charge_201802, pre_charge_201803,
		pre_charge_201804, pre_charge_201805, pre_charge_201806, pre_charge_201807,
		pre_charge_201808, pre_charge_201809, pre_charge_201810, pre_charge_201811,
		pre_charge_201812, charge_201701, charge_201702, charge_201703,
		charge_201704, charge_201705, charge_201706, charge_201707, charge_201708,
		charge_201709, charge_201710, charge_201711, charge_201712
from benefit_analyze.qita_2018_itv; 








drop table if exists benefit_analyze.charge_2018_itv;
create table benefit_analyze.charge_2018_itv
as select 
t1.serv_id, t1.group_id, case when 1=1 then 'ITV' end as serv_type, t2.is_cz, t1.serv_grp_type, t1.area, t1.manage_area, t1.user_type,
		t1.user_type2, t1.charge_type, t1.pre_charge_2018, t1.avg_charge_3, t1.avg_charge_6,
		t1.avg_charge_12, t1.charge_dy_201712, t1.pre_charge_201801, t1.pre_charge_201802,
		t1.pre_charge_201803, t1.pre_charge_201804, t1.pre_charge_201805, t1.pre_charge_201806,
		t1.pre_charge_201807, t1.pre_charge_201808, t1.pre_charge_201809, t1.pre_charge_201810,
		t1.pre_charge_201811, t1.pre_charge_201812, t1.charge_201701, t1.charge_201702,
		t1.charge_201703, t1.charge_201704, t1.charge_201705, t1.charge_201706, t1.charge_201707,
		t1.charge_201708, t1.charge_201709, t1.charge_201710, t1.charge_201711, t1.charge_201712
from
benefit_analyze.charge_2018_itv_example t1
left join
benefit_analyze.dcz_month_4prod_201712 t2
on t1.serv_id=t2.serv_id



select sum(pre_charge_2018) from benefit_analyze.charge_2018_itv where pre_charge_2018<0;



select count(serv_id), count(distinct serv_id) from benefit_analyze.charge_2018_itv;

select * from benefit_analyze.charge_2018_itv;


select group_id, count(group_id) from benefit_analyze.charge_2018_itv group by 1;






------------------------------------------------------------------16年itv数据-------------------------------------------------------------------------
select
	 count(b1.serv_id) as paizhao_client
	,count(b2.serv_id)  as baocun_client
	,sum(t0.charge_费用*12) as charge_paizhao
	,sum(t1.charge_费用)+sum(t2.charge_费用)+sum(t3.charge_费用)+sum(t4.charge_费用)
	+sum(t5.charge_费用)+sum(t6.charge_费用)+sum(t7.charge_费用)+sum(t8.charge_费用)
	+sum(t9.charge_费用)+sum(t10.charge_费用)+sum(t11.charge_费用)+sum(t12.charge_费用)  as charge_SJ
	from
	(select * from  benefit_analyze.cust_infor_201512 where prod_id in ('1004','3816','500000165','500000166')  ) b1
	left join
	(select * from benefit_analyze.zyj_qrsr_201512_itv) t0
	on b1.serv_id=t0.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201601_itv) t1
	on b1.serv_id=t1.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201602_itv ) t2
	on b1.serv_id=t2.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201603_itv ) t3
	on b1.serv_id=t3.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201604_itv ) t4
	on b1.serv_id=t4.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201605_itv ) t5
	on b1.serv_id=t5.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201606_itv ) t6
	on b1.serv_id=t6.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201607_itv ) t7
	on b1.serv_id=t7.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201608_itv ) t8
	on b1.serv_id=t8.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201609_itv ) t9
	on b1.serv_id=t9.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201610_itv ) t10
	on b1.serv_id=t10.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201611_itv ) t11
	on b1.serv_id=t11.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201612_itv ) t12
	on b1.serv_id=t12.serv_id_m
	left join
 (select * from  benefit_analyze.cust_infor_201612 where  prod_id in ('1004','3816','500000165','500000166') ) b2
 on b1.serv_id=b2.serv_id
	;



------------------------------------------------------------------17年itv数据-------------------------------------------------------------------------
select
	 count(b1.serv_id) as paizhao_client
	,count(b2.serv_id)  as baocun_client
	,sum(t0.charge_费用*12) as charge_paizhao
	,sum(t1.charge_费用)+sum(t2.charge_费用)+sum(t3.charge_费用)+sum(t4.charge_费用)
	+sum(t5.charge_费用)+sum(t6.charge_费用)+sum(t7.charge_费用)+sum(t8.charge_费用)
	+sum(t9.charge_费用)+sum(t10.charge_费用)+sum(t11.charge_费用)+sum(t12.charge_费用)  as charge_SJ
	
	from
	(select * from  benefit_analyze.cust_infor_201612 where  prod_id in ('1004','3816','500000165','500000166') ) b1
	left join
	(select * from benefit_analyze.zyj_qrsr_201612_itv) t0
	on b1.serv_id=t0.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201701_itv) t1
	on b1.serv_id=t1.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201702_itv ) t2
	on b1.serv_id=t2.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201703_itv ) t3
	on b1.serv_id=t3.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201704_itv ) t4
	on b1.serv_id=t4.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201705_itv ) t5
	on b1.serv_id=t5.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201706_itv ) t6
	on b1.serv_id=t6.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201707_itv ) t7
	on b1.serv_id=t7.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201708_itv ) t8
	on b1.serv_id=t8.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201709_itv ) t9
	on b1.serv_id=t9.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201710_itv ) t10
	on b1.serv_id=t10.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201711_itv ) t11
	on b1.serv_id=t11.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201712_itv ) t12
	on b1.serv_id=t12.serv_id_m
	left join
	 (select * from  benefit_analyze.dcz_month_4prod_201712 where  prod_id in ('1004','3816','500000165','500000166') ) b2
    on b1.serv_id=b2.serv_id
	;

------------------------------------------------------------------18年itv数据------------------------------------------------------------------
	select
	(sum(t.pre_charge_201801)+sum(t.pre_charge_201802)+sum(t.pre_charge_201803)+sum(t.pre_charge_201804)
	+sum(t.pre_charge_201805)+sum(t.pre_charge_201806)+sum(t.pre_charge_201807)+sum(t.pre_charge_201808)
	+sum(t.pre_charge_201809)+sum(t.pre_charge_201810)+sum(t.pre_charge_201811)+sum(t.pre_charge_201812))/(sum(t.charge_dy_201712*12))
	 from benefit_analyze.charge_2018_itv t;
	 
	 	select
	 	count(t.serv_id)
	 	,sum(t.pre_charge_201801)
	 ,sum(t.charge_dy_201712*12)
	,(sum(t.pre_charge_201801)+sum(t.pre_charge_201802)+sum(t.pre_charge_201803)+sum(t.pre_charge_201804)
	+sum(t.pre_charge_201805)+sum(t.pre_charge_201806)+sum(t.pre_charge_201807)+sum(t.pre_charge_201808)
	+sum(t.pre_charge_201809)+sum(t.pre_charge_201810)+sum(t.pre_charge_201811)+sum(t.pre_charge_201812))
	 from benefit_analyze.charge_2018_itv t;
	 
	 
	 
	 	 	select
	  sum(t.charge_dy_201712)
	,sum(t.pre_charge_201801)
	,sum(t.pre_charge_201802)
	,sum(t.pre_charge_201803)
	,sum(t.pre_charge_201804)
	,sum(t.pre_charge_201805)
	,sum(t.pre_charge_201806)
	,sum(t.pre_charge_201807)
	,sum(t.pre_charge_201808)
	,sum(t.pre_charge_201809)
	,sum(t.pre_charge_201810)
	,sum(t.pre_charge_201811)
	,sum(t.pre_charge_201812)
	 from benefit_analyze.charge_2018_itv t;
	 
	 
	select * from benefit_analyze.charge_2018_itv where is_cz='否' and charge_201712<20 and charge_201712>0;




select charge_type, count(charge_type) from  benefit_analyze.charge_2018_itv where is_cz='否' group by 1;



------------------------------------------------------------------16年itv数据-------------------------------------------------------------------------
select
	b1.area
	,count(b1.serv_id) as paizhao_client
	,count(b2.serv_id)  as baocun_client
	,sum(t0.charge_费用*12) as charge_paizhao
	,sum(t1.charge_费用)+sum(t2.charge_费用)+sum(t3.charge_费用)+sum(t4.charge_费用)
	+sum(t5.charge_费用)+sum(t6.charge_费用)+sum(t7.charge_费用)+sum(t8.charge_费用)
	+sum(t9.charge_费用)+sum(t10.charge_费用)+sum(t11.charge_费用)+sum(t12.charge_费用)  as charge_SJ
	
	from
	(select * from  benefit_analyze.cust_infor_201512 where  prod_id in ('1004','3816','500000165','500000166') ) b1
	left join
	(select * from benefit_analyze.zyj_qrsr_201512_itv) t0
	on b1.serv_id=t0.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201601_itv) t1
	on b1.serv_id=t1.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201602_itv ) t2
	on b1.serv_id=t2.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201603_itv ) t3
	on b1.serv_id=t3.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201604_itv ) t4
	on b1.serv_id=t4.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201605_itv ) t5
	on b1.serv_id=t5.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201606_itv ) t6
	on b1.serv_id=t6.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201607_itv ) t7
	on b1.serv_id=t7.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201608_itv ) t8
	on b1.serv_id=t8.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201609_itv ) t9
	on b1.serv_id=t9.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201610_itv ) t10
	on b1.serv_id=t10.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201611_itv ) t11
	on b1.serv_id=t11.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201612_itv ) t12
	on b1.serv_id=t12.serv_id_m
	left join
 (select * from  benefit_analyze.cust_infor_201612 where  prod_id in ('1004','3816','500000165','500000166') ) b2
 on b1.serv_id=b2.serv_id
	group by 1
	order by 1 
	;



------------------------------------------------------------------17年itv数据-------------------------------------------------------------------------
select
	b1.area
	,count(b1.serv_id) as paizhao_client
	,count(b2.serv_id)  as baocun_client
	,sum(t0.charge_费用*12) as charge_paizhao
	,sum(t1.charge_费用)+sum(t2.charge_费用)+sum(t3.charge_费用)+sum(t4.charge_费用)
	+sum(t5.charge_费用)+sum(t6.charge_费用)+sum(t7.charge_费用)+sum(t8.charge_费用)
	+sum(t9.charge_费用)+sum(t10.charge_费用)+sum(t11.charge_费用)+sum(t12.charge_费用)  as charge_SJ
	
	from
	(select * from  benefit_analyze.cust_infor_201612 where  prod_id in ('1004','3816','500000165','500000166') ) b1
	left join
	(select * from benefit_analyze.zyj_qrsr_201612_itv) t0
	on b1.serv_id=t0.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201701_itv) t1
	on b1.serv_id=t1.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201702_itv ) t2
	on b1.serv_id=t2.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201703_itv ) t3
	on b1.serv_id=t3.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201704_itv ) t4
	on b1.serv_id=t4.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201705_itv ) t5
	on b1.serv_id=t5.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201706_itv ) t6
	on b1.serv_id=t6.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201707_itv ) t7
	on b1.serv_id=t7.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201708_itv ) t8
	on b1.serv_id=t8.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201709_itv ) t9
	on b1.serv_id=t9.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201710_itv ) t10
	on b1.serv_id=t10.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201711_itv ) t11
	on b1.serv_id=t11.serv_id_m
		left join
	(select * from benefit_analyze.zyj_qrsr_201712_itv ) t12
	on b1.serv_id=t12.serv_id_m
	left join
	 (select * from  benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166')  ) b2
    on b1.serv_id=b2.serv_id
	group by 1
	order by 1
	;


	---------------------------------------------------2018年预测------------------------------------------------------
		 select
	(sum(t.pre_charge_201801)+sum(t.pre_charge_201802)+sum(t.pre_charge_201803)+sum(t.pre_charge_201804)
	+sum(t.pre_charge_201805)+sum(t.pre_charge_201806)+sum(t.pre_charge_201807)+sum(t.pre_charge_201808)
	+sum(t.pre_charge_201809)+sum(t.pre_charge_201810)+sum(t.pre_charge_201811)+sum(t.pre_charge_201812))
	 from benefit_analyze.charge_2018_itv t
	 ;
	 
	
	
	
		 select
		 t.area
	 	,count(t.serv_id)
	 ,sum(t.charge_dy_201712*12)
	,(sum(t.pre_charge_201801)+sum(t.pre_charge_201802)+sum(t.pre_charge_201803)+sum(t.pre_charge_201804)
	+sum(t.pre_charge_201805)+sum(t.pre_charge_201806)+sum(t.pre_charge_201807)+sum(t.pre_charge_201808)
	+sum(t.pre_charge_201809)+sum(t.pre_charge_201810)+sum(t.pre_charge_201811)+sum(t.pre_charge_201812))
	 from benefit_analyze.charge_2018_itv t
	 group by 1
	 ;
	 
	 
	 
	 
	 
	 
	 select
	 count(t.serv_id)
	 ,sum(t.charge_dy_201712)
	,sum(t.pre_charge_201801)
	,sum(t.pre_charge_201802)
	,sum(t.pre_charge_201803)
	,sum(t.pre_charge_201804)
	,sum(t.pre_charge_201805)
	,sum(t.pre_charge_201806)
	,sum(t.pre_charge_201807)
	,sum(t.pre_charge_201808)
	,sum(t.pre_charge_201809)
	,sum(t.pre_charge_201810)
	,sum(t.pre_charge_201811)
	,sum(t.pre_charge_201812)
	 from benefit_analyze.charge_2018_itv t
	 ;
	 
	 
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
benefit_analyze.charge_2018_itv t1
left join
benefit_analyze.zyj_qrsr_201801_itv t2
on t1.serv_id=t2.serv_id_m
group by 1,2,3
;





select count(serv_id_m),sum(charge_费用) from benefit_analyze.zyj_qrsr_201612_itv;   653,483  12,477,715.99

select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201701_itv;   643,595	12,700,456.68

select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201702_itv;  660,866	12,775,854.93

select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201703_itv;  667,372	12,749,162.95

select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201704_itv;  668,117	12,728,245.52

select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201705_itv;   677,733	12,686,253.45

select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201706_itv;  681,061	12,561,463.16

select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201707_itv;  689,223	12,845,825.56


select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201708_itv;  698,231	12,692,273.88


select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201709_itv;  713,303	12,167,523.81


select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201710_itv;  724,804	12,078,820.51


select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201711_itv;  741,166	11,946,912.49


select count(serv_id_m), sum(charge_费用) from benefit_analyze.zyj_qrsr_201712_itv;  778,189	11,720,203.57





select count(serv_id_m) from benefit_analyze.zyj_qrsr_201712_itv where charge_费用<=0;

select count(serv_id_m) from benefit_analyze.zyj_qrsr_201712_itv where charge_费用=0;




  select
  sum(t1.pre_charge_201801)
    ,sum(t2.charge_费用)
 from
 (select * from 	fsbd.all_product_pre_charge where  serv_type='ITV' ) t1
 inner join
 (select * from benefit_analyze.charge_2018_itv where is_cz='否') t
 on t1.serv_id=t.serv_id
 left join
    (select * from benefit_analyze.zyj_qrsr_201801_res) t2
    on t1.serv_id=t2.serv_id_m
;








