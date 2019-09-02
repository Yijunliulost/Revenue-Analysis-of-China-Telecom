-------------------这部分就比较简单了，你看我相应的excel，在这你只需要加上相应的月份，跑一下，你就能完成13-16的PPT---------


-------------------------------------------分析到各个群-------------------------------------

	select
	 b1.serv_type
	,b1.group_id
	,t.group_description
	,count(b1.serv_id) client_cnt
	,sum(b1.charge_201712)/count(b1.serv_id) rate_201712
    ,sum(b1.charge_leiji_201801)+sum(b1.charge_leiji_201802)+sum(b1.charge_leiji_201803)+sum(b1.charge_leiji_201804)+sum(b1.charge_leiji_201805)+sum(b1.charge_leiji_201806)+sum(b1.charge_leiji_201807)-(7*sum(b1.charge_201712))  charge_minus
	,(sum(b1.charge_leiji_201801)+sum(b1.charge_leiji_201802)+sum(b1.charge_leiji_201803)+sum(b1.charge_leiji_201804)+sum(b1.charge_leiji_201805)+sum(b1.charge_leiji_201806)+sum(b1.charge_leiji_201807))/(7*count(b1.serv_id)) leiji_rate_201807
	from	
	(select * from fsbd.all_product_pre_charge) b1
	left join
	fsbd.pre_charge_user t
	on b1.group_id=t.group_id
	group by 1,2,3
	order by 1,2,3
	;
	