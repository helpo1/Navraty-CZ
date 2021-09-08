
instance DIA_Bennet_DI_EXIT(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 999;
	condition = DIA_Bennet_DI_EXIT_Condition;
	information = DIA_Bennet_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bennet_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DI_Hello(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 10;
	condition = DIA_Bennet_DI_Hello_Condition;
	information = DIA_Bennet_DI_Hello_Info;
	permanent = TRUE;
	description = "Všechno klape?";
};


func int DIA_Bennet_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Hello_15_00");	//Všechno klape?

	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DI_Hello_06_01");	//Kovárna na téhle lodi je tak kapku zarezlá. Může za to ta mořská sůl. Vyrobit tam něco komplikovanější může být docela problém. Ale zase na druhou stranu...
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DI_Hello_06_02");	//Můžeme zařídit, aby se skřeti nevrátili zpět.
	};
};


instance DIA_Bennet_DI_TRADE(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_TRADE_Condition;
	information = DIA_Bennet_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Jaké zbraně mi můžeš prodat?";
};


func int DIA_Bennet_DI_TRADE_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Bennet_DI_TRADE_15_00");	//Jaké zbraně mi můžeš prodat?
	AI_Output(self,other,"DIA_Bennet_DI_TRADE_06_01");	//Jen ty nejlepší, to přece víš.
	B_GiveTradeInv(self);
};


instance DIA_Bennet_DI_Smith(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_Smith_Condition;
	information = DIA_Bennet_DI_Smith_Info;
	permanent = TRUE;
	description = "Můžeš mě naučit své umění?";
};

func int DIA_Bennet_DI_Smith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Smith_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Smith_15_00");	//Můžeš mě naučit své umění?
	AI_Output(self,other,"DIA_Bennet_DI_Smith_06_01");	//Záleží na tom, co chceš dělat.
	Info_ClearChoices(DIA_Bennet_DI_Smith);
	Info_AddChoice(DIA_Bennet_DI_Smith,Dialog_Back,DIA_Bennet_DI_Smith_BACK);

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt("Naučit se základy kovářství",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Bennet_DI_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_DI_Smith_1hSpecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_DI_Smith_2hSpecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_DI_Smith_1hSpecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_DI_Smith_2hSpecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_DI_Smith_1hSpecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_DI_Smith_2hSpecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_DI_Smith_1hSpecial4);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_DI_Smith_2hSpecial4);
		};
	};
};

func void DIA_Bennet_DI_Smith_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_Smith);
};

func void DIA_Bennet_DI_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void DIA_Bennet_DI_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_DI_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_DI_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_DI_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_DI_Smith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_DI_Smith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_DI_Smith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_DI_Smith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};


instance DIA_Bennet_TeachSTR(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 150;
	condition = DIA_Bennet_TeachSTR_Condition;
	information = DIA_Bennet_TeachSTR_Info;
	permanent = TRUE;
	description = "Chtěl bych se stát silnějším.";
};

func int DIA_Bennet_TeachSTR_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSTR_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSTR_15_00");	//Chtěl bych se stát silnějším.
	AI_Output(self,other,"DIA_Bennet_TeachSTR_06_01");	//V takovýchto dobách se budou silné paže hodit.
	Info_ClearChoices(DIA_Bennet_TeachSTR);
	Info_AddChoice(DIA_Bennet_TeachSTR,Dialog_Back,DIA_Bennet_TeachSTR_Back);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Bennet_TeachSTR_STR_1);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Bennet_TeachSTR_STR_5);
};

func void DIA_Bennet_TeachSTR_Back()
{
	Info_ClearChoices(DIA_Bennet_TeachSTR);
};

func void DIA_Bennet_TeachSTR_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Bennet_TeachSTR_STR_1);
};

func void DIA_Bennet_TeachSTR_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Bennet_TeachSTR_STR_5);
};


instance DIA_Bennet_DI_DragonEgg(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 99;
	condition = DIA_Bennet_DI_DragonEgg_Condition;
	information = DIA_Bennet_DI_DragonEgg_Info;
	permanent = FALSE;
	description = "Mám tady dračí vejce.";
};

func int DIA_Bennet_DI_DragonEgg_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_DragonEgg_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_DragonEgg_15_00");	//Mám tady dračí vejce.
	AI_Output(self,other,"DIA_Bennet_DI_DragonEgg_06_01");	//No?
	AI_Output(other,self,"DIA_Bennet_DI_DragonEgg_15_02");	//No. Myslel jsem...
	AI_Output(self,other,"DIA_Bennet_DI_DragonEgg_06_03");	//Vím, na co myslíš. Zapomeň na to, nech si tu věc. Já to nechci.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bennet_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 7;
	condition = DIA_Bennet_DI_UndeadDragonDead_Condition;
	information = DIA_Bennet_DI_UndeadDragonDead_Info;
	permanent = FALSE;
	description = "Tady jsme hotovi.";
};

func int DIA_Bennet_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_UndeadDragonDead_15_00");	//Tady jsme hotovi.
	AI_Output(self,other,"DIA_Bennet_DI_UndeadDragonDead_06_01");	//To rád slyším. Už jsem měl po krk téhle staré kovárny. Potřebuju se zase postavit na zem pevnýma nohama.
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_DI_PICKPOCKET(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 900;
	condition = DIA_Bennet_DI_PICKPOCKET_Condition;
	information = DIA_Bennet_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bennet_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(35,65);
};

func void DIA_Bennet_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET,Dialog_Back,DIA_Bennet_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bennet_DI_PICKPOCKET_DoIt);
};

func void DIA_Bennet_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};

func void DIA_Bennet_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};

instance DIA_Bennet_DI_BetterArmor(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 8;
	condition = DIA_Bennet_DI_BetterArmor_Condition;
	information = DIA_Bennet_DI_BetterArmor_Info;
	permanent = FALSE;
	description = "Nenajde se u tebe lepší zbroj?";
};

func int DIA_Bennet_DI_BetterArmor_Condition()
{
	if((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (hero.guild == GIL_TPL))
	{
		if((SBMode == TRUE) || (RealMode[2] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bennet_DI_BetterArmor_Info()
{
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_01_00");	//Nenajde se u tebe lepší zbroj?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_01");	//Hmmm... (zamyšleně) Mohu protebe vykovat takovou zbroj, jakou jsi ještě neviděl.
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_02");	//Ale k výrobě potřebuji velké množství různého materiálu.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_01_03");	//Jakého konkrétně?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_04");	//Pro začátek padesát dračích šupin! Mají sloužit jako základ pro vytvoření horní pancíře zbroje a nožních plátů.
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_05");	//Dále pro zvýšení pevnosti zbroje magickou rudu. Aspoň 20 hrudek!
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_06");	//Pro práci ještě potřebuju, 10 kousků síry, 5 černých perel, 2 hrnce pryskyřice a co je nejdůležitější 4 kusy čelní kosti draka.
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_01_07");	//Pokavaď se ti to podaří sehnat, budeš mít nejsilnější pancíř na celém světě!
	MIS_BetterArmor = LOG_Running;
	Log_CreateTopic(TOPIC_BetterArmor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_Running);
	B_LogEntry(TOPIC_BetterArmor,"Bennet mě může vyrobit mimořádně silnou zbroj! Nicméně k tomu potřebuje velké množství různého materiálu - a to 50 dračích šupin, 20 hrudek magické rudy, 10 kousků síry, 5 černých perel, 2 hrnce pryskyřice a 4 kusy čelní kosti draka. Jestli mu to seženu, udělá mi zbroj zdarma.");
};

instance DIA_Bennet_DI_BetterArmor_Done(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 8;
	condition = DIA_Bennet_DI_BetterArmor_Done_Condition;
	information = DIA_Bennet_DI_BetterArmor_Done_Info;
	permanent = FALSE;
	description = "Mám vše co potřebuješ.";
};

func int DIA_Bennet_DI_BetterArmor_Done_Condition()
{
	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 50) && (Npc_HasItems(other,ItAt_XragonSkull) >= 4) && (Npc_HasItems(other,ItMi_Nugget) >= 20) && (Npc_HasItems(other,ItMi_Sulfur) >= 10) && (Npc_HasItems(other,ItMi_Pitch) >= 2) && (Npc_HasItems(other,ItMi_DarkPearl) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_BetterArmor_Done_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_00");	//Mám vše co potřebuješ.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItAt_DragonScale,50);
	Npc_RemoveInvItems(hero,ItAt_XragonSkull,4);
	Npc_RemoveInvItems(hero,ItMi_Nugget,20);
	Npc_RemoveInvItems(hero,ItMi_Pitch,2);
	Npc_RemoveInvItems(hero,ItMi_Sulfur,10);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,5);

	if(Trophy_DragonSkull  == TRUE)
	{
		if(Npc_HasItems(other,ItAt_XragonSkull) == FALSE)
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_DragonSkull,Npc_HasItems(other,ItUt_DragonSkull));
			Trophy_DragonSkull  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_01");	//Dobře... (pochvalně) Tak to se hned pustím do práce.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_02");	//Kolik času budeš potřebovat k jeho výrobě?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_03");	//Těžko říct! Ale dám ti vědět, až to bude hotové.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_04");	//Dobře.
	DayStartArmor = TRUE;
	DayStartArmorCount = Wld_GetDay();
	B_LogEntry(TOPIC_BetterArmor,"Dal jsem Bennetovi všechen potřebný materiál na výrobu zbroje, hned se pustil do práce. Ale neví jak dlouho mu to bude trvat.");
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_DI_BetterArmor_Finish(C_Info)
{
	npc = SLD_809_Bennet_DI;
	nr = 8;
	condition = DIA_Bennet_DI_BetterArmor_Finish_Condition;
	information = DIA_Bennet_DI_BetterArmor_Finish_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bennet_DI_BetterArmor_Finish_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == TRUE) && (OberDementorIsDead == TRUE) && (DayStartArmorCount < daynow))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_BetterArmor_Finish_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_00");	//K tvé zbroji... (unaveně) Je hotová!
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_01");	//Tady, vem si ji. Ochrání tě před jakýmkoliv nepřítelem.
	B_GiveInvItems(self,other,ItAr_DragonKiller,1);
	MIS_BetterArmor = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_SUCCESS);
	B_LogEntry(TOPIC_BetterArmor,"Bennet pro mě vykoval zbroj.");
	AI_StopProcessInfos(self);
};