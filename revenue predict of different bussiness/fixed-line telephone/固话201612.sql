-------------------------------------------------�������2016�굽2017��̻���ʧ��-----------------------------------------------------------
	
--------------------------------------------------------------���ں͹���ͨ��ʱ��--------------------------------------------------------------------------------

	(select * from bcust_data.ccust_guhua_records_201612) b1
	
	---------------------------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------------------------
	(select * from benefit_analyze.dcz_tmp_contract_pay_list ) b2
	
	----------------------------------------------------------------2016��12�³�Ĭ�û�----------------------------------------------------------
    --------------------------------------------------------------�̻���3����ͨ��ʱ��-----------------------------------------------------------


drop table if exists benefit_analyze.guhua_cm_201612;
create table benefit_analyze.guhua_cm_201612 (
acc_nbr varchar(100)
,tot_thsc varchar(100)
)distribute by hash (acc_nbr)
;



insert into benefit_analyze.guhua_cm_201612
select t1.acc_nbr,t1.tot_thsc from
(select
             acc_nbr,bd_all_thsc,gn_thsc,gat_thsc,gj_thsc
            ,(bd_all_thsc+gn_thsc+gj_thsc+gat_thsc) as tot_thsc
from bcust_data.ccust_guhua_records_201612) t1
inner join
(select 
            acc_nbr,bd_all_thsc,gn_thsc,gat_thsc,gj_thsc
            ,(bd_all_thsc+gn_thsc+gj_thsc+gat_thsc) as tot_thsc
from bcust_data.ccust_guhua_records_201611) t2
on t1.acc_nbr=t2.acc_nbr
inner join
(select 
            acc_nbr,bd_all_thsc,gn_thsc,gat_thsc,gj_thsc
            ,(bd_all_thsc+gn_thsc+gj_thsc+gat_thsc) as tot_thsc
from bcust_data.ccust_guhua_records_201610) t3
on t1.acc_nbr=t3.acc_nbr
where (t1.tot_thsc=0 or t1.tot_thsc is null) and (t2.tot_thsc=0 or t2.tot_thsc is null ) and (t3.tot_thsc=0 or  t3.tot_thsc is null) 
;


	

	
	
drop table if exists benefit_analyze.gh_mix_201612;
create table benefit_analyze.gh_mix_201612
(
     serv_id                  					varchar(2000)
	
)  distribute by hash (serv_id);
	
	
	
	
	insert into
	benefit_analyze.gh_mix_201612
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 
	where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('3204','3205')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	
	

	
		insert into
	benefit_analyze.gh_mix_201612
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('47','48','51','52','56','57','950','999','1022','1023',
    '1100','2340','3881','500001200','500001741','500002660')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
	

	
	
   	insert into
	benefit_analyze.gh_mix_201612
	select distinct t1.serv_id
    from
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('1','2','3','4','6','13')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id  
	) t1
	inner join
	(
	select t1.serv_id,t2.msinfo_id
	from
	(select serv_id from benefit_analyze.cust_infor_201612 where prod_id in ('1004','3816','500000165','500000166')) t1
	inner join
	-----------------------------------------���ó������ʷ��ײ�-------------------------------------------------
	(select t1.serv_id, t1.msinfo_id
    from	
    (select * from	benefit_analyze.dcz_tzz_td_msinfo_serv_201612) t1
   inner join
   (select * from benefit_analyze.dcz_v_�����ʷ��ײ����ñ�) t2
    on t1.prod_offer_id=t2.prod_offer_id) t2
	on t1.serv_id=t2.serv_id
	) t2
	on t1.msinfo_id=t2.msinfo_id
	;
  

---------------------------------16��12�µķ���(��Ĭ�û�)--------------------------------------

	select 
/*	case when b2.serv_id is not null then 'ΪЭ��֧���û�'
	             else '��ΪЭ��֧���û�'
	             end as is_xieyi_pay*/
	 case when b4.acc_nbr is not null then '��'
	            else '��'
	            end as is_cm
	,case when t1.prod_id=13 then '����Ԥ����'
	           when t1.prod_id=1 then '�ջ��󸶷�'
	           when t1.prod_id=3 then 'CENTREX�󸶷�'
	           else  '�����󸶷�'
	           end as product
/*	,case when t1.serv_grp_type='01' then '����'
	           when t1.serv_grp_type='02' then '����'
	           end as serv_grp_type
	 ,case when b1.serv_id is not null then '��'
	            else '��'
	            end as is_mix*/
	  ,case when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<50 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=50 then '3'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500 then '4'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000 then '5'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000 then '6'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then'7'
	             when b3.acc_nbr is null then '������������¼'
	             end as tonghua
	,count( t4.serv_id_m)  as client_201612
	,sum( t4.charge_����) as charge_201612
	,count( t16.serv_id_m)  as client_201712
	,sum( t16.charge_����) as charge_201712
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_����) /sum( t4.charge_����) >=0.95 then '�ȶ�Ⱥ'
	           else '���ȶ�Ⱥ'
	           end as  user_type         
	from
	(select *
	from benefit_analyze.cust_infor_201612
	where prod_id in ('1','2','3','4','6','13') and state<>'box'
	) t1
	-----------------------------------------ѡ����������û�--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201612_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------�Ƿ�����ں�ҵ��---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201612) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------�̻��û����ں͹���ͨ��ʱ�俼��------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201612) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------�Ƿ�Ϊ��Ĭ�û�----------------------------------------------------
    inner join
    (select * from benefit_analyze.guhua_cm_201612) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------���²���Ϊÿ���µ���ʧ���--------------------------
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201612_gh) t4
	on t1.serv_id=t4.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201701_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201702_gh) t6
	on t1.serv_id=t6.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201703_gh) t7
	on t1.serv_id=t7.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201704_gh) t8
	on t1.serv_id=t8.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201705_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201706_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201707_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201708_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201709_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201710_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201711_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201712_gh) t16
	on t1.serv_id=t16.serv_id_m
	
/*	where b4.acc_nbr is null*/
	group by 1,2,3
	order by 1,2,3
	;

	

	


		
	---------------------------------16��12�µķ���(������)(prod_idΪ1���û�)--------------------------------------

	select 
/*	case when b2.serv_id is not null then 'ΪЭ��֧���û�'
	             else '��ΪЭ��֧���û�'
	             end as is_xieyi_pay*/
	 case when b4.acc_nbr is not null then '��'
	            else '��'
	            end as is_cm
	,case when t1.prod_id=13 then '����Ԥ����'
	           when t1.prod_id=1 then '�ջ��󸶷�'
	           when t1.prod_id=3 then 'CENTREX�󸶷�'
	           else  '�����󸶷�'
	           end as product
/*	,case when t1.serv_grp_type='01' then '����'
	           when t1.serv_grp_type='02' then '����'
	           end as serv_grp_type*/
	 ,case when b1.serv_id is not null then '��'
	            else '��'
	            end as is_mix
	  ,case when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500 then '3'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000 then '4'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000 then '5'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then'6'
	             when b3.acc_nbr is null then '������������¼'
	             end as tonghua
	,count( t4.serv_id_m)  as client_201612
	,sum( t4.charge_����) as charge_201612
	,count( t16.serv_id_m)  as client_201712
	,sum( t16.charge_����) as charge_201712
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_����) /sum( t4.charge_����) >=0.95 then '�ȶ�Ⱥ'
	           else '���ȶ�Ⱥ'
	           end as  user_type         
	from
	(select *
	from benefit_analyze.cust_infor_201612
	where prod_id in ('1') and state<>'box'
	) t1
	-----------------------------------------ѡ����������û�--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201612_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------�Ƿ�����ں�ҵ��---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201612) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------�̻��û����ں͹���ͨ��ʱ�俼��------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201612) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------�Ƿ�Ϊ��Ĭ�û�----------------------------------------------------
    left join
    (select * from benefit_analyze.guhua_cm_201612) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------���²���Ϊÿ���µ���ʧ���--------------------------
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201612_gh) t4
	on t1.serv_id=t4.serv_id_m
left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201701_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201702_gh) t6
	on t1.serv_id=t6.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201703_gh) t7
	on t1.serv_id=t7.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201704_gh) t8
	on t1.serv_id=t8.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201705_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201706_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201707_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201708_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201709_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201710_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201711_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201712_gh) t16
	on t1.serv_id=t16.serv_id_m


	where b4.acc_nbr is null
	group by 1,2,3,4
	order by 1,2,3,4
	;
	  

	  
	  	---------------------------------16��12�µķ���(������)(prod_idΪ3���û�)--------------------------------------

	select 
/*	case when b2.serv_id is not null then 'ΪЭ��֧���û�'
	             else '��ΪЭ��֧���û�'
	             end as is_xieyi_pay*/
	 case when b4.acc_nbr is not null then '��'
	            else '��'
	            end as is_cm
	,case when t1.prod_id=13 then '����Ԥ����'
	           when t1.prod_id=1 then '�ջ��󸶷�'
	           when t1.prod_id=3 then 'CENTREX�󸶷�'
	           else  '�����󸶷�'
	           end as product
/*	,case when t1.serv_grp_type='01' then '����'
	           when t1.serv_grp_type='02' then '����'
	           end as serv_grp_type*/
	 ,case when b1.serv_id is not null then '��'
	            else '��'
	            end as is_mix
	  ,case when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000 then '3'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000 then '4'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then'5'
	             when b3.acc_nbr is null then '������������¼'
	             end as tonghua
	,count( t4.serv_id_m)  as client_201612
	,sum( t4.charge_����) as charge_201612
	,count( t16.serv_id_m)  as client_201712
	,sum( t16.charge_����) as charge_201712
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_����) /sum( t4.charge_����) >=0.95 then '�ȶ�Ⱥ'
	           else '���ȶ�Ⱥ'
	           end as  user_type        
	from
	(select *
	from benefit_analyze.cust_infor_201612
	where prod_id in ('3') and state<>'box'
	) t1
	-----------------------------------------ѡ����������û�--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201612_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------�Ƿ�����ں�ҵ��---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201612) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------�̻��û����ں͹���ͨ��ʱ�俼��------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201612) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------�Ƿ�Ϊ��Ĭ�û�----------------------------------------------------
    left join
    (select * from benefit_analyze.guhua_cm_201612) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------���²���Ϊÿ���µ���ʧ���--------------------------
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201612_gh) t4
	on t1.serv_id=t4.serv_id_m
left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201701_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201702_gh) t6
	on t1.serv_id=t6.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201703_gh) t7
	on t1.serv_id=t7.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201704_gh) t8
	on t1.serv_id=t8.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201705_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201706_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201707_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201708_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201709_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201710_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201711_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201712_gh) t16
	on t1.serv_id=t16.serv_id_m


	
	where b4.acc_nbr is null
	group by 1,2,3,4
	order by 1,2,3,4
	;
	  
	  
	  
	  
	  
	---------------------------------16��12�µķ���(������)(prod_idΪ13���û�)--------------------------------------

	select 
/*	case when b2.serv_id is not null then 'ΪЭ��֧���û�'
	             else '��ΪЭ��֧���û�'
	             end as is_xieyi_pay*/
	 case when b4.acc_nbr is not null then '��'
	            else '��'
	            end as is_cm
	,case when t1.prod_id=13 then '����Ԥ����'
	           when t1.prod_id=1 then '�ջ��󸶷�'
	           when t1.prod_id=3 then 'CENTREX�󸶷�'
	           else  '�����󸶷�'
	           end as product
/*	,case when t1.serv_grp_type='01' then '����'
	           when t1.serv_grp_type='02' then '����'
	           end as serv_grp_type*/
	 ,case when b1.serv_id is not null then '��'
	            else '��'
	            end as is_mix
	  ,case when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500 then '3'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000 then '4'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then'5'
	             when b3.acc_nbr is null then '������������¼'
	             end as tonghua
	,count( t4.serv_id_m)  as client_201612
	,sum( t4.charge_����) as charge_201612
	,count( t16.serv_id_m)  as client_201712
	,sum( t16.charge_����) as charge_201712
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_����) /sum( t4.charge_����) >=0.95 then '�ȶ�Ⱥ'
	           else '���ȶ�Ⱥ'
	           end as  user_type       
	from
	(select *
	from benefit_analyze.cust_infor_201612
	where prod_id in ('13') and state<>'box'
	) t1
	-----------------------------------------ѡ����������û�--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201612_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------�Ƿ�����ں�ҵ��---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201612) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------�̻��û����ں͹���ͨ��ʱ�俼��------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201612) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------�Ƿ�Ϊ��Ĭ�û�----------------------------------------------------
    left join
    (select * from benefit_analyze.guhua_cm_201612) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------���²���Ϊÿ���µ���ʧ���--------------------------
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201612_gh) t4
	on t1.serv_id=t4.serv_id_m
left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201701_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201702_gh) t6
	on t1.serv_id=t6.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201703_gh) t7
	on t1.serv_id=t7.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201704_gh) t8
	on t1.serv_id=t8.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201705_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201706_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201707_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201708_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201709_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201710_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201711_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201712_gh) t16
	on t1.serv_id=t16.serv_id_m
	
	where b4.acc_nbr is null
	group by 1,2,3,4
	order by 1,2,3,4
	;
	  
	  
	  
	  
	  
	  
	  
	 		
	---------------------------------16��12�µķ���(������)(prod_idΪ2,4,6���û�)--------------------------------------

	select 
/*	case when b2.serv_id is not null then 'ΪЭ��֧���û�'
	             else '��ΪЭ��֧���û�'
	             end as is_xieyi_pay*/
/*	 case when b4.acc_nbr is not null then '��'
	            else '��'
	            end as is_cm*/
     case when t1.prod_id=13 then '����Ԥ����'
	           when t1.prod_id=1 then '�ջ��󸶷�'
	           when t1.prod_id=3 then 'CENTREX�󸶷�'
	           else  '�����󸶷�'
	           end as product
/*	,case when t1.serv_grp_type='01' then '����'
	           when t1.serv_grp_type='02' then '����'
	           end as serv_grp_type
	 ,case when b1.serv_id is not null then '��'
	            else '��'
	            end as is_mix
	  ,case when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)=0 then '1'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<50 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>0 then '2'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<500 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=50 then '3'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<1000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=500 then '4'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<2000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=1000 then '5'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)<4000 and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=2000 then '6'
	             when b3.acc_nbr is not null and (b3.gn_thsc+b3.gat_thsc+b3.gj_thsc)>=4000 then'7'
	             when b3.acc_nbr is null then '������������¼'
	             end as tonghua*/
	,count( t4.serv_id_m)  as client_201612
	,sum( t4.charge_����) as charge_201612
	,count( t16.serv_id_m)  as client_201712
	,sum( t16.charge_����) as charge_201712
	,cast(count( t16.serv_id_m) /count( t4.serv_id_m) as numeric(8,6)) as kh_baocun
	,cast(sum( t5.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201601
	,cast(sum( t6.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201602
	,cast(sum( t7.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201603
	,cast(sum( t8.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201604
	,cast(sum( t9.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201605
	,cast(sum( t10.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201606
	,cast(sum( t11.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201607
	,cast(sum( t12.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201608
	,cast(sum( t13.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201609
	,cast(sum( t14.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201610
	,cast(sum( t15.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201611
	,cast(sum( t16.charge_����) /sum( t4.charge_����) as numeric(8,6)) as sr_baocun_201612
	,case when sum( t16.charge_����) /sum( t4.charge_����) >=0.95 then '�ȶ�Ⱥ'
	           else '���ȶ�Ⱥ'
	           end as  user_type        
	from
	(select *
	from benefit_analyze.cust_infor_201612
	where prod_id in ('2','4','6') and state<>'box'
	) t1
	-----------------------------------------ѡ����������û�--------------------------------------------
	inner join
	(select * from benefit_analyze.zyj_qrsr_201612_gh) t2
	on t1.serv_id=t2.serv_id_m
	
	----------------------------------------�Ƿ�����ں�ҵ��---------------------------------------------
	left join
	(select t.serv_id from (select distinct serv_id from benefit_analyze.gh_mix_201612) t) b1
    on t1.serv_id=b1.serv_id
	------------------------------------------�Ƿ�Э��֧���û�-------------------------------------------
	left join
	(select distinct serv_id from benefit_analyze.dcz_tmp_contract_pay_list) b2
	on t1.serv_id=b2.serv_id
    ------------------------------------------�̻��û����ں͹���ͨ��ʱ�俼��------------------------------------
    left join
    (select * from bcust_data.ccust_guhua_records_201612) b3
    on t1.acc_nbr=b3.acc_nbr
    ---------------------------------------------�Ƿ�Ϊ��Ĭ�û�----------------------------------------------------
    left join
    (select * from benefit_analyze.guhua_cm_201612) b4
    on t1.acc_nbr=b4.acc_nbr
    
	-------------------------------------------���²���Ϊÿ���µ���ʧ���--------------------------
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201612_gh) t4
	on t1.serv_id=t4.serv_id_m
left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201701_gh) t5
	on t1.serv_id=t5.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201702_gh) t6
	on t1.serv_id=t6.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201703_gh) t7
	on t1.serv_id=t7.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201704_gh) t8
	on t1.serv_id=t8.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201705_gh) t9
	on t1.serv_id=t9.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201706_gh) t10
	on t1.serv_id=t10.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201707_gh) t11
	on t1.serv_id=t11.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201708_gh) t12
	on t1.serv_id=t12.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201709_gh) t13
	on t1.serv_id=t13.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201710_gh) t14
	on t1.serv_id=t14.serv_id_m
		left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201711_gh) t15
	on t1.serv_id=t15.serv_id_m
	left join
	(select serv_id_m ,charge_����
	from benefit_analyze.zyj_qrsr_201712_gh) t16
	on t1.serv_id=t16.serv_id_m


	
	where b4.acc_nbr is null
	group by 1
	order by 1
	;
	  
