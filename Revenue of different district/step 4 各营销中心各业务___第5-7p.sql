	

       -----------------------------------��Ӫ�����ģ���ҵ��--------------------------


        -------------------------���Ǹ�Ӫ�����ģ����Ƶķ������޸ĺ������Ӧ���·�----------------

       -------------------------���ǣ�����Ҫ����Ҫ�����������鿴�ҵ�excel�����ǵ�5��PPT������---------------
	 
	 
       --------------------------------2016��12�¸���������---------------------------
	 
	select
	a3.rpt_order
	,a3.group_nbr
	,a3.manage_area
	/*,case when b1.prod_id in  ('3204','3205') then '�ƶ�'
	           when b1.prod_id in ('47','48','51','52','56','57','950','999','1022','1023',
    '1100','2340','3881','500001200','500001741','500002660')  then '���'
               when b1.prod_id in ('1','2','3','4','6','13')  then '�̻�'
               when b1.prod_id in ('1004','3816','500000165','500000166') then 'ITV'
               when b1.prod_id in ('2337','2338','2339','2342','500001600','500001827',
                     '500002420','500002440','500002461','500002480') then '������'
                when  b1.prod_id in ('3839','33','3845','3841','3843','3834','34','36','37','44','54',
    '218','11','510','220','553','3837','223','219','104','43','35','151','769','768','80','105') then '����ר��'
                when b1.prod_id in ('340','500002280','2407','2517','23','630','770','301','3821','3825','641','500000640',
    '854','500001721','610','635','650','501','500002680','3877','3779','500000306','799',
    '30','640','28','500000200','3818','633','500001380','500001311','45','3203','25','803',
    '3786','636','2406','3791','3210','2353','1027','12','806','690','302','3815','500001702',
    '20','710','656','2370','1080','2333','2323','500001242','500000380','53') then '����'
               end as serv_type*/
	,sum(coalesce(t.charge_���ʺ�,0))-sum(coalesce(t.charge_��������,0))-sum(coalesce(t.charge_����ǰ��һ���Է���,0)) charge_201612
    ,sum(coalesce(t1.charge_���ʺ�,0))-sum(coalesce(t1.charge_��������,0))-sum(coalesce(t1.charge_����ǰ��һ���Է���,0))+
    sum(coalesce(t2.charge_���ʺ�,0))-sum(coalesce(t2.charge_��������,0))-sum(coalesce(t2.charge_����ǰ��һ���Է���,0))+ 
    sum(coalesce(t3.charge_���ʺ�,0))-sum(coalesce(t3.charge_��������,0))-sum(coalesce(t3.charge_����ǰ��һ���Է���,0))+ 
    sum(coalesce(t4.charge_���ʺ�,0))-sum(coalesce(t4.charge_��������,0))-sum(coalesce(t4.charge_����ǰ��һ���Է���,0))+
    sum(coalesce(t5.charge_���ʺ�,0))-sum(coalesce(t5.charge_��������,0))-sum(coalesce(t5.charge_����ǰ��һ���Է���,0))+
    sum(coalesce(t6.charge_���ʺ�,0))-sum(coalesce(t6.charge_��������,0))-sum(coalesce(t6.charge_����ǰ��һ���Է���,0))+  
    sum(coalesce(t7.charge_���ʺ�,0))-sum(coalesce(t7.charge_��������,0))-sum(coalesce(t7.charge_����ǰ��һ���Է���,0))  
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
	inner join
	 benefit_analyze.manage_area a3
	 on a2.manage_area=a3.manage_area
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
	
	group by 1,2,3
	order by 1,2,3
	;
	
	
	










---------------------------------R0������-------------------------
	select
	t2.rpt_order
	,t2.group_nbr
	,t2.manage_area
	,sum(t1.charge_201712) charge_201712
	,sum(t1.pre_charge_201807) pre_charge_201807
	,sum(t1.pre_charge_201801)+sum(t1.pre_charge_201802)+sum(t1.pre_charge_201803)+sum(t1.pre_charge_201804)+sum(t1.pre_charge_201805)+sum(t1.pre_charge_201806)+sum(t1.pre_charge_201807)  charge_peiji_201807
	from	
	fsbd.all_product_pre_charge t1
	inner join
	 benefit_analyze.manage_area t2
	 on t1.manage_area=t2.manage_area
	group by 1,2,3
	order by 1,2,3
	;
	

	---------------------------------ʵ�ʱ�����-------------------------
	
	select
	t2.rpt_order
	,t2.group_nbr
	,t2.manage_area
	,sum(t1.charge_201712)  charge_201712
	,sum(t1.charge_leiji_201807) charge_201807
	,sum(t1.charge_leiji_201801)+sum(t1.charge_leiji_201802)+sum(t1.charge_leiji_201803)+sum(t1.charge_leiji_201804)+sum(t1.charge_leiji_201805)+sum(t1.charge_leiji_201806)+sum(t1.charge_leiji_201807)  charge_leiji_201807
	from	
	fsbd.all_product_pre_charge t1
	inner join
	 benefit_analyze.manage_area t2
	 on t1.manage_area=t2.manage_area
	group by 1,2,3
	order by 1,2,3
	;
	
	
select count(*) from	benefit_analyze.tzt_yd_predict_201804_emp
	
	
	select manage_area, count(serv_id) from fsbd.all_product_pre_charge group by 1;



         --------------------------��ͬ���޸ķ��������ǵ�6-7��PPT----------------------
	 
	 
	 -----------------------------------��Ӫ�����ģ���ҵ��--------------------------
	 
	 --------------------------------2016��12�¸���������---------------------------
	
	
	select
	a3.rpt_order
	,a3.group_nbr
	,a3.manage_area
	,case when b1.prod_id in  ('3204','3205') then '�ƶ�'
	           when b1.prod_id in ('47','48','51','52','56','57','950','999','1022','1023',
    '1100','2340','3881','500001200','500001741','500002660')  then '���'
               when b1.prod_id in ('1','2','3','4','6','13')  then '�̻�'
               when b1.prod_id in ('1004','3816','500000165','500000166') then 'ITV'
               when b1.prod_id in ('2337','2338','2339','2342','500001600','500001827',
                     '500002420','500002440','500002461','500002480') then '������'
                when  b1.prod_id in ('3839','33','3845','3841','3843','3834','34','36','37','44','54',
    '218','11','510','220','553','3837','223','219','104','43','35','151','769','768','80','105') then '����ר��'
                when b1.prod_id in ('340','500002280','2407','2517','23','630','770','301','3821','3825','641','500000640',
    '854','500001721','610','635','650','501','500002680','3877','3779','500000306','799',
    '30','640','28','500000200','3818','633','500001380','500001311','45','3203','25','803',
    '3786','636','2406','3791','3210','2353','1027','12','806','690','302','3815','500001702',
    '20','710','656','2370','1080','2333','2323','500001242','500000380','53') then '����'
               end as serv_type
	,sum(coalesce(t.charge_���ʺ�,0))-sum(coalesce(t.charge_��������,0))-sum(coalesce(t.charge_����ǰ��һ���Է���,0)) charge_201612
    ,sum(coalesce(t1.charge_���ʺ�,0))-sum(coalesce(t1.charge_��������,0))-sum(coalesce(t1.charge_����ǰ��һ���Է���,0))+
    sum(coalesce(t2.charge_���ʺ�,0))-sum(coalesce(t2.charge_��������,0))-sum(coalesce(t2.charge_����ǰ��һ���Է���,0))+ 
    sum(coalesce(t3.charge_���ʺ�,0))-sum(coalesce(t3.charge_��������,0))-sum(coalesce(t3.charge_����ǰ��һ���Է���,0))+ 
    sum(coalesce(t4.charge_���ʺ�,0))-sum(coalesce(t4.charge_��������,0))-sum(coalesce(t4.charge_����ǰ��һ���Է���,0))+  
    sum(coalesce(t5.charge_���ʺ�,0))-sum(coalesce(t5.charge_��������,0))-sum(coalesce(t5.charge_����ǰ��һ���Է���,0))+    
    sum(coalesce(t6.charge_���ʺ�,0))-sum(coalesce(t6.charge_��������,0))-sum(coalesce(t6.charge_����ǰ��һ���Է���,0))+ 
    sum(coalesce(t7.charge_���ʺ�,0))-sum(coalesce(t7.charge_��������,0))-sum(coalesce(t7.charge_����ǰ��һ���Է���,0))
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
	inner join
	 benefit_analyze.manage_area a3
	 on a2.manage_area=a3.manage_area
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
	
	group by 1,2,3,4
	order by 1,2,3,4
	;






select count(acc_nbr), count(distinct acc_nbr) from benefit_analyze.dcz_month_4prod_201802;

select count(*) from benefit_analyze.dcz_month_4prod_201802;








---------------------------------R0������-------------------------
	select
	t2.rpt_order
	,t2.group_nbr
	,t2.manage_area
	,t1.serv_type
	,sum(t1.charge_201712) charge_201712
	,sum(t1.pre_charge_201801)+sum(t1.pre_charge_201802)+sum(t1.pre_charge_201803)+sum(t1.pre_charge_201804)+sum(t1.pre_charge_201805)+sum(t1.pre_charge_201806)+sum(t1.pre_charge_201807) charge_peiji_201807
	from	
	fsbd.all_product_pre_charge t1
	inner join
	 benefit_analyze.manage_area t2
	 on t1.manage_area=t2.manage_area
	group by 1,2,3,4
	order by 1,2,3,4
	;
	

	---------------------------------ʵ�ʱ�����-------------------------
	select
	t2.rpt_order
	,t2.group_nbr
	,t2.manage_area
	,t1.serv_type
	,sum(t1.charge_201712)
	,sum(t1.charge_leiji_201801)+sum(t1.charge_leiji_201802)+sum(t1.charge_leiji_201803)+sum(t1.charge_leiji_201804)+sum(t1.charge_leiji_201805)+sum(t1.charge_leiji_201806)+sum(t1.charge_leiji_201807) charge_leiji_201807
	from	
	fsbd.all_product_pre_charge t1
	inner join
	 benefit_analyze.manage_area t2
	 on t1.manage_area=t2.manage_area
	group by 1,2,3,4
	order by 1,2,3,4
	;