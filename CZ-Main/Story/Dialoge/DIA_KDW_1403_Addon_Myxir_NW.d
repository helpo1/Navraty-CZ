
instance DIA_Addon_Myxir_EXIT(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 999;
	condition = DIA_Addon_Myxir_EXIT_Condition;
	information = DIA_Addon_Myxir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_Hallo(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Hallo_Condition;
	information = DIA_Addon_Myxir_Hallo_Info;
	description = "Je všechno v pořádku?";
};


func int DIA_Addon_Myxir_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Hallo_15_00");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Addon_Myxir_Hallo_12_01");	//Ty máš tedy odvahu jen tak sem přijít.
};


instance DIA_Addon_Myxir_WasMachstDu(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_WasMachstDu_Condition;
	information = DIA_Addon_Myxir_WasMachstDu_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Myxir_WasMachstDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_WasMachstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WasMachstDu_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_01");	//Studuji jazyk Stavitelů.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_02");	//Ten jazyk je klíčem k pochopení tohoto prastarého lidu.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_03");	//Každý z nás se ho musí naučit, jinak tahle expedice skončí dřív, než vůbec začala.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_04");	//Stavitelé své vědomosti zaznamenávali na kamenné tabulky. Spousta z nich se bohužel rozbila nebo už byla dávno ukradena.
};


instance DIA_Addon_Myxir_Steintafeln(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Steintafeln_Condition;
	information = DIA_Addon_Myxir_Steintafeln_Info;
	description = "Tak co je tedy na těch kamenných tabulkách?";
};


func int DIA_Addon_Myxir_Steintafeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_Steintafeln_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Steintafeln_15_00");	//A co je tedy na těch kamenných tabulkách?
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_01");	//Obsahují všechny vědomosti, které tento pradávný lid nashromáždil.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_02");	//Některé z nich magicky zvyšují bojové a magické schopnosti.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_03");	//Pro toho, kdo je dokáže přečíst, mohou představovat skutečný poklad.
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry(TOPIC_Addon_Stoneplates,"Kamenné tabulky obsahují znalosti starého lidu Stavitelů. Některé z nich můžou magicky zlepšit mé bojové a magické schopnosti, ale napřed se je musím naučit číst.");
};


instance DIA_Addon_Myxir_WillYouTeachMe(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 10;
	condition = DIA_Addon_Myxir_WillYouTeachMe_Condition;
	information = DIA_Addon_Myxir_WillYouTeachMe_Info;
	description = "Mohl bys mě naučit číst v tom jazyce?";
};


func int DIA_Addon_Myxir_WillYouTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Myxir_WillYouTeachMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WillYouTeachMe_15_00");	//Mohl bys mě naučit číst v tom jazyce?
	AI_Output(self,other,"DIA_Addon_Myxir_WillYouTeachMe_12_01");	//No, proč ne? Rád se s tebou podělím o své znalosti.
	Myxir_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry_Quiet(TOPIC_Addon_Stoneplates,LogText_Addon_MyxirTeach);
};

var int DIA_Addon_Myxir_Teach_NoPerm;
var int DIA_Addon_Myxir_Teach_OneTime;

instance DIA_Addon_Myxir_Teach(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 90;
	condition = DIA_Addon_Myxir_Teach_Condition;
	information = DIA_Addon_Myxir_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě jazyk Stavitelů.";
};

func int DIA_Addon_Myxir_Teach_Condition()
{
	if((Myxir_Addon_TeachPlayer == TRUE) && (DIA_Addon_Myxir_Teach_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Nauč mě jazyk Stavitelů.

	if(DIA_Addon_Myxir_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_Teach);
		Info_AddChoice(DIA_Addon_Myxir_Teach,Dialog_Back,DIA_Addon_Myxir_Teach_BACK);

		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Myxir_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_Teach_LANGUAGE_1);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_Teach_LANGUAGE_2);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_Teach_LANGUAGE_3);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Už není nic, co bych ti mohl ukázat. Mistrovsky jsi ovládl jazyk Stavitelů.
		DIA_Addon_Myxir_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Dobře, začneme s něčím jednoduchým. Nejdřív se budeme zabývat jazykem rolníků.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Texty psané v jazyce rolníků většinou pojednávají o světských zájmech jako práce, láska a opatřování potravin.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Byl to nejrozšířenější jazyk ve společnosti. Pokud si ho osvojíš, budeš rozumět většině textů, které se zde nacházejí.
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//S jazykem rolníků ses už seznámil. Jazyk válečníků je trochu komplikovanější.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Jak asi tušíš, texty psané v jazyce válečníků většinou obsahují informace příbuzné válkám a zbraním. Myslím si, že pro tebe to bude velmi užitečné.
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Vznešenému jazyku kněží je velice těžké porozumět, ale já ti ho s radostí vysvětlím.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//V jazyku kněží jsou mimo jiné všechny posvátné texty, které vysvětlují příběh a magii Stavitelů.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Každý z těchto textů je pro člověka, který jim rozumí, opravdový poklad.
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};


instance DIA_ADDON_MYXIR_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 1;
	condition = dia_addon_myxir_prayforgomez_condition;
	information = dia_addon_myxir_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};


func int dia_addon_myxir_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Myxir_PrayForGomez_01_02");	//Promluv si se Saturasem.
	AI_Output(self,other,"DIA_Addon_Myxir_PrayForGomez_01_03");	//Ten ti dokáže pomoci.
	SENTTOSATURASGOMEZ = TRUE;
};

