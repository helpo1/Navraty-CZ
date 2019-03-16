
instance DIA_PAL_2020_ALBRECHT_EXIT(C_Info)
{
	npc = pal_2020_albrecht;
	nr = 999;
	condition = dia_pal_2020_albrecht_exit_condition;
	information = dia_pal_2020_albrecht_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2020_albrecht_exit_condition()
{
	return TRUE;
};

func void dia_pal_2020_albrecht_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2020_ALBRECHT_TEACHPALRUNES(C_Info)
{
	npc = pal_2020_albrecht;
	nr = 100;
	condition = dia_pal_2020_albrecht_teachpalrunes_condition;
	information = dia_pal_2020_albrecht_teachpalrunes_info;
	permanent = TRUE;
	description = "Достоин ли я принять руну?";
};


func int dia_pal_2020_albrecht_teachpalrunes_condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2020_albrecht_teachpalrunes_info()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_15_00");	//Я достоин получить руну?

	if(PLAYER_TALENT_RUNES[SPL_PalLight] == FALSE)
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_01");	//Как знак степени я передаю тебе руну света. Она является символом мудрости и справедливости.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_02");	//Освещай путь тем, кто следует пути Инноса.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_03");	//Остальные руны ты должен заслужить. Приходи, когда сочтешь, что достоин их.
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
		CreateInvItems(self,ItRu_PalLight,1);
		B_GiveInvItems(self,other,ItRu_PalLight,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_04");	//На какой путь ты встал?
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_05");	//Путь лечения или путь борьбы?
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,"Я выбираю путь лечения.",dia_pal_2020_albrecht_teachpalrunes_heal);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,"Я выбираю путь борьбы.",dia_pal_2020_albrecht_teachpalrunes_combat);
	};
};

func void dia_pal_2020_albrecht_teachpalrunes_back()
{
	Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
};

func void ba_albrecht_youarenotworthy()
{
	AI_Output(self,other,"B_Albrecht_YouAreNotWorthy_03_00");	//Ты еще не достоин получить следующее заклинание этого пути.
};

func void dia_pal_2020_albrecht_teachpalrunes_heal()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Heal_15_00");	//Я выбираю путь исцеления.
	if((PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,B_BuildLearnString("Лечить легкое ранение",CostForPAlSpells),dia_pal_2020_albrecht_teachpalrunes_pallightheal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE) && (Kapitel >= 5))
	{
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,B_BuildLearnString("Лечить среднее ранение",CostForPAlSpells),dia_pal_2020_albrecht_teachpalrunes_palmediumheal);
	}
	else
	{
		ba_albrecht_youarenotworthy();
	};
};

func void dia_pal_2020_albrecht_teachpalrunes_combat()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Combat_15_00");	//Я выбираю путь битвы.
	if((PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,B_BuildLearnString("Святая стрела",CostForPAlSpells),dia_pal_2020_albrecht_teachpalrunes_palholybolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE) && (Kapitel >= 5))
	{
		Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,Dialog_Back,dia_pal_2020_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_pal_2020_albrecht_teachpalrunes,B_BuildLearnString("Изгнать демонов",CostForPAlSpells),dia_pal_2020_albrecht_teachpalrunes_palrepelevil);
	}
	else
	{
		ba_albrecht_youarenotworthy();
	};
};

func int dia_pal_2020_albrecht_teachpalrunes_pallightheal()
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
	Info_ClearChoices(dia_pal_2020_albrecht_teachpalrunes);
	return TRUE;
};

func int dia_pal_2020_albrecht_teachpalrunes_palmediumheal()
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

func int dia_pal_2020_albrecht_teachpalrunes_palholybolt()
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

func int dia_pal_2020_albrecht_teachpalrunes_palrepelevil()
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


instance DIA_PAL_2020_ALBRECHT_TEACH(C_Info)
{
	npc = pal_2020_albrecht;
	nr = 101;
	condition = dia_pal_2020_albrecht_teach_condition;
	information = dia_pal_2020_albrecht_teach_info;
	permanent = TRUE;
	description = "Я хочу увеличить свою магическую энергию.";
};


func int dia_pal_2020_albrecht_teach_condition()
{
	if(Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2020_albrecht_teach_info()
{
	AI_Output(other,self,"DIA_Albrecht_Teach_15_00");	//Я хочу повысить свои магические способности.
	Info_ClearChoices(dia_pal_2020_albrecht_teach);
	Info_AddChoice(dia_pal_2020_albrecht_teach,Dialog_Back,dia_pal_2020_albrecht_teach_back);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_pal_2020_albrecht_teach_1);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_pal_2020_albrecht_teach_5);
};

func void dia_pal_2020_albrecht_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Albrecht_Teach_03_00");	//Если ты хочешь повысить свои магические способности еще больше, тебе придется поискать другого учителя.
	};
	Info_ClearChoices(dia_pal_2020_albrecht_teach);
};

func void dia_pal_2020_albrecht_teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_pal_2020_albrecht_teach);
	Info_AddChoice(dia_pal_2020_albrecht_teach,Dialog_Back,dia_pal_2020_albrecht_teach_back);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_pal_2020_albrecht_teach_1);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_pal_2020_albrecht_teach_5);
};

func void dia_pal_2020_albrecht_teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_pal_2020_albrecht_teach);
	Info_AddChoice(dia_pal_2020_albrecht_teach,Dialog_Back,dia_pal_2020_albrecht_teach_back);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_pal_2020_albrecht_teach_1);
	Info_AddChoice(dia_pal_2020_albrecht_teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_pal_2020_albrecht_teach_5);
};

