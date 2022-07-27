
instance DIA_SKELETONMAGE_SENDSENYAK_2_EXIT(C_Info)
{
	npc = skeletonmage_sendsenyak_2;
	nr = 999;
	condition = dia_skeletonmage_sendsenyak_2_exit_condition;
	information = dia_skeletonmage_sendsenyak_2_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_skeletonmage_sendsenyak_2_exit_condition()
{
	return TRUE;
};

func void dia_skeletonmage_sendsenyak_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SKELETONMAGE_SENDSENYAK_2_HELLO(C_Info)
{
	npc = skeletonmage_sendsenyak_2;
	nr = 1;
	condition = dia_skeletonmage_sendsenyak_2_hello_condition;
	information = dia_skeletonmage_sendsenyak_2_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_skeletonmage_sendsenyak_2_hello_condition()
{
	if(GIVESBWSENYAK == FALSE)
	{
		return TRUE;
	};
};

func void dia_skeletonmage_sendsenyak_2_hello_info()
{
	var int random;
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	random = Hlp_Random(3);
	if(random == 0)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//... SMRTELNÍKU!... (mrtvý hlas)
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_01");	//MÁŠ NĚCO CO PATŘÍ MÉMU PÁNOVI!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_02");	//ODEVZDEJ MI BELIARŮV DRÁP A ZACHRAŇ SI TAK ŽIVOT...
	}
	else if(random == 1)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//... SMRTELNÍKU!... (mrtvý hlas)
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_04");	//MŮJ PÁN CHCE ZPĚT BELIARŮV DRÁP - TENTO MEČ PRÁVEM PATŘÍ JEN JEMU!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_05");	//ODEVZDEJ MI HO A NECHÁM TĚ ŽÍT...
	}
	else if(random == 2)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//... SMRTELNÍKU!... (mrtvý hlas)
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_07");	//DEJ MI BELIARŮV DRÁP! MŮJ PÁN HO NUTNĚ POTŘEBUJE!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_08");	//DEJ MI HO A JÁ TI NEUBLÍŽÍM... (mrtvý hlas)
	}
	else if(random == 3)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//... SMRTELNÍKU!... (mrtvý hlas)
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_10");	//TY SE OPOVAŽUJEŠ NOSIT NĚCO, NA CO NEMÁŠ SÍLU ANI MOC!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_11");	//BELIARŮV DRÁP PATŘÍ JEN JEMU, A NIKOMU JINÉMU!
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_12");	//DEJ MI TEN MEČ... (mrtvý hlas)
	};
	Info_ClearChoices(dia_skeletonmage_sendsenyak_2_hello);
	Info_AddChoice(dia_skeletonmage_sendsenyak_2_hello,"Na to zapomeň!",dia_skeletonmage_sendsenyak_2_hello_no);
	Info_AddChoice(dia_skeletonmage_sendsenyak_2_hello,"Dobře! Tady máš Dráp...",dia_skeletonmage_sendsenyak_2_hello_ok);
};

func void dia_skeletonmage_sendsenyak_2_hello_no()
{
	AI_Output(other,self,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_00");	//Na to zapomeň!
	AI_Output(other,self,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_01");	//Beliar ode mně nic nedostane!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_02");	//PAK ZEMŘEŠ SMRTELNÍKU!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_No_01_03");	//NYNÍ UCÍTÍŠ SÍLU MÉHO PÁNA! PŘED NÍ NEMŮŽEŠ UNIKNOUT... (mrtvý hlas)
	Info_ClearChoices(dia_skeletonmage_sendsenyak_2_hello);
	Info_AddChoice(dia_skeletonmage_sendsenyak_2_hello,"...",dia_skeletonmage_sendsenyak_2_hello_ex1);
};

func void dia_skeletonmage_sendsenyak_2_hello_ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_00");	//Dobře! Tady máš Dráp...
	B_ClearBeliarsWeapon();
	CreateInvItems(hero,ItMw_BeliarWeapon_Raven,1);
	B_GiveInvItems(other,self,ItMw_BeliarWeapon_Raven,1);
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_01");	//SPRÁVNÉ ROZHODNUTÍ ODEVZDAT MI TEN MEČ SMRTELNÍKU!
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_02");	//MŮJ PÁN BUDE POTĚŠEN... (mrtvý hlas)
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_03");	//DÍKY TOMU MEČI BUDU MÍT NEOMEZENOU MOC...
	AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_04");	//... A DOKONČÍM PLÁN MÉHO STVOŘITELE!
	Info_ClearChoices(dia_skeletonmage_sendsenyak_2_hello);
	Info_AddChoice(dia_skeletonmage_sendsenyak_2_hello,"... (Co jsem to udělal?!)",dia_skeletonmage_sendsenyak_2_hello_ex2);
};

func void dia_skeletonmage_sendsenyak_2_hello_ex1()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = ZS_MM_AllScheduler;
	self.aivar[AIV_EnemyOverride] = FALSE;
	snskel1.aivar[AIV_EnemyOverride] = FALSE;
	snskel2.aivar[AIV_EnemyOverride] = FALSE;
	snskel3.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_skeletonmage_sendsenyak_2_hello_ex2()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = zs_mm_rtn_demonrest;
	snskel1.start_aistate = zs_mm_rtn_demonrest;
	snskel2.start_aistate = zs_mm_rtn_demonrest;
	snskel3.start_aistate = zs_mm_rtn_demonrest;
	GIVESBWSENYAK = TRUE;
};

