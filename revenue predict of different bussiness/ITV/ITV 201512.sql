	
	
	------------------------------------2015��12�²�����2381 ITV�û�---------------------------------------------
	select * from benefit_analyze.cust_infor_201711 where prod_id='2381';
	
	-----------------------------------��֤�쳣�û��Ĵ���--------------------------------------
	
	select serv_id_m
	,(charge_���ʺ�-(case when charge_����ǰ��һ���Է��� is null then 0 else charge_����ǰ��һ���Է��� end)) as charge_����
	from benefit_analyze.ZYJ_QRSR_201512_res
	where prod_id in ('1004','3816','500000165','500000166') and (charge_���ʺ�-(case when charge_����ǰ��һ���Է��� is null then 0 else charge_����ǰ��һ���Է��� end))>50000;
	
	
	select serv_id_m
	,(charge_���ʺ�-(case when charge_����ǰ��һ���Է��� is null then 0 else charge_����ǰ��һ���Է��� end)) as charge_����
	from benefit_analyze.ZYJ_QRSR_201612_res
	where prod_id in ('1004','3816','500000165','500000166') and (charge_���ʺ�-(case when charge_����ǰ��һ���Է��� is null then 0 else charge_����ǰ��һ���Է��� end))>50000;
	
	
	-------------------------------------��װITV�����������Ѵ���5����û�-------------------------------------------
	
	
	-----------------------------------------�������2015�굽2016��ITV��ʧ��-----------------------------------------------------------
	
	
	---------------------------------------�ײ���һ������û�---------------------------------
	

	(select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201512 
	where limit_date>='2017-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1

	
	
	----------------------------------�ײ���һ���ڵ��û�-------------------------------------
	drop table if exists benefit_analyze.itv_inyear_201512;
	create table benefit_analyze.itv_inyear_201512 distribute by hash (serv_id) 
	as
	select
	distinct b2.serv_id
	from
	(
	select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201512 
	where limit_date<'2017-1-1' and limit_date>='2016-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a2
	) b2
	left join
	(select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201512 
	where limit_date>='2017-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on b2.serv_id=b1.serv_id
	where b1.serv_id is null
	;
	

	
	
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	
	
	------------------------------------------ITV��Ծ�ȿ���-------------------------------------------------
	
     select * from fsdw.dcz_itv_active_201512;
	
	
	


	
	
drop table if exists benefit_analyze.itv_mix_201512;
create table benefit_analyze.itv_mix_201512
(
     serv_id                  					varchar(2000)
	
)  distribute by hash (serv_id);
	
	
	
	
	insert into
	benefit_analyze.itv_mix_201512
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 
	where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('3204','3205')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	
	

	
		insert into
	benefit_analyze.itv_mix_201512
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('47','48','51','52','56','57','950','999','1022','1023',
    '1100','2340','3881','500001200','500001741','500002660')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	

	
	
   	insert into
	benefit_analyze.itv_mix_201512
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201512 where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201512) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
  	
	



	
	
	


		
	---------------------------------15��12�µķ���(�����ڻ�Ծ��¼)--------------------------------------

	select 
/*	case when b5.serv_id is not null then 'ΪЭ��֧���û�'
	             else '��ΪЭ��֧���û�'
	             end as is_xieyi_pay
	 case when b1.serv_id is not null then '������һ��δ����'
	          when b2.serv_id is not null then '������һ�굽��'
	          else '�����û�'
	          end as is_baonian*/
	case when t1.prod_id in ('3816','500000166') then '�㶫IPTVԤ����'
	           when t1.prod_id in ('1004','500000165') then '�㶫IPTV�󸶷�'
	           end as product 
/*	,case when t1.serv_grp_type='01' then '����'
	           when t1.serv_grp_type='02' then '����'
	           end as serv_grp_type
	 ,case when b3.serv_id is not null then '��'
	            else '��'
	            end as is_mix*/
	,case when b6.acc_nbr is not null and b6.login_times=0 then '1'
	             when b6.acc_nbr is not null and b6.login_times<=5 and b6.login_times>0 then '2'
	             when b6.acc_nbr is not null and b6.login_times<=10 and b6.login_times>5 then '3'
	             when b6.acc_nbr is not null and b6.login_times<=30 and b6.login_times>10 then '4'
	             when b6.acc_nbr is not null and b6.login_times>30  then '5'
	             when b6.acc_nbr is null then '�����ڻ�Ծ��¼'
	             end as huoyue_type
	,count( t4.serv_id_m)  as client_201512
	,sum( t4.charge_����) as charge_201512
	,count( t5.serv_id_m)  as client_201612
	,sum( t5.charge_����) as charge_201612
	,cast(count( t5.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun
	,case when sum( t5.charge_����) /sum( t4.charge_����) >=0.95 then '�ȶ�Ⱥ'
	           else '���ȶ�Ⱥ'
	           end as  user_type
	from
	(select *
	from benefit_analyze.cust_infor_201512
	where prod_id in ('1004','3816','500000165','500000166') and state<>'box'
	) t1
	
    -----------------------------------------ѡ����������û�--------------------------------------------
	inner join
	(select * from  benefit_analyze.zyj_qrsr_201512_itv ) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------һ������-------------------------------
	left join
	(select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201512 
	where limit_date>='2017-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	-----------------------------------һ������----------------------------------------
	left join
	(
	select * from benefit_analyze.itv_inyear_201512
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------�Ƿ�����ں�ҵ��---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201512) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV��Ծ�ȿ���-------------------------------------------------
	left join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201512) b6
	on t1.acc_nbr=b6.acc_nbr
	-----------------------------------------���²���Ϊÿ���µ���ʧ���--------------------------
	left join
	(select serv_id_m,charge_����
	from benefit_analyze.zyj_qrsr_201512_itv
	) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m,charge_����
	from benefit_analyze.zyj_qrsr_201612_itv
	) t5
	on t1.serv_id=t5.serv_id_m
	
	where b6.acc_nbr is null
	group by 1,2
	order by 1,2
	;
	
	

	
	
	
	
		---------------------------------15��12�µķ���(�����û�/���ڻ�Ծ��¼)--------------------------------------

	select 
/*	case when b5.serv_id is not null then 'ΪЭ��֧���û�'
	             else '��ΪЭ��֧���û�'
	             end as is_xieyi_pay*/
	 case when b1.serv_id is not null then '�����û�'
	          else '�����û�'
	          end as is_baonian
/*	,case when t1.prod_id in ('3816','500000166') then '�㶫IPTVԤ����'
	           when t1.prod_id in ('1004','500000165') then '�㶫IPTV�󸶷�'
	           end as product */
/*	,case when t1.serv_grp_type='01' then '����'
	           when t1.serv_grp_type='02' then '����'
	           end as serv_grp_type*/
	/* ,case when b3.serv_id is not null then '��'
	            else '��'
	            end as is_mix*/
/*	  ,case when b6.acc_nbr is not null and b6.login_times=0 then '1'
	             when b6.acc_nbr is not null and b6.login_times<=5 and b6.login_times>0 then '2'
	             when b6.acc_nbr is not null and b6.login_times<=10 and b6.login_times>5 then '3'
	             when b6.acc_nbr is not null and b6.login_times<=30 and b6.login_times>10 then '4'
	             when b6.acc_nbr is not null and b6.login_times>30  then '5'
	             when b6.acc_nbr is null then '�����ڻ�Ծ��¼'
	             end as huoyue_type*/
	,count( t4.serv_id_m)  as client_201512
	,sum( t4.charge_����) as charge_201512
	,count( t5.serv_id_m)  as client_201612
	,sum( t5.charge_����) as charge_201612
	,cast(count( t5.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun
	,case when sum( t5.charge_����) /sum( t4.charge_����) >=0.95 then '�ȶ�Ⱥ'
	           else '���ȶ�Ⱥ'
	           end as  user_type
	from
	(select *
	from benefit_analyze.cust_infor_201512
	where prod_id in ('1004','3816','500000165','500000166') and state<>'box'
	) t1
	
    -----------------------------------------ѡ����������û�--------------------------------------------
	inner join
	(select * from  benefit_analyze.zyj_qrsr_201512_itv ) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------һ������-------------------------------
	inner join
	(select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201512 
	where limit_date>='2017-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	-----------------------------------һ������----------------------------------------
	left join
	(
	select * from benefit_analyze.itv_inyear_201512
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------�Ƿ�����ں�ҵ��---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201512) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV��Ծ�ȿ���-------------------------------------------------
	inner join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201512) b6
	on t1.acc_nbr=b6.acc_nbr
	-----------------------------------------���²���Ϊÿ���µ���ʧ���--------------------------
	left join
	(select serv_id_m,charge_����
	from benefit_analyze.zyj_qrsr_201512_itv
	) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m,charge_����
	from benefit_analyze.zyj_qrsr_201612_itv
	) t5
	on t1.serv_id=t5.serv_id_m
	

	group by 1
	order by 1
	;
	
	
	
	
	
	
	
	
	
		---------------------------------15��12�µķ���(����һ�굽���û�/���ڻ�Ծ��¼)--------------------------------------

	select 
/*	case when b5.serv_id is not null then 'ΪЭ��֧���û�'
	             else '��ΪЭ��֧���û�'
	             end as is_xieyi_pay*/
	 case when b2.serv_id is not null then '���굽���û�'
	          else '�����û�'
	          end as is_baonian
	,case when t1.prod_id in ('3816','500000166') then '�㶫IPTVԤ����'
	           when t1.prod_id in ('1004','500000165') then '�㶫IPTV�󸶷�'
	           end as product 
/*	,case when t1.serv_grp_type='01' then '����'
	           when t1.serv_grp_type='02' then '����'
	           end as serv_grp_type*/
	 ,case when b3.serv_id is not null then '��'
	            else '��'
	            end as is_mix
	  ,case when b6.acc_nbr is not null and b6.login_times<=5 and b6.login_times>=0 then '1'
	             when b6.acc_nbr is not null and b6.login_times<=30 and b6.login_times>5 then '2'
	             when b6.acc_nbr is not null and b6.login_times>30  then '3'
	             when b6.acc_nbr is null then '�����ڻ�Ծ��¼'
	             end as huoyue_type
	,count( t4.serv_id_m)  as client_201512
	,sum( t4.charge_����) as charge_201512
	,count( t5.serv_id_m)  as client_201612
	,sum( t5.charge_����) as charge_201612
	,cast(count( t5.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun
	,case when sum( t5.charge_����) /sum( t4.charge_����) >=0.95 then '�ȶ�Ⱥ'
	           else '���ȶ�Ⱥ'
	           end as  user_type
	from
	(select *
	from benefit_analyze.cust_infor_201512
	where prod_id in ('1004','3816','500000165','500000166') and state<>'box'
	) t1
	
    -----------------------------------------ѡ����������û�--------------------------------------------
	inner join
	(select * from  benefit_analyze.zyj_qrsr_201512_itv ) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------һ������-------------------------------
	left join
	(select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201512 
	where limit_date>='2017-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	-----------------------------------һ������----------------------------------------
	inner join
	(
	select * from benefit_analyze.itv_inyear_201512
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------�Ƿ�����ں�ҵ��---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201512) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV��Ծ�ȿ���-------------------------------------------------
	inner join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201512) b6
	on t1.acc_nbr=b6.acc_nbr
	-----------------------------------------���²���Ϊÿ���µ���ʧ���--------------------------
	left join
	(select serv_id_m,charge_����
	from benefit_analyze.zyj_qrsr_201512_itv
	) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m,charge_����
	from benefit_analyze.zyj_qrsr_201612_itv
	) t5
	on t1.serv_id=t5.serv_id_m
	

/*	where b6.acc_nbr is null*/
	group by 1,2,3,4
	order by 1,2,3,4
	;
	
	
	
	
	
	
	
	
			---------------------------------15��12�µķ���(�����û�/���ڻ�Ծ��¼)--------------------------------------

	select 
/*	case when b5.serv_id is not null then 'ΪЭ��֧���û�'
	             else '��ΪЭ��֧���û�'
	             end as is_xieyi_pay*/
	 case when b1.serv_id is not null then '�����û�'
	 			when b2.serv_id is not null then '���굽���û�'
	          else '�����û�'
	          end as is_baonian
	,case when t1.prod_id in ('3816','500000166') then '�㶫IPTVԤ����'
	           when t1.prod_id in ('1004','500000165') then '�㶫IPTV�󸶷�'
	           end as product 
/*	,case when t1.serv_grp_type='01' then '����'
	           when t1.serv_grp_type='02' then '����'
	           end as serv_grp_type*/
	 ,case when b3.serv_id is not null then '��'
	            else '��'
	            end as is_mix
	  ,case when b6.acc_nbr is not null and b6.login_times<=5 and b6.login_times>=0 then '1'
	             when b6.acc_nbr is not null and b6.login_times<=30 and b6.login_times>5 then '2'
	             when b6.acc_nbr is not null and b6.login_times>30  then '3'
	             when b6.acc_nbr is null then '�����ڻ�Ծ��¼'
	             end as huoyue_type
	,count( t4.serv_id_m)  as client_201512
	,sum( t4.charge_����) as charge_201512
	,count( t5.serv_id_m)  as client_201612
	,sum( t5.charge_����) as charge_201612
	,cast(count( t5.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun
	,case when sum( t5.charge_����) /sum( t4.charge_����) >=0.95 then '�ȶ�Ⱥ'
	           else '���ȶ�Ⱥ'
	           end as  user_type
	from
	(select *
	from benefit_analyze.cust_infor_201512
	where prod_id in ('1004','3816','500000165','500000166') and state<>'box'
	) t1
	
    -----------------------------------------ѡ����������û�--------------------------------------------
	inner join
	(select * from  benefit_analyze.zyj_qrsr_201512_itv ) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------һ������-------------------------------
	left join
	(select
	distinct  serv_id
	from
	(select
	t1.serv_id
	,t1.prod_offer_name
	,t1.msinfo_open_date
	,t1.limit_date
	from
	(select * from benefit_analyze.dcz_itv_prod_offer_201512 
	where limit_date>='2017-1-1') t1
	inner join
	(select * from benefit_analyze.dcz_config_kd_bn_prod_offer) t2 
	on t1.prod_offer_code=t2.prod_offer_code
	order by 1
	) a1 
	) b1
	on t1.serv_id=b1.serv_id
	
	-----------------------------------һ������----------------------------------------
	left join
	(
	select * from benefit_analyze.itv_inyear_201512
	) b2
	on t1.serv_id=b2.serv_id
	----------------------------------------�Ƿ�����ں�ҵ��---------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.itv_mix_201512) t) b3
    on t1.serv_id=b3.serv_id
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b5
	on t1.serv_id=b5.serv_id
    ------------------------------------------ITV��Ծ�ȿ���-------------------------------------------------
	inner join
	(select acc_nbr, (case when login_times is null then 0 else login_times end) as login_times from benefit_analyze.dcz_itv_active_201512) b6
	on t1.acc_nbr=b6.acc_nbr
	-----------------------------------------���²���Ϊÿ���µ���ʧ���--------------------------
	left join
	(select serv_id_m,charge_����
	from benefit_analyze.zyj_qrsr_201512_itv
	) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m,charge_����
	from benefit_analyze.zyj_qrsr_201612_itv
	) t5
	on t1.serv_id=t5.serv_id_m
	
	where b1.serv_id is null and b2.serv_id is null
	group by 1,2,3,4
	order by 1,2,3,4
	;
	
	
	
	
	