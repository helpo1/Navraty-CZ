
instance DIA_WOLF_LI_EXIT(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 999;
	condition = dia_wolf_li_exit_condition;
	information = dia_wolf_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_wolf_li_exit_condition()
{
	return TRUE;
};

func void dia_wolf_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_LI_TRAINING(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 10;
	condition = dia_wolf_li_training_condition;
	information = dia_wolf_li_training_info;
	permanent = TRUE;
	description = "Uč mě střílet.";
};


func int dia_wolf_li_training_condition()
{
	return TRUE;
};

func void dia_wolf_li_training_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_Training_15_00");	//Uč mě střílet.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//S čím?
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_back()
{
	Info_ClearChoices(dia_wolf_li_training);
};

func void dia_wolf_li_training_bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_1_08_00");	//Luk je na rozdíl od kuše dost neskladný, a proto vyžaduje spoustu místa. Vždycky si proto dávej pozor, abys měl při boji okolo sebe dostatek volného prostoru.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_5_08_00");	//Při výstřelu ti musí tětiva v prstech klouzat - když ji budeš držet křečovitě, můžeš tím šíp úplně vychýlit z dráhy.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_crossbow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00");	//Zkus nestřílet proti větru, počkej až přejde.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};

func void dia_wolf_li_training_crossbow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00");	//Chytrý kušiník si také všímá, kudy zrovna vane vítr, a nesnaží se střílet přímo proti němu.
	};
	Info_ClearChoices(dia_wolf_li_training);
	Info_AddChoice(dia_wolf_li_training,Dialog_Back,dia_wolf_li_training_back);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_wolf_li_training_bow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_wolf_li_training_bow_5);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_wolf_li_training_crossbow_1);
	Info_AddChoice(dia_wolf_li_training,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_wolf_li_training_crossbow_5);
};


instance DIA_WOLF_LI_PICKPOCKET(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 900;
	condition = dia_wolf_li_pickpocket_condition;
	information = dia_wolf_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_wolf_li_pickpocket_condition()
{
	return C_Beklauen(32,45);
};

func void dia_wolf_li_pickpocket_info()
{
	Info_ClearChoices(dia_wolf_li_pickpocket);
	Info_AddChoice(dia_wolf_li_pickpocket,Dialog_Back,dia_wolf_li_pickpocket_back);
	Info_AddChoice(dia_wolf_li_pickpocket,DIALOG_PICKPOCKET,dia_wolf_li_pickpocket_doit);
};

func void dia_wolf_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_wolf_li_pickpocket);
};

func void dia_wolf_li_pickpocket_back()
{
	Info_ClearChoices(dia_wolf_li_pickpocket);
};


instance DIA_WOLF_LI_MISSMYGOLD(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 2;
	condition = dia_wolf_li_missmygold_condition;
	information = dia_wolf_li_missmygold_info;
	permanent = FALSE;
	description = "Mám otázku.";
};


func int dia_wolf_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_wolf_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Wolf_LI_MissMyGold_01_01");	//Mám otázku.
	AI_Output(other,self,"DIA_Wolf_LI_MissMyGold_01_03");	//Víš něco o tom kam zmizelo mé zlato?
	AI_Output(self,other,"DIA_Wolf_LI_MissMyGold_01_04");	//Nemám ponětí! Zeptej se ostatních chlapů.
	B_LogEntry(TOPIC_MISSMYGOLD,"Wolf o mém zlatě nic neví.");
};


instance DIA_WOLF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 2;
	condition = dia_wolf_li_findmagicorecave_condition;
	information = dia_wolf_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem ložisko magické rudy.";
};


func int dia_wolf_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Wolf_LI_FindMagicOreCave_01_01");	//Našel jsem ložisko magické rudy.
	AI_Output(self,other,"DIA_Wolf_LI_FindMagicOreCave_01_02");	//(překvapen) Opravdu? To by se měl dozvědět kapitán.
	AI_Output(self,other,"DIA_Wolf_LI_FindMagicOreCave_01_03");	//Myslím, že ho to bude zajímat.
	GOTOORECAPITAN = TRUE;
};


instance DIA_WOLF_LI_CHANGECOURSE(C_Info)
{
	npc = sld_811_wolf_li;
	nr = 2;
	condition = dia_wolf_li_changecourse_condition;
	information = dia_wolf_li_changecourse_info;
	permanent = FALSE;
	description = "Nechtěl by ses vrátit na Khorinis?";
};


func int dia_wolf_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_wolf_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_01_00");	//Nechtěl by ses vrátit na Khorinis?
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_01_01");	//Hmm... (zamyšleně) A proč se ptáš?
	Info_ClearChoices(dia_wolf_li_changecourse);
	Info_AddChoice(dia_wolf_li_changecourse,"Potřebuji pomoct paladinům!",dia_wolf_li_changecourse_ore);
	Info_AddChoice(dia_wolf_li_changecourse,"Je zde možnost získat prachy.",dia_wolf_li_changecourse_gold);
};

func void dia_wolf_li_changecourse_ore()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Ore_01_01");	//Potřebuji pomoct paladinům!
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_02");	//(překvapeně) Paladinům? A proč by sme to dělali?!
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Ore_01_03");	//Můžeme se vrátit na Khorinis s tím, že řekneme paladinům o rudě, kterou jsem našel tady na ostrově.
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Ore_01_04");	//Zvětší to šanci v boji proti skřetům. Co říkáš?!
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_05");	//Je mi líto, kámo ale sem proti!
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_06");	//Nebudu riskovat život kvůli těm idiotům.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_07");	//K tomu to oni mě šoupli do Hornického údolí.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Ore_01_08");	//Ode mne ať pomoc paladinové nečekají.
	B_LogEntry(TOPIC_CHANGECOURSE,"Wolf si nemyslí, že bychom měli jít pomoci paladinům.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Mluvil jsem se všemi chlapi. Měl bych teď jít za kapitánem.");
	};
	Info_ClearChoices(dia_wolf_li_changecourse);
};

func void dia_wolf_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Gold_01_01");	//Je zde možnost získat prachy.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Gold_01_02");	//Opravdu?! A jak?
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Gold_01_03");	//Můžeme se vrátit na Khorinis s tím, že prodáme paladinům rudu, kterou jsem našel tady na ostrově.
	AI_Output(other,self,"DIA_Wolf_LI_ChangeCourse_Gold_01_04");	//Myslím, že za polohu tohoto ostrova rádi zaplatí zlatem.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Gold_01_05");	//Hmm... (zlomyslně) Vynikájící nápad.
	AI_Output(self,other,"DIA_Wolf_LI_ChangeCourse_Gold_01_08");	//Pak není co řešit! Vzhůru na Khorinis!
	B_LogEntry(TOPIC_CHANGECOURSE,"Wolf podpořil nápad prodat rudu paladinům.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Mluvil jsem se všemi chlapi. Měl bych teď jít za kapitánem.");
	};
	Info_ClearChoices(dia_wolf_li_changecourse);
};

