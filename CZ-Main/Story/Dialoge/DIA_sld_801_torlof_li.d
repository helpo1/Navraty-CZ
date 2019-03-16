
instance DIA_TORLOF_LI_KAP3_EXIT(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 999;
	condition = dia_torlof_li_kap3_exit_condition;
	information = dia_torlof_li_kap3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_torlof_li_kap3_exit_condition()
{
	return TRUE;
};

func void dia_torlof_li_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_LI_TEACH(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 150;
	condition = dia_torlof_li_teach_condition;
	information = dia_torlof_li_teach_info;
	permanent = TRUE;
	description = "Chci zdokonalit své schopnosti!";
};


func int dia_torlof_li_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_aboutisland) && Npc_KnowsInfo(hero,dia_torlof_li_whereguys) && Npc_KnowsInfo(hero,dia_torlof_li_island))
	{
		return TRUE;
	};
};

func void dia_torlof_li_teach_info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Teach_15_00");	//Chci zdokonalit své schopnosti!
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};

func void dia_torlof_li_teach_back()
{
	Info_ClearChoices(dia_torlof_li_teach);
};

func void dia_torlof_li_teach_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};

func void dia_torlof_li_teach_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};

func void dia_torlof_li_teach_str_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};

func void dia_torlof_li_teach_str_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(dia_torlof_li_teach);
	Info_AddChoice(dia_torlof_li_teach,Dialog_Back,dia_torlof_li_teach_back);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_torlof_li_teach_dex_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_torlof_li_teach_dex_5);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_torlof_li_teach_str_1);
	Info_AddChoice(dia_torlof_li_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_torlof_li_teach_str_5);
};


instance DIA_TORLOF_LI_PICKPOCKET(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 900;
	condition = dia_torlof_li_pickpocket_condition;
	information = dia_torlof_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_torlof_li_pickpocket_condition()
{
	return C_Beklauen(76,120);
};

func void dia_torlof_li_pickpocket_info()
{
	Info_ClearChoices(dia_torlof_li_pickpocket);
	Info_AddChoice(dia_torlof_li_pickpocket,Dialog_Back,dia_torlof_li_pickpocket_back);
	Info_AddChoice(dia_torlof_li_pickpocket,DIALOG_PICKPOCKET,dia_torlof_li_pickpocket_doit);
};

func void dia_torlof_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_torlof_li_pickpocket);
};

func void dia_torlof_li_pickpocket_back()
{
	Info_ClearChoices(dia_torlof_li_pickpocket);
};


instance DIA_TORLOF_LI_STORM(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_storm_condition;
	information = dia_torlof_li_storm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_li_storm_condition()
{
	return TRUE;
};

func void dia_torlof_li_storm_info()
{
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_01");	//Konečně jsi přišel k sobě. Jak se cítíš?
	AI_Output(other,self,"DIA_Torlof_LI_Storm_01_02");	//Hlavu mám jako kdyby mě po ní někdo praštil trámem.
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_03");	//Ano...(směje se) Něco podobného se opravdu stalo příteli!
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_08");	//Během bouře jsi mi pomohl vyrovnat kormidlo a vše vypadalo dobře, ale pak nás jedna vlna doslova srazila!
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_09");	//Tebe odhodila a hlavou si narazil do dřevřného zábradlí.
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_13");	//Sakra (vážnř) Ta bouře by nás brzy poslala na onen svět!
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_15");	//Díky Innosovi, že nám přivedl do cesty tento ostrov!
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_21");	//Tady v zátoce se můžeme cítit bezpečně.
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_23");	//Ale ještě se neradujme. Teď musíme přemýšlet jak opravit loď.
	AI_Output(other,self,"DIA_Torlof_LI_Storm_01_24");	//Jak vážná oprava to bude?
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_25");	//Bude to docela náročná oprava. Ta bouře dala lodi dost zabrat.
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_26");	//Ty díry zamozřejmě zaděláme, ale je rozbité kormidlo - bez něj se nikam nedostanem!
	AI_Output(other,self,"DIA_Torlof_LI_Storm_01_27");	//Kolik ti to zabere času?
	AI_Output(self,other,"DIA_Torlof_LI_Storm_01_28");	//Nevím. Pár dní, možná týden, možná víc. Dám ti vědět!
};


instance DIA_TORLOF_LI_REPAIR(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_repair_condition;
	information = dia_torlof_li_repair_info;
	permanent = FALSE;
	description = "Můžu nějak pomoct s opravou?";
};


func int dia_torlof_li_repair_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_storm))
	{
		return TRUE;
	};
};

func void dia_torlof_li_repair_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_Repair_01_01");	//Můžu nějak pomoct s opravou?
	AI_Output(self,other,"DIA_Torlof_LI_Repair_01_02");	//Ty?! Hmm...(přemýšlí) To nevím.
	AI_Output(self,other,"DIA_Torlof_LI_Repair_01_03");	//Pro začátek musíme prozkoumat škody. A pak vymyslet jak to všechno opravit.
	AI_Output(self,other,"DIA_Torlof_LI_Repair_01_04");	//Takže teď pomoc nepotřebuji, stav se pak...
	AI_Output(other,self,"DIA_Torlof_LI_Repair_01_05");	//Dobrá.
	TORLOFLITIMER = Wld_GetDay();
	MIS_REPAIRSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_REPAIRSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_Running);
	B_LogEntry(TOPIC_REPAIRSHIP,"Řekl jsem Torlofovi, že mu omohu s opravou lodi. On ale pověděl, že první musí prozkoumat škody. Mám se stavit pak.");
};


instance DIA_TORLOF_LI_REPAIRHELP(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_repairhelp_condition;
	information = dia_torlof_li_repairhelp_info;
	permanent = FALSE;
	description = "Jak jde oprava?";
};


func int dia_torlof_li_repairhelp_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && (TORLOFLITIMER <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_torlof_li_repairhelp_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_RepairHelp_01_01");	//Jak jde oprava?
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_02");	//Dobře že se ptáš, hodila by se mi pomoc.
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_05");	//Zkoumal jsem škody na lodi a dospěl k názoru, že většina z nich je malá.
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_06");	//Ale velký problém je kormidlo!
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_08");	//To nefunguje. Je úplně rozbité.
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_09");	//Bez něj je loď neovladatelná!
	AI_Output(other,self,"DIA_Torlof_LI_RepairHelp_01_10");	//Co budeme dělat?
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_11");	//Problém bude v jednom z převodů.
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_12");	//Pravděpodobně se tak stalo během bouře. Převod má zlomený zub a z toho důvodu hřídel ozubených kol ztratila kontrolu.
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_13");	//Takže budeme muset najít náhradu.
	AI_Output(other,self,"DIA_Torlof_LI_RepairHelp_01_14");	//Ale kde seženeme nové?
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_15");	//To je to, co musíš udělat. Najít a přinést náhradu. Bude stačit jakékoli ozubené kolo!
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelp_01_17");	//Jiný způsob není...(smutně) Jinak tady budeme trčet hodně dlouho!
	AI_Output(other,self,"DIA_Torlof_LI_RepairHelp_01_18");	//Uvidím, co se dá dělat.
	B_LogEntry(TOPIC_REPAIRSHIP,"Torlof mě požádal o pomoc při opravě kormidla. Porušilo se hřídel ozubených kol - upadl jí zub a loď je takhle neovladatelná. Musím najít jakoukoliv ozubenou hřídel a přinést ji kapitánovi.");
};


instance DIA_TORLOF_LI_REPAIRHELPDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_repairhelpdone_condition;
	information = dia_torlof_li_repairhelpdone_info;
	permanent = FALSE;
	description = "Něco jsem našel.";
};


func int dia_torlof_li_repairhelpdone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && Npc_KnowsInfo(hero,dia_torlof_li_repairhelp) && (Npc_HasItems(hero,itmi_stuff_gearwheel_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_li_repairhelpdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Torlof_LI_RepairHelpDone_01_01");	//Něco jsem našel.
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_02");	//Co přesně?
	AI_Output(other,self,"DIA_Torlof_LI_RepairHelpDone_01_03");	//Tady, dívej.
	B_GiveInvItems(other,self,itmi_stuff_gearwheel_02,1);
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_04");	//Velmi zajímavé! Kde jsi to našel?
	AI_Output(other,self,"DIA_Torlof_LI_RepairHelpDone_01_05");	//V jedné malé pyramidě, kterou jsem našel ve středu ostrova.
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_06");	//To vůbec není špatné! Určitě to nebyla ztráta času.
	AI_Output(other,self,"DIA_Torlof_LI_RepairHelpDone_01_07");	//Pomůže opravit kormidlo?
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_08");	//Hmm...(zamyšleně) Uvidíme.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_10");	//Nevěřím svým očím, ono to asi funguje!
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_12");	//(vážně) Počkej ještě pár sekund...
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_14");	//Ano! Zdá se že to půjde.
	AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_15");	//Hlavní je, že teď se můžeme dostat z ostrova!
	AI_Output(other,self,"DIA_Torlof_LI_RepairHelpDone_01_16");	//Kdy odplujeme?
	MIS_REPAIRSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_SUCCESS);
	B_LogEntry(TOPIC_REPAIRSHIP,"Přinesl jsem Torlofovi ozubené kolečko. Perfektně sedlo.");
	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_17");	//Klidně teď!
		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_18");	//Dobrá pak tedy jdi informovat posádku.
			AI_Output(other,self,"DIA_Torlof_LI_RepairHelpDone_01_20");	//Jdu pro ně.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			Log_AddEntry(TOPIC_GATHERCREW,"Torlof mi řekl, abych zavolal posádku z pobřeží.");
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_21");	//Stačí říct - a já okamžitě zvednu plachty.
			AI_Output(other,self,"DIA_Torlof_LI_RepairHelpDone_01_22");	//Dobrá.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else
	{
		TORLOFLITIMERAWAY = Wld_GetDay();
		AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_23");	//Ne tak jenoduše. Kolečko máme, ale ještě musíme opravit zbytek lodi.
		AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_24");	//I takovéto malé poškození by v mři bylo smrtící!
		if(MIS_LOSTISLAND == LOG_Running)
		{
			AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_25");	//Hlavně když nevíme kde jsme!
		}
		else if(MIS_CHANGECOURSE == LOG_Running)
		{
			AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_26");	//Hlavně když jsme ještě nevyřešili kam plout.
		};
		AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_27");	//Nebudeme spěchat!
		AI_Output(other,self,"DIA_Torlof_LI_RepairHelpDone_01_28");	//Když to tak chceš.
		AI_Output(self,other,"DIA_Torlof_LI_RepairHelpDone_01_29");	//Chci.
	};
};


instance DIA_TORLOF_LI_AWAY(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_away_condition;
	information = dia_torlof_li_away_info;
	permanent = TRUE;
	description = "Kdy vyplujeme?";
};


func int dia_torlof_li_away_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_SUCCESS) && (CANAWAYFROMLI == FALSE) && (TORLOFLITIMERAWAY <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_torlof_li_away_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_Away_01_00");	//Kdy vyplujeme?

	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_LI_Away_01_01");	//Klidně teď!

		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Torlof_LI_Away_01_02");	//Zavolej posádku. A můžeme hned vyplout.
			AI_Output(other,self,"DIA_Torlof_LI_Away_01_04");	//Dobrá, jdu jim to říct.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			B_LogEntry(TOPIC_GATHERCREW,"Torlof řekl, abych zavolal posádku.");
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_LI_Away_01_05");	//Stačí říct a zvedáme plachty.
			AI_Output(other,self,"DIA_Torlof_LI_Away_01_06");	//Dobře.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else if(MIS_LOSTISLAND == LOG_Running)
	{
		AI_Output(self,other,"DIA_Torlof_LI_Away_01_07");	//Ale stále nevíme kde jsme!
		AI_Output(self,other,"DIA_Torlof_LI_Away_01_08");	//Takže jsme tam kde na začátku.
	}
	else if(MIS_CHANGECOURSE == LOG_Running)
	{
		AI_Output(self,other,"DIA_Torlof_LI_Away_01_10");	//Ale ještě ses nedohodl kam plout!
		AI_Output(self,other,"DIA_Torlof_LI_Away_01_11");	//Takže jsme tam kde na začátku.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LI_Away_01_13");	//Ale ještě není dokončena oprava.
		AI_Output(self,other,"DIA_Torlof_LI_Away_01_14");	//Takže se stav pozděj.
	};
};


instance DIA_TORLOF_LI_AWAYDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_awaydone_condition;
	information = dia_torlof_li_awaydone_info;
	permanent = TRUE;
	description = "Odplouváme.";
};


func int dia_torlof_li_awaydone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if((CANAWAYFROMLI == TRUE) && (CAPITANORDERLIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_li_awaydone_info()
{
	var int crewlicountmiss;
	var string concatText;
	var string text;
	var string text2;
	AI_Output(other,self,"DIA_Torlof_LI_AwayDone_01_00");	//Odplouváme.

	if(NOPEOPLEONLANDLI == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_01");	//Dobře, zavolej posádku z pobřeží.
		AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_02");	//Můžeš si odpočinout ve své kabině.
		CAPITANORDERLIAWAY = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIONBOARD == TRUE) && (GORNLIHERE == TRUE) && (GORNLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_fighter_li,"RunAway");
			AI_Teleport(pc_fighter_li,"SHIP_DECK_03");
			GORNLIHEREDONE = TRUE;
		};
		if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE) && (MILTENLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_mage_li,"RunAway");
			AI_Teleport(pc_mage_li,"SHIP_CREW_19");
			MILTENLIHEREDONE = TRUE;
		};
		if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE) && (LESTERLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_psionic_li,"RunAway");
			AI_Teleport(pc_psionic_li,"SHIP_DECK_28");
			LESTERLIHEREDONE = TRUE;
		};
		if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE) && (DIEGOLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_thief_li,"RunAway");
			AI_Teleport(pc_thief_li,"SHIP_CREW_04");
			DIEGOLIHEREDONE = TRUE;
		};
		if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE) && (ANGARLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(djg_705_angar_li,"RunAway");
			AI_Teleport(djg_705_angar_li,"SHIP_CREW_03");
			ANGARLIHEREDONE = TRUE;
		};
		if(LICREWONBOARD == TRUE)
		{
			B_GivePlayerXP(500);
			AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_06");	//Dobrá, zavolej chlapce z pobřeží.
			AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_07");	//Můžeš si odpočinout ve své kabině.
			CAPITANORDERLIAWAY = TRUE;
			MIS_GATHERCREW = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_SUCCESS);
			B_LogEntry(TOPIC_GATHERCREW,"Posádka je na lodi a můžeme plout!");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_11");	//Ale hoši se ještě nevrátili z pobřeží. Nenecháme je tu!
			AI_Output(other,self,"DIA_Torlof_LI_AwayDone_01_12");	//A kdo chybí?!
			AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_13");	//(rozhlíží se) Hmm, kouknu se...
			if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE) && (GORNLIONBOARD == FALSE))
			{
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_14");	//... Gorn
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE) && (MILTENLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_15");	//... Milten
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE) && (LESTERLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_16");	//... Lester
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE) && (DIEGOLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_17");	//... Diego
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE) && (ANGARLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_18");	//... Cor Angar
				crewlicountmiss = crewlicountmiss + 1;
			};
			AI_Output(self,other,"DIA_Torlof_LI_AwayDone_01_19");	//Ostatní jsou na místě!
			if(crewlicountmiss >= 2)
			{
				AI_Output(other,self,"DIA_Torlof_LI_AwayDone_01_20");	//Dobře, jdu pro ně.
			}
			else
			{
				AI_Output(other,self,"DIA_Torlof_LI_AwayDone_01_21");	//Dobře, jdu pro ně.
			};
		};
	};
};


instance DIA_TORLOF_LI_ISLAND(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_island_condition;
	information = dia_torlof_li_island_info;
	permanent = FALSE;
	description = "Kde jsme a co je to za ostrov?";
};


func int dia_torlof_li_island_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_storm))
	{
		return TRUE;
	};
};

func void dia_torlof_li_island_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_Island_01_01");	//Kde jsme a co je to za ostrov?
	AI_Output(self,other,"DIA_Torlof_LI_Island_01_02");	//Stejně jako ty jsem tu poprvé!
	AI_Output(self,other,"DIA_Torlof_LI_Island_01_03");	//A nemám absolutně žádný tušení kde jsme.
	AI_Output(self,other,"DIA_Torlof_LI_Island_01_05");	//Jen Innos ví kde jsme.
	AI_Output(other,self,"DIA_Torlof_LI_Island_01_07");	//Co budem dělat?
	AI_Output(self,other,"DIA_Torlof_LI_Island_01_13");	//Jestli zjistíme aspoň v jaké části moře jsme, dokážu nás vrátit.
	AI_Output(self,other,"DIA_Torlof_LI_Island_01_15");	//Zkus najít nějaký informace na ostrově.
	AI_Output(self,other,"DIA_Torlof_LI_Island_01_16");	//Myslím že odpověd najdeš na ostrově.
	MIS_LOSTISLAND = LOG_Running;
	Log_CreateTopic(TOPIC_LOSTISLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_Running);
	B_LogEntry(TOPIC_LOSTISLAND,"Ztratili jsme se opravdu důkladně. Kapitán nemá páru kde jsme. Potřebujeme zjistit naši polohu.");
	Log_AddEntry(TOPIC_LOSTISLAND,"Po rozhovoru s Torlofem na toto téma jsem se dozvěděl, že možná něco najdu na ostrově. Jako bych to nevěděl. No co, jdu tam.");
};


instance DIA_TORLOF_LI_ISLANDPROGRESS(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_islandprogress_condition;
	information = dia_torlof_li_islandprogress_info;
	permanent = FALSE;
	description = "Podívej se, našel sem tuto tabulku.";
};


func int dia_torlof_li_islandprogress_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (Npc_HasItems(hero,itwr_lostislandmap) >= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_li_islandprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgress_01_00");	//Podívej se, našel sem tuto tabulku.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_01");	//Hmm...(překvapeně) Zajímavý kousek!
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgress_01_03");	//Ukazuje nějaký podivný druh symbolů.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_05");	//(se zájmem) Podívám se pořádně.
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgress_01_06");	//Tady je.
	B_GiveInvItems(other,self,itwr_lostislandmap,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_07");	//Hmm...(zamyšleně) Je to všechno nějak divný.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_08");	//(váhavě) Ačkoliv, když se na to podívám z úhlu, vypadá to jako...
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_10");	//Nejsem si jistý, ale ta kamenná tabulka se podobá mapě.
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgress_01_11");	//Mapě?!
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_12");	//Ano, mapě! Ale nevím, co přesně ukazuje...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_13");	//Zdá se že na té tabulce jsou vyznačená ještě nějaká čísla. Možná sou klíčem k rozluštění obsahu tabulky.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_17");	//Jsou to asi jen dohady, ale možná je tu šířka a délka ostrova.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_18");	//Jestli to ty čísla opravdu obsahují, tak můžu zjistit kde jsme.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_19");	//Ale abych mohl upřesnit naši polohu budu potřebovat námořní sextant.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_21");	//Bez něj nemůžu určit naši polohu
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgress_01_22");	//Dobře! Pokusím se ho najít.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_23");	//Zkus to, ale nemyslím si, že na tomhle ostrově něco takového bude.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgress_01_24");	//Ale možná budeš mít zase štěstí jako vždy...(směje se) A podaěí se ti ho najít!
	CAPNEEDSEXTANT = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Ukázal jsem Torlofovi kamennou tabulku, kterou jsem našel na ostrově. Když jsme ji blíže prozkoumali, zjistil, že to může být mapa. Nicméně bez sextantu nemůže určit přesnou naši polohu. Proto ho musím někde na ostrově najít.");
};


instance DIA_TORLOF_LI_ISLANDPROGRESSNEXT(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_islandprogressnext_condition;
	information = dia_torlof_li_islandprogressnext_info;
	permanent = FALSE;
	description = "Mám sextant.";
};


func int dia_torlof_li_islandprogressnext_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (CAPNEEDSEXTANT == TRUE) && (Npc_HasItems(hero,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_li_islandprogressnext_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgressNext_01_00");	//Mám sextant.
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgressNext_01_01");	//(překvapeně) Opravdu?
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgressNext_01_03");	//Tak mi ho dej.
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgressNext_01_04");	//Tady, ber.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgressNext_01_05");	//Výborně! Nyný se pokusím vyluštit ty divné znaky.
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgressNext_01_06");	//Jak dlouho to bude trvat?
	AI_Output(self,other,"DIA_Torlof_LI_IslandProgressNext_01_07");	//Pár dní.
	AI_Output(other,self,"DIA_Torlof_LI_IslandProgressNext_01_08");	//Dobře.
	TORLOFDESCRTIMER = Wld_GetDay();
	TORLOFBEGINSEARCH = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Přinesl jsem Torlofovi sextant. Nyní může začít počítat. Mám za ním zajít za tři dny.");
};

instance DIA_TORLOF_LI_SEARCH(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 3;
	condition = dia_torlof_li_search_condition;
	information = dia_torlof_li_search_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_torlof_li_search_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if((MIS_LOSTISLAND == LOG_Running) && (TORLOFBEGINSEARCH == TRUE) && (TORLOFBEGINSEARCH <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_torlof_li_search_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Torlof_LI_Search_01_00");	//Dobře že jsi tu, mám ty výpočty.
	AI_Output(other,self,"DIA_Torlof_LI_Search_01_01");	//Jak to vypadá?
	AI_Output(self,other,"DIA_Torlof_LI_Search_01_04");	//Hmm...(zamyšleně) Ty symboly opravdu něco znamenají!
	AI_Output(self,other,"DIA_Torlof_LI_Search_01_05");	//Ověřil sem si na mapě naši minulou polohu a určil novou. Udělal jsem malé odchylky kvůli bouřce...
	AI_Output(self,other,"DIA_Torlof_LI_Search_01_06");	//A pak jsem vypočital čiselné údaje které byly namalováný na zadní straně kamenné tabulky kterou si našel.
	AI_Output(other,self,"DIA_Torlof_LI_Search_01_08");	//A co tím myslíš?
	AI_Output(self,other,"DIA_Torlof_LI_Search_01_09");	//Našel jsem místo, kde bychom měli být.
	AI_Output(self,other,"DIA_Torlof_LI_Search_01_10");	//Jistě to není přesné, ale vím, kde přibližně jsme!
	AI_Output(self,other,"DIA_Torlof_LI_Search_01_12");	//Ano. Jakmile bude loď připravena, můžeme plout.
	AI_Output(self,other,"DIA_Torlof_LI_Search_01_17");	//(vážně) Tady, vem si tu mapu. Ta označuje ostrov a přesnou cestu k němu.
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	MIS_LOSTISLAND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_SUCCESS);
	B_LogEntry(TOPIC_LOSTISLAND,"Torlof mi řekl, že dokončil výpočty. Torlof našel místo, kde asi jsme. Až bude vše připraveno, můžeme odplout.");
};


instance DIA_TORLOF_LI_ABOUTISLAND(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 1;
	condition = dia_torlof_li_aboutisland_condition;
	information = dia_torlof_li_aboutisland_info;
	permanent = FALSE;
	description = "Může být na ostrově někdo živý?";
};


func int dia_torlof_li_aboutisland_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_island))
	{
		return TRUE;
	};
};

func void dia_torlof_li_aboutisland_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_AboutIsland_01_01");	//Může být na ostrově někdo živý?
	AI_Output(self,other,"DIA_Torlof_LI_AboutIsland_01_02");	//Těžko...(pochybuje) Pravděpodobně je ostrov neobydlen.
	AI_Output(self,other,"DIA_Torlof_LI_AboutIsland_01_05");	//Když si to logicky vezmeš.
	AI_Output(self,other,"DIA_Torlof_LI_AboutIsland_01_06");	//Kdyby tu někdo byl, už bychom o něm věděli.
	AI_Output(self,other,"DIA_Torlof_LI_AboutIsland_01_07");	//Kromě pár ještěrů na pobřeží jsme ale nikoho neviděli.
};


instance DIA_TORLOF_LI_WHEREGUYS(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_whereguys_condition;
	information = dia_torlof_li_whereguys_info;
	permanent = FALSE;
	description = "Kde jsou ostatní chlapi?!";
};


func int dia_torlof_li_whereguys_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_storm))
	{
		return TRUE;
	};
};

func void dia_torlof_li_whereguys_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_WhereGuys_01_01");	//Kde jsou ostatní chlapi?!
	AI_Output(self,other,"DIA_Torlof_LI_WhereGuys_01_02");	//Většina chlapů šla na břeh, jakmile sme ztrozkotali tady na tom ostrově.
	AI_Output(self,other,"DIA_Torlof_LI_WhereGuys_01_04");	//No...(váhavě) Chtěli prozkoumat pobřeží ostrov
};


instance DIA_TORLOF_LI_WHEREGOLD(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_wheregold_condition;
	information = dia_torlof_li_wheregold_info;
	permanent = FALSE;
	description = "Kam se podělo mé zlato?";
};


func int dia_torlof_li_wheregold_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_storm) && (MIS_MISSMYGOLD == LOG_Running) && (BEGINGOLDSEEK == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_li_wheregold_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_WhereGold_01_01");	//Kam se podělo mé zlato?
	AI_Output(self,other,"DIA_Torlof_LI_WhereGold_01_02");	//(nechápavě) O čem mluvíš, příteli?!
	AI_Output(other,self,"DIA_Torlof_LI_WhereGold_01_03");	//O velké hromadě zlata z ostrova Irdorath, kterou jsem vlastnoručně nakládal!
	AI_Output(self,other,"DIA_Torlof_LI_WhereGold_01_08");	//Promiň chlape, ale nemám představu kde je!
	BEGINGOLDSEEK = TRUE;
	Wld_InsertItem(itmi_misstorlofthing,"FP_ITEM_CAPITANTHING");
	B_LogEntry(TOPIC_MISSMYGOLD,"Torlof říká, že neví, kde je mé zlato... Měl bych se prý zeptat ostatních členů posádky.");
};


instance DIA_TORLOF_LI_MISSCOMPAS(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_misscompas_condition;
	information = dia_torlof_li_misscompas_info;
	permanent = FALSE;
	description = "Gorn říkal, že jsi ztratil svůj kompas.";
};


func int dia_torlof_li_misscompas_condition()
{
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLABOUTCOMPAS == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		return TRUE;
	};
};

func void dia_torlof_li_misscompas_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Torlof_LI_MissCompas_01_01");	//Gorn říkal, že jsi ztratil svůj kompas
	AI_Output(self,other,"DIA_Torlof_LI_MissCompas_01_02");	//Ano...(zklamaně)
	AI_Output(self,other,"DIA_Torlof_LI_MissCompas_01_04");	//V průběhu bouře mi asi vypadl z kapsy.
	AI_Output(self,other,"DIA_Torlof_LI_MissCompas_01_05");	//Ale nejsem si jistý, kde je...
	AI_Output(self,other,"DIA_Torlof_LI_MissCompas_01_07");	//Eh...(smutně) Byl to dar na památku od jednoho velmi starého přítele.
	AI_Output(self,other,"DIA_Torlof_LI_MissCompas_01_08");	//Vždy jsem věřil, že mi nosí štěstí!
	AI_Output(self,other,"DIA_Torlof_LI_MissCompas_01_09");	//Ale tentokrát se ode mne odvrátil.
	AI_Output(other,self,"DIA_Torlof_LI_MissCompas_01_10");	//Hledal jsi ho?!
	AI_Output(self,other,"DIA_Torlof_LI_MissCompas_01_11");	//Jasně že hledal...(smutně) Na všech palubách, ale prostě tu není!
	B_LogEntry(TOPIC_MISSMYGOLD,"Zeptal jsem se Torlofa na jeho kompas. Byl mu velmi cenný a ještě ho nenašel. Měl bych se po něm podívat.");
};


instance DIA_TORLOF_LI_WHEREGOLDDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_wheregolddone_condition;
	information = dia_torlof_li_wheregolddone_info;
	permanent = FALSE;
	description = "Je to tvůj kompas?";
};


func int dia_torlof_li_wheregolddone_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running) && (Npc_HasItems(hero,itmi_misstorlofthing) >= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_li_wheregolddone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Torlof_LI_WhereGoldDone_01_01");	//Je to tvůj kompas?
	B_GiveInvItems(other,self,itmi_misstorlofthing,1);
	AI_Output(self,other,"DIA_Torlof_LI_WhereGoldDone_01_04");	//(nadšeně) Příteli... Můj starý kompas!
	AI_Output(self,other,"DIA_Torlof_LI_WhereGoldDone_01_05");	//Jak jsi ho našel?
	AI_Output(other,self,"DIA_Torlof_LI_WhereGoldDone_01_08");	//Zajímalo by mě kde jste schovali mé zlato.
	AI_Output(self,other,"DIA_Torlof_LI_WhereGoldDone_01_09");	//Co tím naznačuješ příteli?
	AI_Output(other,self,"DIA_Torlof_LI_WhereGoldDone_01_12");	//Na tvém místě bych řekl pravdu.
	AI_Output(self,other,"DIA_Torlof_LI_WhereGoldDone_01_13");	//Pravdu?! Hmmm... (zmatený) Ale...
	AI_Output(self,other,"DIA_Torlof_LI_WhereGoldDone_01_15");	//Ach, jo! Jak to říct...(váhavě) Posádka ho musela vyhodit přes palubu.
	AI_Output(self,other,"DIA_Torlof_LI_WhereGoldDone_01_18");	//Tak to je...(vážně) Loď byla přetížena, bylo by z nás žrádlo pro ryby.
	AI_Output(other,self,"DIA_Torlof_LI_WhereGoldDone_01_19");	//Opravdu bylo nutné vyhodit všechno zlato?!
	AI_Output(self,other,"DIA_Torlof_LI_WhereGoldDone_01_27");	//Ano bohužel. Ale stále budeš mít šanci stát se bohatý!
	AI_Output(self,other,"DIA_Torlof_LI_WhereGoldDone_01_28");	//Raději bys měl děkovat Innosovi, že žijeme! To je mnohem důležitější.
	MIS_MISSMYGOLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MISSMYGOLD,LOG_SUCCESS);
	B_LogEntry(TOPIC_MISSMYGOLD,"Nyní vím, kde je mé zlato. Posádka ho v bouři vyhodila přes plalubu, protože loď byla přetížena. Neřekli mi to, protože si mysleli, že se naštvu. Což měli pravdu.");
};


instance DIA_TORLOF_LI_HALLO(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 4;
	condition = dia_torlof_li_hallo_condition;
	information = dia_torlof_li_hallo_info;
	permanent = TRUE;
	description = "Vše v pohodě?";
};


func int dia_torlof_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_torlof_li_aboutisland) && Npc_KnowsInfo(hero,dia_torlof_li_whereguys) && Npc_KnowsInfo(hero,dia_torlof_li_island))
	{
		return TRUE;
	};
};

func void dia_torlof_li_hallo_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_Hallo_15_00");	//Vše v pohodě?
	AI_Output(self,other,"DIA_Torlof_LI_Hallo_01_01");	//Ale jo.
};


instance DIA_TORLOF_LI_BRINGFOODDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_bringfooddone_condition;
	information = dia_torlof_li_bringfooddone_info;
	permanent = FALSE;
	description = "Jak jsme na tom se zásobami?";
};


func int dia_torlof_li_bringfooddone_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (GORNTELLABOUTMEAT == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 24))
	{
		return TRUE;
	};
};

func void dia_torlof_li_bringfooddone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Torlof_LI_BringFoodDone_01_01");	//Jak jsme na tom se zásobami?
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDone_01_02");	//Moc dobře ne. Pomalu docházejí.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDone_01_03");	//Proč se ptáš?
	AI_Output(other,self,"DIA_Torlof_LI_BringFoodDone_01_04");	//Pár chlapů si stěžuje na omezené příděly.
	AI_Output(other,self,"DIA_Torlof_LI_BringFoodDone_01_05");	//Podle mého názoru - nejsou moc rádi!
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDone_01_06");	//Bohužel jim nemůžu dát více.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDone_01_07");	//S apetitem některých našich chlapů by tu za chvíli nic nebylo.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDone_01_08");	//Zejména Gorn! Kdybych nechal volnou kuchyni vyžral by jí do pár minut!
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDone_01_09");	//A co budeme dělat potom?
	AI_Output(other,self,"DIA_Torlof_LI_BringFoodDone_01_12");	//Přinesl jsem čerstvé maso. Tady máš pár kusů.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDone_01_17");	//Och! To je výborné! Nějaký den to postačí.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDone_01_23");	//Tak běž do kuchyně to maso osmažit.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDone_01_24");	//Pak se vrať ke mně.
	B_LogEntry(TOPIC_BRINGFOOD,"Torlof byl překvapen, že jsem získal čerstvé maso. Nicméně mě odmítl, protože nemá čas je upéci. Měl bych to udělat já a donést mu ho!");
};


instance DIA_TORLOF_LI_BRINGFOODDONEEXT(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_bringfooddoneext_condition;
	information = dia_torlof_li_bringfooddoneext_info;
	permanent = FALSE;
	description = "Mám pečené maso.";
};


func int dia_torlof_li_bringfooddoneext_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_torlof_li_bringfooddone) && (Npc_HasItems(hero,ItFoMutton) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_torlof_li_bringfooddoneext_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_BringFoodDoneExt_01_01");	//Mám pečené maso.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDoneExt_01_02");	//Dobrá, dej mi ho.
	Info_ClearChoices(dia_torlof_li_bringfooddoneext);
	if(GORNTELLABOUTMEAT == TRUE)
	{
		Info_AddChoice(dia_torlof_li_bringfooddoneext,"(Tady, ber 14 pečeného masa a jablek)",dia_torlof_li_bringfooddoneext_fifty);
	};
	Info_AddChoice(dia_torlof_li_bringfooddoneext,"Tady, ber.",dia_torlof_li_bringfooddoneext_sixty);
};

func void dia_torlof_li_bringfooddoneext_fifty()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_00");	//Tady, ber.
	B_GiveInvItems(other,self,ItFoMutton,14);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,14);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_01");	//Hmmm...(zamyšleně) A co ostatní?!
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_02");	//Zdá se mi, že jsi měl více masa.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_13");	//No, nic už to neřešme.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDoneExt_Fifty_01_14");	//Ale díky!
	NOTTHANKSTELLALLMEAT = TRUE;
	Info_ClearChoices(dia_torlof_li_bringfooddoneext);
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Dal jsem Torlofovi maso, ale nebyl nadšený, že jsem část dal Gornovi... Ale teď je to už jedno.");
};

func void dia_torlof_li_bringfooddoneext_sixty()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_00");	//Tady.
	B_GiveInvItems(other,self,ItFoMutton,24);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,24);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_01");	//Super! Nyní všichni budou zajištěni na několik dalších dnů.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_02");	//A kromě toho můžu i trochu zvýšit příděl.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_03");	//Bude to pro ně dobrá zpráva.
	AI_Output(self,other,"DIA_Torlof_LI_BringFoodDoneExt_Sixty_01_04");	//A to vše díky tobě, příteli
	Info_ClearChoices(dia_torlof_li_bringfooddoneext);
	THANKSTELLALLMEAT = TRUE;
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Dal jsem Torlofovi maso. Nyní členové posádky dostanou o něco větší příděl.");
};


instance DIA_TORLOF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_findmagicorecave_condition;
	information = dia_torlof_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Mám zajímavé zprávy.";
};


func int dia_torlof_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && ((FINDLIORE_CAVE_01 == TRUE) || (FINDLIORE_CAVE_02 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_torlof_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCave_01_01");	//Mám zajímavé zprávy.
	if((FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCave_01_03");	//Našel jsem ložisko magické rudy.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_04");	//Opravdu? (udiveně)?
		AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCave_01_05");	//Celý ostrov je jí naplněný.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_06");	//Hmm...(překvapeně) To jsou dost neobvyklé novinky.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_07");	//Magická ruda je velmi vzácná. Hlavně v tak obrovském množství.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_08");	//Co já vím, tak jediná velká ložiska jsou v Nordmaru a Khorinisu.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_09");	//Jestli máš pravdu, je to opravdu nádhera!
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_10");	//Ale s největší pravděpodobností to bude jen ruda smíšená s obyčejným kamenem.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_16");	//Dones mi důkaz. Stačí, když mi doručíš kousek rudy z ostrova. 
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_17");	//Myslím, že to bys udělat mohl.
		AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCave_01_18");	//Dobrá, kousek ti donesu.
		LITESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Řekl jsem Torlofovi, že na ostrově jsem našel ložisko rudy. Byl překvapen a jako důkaz chce, abych mu donesl vzorek rudy z ostrova.");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCave_01_19");	//V jedné jeskyni na ostrově je ložisko rudy.
		AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCave_01_20");	//Pravděpodobně jsou tu ukryty ještě větší zásoby!
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_21");	//Hmm...(překvapeně) To jsou dost neobvyklé novinky.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_22");	//Magická ruda je velmi vzácná! Hlavně v tak obrovském množství.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_23");	//Já myslel, že jediná velká ložiska jsou v Nordmaru a na Khorinisu.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_24");	//Tohle je opravdu velký objev!
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_25");	//Ale možná to bude jen příměs v kamenech.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_26");	//Kromě toho jí tu nemusí být tolik.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_29");	//Na tvém místě bych zkusil ještě podrobněji prozkoumat ostrov a hledat rudu.
		AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCave_01_30");	//Ale bude zázrak, když najdeš alespoň trochu!
		LIBEFORETESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Řekl jsem Torlofovi, že jsem našel ložisko rudy. Silně pochybuje o tom, že by tu bylo větší ložisko, takže chce, abych našel další ložiska.");
	};
};


instance DIA_TORLOF_LI_FINDMAGICORECAVEPROGRESS(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_findmagicorecaveprogress_condition;
	information = dia_torlof_li_findmagicorecaveprogress_info;
	permanent = FALSE;
	description = "Prohlédl jsem ostrov.";
};


func int dia_torlof_li_findmagicorecaveprogress_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == TRUE) && (FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_li_findmagicorecaveprogress_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCaveProgress_01_01");	//Prohlédl jsem ostrov...
	AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCaveProgress_01_02");	//A?!
	AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCaveProgress_01_03");	//... A našel jsem ještě jednu jeskyni s rudou, ve které je jí ještě víc!
	AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCaveProgress_01_06");	//Tomu se dá těžko věřit!
	AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCaveProgress_01_12");	//Takže mi přines malý kousek, abych ho zhodnotil.
	AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCaveProgress_01_13");	//Pak se o tom budeme bavit dál.
	AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCaveProgress_01_14");	//Dobrá, donesu ti to.
	LITESTOK = TRUE;
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Řekl jsem Torlofovi, že jsem našel ještě další ložisko. Požádal mě, abych mu donesl kousek rudy z ložiska, aby zhodnotil její kvalitu.");
};


instance DIA_TORLOF_LI_FINDMAGICORECAVEDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_findmagicorecavedone_condition;
	information = dia_torlof_li_findmagicorecavedone_info;
	permanent = FALSE;
	description = "Mám pro tebe kousek rudy.";
};


func int dia_torlof_li_findmagicorecavedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (TESTNUGGETGAVE == TRUE) && (Npc_HasItems(hero,itmi_testnugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_li_findmagicorecavedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Torlof_LI_FindMagicOreCaveDone_01_01");	//Mám pro tebe kousek rudy.
	AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCaveDone_01_02");	//Bezva! Ukaž mi to.
	B_GiveInvItems(other,self,itmi_testnugget,1);
	AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCaveDone_01_04");	//Hmmm... (velmi udiveně) chlape, ty jsi měl pravdu!
	AI_Output(self,other,"DIA_Torlof_LI_FindMagicOreCaveDone_01_05");	//To je opravdu ruda! Té největší kvality!
	MIS_FINDMAGICORECAVE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_SUCCESS);
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Donesl jsem Torlofovi kousek rudy. Už nepochybuje o mých slovech.");
};


instance DIA_TORLOF_LI_CHANGECOURSE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_changecourse_condition;
	information = dia_torlof_li_changecourse_info;
	permanent = FALSE;
	description = "Co budeme dělat teď?";
};


func int dia_torlof_li_changecourse_condition()
{
	if(MIS_FINDMAGICORECAVE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_torlof_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourse_01_01");	//Co budeme dělat teď?
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_01_02");	//Hmm...(zmateně) Ještě nevím!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_01_03");	//Bylo by dobré zajistit rudu.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_01_04");	//Na kontinentu by za ni byla hromada zlata!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_01_07");	//Naše loď je už tak plná krabic a ruda taky váží hodně!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_01_08");	//Kromě toho nemáme dost kopáčů.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_01_09");	//Máš nějaký nápad?
	Info_ClearChoices(dia_torlof_li_changecourse);
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		Info_AddChoice(dia_torlof_li_changecourse,"Mohli bychom o tom říci Hagenovi!",dia_torlof_li_changecourse_paladin);
	};
	Info_AddChoice(dia_torlof_li_changecourse,"Můžeme prodat ostrov i s rudou!",dia_torlof_li_changecourse_sell);
	Info_AddChoice(dia_torlof_li_changecourse,"Zůstaneme zde a budeme těžit.",dia_torlof_li_changecourse_here);
};

func void dia_torlof_li_changecourse_paladin()
{
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourse_Paladin_01_01");	//Mohli bychom o tom říci Hagenovi!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Paladin_01_02");	//Co?!(naštvaně) Dát rudu paladinům?!
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourse_Paladin_01_03");	//Potřebujou ji více než mi. S ní budou mít větší šanci vyhrát válku.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Paladin_01_04");	//A co?! Možná že už ju prohráli!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Paladin_01_07");	//Eh...(naštvaně) Ať je po tvém.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Paladin_01_08");	//Pak se tedy vrátíme na Khorinis.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Paladin_01_09");	//Nemyslím, že ta myšlenka chlapi nadchne...(pochybuje)
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourse_Paladin_01_10");	//Vysvětlím jim to!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Paladin_01_11");	//Když to říkáš! Pak dej vědět co na to ěekli...
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Nyní je nutno řešit co s rudou, kterou jsme našli na ostrově. Řekl jsem Torlofovi, že bychom ji mohli dát paladinům. Nebyl zrovna nadšený. Měl bych promluvit s ostatními.");
	Info_ClearChoices(dia_torlof_li_changecourse);
};

func void dia_torlof_li_changecourse_sell()
{
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourse_Sell_01_01");	//Můžeme prodat ostrov i s rudou!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Sell_01_02");	//A kdo by ho chtěl?
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourse_Sell_01_04");	//Nevím... Co paladinové?
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Sell_01_05");	//Hmm...(zamyšleně) To není špatný nápad!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Sell_01_06");	//Vzhledem k jejich situaci by to měli přijmout.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Sell_01_07");	//Kdo z paladinů by ale mohl přijmout naše podmínky?
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourse_Sell_01_08");	//Možná lord Hagen.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Sell_01_10");	//S největší pravděpodobností by to mohl být on.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Sell_01_11");	//Můžeme se vrátit na Khorinis.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Sell_01_12");	//Ale nevím co na to řeknou chlapi...(nejistě)
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourse_Sell_01_13");	//Já je přesvědčím!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Sell_01_14");	//Dobrá, na tebe dají...
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Nyní musíme vyřešit co s rudou. Řekl jsem Torlofovi, že bychom ji mohli prodat paladinům. Velmi ho to potěšilo, teď jen přesvědčit chlapi!");
	Info_ClearChoices(dia_torlof_li_changecourse);
};

func void dia_torlof_li_changecourse_here()
{
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourse_Here_01_01");	//Zůstaneme zde a budeme těžit.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Here_01_02");	//Hmm...(zamyšleně) To není dobrý nápad.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Here_01_05");	//Vyžadovalo by to kopat od rána do noci a byli bychom tu celé věky.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Here_01_06");	//Kromě toho nechci tu strávit zbytek života.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Here_01_07");	//(mrzutě) A ty snad taky ne!
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourse_Here_01_08");	//Bude lepší, když to pustíš z hlavy.
};


instance DIA_TORLOF_LI_CHANGECOURSEDONE(C_Info)
{
	npc = sld_801_torlof_li;
	nr = 2;
	condition = dia_torlof_li_changecoursedone_condition;
	information = dia_torlof_li_changecoursedone_info;
	permanent = FALSE;
	description = "Mluvil jsem s chlapama.";
};


func int dia_torlof_li_changecoursedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_SUCCESS) && (READYCHANGECOURSE == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_li_changecoursedone_info()
{
	AI_Output(other,self,"DIA_Torlof_LI_ChangeCourseDone_01_01");	//Mluvil jsem s chlapama.
	AI_Output(self,other,"DIA_Torlof_LI_ChangeCourseDone_01_02");	//(se zájmem) Co řekli?
	if(CREWAGREEAWAYBACKPAL > CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Torlof_LI_ChangeCourseDone_01_03");	//Většina chce jít pomoci paladinům.
		AI_Output(self,other,"DIA_Torlof_LI_ChangeCourseDone_01_05");	//No, dobře...(smutně) Tak rozhodla většina...
		AI_Output(self,other,"DIA_Torlof_LI_ChangeCourseDone_01_06");	//Jen doufám že to lordu Hagenovi upravdu pomůže.
		B_LogEntry(TOPIC_CHANGECOURSE,"Dohodli jsme se pro rozhodnutí říci o rudě paladinům.");
		LIGOFORFREE = TRUE;
	}
	else if(CREWAGREEAWAYBACKPAL < CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(450);
		AI_Output(other,self,"DIA_Torlof_LI_ChangeCourseDone_01_10");	//Většina posádky chce prodat rudu paladinům.
		AI_Output(self,other,"DIA_Torlof_LI_ChangeCourseDone_01_12");	//S ničím jiným jsem nepočítal!
		B_LogEntry(TOPIC_CHANGECOURSE,"Dohodli jsme se prodat rudu paladinům na Khorinisu.");
		LIGOFORGOLD = TRUE;
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Torlof_LI_ChangeCourseDone_01_16");	//Půlka chce pomoci, půlka chce prodat rudu.
		AI_Output(self,other,"DIA_Torlof_LI_ChangeCourseDone_01_17");	//Nelehká situace!
		AI_Output(self,other,"DIA_Torlof_LI_ChangeCourseDone_01_19");	//Bude to na tobě, až dorazíme na Khorinis!
		AI_Output(other,self,"DIA_Torlof_LI_ChangeCourseDone_01_20");	//Dobrá.
		B_LogEntry(TOPIC_CHANGECOURSE,"Posádka se rozhodla půl na půl - je to na mě.");
		LIGOFORUNKNOWN = TRUE;
	};
	MIS_CHANGECOURSE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_SUCCESS);
};

