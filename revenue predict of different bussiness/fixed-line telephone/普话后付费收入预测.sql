drop table if exists benefit_analyze.pgh_charge_2018_gh;
	create table benefit_analyze.pgh_charge_2018_gh distribute by hash (serv_id) 
	as
	select 
    t1.serv_id
   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '03000005'
       when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '03000006'
       when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '03000007'
       when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '03000008'
       when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '03000009'
       when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '03000010'
       when  b1.serv_id is null and b3.acc_nbr is null then  '03000011'
        when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '03000012'
       when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '03000013'
       when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '03000014'
       when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '03000015'
       when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '03000016'
       when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '03000017'
       when  b1.serv_id is not null and b3.acc_nbr is null then  '03000018'
       end as group_id       
   ,t1.serv_grp_type 
    ,t1.area 
    ,t1.manage_area
    ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '非稳定群'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '非稳定群'
	           when  b1.serv_id is null and b3.acc_nbr is null then  '非稳定群'
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '非稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '非稳定群'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '非稳定群'
	           when  b1.serv_id is not null and b3.acc_nbr is null then  '稳定群'
	           end as user_type
	   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '固话5'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '固话6'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '固话7'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '固话8'
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '固话9'
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '固话10'
	           when  b1.serv_id is null and b3.acc_nbr is null then  '固话11'
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  '固话12'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  '固话13'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  '固话14'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  '固话15'
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  '固话16'
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  '固话17'
	           when  b1.serv_id is not null and b3.acc_nbr is null then  '固话18'
	           end as user_type2               
   ,t1.charge_type
   ,t1.pre_charge_2018
   ,t1.avg_charge_3
   ,t1.avg_charge_6
   ,t1.avg_charge_12
   ,t1.charge_201712 as charge_dy_201712
   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.903103
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.828431
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.845017
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201801
   ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.934774
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.837139
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.767989
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.694502
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.522069
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.930178
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.861499
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.783266
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.703204
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.485936
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1^2
   end as  pre_charge_201802
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.9236635
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.8527975
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*1
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.858898
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201803
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.9230385
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.873982
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7870745
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.920821
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.80753
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201804
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.9146745
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.8689585
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7745045
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1^5
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1^5
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1^5
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.930728
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.791799
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201805
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.8955535
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.8382635
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7393985
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.9098045
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.758376
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201806
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.9329735
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.885099
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.827771
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7123315
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.9002175
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7457195
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201807
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.938892
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.921832
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.8716315
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.811403
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7094345
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*1
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.890519
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.7389235
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201808
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.921369
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.9029635
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.8509285
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.7894005
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.6759575
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.9186845
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.9255075
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.872696
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.715213
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201809
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.8846915
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.914064
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.855848
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.801707
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.7432485
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.622759
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.886934
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.892219
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.8328715
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.6725865
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201810
    ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.8721495
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.9123795
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.862065
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.8121255
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.7536065
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.634217
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.8721655
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.8954035
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.8395575
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.68876
	           when  b1.serv_id is not null and b3.acc_nbr is null then t1.pre_charge_2018*1
   end as  pre_charge_201811
      ,case when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*0.8676825
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*0.911379
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*0.8629255
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.8079185
	           when b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.750401
	           when  b1.serv_id is null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.630362
	           when  b1.serv_id is null and b3.acc_nbr is null then  t1.pre_charge_2018*0.854035
	            when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500  then  t1.pre_charge_2018*1
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000  then  t1.pre_charge_2018*0.908374
	           when b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000  then  t1.pre_charge_2018*0.848968
	           when  b1.serv_id is not null and b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then  t1.pre_charge_2018*0.6917535
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
    (select * from benefit_analyze.dcz_month_4prod_201712 where prod_id='1'
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
    

    
   
    
      select sum(charge_dy_201712) from benefit_analyze.charge_2018_gh;
       
       select * from benefit_analyze.charge_2018_gh;
    
    
    
    select count(serv_id), count(distinct serv_id) from benefit_analyze.pgh_charge_2018_gh;
    
    
    
    
    
    
    
    
    
    