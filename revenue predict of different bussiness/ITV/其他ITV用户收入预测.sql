	drop table if exists benefit_analyze.qita_2018_itv;
	create table benefit_analyze.qita_2018_itv distribute by hash (serv_id) 
	as
	select 
	t1.serv_id
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then '04000018' 
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then '04000019'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then '04000020'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then '04000021' 
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then '04000022'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then '04000023'
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then '04000024' 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then '04000025'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then '04000026'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then '04000027' 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then '04000028'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then '04000029'
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
	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then 'itv18' 
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then 'itv19'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then 'itv20'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then 'itv21' 
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then 'itv22'
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then 'itv23'
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then 'itv24' 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then 'itv25'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then 'itv26'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then 'itv27' 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then 'itv28'
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then 'itv29'
	end as user_type2
	
	,t1.charge_type
	,t1.pre_charge_2018
	,t1.avg_charge_3
	,t1.avg_charge_6
	,t1.avg_charge_12
	,t1.charge_201712 as charge_dy_201712
	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738
	end as pre_charge_201801
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^2
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^2
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^2 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^2
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^2
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^2
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^2
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^2
	end as pre_charge_201802
 	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^3
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^3
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^3 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^3
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^3
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^3
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^3
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^3
	end as pre_charge_201803
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^4
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^4
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^4 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^4
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^4
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^4
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^4
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^4
	end as pre_charge_201804
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^5
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^5
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^5 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^5
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^5
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^5
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^5
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^5
	end as pre_charge_201805
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^6
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^6
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^6 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^6
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^6
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^6
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^6
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^6
	end as pre_charge_201806
	
 	,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^7
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^7
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^7 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^7
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^7
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^7
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^7
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^7
	end as pre_charge_201807
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^8
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^8
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^8 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^8
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^8
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^8
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^8
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^8
	end as pre_charge_201808
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^9
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^9
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^9 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^9
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^9
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^9
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^9
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^9
	end as pre_charge_201809
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^10
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^10
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^10 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^10
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^10
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^10
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^10
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^10
	end as pre_charge_201810
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^11
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^11
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^11 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^11
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^11
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^11
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^11
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^11
	end as pre_charge_201811
		,case when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018* 0.981018871^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.985059666^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.980950784^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.977050166^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.972313314^12
	           when t0.prod_id in ('1004','500000165') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.974675469^12
	           
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.958243166^12 
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.963943772^12
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is null and  b6.login_times>30  then pre_charge_2018*0.961512345^12
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=5 and b6.login_times>=0  then pre_charge_2018*0.945849061^12
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and b6.login_times<=30 and b6.login_times>5  then pre_charge_2018*0.948086197^12
	           when t0.prod_id in ('3816','500000166') and b3.serv_id is not null and  b6.login_times>30  then pre_charge_2018*0.954228738^12
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
	left join
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
     where c1.serv_id is null and c2.serv_id is null and b6.acc_nbr is not null and b1.serv_id is null and b2.serv_id is null
	;
	
	
	
	
	


select count(serv_id), count(distinct serv_id) from  benefit_analyze.qita_2018_itv;