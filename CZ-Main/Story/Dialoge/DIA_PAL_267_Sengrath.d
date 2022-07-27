
instance DIA_Sengrath_EXIT(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 999;
	condition = DIA_Sengrath_EXIT_Condition;
	information = DIA_Sengrath_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sengrath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sengrath_Hello(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Hello_Condition;
	information = DIA_Sengrath_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sengrath_Hello_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Hello_Info()
{
	AI_Output(self,other,"DIA_Sengrath_Hello_03_00");	//Věděl jsem to! Věděl jsem, že někdo přijde!
	AI_Output(self,other,"DIA_Sengrath_Hello_03_01");	//Přišel jsi z průsmyku? Takže náš posel prošel...
	if(Kapitel == 1)
	{
		AI_Output(other,self,"DIA_Sengrath_Hello_15_03");	//Ne vašemu poslovi se to nepodařilo.
	}
	else
	{
		AI_Output(other,self,"DIA_Sengrath_Hello_15_02");	//Ne, váš posel neprošel. Přicházím z rozkazu lorda Hagena.
	};
	AI_Output(self,other,"DIA_Sengrath_Hello_03_03");	//(vrčení) Prokletí skřeti.
	AI_Output(self,other,"DIA_Sengrath_Hello_03_04");	//No, velitel Garond tě bude chtít vidět. Najdeš ho v té velké budově, která je střežena dvěmi rytíři.
};


instance DIA_Sengrath_Equipment(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Equipment_Condition;
	information = DIA_Sengrath_Equipment_Info;
	permanent = FALSE;
	description = "Kde tady můžu dostat vybavení?";
};


func int DIA_Sengrath_Equipment_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Equipment_Info()
{
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_00");	//Kde tady můžu dostat vybavení?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_01");	//Tandor prodává zbraně a Engor vše ostatní.
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_02");	//A co magie?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_03");	//Máme magické svitky, jestli nějaké potřebuješ obrať se na mě.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Sengrath prodává svitky na hradě.");
};


instance DIA_Sengrath_Perm(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Perm_Condition;
	information = DIA_Sengrath_Perm_Info;
	permanent = FALSE;
	description = "Kdo mě tu může něco naučit?";
};


func int DIA_Sengrath_Perm_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Perm_Info()
{
	AI_Output(other,self,"DIA_Sengrath_Perm_15_00");	//Kdo mě tu může něco naučit? 

	if(((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR)) && (Kapitel <= 2))
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_01");	//Milten je tu jediný mág - promluv s ním.
	}
	else
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_02");	//Popros Kerolotha. On trénuje boj s mečem.
		Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC,"Keroloth na hradě trénuje v boji s mečem.");
	};
};


instance DIA_Sengrath_Scrolls(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 9;
	condition = DIA_Sengrath_Scrolls_Condition;
	information = DIA_Sengrath_Scrolls_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své magické svitky.";
};


func int DIA_Sengrath_Scrolls_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sengrath_Equipment))
	{
		return TRUE;
	};
};

func void DIA_Sengrath_Scrolls_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self,"DIA_Sengrath_Scrolls_15_00");	//Ukaž mi své magické svitky.
	B_GiveTradeInv(self);
};


instance DIA_Sengrath_PICKPOCKET(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 900;
	condition = DIA_Sengrath_PICKPOCKET_Condition;
	information = DIA_Sengrath_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sengrath_PICKPOCKET_Condition()
{
	return C_Beklauen(32,35);
};

func void DIA_Sengrath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
	Info_AddChoice(DIA_Sengrath_PICKPOCKET,Dialog_Back,DIA_Sengrath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sengrath_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sengrath_PICKPOCKET_DoIt);
};

func void DIA_Sengrath_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
};

func void DIA_Sengrath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
};

