
instance DIA_GORNAVID_EXIT(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 999;
	condition = dia_gornavid_exit_condition;
	information = dia_gornavid_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornavid_exit_condition()
{
	return TRUE;
};

func void dia_gornavid_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_gornavid_PICKPOCKET(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 900;
	condition = dia_gornavid_PICKPOCKET_Condition;
	information = dia_gornavid_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_gornavid_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void dia_gornavid_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_gornavid_PICKPOCKET);
	Info_AddChoice(dia_gornavid_PICKPOCKET,Dialog_Back,dia_gornavid_PICKPOCKET_BACK);
	Info_AddChoice(dia_gornavid_PICKPOCKET,DIALOG_PICKPOCKET,dia_gornavid_PICKPOCKET_DoIt);
};

func void dia_gornavid_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_gornavid_PICKPOCKET);
};

func void dia_gornavid_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_gornavid_PICKPOCKET);
};

instance DIA_GORNAVID_WHOYOU(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 1;
	condition = dia_gornavid_whoyou_condition;
	information = dia_gornavid_whoyou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_gornavid_whoyou_condition()
{
	if(PSI_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornavid_whoyou_info()
{
	AI_Output(other,self,"DIA_GorNaVid_WhoYou_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_GorNaVid_WhoYou_01_01");	//Mé jméno je Gor Na Vid.
	AI_Output(other,self,"DIA_GorNaVid_WhoYou_01_02");	//Řekni mi, jaké lidi potřebujete?
	AI_Output(self,other,"DIA_GorNaVid_WhoYou_01_03");	//Dobří lidé jsou vždy potřební. Měl bys na sobě zapracovat.
	AI_Output(self,other,"DIA_GorNaVid_WhoYou_01_04");	//Pouze ti nejlepší z nás se mohou stát templáři.
	AI_Output(self,other,"DIA_GorNaVid_WhoYou_01_05");	//To je nejvyšší pocta, jaké se může dostat kterémukoliv členu Bratrstva.
};


instance DIA_GORNAVID_BECOMETPL(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 1;
	condition = dia_gornavid_becometpl_condition;
	information = dia_gornavid_becometpl_info;
	permanent = TRUE;
	description = "Chtěl bych se stát templářem, tak jako ty.";
};


func int dia_gornavid_becometpl_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornavid_whoyou) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_gornavid_becometpl_info()
{
	AI_Output(other,self,"DIA_GorNaVid_BecomeTPL_01_00");	//Chtěl bych se stát templářem, tak jako ty.
	AI_Output(self,other,"DIA_GorNaVid_BecomeTPL_01_01");	//Nejsi nějak hrr, chlapče?
	AI_Output(self,other,"DIA_GorNaVid_BecomeTPL_01_02");	//Víš, jak dlouho to trvá, než tě přijmou tak vysoko?
	AI_Output(self,other,"DIA_GorNaVid_BecomeTPL_01_03");	//Jsem u Bratrstva už pět let, templářem teprve půl roku.
	AI_Output(self,other,"DIA_GorNaVid_BecomeTPL_01_04");	//Bude nějakou dobu trvat, než té pocty dosáhneš i ty.
};


instance DIA_GORNAVID_ABWEISEND(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 2;
	condition = dia_gornavid_abweisend_condition;
	information = dia_gornavid_abweisend_info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit?";
};


func int dia_gornavid_abweisend_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornavid_whoyou) && (GORNAVIDTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornavid_abweisend_info()
{
	AI_Output(other,self,"DIA_GorNaVid_Abweisend_01_00");	//Můžeš mě něco naučit?
	if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_01");	//Trénuji jen templáře!
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_02");	//Trénovat Guru není v mé práci. Raději běž za Baaly.
	}
	else if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_03");	//Trénuji jen templáře!
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_04");	//Pokud se chceš k nám přidat, promluv si o tom s Gor Na Koshem. On nás vede.
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_05");	//Udělal jsi dobře, že jsi za mnou došel.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_06");	//Protože se opravdu musíš něco ještě naučit.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_07");	//Tradiční zbraní templářů je obouruční meč. Avšak, neměl bys zapomínat i na boj na delší vzdálenost.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_08");	//Střelbě lukem sice moc nerozumím, za to jsem ale expert ve střelbě z kuše.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_09");	//Pokud potřebuješ něco v tomto směru něco přiučit, tak přijď za mnou.
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_10");	//Velice rád se podělím se svými zkušenostmi.
		Log_CreateTopic(TOPIC_ADDON_TPLTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_TPLTEACHER,"Gor Na Vid mě naučí střelbě z kuše.");
		GORNAVIDTEACH = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_11");	//Trénuji jen templáře a ty ke všemu ani nepatříš do našeho tábora!
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_12");	//Promiň, ale nepomohu ti.
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_13");	//Běž pryč!
		AI_Output(self,other,"DIA_GorNaVid_Abweisend_01_14");	//Tady nemají cizinci co dělat!
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNAVID_TEACH(C_Info)
{
	npc = tpl_8007_gornavid;
	nr = 3;
	condition = dia_gornavid_teach_condition;
	information = dia_gornavid_teach_info;
	permanent = TRUE;
	description = "Nauč mě prosím jak ovládat kuše.";
};


func int dia_gornavid_teach_condition()
{
	if((GORNAVIDTEACH == TRUE) && ((other.HitChance[NPC_TALENT_CROSSBOW] < 100) || (other.HitChance[NPC_TALENT_BOW] < 60)))
	{
		return TRUE;
	};
};

func void dia_gornavid_teach_info()
{
	AI_Output(other,self,"DIA_GorNaVid_Teach_15_00");	//Nauč mě prosím jak ovládat kuše.
	AI_Output(self,other,"DIA_GorNaVid_Teach_09_01");	//Dobrá, tak tedy začněme.
	Info_ClearChoices(dia_gornavid_teach);
	Info_AddChoice(dia_gornavid_teach,Dialog_Back,dia_gornavid_teach_back);
	Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_gornavid_teach_crossbow_1);
	Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_gornavid_teach_crossbow_5);
};

func void dia_gornavid_teach_back()
{
	Info_ClearChoices(dia_gornavid_teach);
};

func void b_gornavid_teachnomore1()
{
	AI_Output(self,other,"B_GorNaVid_TeachNoMore1_09_00");	//Už víš tolik, co já, už tě nemohu nic naučit.
};

func void b_gornavid_teachnomore2()
{
	AI_Output(self,other,"B_GorNaVid_TeachNoMore2_09_00");	//Už tě nemůžu nic naučit. Jsi příliš dobrý.
};

func void b_gornavid_teachnomore3()
{
	AI_Output(self,other,"B_GorNaVid_TeachNoMore3_09_00");	//Už znáš základy, nemám čas, učit tě víc.
};

func void b_gornavid_teachnomore4()
{
	AI_Output(self,other,"B_GorNaVid_TeachNoMore4_09_00");	//Aby ses naučil lépe střílet z luku, měl bys najít někoho lepšího, než jsem já.
};

func void dia_gornavid_teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100);

	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 100)
	{
		b_gornavid_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_gornavid_teachnomore2();
		};
	}
	else
	{
		Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_gornavid_teach_crossbow_1);
	};
};

func void dia_gornavid_teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100);

	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 100)
	{
		b_gornavid_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_gornavid_teachnomore2();
		};
	}
	else
	{
		Info_AddChoice(dia_gornavid_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_gornavid_teach_crossbow_5);
	};
};
