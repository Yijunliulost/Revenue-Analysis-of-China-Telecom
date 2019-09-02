	
	drop table if exists benefit_analyze.centrex_charge_2018_gh;
	create table benefit_analyze.centrex_charge_2018_gh distribute by hash (serv_id) 
	as
	select 
    t1.serv_id
    	   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '03000019'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '03000020'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '03000021'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '03000022'
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '03000023'
	           when  b1.serv_id is null and b3.acc_nbr is null then  '03000024'
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '03000025'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '03000026'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '03000027'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '03000028'
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '03000029'
	           when  b1.serv_id is not null and b3.acc_nbr is null then  '03000030'
	           end as group_id           
   ,t1.serv_grp_type 
    ,t1.area 
    ,t1.manage_area
    ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '非稳定群'
	           when  b1.serv_id is null and b3.acc_nbr is null then  '稳定群'
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '非稳定群'
	           when  b1.serv_id is not null and b3.acc_nbr is null then  '稳定群'
	           end as user_type
	   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '固话19'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '固话20'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '固话21'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '固话22'
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '固话23'
	           when  b1.serv_id is null and b3.acc_nbr is null then  '固话24'
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '固话25'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '固话26'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '固话27'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '固话28'
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '固话29'
	           when  b1.serv_id is not null and b3.acc_nbr is null then  '固话30'
	           end as user_type2               
   ,t1.charge_type
   ,t1.pre_charge_2018
   ,t1.avg_charge_3
   ,t1.avg_charge_6
   ,t1.avg_charge_12
   ,t1.charge_201712 as charge_dy_201712
   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.933167
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.845168
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.863977
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201801
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.887292
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.902491
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.797609
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.726241
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.561896
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.914166
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.892322
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.80407
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.545953
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201802
         ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.883663
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201803
         ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.933098
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.8169255
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.889076
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201804
         ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.9314075
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.796893
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.878385
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201805
         ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.923599
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.776567
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.8498515
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201806
         ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.8973655
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7444475
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.8515075
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201807
         ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.893619
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7362345
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.861982
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201808
         ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.8745045
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7129685
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.8401125
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201809
         ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.8809615
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.8079255
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.649481
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.785198
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201810
         ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.9230905
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.853008
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.688541
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.828355
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201811
       ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.9215185
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.851841
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.679701
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.816599
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
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
    (select * from benefit_analyze.dcz_month_4prod_201712 where prod_id='3'
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
    
	
	
	
	
	select * from  benefit_analyze.centrex_charge_2018_gh;
	select count(serv_id),count(distinct serv_id) from  benefit_analyze.centrex_charge_2018_gh;
	
	
	
	
	
	
	
	
	
	
	
	
	