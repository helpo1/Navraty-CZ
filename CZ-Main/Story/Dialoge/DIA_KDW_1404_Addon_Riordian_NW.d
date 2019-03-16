/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Addon_Riordian_SaturasWantYou_Info - Saturas (cyrilice -> latinka)

*/




instance DIA_Addon_Riordian_EXIT(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 999;
	condition = DIA_Addon_Riordian_EXIT_Condition;
	information = DIA_Addon_Riordian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_Hallo(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_Hallo_Condition;
	information = DIA_Addon_Riordian_Hallo_Info;
	description = "Co to děláš?";
};


func int DIA_Addon_Riordian_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Hallo_15_00");	//Co to děláš?
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_01");	//Studuji kulturu pradávného lidu.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_02");	//Podle nápisů, které jsme tu našli, tady žili velmi dlouho před námi.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_03");	//Nevím přesně kdy tyhle síně postavili, ale jejich civilizace byla na velmi vysoké úrovni.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_04");	//Na druhé straně hor vybudovali velké město. (uvážlivě) A taky Adanův chrám.
};


instance DIA_Addon_Riordian_Alter(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 6;
	condition = DIA_Addon_Riordian_Alter_Condition;
	information = DIA_Addon_Riordian_Alter_Info;
	description = "Jak myslíš, že je tahle stavba stará?";
};


func int DIA_Addon_Riordian_Alter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_Alter_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Alter_15_00");	//Jak myslíš, že je tahle stavba stará?
	AI_Output(self,other,"DIA_Addon_Riordian_Alter_10_01");	//No, přesně ti to zatím neřeknu, ale určitě několik set let.
};


instance DIA_Addon_Riordian_Atlantis(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 4;
	condition = DIA_Addon_Riordian_Atlantis_Condition;
	information = DIA_Addon_Riordian_Atlantis_Info;
	description = "Ztracené město na ostrově Khorinis?";
};


func int DIA_Addon_Riordian_Atlantis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_Atlantis_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Atlantis_15_00");	//Ztracené město na ostrově Khorinis?
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_01");	//Ano. Dosud jsme žili v domnění, že celý ostrov už máme zmapovaný.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_02");	//Počítali jsme, že na celém severovýchodě ostrova se rozkládá jen jedno velké pohoří.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_03");	//Ale mýlili jsme se.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_04");	//Za těmi horami leží ještě údolí. A kdysi tam stávalo město pradávného lidu.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_05");	//(vzdech) Moc rád bych viděl, jaké stavby v tom městě stály, ale už se nejspíš dávno obrátily v prach.
	B_LogEntry(TOPIC_Addon_KDW,"Mágové Vody se domnívají, že za portálem leží pradávné ztracené město.");
};


instance DIA_Addon_Riordian_SaturasWantYou(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_SaturasWantYou_Condition;
	information = DIA_Addon_Riordian_SaturasWantYou_Info;
	description = "Saturas tě chce vidět.";
};


func int DIA_Addon_Riordian_SaturasWantYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo) && (MIS_Addon_Saturas_BringRiordian2Me == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_SaturasWantYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_SaturasWantYou_15_00");	//Saturas tě chce vidět.
	AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_01");	//Pokročil ve svém pátrání? Pak za ním okamžitě zajdu.
	if(Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_02");	//Jestli se chceš dozvědět víc o tomhle komplexu, promluv si s Nefariem.
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_03");	//Najdeš ho o kousek dál, vzadu v těchto hrobkách.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Saturas");
	MIS_Addon_Saturas_BringRiordian2Me = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


var int Riordian_PermNews;

instance DIA_Addon_Riordian_Perm(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 99;
	condition = DIA_Addon_Riordian_Perm_Condition;
	information = DIA_Addon_Riordian_Perm_Info;
	permanent = TRUE;
	description = "Objevili jste něco nového?";
};


func int DIA_Addon_Riordian_Perm_Condition()
{
	if(MIS_Addon_Saturas_BringRiordian2Me == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Perm_15_00");	//Objevili jste něco nového?
	if(Riordian_PermNews == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_01");	//Už je to jisté. Lid téhle prastaré kultury skutečně uctíval Adana!
		Riordian_PermNews = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_02");	//Ani ne, vrať se později.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 1;
	condition = dia_addon_riordian_prayforgomez_condition;
	information = dia_addon_riordian_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};


func int dia_addon_riordian_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Riordian_PrayForGomez_01_02");	//Promluv si se Saturasem.
	AI_Output(self,other,"DIA_Addon_Riordian_PrayForGomez_01_03");	//Ten ti dokáže pomoci.
	SENTTOSATURASGOMEZ = TRUE;
};

instance DIA_ADDON_RIORDIAN_TEACHPRE(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = dia_addon_riordian_teachpre_condition;
	information = dia_addon_riordian_teachpre_info;
	description = "Vatras mi dal tento amulet pátrající bludičky...";
};

func int dia_addon_riordian_teachpre_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teachpre_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//Vatras mi dal tento amulet pátrající bludičky...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//Ach! Velmi vzácný artefakt. Víš o tom, že svou bludičku můžeš trénovat?
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//Můžeš mi s tím pomoci?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//Jistě. Zabývám se tímto druhem magie už dlouho.
	Riordian_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
};

instance DIA_ADDON_RIORDIAN_TEACH(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 90;
	condition = dia_addon_riordian_teach_condition;
	information = dia_addon_riordian_teach_info;
	permanent = TRUE;
	description = "Ukaž mi, jak mám trénovat bludičku.";
};

var int dia_addon_riordian_teach_noperm;

func int dia_addon_riordian_teach_condition()
{
	if((Riordian_Addon_TeachPlayer == TRUE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teach_info()
{
	B_DIA_Addon_Riordian_Teach_15_00();

	if((player_talent_wispdetector[WISPSKILL_NF] == FALSE) || (player_talent_wispdetector[WISPSKILL_FF] == FALSE) || (player_talent_wispdetector[WISPSKILL_NONE] == FALSE) || (player_talent_wispdetector[WISPSKILL_RUNE] == FALSE) || (player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE) || (player_talent_wispdetector[WISPSKILL_FOOD] == FALSE) || (player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_teach);
		Info_AddChoice(dia_addon_riordian_teach,Dialog_Back,dia_addon_riordian_teach_back);
		B_DIA_Addon_Riordian_Teach_10_01();

		if(player_talent_wispdetector[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Vyhledávání zbraní, šípů a šipek (Vyžaduje: 10 kusů magické rudy)",dia_addon_riordian_teach_wispskill_ff);
		};
		if(player_talent_wispdetector[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Vyhledávání zlata a ostatních předmětů (Vyžaduje: 20 kusů magické rudy)",dia_addon_riordian_teach_wispskill_none);
		};
		if(player_talent_wispdetector[WISPSKILL_RUNE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Vyhledávání magických svitků (Vyžaduje: 30 kusů magické rudy)",dia_addon_riordian_teach_wispskill_rune);
		};
		if(player_talent_wispdetector[WISPSKILL_FOOD] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Vyhledávání rostlin a potravin (Vyžaduje: 50 kusů magické rudy)",dia_addon_riordian_teach_wispskill_food);
		};
		if(player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Vyhledávání magických prstenů a amuletů (Vyžaduje: 75 kusů magické rudy)",dia_addon_riordian_teach_wispskill_magic);
		};
		if(player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,"Vyhledávání magických lektvarů (Vyžaduje: 100 kusů magické rudy)",dia_addon_riordian_teach_wispskill_potions);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_ADDON_RIORDIAN_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_teach_wispskill_x()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void dia_addon_riordian_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF,10))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE,20))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE,30))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC,75))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD,50))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS,100))
	{
		dia_addon_riordian_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_teach);
};