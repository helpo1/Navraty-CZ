
instance DIA_Ingmar_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_Hallo(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 2;
	condition = DIA_Ingmar_Hallo_Condition;
	information = DIA_Ingmar_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


var int DIA_Ingmar_Hallo_permanent;

func int DIA_Ingmar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Ingmar_Hallo_permanent == FALSE) && (Kapitel < 4) && (CITYHALLACCESSGRANTED == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Hallo_Info()
{
	if((EnterOW_Kapitel2 == FALSE) && (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Podle zpráv, které jsem dostal, je Hornické údolí dost nebezpečné místo.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Než odejdeš, pořádně se vybav.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Situace v Hornickém údolí je vážná. Ale připravíme nějaký plán, jak odtamtud dostat naše chlapce i s rudou.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//Myslel jsem, že sis přišel promluvit s lordem Hagenem. Měl bys jít dál a popovídat si s ním.
	};
};


instance DIA_Ingmar_Krieg(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 99;
	condition = DIA_Ingmar_Krieg_Condition;
	information = DIA_Ingmar_Krieg_Info;
	permanent = FALSE;
	description = "Jaká je situace na kontinentu?";
};


func int DIA_Ingmar_Krieg_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Krieg_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//Jaká je situace na kontinentu?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//Válka ještě není vyhraná, i když královské síly už ženou skřety zpět.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Na mnohých místech se ale shromažďují menší tlupy skřetů a snaží se naší armádu roztříštit.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Bojují beze cti a bez víry - musíme tedy zvítězit.
};


instance DIA_Ingmar_CanTeach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 100;
	condition = DIA_Ingmar_CanTeach_Condition;
	information = DIA_Ingmar_CanTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Ingmar_CanTeach_Condition()
{
	if(Ingmar_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//Můžeš mě něco naučit?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//Můžu tě naučit, jak si posílit paže, abys mohl používat zbraně efektivněji.
		Ingmar_TeachSTR = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Paladin Ingmar mi může pomoci zvýšit sílu.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//Učím pouze členy našeho Řádu.
	};
};


instance DIA_Ingmar_Teach(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 6;
	condition = DIA_Ingmar_Teach_Condition;
	information = DIA_Ingmar_Teach_Info;
	permanent = TRUE;
	description = "Chtěl bych se stát silnějším.";
};


func int DIA_Ingmar_Teach_Condition()
{
	if(Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Teach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Chtěl bych se stát silnějším.
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Regenerace výdrže (VB: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void DIA_Ingmar_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//Už jsi silný jako trol. Není nic, co bych tě mohl naučit.
	};

	Info_ClearChoices(DIA_Ingmar_Teach);
};

func void DIA_Ingmar_Teach_RegenStam()
{
	var int kosten;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_03");	//Nauč mě jak rychle obnovit svoji výdrž.

	kosten = 10;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	}
	else
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Naučeno: Regenerace výdrže");
		VATRAS_TEACHREGENSTAM = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);
};

func void DIA_Ingmar_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Regenerace výdrže (VB: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void DIA_Ingmar_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Regenerace výdrže (VB: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Regenerace výdrže (VB: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Regenerace výdrže (VB: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Regenerace výdrže (VB: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};

func void dia_ingmar_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_ingmar_teach_stamina_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_ingmar_teach_stamina_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_ingmar_teach_hp_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_ingmar_teach_hp_5);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ingmar_Teach_5);

	if((Kapitel >= 3) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_PAL)) 
	{
		Info_AddChoice(DIA_Ingmar_Teach,"Regenerace výdrže (VB: 10)",DIA_Ingmar_Teach_RegenStam);
	};
};


instance DIA_Ingmar_KAP3_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP3_EXIT_Condition;
	information = DIA_Ingmar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_KAP4_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP4_EXIT_Condition;
	information = DIA_Ingmar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_ORKELITE(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 40;
	condition = DIA_Ingmar_ORKELITE_Condition;
	information = DIA_Ingmar_ORKELITE_Info;
	description = "Skřeti plánují hlavní ofenzívu.";
};


func int DIA_Ingmar_ORKELITE_Condition()
{
	if(((TalkedTo_AntiPaladin == TRUE) || Npc_HasItems(other,ItRi_OrcEliteRing)) && (Hagen_SawOrcRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_ORKELITE_Info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Skřeti plánují hlavní ofenzívu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//Vážně. Tak to je velice zajímavé. A na základě čeho se tak domníváš?
	if(TalkedTo_AntiPaladin == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Mluvil jsem s nimi.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Po kraji se potulují jejich velitelé.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Hmm. To nezní jako typická skřetí strategie.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Raději bys měl přijít na něco, jak se jich zbavit.",DIA_Ingmar_ORKELITE_loswerden);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Co uděláme?",DIA_Ingmar_ORKELITE_wasTun);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Co to znamená?",DIA_Ingmar_ORKELITE_wieso);
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite,"Ingmar se velmi zajímá o historii elitních skřetích válečníků.");
	MIS_KillOrkOberst = LOG_Running;
};

func void DIA_Ingmar_ORKELITE_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Raději bys měl přijít na něco, jak se jich zbavit.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//Mělo by stačit, kdybychom měli víc informací. Pošlu někoho, aby prozkoumal okolí.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Co to znamená?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//Pokud to, co říkáš, je pravda, tak nás chtějí oslabit zevnitř tím, že na nás budou útočit jejich nejlepší válečníci.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Obvykle jeden takový velitel vede skupinu skřetích válečníků. Málokdy jich vidíš dva nebo víc pohromadě.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//Dělají to z nějakého důvodu. Jejich vůdci tvoří jádro útočné strategie a většinou jsou obklopeni skřetími válečníky.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Je tedy velice těžké se k někomu z nich dostat, aniž by bylo nutné si prosekat cestu alespoň třiceti nepřáteli.
	B_LogEntry(TOPIC_OrcElite,"Ingmar se zmínil o hlavním skřetím vojevůdci.");
};

func void DIA_Ingmar_ORKELITE_wasTun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Co budeme dělat?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Když jich je tolik jako teď, jedná se většinou o nájezdnou patrolu, kterou vede ten nejvýše postavený z nich.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Nejvýše postavený vojevůdce si zařídí hlavní stan v nějaké jeskyni, odkud vysílá své vojsko do boje.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Pokud by se nám podařilo tohoto velitele zneškodnit, získali bychom tak nezanedbatelnou výhodu.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Skřetí velitel se většinou pohybuje v blízkosti svých nepřátel. Asi by bylo dobré hledat jeho jeskyni někde nedaleko města.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//Několik skřetů bylo spatřeno poblíž Lobartovy farmy. Asi by bylo moudré začít s pátráním tam.
	B_LogEntry(TOPIC_OrcElite,"Podle Ingmara bych měl skřetího plukovníka hledat v jeskyni kdesi u Lobartova statku. Mám ho najít a zničit.");
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};


instance DIA_Ingmar_HAUPTQUARTIER(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 41;
	condition = DIA_Ingmar_HAUPTQUARTIER_Condition;
	information = DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent = FALSE;
	description = "Našel jsem hlavní stan skřetů.";
};


func int DIA_Ingmar_HAUPTQUARTIER_Condition()
{
	if(Npc_IsDead(OrkElite_AntiPaladinOrkOberst) && Npc_KnowsInfo(other,DIA_Ingmar_ORKELITE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Našel jsem hlavní stan skřetů. Jejich vojevůdce padl.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//To je vynikající zpráva. Skřeti tak nebudou mít nějaký čas na útok ani pomyšlení.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//To není špatné. Kdybychom měli víc rytířů jako jsi ty, byla by nadcházející bitva předem rozhodnuta.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//Vezmi si tohle zlato a kup si za něj nějakou pořádnou výbavu.
	B_GivePlayerXP(XP_KilledOrkOberst);
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	MIS_KillOrkOberst = LOG_SUCCESS;
};


instance DIA_Ingmar_KAP5_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP5_EXIT_Condition;
	information = DIA_Ingmar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_KAP6_EXIT(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_KAP6_EXIT_Condition;
	information = DIA_Ingmar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ingmar_PICKPOCKET(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 900;
	condition = DIA_Ingmar_PICKPOCKET_Condition;
	information = DIA_Ingmar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(tento svitek je téměř nemožné ukrást)";
};

func int DIA_Ingmar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET,Dialog_Back,DIA_Ingmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ingmar_PICKPOCKET_DoIt);
};

func void DIA_Ingmar_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItSc_PalLight,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Ingmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
};


instance DIA_INGMAR_ABOUTORKS(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 1;
	condition = dia_ingmar_aboutorks_condition;
	information = dia_ingmar_aboutorks_info;
	permanent = FALSE;
	description = "Co víš o skřetech?";
};


func int dia_ingmar_aboutorks_condition()
{
	if(Npc_KnowsInfo(other,DIA_Ingmar_ORKELITE))
	{
		return TRUE;
	};
};

func void dia_ingmar_aboutorks_info()
{
	AI_Output(other,self,"DIA_Ingmar_AboutOrks_01_00");	//Co víš o skřetech?
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_01");	//Co já vím o skřetech? Já o nich vím nejvíce z celého království!
	AI_Output(other,self,"DIA_Ingmar_AboutOrks_01_04");	//To bys mi mohl povědět hodně zajímavých věcí.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_07");	//Dobře, poslouchej! Mnoho lidí považuje skřety spíše za primitivní bytosti.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_08");	//Ale tak to opravdu není! Ta stvoření mají vlastní vojenskou hierarchii, každý má svůj úkol, ovládají umění boje a magie a jsou velmi inteligentní.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_09");	//Jak vidíš, a právě tohle jim přineslo nemalé úspěchy ve válce s námi.
	AI_Output(other,self,"DIA_Ingmar_AboutOrks_01_10");	//Co je to za hierarchii?
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_11");	//První stupeň v ní zaujímají skřetí válečníci. Jsou to jejich hlavní bojové jednotky. Ve skřetím jazyce se nazývají GRASH-RAMTOR!
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_12");	//Nosí lehkou kroužkovou zbroj a nejsou nijak zvlášť nebezpečnými protivníky, a to i pro obyčejného lovce.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_13");	//Opravdu nejsou moc bojovní a napadnou tě jen když jsou v přesile.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_14");	//Zabít takovéto stvoření by nemělo být tak těžké pro někoho, kdo alespoň udrží meč.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_16");	//Pak následují černí skřetí válečníci, v jejich jazyce ERZMRAKS-KORRGRON! Jsou velmi silní a dobře ovládají boj na blízko.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_17");	//Boj proti nim je i pro zkušené válečníky zkouškou síly a odvahy. Nikdy je nepotkáš bez jejich odolné a pevné zbroje.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_18");	//Ještě nebezpečnější jsou elitní černí skřetí válečníci! Nazývají se TARSHMOR-GRONSROK, a jsou opravdovou výzvou i pro zkušeného rytíře.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_19");	//Těžká a spolehlivá zbroj jim zajišťuje ochranu před sekyrami a meči. Také s sebou nosí své těžké kuše, které jsou sice horší na ovládání, ale o to účinnější.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_21");	//Poté následují GRAKS-NARZULG - elitní černí veteráni.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_22");	//Díky pravidelnému, strukturovanému výcviku jsou desetkrát silnější, než obyčejní válečníci a vedou do boje jednotlivé tlupy.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_23");	//Nepotkáš velké skupiny, ale boj proti nim je velmi těžký i pro nás - paladiny Innose.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_24");	//Jsou to jedni z nejsilnějších válečníků, které můžeš potkat na bitevním poli!
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_25");	//Pak následují ROR-GNORK - skřetí náčelníci, kteří dávají rozkazy GRAKS-NARZULG, elitním černým veteránům, a koordinují jejich akce.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_28");	//Skřetí náčelníci perfektně ovládají meč a rozumí taktice boje.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_29");	//Stačí sekunda zaváhání a jejich meč z tebe udělá deset kusů!
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_32");	//Jako poslední jsou ve válečnické hierarchii VRUSHMOR-KOGRON, elitní vůdci skřetů. Ovládají celé armády skřetů a vedou je do útoku.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_33");	//Zabít je je obrovská čest jak pro vojáka, tak i pro ostříleného paladina!
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_34");	//Je ale pravda, že na bitevním poli se vyskytují jen velmi zřídka a jsou obklopeni silnými jednotkami.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_35");	//Ale aby ses k nim dostal, musíš si nejprve probojovat cestu desítkami těžce ozbrojených stráží, a teprve poté budeš mít šanci je zabít.
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_37");	//Údajně jsou nad nimi mocní Vůdci Hord! Ale nikdy jsem žádného neviděl...
	AI_Output(self,other,"DIA_Ingmar_AboutOrks_01_39");	//To mi můžeš věřit... Nemám potuchy o tom, jak vypadají, či jak jsou silní!
};

instance DIA_Ingmar_CanTeachShield(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 5;
	condition = DIA_Ingmar_CanTeachShield_Condition;
	information = DIA_Ingmar_CanTeachShield_Info;
	permanent = FALSE;
	description = "Mám na tebe otázku.";
};

func int DIA_Ingmar_CanTeachShield_Condition()
{
	if(CedricSendIngmar == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeachShield_Info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_00");	//Mám na tebe otázku.
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_01");	//Co tě zajímá?
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_02");	//Cedric řekl, že mi můžeš dát štít paladina.
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_03");	//Ach, to je... (reptání) Zdá se, že ten tvrdohlavec se uklidní pouze v případě, když my všichni budem chodit se štítem.
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_04");	//Nesouhlasíš s ním?
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_05");	//Jsem zastáncem starého dobrého obouručního meče. Není nic lepšího!
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_06");	//Tak co si myslíš o štítu?
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_07");	//No, když na tom trváš... Dobře, dám ti štít paladina.
	AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_08");	//Abys ho mohl používat, musíš být zběhlý v zacházení s jednoručními zbraněmi.

	if(hero.HitChance[NPC_TALENT_1H] >= 50)
	{
		AI_Output(other,self,"DIA_Ingmar_CanTeachShield_01_09");	//Ovládám je dobře.
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_10");	//(povzdechne si) Dobře, dobře. Tady máš.
		B_GiveInvItems(self,other,ItAr_Shield_07,1);
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_11");	//Doufám, že ti dobře poslouží v boji.
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_13");	//Podle toho co vidím, ještě nejsi dostatečně zručný.
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_01_14");	//Vrať se, až se naučíš lépe zacházet s jednoručním mečem.
		NeedProofShield = TRUE;
	};
};

instance DIA_Ingmar_CanTeachShield_Perm(C_Info)
{
	npc = Pal_201_Ingmar;
	nr = 5;
	condition = DIA_Ingmar_CanTeachShield_Perm_Condition;
	information = DIA_Ingmar_CanTeachShield_Perm_Info;
	permanent = TRUE;
	description = "Dej mě štít paladina.";
};

func int DIA_Ingmar_CanTeachShield_Perm_Condition()
{
	if((NeedProofShield == TRUE) && (GetPalShield == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeachShield_Perm_Info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeachShield_Perm_01_00");	//Dej mě štít paladina.

	if(hero.HitChance[NPC_TALENT_1H] >= 50)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_01");	//A co tvoje umění boje s jednoručními zbraněmi?
		AI_Output(other,self,"DIA_Ingmar_CanTeachShield_Perm_01_02");	//Ovládám je dobře.
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_03");	//(povzdechne si) Dobře, dobře. Tady máš.
		B_GiveInvItems(self,other,ItAr_Shield_07,1);
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_04");	//Doufám, že ti dobře poslouží v boji.
		GetPalShield = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_06");	//Řekl jsem, že ho dostaneš jen tehdy, pokud budeš dobře ovládat jednoruční meč.
		AI_Output(self,other,"DIA_Ingmar_CanTeachShield_Perm_01_07");	//Čemu jsi neporozuměl?
		Print("Potřeba ovládání jednoruční zbraně více než 50...");
	};
};
