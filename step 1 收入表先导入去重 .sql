-----------------------先将收入表从189导入到108，每月6-10号之间与郑永进联系，sql代码替换到相应月份--------------------

--Studio中导入
drop table if exists benefit_analyze.zyj_qrsr_201807_res;
create table benefit_analyze.zyj_qrsr_201807_res
(   
     ROW_NUM               varchar(2000)
	,SERV_ID_M              varchar(2000)
	,ACC_NBR_M             varchar(2000)
	,PROD_ID                   varchar(2000)
	,CHARGE_公允前                    float
	,CHARGE_公允后                    float
	,CHARGE_调账                        float
	,CHARGE_SP                           float
	,CHARGE_后向流量                float
	,CHARGE_光猫一次性            float
	,CHARGE_ITV一次性              float
	,CHARGE_智能组网一次性    float
	,CHARGE_现金一次性            float   
	,CHARGE_公允前的一次性费用        float
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
	,CHARGE_公允前_税后                   
	,CHARGE_公允后_税后               
	,CHARGE_调账_税后                   
	,CHARGE_SP_税后                          
	,CHARGE_后向流量_税后              
	,CHARGE_光猫一次性_税后         
	,CHARGE_ITV一次性_税后            
	,CHARGE_智能组网一次性_税后  
	,CHARGE_现金一次性_税后       
	,CHARGE_转账务一次性_税后    
	,SERV_TYPE                          
	,PROD_TYPE                         
	,IS_CZ                                     
	,PROD_TYPE_2                  
          from luolh.v_zyj_qrsr_201807_v1_res a)tmp') 
workermod('2')
SPLITCOL('1000')
fetchcount('1000') 
);







-------------------------------将sql中的月份替代为相应月份更新--------------------------------
									
		drop table if exists benefit_analyze.zyj_qrsr_201807_res1;
		create table benefit_analyze.zyj_qrsr_201807_res1 distribute by hash (serv_id_m) as
		select distinct serv_id_m,sum(charge_费用) charge_费用 from 
		(select t0.serv_id_m,(t0.charge_公允后-t0.charge_公允前的一次性费用-t0.charge_后向流量) charge_费用
		from 
		(select serv_id_m,coalesce(charge_公允前的一次性费用,0) charge_公允前的一次性费用,coalesce(charge_公允后,0) charge_公允后, coalesce(charge_后向流量,0) charge_后向流量
		from benefit_analyze.zyj_qrsr_201807_res where prod_id in ('3204','3205')) t0
		) t1
		group by serv_id_m
		;
		
		
		
		drop table if exists benefit_analyze.zyj_qrsr_201807_res2;
		create table benefit_analyze.zyj_qrsr_201807_res2 distribute by hash (serv_id_m) as
		select distinct serv_id_m,sum(charge_费用) charge_费用 from 
		(select t0.serv_id_m,(t0.charge_公允后-t0.charge_公允前的一次性费用) charge_费用
		from 
		(select serv_id_m,coalesce(charge_公允前的一次性费用,0) charge_公允前的一次性费用,coalesce(charge_公允后,0) charge_公允后
		from benefit_analyze.zyj_qrsr_201807_res where prod_id not in ('3204','3205')) t0
		) t1
		group by serv_id_m
		;
		
		
		
		
		drop table if exists benefit_analyze.zyj_qrsr_201807_res_去重;
		create table benefit_analyze.zyj_qrsr_201807_res_去重 distribute by hash (serv_id_m)  as
		select *
		from  benefit_analyze.zyj_qrsr_201807_res1;
		
		insert into benefit_analyze.zyj_qrsr_201807_res_去重
		select * from benefit_analyze.zyj_qrsr_201807_res2;
			