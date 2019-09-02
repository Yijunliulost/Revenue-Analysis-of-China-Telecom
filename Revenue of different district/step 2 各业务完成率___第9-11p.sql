---------------此处提到修改方法和之前类似，修改相应地方的月份，加上新新的月份（如果算累计值）-----------

--------------------------------第9张PPT-------------------------------


-----------------------------各业务完成情况-----------------------------------
---------------------------------R0保有率-------------------------
	
	select
	serv_type
	,sum(charge_201712) charge_201712
	,sum(pre_charge_201807) charge_201807
	,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807) charge_preiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1
	order by case when serv_type='移动' then 1
	                          when serv_type='宽带' then 2
	                          when serv_type='ITV' then 3
	                          when serv_type='固话' then 4
	                          when serv_type='组网专线' then 5
	                          when serv_type='公有云' then 6
	                          when serv_type='其他' then 7
	                          else 8
	                          end
	;
	

	---------------------------------实际保有率-------------------------
	select
	 serv_type
	,sum(charge_201712) charge_201712
	,sum(charge_leiji_201807) charge_201807
	,sum(charge_leiji_201801)+sum(charge_leiji_201802)+sum(charge_leiji_201803)+sum(charge_leiji_201804)+sum(charge_leiji_201805)+sum(charge_leiji_201806)+sum(charge_leiji_201807) charge_leiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1
	order by case when serv_type='移动' then 1
	                          when serv_type='宽带' then 2
	                          when serv_type='ITV' then 3
	                          when serv_type='固话' then 4
	                          when serv_type='组网专线' then 5
	                          when serv_type='公有云' then 6
	                          when serv_type='其他' then 7
	                          else 8
	                          end
	;

	
	
	
	
---------------------------------------第10张和11张PPT-----------------
	
	--------------------------------各业务5区保有率---------------------------

	---------------------------------R0保有率-------------------------
	select
	 serv_type
	 ,area
	,sum(charge_201712) charge_201712
	,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804) +sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807) charge_Peiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1,2
	order by 1, case when area ='顺德' then 1
	                              when area='南海' then 2
	                              when area='禅城' then 3
	                              when area='三水' then 4
	                              when area='高明' then 5 
	                    else 6
	                    end
	;













	---------------------------------实际保有率-------------------------
	select
	 serv_type
	 ,area
	,sum(charge_201712) charge_201712
	,sum(charge_leiji_201801)+sum(charge_leiji_201802)+sum(charge_leiji_201803)+sum(charge_leiji_201804)+sum(charge_leiji_201805)+sum(charge_leiji_201806)+sum(charge_leiji_201807)   charge_leiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1,2
	order by 1, case when area ='顺德' then 1
	                              when area='南海' then 2
	                              when area='禅城' then 3
	                              when area='三水' then 4
	                              when area='高明' then 5 
	                    else 6
	                    end
	;

