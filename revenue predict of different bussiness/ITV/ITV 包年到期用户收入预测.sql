	drop table if exists benefit_analyze.bndq_2018_itv;
	create table benefit_analyze.bndq_2018_itv distribute by hash (serv_id) 
	as
	select 
	t1.serv_id
	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then '04000006' 
	       when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then '04000007'
	       when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then '04000008'
	       when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then '04000009' 
	       when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then '04000010'
	       when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then '04000011'
	       
	       when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then '04000012' 
	       when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then '04000013'
	       when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then '04000014'
	       when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then '04000015' 
	       when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then '04000016'
	       when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then '04000017'
	end as group_id
	,t1.serv_grp_type 
	,t1.area 
	,t1.manage_area
	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then '非稳定群' 
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then '非稳定群'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then '非稳定群'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then '非稳定群' 
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then '非稳定群'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then '非稳定群'
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then '非稳定群' 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then '非稳定群'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then '非稳定群'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then '非稳定群' 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then '非稳定群'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then '非稳定群'
	end as user_type
	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then 'itv6' 
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then 'itv7'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then 'itv8'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then 'itv9' 
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then 'itv10'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then 'itv11'
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then 'itv12' 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then 'itv13'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then 'itv14'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then 'itv15' 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then 'itv16'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then 'itv17'
	end as user_type2
	
	,t1.charge_type
	,t1.pre_charge_2018
	,t1.avg_charge_3
	,t1.avg_charge_6
	,t1.avg_charge_12
	,t1.charge_201712 as charge_dy_201712
	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907
	end as pre_charge_201801
 	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^2
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^2 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^2
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^2
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^2
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^2
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^2
	end as pre_charge_201802
	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^3
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^3 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^3
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^3
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^3
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^3
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^3
	end as pre_charge_201803
	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^4
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^4 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^4
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^4
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^4
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^4
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^4
	end as pre_charge_201804
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^5
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^5 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^5
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^5
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^5
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^5
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^5
	end as pre_charge_201805
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^6
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^6 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^6
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^6
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^6
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^6
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^6
	end as pre_charge_201806
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^7
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^7 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^7
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^7
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^7
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^7
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^7
	end as pre_charge_201807
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^8
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^8 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^8
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^8
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^8
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^8
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^8
	end as pre_charge_201808
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^9
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^9 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^9
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^9
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^9
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^9
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^9
	end as pre_charge_201809
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^10
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^10 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^10
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^10
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^10
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^10
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^10
	end as pre_charge_201810
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^11
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^11 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^11
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^11
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^11
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^11
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^11
	end as pre_charge_201811
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.972956433^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.980009655^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.978826838^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.961983059^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.96744492^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.966587991^12
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.921751709^12 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.950792897^12
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.967091856^12
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.971111683^12
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.97766223^12
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.98246907^12
	end as pre_charge_201812

	,t2.charge_201701
	,t2.charge_201702
	,t2.charge_201703
	,t2.charge_201704
	,t2.charge_201705
	,t2.charge_201706
	,t2.charge_201707
	,t2.charge_201708
	,t2.charge_201709
	,t2.charge_201710
	,t2.charge_201711
	,t2.charge_201712
	
	from
	(select * from benefit_analyze.ex_contract_2018_itv) t1
	inner join
	(select * from benefit_analyze.dcz_month_4prod_201712 where prod_id in ('1004','3816','500000165','500000166')) t0
	on t1.serv_id=t0.serv_id
	left join
	(select * from benefit_analyze.ex_contract_2017_itv) t2
	on t1.serv_id=t2.serv_id
	
	--------------------------------------------一年以上-------------------------------
	left  join
	(select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201712 
	where limit_date>='2019-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	--------------------------------------一年以内----------------------------------------
	inner join
	(
	select * from benefit_analyze.itv_inyear_201712
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------是否存在融合业务---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201712) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------是否协议支付用户-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV活跃度考虑-------------------------------------------------
	left join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201712) b6
	on t0.acc_nbr=b6.acc_nbr
	
	-----------------------------------------排除已经计算的群-----------------------------------------------
	left join
    (select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-665-1-4') c1
    on t1.serv_id=c1.serv_id
    left join
	(select distinct serv_id from benefit_analyze.dcz_itv_prod_offer_201712  where prod_offer_code='DM0001-060_013' and msinfo_open_date>='2017-1-1')  c2
     on t1.serv_id=c2.serv_id
     where c1.serv_id is null and c2.serv_id is null and b6.acc_nbr is not null
	;
	
	
	
	
	select count(serv_id), count(distinct serv_id) from benefit_analyze.bndq_2018_itv;
	
	
	
