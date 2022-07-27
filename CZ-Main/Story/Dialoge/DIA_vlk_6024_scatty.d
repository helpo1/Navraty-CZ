
instance DIA_SCATTY_NW_EXIT(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 999;
	condition = dia_scatty_nw_exit_condition;
	information = dia_scatty_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_scatty_nw_exit_condition()
{
	return TRUE;
};

func void dia_scatty_nw_exit_info()
{
	AI_StopProcessInfos(self);

	if((MIS_OLDGUARDGOWAR == LOG_SUCCESS) && (ALLGUARDIANSKILLED == FALSE))
	{
		if(SCATTYINSAFE == TRUE)
		{
			Npc_ExchangeRoutine(self,"FarmRest");
			b_removefromparty(vlk_6024_scatty);
		}
		else
		{
			Npc_ExchangeRoutine(self,"KillHim");
			b_removefromparty(vlk_6024_scatty);
		};
	};
};


instance DIA_SCATTY_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 900;
	condition = dia_scatty_nw_pickpocket_condition;
	information = dia_scatty_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_scatty_nw_pickpocket_condition()
{
	return C_Beklauen(110,250);
};

func void dia_scatty_nw_pickpocket_info()
{
	Info_ClearChoices(dia_scatty_nw_pickpocket);
	Info_AddChoice(dia_scatty_nw_pickpocket,Dialog_Back,dia_scatty_nw_pickpocket_back);
	Info_AddChoice(dia_scatty_nw_pickpocket,DIALOG_PICKPOCKET,dia_scatty_nw_pickpocket_doit);
};

func void dia_scatty_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_scatty_nw_pickpocket);
};

func void dia_scatty_nw_pickpocket_back()
{
	Info_ClearChoices(dia_scatty_nw_pickpocket);
};


instance DIA_SCATTY_NW_HI(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_hi_condition;
	information = dia_scatty_nw_hi_info;
	important = TRUE;
};


func int dia_scatty_nw_hi_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_scatty_nw_hi_info()
{
	B_GivePlayerXP(500);

	if((SCATTYCHEST == TRUE) && (SCATTYCHESTDONE == FALSE))
	{
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_17");	//Hele, chlape, neznáme se?
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_18");	//No jasně! To je ten, který... (naštvaně)
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_19");	//... KDE JE SAKRA MOJE ZLATO?!
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_20");	//Jaký zlato? Co je s ním?!
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_21");	//Idiote! Ptal jsem se - kde je moje zlato?!
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_22");	//Nevím o čem mluvíš...
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_23");	//Á... ty nevíš - za chvíli budeš!
		SCATTYCHESTDONE = TRUE;
		SCATTY_SUCKED = TRUE;
		B_LogEntry_Failed(TOPIC_SCATTYCHEST);
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_00");	//Chlape, neznáme se? Tvoje tvář se mi zdá povědomá.
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_01");	//No jasně! Ty jsi přece... (vzpamatuje se)
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_02");	//Rád tě vidím Scatty. Jak ses tu dostal?!
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_03");	//No, tak nějak jako ty. Ale nemyslím, že je tomu lehké porozumět.
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_04");	//Jen jsem nečekal, že tě uvidím tady...
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_05");	//Mág Ohně, to jsi vážně neztrácel čas.
		}
		else if(other.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_06");	//Královský paladin, to jsi vážně neztrácel čas.
		}
		else if(other.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_07");	//Žoldák, to jsi vážně neztrácel čas.
		}
		else if(other.guild == GIL_KDW)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_0A");	//Mág Vody, to jsi vážně neztrácel čas.
		}
		else if(other.guild == GIL_KDM)
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_0B");	//Nekromant! To jsi vážně neztrácel čas.
		}
		else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
		{
			AI_Output(self,other,"DIA_Scatty_NW_Hi_01_0C");	//Sektář, to jsi vážně neztrácel čas.
		};
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_08");	//Co tu vůbec děláš?
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_09");	//Co, co... Přirozeně pracuji! Trénuji s Wulfgarem tyhle rekruty.
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_10");	//Wulfgar tě přijal?!
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_11");	//Ano, zapůsobil jsem na něj.
		AI_Output(other,self,"DIA_Scatty_NW_Hi_01_12");	//Jo, jako učitel jsi byl sakra dobrý! Tvé lekce... Jak jsi věděl co a jak... Bolelo to, ale nikdo lepší nebyl.
		AI_Output(self,other,"DIA_Scatty_NW_Hi_01_13");	//Jsem rád, že si ještě pamatuješ ty doby. Nebylo to zase tak špatný!
	};
};


instance DIA_SCATTY_NW_CITY(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 2;
	condition = dia_scatty_nw_city_condition;
	information = dia_scatty_nw_city_info;
	permanent = TRUE;
	description = "Jak se vyvíjí výcvik rekrutů?";
};


func int dia_scatty_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_scatty_nw_hi) && (SCATTY_SUCKED == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_city_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_City_01_00");	//Jak se vyvíjí výcvik rekrutů?
	AI_Output(self,other,"DIA_Scatty_NW_City_01_01");	//Vidíš sám! Většina z nich jsou k ničemu.
	AI_Output(self,other,"DIA_Scatty_NW_City_01_05");	//(hlasitě) Snažím se z nich udělat vojáky. Bezvýsledně!
	if((Npc_IsDead(Mil_330_Miliz) == FALSE) && Wld_IsTime(8,0,20,20))
	{
		AI_Standup(self);
		B_TurnToNpc(self,Mil_330_Miliz);
		AI_Output(self,other,"DIA_Scatty_NW_City_01_02");	//(volá) Hej, ty tam - absolutně špatně!
		AI_Output(self,other,"DIA_Scatty_NW_City_01_03");	//Uchop meč pouze jednou rukou. Čepel nahoru, drž jí vklidu.
		AI_Output(self,other,"DIA_Scatty_NW_City_01_04");	//Ve tvých pohybech by ruka měla být rovnobežně se zbraní. Pomůže ti to zaměřit se na útok!
		B_TurnToNpc(self,other);
	};
};


instance DIA_SCATTY_ANGREE(C_Info)
{
	npc = vlk_6024_scatty;
	condition = dia_scatty_angree_condition;
	information = dia_scatty_angree_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_scatty_angree_condition()
{
	if((SCATTY_SUCKED == TRUE) && (MIS_OLDGUARDGOWAR == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_scatty_angree_info()
{
	AI_Output(self,other,"DIA_Scatty_Angree_01_00");	//Jdi pryč, podvodníku.
	AI_StopProcessInfos(self);
	SCATTY_SUCKED = TRUE;
};

instance DIA_SCATTY_NW_ESCAPEFROMTOWN(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_escapefromtown_condition;
	information = dia_scatty_nw_escapefromtown_info;
	permanent = FALSE;
	description = "Co se stalo?";
};

func int dia_scatty_nw_escapefromtown_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_scatty_nw_escapefromtown_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_EscapeFromTown_01_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Scatty_NW_EscapeFromTown_01_01");	//Mohlo by to být horší... (pochmurně) Alespoň, že jsem na živu.
	AI_Output(self,other,"DIA_Scatty_NW_EscapeFromTown_01_03");	//Kdybys tak mohl vidět, co se posléze stalo ve městě.
	AI_Output(self,other,"DIA_Scatty_NW_EscapeFromTown_01_05");	//A tady to není o nic lepší! Jsme obklíčení skřety a nemyslím si že to jen tak skončí.
	SCATTYHERE = TRUE;
};

instance DIA_SCATTY_NW_WHATNEXT(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_whatnext_condition;
	information = dia_scatty_nw_whatnext_info;
	permanent = TRUE;
	description = "Zůstaneš tady?";
};

func int dia_scatty_nw_whatnext_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_nw_escapefromtown) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_whatnext_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_WhatNext_01_00");	//Zůstaneš tady?
	AI_Output(self,other,"DIA_Scatty_NW_WhatNext_01_01");	//Myslím, že ano. Alespoň skřeti se tu ještě nedostali.
};

instance DIA_SCATTY_NW_OLDGUARDGOWAR(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_oldguardgowar_condition;
	information = dia_scatty_nw_oldguardgowar_info;
	permanent = FALSE;
	description = "Pojď!";
};

func int dia_scatty_nw_oldguardgowar_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_Running) && (SCATTYHERE == TRUE))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_oldguardgowar_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_OldGuardGoWar_01_00");	//Pojď! Musíme se odsud dostat!
	AI_Output(self,other,"DIA_Scatty_NW_OldGuardGoWar_01_01");	//Konečně! Už mě nebaví čekat na jednom místě.
	AI_Output(self,other,"DIA_Scatty_NW_OldGuardGoWar_01_02");	//No, tak na co čekáš - jdeme!
	SCATTYJOINME = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_SCATTY_NW_OLDGUARDGOWAR_DONE(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_condition;
	information = DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_info;
	permanent = FALSE;
	description = "Jsme tady.";
};

func int DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_condition()
{
	if((SCATTYJOINME == TRUE) && (Npc_GetDistToWP(self,"NW_BIGFARM_PATH_04") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_01_00");	//Jsme tady.
	AI_Output(self,other,"DIA_SCATTY_NW_OLDGUARDGOWAR_DONE_01_01");	//Díky, příteli... (směje se) Už se mi to tady líbí!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	SCATTYINSAFE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FarmRest");
};

instance DIA_SCATTY_NW_WHEREPEASANT(C_Info)
{
	npc = vlk_6024_scatty;
	nr = 1;
	condition = dia_scatty_nw_wherepeasant_condition;
	information = dia_scatty_nw_wherepeasant_info;
	permanent = FALSE;
	description = "Kde jsou všichni rolníci?";
};


func int dia_scatty_nw_wherepeasant_condition()
{
	if((SCATTYHERE == TRUE) && (KNOWWHEREAKIL == FALSE) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_scatty_nw_wherepeasant_info()
{
	AI_Output(other,self,"DIA_Scatty_NW_WherePeasant_01_00");	//Kde jsou všichni rolníci?
	AI_Output(self,other,"DIA_Scatty_NW_WherePeasant_01_01");	//Nemám tušení. Nejspíše se rozutekli do všech směrů.
	AI_Output(self,other,"DIA_Scatty_NW_WherePeasant_01_02");	//Koneckonců, tady je to příliš nebezpečné než aby zůstali. Tato farma až příliš připomíná město, než aby ji skřeti ignorovali.
	AI_Output(other,self,"DIA_Scatty_NW_WherePeasant_01_03");	//Chápu.
	KNOWWHEREAKIL = TRUE;
};
