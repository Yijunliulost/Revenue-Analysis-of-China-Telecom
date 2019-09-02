

    	drop table if exists benefit_analyze.yugh_charge_2018_gh;
	create table benefit_analyze.yugh_charge_2018_gh distribute by hash (serv_id) 
	as
	select 
    t1.serv_id
   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '03000031'
       when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '03000032'
       when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '03000033'
       when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '03000034'
       when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '03000035'
       when  b1.serv_id is null and b3.acc_nbr is null then  '03000036'
        when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '03000037'
       when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '03000038'
       when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '03000039'
       when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '03000040'
       when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '03000041'
       when  b1.serv_id is not null and b3.acc_nbr is null then  '03000042'
       end as group_id      
   ,t1.serv_grp_type 
    ,t1.area
    ,t1.manage_area 
    ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '非稳定群'
	           when  b1.serv_id is null and b3.acc_nbr is null then  '非稳定群'
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '非稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '非稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '非稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '非稳定群'
	           when  b1.serv_id is not null and b3.acc_nbr is null then  '非稳定群'
	           end as user_type
	   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '固话31'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '固话32'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '固话33'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '固话34'
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '固话35'
	           when  b1.serv_id is null and b3.acc_nbr is null then  '固话36'
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '固话37'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '固话38'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '固话39'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '固话40'
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '固话41'
	           when  b1.serv_id is not null and b3.acc_nbr is null then  '固话42'
	           end as user_type2               
   ,t1.charge_type
   ,t1.pre_charge_2018
   ,t1.avg_charge_3
   ,t1.avg_charge_6
   ,t1.avg_charge_12
   ,t1.charge_201712 as charge_dy_201712   
   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.929938
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.894565
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.838219
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.93133
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.879904
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.884019
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.84634
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.918256
   end as  pre_charge_201801
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.813763
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.803584
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.676632
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.560569
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.389184
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.837768
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.765373
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.678171
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.532953
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.463757
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.268608
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.896671
   end as  pre_charge_201802
   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.923719
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.9145395
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.847216
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7184975
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.881148
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.9248345
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.9299165
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.8908225
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.8498445
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7160135
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.9254475
   end as  pre_charge_201803
  ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.8932435
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.9205075
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.871619
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.8078665
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.682645
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.819019
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.904692
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.8807845
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.7789685
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.6623815
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.8697025
   end as  pre_charge_201804
  ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.865649
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.904709
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.8519175
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.78633
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.663108
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.7560605
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.8632835
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.930286
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.85375
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.7167835
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.6775875
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.8733245
   end as  pre_charge_201805
     ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.830359
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.868112
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.8200665
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.749444
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.6140065
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.724007
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.862978
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.937788
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.7950945
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.663129
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.619447
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.8922265
   end as  pre_charge_201806
     ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.8162125
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.8538115
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.803929
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.725318
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.6047445
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.700048
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.89787
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.905183
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.7738375
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.676944
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.612151
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.795812
   end as  pre_charge_201807
     ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.793596
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.832937
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.78481
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.7150765
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.602564
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.656664
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.8733855
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.9273935
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.8732735
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.699147
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.5894205
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.7828085
   end as  pre_charge_201808
     ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.7696065
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.805825
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.7648255
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.692912
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.5922405
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.621115
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.8525
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.882588
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.7752675
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.6498805
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.5974065
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.7991615
   end as  pre_charge_201809
     ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.741663
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.779754
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.734147
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.67534
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.5591495
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.5933145
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.8194845
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.9279145
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.7440565
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.6046515
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.5419735
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.8465435
   end as  pre_charge_201810
     ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.7333925
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.7665485
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.738607
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.6711595
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.558174
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.560811
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.830922
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.93327
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.7640435
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.6270905
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.5375415
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.8329845
   end as  pre_charge_201811
     ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.717409
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.7526505
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.71876
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.6560145
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.5741195
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.542155
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.857076
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.7409855
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.637545
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.55287
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*0.793863
   end as  pre_charge_201812
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
    (select * from benefit_analyze.dcz_month_4prod_201712 where prod_id='13'
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