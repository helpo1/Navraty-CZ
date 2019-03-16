
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
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//(mrtvolným hlasem) Smrtelníku!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_01");	//Maš u sebe něco, co náleži našemu pánovi!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_02");	//Dej mi Beliarův dráp, a já ušetřím tvůj život!
	}
	else if(random == 1)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//(mrtvolným hlasem) Smrtelníku!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_04");	//Můj pán chce získat nazpět Beliarův dráp - tento meč po právu náleži jemu!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_05");	//Dej mi ho - a zůstaneš naživu...
	}
	else if(random == 2)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//(mrtvolným hlasem) Smrtelníku!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_07");	//Musíš nám dát Beliarův dráp! Je velice důležitý pro našeho pána!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_08");	//Vydej ho - a my ti neskřivíme ani vlásek...
	}
	else if(random == 3)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//(mrtvolným hlasem) Smrtelníku!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_10");	//Ty si troufáš vládnout tomu, na co ti ani síla a moc nestačí!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_11");	//Beliarův dráp patří pouze a jen mému pánovi!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_12");	//Dej mu ten meč...
	};
	Info_ClearChoices(dia_demon_sendsenyak_hello);
	Info_AddChoice(dia_demon_sendsenyak_hello,"Na to zapomeň!",dia_demon_sendsenyak_hello_no);
	Info_AddChoice(dia_demon_sendsenyak_hello,"Dobře, Dráp je tvůj.",dia_demon_sendsenyak_hello_ok);
};

func void dia_demon_sendsenyak_hello_no()
{
	Snd_Play("MYSTERY_04");
	AI_Output(other,self,"DIA_Demon_SendSenyak_Hello_No_01_00");	//Na to zapomeň!
	AI_Output(other,self,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_01");	//Tvůj pán ode mě nedostane vůbec nic!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_02");	//V tom připadě zemřeš, smrtelníku!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_03");	//Teď poznáš sílu mého pána! A nemůžeš před ní utéct...
	Info_ClearChoices(dia_demon_sendsenyak_hello);
	Info_AddChoice(dia_demon_sendsenyak_hello,"...",dia_demon_sendsenyak_hello_ex1);
};

func void dia_demon_sendsenyak_hello_ok()
{
	Snd_Play("MYSTERY_04");
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Demon_SendSenyak_Hello_Ok_01_00");	//Dobře, Dráp je tvůj.
	B_ClearBeliarsWeapon();
	CreateInvItems(other,ItMw_BeliarWeapon_Raven,1);
	B_GiveInvItems(other,self,ItMw_BeliarWeapon_Raven,1);
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_01");	//(mrtvolným hlasem) Rozhodl ses správně, smrtelníku!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_02");	//Můj pán bude potěšen...
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_03");	//S pomocí tohoto meče, náš pán opravdu dosáhne božské velikosti!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_04");	//... a s lehkostí završí plán svého stvořitele!
	Info_ClearChoices(dia_demon_sendsenyak_hello);
	Info_AddChoice(dia_demon_sendsenyak_hello,"(Co jsem to udělal?)",dia_demon_sendsenyak_hello_ex2);
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

