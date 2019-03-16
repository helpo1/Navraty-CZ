
instance DIA_SKELETONMAGE_SENDSENYAK_3_EXIT(C_Info)
{
	npc = skeletonmage_sendsenyak_3;
	nr = 999;
	condition = dia_skeletonmage_sendsenyak_3_exit_condition;
	information = dia_skeletonmage_sendsenyak_3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_skeletonmage_sendsenyak_3_exit_condition()
{
	return TRUE;
};

func void dia_skeletonmage_sendsenyak_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SKELETONMAGE_SENDSENYAK_3_HELLO(C_Info)
{
	npc = skeletonmage_sendsenyak_3;
	nr = 1;
	condition = dia_skeletonmage_sendsenyak_3_hello_condition;
	information = dia_skeletonmage_sendsenyak_3_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_skeletonmage_sendsenyak_3_hello_condition()
{
	if(GIVESBWSENYAK == FALSE)
	{
		return TRUE;
	};
};

func void dia_skeletonmage_sendsenyak_3_hello_info()
{
	var int random;
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	random = Hlp_Random(3);
	if(random == 0)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//...СМЕРТНЫЙ!!!...(мертвым голосом)
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_01");	//У ТЕБЯ ЕСТЬ ТО, ЧТО ПРИНАДЛЕЖИТ НАШЕМУ ГОСПОДИНУ!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_02");	//ОТДАЙ МНЕ КОГОТЬ БЕЛИАРА, И Я СОХРАНЮ ТЕБЕ ЖИЗНЬ...
	}
	else if(random == 1)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//...СМЕРТНЫЙ!!!...(мертвым голосом)
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_04");	//МОЙ ГОСПОДИН ХОЧЕТ ПОЛУЧИТЬ ОБРАТНО КОГОТЬ БЕЛИАРА - ЭТОТ МЕЧ ПО ПРАВУ ПРИНАДЛЕЖИТ ТОЛЬКО ЕМУ!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_05");	//ОТДАЙ МНЕ ЕГО, И ТЫ ОСТАНЕШЬСЯ ЖИТЬ...
	}
	else if(random == 2)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//...СМЕРТНЫЙ!!!...(мертвым голосом)
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_07");	//ТЫ ДОЛЖЕН ОТДАТЬ НАМ КОГОТЬ БЕЛИАРА! ОН ОЧЕНЬ НУЖЕН НАШЕМУ ГОСПОДИНУ!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_08");	//СДЕЛАЙ ЭТО, И МЫ НЕ ТРОНЕМ ТЕБЯ...(мертвым голосом)
	}
	else if(random == 3)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//...СМЕРТНЫЙ!!!...(мертвым голосом)
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_10");	//ТЫ ОСМЕЛИЛСЯ ОБЛАДАТЬ ТЕМ, НА ЧТО У ТЕБЯ НЕ ХВАТИТ СИЛ И МОГУЩЕСТВА!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_11");	//КОГОТЬ БЕЛИАРА ПРИНАДЛЕЖИТ МОЕМУ ГСПОДИНУ И ТОЛЬКО ЕМУ!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_12");	//ОТДАЙ ЕМУ ЭТОТ МЕЧ...(мертвым голосом)
	};
	Info_ClearChoices(dia_skeletonmage_sendsenyak_3_hello);
	Info_AddChoice(dia_skeletonmage_sendsenyak_3_hello,"Забудьте об этом!",dia_skeletonmage_sendsenyak_3_hello_no);
	Info_AddChoice(dia_skeletonmage_sendsenyak_3_hello,"Хорошо! Коготь ваш...",dia_skeletonmage_sendsenyak_3_hello_ok);
};

func void dia_skeletonmage_sendsenyak_3_hello_no()
{
	AI_Output(other,self,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_00");	//Забудьте об этом...
	AI_Output(other,self,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_01");	//Ваш хозяин от меня ничего не получит!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_02");	//ТОГДА ТЫ УМРЕШЬ, СМЕРТНЫЙ!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_03");	//СЕЙЧАС ТЫ ОЩУТИШЬ СИЛУ НАШЕГО ГОСПОДИНА! И ТЫ НЕ СМОЖЕШЬ УБЕЖАТЬ ОТ НЕЕ...(мертвым голосом)
	Info_ClearChoices(dia_skeletonmage_sendsenyak_3_hello);
	Info_AddChoice(dia_skeletonmage_sendsenyak_3_hello,"...",dia_skeletonmage_sendsenyak_3_hello_ex1);
};

func void dia_skeletonmage_sendsenyak_3_hello_ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_00");	//Хорошо! Коготь ваш...
	B_ClearBeliarsWeapon();
	CreateInvItems(hero,ItMw_BeliarWeapon_Raven,1);
	B_GiveInvItems(other,self,ItMw_BeliarWeapon_Raven,1);
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_01");	//ТЫ СДЕЛАЛ ПРАВИЛЬНЫЙ ВЫБОР, СМЕРТНЫЙ!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_02");	//МОЙ ГОСПОДИН БУДЕТ ДОВОЛЕН...(мертвым голосом)
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_03");	//С ПОМОЩЬЮ ЭТОГО МЕЧА ОН ОБРЕТЕТ ВОИСТИНУ БОЖЕСТВЕННОЕ ВЕЛИЧИЕ...
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_04");	//...И С ЛЕГКОСТЬЮ ЗАВЕРШИТ ЗАМЫСЕЛ СВОЕГО ТВОРЦА!
	Info_ClearChoices(dia_skeletonmage_sendsenyak_3_hello);
	Info_AddChoice(dia_skeletonmage_sendsenyak_3_hello,"...(что я наделал?!)",dia_skeletonmage_sendsenyak_3_hello_ex2);
};

func void dia_skeletonmage_sendsenyak_3_hello_ex1()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = ZS_MM_AllScheduler;
	self.aivar[AIV_EnemyOverride] = FALSE;
	snzombie1.aivar[AIV_EnemyOverride] = FALSE;
	snzombie2.aivar[AIV_EnemyOverride] = FALSE;
	snzombie4.aivar[AIV_EnemyOverride] = FALSE;
	snzombie3.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_skeletonmage_sendsenyak_3_hello_ex2()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = zs_mm_rtn_demonrest;
	snzombie1.start_aistate = zs_mm_rtn_demonrest;
	snzombie2.start_aistate = zs_mm_rtn_demonrest;
	snzombie3.start_aistate = zs_mm_rtn_demonrest;
	snzombie4.start_aistate = zs_mm_rtn_demonrest;
	GIVESBWSENYAK = TRUE;
};

