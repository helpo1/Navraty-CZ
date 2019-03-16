
instance DIA_Addon_Malcom_EXIT(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 999;
	condition = DIA_Addon_Malcom_EXIT_Condition;
	information = DIA_Addon_Malcom_EXIT_Info;
	permanent = TRUE;
	description = "Musím jít.";
};


func int DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_perm_15_00");	//Musím jít.
	if(MalcomBotschaft == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_perm_04_01");	//Nenech se něčím sežrat. Je velmi nebezpečné, se kolem jen tak potulovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_03");	//Hej, jestli půjdeš do tábora, vyřiď Henrymu ode mě něco.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_04");	//Stromy tady kolem jsou velmi nezdolné.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_05");	//Neměl by očekávat dřevo v blízké době. Řekni mu to.
		MalcomBotschaft = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Malcom_PICKPOCKET(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 900;
	condition = DIA_Addon_Malcom_PICKPOCKET_Condition;
	information = DIA_Addon_Malcom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Malcom_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Addon_Malcom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET,Dialog_Back,DIA_Addon_Malcom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Malcom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Malcom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};

func void DIA_Addon_Malcom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};


instance DIA_Addon_Malcom_Hello(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 1;
	condition = DIA_Addon_Malcom_Hello_Condition;
	information = DIA_Addon_Malcom_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Malcom_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_01");	//Ty nejsi odtud, že ne?
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_02");	//Zdá se, že jsi cestoval poměrně dlouho, aby ses sem dostal.
};


instance DIA_Addon_Malcom_WasMachen(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 2;
	condition = DIA_Addon_Malcom_WasMachen_Condition;
	information = DIA_Addon_Malcom_WasMachen_Info;
	description = "Zaneprázdněn?";
};


func int DIA_Addon_Malcom_WasMachen_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_WasMachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_00");	//Zaneprázdněn?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_01");	//Neruš mě. Henry chce, abych zde pokácel co nejvíc stromů.
	if(Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_02");	//Henry?
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_00");	//Vede naši skupinu.
	};
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_04");	//Stojí před vstupem do tábora a mírně kontroluje příchozí.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_05");	//Stará se o bezpečnost nášeho tábora.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_06");	//Pochopitelně ale nemůže ovlivnit každého.
};


instance DIA_Addon_Malcom_Entertrupp(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 5;
	condition = DIA_Addon_Malcom_Entertrupp_Condition;
	information = DIA_Addon_Malcom_Entertrupp_Info;
	description = "Henry je tvůj vůdce?";
};


func int DIA_Addon_Malcom_Entertrupp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Malcom_Entertrupp_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Entertrupp_15_00");	//Henry je tvůj vůdce?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_03");	//Ano, vůdce naší skupiny.
	AI_Output(self,other,"DIA_Addon_Malcom_Add_04_01");	//Náš KAPITÁN je ale Greg.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_02");	//Ale nyní je zrovna pryč.
	};
};


instance DIA_Addon_Malcom_Lager(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 3;
	condition = DIA_Addon_Malcom_Lager_Condition;
	information = DIA_Addon_Malcom_Lager_Info;
	description = "Kde je tvůj tábor?";
};


func int DIA_Addon_Malcom_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Malcom_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Lager_15_00");	//Kde je tvůj tábor?
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_01");	//Jen běž touto cestou na západ.
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_02");	//Tam uvidíš Henryho, jak postává kolem.
};

