-----------------------�Ƚ�������189���뵽108��ÿ��6-10��֮����֣������ϵ��sql�����滻����Ӧ�·�--------------------

--Studio�е���
drop table if exists benefit_analyze.zyj_qrsr_201807_res;
create table benefit_analyze.zyj_qrsr_201807_res
(   
     ROW_NUM               varchar(2000)
	,SERV_ID_M              varchar(2000)
	,ACC_NBR_M             varchar(2000)
	,PROD_ID                   varchar(2000)
	,CHARGE_����ǰ                    float
	,CHARGE_���ʺ�                    float
	,CHARGE_����                        float
	,CHARGE_SP                           float
	,CHARGE_��������                float
	,CHARGE_��èһ����            float
	,CHARGE_ITVһ����              float
	,CHARGE_��������һ����    float
	,CHARGE_�ֽ�һ����            float   
	,CHARGE_����ǰ��һ���Է���        float
	,SERV_TYPE                            varchar(2000)
	,PROD_TYPE                            varchar(2000)
	,IS_CZ                                       varchar(2000)
	,PROD_TYPE_2                       varchar(2000)
)  distribute by hash (SERV_ID_M);





insert into benefit_analyze.zyj_qrsr_201807_res
select * from AnyDatabase2Aster(
on (select 1) partition by 1
configfile('AnyDatabase2Aster_Sample_Config.conf') 
instance('ora9i') 
username('fsdw') 
password('fsdw2014') 
dbname('ORA9I')
dbtable('(select 
      ROW_NUM               
	,SERV_ID_M            
	,ACC_NBR_M      
	,PROD_ID             
	,CHARGE_����ǰ_˰��                   
	,CHARGE_���ʺ�_˰��               
	,CHARGE_����_˰��                   
	,CHARGE_SP_˰��                          
	,CHARGE_��������_˰��              
	,CHARGE_��èһ����_˰��         
	,CHARGE_ITVһ����_˰��            
	,CHARGE_��������һ����_˰��  
	,CHARGE_�ֽ�һ����_˰��       
	,CHARGE_ת����һ����_˰��    
	,SERV_TYPE                          
	,PROD_TYPE                         
	,IS_CZ                                     
	,PROD_TYPE_2                  
          from luolh.v_zyj_qrsr_201807_v1_res a)tmp') 
workermod('2')
SPLITCOL('1000')
fetchcount('1000') 
);







-------------------------------��sql�е��·����Ϊ��Ӧ�·ݸ���--------------------------------
									
		drop table if exists benefit_analyze.zyj_qrsr_201807_res1;
		create table benefit_analyze.zyj_qrsr_201807_res1 distribute by hash (serv_id_m) as
		select distinct serv_id_m,sum(charge_����) charge_���� from 
		(select t0.serv_id_m,(t0.charge_���ʺ�-t0.charge_����ǰ��һ���Է���-t0.charge_��������) charge_����
		from 
		(select serv_id_m,coalesce(charge_����ǰ��һ���Է���,0) charge_����ǰ��һ���Է���,coalesce(charge_���ʺ�,0) charge_���ʺ�, coalesce(charge_��������,0) charge_��������
		from benefit_analyze.zyj_qrsr_201807_res where prod_id in ('3204','3205')) t0
		) t1
		group by serv_id_m
		;
		
		
		
		drop table if exists benefit_analyze.zyj_qrsr_201807_res2;
		create table benefit_analyze.zyj_qrsr_201807_res2 distribute by hash (serv_id_m) as
		select distinct serv_id_m,sum(charge_����) charge_���� from 
		(select t0.serv_id_m,(t0.charge_���ʺ�-t0.charge_����ǰ��һ���Է���) charge_����
		from 
		(select serv_id_m,coalesce(charge_����ǰ��һ���Է���,0) charge_����ǰ��һ���Է���,coalesce(charge_���ʺ�,0) charge_���ʺ�
		from benefit_analyze.zyj_qrsr_201807_res where prod_id not in ('3204','3205')) t0
		) t1
		group by serv_id_m
		;
		
		
		
		
		drop table if exists benefit_analyze.zyj_qrsr_201807_res_ȥ��;
		create table benefit_analyze.zyj_qrsr_201807_res_ȥ�� distribute by hash (serv_id_m)  as
		select *
		from  benefit_analyze.zyj_qrsr_201807_res1;
		
		insert into benefit_analyze.zyj_qrsr_201807_res_ȥ��
		select * from benefit_analyze.zyj_qrsr_201807_res2;
			