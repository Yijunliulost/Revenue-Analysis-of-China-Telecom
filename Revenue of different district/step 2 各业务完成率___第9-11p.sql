---------------�˴��ᵽ�޸ķ�����֮ǰ���ƣ��޸���Ӧ�ط����·ݣ��������µ��·ݣ�������ۼ�ֵ��-----------

--------------------------------��9��PPT-------------------------------


-----------------------------��ҵ��������-----------------------------------
---------------------------------R0������-------------------------
	
	select
	serv_type
	,sum(charge_201712) charge_201712
	,sum(pre_charge_201807) charge_201807
	,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804)+sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807) charge_preiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1
	order by case when serv_type='�ƶ�' then 1
	                          when serv_type='���' then 2
	                          when serv_type='ITV' then 3
	                          when serv_type='�̻�' then 4
	                          when serv_type='����ר��' then 5
	                          when serv_type='������' then 6
	                          when serv_type='����' then 7
	                          else 8
	                          end
	;
	

	---------------------------------ʵ�ʱ�����-------------------------
	select
	 serv_type
	,sum(charge_201712) charge_201712
	,sum(charge_leiji_201807) charge_201807
	,sum(charge_leiji_201801)+sum(charge_leiji_201802)+sum(charge_leiji_201803)+sum(charge_leiji_201804)+sum(charge_leiji_201805)+sum(charge_leiji_201806)+sum(charge_leiji_201807) charge_leiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1
	order by case when serv_type='�ƶ�' then 1
	                          when serv_type='���' then 2
	                          when serv_type='ITV' then 3
	                          when serv_type='�̻�' then 4
	                          when serv_type='����ר��' then 5
	                          when serv_type='������' then 6
	                          when serv_type='����' then 7
	                          else 8
	                          end
	;

	
	
	
	
---------------------------------------��10�ź�11��PPT-----------------
	
	--------------------------------��ҵ��5��������---------------------------

	---------------------------------R0������-------------------------
	select
	 serv_type
	 ,area
	,sum(charge_201712) charge_201712
	,sum(pre_charge_201801)+sum(pre_charge_201802)+sum(pre_charge_201803)+sum(pre_charge_201804) +sum(pre_charge_201805)+sum(pre_charge_201806)+sum(pre_charge_201807) charge_Peiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1,2
	order by 1, case when area ='˳��' then 1
	                              when area='�Ϻ�' then 2
	                              when area='����' then 3
	                              when area='��ˮ' then 4
	                              when area='����' then 5 
	                    else 6
	                    end
	;













	---------------------------------ʵ�ʱ�����-------------------------
	select
	 serv_type
	 ,area
	,sum(charge_201712) charge_201712
	,sum(charge_leiji_201801)+sum(charge_leiji_201802)+sum(charge_leiji_201803)+sum(charge_leiji_201804)+sum(charge_leiji_201805)+sum(charge_leiji_201806)+sum(charge_leiji_201807)   charge_leiji_201807
	from	
	fsbd.all_product_pre_charge
	group by 1,2
	order by 1, case when area ='˳��' then 1
	                              when area='�Ϻ�' then 2
	                              when area='����' then 3
	                              when area='��ˮ' then 4
	                              when area='����' then 5 
	                    else 6
	                    end
	;

