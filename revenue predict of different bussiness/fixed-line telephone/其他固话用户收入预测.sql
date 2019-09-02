		
		drop table if exists benefit_analyze.qita_charge_2018_gh;
		create table benefit_analyze.qita_charge_2018_gh distribute by hash (serv_id) 
		as
		select 
		t1.serv_id
		,case when 1=1  then  '03000043'
		 end as group_id 
		,t1.serv_grp_type 
		,t1.area 
		,t1.manage_area
		,case when 1=1  then  '非稳定群'
		end as user_type
		,case when 1=1  then  '固话43'
		end as user_type2               
		,t1.charge_type
		,t1.pre_charge_2018
		,t1.avg_charge_3
		,t1.avg_charge_6
		,t1.avg_charge_12
		,t1.charge_201712 as charge_dy_201712   
		,t1.pre_charge_2018*1 as pre_charge_201801
		,t1.pre_charge_2018*0.796483 as pre_charge_201802
		,t1.pre_charge_2018*1 as pre_charge_201803
		,t1.pre_charge_2018*1 as pre_charge_201804
		,t1.pre_charge_2018*1 as pre_charge_201805
		,t1.pre_charge_2018*0.93754 as pre_charge_201806
		,t1.pre_charge_2018*0.9351225 as pre_charge_201807
		,t1.pre_charge_2018*0.919811 as pre_charge_201808
		,t1.pre_charge_2018*0.883277 as pre_charge_201809
		,t1.pre_charge_2018*0.812846 as pre_charge_201810
		,t1.pre_charge_2018*0.8421935 as pre_charge_201811
		,t1.pre_charge_2018*0.8191635 as pre_charge_201812
		
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
		(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('2','4','6')
		) t0
		on t1.serv_id=t0.serv_id
		left join
		(select * from benefit_analyze.ex_contract_2017_gh
		) t3
		on t1.serv_id=t3.serv_id
		----------------------------------------------------------是否融合------------------------------------------------
		left join
		(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201712) t) b1
		on t1.serv_id=b1.serv_id
		------------------------------------------固话用户国内和国际通话时间考虑------------------------------------
		left join
		(select * from bcust_data.ccust_guhua_records_201712) b3
		on t0.acc_nbr=b3.acc_nbr
		
		---------------------------------------------是否为沉默用户----------------------------------------------------
		left join
		(select * from benefit_analyze.guhua_cm_201712) b4
		on t0.acc_nbr=b4.acc_nbr
		where b4.acc_nbr is null
		;
    











