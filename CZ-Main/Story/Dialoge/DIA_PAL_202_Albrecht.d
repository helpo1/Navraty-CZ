
instance DIA_Albrecht_EXIT(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 999;
	condition = DIA_Albrecht_EXIT_Condition;
	information = DIA_Albrecht_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Albrecht_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Albrecht_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Albrecht_Hagen(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 1;
	condition = DIA_Albrecht_Hagen_Condition;
	information = DIA_Albrecht_Hagen_Info;
	permanent = FALSE;
	description = "Potřebuji mluvit s lordem Hagenem!";
};


func int DIA_Albrecht_Hagen_Condition()
{
	if(LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_Hagen_Info()
{
	AI_Output(other,self,"DIA_Albrecht_Hagen_15_00");	//Potřebuji mluvit s lordem Hagenem!
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_01");	//Je ve velké síni, přímo tady.
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_02");	//Ale ať po něm chceš cokoliv, snaž se to neprotahovat - je to velice zaměstnaný člověk!
};


instance DIA_Albrecht_Hallo(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 2;
	condition = DIA_Albrecht_Hallo_Condition;
	information = DIA_Albrecht_Hallo_Info;
	permanent = FALSE;
	description = "Co obnáší být paladinem?";
};


func int DIA_Albrecht_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Albrecht_Hallo_Info()
{
	AI_Output(other,self,"DIA_Albrecht_Hallo_15_00");	//Co obnáší být paladinem?
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_01");	//Paladin je Innosův válečník. Žije, aby mu sloužil, a bojuje, aby mu tak prokazoval čest.
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_02");	//On nám na oplátku propůjčuje dar magie. Magii run - tu dostáváme jako uznání za naše skutky.
};


instance DIA_Albrecht_CanTeach(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 99;
	condition = DIA_Albrecht_CanTeach_Condition;
	information = DIA_Albrecht_CanTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě něčemu naučit?";
};


func int DIA_Albrecht_CanTeach_Condition()
{
	if(Albrecht_TeachMANA == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Albrecht_CanTeach_15_00");	//Můžeš mě něčemu naučit?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_01");	//Pokud se ukáže, že jsi toho hoden, odměním tě magickými runami paladinů.
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_02");	//Kromě toho tě mohu naučit, jak si zvýšit magickou sílu.
		Albrecht_TeachMANA = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Paladin Albrecht mi pomůže zvýšit magickou moc.");
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_03");	//Učím pouze paladiny.
	};
};


instance DIA_Albrecht_TEACHPalRunes(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 100;
	condition = DIA_Albrecht_TEACHPalRunes_Condition;
	information = DIA_Albrecht_TEACHPalRunes_Info;
	permanent = TRUE;
	description = "Jsem hoden dostat runu?";
};


func int DIA_Albrecht_TEACHPalRunes_Condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_TEACHPalRunes_Info()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_15_00");	//Jsem hoden dostat runu?
	if(PLAYER_TALENT_RUNES[SPL_PalLight] == FALSE)
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_01");	//Na znamení tvé hodnosti ti dávám Runu světla. Je to symbol pravdy a spravedlnosti.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_02");	//Osvětluj cestu všem, kdo jdou po stopách Innosových.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_03");	//Všechny ostatní runy si musíš vysloužit. Vrať se, až nabudeš dojmu, že jsi jich hoden.
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
		CreateInvItems(self,ItRu_PalLight,1);
		B_GiveInvItems(self,other,ItRu_PalLight,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_04");	//Kterou cestu sis zvolil?
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_05");	//Cestu uzdravování, nebo cestu boje?
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,"Volím cestu uzdravování.",DIA_Albrecht_TEACHPalRunes_Heal);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,"Volím cestu boje.",DIA_Albrecht_TEACHPalRunes_Combat);
	};
};

func void DIA_Albrecht_TEACHPalRunes_BACK()
{
	Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
};

func void B_Albrecht_YouAreNotWorthy()
{
	AI_Output(self,other,"B_Albrecht_YouAreNotWorthy_03_00");	//Ještě nejsi hoden obdržet další kouzlo této cesty.
};

func void DIA_Albrecht_TEACHPalRunes_Heal()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Heal_15_00");	//Volím cestu uzdravování.

	if((PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Léčivý dotek",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalLightHeal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE) && (MIS_AllDragonsDead == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Očisťující oheň",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalMediumHeal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalFullHeal] == FALSE) && (MIS_DarkOrden == LOG_Success))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Innosovo světlo",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalFullHeal);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy();
	};
};

func void DIA_Albrecht_TEACHPalRunes_Combat()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Combat_15_00");	//Volím cestu boje.

	if((PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Svatý šíp",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalHolyBolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE) && (MIS_AllDragonsDead == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Rozehnání temnoty",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalRepelEvil);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] == FALSE) && (MIS_DarkOrden == LOG_Success))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,Dialog_Back,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes,B_BuildLearnString("Vymítání démonů",CostForPAlSpells),DIA_Albrecht_TEACHPalRunes_PalDestroyEvil);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy();
	};
};

func int DIA_Albrecht_TEACHPalRunes_PalLightHeal()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
	CreateInvItems(self,ItRu_PalLightHeal,1);
	B_GiveInvItems(self,other,ItRu_PalLightHeal,1);
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalMediumHeal()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
	CreateInvItems(self,ItRu_PalMediumHeal,1);
	B_GiveInvItems(self,other,ItRu_PalMediumHeal,1);
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalFullHeal()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
	CreateInvItems(self,ItRu_PalFullHeal,1);
	B_GiveInvItems(self,other,ItRu_PalFullHeal,1);
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalHolyBolt()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
	CreateInvItems(self,ItRu_PalHolyBolt,1);
	B_GiveInvItems(self,other,ItRu_PalHolyBolt,1);
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalRepelEvil()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
	CreateInvItems(self,ItRu_PalRepelEvil,1);
	B_GiveInvItems(self,other,ItRu_PalRepelEvil,1);
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalDestroyEvil()
{
	if(other.lp < CostForPAlSpells)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
	CreateInvItems(self,ItRu_PalDestroyEvil,1);
	B_GiveInvItems(self,other,ItRu_PalDestroyEvil,1);
	other.lp = other.lp - CostForPAlSpells;
	RankPoints = RankPoints + CostForPAlSpells;
	return TRUE;
};

instance DIA_Albrecht_Teach(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 101;
	condition = DIA_Albrecht_Teach_Condition;
	information = DIA_Albrecht_Teach_Info;
	permanent = TRUE;
	description = "Chci zvýšit svou magickou sílu.";
};

func int DIA_Albrecht_Teach_Condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_Teach_Info()
{
	AI_Output(other,self,"DIA_Albrecht_Teach_15_00");	//Chci zvýšit svou magickou sílu.
	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Teach,Dialog_Back,DIA_Albrecht_Teach_BACK);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Albrecht_Teach_5);
};

func void DIA_Albrecht_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Albrecht_Teach_03_00");	//Pokud bys chtěl zvýšit svou magickou sílu ještě víc, budeš si už muset najít jiného učitele.
	};
	Info_ClearChoices(DIA_Albrecht_Teach);
};

func void DIA_Albrecht_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Teach,Dialog_Back,DIA_Albrecht_Teach_BACK);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Albrecht_Teach_5);
};

func void DIA_Albrecht_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Teach,Dialog_Back,DIA_Albrecht_Teach_BACK);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Albrecht_Teach_5);
};


instance DIA_Albrecht_PICKPOCKET(C_Info)
{
	npc = PAL_202_Albrecht;
	nr = 900;
	condition = DIA_Albrecht_PICKPOCKET_Condition;
	information = DIA_Albrecht_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Albrecht_PICKPOCKET_Condition()
{
	return C_Beklauen(41,160);
};

func void DIA_Albrecht_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
	Info_AddChoice(DIA_Albrecht_PICKPOCKET,Dialog_Back,DIA_Albrecht_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Albrecht_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Albrecht_PICKPOCKET_DoIt);
};

func void DIA_Albrecht_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
};

func void DIA_Albrecht_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
};

