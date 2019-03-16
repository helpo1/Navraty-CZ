
instance DIA_LARES_LI_EXIT(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 999;
	condition = dia_lares_li_exit_condition;
	information = dia_lares_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lares_li_exit_condition()
{
	return TRUE;
};

func void dia_lares_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_LI_TRAINING(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 10;
	condition = dia_lares_li_training_condition;
	information = dia_lares_li_training_info;
	permanent = TRUE;
	description = "Nauč mě něco z tvých schopností.";
};


func int dia_lares_li_training_condition()
{
	return TRUE;
};

func void dia_lares_li_training_info()
{
	AI_Output(other,self,"DIA_Lares_DI_Training_15_00");	//Nauč mě něco z tvých schopností.
	AI_Output(self,other,"DIA_Lares_DI_Training_09_01");	//Žádný problém.
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_back()
{
	Info_ClearChoices(dia_lares_li_training);
};

func void dia_lares_li_training_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_1_09_00");	//Musíš trochu ohnout přední nohu a narovnat záda. Tak získáš ten správný postoj.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_5_09_00");	//Zůstaň pružný v kyčlích. To ti umožní se vyhnout protiútoku.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_dex_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_1_09_00");	//Tvá horní polovina musí pracovat v souladu se zbytkem těla.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};

func void dia_lares_li_training_dex_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_5_09_00");	//Vždycky by sis měl hlídat svůj postoj.
	};
	Info_ClearChoices(dia_lares_li_training);
	Info_AddChoice(dia_lares_li_training,Dialog_Back,dia_lares_li_training_back);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_lares_li_training_dex_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_lares_li_training_dex_5);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lares_li_training_1h_1);
	Info_AddChoice(dia_lares_li_training,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lares_li_training_1h_5);
};


instance DIA_LARES_LI_MISSMYGOLD(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 2;
	condition = dia_lares_li_missmygold_condition;
	information = dia_lares_li_missmygold_info;
	permanent = FALSE;
	description = "Ty náhodou nevíš, kde je moje zlato?";
};


func int dia_lares_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_lares_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Lares_LI_MissMyGold_01_01");	//Ty náhodou nevíš, kde je moje zlato?
	AI_Output(self,other,"DIA_Lares_LI_MissMyGold_01_02");	//Ne kámo... (usmívá se) Nic jsem neviděl.
	B_LogEntry(TOPIC_MISSMYGOLD,"Lares nic neví nic o zlatě, které se ztratilo z podpalubí lodi...");
};


instance DIA_LARES_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 2;
	condition = dia_lares_li_findmagicorecave_condition;
	information = dia_lares_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem jeskyni s nálezišti magické rudy.";
};


func int dia_lares_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Lares_LI_FindMagicOreCave_01_01");	//Našel jsem jeskyni s nalezištěm magické rudy.
	AI_Output(self,other,"DIA_Lares_LI_FindMagicOreCave_01_02");	//Opravdu?!... (Překvapeně) V tom případě by sis o tom měl promluvit s našim kapitánem.
	AI_Output(self,other,"DIA_Lares_LI_FindMagicOreCave_01_03");	//Myslím, že rád uslyší tuto novinku.
	GOTOORECAPITAN = TRUE;
};


instance DIA_LARES_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_449_lares_li;
	nr = 2;
	condition = dia_lares_li_changecourse_condition;
	information = dia_lares_li_changecourse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lares_li_changecourse_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_00");	//Slyšel jsem, že se chceš vrátit zpět do Khorinisu?
	AI_Output(other,self,"DIA_Lares_LI_ChangeCourse_01_01");	//Ano, to je pravda! Právě jsem o tom s tebou chtěl mluvit.
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_02");	//No... (usmívá se) A jestli chceš znát můj názor, tak budu následovat tvé rozhodnutí.
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_05");	//Ve svém životě jsem horko těžko potkal někoho dalšího jako si ty!
	AI_Output(other,self,"DIA_Lares_LI_ChangeCourse_01_06");	//Opravdu?! A čím se tak odlišuju od ostatních?!
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_09");	//Ha ha... Někdy jsou tvé činy naprosto nepředvídatelné a nesou v sobě skrytý význam, které mé chápání ne a ne pobrat.
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_10");	//Jindy se mi zdá, že tvá cesta tady je řízena bohy, kteří tě po ní vedou!
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_12");	//Pamatuješ si, když jsem se s tebou setkal poprvé?
	AI_Output(other,self,"DIA_Lares_LI_ChangeCourse_01_13");	//Ano, vzpomínám. Stalo se to v Novém táboře...
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_14");	//No, takže (zvážněl) už tehdy jsem podvědomně cítil, že je v tobě něco, co tě odlišuje od ostatních lidí. A měl jsem pravdu!
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_15");	//Nejdrříve jsi zahnal Spáče a spolu s ním zničil magická bariéra. Pak jsi zastavil Ravena, čímž si mu zabránil, aby přiveld temné zlo na tento svět.
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_16");	//A nakonec, téměř bez pomoci, to, co by se zdálo být i nad síly celé armádě paladinů - jsi zničil bytost, ve které byla soustředěna veškerá moc Temného boha!
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_17");	//Neříká tohle všechno samosebou hodně?... (sarkasticky)
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_18");	//A teď tady. Rozhodneš se vrátit zpět na Khorinisu. Upřímně řečeno, nedovedu si představit, jak tohle všechno skončí!
	AI_Output(other,self,"DIA_Lares_LI_ChangeCourse_01_21");	//Mám takový pocit, že to zjistím jak dorazím do Khorinisu!
	AI_Output(self,other,"DIA_Lares_LI_ChangeCourse_01_22");	//Máš pravdu! Vše je to jen otázka času...
	B_LogEntry(TOPIC_CHANGECOURSE,"Laresovi je jedno, jestli se budem plavit zpět na Khorinis nebo poplujem na pevninu.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Zdá se, že už jsem mluvil se všemi členy posádky. Je čas informovat našeho kapitána.");
	};
};

