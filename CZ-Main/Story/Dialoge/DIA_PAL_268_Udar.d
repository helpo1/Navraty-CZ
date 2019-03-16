
instance DIA_Udar_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_EXIT_Condition;
	information = DIA_Udar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_EXIT_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Hello(C_Info)
{
	npc = PAL_268_Udar;
	nr = 2;
	condition = DIA_Udar_Hello_Condition;
	information = DIA_Udar_Hello_Info;
	important = TRUE;
};


func int DIA_Udar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_Hello_Info()
{
	AI_Output(self,other,"DIA_Udar_Hello_09_00");	//Máš štěstí, málem jsem tě střelil.
	AI_Output(other,self,"DIA_Udar_Hello_15_01");	//Pak bych měl být rád, že máš tak bystrý zrak.
	AI_Output(self,other,"DIA_Udar_Hello_09_02");	//Šetři si dech. Jestli něco chceš, promluv se Sengrathem.
	AI_StopProcessInfos(self);
};


instance DIA_Udar_YouAreBest(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_YouAreBest_Condition;
	information = DIA_Udar_YouAreBest_Info;
	permanent = FALSE;
	description = "Slyšel jsem, že jsi nejlepší ve střelbě z kuše.";
};


func int DIA_Udar_YouAreBest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_Udar) && (KAPITELORCATC == FALSE))
	{
		return 1;
	};
};

func void DIA_Udar_YouAreBest_Info()
{
	AI_Output(other,self,"DIA_Udar_YouAreBest_15_00");	//Slyšel jsem, že jsi nejlepší ve střelbě z kuše široko daleko!
	AI_Output(self,other,"DIA_Udar_YouAreBest_09_01");	//No, jestli to říkají, možná je to pravda. Co potřebuješ?
};


instance DIA_Udar_TeachMe(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_TeachMe_Condition;
	information = DIA_Udar_TeachME_Info;
	permanent = FALSE;
	description = "Nauč mě střílet z kuše.";
};


func int DIA_Udar_TeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest) && (Udar_TeachPlayer != TRUE) && (KAPITELORCATC == FALSE))
	{
		return 1;
	};
};

func void DIA_Udar_TeachME_Info()
{
	AI_Output(other,self,"DIA_Udar_Teacher_15_00");	//Nauč mě střílet z kuše.
	AI_Output(self,other,"DIA_Udar_Teacher_09_01");	//Existuje dost cílů kolem hradu. Cvičit se můžeš na nich.
};


instance DIA_Udar_ImGood(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_ImGood_Condition;
	information = DIA_Udar_ImGood_Info;
	permanent = FALSE;
	description = "Ty jsi nejlepší.";
};


func int DIA_Udar_ImGood_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest) && (KAPITELORCATC == FALSE))
	{
		return 1;
	};
};

func void DIA_Udar_ImGood_Info()
{
	AI_Output(other,self,"DIA_Udar_ImGood_15_00");	//Ty jsi nejlepší.
	AI_Output(self,other,"DIA_Udar_ImGood_09_01");	//(Smích) Jasně.
	AI_Output(self,other,"DIA_Udar_ImGood_09_02");	//Tak dobrá. Zkusím tě něco naučit.
	Udar_TeachPlayer = TRUE;
	B_LogEntry(TOPIC_Teacher_OC,"Udar mě může učit střílet z kuše.");
};


instance DIA_Udar_Teach(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_Teach_Condition;
	information = DIA_Udar_Teach_Info;
	permanent = TRUE;
	description = "Chci se něco naučit.";
};


func int DIA_Udar_Teach_Condition()
{
	if((Udar_TeachPlayer == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Teach_Info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//Chci se u tebe učit.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//Dobrá!
	Info_ClearChoices(DIA_Udar_Teach);
	Info_AddChoice(DIA_Udar_Teach,Dialog_Back,DIA_Udar_Teach_Back);
	Info_AddChoice(DIA_Udar_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Udar_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};

func void DIA_Udar_Teach_Back()
{
	Info_ClearChoices(DIA_Udar_Teach);
};

func void B_Udar_TeachNoMore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//Teď znáš základy a na víc nemáme čas.
};

func void B_Udar_TeachNoMore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//Měl by ses podívat po lepším učiteli.
};

func void DIA_Udar_Teach_CROSSBOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
};

func void DIA_Udar_Teach_CROSSBOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};
	Info_AddChoice(DIA_Udar_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
};


instance DIA_Udar_Perm(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Perm_Condition;
	information = DIA_Udar_Perm_Info;
	permanent = FALSE;
	description = "Jak to jde na hradě?";
};


func int DIA_Udar_Perm_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Udar_Perm_Info()
{
	AI_Output(other,self,"DIA_Udar_Perm_15_00");	//Jak to jde na hradě?
	AI_Output(self,other,"DIA_Udar_Perm_09_01");	//Hodně chlapů se cvičí v boji, protože čekají, že skřeti zaútočí.
	AI_Output(self,other,"DIA_Udar_Perm_09_02");	//To je u skřetů normální. Snaží se tě co nejvíce znervóznit tim svojim pobýháním a pak stejně zaútočí v chumlu hlava nehlava.
};


instance DIA_Udar_Ring(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Ring_Condition;
	information = DIA_Udar_Ring_Info;
	permanent = FALSE;
	description = "Přinesl jsem ti tento prsten od Tengrona.";
};


func int DIA_Udar_Ring_Condition()
{
	if((Npc_HasItems(other,ItRi_Tengron) >= 1) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Ring_Info()
{
	AI_Output(other,self,"DIA_Udar_Ring_15_00");	//Přinesl jsem ti tento prsten od Tengrona. Má tě ochránit. Prý si ho vyzvedne až se vrátí
	AI_Output(self,other,"DIA_Udar_Ring_09_01");	//Cože? Víš co je to za prsten? Dostal ho jako odměnu za udatnost v bitvě.
	AI_Output(self,other,"DIA_Udar_Ring_09_02");	//Říkáš, že si pro něj přijde? Snad to bude vůle Innosova...
	B_GiveInvItems(other,self,ItRi_Tengron,1);
	TengronRing = TRUE;
	B_GivePlayerXP(XP_TengronRing);
};


instance DIA_Udar_KAP4_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP4_EXIT_Condition;
	information = DIA_Udar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Kap4WiederDa(C_Info)
{
	npc = PAL_268_Udar;
	nr = 40;
	condition = DIA_Udar_Kap4WiederDa_Condition;
	information = DIA_Udar_Kap4WiederDa_Info;
	important = TRUE;
};


func int DIA_Udar_Kap4WiederDa_Condition()
{
	if((Kapitel >= 4) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Kap4WiederDa_Info()
{
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_00");	//Dobře, že jsi tu. Je to tu peklo.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self,"DIA_Udar_Kap4WiederDa_15_01");	//Co se stalo?
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_02");	//Přišli drakobijci a chvástaj se, že sejmou draky.
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_03");	//Ale já ti můžu říct, že tihle hoši by měli problém se starým chňapavcem...
	};
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_04");	//Mnozí z nás si ale myslí, že díky nim se odsud dostaneme živí.(posměšně)
};


instance DIA_Udar_Sengrath(C_Info)
{
	npc = PAL_268_Udar;
	nr = 41;
	condition = DIA_Udar_Sengrath_Condition;
	information = DIA_Udar_Sengrath_Info;
	description = "Nebyli jste tu dva?";
};


func int DIA_Udar_Sengrath_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Kap4WiederDa) && (Sengrath_Missing == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Sengrath_Info()
{
	AI_Output(other,self,"DIA_Udar_Sengrath_15_00");	//Nebyli jste tu dva?
	AI_Output(self,other,"DIA_Udar_Sengrath_09_01");	//Sengrath stál na hradbách a usnul.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_02");	//A jeho kuše mu spadla z hradeb.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_03");	//Viděli jsme, jak ji jeden skřet popadl a zmizel.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_04");	//Sengrath vstal a běžel za ním k palisádě. Už se nevrátil.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_05");	//Innos s ním!
	Log_CreateTopic(TOPIC_Sengrath_Missing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing,LOG_Running);
	B_LogEntry(TOPIC_Sengrath_Missing,"Udar hledá svého kamaráda Sengratha. Spadla mu z hradeb kuše a vzal ji nějaký skřet. Sengrath pro ni běžel ke skřetí palisádě a už se nevrátil.");
};


instance DIA_Udar_SENGRATHGEFUNDEN(C_Info)
{
	npc = PAL_268_Udar;
	nr = 42;
	condition = DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information = DIA_Udar_SENGRATHGEFUNDEN_Info;
	description = "Našel jsem Sengratha.";
};


func int DIA_Udar_SENGRATHGEFUNDEN_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Sengrath) && Npc_HasItems(other,ItRw_SengrathsArmbrust_MIS) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info()
{
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_00");	//Našel jsem Sengratha.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_01");	//Opravdu? Kde je?
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_02");	//Je mrtev. Zde je jeho kuše. Měl ji u sebe.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_03");	//Musel ji získat zpět, ale asi ho pak překvapili další skřeti.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_04");	//Zatracený blázen. Já to věděl. Všichni zemřeme.
	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP(XP_SengrathFound);
};


instance DIA_Udar_BADFEELING(C_Info)
{
	npc = PAL_268_Udar;
	nr = 50;
	condition = DIA_Udar_BADFEELING_Condition;
	information = DIA_Udar_BADFEELING_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Udar_BADFEELING_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Udar_SENGRATHGEFUNDEN) && (Kapitel >= 4) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Udar_BADFEELING_Info()
{
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_00");	//Ještě jeden takovíto útok a je po nás.
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_01");	//Skřeti mají nějaké obavy. Muselo je něco vyděsit. Cítím to.
	}
	else
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_02");	//Mám špatné tušení.
	};
	Npc_SetRefuseTalk(self,30);
};


instance DIA_Udar_KAP5_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP5_EXIT_Condition;
	information = DIA_Udar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_KAP6_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_KAP6_EXIT_Condition;
	information = DIA_Udar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_PICKPOCKET(C_Info)
{
	npc = PAL_268_Udar;
	nr = 900;
	condition = DIA_Udar_PICKPOCKET_Condition;
	information = DIA_Udar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Udar_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Udar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
	Info_AddChoice(DIA_Udar_PICKPOCKET,Dialog_Back,DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Udar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};

func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};


instance DIA_UDAR_CAPTURED(C_Info)
{
	npc = PAL_268_Udar;
	nr = 2;
	condition = dia_udar_captured_condition;
	information = dia_udar_captured_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_udar_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_udar_captured_info()
{
	if((MIS_NATANDOLG == LOG_Running) && (UDARKNOWSNATAN == FALSE))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Udar_Captured_01_01");	//Jak?! Co...? Jak ses dostal přes skřety?!
		AI_Output(other,self,"DIA_Udar_Captured_01_04");	//Snad sis nemyslel, že bych se odsud nedostal?
		AI_Output(self,other,"DIA_Udar_Captured_01_05");	//Eh... (ubrečeně) Já jen, že my jsme to nedokázali a ty...
		AI_Output(other,self,"DIA_Udar_Captured_01_06");	//Myslím, že brzy budete mít taky příležitost.
		AI_Output(other,self,"DIA_Udar_Captured_01_08");	//Znáš paladina Nathana?
		AI_Output(self,other,"DIA_Udar_Captured_01_09");	//Nathana?!... Ano, samozřejmě.
		AI_Output(other,self,"DIA_Udar_Captured_01_10");	//Řekl mi, že jsi mu jednou zachránil život.
		AI_Output(self,other,"DIA_Udar_Captured_01_11");	//Ano a od té doby se mi to snaží vrátit všemi možnými prostředky...
		AI_Output(self,other,"DIA_Udar_Captured_01_12");	//Mockrát jsem mu říkal, že je to v pořádku.
		AI_Output(self,other,"DIA_Udar_Captured_01_13");	//Ale on mě neposlouchal. Přidal se k této výpravě, aby dostal šanci zplatit svůj dluh...
		AI_Output(self,other,"DIA_Udar_Captured_01_15");	//Ty ho také znáš?!
		AI_Output(other,self,"DIA_Udar_Captured_01_16");	//Ano. Právě dorazil do Hornického údolí.
		AI_Output(self,other,"DIA_Udar_Captured_01_17");	//Opravdu? (Smutně) Doufám, že nedělá nic hloupého.
		B_LogEntry(TOPIC_NATANDOLG,"Ptal jsem se Udara na paladina Nathana a on potvrdil, že skutečně zachránil tomuto chlapovi život. Nicméně byl velmi zarmoucen, když zjistil, že Nathan přišel do údolí. Jak řekl Udar, Nathan je moc zbrklý. Jen musíme doufat, že Nathan neudělá nějakou hloupost!");
		UDARKNOWSNATAN = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};

