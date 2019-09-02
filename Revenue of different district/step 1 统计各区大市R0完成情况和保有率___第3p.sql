------------------收入表分析之前你需要去重一下，这个去重和之前不一样--------------------
------------------下面的sql是算R0完成率和今明两年保有率的第3张ppt的-------------------
-----------------算的是当月值和累计值，所以你需要改成相应的月份和加上相应的月份-------------------
   
         sum(coalesce(t7.charge_公允后,0))-sum(coalesce(t7.charge_后向流量,0))-sum(coalesce(t7.charge_公允前的一次性费用,0)) charge_201707

         sum(coalesce(t7.charge_公允后,0))-sum(coalesce(t7.charge_后向流量,0))-sum(coalesce(t7.charge_公允前的一次性费用,0)) charge_leiji_201707

	 left join
	 (select * from benefit_analyze.zyj_qrsr_201707_res2 ) t7
	 on b1.serv_id=t7.serv_id_m

         sum(pre_charge_201807)

         sum(charge_leiji_201807
        
        这5处是需要修改。每段sql类似这样的情况都要修改，需反复核对，不能不错，每月类似



--------------------------------17年总保有率---------------------------
	select
/*	,case when b1.prod_id in  ('3204','3205') then '移动'
	           when b1.prod_id in ('47','48','51','52','56','57','950','999','1022','1023',
    '1100','2340','3881','500001200','500001741','500002660')  then '宽带'
               when b1.prod_id in ('1','2','3','4','6','13')  then '固话'
               when b1.prod_id in ('1004','3816','500000165','500000166') then 'ITV'
               when b1.prod_id in ('2337','2338','2339','2342','500001600','500001827',
                     '500002420','500002440','500002461','500002480') then '公有云'
                when  b1.prod_id in ('3839','33','3845','3841','3843','3834','34','36','37','44','54',
    '218','11','510','220','553','3837','223','219','104','43','35','151','769','768','80','105') then '组网专线'
                when b1.prod_id in ('340','500002280','2407','2517','23','630','770','301','3821','3825','641','500000640',
    '854','500001721','610','635','650','501','500002680','3877','3779','500000306','799',
    '30','640','28','500000200','3818','633','500001380','500001311','45','3203','25','803',
    '3786','636','2406','3791','3210','2353','1027','12','806','690','302','3815','500001702',
    '20','710','656','2370','1080','2333','2323','500001242','500000380','53') then '其他'
               end as serv_type*/
	sum(coalesce(t.charge_公允后,0))-sum(coalesce(t.charge_后向流量,0))-sum(coalesce(t.charge_公允前的一次性费用,0)) charge_201612
    ,sum(coalesce(t7.charge_公允后,0))-sum(coalesce(t7.charge_后向流量,0))-sum(coalesce(t7.charge_公允前的一次性费用,0)) charge_201707
    ,sum(coalesce(t1.charge_公允后,0))-sum(coalesce(t1.charge_后向流量,0))-sum(coalesce(t1.charge_公允前的一次性费用,0))+
    sum(coalesce(t2.charge_公允后,0))-sum(coalesce(t2.charge_后向流量,0))-sum(coalesce(t2.charge_公允前的一次性费用,0))+
    sum(coalesce(t3.charge_公允后,0))-sum(coalesce(t3.charge_后向流量,0))-sum(coalesce(t3.charge_公允前的一次性费用,0))+
    sum(coalesce(t4.charge_公允后,0))-sum(coalesce(t4.charge_后向流量,0))-sum(coalesce(t4.charge_公允前的一次性费用,0))+
    sum(coalesce(t5.charge_公允后,0))-sum(coalesce(t5.charge_后向流量,0))-sum(coalesce(t5.charge_公允前的一次性费用,0))+  
    sum(coalesce(t6.charge_公允后,0))-sum(coalesce(t6.charge_后向流量,0))-sum(coalesce(t6.charge_公允前的一次性费用,0))+
    sum(coalesce(t7.charge_公允后,0))-sum(coalesce(t7.charge_后向流量,0))-sum(coalesce(t7.charge_公允前的一次性费用,0))
    charge_leiji_201707
	from
	(select serv_id, prod_id from benefit_analyze.dcz_month_4prod_201612
	    union
		select serv_id_m serv_id, prod_id from benefit_analyze.zuwang_zhuanxian_shouru_2016_2017
		union
		select serv_id_m serv_id, prod_id from benefit_analyze.gongyouyun_shouru_2016_2017
		union
		select serv_id_m serv_id, prod_id from benefit_analyze.else_prod_shouru_2016_2017) b1
	left join
	benefit_analyze.hx_duty_result_201712 a1
    on b1.serv_id=a1.serv_id_m
    left join
    benefit_analyze.v_area_sales_config a2
    on
	a1.SALES_CENTER_ID=a2.MANAGE_AREA_ID
	left join
	(select * from benefit_analyze.zyj_qrsr_201612_res2) t
	on b1.serv_id=t.serv_id_m 
	left join
	(select * from benefit_analyze.zyj_qrsr_201701_res2) t1
	on b1.serv_id=t1.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201702_res2 ) t2
	on b1.serv_id=t2.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201703_res2 ) t3
	on b1.serv_id=t3.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201704_res2 ) t4
	on b1.serv_id=t4.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201705_res2 ) t5
	on b1.serv_id=t5.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201706_res2 ) t6
	on b1.serv_id=t6.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201707_res2 ) t7
	on b1.serv_id=t7.serv_id_m
	
	;




---------------------------------R0保有率-------------------------
	select
	sum(charge_201712) charge_201712
	,sum(pre_charge_201807) charge_201807
	,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807) charge_preiji_201807
	from	
	fsbd.all_product_pre_charge
	;
	

	---------------------------------实际保有率-------------------------
	select
	 sum(charge_201712) charge_201712
	,sum(charge_leiji_201807) charge_201807
	,sum(charge_leiji_201801)+sum(charge_leiji_201802)+sum(charge_leiji_201803)+sum(charge_leiji_201804)+sum(charge_leiji_201805)+sum(charge_leiji_201806)+sum(charge_leiji_201807)   charge_leiji_201807
	from	
	fsbd.all_product_pre_charge
	;



	select serv_type, sum(pre_charge_201804)-sum(charge_leiji_201804) from fsbd.all_product_pre_charge group by 1;




--------------------------------2016年12月各区保有率---------------------------

	select
	a2.area
/*	,case when b1.prod_id in  ('3204','3205') then '移动'
	           when b1.prod_id in ('47','48','51','52','56','57','950','999','1022','1023',
    '1100','2340','3881','500001200','500001741','500002660')  then '宽带'
               when b1.prod_id in ('1','2','3','4','6','13')  then '固话'
               when b1.prod_id in ('1004','3816','500000165','500000166') then 'ITV'
               when b1.prod_id in ('2337','2338','2339','2342','500001600','500001827',
                     '500002420','500002440','500002461','500002480') then '公有云'
                when  b1.prod_id in ('3839','33','3845','3841','3843','3834','34','36','37','44','54',
    '218','11','510','220','553','3837','223','219','104','43','35','151','769','768','80','105') then '组网专线'
                when b1.prod_id in ('340','500002280','2407','2517','23','630','770','301','3821','3825','641','500000640',
    '854','500001721','610','635','650','501','500002680','3877','3779','500000306','799',
    '30','640','28','500000200','3818','633','500001380','500001311','45','3203','25','803',
    '3786','636','2406','3791','3210','2353','1027','12','806','690','302','3815','500001702',
    '20','710','656','2370','1080','2333','2323','500001242','500000380','53') then '其他'
               end as serv_type*/
	,sum(coalesce(t.charge_公允后,0))-sum(coalesce(t.charge_后向流量,0))-sum(coalesce(t.charge_公允前的一次性费用,0)) charge_201612
    ,sum(coalesce(t7.charge_公允后,0))-sum(coalesce(t7.charge_后向流量,0))-sum(coalesce(t7.charge_公允前的一次性费用,0)) charge_201707
    ,sum(coalesce(t1.charge_公允后,0))-sum(coalesce(t1.charge_后向流量,0))-sum(coalesce(t1.charge_公允前的一次性费用,0))+
    sum(coalesce(t2.charge_公允后,0))-sum(coalesce(t2.charge_后向流量,0))-sum(coalesce(t2.charge_公允前的一次性费用,0))+
    sum(coalesce(t3.charge_公允后,0))-sum(coalesce(t3.charge_后向流量,0))-sum(coalesce(t3.charge_公允前的一次性费用,0))+
    sum(coalesce(t4.charge_公允后,0))-sum(coalesce(t4.charge_后向流量,0))-sum(coalesce(t4.charge_公允前的一次性费用,0))+  
    sum(coalesce(t5.charge_公允后,0))-sum(coalesce(t5.charge_后向流量,0))-sum(coalesce(t5.charge_公允前的一次性费用,0))+
    sum(coalesce(t6.charge_公允后,0))-sum(coalesce(t6.charge_后向流量,0))-sum(coalesce(t6.charge_公允前的一次性费用,0))+
    sum(coalesce(t7.charge_公允后,0))-sum(coalesce(t7.charge_后向流量,0))-sum(coalesce(t7.charge_公允前的一次性费用,0))
    charge_leiji_201707
	from
	(select serv_id, prod_id from benefit_analyze.dcz_month_4prod_201612
	    union
		select serv_id_m serv_id, prod_id from benefit_analyze.zuwang_zhuanxian_shouru_2016_2017
		union
		select serv_id_m serv_id, prod_id from benefit_analyze.gongyouyun_shouru_2016_2017
		union
		select serv_id_m serv_id, prod_id from benefit_analyze.else_prod_shouru_2016_2017) b1
	left join
	benefit_analyze.hx_duty_result_201712 a1
    on b1.serv_id=a1.serv_id_m
    left join
    benefit_analyze.v_area_sales_config a2
    on
	a1.SALES_CENTER_ID=a2.MANAGE_AREA_ID
	left join
	(select * from benefit_analyze.zyj_qrsr_201612_res2) t
	on b1.serv_id=t.serv_id_m 
	left join
	(select * from benefit_analyze.zyj_qrsr_201701_res2) t1
	on b1.serv_id=t1.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201702_res2 ) t2
	on b1.serv_id=t2.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201703_res2 ) t3
	on b1.serv_id=t3.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201704_res2 ) t4
	on b1.serv_id=t4.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201705_res2 ) t5
	on b1.serv_id=t5.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201706_res2 ) t6
	on b1.serv_id=t6.serv_id_m
	left join
	(select * from benefit_analyze.zyj_qrsr_201707_res2 ) t7
	on b1.serv_id=t7.serv_id_m
	group by 1
	order by case when a2.area ='顺德' then 1
	                           when a2.area='南海' then 2
	                           when a2.area='禅城' then 3
	                           when a2.area='三水' then 4
	                           when a2.area='高明' then 5 
	                 else 6
	                 end
	;




---------------------------------R0保有率-------------------------
	select
	area
	,sum(charge_201712) charge_201712
	,sum(pre_charge_201807) charge_201807
	,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807) charge_preiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1
	order by case when area ='顺德' then 1
	                           when area='南海' then 2
	                           when area='禅城' then 3
	                           when area='三水' then 4
	                           when area='高明' then 5 
	                 else 6
	                 end
	;
	

	---------------------------------实际保有率-------------------------
	select
	 area
	,sum(charge_201712) charge_201712
	,sum(charge_leiji_201807) charge_201807
	,sum(charge_leiji_201801)+sum(charge_leiji_201802)+sum(charge_leiji_201803)+sum(charge_leiji_201804)+sum(charge_leiji_201805)+sum(charge_leiji_201806)+sum(charge_leiji_201807)  charge_leiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1
	order by case when area ='顺德' then 1
	                           when area='南海' then 2
	                           when area='禅城' then 3
	                           when area='三水' then 4
	                           when area='高明' then 5 
	                 else 6
	                 end
	;

