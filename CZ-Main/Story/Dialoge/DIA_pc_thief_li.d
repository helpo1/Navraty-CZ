
var int trd_diegoli;

instance DIA_PC_THIEF_LI_EXIT(C_Info)
{
	npc = pc_thief_li;
	nr = 999;
	condition = dia_pc_thief_li_exit_condition;
	information = dia_pc_thief_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pc_thief_li_exit_condition()
{
	return TRUE;
};

func void dia_pc_thief_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THIEF_LI_HELLOS(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_hellos_condition;
	information = dia_thief_li_hellos_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thief_li_hellos_condition()
{
	return TRUE;
};

func void dia_thief_li_hellos_info()
{
	AI_Output(self,other,"DIA_Thief_LI_HelloS_01_01");	//Takže jsme zase spolu... Jako za stara!
	AI_Output(other,self,"DIA_Thief_LI_HelloS_01_02");	//Tak, tak! Co budeš dělat?
	AI_Output(self,other,"DIA_Thief_LI_HelloS_01_03");	//To nevím, ale nic ukvapeného.
	AI_Output(self,other,"DIA_Thief_LI_HelloS_01_04");	//První by se mělo zjistit něco o ostrově.
	AI_Output(other,self,"DIA_Thief_LI_HelloS_01_05");	//Proč jsi opustil loď?!
	AI_Output(self,other,"DIA_Thief_LI_HelloS_01_06");	//Po bouři mi totiž není moc dobře a jsem rád, že můžu být na pevnině!
};


instance DIA_THIEF_LI_ILL(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_ill_condition;
	information = dia_thief_li_ill_info;
	permanent = FALSE;
	description = "Nevypadáš moc šťastně.";
};


func int dia_thief_li_ill_condition()
{
	return TRUE;
};

func void dia_thief_li_ill_info()
{
	AI_Output(other,self,"DIA_Thief_LI_Ill_01_01");	//Nevypadáš moc šťastně.
	AI_Output(self,other,"DIA_Thief_LI_Ill_01_04");	//To ta prokletá bouře! Deset let jsem se plavil na lodi a nic.
	AI_Output(self,other,"DIA_Thief_LI_Ill_01_05");	//A teď taková síla, že jsem neudržel obsah žaludku v žaludku.
	AI_Output(self,other,"DIA_Thief_LI_Ill_01_08");	//I když... Kdybys našel nějaké lepší léčivé rostliny, tak by to mohlo pomoci.
	AI_Output(other,self,"DIA_Thief_LI_Ill_01_09");	//Kolik jich potřebuješ?
	AI_Output(self,other,"DIA_Thief_LI_Ill_01_10");	//No, to samozřejmě nevím, ale myslím, že 5 by mohlo stačit.
	MIS_DIEGOILL = LOG_Running;
	Log_CreateTopic(TOPIC_DIEGOILL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DIEGOILL,LOG_Running);
	B_LogEntry(TOPIC_DIEGOILL,"Diego má rozhozené vnitřní části jeho těla a z výrazu obličeje má problém i se stolicí... Měl bych se podívat po nějakých bylinkách, které by mu mohli pomoci.");
};


instance DIA_THIEF_LI_ILLDONE(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_illdone_condition;
	information = dia_thief_li_illdone_info;
	permanent = FALSE;
	description = "Přinesl jsem ti to býlí.";
};


func int dia_thief_li_illdone_condition()
{
	if((MIS_DIEGOILL == LOG_Running) && (Npc_HasItems(other,ItPl_Health_Herb_01) >= 5))
	{
		return TRUE;
	};
};

func void dia_thief_li_illdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Thief_LI_IllDone_01_01");	//Přinesl jsem ti to býlí.
	AI_Output(self,other,"DIA_Thief_LI_IllDone_01_02");	//Super! Sem s tím.
	AI_Output(other,self,"DIA_Thief_LI_IllDone_01_03");	//Tady.
	B_GiveInvItems(other,self,ItPl_Health_Herb_01,5);
	B_UseItem(self,ItPl_Health_Herb_01);
	AI_Output(self,other,"DIA_Thief_LI_IllDone_01_04");	//Ukh... O moc lepší! Díky příteli!
	MIS_DIEGOILL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DIEGOILL,LOG_SUCCESS);
	B_LogEntry(TOPIC_DIEGOILL,"Donesl jsem Diegovi rostliny a vypadá to, že se mu ulevilo!");
};


instance DIA_THIEF_LI_ILLDONES(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_illdones_condition;
	information = dia_thief_li_illdones_info;
	permanent = TRUE;
	description = "Jak se cítíš?";
};


func int dia_thief_li_illdones_condition()
{
	if(MIS_DIEGOILL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_thief_li_illdones_info()
{
	AI_Output(other,self,"DIA_Thief_LI_IllDones_01_01");	//Jak se cítíš?
	AI_Output(self,other,"DIA_Thief_LI_IllDones_01_02");	//Ty léčivky mi pomohly.
};


instance DIA_DIEGO_LI_TRADE(C_Info)
{
	npc = pc_thief_li;
	nr = 12;
	condition = dia_diego_li_trade_condition;
	information = dia_diego_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Potřebuju doplnit munici.";
};


func int dia_diego_li_trade_condition()
{
	return TRUE;
};

func void dia_diego_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Diego_DI_TRADE_15_00");	//Potřebuju doplnit munici.
	AI_Output(self,other,"DIA_Diego_DI_TRADE_11_01");	//Možná bych ti mohl pomoct.

	if(TRD_DIEGOLI != TRUE)
	{
		CreateInvItems(self,ItRw_Arrow,160);
		CreateInvItems(self,ItRw_Bolt,120);
		CreateInvItems(self,ItKE_lockpick,20);
		CreateInvItems(self,ItRw_Bow_H_04,1);
		TRD_DIEGOLI = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_PC_THIEF_LI_TRAINING_TALENTE(C_Info)
{
	npc = pc_thief_li;
	nr = 10;
	condition = dia_pc_thief_li_training_talente_condition;
	information = dia_pc_thief_li_training_talente_info;
	permanent = TRUE;
	description = "Trénuj mě.";
};


func int dia_pc_thief_li_training_talente_condition()
{
	return TRUE;
};

func void dia_pc_thief_li_training_talente_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Training_15_00");	//Trénuj mě.
	AI_Output(self,other,"DIA_PC_Thief_DI_Training_11_01");	//Co potřebuješ?
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_talente_back()
{
	Info_ClearChoices(dia_pc_thief_li_training_talente);
};

func void dia_pc_thief_li_training_dex_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00");	//Život pro tebe bude mnohem jednodušší, když se budeš držet mimo střelecký úhel.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_dex_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00");	//Když se hýbeš, musíš u toho myslet.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_combat_bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00");	//Nejlepší učitel je praxe.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};

func void dia_pc_thief_li_training_combat_bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00");	//Ruka musí jít s ramenem.
	};
	Info_ClearChoices(dia_pc_thief_li_training_talente);
	Info_AddChoice(dia_pc_thief_li_training_talente,Dialog_Back,dia_pc_thief_li_training_talente_back);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_pc_thief_li_training_dex_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_li_training_dex_5);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_li_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_li_training_talente,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_li_training_combat_bow_5);
};


instance DIA_THIEF_LI_PICKPOCKET(C_Info)
{
	npc = pc_thief_li;
	nr = 900;
	condition = dia_thief_li_pickpocket_condition;
	information = dia_thief_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_thief_li_pickpocket_condition()
{
	return C_Beklauen(120,600);
};

func void dia_thief_li_pickpocket_info()
{
	Info_ClearChoices(dia_thief_li_pickpocket);
	Info_AddChoice(dia_thief_li_pickpocket,Dialog_Back,dia_thief_li_pickpocket_back);
	Info_AddChoice(dia_thief_li_pickpocket,DIALOG_PICKPOCKET,dia_thief_li_pickpocket_doit);
};

func void dia_thief_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_thief_li_pickpocket);
};

func void dia_thief_li_pickpocket_back()
{
	Info_ClearChoices(dia_thief_li_pickpocket);
};


instance DIA_THIEF_LI_MISSMYGOLD(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_missmygold_condition;
	information = dia_thief_li_missmygold_info;
	permanent = FALSE;
	description = "Chtěl bych se tě zeptat co je s mojim zlatem.";
};


func int dia_thief_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_thief_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Thief_LI_MissMyGold_01_01");	//Chtěl bych se tě zeptat co je s mojim zlatem.
	AI_Output(self,other,"DIA_Thief_LI_MissMyGold_01_02");	//A myslíš, že jsem ho vzal?!... (se zájmem)
	AI_Output(other,self,"DIA_Thief_LI_MissMyGold_01_03");	//Ne! Ne! Jen jsem si myslel, že bys mohl něco vědět o tom, kam se podělo mé zlato.
	AI_Output(self,other,"DIA_Thief_LI_MissMyGold_01_04");	//Tak jak bych o tom měl vědět?!... (udiveně)
	AI_Output(other,self,"DIA_Thief_LI_MissMyGold_01_05");	//Protože loď byla plná zlata a teď zeje prázdnotou!
	AI_Output(self,other,"DIA_Thief_LI_MissMyGold_01_06");	//Hmm... To jsou novinky!
	AI_Output(self,other,"DIA_Thief_LI_MissMyGold_01_09");	//Ničeho jsem si nevšiml.
	B_LogEntry(TOPIC_MISSMYGOLD,"Diego neví, kam se podělo mé zlato.");
};


instance DIA_THIEF_LI_AWAY(C_Info)
{
	npc = pc_thief_li;
	nr = 3;
	condition = dia_thief_li_away_condition;
	information = dia_thief_li_away_info;
	permanent = FALSE;
	description = "Mám novinky.";
};


func int dia_thief_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (DIEGOLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_thief_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Thief_LI_Away_01_03");	//Naše loď je připravena k odplutí, jen napnout plachty.
	AI_Output(self,other,"DIA_Thief_LI_Away_01_04");	//Hmm... Pak bychom se měli navrátit na loď.
	AI_Output(self,other,"DIA_Thief_LI_Away_01_05");	//Tady bych nemohl trávit zbytek života.
	B_LogEntry(TOPIC_GATHERCREW,"Diego byl rád, že se dostal z ostrova.");
	DIEGOLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_THIEF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_findmagicorecave_condition;
	information = dia_thief_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem jeskyni s ložiskem magické rudy.";
};


func int dia_thief_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_thief_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Thief_LI_FindMagicOreCave_01_01");	//Našel jsem jeskyni s ložiskem magické rudy.
	AI_Output(self,other,"DIA_Thief_LI_FindMagicOreCave_01_02");	//Opravdu? Tak to by sis měl promluvit s kapitánem.
	AI_Output(self,other,"DIA_Thief_LI_FindMagicOreCave_01_03");	//Myslím, že ho to bude velmi zajímat.
	GOTOORECAPITAN = TRUE;
};


instance DIA_THIEF_LI_CHANGECOURSE(C_Info)
{
	npc = pc_thief_li;
	nr = 2;
	condition = dia_thief_li_changecourse_condition;
	information = dia_thief_li_changecourse_info;
	permanent = FALSE;
	description = "Měli bychom se vrátit do Khorinisu.";
};


func int dia_thief_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_thief_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_01_00");	//Měli bychom se vrátit do Khorinisu.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_01_01");	//A z jakého důvodu bychom to měli dělat?!
	Info_ClearChoices(dia_thief_li_changecourse);
	Info_AddChoice(dia_thief_li_changecourse,"Musíme pomoci paladinům!",dia_thief_li_changecourse_ore);
	Info_AddChoice(dia_thief_li_changecourse,"Je to otázka zlata.",dia_thief_li_changecourse_gold);
};

func void dia_thief_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_01");	//Musíme pomoci paladinům!
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_02");	//A jak to chceš udělat?!
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_03");	//Měl bych je informovat o rudě na ostrově.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_05");	//Hmm... Myslím, že bychom mu ji měli spíše prodat.
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_08");	//To sice máš pravdu, ale je to poslední naděje proti skřetům!
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_09");	//A to by tě zajímat mělo.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_10");	//V pořádku... Jestli to chceš.
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Ore_01_11");	//Takže jdeš se mnou?!
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_12");	//Jo! Ale ne kvůli paladinům. Jen kvůli tobě.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Ore_01_13");	//Popluji kvůli tomu, že chceš zastavit skřety!
	B_LogEntry(TOPIC_CHANGECOURSE,"Po dlouhé diskuzi, Diego nakonec souhlasil s návratem na Khorinis.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Promluvil jsem se všemi chlapi, takže bych měl zajít za kapitánem.");
	};
	Info_ClearChoices(dia_thief_li_changecourse);
};

func void dia_thief_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Gold_01_01");	//Je to otázka zlata.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Gold_01_02");	//A nějaké podrobnosti?!... (se zájmem)
	AI_Output(other,self,"DIA_Thief_LI_ChangeCourse_Gold_01_03");	//Myslím, že lord Hagen by zaplatil za informaci o rudě na ostrově.
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Gold_01_06");	//Dobře... Tak to jsem s tebou!
	AI_Output(self,other,"DIA_Thief_LI_ChangeCourse_Gold_01_07");	//Myslím, že si nacpeme kapsy.
	B_LogEntry(TOPIC_CHANGECOURSE,"Diego Souhlasil s návratem na Khorinis.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Promluvil jsem se všemi chlapi, takže bych měl zajít za kapitánem.");
	};
	Info_ClearChoices(dia_thief_li_changecourse);
};

