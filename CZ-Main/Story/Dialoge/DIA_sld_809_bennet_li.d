
var int trd_bennetli;

instance DIA_BENNET_LI_EXIT(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 999;
	condition = dia_bennet_li_exit_condition;
	information = dia_bennet_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_bennet_li_exit_condition()
{
	return TRUE;
};

func void dia_bennet_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_LI_TRADE(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 7;
	condition = dia_bennet_li_trade_condition;
	information = dia_bennet_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Jaké zbraně mi můžeš prodat?";
};


func int dia_bennet_li_trade_condition()
{
	return TRUE;
};

func void dia_bennet_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Bennet_DI_TRADE_15_00");	//Jaké zbraně mi můžeš prodat?
	AI_Output(self,other,"DIA_Bennet_DI_TRADE_06_01");	//Jen ty nejlepší, to přece víš.

	if(TRD_BENNETLI != TRUE)
	{
		CreateInvItems(self,ItMiSwordraw,3);
		CreateInvItems(self,ItRw_Arrow,140);
		CreateInvItems(self,ItRw_Bolt,140);
		CreateInvItems(self,ItMw_ElBastardo,1);
		CreateInvItems(self,ItMw_Folteraxt,1);
		CreateInvItems(self,ItMw_Zweihaender4,1);
		CreateInvItems(self,ItMi_Nugget,4);
		TRD_BENNETLI = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_BENNET_LI_SMITH(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 7;
	condition = dia_bennet_li_smith_condition;
	information = dia_bennet_li_smith_info;
	permanent = TRUE;
	description = "Můžeš mě naučit vykovat zbraň?";
};


func int dia_bennet_li_smith_condition()
{
	if(Bennet_TeachSmith == TRUE)
	{
		return TRUE;
	};
};

func void dia_bennet_li_smith_info()
{
	AI_Output(other,self,"DIA_Bennet_DI_Smith_15_00");	//Můžeš mě naučit své umění?
	AI_Output(self,other,"DIA_Bennet_DI_Smith_06_01");	//Záleží na tom, co chceš dělat.
	Info_ClearChoices(dia_bennet_li_smith);
	Info_AddChoice(dia_bennet_li_smith,Dialog_Back,dia_bennet_li_smith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt("Naučit se základy kovářství",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),dia_bennet_li_smith_common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),dia_bennet_li_smith_1hspecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),dia_bennet_li_smith_2hspecial1);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),dia_bennet_li_smith_1hspecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),dia_bennet_li_smith_2hspecial2);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),dia_bennet_li_smith_1hspecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),dia_bennet_li_smith_2hspecial3);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),dia_bennet_li_smith_1hspecial4);
		};
		if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
		{
			Info_AddChoice(dia_bennet_li_smith,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),dia_bennet_li_smith_2hspecial4);
		};
	};
};

func void dia_bennet_li_smith_back()
{
	Info_ClearChoices(dia_bennet_li_smith);
};

func void dia_bennet_li_smith_common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void dia_bennet_li_smith_1hspecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void dia_bennet_li_smith_2hspecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void dia_bennet_li_smith_1hspecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void dia_bennet_li_smith_2hspecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void dia_bennet_li_smith_1hspecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void dia_bennet_li_smith_2hspecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void dia_bennet_li_smith_1hspecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void dia_bennet_li_smith_2hspecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};


instance DIA_BENNET_LI_PICKPOCKET(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 900;
	condition = dia_bennet_li_pickpocket_condition;
	information = dia_bennet_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_bennet_li_pickpocket_condition()
{
	return C_Beklauen(35,65);
};

func void dia_bennet_li_pickpocket_info()
{
	Info_ClearChoices(dia_bennet_li_pickpocket);
	Info_AddChoice(dia_bennet_li_pickpocket,Dialog_Back,dia_bennet_li_pickpocket_back);
	Info_AddChoice(dia_bennet_li_pickpocket,DIALOG_PICKPOCKET,dia_bennet_li_pickpocket_doit);
};

func void dia_bennet_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_bennet_li_pickpocket);
};

func void dia_bennet_li_pickpocket_back()
{
	Info_ClearChoices(dia_bennet_li_pickpocket);
};


instance DIA_BENNET_LI_MISSMYGOLD(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 2;
	condition = dia_bennet_li_missmygold_condition;
	information = dia_bennet_li_missmygold_info;
	permanent = FALSE;
	description = "Je tu jedna věc.";
};


func int dia_bennet_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_bennet_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Bennet_LI_MissMyGold_01_01");	//Je tu jedna věc.
	AI_Output(self,other,"DIA_Bennet_LI_MissMyGold_01_02");	//(otráveně) Co zas...
	AI_Output(self,other,"DIA_Bennet_LI_MissMyGold_01_03");	//Pohni, nudí mě to.
	AI_Output(other,self,"DIA_Bennet_LI_MissMyGold_01_04");	//Nevíš kam zmizelo mé zlato?
	AI_Output(self,other,"DIA_Bennet_LI_MissMyGold_01_05");	//Chlape...(otráveně) Celé dny jsem jen v kovárně.
	AI_Output(self,other,"DIA_Bennet_LI_MissMyGold_01_06");	//Nemám páru kde je.
	B_LogEntry(TOPIC_MISSMYGOLD,"Bennet neví, kam mé zlato zmizelo.");
};


instance DIA_BENNET_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 2;
	condition = dia_bennet_li_findmagicorecave_condition;
	information = dia_bennet_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem tu ložisko rudy.";
};


func int dia_bennet_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Bennet_LI_FindMagicOreCave_01_01");	//Našel jsem tu ložisko rudy.
	AI_Output(self,other,"DIA_Bennet_LI_FindMagicOreCave_01_02");	//Opravdu?! To bys měl říci kapitánovi.
	AI_Output(self,other,"DIA_Bennet_LI_FindMagicOreCave_01_03");	//Myslím, že ho tato zpráva bude dost zajímat.
	GOTOORECAPITAN = TRUE;
};


instance DIA_BENNET_LI_CHANGECOURSE(C_Info)
{
	npc = sld_809_bennet_li;
	nr = 2;
	condition = dia_bennet_li_changecourse_condition;
	information = dia_bennet_li_changecourse_info;
	permanent = FALSE;
	description = "Nechtěl by ses vrátit na Khorinis?";
};


func int dia_bennet_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_bennet_li_changecourse_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Bennet_LI_ChangeCourse_01_00");	//Musíme se vrátit na Khorinis.
	AI_Output(self,other,"DIA_Bennet_LI_ChangeCourse_01_07");	//Samozřejmě, kamaráde! Na pevninu se mi moc nechce.
	AI_Output(self,other,"DIA_Bennet_LI_ChangeCourse_01_08");	//Rád bych se ještě jednou podíval do Onarovi kovárny.
	AI_Output(other,self,"DIA_Bennet_LI_ChangeCourse_01_12");	//Chápu.
	B_LogEntry(TOPIC_CHANGECOURSE,"Bennet souhlasí s návratem na Khorinis.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Promluvil jsem se všemi chlapi. Měl bych si jít promluvit s kapitánem.");
	};
};

instance DIA_Bennet_LI_BetterArmor_Done(C_Info)
{
	npc = SLD_809_Bennet_LI;
	nr = 8;
	condition = DIA_Bennet_LI_BetterArmor_Done_Condition;
	information = DIA_Bennet_LI_BetterArmor_Done_Info;
	permanent = FALSE;
	description = "Mám vše co si požadoval.";
};

func int DIA_Bennet_LI_BetterArmor_Done_Condition()
{
	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 50) && (Npc_HasItems(other,ItAt_XragonSkull) >= 4) && (Npc_HasItems(other,ItMi_Nugget) >= 20) && (Npc_HasItems(other,ItMi_Sulfur) >= 10) && (Npc_HasItems(other,ItMi_Pitch) >= 2) && (Npc_HasItems(other,ItMi_DarkPearl) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LI_BetterArmor_Done_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_00");	//Mám vše co si požadoval.
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

	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_01");	//Dobrá. Pak se hned pustím do práce.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_02");	//Kolik budeš potřebovat času na výrobu?
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Done_01_03");	//Těžko říct. Ale dám ti vědět až to budu mít hotový.
	AI_Output(other,self,"DIA_Bennet_DI_BetterArmor_Done_01_04");	//Dobrá.
	DayStartArmor = TRUE;
	DayStartArmorCount = Wld_GetDay();
	B_LogEntry(TOPIC_BetterArmor,"Dal jsem Bennetovi všechny potřebné materiály pro výrobu zbroje. Neví jak bude dlouho výroba trvat, ale dá mi vědět až bude zbroj hotová.");
	AI_StopProcessInfos(self);
};

instance DIA_Bennet_LI_BetterArmor_Finish(C_Info)
{
	npc = SLD_809_Bennet_LI;
	nr = 8;
	condition = DIA_Bennet_LI_BetterArmor_Finish_Condition;
	information = DIA_Bennet_LI_BetterArmor_Finish_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bennet_LI_BetterArmor_Finish_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_BetterArmor == LOG_Running) && (DayStartArmor == TRUE) && (OberDementorIsDead == TRUE) && (DayStartArmorCount < daynow))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LI_BetterArmor_Finish_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_00");	//Tvá zbroj... (unaveně) Je hotová!
	AI_Output(self,other,"DIA_Bennet_DI_BetterArmor_Finish_01_01");	//Tady, vem si ji. Ochrání tě před jakýmkoliv nepřítelem.
	B_GiveInvItems(self,other,ItAr_DragonKiller,1);
	MIS_BetterArmor = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BetterArmor,LOG_SUCCESS);
	B_LogEntry(TOPIC_BetterArmor,"Bennet mi dal hotovou zbroj.");
	AI_StopProcessInfos(self);
};