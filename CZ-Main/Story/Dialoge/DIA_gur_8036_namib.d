
instance DIA_BAALNAMIB_EXIT(C_Info)
{
	npc = gur_8036_namib;
	nr = 999;
	condition = dia_baalnamib_exit_condition;
	information = dia_baalnamib_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baalnamib_exit_condition()
{
	return TRUE;
};

func void dia_baalnamib_exit_info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

instance DIA_BAALNAMIB_PICKPOCKET(C_Info)
{
	npc = gur_8036_namib;
	nr = 900;
	condition = DIA_BAALNAMIB_PICKPOCKET_Condition;
	information = DIA_BAALNAMIB_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_BAALNAMIB_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void DIA_BAALNAMIB_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_BAALNAMIB_PICKPOCKET);
	Info_AddChoice(DIA_BAALNAMIB_PICKPOCKET,Dialog_Back,DIA_BAALNAMIB_PICKPOCKET_BACK);
	Info_AddChoice(DIA_BAALNAMIB_PICKPOCKET,DIALOG_PICKPOCKET,DIA_BAALNAMIB_PICKPOCKET_DoIt);
};

func void DIA_BAALNAMIB_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_BAALNAMIB_PICKPOCKET);
};

func void DIA_BAALNAMIB_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_BAALNAMIB_PICKPOCKET);
};


instance DIA_BAALNAMIB_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_notalk_sleeper_condition;
	information = dia_baalnamib_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = "Spáč s tebou!";
};


func int dia_baalnamib_notalk_sleeper_condition()
{
	if((IDOLNAMIB_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_notalk_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_01_00");	//Spáč s tebou!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_01_01");	//(povzdech)
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_NOTALK_IMP(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_notalk_imp_condition;
	information = dia_baalnamib_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = "Je všechno v pořádku, příteli?";
};


func int dia_baalnamib_notalk_imp_condition()
{
	if((IDOLNAMIB_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_notalk_imp_info()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_01_00");	//Je všechno v pořádku, příteli?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_01_01");	//(povzdech)
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_SLEEPSPELL(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_sleepspell_condition;
	information = dia_baalnamib_sleepspell_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalnamib_sleepspell_condition()
{
	var C_Npc sek8022;
	var C_Npc sek8023;
	var C_Npc sek8024;

	sek8022 = Hlp_GetNpc(sek_8022_novize);
	sek8023 = Hlp_GetNpc(sek_8023_novize);
	sek8024 = Hlp_GetNpc(sek_8024_novize);

	if((Npc_IsInState(sek8022,ZS_MagicSleep) || Npc_IsInState(sek8023,ZS_MagicSleep) || Npc_IsInState(sek8024,ZS_MagicSleep)) && (IDOLNAMIB_YES == FALSE) && (other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (CANBEGURU == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_sleepspell_info()
{
	B_GivePlayerXP(200);
	 AI_Output(self,other,"DIA_BaalNamib_SleepSpell_01_00"); //Co jsi to udělal?
	 AI_Output(self,other,"DIA_BaalNamib_SleepSpell_01_01"); //Kdo tě naučil Spáčově magii?
	 AI_Output(other,self,"DIA_BaalNamib_SleepSpell_01_02"); //Nikdo. Ve skutečnosti to není zas tak těžké!
	 AI_Output(self,other,"DIA_BaalNamib_SleepSpell_01_03"); //Vypadáš jako silný žák. Budu tě učit.
	 AI_Output(self,other,"DIA_BaalNamib_SleepSpell_01_04"); //Samozřejmě jen tehdy, když se staneš jedním z nás.
	IDOLNAMIB_YES = TRUE;
};


instance DIA_BAALNAMIB_AUFGABE(C_Info)
{
	npc = gur_8036_namib;
	nr = 800;
	condition = dia_baalnamib_aufgabe_condition;
	information = dia_baalnamib_aufgabe_info;
	permanent = FALSE;
	important = FALSE;
	description = "Přeji si vstoupit do Bratrstva.";
};


func int dia_baalnamib_aufgabe_condition()
{
	if((IDOLNAMIB_YES == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_baalnamib_aufgabe_info()
{
	AI_Output(other,self,"DIA_BaalNamib_Aufgabe_01_00");	//Přeji si přidat se k vám, mistře.
	AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_01");	//Ty si přeješ stát se jedním z nás?

	if(other.attribute[ATR_MANA_MAX] >= 60)
	{
		B_GivePlayerXP(400);
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_02");	//Nech mě prohlédnout si tě... mmmm... (podrobně si tě prohlíží)
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_03");	//Nevypadáš na osobu se slabým duchem...
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_04");	//Citím v tobě ohromnou duchovní sílu! Brzo se staneš jedním z mocných...
		AI_Output(other,self,"DIA_BaalNamib_Aufgabe_01_05");	//Takže to znamená, mistře, že mi dáváte svolení stát se členem Bratrstva?
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_06");	//Ano, cizinče! Běž za Baalem Orunem a požádej ho o uniformu novice.
		Log_SetTopicStatus(TOPIC_NAMIBWORK,LOG_SUCCESS);
		B_LogEntry(TOPIC_NAMIBWORK,"Baal Namib si myslí, že lidé se silným duchem jsou užiteční pro Bratrstvo a souhlasí s mým přijetím.");
		MIS_NAMIBWORK = LOG_SUCCESS;
		NAMIBAGREED = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_07");	//Nech mě prohlédnout si tě... mmmm... (podrobně si tě prohlíží)
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_08");	//Ještě nejsi připraven stát se jedním z nás. Tvůj duch je pořád příliš slabý!
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_09");	//Vrať se, až se tvá duchovní síla zvýší.
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_10");	//Pak si možná promluvíme o tvém přijetí.
		Log_CreateTopic(TOPIC_NAMIBWORK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_NAMIBWORK,LOG_Running);
		B_LogEntry(TOPIC_NAMIBWORK,"Baal Namib si myslí, že můj duch není ještě tak silný, abych našel uplatnění v Bratrstvu.");
		B_LogEntry(TOPIC_NAMIBWORK,"Řekl mi, že se mám vrátit, až má duchovní síla vzroste.");
		MIS_NAMIBWORK = LOG_Running;
	};
};


instance DIA_BAALNAMIB_ZUSTIMMUNG(C_Info)
{
	npc = gur_8036_namib;
	nr = 2;
	condition = dia_baalnamib_zustimmung_condition;
	information = dia_baalnamib_zustimmung_info;
	permanent = TRUE;
	description = "Je již můj duch dostatečně silný, mistře?";
};


func int dia_baalnamib_zustimmung_condition()
{
	if((MIS_NAMIBWORK == LOG_Running) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_zustimmung_info()
{
	AI_Output(other,self,"DIA_BaalNamib_Zustimmung_01_00");	//Je již můj duch dostatečně silný, mistře?
	AI_Output(self,other,"DIA_BaalNamib_Zustimmung_01_01");	//Nech mě podívat... mmmm... (důkladně si tě prohlíží)

	if(other.attribute[ATR_MANA_MAX] >= 60)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_BaalNamib_Aufgabe_01_04");	//Citím v tobě ohromnou duchovní sílu! Brzo se staneš jedním z mocných...
		AI_Output(other,self,"DIA_BaalNamib_Zustimmung_01_03");	//Takže to znamená, mistře, že mi dáváte svolení stát se členem Bratrstva?
		AI_Output(self,other,"DIA_BaalNamib_Zustimmung_01_04");	//Ano, cizinče! Běž za Baalem Orunem a požádej ho o uniformu novice.
		Log_SetTopicStatus(TOPIC_NAMIBWORK,LOG_SUCCESS);
		B_LogEntry(TOPIC_NAMIBWORK,"Namib si myslí, že můj duch není ještě tak silný, abych našel uplatnění v Bratrstvu.");
		MIS_NAMIBWORK = LOG_SUCCESS;
		NAMIBAGREED = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_BaalNamib_Zustimmung_01_05");	//Ještě ne- jsi pořád slabý!... (zklamaně)
		AI_Output(self,other,"DIA_BaalNamib_Zustimmung_01_06");	//Nemrhej mým časem. Vrať se až tvá duše bude silnější!
	};
};


instance DIA_BAALNAMIB_PRETEACH(C_Info)
{
	npc = gur_8036_namib;
	nr = 99;
	condition = dia_baalnamib_preteach_condition;
	information = dia_baalnamib_preteach_info;
	description = "Baal Orun mi řekl, že mě naučíš jak vytvářet runy.";
};


func int dia_baalnamib_preteach_condition()
{
	if((hero.guild == GIL_GUR) && (BAALNAMIB_TEACHRUNES == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_preteach_info()
{
	AI_Output(other,self,"DIA_BaalNamib_PreTeach_15_00");	//Baal Orun mi řekl, že mě naučíš jak vytvářet runy.
	AI_Output(self,other,"DIA_BaalNamib_PreTeach_05_01");	//Jistě, s radostí ti pomohu stát se mistrem Spáčovy magie!
	AI_Output(self,other,"DIA_BaalNamib_PreTeach_05_02");	//S každým novým kruhem magie se naučíš používat mocnější kouzla.
	AI_Output(self,other,"DIA_BaalNamib_PreTeach_05_03");	//Budeš potřebovat svitky na výrobu run. Baal Tyon ti může některé prodat.
	AI_Output(self,other,"DIA_BaalNamib_PreTeach_05_04");	//Také si od něj můžeš koupit knihy o Spáčově magii.
	Log_CreateTopic(TOPIC_ADDON_GURTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_GURTEACHER,"Baal Namib mě může naučit vyrábět runy Spáčovy magie.");
};


instance DIA_BAALNAMIB_RUNEN(C_Info)
{
	npc = gur_8036_namib;
	nr = 99;
	condition = dia_baalnamib_runen_condition;
	information = dia_baalnamib_runen_info;
	permanent = TRUE;
	description = "Nauč mě vyrobit runu.";
};


func int dia_baalnamib_runen_condition()
{
	if((hero.guild == GIL_GUR) && (BAALNAMIB_TEACHRUNES == TRUE) && Npc_KnowsInfo(other,dia_baalnamib_preteach))
	{
		return TRUE;
	};
};

func void dia_baalnamib_runen_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Uč mě!
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_baalnamib_runen,"6. kruh magie",dia_baalnamib_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_baalnamib_runen,"5. kruh magie",dia_baalnamib_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_baalnamib_runen,"4. kruh magie",dia_baalnamib_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_baalnamib_runen,"3. kruh magie",dia_baalnamib_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_baalnamib_runen,"2. kruh magie",dia_baalnamib_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_baalnamib_runen,"1. kruh magie",dia_baalnamib_runen_1);
	};
};

func void dia_baalnamib_runen_back()
{
	Info_ClearChoices(dia_baalnamib_runen);
};

func void dia_baalnamib_runen_1()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),dia_baalnamib_runen_circle_1_spl_sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_BERZERK] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_BERZERK,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BERZERK)),dia_baalnamib_runen_circle_3_spl_berzerk);
	};
};

func void dia_baalnamib_runen_2()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_GreenTentacle] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_GreenTentacle,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GreenTentacle)),dia_baalnamib_runen_circle_2_spl_greententacle);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),dia_baalnamib_runen_circle_2_spl_windfist);
	};
};

func void dia_baalnamib_runen_3()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),dia_baalnamib_runen_circle_3_spl_fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_Charm] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Charm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Charm)),dia_baalnamib_runen_circle_1_spl_charm);
	};
	if(PLAYER_TALENT_RUNES[SPL_Extricate] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Extricate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Extricate)),dia_baalnamib_runen_circle_3_spl_Extricate);
	};
};

func void dia_baalnamib_runen_4()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_SUMMONSWAMPGOLEM] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSWAMPGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSWAMPGOLEM)),dia_baalnamib_runen_circle_5_spl_summonswampgolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_Acid] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Acid,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Acid)),dia_baalnamib_runen_circle_5_spl_Acid);
	};
	if((PLAYER_TALENT_RUNES[SPL_Elevate] == FALSE) && (LegoSpellElevate == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Elevate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Elevate)),dia_baalnamib_runen_circle_4_spl_Elevate);
	};
};

func void dia_baalnamib_runen_5()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_SEVEREFETIDITY] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_SEVEREFETIDITY,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SEVEREFETIDITY)),dia_baalnamib_runen_circle_4_spl_severefetidity);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),dia_baalnamib_runen_circle_4_spl_whirlwind);
	};
};

func void dia_baalnamib_runen_6()
{
	Info_ClearChoices(dia_baalnamib_runen);
	Info_AddChoice(dia_baalnamib_runen,Dialog_Back,dia_baalnamib_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_GuruWrath] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_GuruWrath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GuruWrath)),dia_baalnamib_runen_circle_6_spl_GuruWrath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Quake] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_baalnamib_runen,b_buildlearnstringforrunes(NAME_SPL_Quake,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Quake)),dia_baalnamib_runen_circle_6_spl_Quake);
	};
};

func void dia_baalnamib_runen_circle_1_spl_sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void dia_baalnamib_runen_circle_1_spl_charm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Charm);
};

func void dia_baalnamib_runen_circle_2_spl_greententacle()
{
	B_TeachPlayerTalentRunes(self,other,SPL_GreenTentacle);
};

func void dia_baalnamib_runen_circle_2_spl_windfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void dia_baalnamib_runen_circle_3_spl_fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void dia_baalnamib_runen_circle_3_spl_berzerk()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BERZERK);
};

func void dia_baalnamib_runen_circle_3_spl_Extricate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Extricate);
};

func void dia_baalnamib_runen_circle_4_spl_Elevate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Elevate);
};

func void dia_baalnamib_runen_circle_5_spl_Acid()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Acid);
};

func void dia_baalnamib_runen_circle_6_spl_Quake()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Quake);
};

func void dia_baalnamib_runen_circle_4_spl_severefetidity()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SEVEREFETIDITY);
};

func void dia_baalnamib_runen_circle_4_spl_whirlwind()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Whirlwind);
};

func void dia_baalnamib_runen_circle_5_spl_summonswampgolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONSWAMPGOLEM);
};

func void dia_baalnamib_runen_circle_6_spl_GuruWrath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_GuruWrath);
};

instance DIA_BAALNAMIB_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_runemagicnotwork_condition;
	information = dia_baalnamib_runemagicnotwork_info;
	permanent = FALSE;
	description = "Fungují tvé runy?";
};


func int dia_baalnamib_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalNamib_RuneMagicNotWork_01_00");	//Fungují tvé runy?
	AI_Output(self,other,"DIA_BaalNamib_RuneMagicNotWork_01_01");	//Bohužel, naše runy zeslábli. A už je nelze používat! (smutně)
	AI_Output(self,other,"DIA_BaalNamib_RuneMagicNotWork_01_03");	//Nevíš ty o tom něco?
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Ani Guru Bratrstva už svou runovou magií nevládnou.");
	GURUMAGERUNESNOT = TRUE;
};

//-----------------PRIORAT---------------------

instance DIA_BAALNAMIB_PrioratStart(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_PrioratStart_condition;
	information = dia_baalnamib_PrioratStart_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalnamib_PrioratStart_condition()
{
	if(PrioratPreStart == TRUE)
	{
		return TRUE;
	};
};

func void dia_baalnamib_PrioratStart_info()
{
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		if(hero.guild == GIL_SEK)
		{
			AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_01");	//Dobře, že jsi přišel, novici.
		}
		else if(hero.guild == GIL_GUR)
		{
			AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_02");	//Dobře, že jsi přišel.
		}
		else if(hero.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_03");	//Dobře, že jsi přišel, templáři.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_04");	//Dobře, že jsi přišel, cizinče.
	};


	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_01_05");	//Chtěl jsi mě vidět?
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_06");	//Přesně tak, mám pro tebe úkol, který nesnese odkladu.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_07");	//V poslední době se z tábora Bratrstva ztrácejí novicové.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_08");	//A nikdo neví jestli odešli sami, nebo se jim něco přihodilo.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_09");	//Nikoho tady násilím nedržíme. To by mohlo mít neblahé následky na naší komunitu.
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_01_10");	//A co ode mně chceš?
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_11");	//Potřebuju, abys zjistil, co přimělo novice opustit řady našeho Bratrstva.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_12");	//A nebo zjistit, co se s nima stalo.
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_01_13");	//To je zajímavé a proč zrovna já?
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_14");	//Víš, tadle záležitost je celkem citlivá.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_15");	//Kdybych to svěřil někomu jinému, obávám se že by se mohli šířit různé drby a to v tédle situaci není žádoucí.

	if((hero.guild == GIL_SEK) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_16");	//A ty jsi tu nový, navíc s dobrou pověstí v našem Bratrstvu.
	}
	else
	{
		AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_17");	//A ty, jak jsem slyšel jsi spolehlivý člověk, i když nejsi člen našeho Bratrstva.
	};

	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_01_18");	//To vysvětluje můj výběr. Tak co můžu se na tebe spolehnout? 
	Info_ClearChoices(DIA_BaalNamib_PrioratStart);
	Info_AddChoice(DIA_BaalNamib_PrioratStart,"Dobře, kde mám začít?",DIA_BaalNamib_PrioratStart_yes);
	Info_AddChoice(DIA_BaalNamib_PrioratStart,"Nemám na to čas.",DIA_BaalNamib_PrioratStart_no);
};

func void DIA_BaalNamib_PrioratStart_no()
{
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_no_01_01");	//Bohužel, nemám na to čas.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_no_01_02");	//Cože... velmi jsi mě sklamal svojí odpovědí.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_no_01_03");	//Doufám, že máš něco velmi důležitého na práci, než abys pomohl našemu Bratrstvu.
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_no_01_04");	//Velmi mě to mrzí.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_no_01_05");	//(vzdech)
	AI_StopProcessInfos(self);
};

func void DIA_BaalNamib_PrioratStart_yes()
{
	Wld_SendTrigger("NW_ASS_BLOOD_01");
	B_StartOtherRoutine(SEK_8039_NOVIZE,"TOT");
	B_StartOtherRoutine(SEK_8040_NOVIZE,"TOT");
	B_StartOtherRoutine(tpl_8045_hanis,"Death");
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_yes_01_01");	//Dobrá, kde mám začít se svím pátráním?
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_02");	//Myslím, že bys měl nejprve prověřit tábor našich sběračů trávy.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_03");	//Už jsme od nich dluho nedostali žádnou zprávu.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_04");	//Mám o ně velký strach. Zdejší krajina není příliš přátelská.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_05");	//Zaprvé zjisti jestli něco nevědí o ztracených novicích. Každá informace se bude hodit.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_06");	//Po návštěvě sběračů se vydej do města a navštiv Baala Parveze.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_07");	//Zjisti, jestli nemá nějaké informace k tomuto případu. To je vše.
	AI_Output(other,self,"DIA_BaalNamib_PrioratStart_yes_01_08");	//Dobře, všemu jsem rozuměl.
	AI_Output(self,other,"DIA_BaalNamib_PrioratStart_yes_01_09");	//Budu čekat na tvoje zprávy a doufám, že budou dobré.
	Log_CreateTopic(TOPIC_PrioratStart,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PrioratStart,LOG_Running);
	B_LogEntry(TOPIC_PrioratStart,"Baal Namib je znepokojen skutečností, že se v táboře Bratrstva začali ztrácet novicové. Požádal mě abych mu pomohl v pátrání. Pro začátek bych měl navštívit tábor sběračů a pak se zastavit v Khorinisu za Baalem Parvezem jestli nemá nějaké informace k tomuto případu.");
	MIS_PrioratStart = LOG_Running;
	AI_StopProcessInfos(self);
};

var int MissKillerHanis;

instance DIA_BAALNAMIB_PrioratNews(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_PrioratNews_condition;
	information = dia_baalnamib_PrioratNews_info;
	permanent = TRUE;
	description = "Mám pro tebe nějaké novinky.";
};


func int dia_baalnamib_PrioratNews_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeekInProgress == FALSE) && ((PsiCamp_01_Ok == TRUE) || (PsiCamp_02_Ok == TRUE) || (PsiCamp_03_Ok == TRUE) || (PsiCamp_04_Ok == TRUE)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_PrioratNews_info()
{
	var int ExpAll;

	ExpAll = FALSE;

	AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_01");	//Mám pro tebe nějaké novinky
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_02");	//Dobře tě poslouchám.

	if((PsiCamp_01_Ok == TRUE) && (PsiCamp_01_Done == FALSE))
	{
		ExpAll = ExpAll + 100;
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_03");	//V táboře sběračů trávy vše v pořádku - nová várka trávy bude dodána včas. 
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_04");	//A něco o ztracených novicích?
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_05");	//Nic o tom nevědí. 
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_06");	//Dobře. Ještě něco? 
		PsiCamp_01_Done = TRUE;
	};

	if((PsiCamp_02_Ok == TRUE) && (PsiCamp_02_Done == FALSE))
	{
		ExpAll = ExpAll + 100;
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_07");	//U Shreta a jeho sběračů je vše v pořádku.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_08");	//To mě těší. A vědí něco o ztacených novicích?
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_09");	//Ne.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_10");	//Když nic tak nic. A máš ještě nějaké jiné zprávy?
		PsiCamp_02_Done = TRUE;
	};

	if((PsiCamp_04_Ok == TRUE) && (PsiCamp_04_Done == FALSE))
	{
		ExpAll = ExpAll + 100;
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_11");	//Promluvil jsem s Baalem Parvezem. 
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_12");	//A co říkal?
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_13");	//Podle něj, ve městě nikdo nováčky z tábora neviděl. 
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_14");	//A je o tom přesvědčen?
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_15");	//Absolutně. Městská ztráž by to nenechala bez povšimnutí.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_16");	//Dobře... (zamyšleně) Ještě nějaké novinky?
		PsiCamp_04_Done = TRUE;
	};
	if((PsiCamp_03_Ok == TRUE) && (PsiCamp_03_Done == FALSE))
	{
		if(MissKillerHanis == FALSE)
		{
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_17");	//Asi se ti to nebude moc líbit, ale tábor templáře Hanise byl napaden.
			AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_18");	//Co?! No kdo to mohl udělat, hlavně proč?
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_19");	//To já nevím.
			AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_20");	//O bože... (netrpělivě) A co je s Hanisem?
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_21");	//Byl se statečně, dokonce jednoho z útočníků zranil. Ale byl smrtelně zraněn a už se mě ho nepodařilo zachránit.
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_23");	//Před tím než zemřel, mi řekl že útočníci unesli všechny sběrače trávy.
		}
		else
		{
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_53");	//O útoku na tábor Hanise...
		};

		if(FirstAssas == TRUE)
		{
			if(Npc_HasItems(other,ItMw_1H_AssBlade) >= 1)
			{
				ExpAll = ExpAll + 500;
			};

			if(MissKillerHanis == FALSE)
			{
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_24");	//A co jsi zjistil?
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_25");	//Podle slov Hanise, jeden z útočníků silně krvácel. To mě pomohlo ho vystopovat a zabít.
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_26");	//Ale kdo to byl a odkud se vzal se mě zjistit nepodařilo. Byl u něj akorát podivně vypadající meč.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_27");	//Nech mě ať se na něj podívám.
			}
			else
			{
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_54");	//Poslouchám tě!
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_55");	//Podařilo se mně vystopovat a zabít jednoho z útočníků.
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_56");	//Ale kdo to byl a odkud se vzal se mě zjistit nepodařilo. Byl u něj akorát podivně vypadající meč.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_57");	//Nech mě ať se na něj podívám.
			};

			if(Npc_HasItems(other,ItMw_1H_AssBlade) >= 1)
			{
				AI_UnequipWeapons(self);
				CreateInvItems(other,ItMw_1H_AssBlade_View,1);
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_28");	//Tady.
				B_GiveInvItems(other,self,ItMw_1H_AssBlade_View,1);
				AI_EquipBestMeleeWeapon(self);
				AI_ReadyMeleeWeapon(self);
				AI_PlayAni(self,"T_1HSINSPECT");
				AI_RemoveWeapon(self);
				AI_UnequipWeapons(self);
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_29");	//Ano to je velmi starý meč. Nikdy jsem neviděl podobnou zbraň.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_30");	//Vezmi si ho zpět a zkus o něm něco zjistit.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_31");	//Zjisti - komu by mohl takový meč patřit.
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_32");	//To nebude snadné. Nemáš nějakou radu, jak na to?
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_33");	//Zkus se poptat u zdejších kovářů. Kdo, když ne oni by mohl něco vědět o zbraních.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_34");	//Možná budeš mít štěstí a něko z nich ti k tomu meči něco poví.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_35");	//Další novinky nemáš?
				BladePrioratSeek = TRUE;
				B_LogEntry(TOPIC_PrioratStart,"Řekl jsem Baalu Namibovi o útoku na tábor sběračů trávy a ukázal jsem mu meč, ktrý měl jeden z útočníků. Guru mě požádal abych o tom meči zjistil co nejvíce, měl bych začít u zdejších kovářů.");
			}
			else
			{
				AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_36");	//Bohužel nemám ho sebou.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_37");	//Tak ho přines, ať se na něj můžu podívat.
				AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_39");	//Nějaké další novinky?
				B_LogEntry(TOPIC_PrioratStart,"Řekl jsem Baalu Namibovi o útoku na tábor sběračů trávy a ukázal jsem mu meč, ktrý měl jeden z útočníků. Guru mě požádal abych o tom meči zjistil co nejvíce, měl bych začít u zdejších kovářů.");
				MissAssBlade = TRUE;
			};

			PsiCamp_03_Done = TRUE;
		}
		else
		{
			if(ExpAll > 0)
			{
				B_GivePlayerXP(ExpAll);
			};

			AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_40");	//Co jsi zjistil?
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_41");	//Podle Hanise, jeden z útočníků hodně krvácel.
			AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_42");	//Ale zatím jsem ho nenašel.
			AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_43");	//Musíš ho vystopovat, abychom zjistili co jsou zač.
			MissKillerHanis = TRUE;
			AI_StopProcessInfos(self);
		};
	};

	if(ExpAll > 0)
	{
		B_GivePlayerXP(ExpAll);
	};

	if((PsiCamp_01_Done == TRUE) && (PsiCamp_02_Done == TRUE) && (PsiCamp_03_Done == TRUE) && (PsiCamp_04_Done == TRUE) && (BladePrioratSeek == TRUE))
	{
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_45");	//Myslím, že to jsou všechny novinky, které jsem zatím zjistil o chybějících novicích.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_46");	//Dobrá práce! Teď se musíme rozhodnout co dál.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_47");	//A jak tak nad tím přemýšlím, zjisti co můžeš o tom meči.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_48");	//Možná je to jediná stopa, která nás může dovést k pravdě.
		BladePrioratSeekInProgress = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_BaalNamib_PrioratNews_01_50");	//A to je všechno.
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_01_51");	//Dobře, není toho zrovna moc! Zkus získat ještě nějaké informace.
	};
};


instance DIA_BAALNAMIB_PrioratNews_Blade(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_PrioratNews_Blade_condition;
	information = dia_baalnamib_PrioratNews_Blade_info;
	permanent = FALSE;
	description = "Mám u sebe tenhle meč.";
};


func int dia_baalnamib_PrioratNews_Blade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == FALSE) && (MissAssBlade == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalnamib_PrioratNews_Blade_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalNamib_PrioratNews_Blade_01_01");	//Mám u sebe tenhle meč.
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_02");	//Dobře... (se zájmem) Ukaž, podívám se na něj.
	AI_Output(other,self,"DIA_BaalNamib_PrioratNews_Blade_01_03");	//Tady je.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_04");	//Ano, je to velmi starý meč... (zvědavě) Nikdy jsem neviděl podobný meč.
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_05");	//Vezmi si ho zpět a zkus o něm něco zjistit.
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_EquipBestMeleeWeapon(self);
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_06");	//Zjisti - komu by mohl takový meč patřit.
	AI_Output(other,self,"DIA_BaalNamib_PrioratNews_Blade_01_07");	//To nebude snadné. Nemáš nějakou radu, jak na to?
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_08");	//Zkus se poptat u zdejších kovářů. Kdo, když ne oni by mohl něco vědět o zbraních.
	AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_09");	//Možná budeš mít štěstí a něko z nich ti k tomu meči něco poví.
	BladePrioratSeek = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Řekl jsem Baalu Namibovi o útoku na tábor sběračů trávy a ukázal jsem mu meč, ktrý měl jeden z útočníků. Guru mě požádal abych o tom meči zjistil co nejvíce, měl bych začít u zdejších kovářů.");


	if((PsiCamp_01_Done == TRUE) && (PsiCamp_02_Done == TRUE) && (PsiCamp_03_Done == TRUE) && (PsiCamp_04_Done == TRUE) && (BladePrioratSeek == TRUE))
	{
		AI_Output(self,other,"DIA_BaalNamib_PrioratNews_Blade_01_10");	//Možná je to jediná stopa, která nás může přiblížit k pravdě.
		BladePrioratSeekInProgress = TRUE;
	};
};

instance DIA_BAALNAMIB_ShadowKnown(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_ShadowKnown_condition;
	information = dia_baalnamib_ShadowKnown_info;
	permanent = FALSE;
	description = "Potřebuju zjistit, kdo zaůtočil na tábor sběračů trávy.";
};


func int dia_baalnamib_ShadowKnown_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssBlaseHistory == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_ShadowKnown_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_01");	//Potřebuju zjistit, kdo zaůtočil na tábor sběračů trávy.
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_02");	//Opravdu?!
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_03");	//Byli to členové prastarého řádu zabijáků, kteří si říkají stínové Masyafu!
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_04");	//Hmm... (zamyšleně) Myslím, že vím o kom mluvíš. 
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_05");	//Ale pokud je mi známo, jejich bratrstvo se vždy staralo jen o svoji domovinu - Varant.
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_06");	//Máš pravdu tak to taky do nedávna bylo.
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_07");	//Ale meč, který jsem našel u jednoho útočníka, mluví o něčem jiném. 
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_08");	//Pokud je to tak, tak jsme všichni ve velkém nebezpečí!
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_09");	//A zejména naši bratři, kteří jsou nyní mimo náš tábor.
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_10");	//A co budeme dělat?
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_11");	//Nyní se vydej za Gor Na Tothem a vyřiď mu, že je potřeba zajistit ochranu sběračů trávy.
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_12");	//Řekni mu ať pošle několik templářů!
	AI_Output(other,self,"DIA_BaalNamib_ShadowKnown_01_13");	//Dobře a co mám dělat já?
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_14");	//V současné době pro tebe žádnou práci nemám.
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_15");	//Ale jestli chceš s něčím pomoci - vydej se ze templáři do některého z táborů.
	AI_Output(self,other,"DIA_BaalNamib_ShadowKnown_01_16");	//Myslím, že člověk navíc nebude na škodu.
	NamibSendTempler = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Řekl jsem Baalu Namibovi všechno co jsem zjistil o útočnících. Byl velmi znepokojen, že za útokem stojí bratrstvo Masyaf. Namib mě poslal za cvičitelem templářů aby se postaral o bezpečnost sběračů trávy. Mohu také pomoci templářům.");
};


instance DIA_BAALNAMIB_WhereToGo(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_WhereToGo_condition;
	information = dia_baalnamib_WhereToGo_info;
	permanent = FALSE;
	description = "Do jakého tábora sběračů bych se měl vydat?";
};


func int dia_baalnamib_WhereToGo_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibSendTempler == TRUE) && (AssInvationBegin == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_WhereToGo_info()
{
	AI_Output(other,self,"DIA_BaalNamib_WhereToGo_01_01");	//Do jakého tábora sběračů bych se měl vydat?
	AI_Output(self,other,"DIA_BaalNamib_WhereToGo_01_02");	//Myslím, že v táboře na severu v blízkosti pyramidy bude tvá pomoc nejvíce potřeba.
	AI_Output(other,self,"DIA_BaalNamib_WhereToGo_01_03");	//Proč si to myslíš.?
	AI_Output(self,other,"DIA_BaalNamib_WhereToGo_01_04");	//Bratrstvo Masyaf se těžko odváží zaútočit na tábor v blízkosti města. I pro ně je to příliš riskantní.
	AI_Output(self,other,"DIA_BaalNamib_WhereToGo_01_05");	//Koneckonců, už je odhalena jejich přítomnost na ostrově.
	B_LogEntry(TOPIC_PrioratStart,"Baal Namib mě radil jít do tábora, který se nachází v severní části Khorinisu, v blízkosti pyramidy.");
};

instance DIA_BAALNAMIB_AssStopAttack(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_AssStopAttack_condition;
	information = dia_baalnamib_AssStopAttack_info;
	permanent = FALSE;
	description = "Tábor sběračů byl napaden!";
};

func int dia_baalnamib_AssStopAttack_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssInvasionStop == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_AssStopAttack_info()
{
	AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_01");	//Tábor sběračů na severu Khorinisu byl napaden.
	AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_02");	//(vážně) Jak jsem předpokládal. Věřím že jsou za tím stínové.
	AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_03");	//Ano, rozhodně oni.

	if(TPLBalamDead == TRUE)
	{
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_04");	//A vám se podařilo odrazit útok?
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_05");	//Samozřejmě i když ne beze ztrát.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_06");	//Bohužel, s tak nebezpečným nepřítelem se to dalo čekat.
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_07");	//Jsem si jistý že templáři Gor Na Totha protivníka nepodcenili.
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_08");	//Všichni bojovali až do konce! Gor Na Toth na ně může být hrdý.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_09");	//Nepochybuji o tom... (vážně) Ale teď se vrať k tomu napadení.
	};

	AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_10");	//Podařilo se ti ještě něco zjistit o těch útočnících?

	if(Npc_HasItems(other,ItAm_MasiafKey) >= 1)
	{
		NamibAmuletResearch = TRUE;
		NamibAmuletResearchDayEnd = Wld_GetDay();

		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_11");	//U jednoho z útočníků jsem našel tento podivný amulet.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_12");	//Podej mi ho, ať se na něj podívám.
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_13");	//Tady je.
		B_GiveInvItems(other,self,ItAm_MasiafKey,1);
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_14");	//Ano... (zamyšleně) zvláštní věc. 
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_15");	//Doufám, že ti nebude vadit když si ho ponechám. 
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_16");	//Možná se mě podaří zjitit víc podrobností o tom amuletu.

		if(PlayerKnowsMasiafKey == TRUE)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_17");	//To ti mohu říci sám. Máš v rukách klíč.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_18");	//(udiveně) Jak jsi na to přišel?
			AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_19");	//Jeden člověk v Khorinisu poznal ten amulet.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_20");	//A jseš si jistej?
			AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_21");	//Věřím, že se neplete.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_22");	//Dobře... Takže už jen potřebujem zjistit co otvírá.
			AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_23");	//Bohužel to mě neřekl. Budeme to muset zjistit sami.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_24");	//Také nemám ponětí, kde bychom měli začít s hledáním.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_25");	//Musím popřemýšlet... Myslím, že mě to zabere několik dní.
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_26");	//Přijď později, probereme co dál.
			B_LogEntry(TOPIC_PrioratStart,"Baal Namib projevil zájem o amulet, který jsem našel na těle jednoho z útočníků. Byl překvapenej, když se dozvěděl, že je to klíč. Nyní musíme zjistit, co přesně se otevírá.");
		}
		else
		{
			B_GivePlayerXP(500);
			AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_28");	//Když se zastavíš za pár dní řeknu ti o tom amuletu víc.
			B_LogEntry(TOPIC_PrioratStart,"Baal Namib projevil zájem o amulet, který jsem našel na těle jednoho z útočníků. Možná nám ta věc odhalí některá tajemství Masyafu. Guru potřeboval nějaký čas aby o tom amuletu něco zjistil.");
		};
	}
	else
	{
		B_GivePlayerXP(250);
		NamibAmuletSearch = TRUE;
		AI_Output(other,self,"DIA_BaalNamib_AssStopAttack_01_30");	//Zatím nic.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_31");	//To je zlé. Potřebujeme více informací o těch útočnících.
		AI_Output(self,other,"DIA_BaalNamib_AssStopAttack_01_32");	//Dobrá zatí si dej pohov, ale jestli něco zjistíš, tak mě dej hned vědět!
	};
};

instance DIA_BAALNAMIB_MasiafAmulet(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_MasiafAmulet_condition;
	information = dia_baalnamib_MasiafAmulet_info;
	permanent = FALSE;
	description = "Něco bych pro tebe měl.";
};

func int dia_baalnamib_MasiafAmulet_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibAmuletSearch == TRUE) && (Npc_HasItems(other,ItAm_MasiafKey) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalnamib_MasiafAmulet_info()
{
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_01");	//Něco bych pro tebe měl.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_02");	//Co konkrétně?
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_03");	//Zvláštní amulet, který jsem našelu jednoho z útočníků.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_04");	//Hmm... (se zájmem) Podej mi ho, ať se podívám.
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_05");	//Tady je.
	B_GiveInvItems(other,self,ItAm_MasiafKey,1);
	Npc_RemoveInvItems(self,ItAm_MasiafKey,Npc_HasItems(self,ItAm_MasiafKey));
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_06");	//Ano... (zamyšleně) zvláštní věc. 
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_07");	//Doufám, že ti nebude vadit když si ho ponechám. 
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_08");	//Možná se mě podaří zjitit víc podrobností o tom amuletu.

	if(PlayerKnowsMasiafKey == TRUE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_09");	//To ti mohu říci sám. Máš v rukách klíč!
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_10");	//(udiveně) Jak jsi na to přišel?
		AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_11");	//Jeden člověk v Khorinisu poznal ten amulet.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_12");	//A jseš si jistej?
		AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_13");	//Věřím, že se neplete.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_14");	//Dobře... Takže už jen potřebujem zjistit co otvírá.
		AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_01_15");	//Bohužel to mě neřekl. Budeme to muset zjistit sami.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_16");	//Také nemám ponětí, kde bychom měli začít s hledáním.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_17");	//Musím popřemýšlet... Myslím, že mě to zabere několik dní.
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_18");	//Přijď později, probereme co dál.
		B_LogEntry(TOPIC_PrioratStart,"Baal Namib projevil zájem o amulet, který jsem našel na těle jednoho z útočníků. Byl překvapenej, když se dozvěděl, že je to klíč. Nyní musíme zjistit, co přesně se otevírá.");
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_01_20");	//Když se zastavíš za pár dní řeknu ti o tom amuletu víc.
		B_LogEntry(TOPIC_PrioratStart,"Baal Namib projevil zájem o amulet, který jsem našel na těle jednoho z útočníků. Možná nám ta věc odhalí některá tajemství Masyafu. Guru potřeboval nějaký čas aby o tom amuletu něco zjistil.");
	};

	NamibAmuletResearch = TRUE;
	NamibAmuletResearchDayEnd = Wld_GetDay();
};


instance DIA_BAALNAMIB_MasiafAmulet_News(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_MasiafAmulet_News_condition;
	information = dia_baalnamib_MasiafAmulet_News_info;
	permanent = FALSE;
	description = "Máš nějaké novinky?";
};

func int dia_baalnamib_MasiafAmulet_News_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (NamibAmuletResearch == TRUE) && (NamibAmuletResearchDayEnd <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_baalnamib_MasiafAmulet_News_info()
{
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_News_01_01");	//Máš nějaké novinky?
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_02");	//Dobře že ses zeptal. Něco bych měl.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_03");	//Týká se to toho symbolu co je znázorněn ve středu amuletu.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_04");	//Zatím jsme měli málo informací, jelikož všichni napadení novici se ztratili.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_05");	//Tentokrát se však jednomu z nich podařilo uniknout.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_06");	//A když se vrátil do tábora a vyprávěl svůj příběh, tak jsem se ho hned vyptal na podrobnosti.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_07");	//Je pravda, že byl v šoku a jen stěží mohl mluvit, ale nakonec se mě podařilo zjistit jak se to stalo.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_08");	//Pak jse mu ukázal amulet, dlouho na něj zíral, ale nic neřekl.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_09");	//Podle jeho výrazu mě bylo jasné, že ho zná.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_10");	//Myslím, že bys s ním měl promluvit.
	AI_Output(other,self,"DIA_BaalNamib_MasiafAmulet_News_01_11");	//Jak se jmenuje ten novic?
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_12");	//Jeho jméno je Loki. Nyní je ve městě společně s Baalem Parvezem.
	AI_Output(self,other,"DIA_BaalNamib_MasiafAmulet_News_01_13");	//Duchovní meditace a klid to je přesně to co potřebuje po takovém zážitku.
	B_LogEntry(TOPIC_PrioratStart,"Baal Namib mi řekl, že nedávno znovu zaůtočily na novice, ale jednomu z nich se podařilo útočníkům uniknout. Novic jménem Loki podle Guru něco ví o tajemném amuletu.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(SEK_8049_LOKI,"NW_CITY_LOKI");
};


instance DIA_BAALNAMIB_Assasins_Door_Found(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_Door_Found_condition;
	information = dia_baalnamib_Assasins_Door_Found_info;
	permanent = FALSE;
	description = "Potřebuju ten amulet.";
};

func int dia_baalnamib_Assasins_Door_Found_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (Assasins_Door_Found_OneTime == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_Door_Found_info()
{
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_01_00");	//Potřebuju ten amulet.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_01_01");	//Znamená to, že se ti podařilo něco zjistit?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_01_02");	//Novic Loki mě vzal na místo, kde viděl symbol na amulet.
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_01_03");	//Tam jsem objevil zvláštní kamennou desku a podstavec se stejným reliéfem jako na amuletu.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_01_04");	//(zamyšleně) Myslím, že vím o čem přemýšlíš.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_01_05");	//Dobře vem si amulet. Doufám, že se ti to podaří.
	B_GiveInvItems(self,other,ItKe_Masiaf_Open,1);
	NamibSendToMasiaf = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_BAALNAMIB_Assasins_Door_Found_Ok(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_Door_Found_Ok_condition;
	information = dia_baalnamib_Assasins_Door_Found_Ok_info;
	permanent = FALSE;
	description = "Našel jsem tajnej průchod skrytej ve skále.";
};

func int dia_baalnamib_Assasins_Door_Found_Ok_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (ReadyGoForMasiafLair == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_Door_Found_Ok_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_00");	//Našel jsem tajnej průchod skrytej ve skále.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_01");	//Zajímavé a co budeš dělat?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_02");	//Musím prohledat tu jeskyni. Zajisté se tam nacházejí odpovědi na naše otázky.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_03");	//Dobře spoléhám na tebe. Ale buď opatrnej, nevíš co tě tam může čekat.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_Door_Found_Ok_01_04");	//Tady, vem si tenhle elixír. Pomůže ti v tvém úsilí.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
};

instance DIA_BAALNAMIB_Assasins_DoneAll(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_DoneAll_condition;
	information = dia_baalnamib_Assasins_DoneAll_info;
	permanent = FALSE;
	description = "Bratrstvo je nyní v bezpečí.";
};

func int dia_baalnamib_Assasins_DoneAll_condition()
{
	if(MIS_PrioratStart == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_DoneAll_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneAll_01_00");	//Bratrstvo je nyní v bezpečí.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_01");	//Jseš si jistej?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneAll_01_02");	//Absolutně! Už není žádná hrozba.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_03");	//Dobře, věřím ti. A kdo za tím vším stál?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneAll_01_04");	//Byl to Cor Kalom! V převtělení do mocného démona.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_05");	//Cor Kalom! To mnohé objasňuje.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_06");	//Musím ti za všechny velmi poděkovat. Bez tebe bychom si neporadili!
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneAll_01_08");	//Tady, vezmi si tyto elixíry. Uvidíš budou se ti hodit.
	B_GiveInvItems(self,other,ItPo_Perm_Health,2);
};

instance DIA_BAALNAMIB_Assasins_DoneHram(C_Info)
{
	npc = gur_8036_namib;
	nr = 1;
	condition = dia_baalnamib_Assasins_DoneHram_condition;
	information = dia_baalnamib_Assasins_DoneHram_info;
	permanent = FALSE;
	description = "To ještě není všechno.";
};

func int dia_baalnamib_Assasins_DoneHram_condition()
{
	if(Npc_KnowsInfo(other,DIA_BaalNamib_Assasins_DoneAll) == TRUE)
	{
		return TRUE;
	};
};

func void dia_baalnamib_Assasins_DoneHram_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_00");	//To ještě není všechno. Vzpomýnáš, říkal jsem ti o tajném průchodu skrytém ve skále?
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneHram_01_01");	//Samo sebou. Vzpomínám si na to.
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_02");	//Na druhé straně jeskyně je menší údolí, kde se nachází chrám. To bylo sídlo Cor Kaloma a bratrstva Masyaf.
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_03");	//A tam oni drželi lidi, které unesli. A také vaše novice.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneHram_01_04");	//Co tím chceš říci?
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_05");	//Nyní je průchod zavalen kameny a mnozí z těch co byli v zajetí zůstali stále v údolí.
	AI_Output(other,self,"DIA_BaalNamib_Assasins_DoneHram_01_06");	//Bez vaší pomoci se od tamtud nedokážou dostat.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneHram_01_07");	//Rozumím ti... (vážně) Hned tam pošlu templáře aby se o ty sutiny postarali.
	AI_Output(self,other,"DIA_BaalNamib_Assasins_DoneHram_01_08");	//Pomůžeme našim bratrům, nemůžeme je ponechat jejich osudu!
};