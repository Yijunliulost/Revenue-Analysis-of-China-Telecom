---------------------------相同的方法，修改和增加月份，将sql运行的结果复制我的excel，如何将结果复制到PPT------------

---------------------------------------总的各群误差----------------------------------------------
	select
	 b1.serv_type
	,b1.group_id
	,t.group_description
	,count(b1.serv_id) client_cnt
	,sum(b1.pre_charge_201801)  pre_charge_201801
    ,sum(b1.charge_leiji_201801)  charge_leiji_201801
    
    ,sum(b1.pre_charge_201802)  pre_charge_201802
    ,sum(b1.charge_leiji_201802)  charge_leiji_201802
    
   ,sum(b1.pre_charge_201803)  pre_charge_201803
    ,sum(b1.charge_leiji_201803)  charge_leiji_201803
    
    ,sum(b1.pre_charge_201804)  pre_charge_201804
    ,sum(b1.charge_leiji_201804)  charge_leiji_201804
    
    ,sum(b1.pre_charge_201805)  pre_charge_201805
    ,sum(b1.charge_leiji_201805)  charge_leiji_201805
    
    ,sum(b1.pre_charge_201806)  pre_charge_201806
    ,sum(b1.charge_leiji_201806)  charge_leiji_201806
    
    ,sum(b1.pre_charge_201806)  pre_charge_201807
    ,sum(b1.charge_leiji_201806)  charge_leiji_201807
    
    ,sum(b1.pre_charge_201801)+sum(b1.pre_charge_201802)+sum(b1.pre_charge_201803)+sum(b1.pre_charge_201804)+sum(b1.pre_charge_201805)+sum(b1.pre_charge_201806)+sum(b1.pre_charge_201807) charge_perji_201807
    ,sum(b1.charge_leiji_201801)+sum(b1.charge_leiji_201802)+sum(b1.charge_leiji_201803)+sum(b1.charge_leiji_201804)+sum(b1.charge_leiji_201805)+sum(b1.charge_leiji_201806)+sum(b1.charge_leiji_201807)  charge_leiji_201807
	from	
	(select * from fsbd.all_product_pre_charge) b1
	left join
	fsbd.pre_charge_user t
	on b1.group_id=t.group_id
	group by 1,2,3
	order by 1,2,3
	;
	
	
	--------------------------------------------------移动不限量实际与预测---------------------------------
	
	select sum(pre_charge_201807), sum(charge_leiji_201807) from fsbd.all_product_pre_charge where group_id='12007';
	
	

	
	
-------------------------------------存量不变的值-------------------------------------
  	
  	select
  	 	
    count(b1.serv_id)  cnt
   , sum(b1.charge_201712) charge_201712
   ,sum(coalesce(t1.charge_公允后,0))-sum(coalesce(t1.charge_后向流量,0))-sum(coalesce(t1.charge_公允前的一次性费用,0)) charge_201801
   ,sum(coalesce(t2.charge_公允后,0))-sum(coalesce(t2.charge_后向流量,0))-sum(coalesce(t2.charge_公允前的一次性费用,0)) charge_201802
   ,sum(coalesce(t3.charge_公允后,0))-sum(coalesce(t3.charge_后向流量,0))-sum(coalesce(t3.charge_公允前的一次性费用,0)) charge_201803
   ,sum(coalesce(t4.charge_公允后,0))-sum(coalesce(t4.charge_后向流量,0))-sum(coalesce(t4.charge_公允前的一次性费用,0)) charge_201804
   ,sum(coalesce(t5.charge_公允后,0))-sum(coalesce(t5.charge_后向流量,0))-sum(coalesce(t5.charge_公允前的一次性费用,0)) charge_201805
   ,sum(coalesce(t6.charge_公允后,0))-sum(coalesce(t6.charge_后向流量,0))-sum(coalesce(t6.charge_公允前的一次性费用,0)) charge_201806
   ,sum(coalesce(t7.charge_公允后,0))-sum(coalesce(t7.charge_后向流量,0))-sum(coalesce(t7.charge_公允前的一次性费用,0)) charge_201807
  	from
  	(select * from fsbd.all_product_pre_charge where group_id='12007') b1
  	inner join
  	benefit_analyze.zyj_qrsr_201801_res2 t1
  	on b1.serv_id=t1.serv_id_m
  	inner join
  	benefit_analyze.zyj_qrsr_201802_res2 t2
  	on b1.serv_id=t2.serv_id_m
  	inner join
  	benefit_analyze.zyj_qrsr_201803_res2 t3
  	on b1.serv_id=t3.serv_id_m
    inner join
  	benefit_analyze.zyj_qrsr_201804_res2 t4
  	on b1.serv_id=t4.serv_id_m
  	inner join
  	benefit_analyze.zyj_qrsr_201805_res2 t5
  	on b1.serv_id=t5.serv_id_m
  	inner join
  	benefit_analyze.zyj_qrsr_201806_res2 t6
  	on b1.serv_id=t6.serv_id_m
  	inner join
  	benefit_analyze.zyj_qrsr_201807_res2 t7
  	on b1.serv_id=t7.serv_id_m
  	;
  	
	
	-----------------------------------------------每月流失情况----------------------------------------------
	

  	
  	---------------------------201801----------------------------------
  	
  	 	
	select
    count(b1.serv_id)  cnt
   ,sum(coalesce(t1.charge_公允后,0))-sum(coalesce(t1.charge_后向流量,0))-sum(coalesce(t1.charge_公允前的一次性费用,0)) charge_201807
  	from
  	(select * from fsbd.all_product_pre_charge where group_id='12007') b1
  	inner join
  	benefit_analyze.zyj_qrsr_201806_res2 t1
  	on b1.serv_id=t1.serv_id_m
  	left join
  	 benefit_analyze.zyj_qrsr_201807_res2 t2
  	 on b1.serv_id=t2.serv_id_m
  	where t2.serv_id_m is null
  	;
  	
  	
	
	
	
	
	
	
	
	
	---------------------------------------------移动不限量各区------------------------------------
	
 select count(serv_id) from fsbd.all_product_pre_charge where group_id='12007' and charge_leiji_201803 is null;
 
 
  select area, sum(charge_leiji_201801)+sum(charge_leiji_201802)+sum(charge_leiji_201803)+sum(charge_leiji_201804)+sum(charge_leiji_201805)+sum(charge_leiji_201806)+sum(charge_leiji_201807) charge_leiji_201807 
  from fsbd.all_product_pre_charge 
  where group_id='12007' 
  group by 1
  order by case when area ='顺德' then 1
	                           when area='南海' then 2
	                           when area='禅城' then 3
	                           when area='三水' then 4
	                           when area='高明' then 5 
	                 else '6'
	                 end
  ;
  
  
  
  
select area, sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807) charge_peiji_201807
from fsbd.all_product_pre_charge 
where group_id='12007' 
group by 1
order by case when area ='顺德' then 1
                       when area='南海' then 2
                       when area='禅城' then 3
                       when area='三水' then 4
                       when area='高明' then 5 
             else '6'
             end
;

  


 
  	
  	
  	
  	-----------------------------------单进融_宽带------------------------------------
  	
  	  	select
  	 count(t1.serv_id)
  	,sum(t1.charge_201712)
  	,sum(t1.pre_charge_201807)
  	,sum(t1.charge_leiji_201807)
  	from
  	(select * from fsbd.all_product_pre_charge) t1
  	inner join
  	(select * from benefit_analyze.dcz_month_4prod_201712 where serv_type='宽带' and is_mix='否') t2
  	on t1.serv_id=t2.serv_id
  	inner join
  	(select * from benefit_analyze.dcz_month_4prod_201807 where is_mix='否') b1
  	on t1.serv_id=b1.serv_id
  	;
  	
  	
  	select
  	t1.state
  	,count(t1.serv_id)
  	from
  	(select * from benefit_analyze.dcz_month_4prod_201807) t1
  	left join
  	(select * from benefit_analyze.dcz_month_4prod_201806) t2
  	on t1.serv_id=t2.serv_id
  	where t2.serv_id is null
  	group by 1
  	;
  	
  	select state, count(serv_id) from benefit_analyze.dcz_month_4prod_201807 group by 1;
  	
  	
  	
  	
  	select is_mix, count(serv_id) from benefit_analyze.dcz_month_4prod_201712 where serv_type='宽带'  group by 1;
  	
  	
  	
  	
  	----------------------------------------------单进融各区-----------------------------------------------
  	
  	select
  	t1.area
  	,count(t1.serv_id)
  	,sum(t1.charge_201712)
  	,sum(t1.pre_charge_201807)
  	,sum(t1.charge_leiji_201807)
  	from
  	(select * from fsbd.all_product_pre_charge) t1
  	inner join
  	(select * from benefit_analyze.dcz_month_4prod_201712 where serv_type='宽带' and  is_mix='否') t2
  	on t1.serv_id=t2.serv_id
  	inner join
  	(select * from benefit_analyze.dcz_month_4prod_201807 where is_mix='是') b1
  	on t1.serv_id=b1.serv_id
  	group by 1
  	order by case when t1.area ='顺德' then 1
                       when t1.area='南海' then 2
                       when t1.area='禅城' then 3
                       when t1.area='三水' then 4
                       when t1.area='高明' then 5 
             else '6'
             end
  	;
  	
  	
  	
  

------------------------------------------------------固话保有率------------------------------------------------------



 select * from fsbd.pre_charge_user  where group_id='03000005';


 select sum(charge_201712), sum(charge_leiji_201807) from fsbd.all_product_pre_charge where  group_id='03000005';