
instance DIA_DEMON_SENDSENYAK_EXIT(C_Info)
{
	npc = demon_sendsenyak;
	nr = 999;
	condition = dia_demon_sendsenyak_exit_condition;
	information = dia_demon_sendsenyak_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_demon_sendsenyak_exit_condition()
{
	return TRUE;
};

func void dia_demon_sendsenyak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEMON_SENDSENYAK_HELLO(C_Info)
{
	npc = demon_sendsenyak;
	nr = 1;
	condition = dia_demon_sendsenyak_hello_condition;
	information = dia_demon_sendsenyak_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_demon_sendsenyak_hello_condition()
{
	if(GIVESBWSENYAK == FALSE)
	{
		return TRUE;
	};
};

func void dia_demon_sendsenyak_hello_info()
{
	var int random;
	random = Hlp_Random(3);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	//Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN01");
	if(random == 0)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//(мертвым голосом) Смертный!..
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_01");	//У тебя есть то, что принадлежит нашему господину!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_02");	//Отдай мне Коготь Белиара, и я сохраню тебе жизнь!
	}
	else if(random == 1)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//(мертвым голосом) Смертный!..
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_04");	//Мой господин хочет получить обратно Коготь Белиара - этот меч по праву принадлежит только ему!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_05");	//Отдай его мне - и ты останешься жить...
	}
	else if(random == 2)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//(мертвым голосом) Смертный!..
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_07");	//Ты должен отдать нам Коготь Белиара! Он очень нужен нашему господину!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_08");	//Сделай это - и мы не тронем тебя...
	}
	else if(random == 3)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//(мертвым голосом) Смертный!..
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_10");	//Ты осмелился обладать тем, на что у тебя не хватит сил и могущества!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_11");	//Коготь Белиара принадлежит моему господину и только ему!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_12");	//Отдай ему этот меч...
	};
	Info_ClearChoices(dia_demon_sendsenyak_hello);
	Info_AddChoice(dia_demon_sendsenyak_hello,"Забудьте об этом!",dia_demon_sendsenyak_hello_no);
	Info_AddChoice(dia_demon_sendsenyak_hello,"Хорошо, коготь твой.",dia_demon_sendsenyak_hello_ok);
};

func void dia_demon_sendsenyak_hello_no()
{
	Snd_Play("MYSTERY_04");
	AI_Output(other,self,"DIA_Demon_SendSenyak_Hello_No_01_00");	//Забудьте об этом!
	AI_Output(other,self,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_01");	//Ваш хозяин от меня ничего не получит!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_02");	//Тогда ты умрешь, смертный!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_03");	//Сейчас ты ощутишь силу нашего господина! И ты не сможешь убежать от нее...
	Info_ClearChoices(dia_demon_sendsenyak_hello);
	Info_AddChoice(dia_demon_sendsenyak_hello,"...",dia_demon_sendsenyak_hello_ex1);
};

func void dia_demon_sendsenyak_hello_ok()
{
	Snd_Play("MYSTERY_04");
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Demon_SendSenyak_Hello_Ok_01_00");	//Хорошо, я отдам коготь.
	B_ClearBeliarsWeapon();
	CreateInvItems(other,ItMw_BeliarWeapon_Raven,1);
	B_GiveInvItems(other,self,ItMw_BeliarWeapon_Raven,1);
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_01");	//(мертвым голосом) Ты сделал правильный выбор, смертный!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_02");	//Мой господин будет доволен...
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_03");	//С помощью этого меча он обретет воистину божественное величие!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_04");	//...и с легкостью завершит замысел своего творца!
	Info_ClearChoices(dia_demon_sendsenyak_hello);
	Info_AddChoice(dia_demon_sendsenyak_hello,"(что я наделал?..)",dia_demon_sendsenyak_hello_ex2);
};

func void dia_demon_sendsenyak_hello_ex1()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = ZS_MM_AllScheduler;
	self.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_demon_sendsenyak_hello_ex2()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = zs_mm_rtn_demonrest;
	GIVESBWSENYAK = TRUE;
};

