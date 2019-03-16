/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func int B_CheckAlchemySkill - upraveny výpisy

*/



var int CountAlchemyOverallBonus;
var int CountAlchemyOverallBonusDay;
var int OverallBonusAlchemy;

func void B_RaisekAlchemySkillNoInt(var int grade)
{
	if(grade == 1)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(96) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(48) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 60)
		{
			if(Hlp_Random(24) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 45)
		{
			if(Hlp_Random(12) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 30)
		{
			if(Hlp_Random(6) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 15)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;
		};
	}
	else if(grade == 2)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(48) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(24) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 60)
		{
			if(Hlp_Random(12) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 45)
		{
			if(Hlp_Random(6) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 30)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;
		};
	}
	else if(grade == 3)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(24) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(12) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 60)
		{
			if(Hlp_Random(6) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 45)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;
		};
	}
	else if(grade == 4)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(4) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 60)
		{
			if(Hlp_Random(2) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;				
		};
	}
	else if(grade == 5)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(2) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;
		};
	};
	if(TalentCount_Alchemy[0] > 100)
	{
		TalentCount_Alchemy[0] = 100;
	};

	B_GivePlayerXP(grade * 10);
};

func void B_RaisekAlchemySkill(var int grade)
{
	var int daynow;

	daynow = Wld_GetDay();

	if(grade == 1)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(96) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(48) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 60)
		{
			if(Hlp_Random(24) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 45)
		{
			if(Hlp_Random(12) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 30)
		{
			if(Hlp_Random(6) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 15)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;
		};
	}
	else if(grade == 2)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(48) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(24) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 60)
		{
			if(Hlp_Random(12) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 45)
		{
			if(Hlp_Random(6) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 30)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;
		};
	}
	else if(grade == 3)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(24) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(12) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 60)
		{
			if(Hlp_Random(6) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 45)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;
		};
	}
	else if(grade == 4)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(4) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 60)
		{
			if(Hlp_Random(2) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;				
		};
	}
	else if(grade == 5)
	{
		if(TalentCount_Alchemy[0] >= 90)
		{
			if(Hlp_Random(3) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else if(TalentCount_Alchemy[0] >= 75)
		{
			if(Hlp_Random(2) == 1)
			{
				TalentCount_Alchemy[0] += 1;
			};
		}
		else
		{
			TalentCount_Alchemy[0] += 1;
		};
	};
	if(TalentCount_Alchemy[0] > 100)
	{
		TalentCount_Alchemy[0] = 100;
	};

	B_GivePlayerXP(grade * 10);

	if(OverallBonusAlchemy < (10 * Kapitel))
	{
		CountAlchemyOverallBonus += 1;
	
		if(CountAlchemyOverallBonus >= 15)
		{
			if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
			{
				ATR_INTELLECT = ATR_INTELLECT + 1;
				Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
			};

			CountAlchemyOverallBonus = FALSE;
			OverallBonusAlchemy += 1;
		};
	};
};

func int B_CheckAlchemySkill(var int skill)
{
	var string concatText;

	if(TalentCount_Alchemy[0] >= Skill)
	{
		return TRUE;
	}
	else
	{
		concatText = ConcatStrings("Vyžaduje dovednost alchymie na úrovni ",IntToString(Skill));
		concatText = ConcatStrings(concatText," bodů");
		AI_PrintClr(concatText,177,58,17);
		B_Say(self,self,"$NOLEARNNOPOINTS");
		return FALSE;
	};

	return FALSE;
};

func void potionalchemy_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PotionAlchemy;
		CreateInvItems(hero,ItMi_Flask,1);
		AI_ProcessInfos(her);
	};
};

var int potionstartok;

instance PC_PotionAlchemy_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PotionAlchemy_End_Condition;
	information = PC_PotionAlchemy_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_PotionAlchemy_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void PC_PotionAlchemy_End_Info()
{
	b_endproductiondialog();
};

func void PC_Mana_Start_back()
{
	Info_ClearChoices(PC_Mana_Start);
};

instance PC_Mana_Start(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Mana_Start_Condition;
	information = PC_Mana_Start_Info;
	permanent = TRUE;
	description = "Připravit lektvary many";
};

func int PC_Mana_Start_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Mana_Start()
{
	Info_ClearChoices(PC_Mana_Start);
	Info_AddChoice(PC_Mana_Start,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPo_Mana_01) >= 3) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1))
	{
		Info_AddChoice(PC_Mana_Start,"Elixír čisté many",PC_ItPo_Mana_04);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1))
	{
		Info_AddChoice(PC_Mana_Start,"Elixír many",PC_ItPo_Mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Mana_Herb_02) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1))
	{
		Info_AddChoice(PC_Mana_Start,"Extrakt many",PC_ItPo_Mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Mana_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1))
	{
		Info_AddChoice(PC_Mana_Start,"Esence many",PC_ItPo_Mana_01);
	};

	Info_AddChoice(PC_Mana_Start,DIALOG_BACK,PC_Mana_Start_Back_Info);
};

func void PC_Mana_Start_Info()
{
	B_Mana_Start();
};

func void PC_Mana_Start_Back_Info()
{
	Info_ClearChoices(PC_Mana_Start);
};

func void PC_ItPo_Mana_01()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItPl_Mana_Herb_01,1);
	Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
	Npc_RemoveInvItems(hero,ItMi_Flask,1);
	Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
	CreateInvItems(hero,ItPo_Mana_01,1);
	//Print(PRINT_AlchemySuccess);
	AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Snd_Play("POTION_DONE");
	POTIONSTARTOK = 1;
	B_RaisekAlchemySkill(1);
	B_Mana_Start();
};

func void PC_ItPo_Mana_02()
{
	if(B_CheckAlchemySkill(10))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_02,1);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Mana_02,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(2);
		B_Mana_Start();
	}
	else
	{
		B_Mana_Start();
	};
};

func void PC_ItPo_Mana_03()
{
	if(B_CheckAlchemySkill(20))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Mana_03,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(3);
		B_Mana_Start();
	}
	else
	{
		B_Mana_Start();
	};
};

func void PC_ItPo_Mana_04()
{
	if(B_CheckAlchemySkill(50))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Mana_01,3);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Mana_Addon_04,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_Mana_Start();
	}
	else
	{
		B_Mana_Start();
	};
};

func void PC_Health_Start_back()
{
	Info_ClearChoices(PC_Health_Start);
};

instance PC_Health_Start(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Health_Start_Condition;
	information = PC_Health_Start_Info;
	permanent = TRUE;
	description = "Připravit lektvary hojivé síly";
};

func int PC_Health_Start_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Health_Start()
{
	Info_ClearChoices(PC_Health_Start);
	Info_AddChoice(PC_Health_Start,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if((KNOWFULLHEALTH2 == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItAt_Sting) >= 5) && (Npc_HasItems(hero,ItPl_Health_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1))
	{
		Info_AddChoice(PC_Health_Start,"Elixír hojivé síly ze žihadel",pc_itpo_health_04_new);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_04] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPo_Health_01) >= 3) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1))
	{
		Info_AddChoice(PC_Health_Start,"Elixír čisté hojivé síly",PC_ItPo_Health_04);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1))
	{
		Info_AddChoice(PC_Health_Start,"Elixír hojivé síly",PC_ItPo_Health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1))
	{
		Info_AddChoice(PC_Health_Start,"Extrakt hojivé síly",PC_ItPo_Health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Health_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1))
	{
		Info_AddChoice(PC_Health_Start,"Esence hojivé síly",PC_ItPo_Health_01);
	};

	Info_AddChoice(PC_Health_Start,DIALOG_BACK,PC_Health_Start_Back_Info);
};

func void PC_Health_Start_Info()
{
	B_Health_Start();
};

func void PC_Health_Start_Back_Info()
{
	Info_ClearChoices(PC_Health_Start);
};

func void PC_ItPo_Health_01()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,1);
	Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
	Npc_RemoveInvItems(hero,ItMi_Flask,1);
	Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
	CreateInvItem(hero,ItPo_Health_01);
	//Print(PRINT_AlchemySuccess);
	AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Snd_Play("POTION_DONE");
	POTIONSTARTOK = 1;
	B_RaisekAlchemySkill(1);
	B_Health_Start();
};

func void PC_ItPo_Health_02()
{
	if(B_CheckAlchemySkill(10))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,1);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Health_02,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(2);
		B_Health_Start();
	}
	else
	{
		B_Health_Start();
	};
};

func void PC_ItPo_Health_03()
{
	if(B_CheckAlchemySkill(20))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Health_03,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(3);
		B_Health_Start();
	}
	else
	{
		B_Health_Start();
	};
};

func void PC_ItPo_Health_04()
{
	if(B_CheckAlchemySkill(50))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Health_01,3);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Health_Addon_04,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_Health_Start();
	}
	else
	{
		B_Health_Start();
	};
};

func void pc_itpo_health_04_New()
{
	if(B_CheckAlchemySkill(25))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItAt_Sting,5);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Health_Addon_04_New,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(3);
		B_Health_Start();
	}
	else
	{
		B_Health_Start();
	};
};

func void PC_Special_StaminaSpeed_back()
{
	Info_ClearChoices(PC_Special_StaminaSpeed);
};

instance PC_Special_StaminaSpeed(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_Special_StaminaSpeed_Condition;
	information = PC_Special_StaminaSpeed_Info;
	permanent = TRUE;
	description = "Připravit lektvary výdrže a rychlosti";
};

func int PC_Special_StaminaSpeed_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Special_StaminaSpeed()
{
	Info_ClearChoices(PC_Special_StaminaSpeed);
	Info_AddChoice(PC_Special_StaminaSpeed,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if((KNOWSPEED3 == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItAt_BlackSnapperLiver) >= 1) && (Npc_HasItems(hero,ItFo_Addon_Grog) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_StaminaSpeed,"'Černý chňapavec'",pc_itpo_speed_03);
	};
	if((PLAYER_TALENT_ALCHEMY[15] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(hero,ItPo_Speed) >= 1))
	{
		Info_AddChoice(PC_Special_StaminaSpeed,"Dvojitý lektvar rychlosti",pc_itpo_speed_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_StaminaSpeed,"Lektvar rychlosti",PC_ItPo_Speed);
	};
	if((PLAYER_TALENT_ALCHEMY[17] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Blueplant) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_StaminaSpeed,"Lektvar výdrže",pc_itpo_stamina);
	};

	Info_AddChoice(PC_Special_StaminaSpeed,DIALOG_BACK,PC_Special_StaminaSpeed_Back_Info);
};

func void PC_Special_StaminaSpeed_Info()
{
	B_Special_StaminaSpeed();
};

func void PC_Special_StaminaSpeed_Back_Info()
{
	Info_ClearChoices(PC_Special_StaminaSpeed);
};

func void pc_itpo_stamina()
{
	if(B_CheckAlchemySkill(5))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Blueplant,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,itpo_stamina,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(2);
		B_Special_StaminaSpeed();
	}
	else
	{
		B_Special_StaminaSpeed();
	};
};

func void PC_ItPo_Speed()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItPl_Speed_Herb_01,1);
	Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
	Npc_RemoveInvItems(hero,ItMi_Flask,1);
	Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
	CreateInvItems(hero,ItPo_Speed,1);
	//Print(PRINT_AlchemySuccess);
	AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Snd_Play("POTION_DONE");
	POTIONSTARTOK = 1;
	B_RaisekAlchemySkill(1);
	B_Special_StaminaSpeed();
};

func void pc_itpo_speed_02()
{
	if(B_CheckAlchemySkill(20))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPo_Speed,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,itpo_speed_02,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(2);
		B_Special_StaminaSpeed();
	}
	else
	{
		B_Special_StaminaSpeed();
	};
};

func void pc_itpo_speed_03()
{
	if(B_CheckAlchemySkill(50))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItAt_BlackSnapperLiver,1);
		Npc_RemoveInvItems(hero,ItFo_Addon_Grog,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,itpo_speed_03,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(3);
		B_Special_StaminaSpeed();
	}
	else
	{
		B_Special_StaminaSpeed();
	};
};

func void PC_Special_Start_back()
{
	Info_ClearChoices(PC_Special_Start);
};

instance PC_Special_Start(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_Special_Start_Condition;
	information = PC_Special_Start_Info;
	permanent = TRUE;
	description = "Připravit permanentní lektvary";
};

func int PC_Special_Start_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Special_Start()
{
	Info_ClearChoices(PC_Special_Start);
	Info_AddChoice(PC_Special_Start,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if((KNOWPERMINT == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItAt_Addon_BCKopf) >= 10) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_Start,"Elixír rozumu",pc_itpo_intellect);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_Start,"Elixír ducha",PC_ItPo_Perm_Mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 3) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_Start,"Elixír života",PC_ItPo_Perm_Health);
	};
	if((PLAYER_TALENT_ALCHEMY[18] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,itpl_super_herb) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_Start,"Elixír výdrže",pc_itpo_perm_stamina);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Dex_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_Start,"Elixír obratnosti",PC_ItPo_Dex);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Strength_Herb_01) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_Start,"Elixír síly",PC_ItPo_Strg);
	};

	Info_AddChoice(PC_Special_Start,DIALOG_BACK,PC_Special_Start_Back_Info);
};

func void PC_Special_Start_Info()
{
	B_Special_Start();
};

func void PC_Special_Start_Back_Info()
{
	Info_ClearChoices(PC_Special_Start);
};

func void pc_itpo_perm_stamina()
{
	if(B_CheckAlchemySkill(30))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,itpl_super_herb,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,itpo_perm_stamina,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Start();
	}
	else
	{
		B_Special_Start();
	};
};

func void PC_ItPo_Perm_Health()
{
	if(B_CheckAlchemySkill(40))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,3);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Perm_Health,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Start();
	}
	else
	{
		B_Special_Start();
	};
};

func void PC_ItPo_Perm_Mana()
{
	if(B_CheckAlchemySkill(50))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Perm_Mana,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Start();
	}
	else
	{
		B_Special_Start();
	};
};

func void pc_itpo_intellect()
{
	if(B_CheckAlchemySkill(75))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItAt_Addon_BCKopf,10);
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,itpo_intellect,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Start();
	}
	else
	{
		B_Special_Start();
	};
};

func void PC_ItPo_Dex()
{
	if(B_CheckAlchemySkill(50))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Dex_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Perm_DEX,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Start();
	}
	else
	{
		B_Special_Start();
	};
};

func void PC_ItPo_Strg()
{
	if(B_CheckAlchemySkill(50))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Strength_Herb_01,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,ItPo_Perm_STR,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Start();
	}
	else
	{
		B_Special_Start();
	};
};

func void PC_Special_DefenceStart_back()
{
	Info_ClearChoices(PC_Special_DefenceStart);
};

instance PC_Special_DefenceStart(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_Special_DefenceStart_Condition;
	information = PC_Special_DefenceStart_Info;
	permanent = TRUE;
	description = "Připravit lektvary magické ochrany";
};

func int PC_Special_DefenceStart_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_DefenceStart()
{
	Info_ClearChoices(PC_Special_DefenceStart);
	Info_AddChoice(PC_Special_DefenceStart,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if((KNOWPROTFALL == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItAt_Wing) >= 15) && (Npc_HasItems(hero,ItPl_Weed) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_DefenceStart,"Elixír odolnosti proti pádu",pc_itpo_falldefence);
	};
	if((KNOWFIREDEF == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 5) && (Npc_HasItems(hero,ItPl_Mana_Herb_02) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_DefenceStart,"Elixír ochrany proti ohni",pc_itpo_firedefence);
	};
	if((KNOWMAGDEF == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItFo_Alcohol) >= 1) && (Npc_HasItems(hero,ItPl_Mushroom_02) >= 25) && (Npc_HasItems(hero,ItFo_Booze) >= 1) && (Npc_HasItems(hero,ItPl_Temp_Herb) >= 1))
	{
		Info_AddChoice(PC_Special_DefenceStart,"Elixír ochrany proti magii",pc_itpo_magdefence);
	};

	Info_AddChoice(PC_Special_DefenceStart,DIALOG_BACK,PC_Special_DefenceStart_Back_Info);
};

func void PC_Special_DefenceStart_Info()
{
	B_DefenceStart();
};

func void PC_Special_DefenceStart_Back_Info()
{
	Info_ClearChoices(PC_Special_DefenceStart);
};

func void pc_itpo_magdefence()
{
	if(B_CheckAlchemySkill(60))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPl_Mushroom_02,25);
		Npc_RemoveInvItems(hero,ItFo_Booze,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,itpo_magdefence,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_DefenceStart();
	}
	else
	{
		B_DefenceStart();
	};
};


func void pc_itpo_firedefence()
{
	if(B_CheckAlchemySkill(60))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,5);
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_02,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,itpo_firedefence,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_DefenceStart();
	}
	else
	{
		B_DefenceStart();
	};
};

func void pc_itpo_falldefence()
{
	if(B_CheckAlchemySkill(50))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItAt_Wing,15);
		Npc_RemoveInvItems(hero,ItPl_Weed,1);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
		CreateInvItems(hero,itpo_falldefence,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_DefenceStart();
	}
	else
	{
		B_DefenceStart();
	};
};


func void PC_Special_Mutagen_back()
{
	Info_ClearChoices(PC_Special_Mutagen);
};

instance PC_Special_Mutagen(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_Special_Mutagen_Condition;
	information = PC_Special_Mutagen_Info;
	permanent = TRUE;
	description = "Připravit mutagenní lektvary";
};

func int PC_Special_Mutagen_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Special_Mutagen()
{
	Info_ClearChoices(PC_Special_Mutagen);
	Info_AddChoice(PC_Special_Mutagen,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if((Npc_HasItems(hero,ItPo_Perm_STR) >= 1) && ((Npc_HasItems(hero,ItMi_Mutagen_Str_Low) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_Str_Normal) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_Str_Strong) >= 1)))
	{
		Info_AddChoice(PC_Special_Mutagen,"Použít elixír síly",PC_Special_Mutagen_Str);
	};
	if((Npc_HasItems(hero,ItPo_Perm_DEX) >= 1) && ((Npc_HasItems(hero,ItMi_Mutagen_Dex_Low) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_Dex_Normal) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_Dex_Strong) >= 1)))
	{
		Info_AddChoice(PC_Special_Mutagen,"Použít elixír obratnosti",PC_Special_Mutagen_Dex);
	};
	if((Npc_HasItems(hero,ItPo_Perm_Health) >= 1) && ((Npc_HasItems(hero,ItMi_Mutagen_HP_Low) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_HP_Normal) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_HP_Strong) >= 1)))
	{
		Info_AddChoice(PC_Special_Mutagen,"Použít elixír života",PC_Special_Mutagen_HP);
	};
	if((Npc_HasItems(hero,ItPo_Perm_Mana) >= 1) && ((Npc_HasItems(hero,ItMi_Mutagen_Mana_Low) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_Mana_Normal) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_Mana_Strong) >= 1)))
	{
		Info_AddChoice(PC_Special_Mutagen,"Použít elixír ducha",PC_Special_Mutagen_Mana);
	};
	if((Npc_HasItems(hero,ItPo_Perm_Stamina) >= 1) && ((Npc_HasItems(hero,ItMi_Mutagen_Stamina_Low) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_Stamina_Normal) >= 1) || (Npc_HasItems(hero,ItMi_Mutagen_Stamina_Strong) >= 1)))
	{
		Info_AddChoice(PC_Special_Mutagen,"Použít elixír výdrže",PC_Special_Mutagen_Stamina);
	};

	Info_AddChoice(PC_Special_Mutagen,DIALOG_BACK,PC_Special_Mutagen_Back_Info);
};

func void PC_Special_Mutagen_Info()
{
	if((Npc_HasItems(hero,ItPo_Perm_STR) == FALSE) && (Npc_HasItems(hero,ItPo_Perm_Dex) == FALSE) && (Npc_HasItems(hero,ItPo_Perm_Health) == FALSE) && (Npc_HasItems(hero,ItPo_Perm_Mana) == FALSE) && (Npc_HasItems(hero,ItPo_Perm_Stamina) == FALSE))
	{
		AI_PrintClr("Nemáš vhodný magický lektvar...",177,58,17);
	}
	else if((Npc_HasItems(hero,ItMi_Mutagen_Str_Low) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Str_Normal) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Str_Strong) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Dex_Low) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Dex_Normal) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Dex_Strong) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_HP_Low) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_HP_Normal) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_HP_Strong) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Mana_Low) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Mana_Normal) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Mana_Strong) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Stamina_Low) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Stamina_Normal) == FALSE) && (Npc_HasItems(hero,ItMi_Mutagen_Stamina_Strong) == FALSE))
	{
		AI_PrintClr("Nemáš žádný mutagen...",177,58,17);
	};

	B_Special_Mutagen();
};

func void PC_Special_Mutagen_Back_Info()
{
	Info_ClearChoices(PC_Special_Mutagen);
};

func void PC_Special_Mutagen_Str()
{
	Info_ClearChoices(PC_Special_Mutagen);
	Info_AddChoice(PC_Special_Mutagen,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if(Npc_HasItems(hero,ItMi_Mutagen_Str_Low) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat malý mutagen síly",PC_Special_Mutagen_Str_Low);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_Str_Normal) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat mutagen síly",PC_Special_Mutagen_Str_Normal);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_Str_Strong) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat velký mutagen síly",PC_Special_Mutagen_Str_Strong);
	};

	Info_AddChoice(PC_Special_Mutagen,DIALOG_BACK,PC_Special_Mutagen_Back_Info);
};

func void PC_Special_Mutagen_Dex()
{
	Info_ClearChoices(PC_Special_Mutagen);
	Info_AddChoice(PC_Special_Mutagen,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if(Npc_HasItems(hero,ItMi_Mutagen_Dex_Low) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat malý mutagen obratnosti",PC_Special_Mutagen_Dex_Low);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_Dex_Normal) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat mutagen obratnosti",PC_Special_Mutagen_Dex_Normal);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_Dex_Strong) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat velký mutagen obratnosti",PC_Special_Mutagen_Dex_Strong);
	};

	Info_AddChoice(PC_Special_Mutagen,DIALOG_BACK,PC_Special_Mutagen_Back_Info);
};

func void PC_Special_Mutagen_HP()
{
	Info_ClearChoices(PC_Special_Mutagen);
	Info_AddChoice(PC_Special_Mutagen,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if(Npc_HasItems(hero,ItMi_Mutagen_HP_Low) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat malý mutagen života",PC_Special_Mutagen_HP_Low);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_HP_Normal) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat mutagen života",PC_Special_Mutagen_HP_Normal);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_HP_Strong) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat velký mutagen života",PC_Special_Mutagen_HP_Strong);
	};

	Info_AddChoice(PC_Special_Mutagen,DIALOG_BACK,PC_Special_Mutagen_Back_Info);
};

func void PC_Special_Mutagen_Mana()
{
	Info_ClearChoices(PC_Special_Mutagen);
	Info_AddChoice(PC_Special_Mutagen,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if(Npc_HasItems(hero,ItMi_Mutagen_Mana_Low) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat malý mutagen ducha",PC_Special_Mutagen_Mana_Low);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_Mana_Normal) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat mutagen ducha",PC_Special_Mutagen_Mana_Normal);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_Mana_Strong) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat velký mutagen ducha",PC_Special_Mutagen_Mana_Strong);
	};

	Info_AddChoice(PC_Special_Mutagen,DIALOG_BACK,PC_Special_Mutagen_Back_Info);
};

func void PC_Special_Mutagen_Stamina()
{
	Info_ClearChoices(PC_Special_Mutagen);
	Info_AddChoice(PC_Special_Mutagen,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if(Npc_HasItems(hero,ItMi_Mutagen_Stamina_Low) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat malý mutagen výdrže",PC_Special_Mutagen_Stamina_Low);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_Stamina_Normal) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat mutagen výdrže",PC_Special_Mutagen_Stamina_Normal);
	};
	if(Npc_HasItems(hero,ItMi_Mutagen_Stamina_Strong) >= 1)
	{
		Info_AddChoice(PC_Special_Mutagen,"... přidat velký mutagen výdrže",PC_Special_Mutagen_Stamina_Strong);
	};

	Info_AddChoice(PC_Special_Mutagen,DIALOG_BACK,PC_Special_Mutagen_Back_Info);
};

func void PC_Special_Mutagen_Str_Low()
{
	if(B_CheckAlchemySkill(30))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_STR,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Str_Low,1);
		CreateInvItems(hero,ItPo_Perm_STR_M_Low,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(3);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Str_Normal()
{
	if(B_CheckAlchemySkill(60))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_STR,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Str_Normal,1);
		CreateInvItems(hero,ItPo_Perm_STR_M_Normal,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Str_Strong()
{
	if(B_CheckAlchemySkill(90))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_STR,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Str_Strong,1);
		CreateInvItems(hero,ItPo_Perm_STR_M_Strong,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Dex_Low()
{
	if(B_CheckAlchemySkill(30))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Dex,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Dex_Low,1);
		CreateInvItems(hero,ItPo_Perm_Dex_M_Low,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(3);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Dex_Normal()
{
	if(B_CheckAlchemySkill(60))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Dex,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Dex_Normal,1);
		CreateInvItems(hero,ItPo_Perm_Dex_M_Normal,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Dex_Strong()
{
	if(B_CheckAlchemySkill(90))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Dex,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Dex_Strong,1);
		CreateInvItems(hero,ItPo_Perm_Dex_M_Strong,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_HP_Low()
{
	if(B_CheckAlchemySkill(30))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Health,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_HP_Low,1);
		CreateInvItems(hero,ItPo_Perm_Health_M_Low,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(3);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_HP_Normal()
{
	if(B_CheckAlchemySkill(60))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Health,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_HP_Normal,1);
		CreateInvItems(hero,ItPo_Perm_Health_M_Normal,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_HP_Strong()
{
	if(B_CheckAlchemySkill(90))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Health,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_HP_Strong,1);
		CreateInvItems(hero,ItPo_Perm_Health_M_Strong,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Mana_Low()
{
	if(B_CheckAlchemySkill(30))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Mana,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Mana_Low,1);
		CreateInvItems(hero,ItPo_Perm_Mana_M_Low,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(3);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Mana_Normal()
{
	if(B_CheckAlchemySkill(60))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Mana,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Mana_Normal,1);
		CreateInvItems(hero,ItPo_Perm_Mana_M_Normal,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Mana_Strong()
{
	if(B_CheckAlchemySkill(90))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Mana,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Mana_Strong,1);
		CreateInvItems(hero,ItPo_Perm_Mana_M_Strong,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Stamina_Low()
{
	if(B_CheckAlchemySkill(30))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Stamina,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Stamina_Low,1);
		CreateInvItems(hero,ItPo_Perm_Stamina_M_Low,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(3);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Stamina_Normal()
{
	if(B_CheckAlchemySkill(60))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Stamina,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Stamina_Normal,1);
		CreateInvItems(hero,ItPo_Perm_Stamina_M_Normal,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(4);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void PC_Special_Mutagen_Stamina_Strong()
{
	if(B_CheckAlchemySkill(90))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Perm_Stamina,1);
		Npc_RemoveInvItems(hero,ItMi_Mutagen_Stamina_Strong,1);
		CreateInvItems(hero,ItPo_Perm_Stamina_M_Strong,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Special_Mutagen();
	}
	else
	{
		B_Special_Mutagen();
	};
};

func void pc_Epic_start_back()
{
	Info_ClearChoices(PC_Epic_Start);
};

instance PC_Epic_Start(C_Info)
{
	npc = PC_Hero;
	nr = 7;
	condition = PC_Epic_Start_Condition;
	information = PC_Epic_Start_Info;
	permanent = TRUE;
	description = "Připravit speciální magické lektvary";
};

func int PC_Epic_Start_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Epic_Start()
{
	Info_ClearChoices(PC_Epic_Start);
	Info_AddChoice(PC_Epic_Start,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if((SOULRIVER == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,itat_luzianheart) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItPo_Mana_01) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1))
	{
		Info_AddChoice(PC_Epic_Start,"Extrakt duší",pc_itpo_soulriver);
	};
	if((PLAYER_TALENT_ALCHEMY[16] == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItAt_CrawlerMandibles) >= 1) && (Npc_HasItems(hero,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,itat_crawlerqueen) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItPl_Perm_Herb) >= 1) && (Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1))
	{
		Info_AddChoice(PC_Epic_Start,"Elixír Amun-Su",pc_itpo_tyonpotion);
	};
	if((Knows_MCELIXIER == TRUE) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItAt_Sting) >= 2) && (Npc_HasItems(hero,ItPo_Mana_02) >= 1) && (Npc_HasItems(hero,ItPo_Health_01) >= 1) && (Npc_HasItems(hero,ItFo_Addon_Pfeffer_01) >= 1))
	{
		Info_AddChoice(PC_Epic_Start,"Lektvar proměny mysli",PC_ItPo_Addon_Geist);
	};
	if(((Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1) || (Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1) || (Npc_HasItems(hero,itat_reddragonheart) >= 1) || (Npc_HasItems(hero,itat_blackdragonheart) >= 1) || (Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)) && (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1) && (PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] == TRUE))
	{
		Info_AddChoice(PC_Epic_Start,"Dobít 'Innosovo oko'",PC_Charge_InnosEye);
	};
	if((Npc_HasItems(hero,ItAt_DragonEgg_MIS) >= 9) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == TRUE))
	{
		Info_AddChoice(PC_Epic_Start,"Embarla Firgasto",PC_ItPo_MegaDrink);
	};
	if((Npc_HasItems(hero,itmi_prisonsoul) >= 1) && (Npc_HasItems(hero,itmi_orcblood) >= 1) && (Npc_HasItems(hero,itmi_barlokheart) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 5) && (READ_AZGOLOR == TRUE))
	{
		Info_AddChoice(PC_Epic_Start,"Probudit 'Oko hněvu'",pc_charge_prisonsoul);
	};
	if((KNOW_NIMROD_MAKE == TRUE) && (Npc_HasItems(hero,ItMi_Moleratlubric_MIS) >= 1) && (Npc_HasItems(hero,ItAt_PumaMuscle) >= 1))
	{
		Info_AddChoice(PC_Epic_Start,"Namazat šlachy krysokrtím sádlem",PC_PumaMuscle);
	};

	Info_AddChoice(PC_Epic_Start,DIALOG_BACK,PC_Epic_Start_Back_Info);
};

func void PC_Epic_Start_Info()
{
	B_Epic_Start();
};

func void PC_Epic_Start_Back_Info()
{
	Info_ClearChoices(PC_Epic_Start);
};

func void PC_Charge_InnosEye()
{
	if(Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)
	{
		Npc_RemoveInvItems(hero,ItAt_SwampdragonHeart,1);
	}
	else if(Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1)
	{
		Npc_RemoveInvItems(hero,ItAt_RockdragonHeart,1);
	}
	else if(Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1)
	{
		Npc_RemoveInvItems(hero,ItAt_FiredragonHeart,1);
	}
	else if(Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1)
	{
		Npc_RemoveInvItems(hero,ItAt_IcedragonHeart,1);
	}
	else if(Npc_HasItems(hero,itat_reddragonheart) >= 1)
	{
		Npc_RemoveInvItems(hero,itat_reddragonheart,1);
	}
	else if(Npc_HasItems(hero,itat_blackdragonheart) >= 1)
	{
		Npc_RemoveInvItems(hero,itat_blackdragonheart,1);
	};

	Npc_RemoveInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
	CreateInvItems(hero,ItMi_InnosEye_MIS,1);
	AI_PrintClr(PRINT_AlchemySuccessInnoseye,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Snd_Play("POTION_DONE");
	POTIONSTARTOK = 1;
	B_Epic_Start();
};

func void PC_ItPo_Addon_Geist()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItAt_Sting,2);
	Npc_RemoveInvItems(hero,ItPo_Mana_02,1);
	Npc_RemoveInvItems(hero,ItPo_Health_01,1);
	Npc_RemoveInvItems(hero,ItFo_Addon_Pfeffer_01,1);
	Npc_RemoveInvItems(hero,ItMi_Flask,1);

	if(Knows_Bloodfly == TRUE)
	{
		CreateInvItems(hero,ItPo_Addon_Geist_02,1);
	}
	else
	{
		CreateInvItems(hero,ItPo_Addon_Geist_01,1);
	};

	//Print(PRINT_AlchemySuccess);
	AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Snd_Play("POTION_DONE");
	POTIONSTARTOK = 1;
	B_RaisekAlchemySkill(2);
	B_Epic_Start();
};

func void pc_itpo_tyonpotion()
{
	if(B_CheckAlchemySkill(40))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItAt_CrawlerMandibles,1);
		Npc_RemoveInvItems(hero,ItAt_WaranFiretongue,1);
		Npc_RemoveInvItems(hero,ItAt_StoneGolemHeart,1);
		Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems(hero,itat_crawlerqueen,1);
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
		Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
		Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
		Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		CreateInvItems(hero,itpo_tyonpotion,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Epic_Start();
	}
	else
	{
		B_Epic_Start();
	};
};

func void pc_itpo_soulriver()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,itat_luzianheart,1);
	Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
	Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
	Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
	Npc_RemoveInvItems(hero,ItPo_Mana_01,1);
	Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
	Npc_RemoveInvItems(hero,ItMi_Flask,1);
	CreateInvItems(hero,itpo_soulriver,1);
	//Print(PRINT_AlchemySuccess);
	AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Snd_Play("POTION_DONE");
	POTIONSTARTOK = 1;
	B_RaisekAlchemySkill(3);
	B_Epic_Start();
};

func void PC_ItPo_MegaDrink()
{
	if(B_CheckAlchemySkill(75))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItAt_DragonEgg_MIS,9);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		CreateInvItems(hero,ItPo_MegaDrink,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_RaisekAlchemySkill(5);
		B_Epic_Start();
	}
	else
	{
		B_Epic_Start();
	};
};


func void pc_charge_prisonsoul()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,itmi_prisonsoul,1);
	Npc_RemoveInvItems(hero,itmi_orcblood,1);
	Npc_RemoveInvItems(hero,itmi_barlokheart,1);
	Npc_RemoveInvItems(hero,ItMi_Sulfur,5);
	CreateInvItems(hero,itmi_prisonsoul_awake,1);
	AI_PrintClr(PRINT_ALCHEMYSUCCESSPRISONSOUL,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Snd_Play("POTION_DONE");
	POTIONSTARTOK = 1;
	B_RaisekAlchemySkill(2);
	B_Epic_Start();
};

func void PC_PumaMuscle()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItMi_Moleratlubric_MIS,1);
	Npc_RemoveInvItems(hero,ItAt_PumaMuscle,1);
	CreateInvItems(hero,ItAt_PumaMuscle_Jir,1);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Snd_Play("POTION_DONE");
	CreateInvItems(self,ItMi_Flask,1);
	B_RaisekAlchemySkill(1);
	b_endproductiondialog();
	POTIONSTARTOK = 1;
	B_Epic_Start();
};

func void pc_booze_start_back()
{
	Info_ClearChoices(PC_Booze_Start);
};

instance PC_Mana_Regone(C_Info)
{
	npc = PC_Hero;
	nr = 8;
	condition = PC_Mana_Regone_Condition;
	information = PC_Mana_Regone_Info;
	permanent = TRUE;
	description = "Koncentrovat lektvary";
};

func int PC_Mana_Regone_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Regone()
{
	Info_ClearChoices(PC_Mana_Regone);
	Info_AddChoice(PC_Mana_Regone,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && ((Npc_HasItems(hero,ItPo_Mana_02) >= 2) || (Npc_HasItems(hero,ItPo_Mana_01) >= 4)))
	{
		Info_AddChoice(PC_Mana_Regone,"Koncentrovat všechny lektvary many na elixíry many",PC_Regone_ItPo_Mana_03_All);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && ((Npc_HasItems(hero,ItPo_Health_02) >= 2) || (Npc_HasItems(hero,ItPo_Health_01) >= 4)))
	{
		Info_AddChoice(PC_Mana_Regone,"Koncentrovat všechny lektvary hojivé síly na elixíry hojivé síly",PC_Regone_ItPo_Health_03_All);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (Npc_HasItems(hero,ItPo_Mana_02) >= 2))
	{
		Info_AddChoice(PC_Mana_Regone,"Koncentrovat extrakty many na elixír many",PC_Regone_ItPo_Mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE) && (Npc_HasItems(hero,ItPo_Mana_01) >= 2))
	{
		Info_AddChoice(PC_Mana_Regone,"Koncentrovat esence many na extrakt many",PC_Regone_ItPo_Mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (Npc_HasItems(hero,ItPo_Mana_01) >= 4))
	{
		Info_AddChoice(PC_Mana_Regone,"Koncentrovat esence many na elixír many",PC_Regone_ItPo_Mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (Npc_HasItems(hero,ItPo_Health_02) >= 2))
	{
		Info_AddChoice(PC_Mana_Regone,"Koncentrovat extrakty hojivé síly na elixír hojivé síly",PC_Regone_ItPo_Health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (Npc_HasItems(hero,ItPo_Health_01) >= 2))
	{
		Info_AddChoice(PC_Mana_Regone,"Koncentrovat esence hojivé síly na extrakt hojivé síly",PC_Regone_ItPo_Health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (Npc_HasItems(hero,ItPo_Health_01) >= 4))
	{
		Info_AddChoice(PC_Mana_Regone,"Koncentrovat esence hojivé síly na elixír hojivé síly",PC_Regone_ItPo_Health_01);
	};

	Info_AddChoice(PC_Mana_Regone,DIALOG_BACK,PC_Mana_Regone_Back_Info);
};

func void PC_Mana_Regone_Info()
{
	B_Regone();
};

func void PC_Mana_Regone_Back_Info()
{
	Info_ClearChoices(PC_Mana_Regone);
};

func void PC_Regone_ItPo_Mana_03_All()
{
	if(B_CheckAlchemySkill(20))
	{
		var int CountMana01;
		var int CountMana02;
		var int AllMana01;
		var int AllMana02;
		var int SummAllHealthMana;

		CountMana01 = Npc_HasItems(hero,ItPo_Mana_01);
		CountMana02 = Npc_HasItems(hero,ItPo_Mana_02);

		if(CountMana01 >= 4)
		{
			AllMana01 = CountMana01 / 4;
		};
		if(CountMana02 >= 2)
		{
			AllMana02 = CountMana02 / 2;
		};

		SummAllHealthMana = AllMana01 + AllMana02;
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Mana_01,Npc_HasItems(hero,ItPo_Mana_01));
		Npc_RemoveInvItems(hero,ItPo_Mana_02,Npc_HasItems(hero,ItPo_Mana_02));
		CreateInvItems(hero,ItPo_Mana_03,SummAllHealthMana);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_Regone();
	}
	else
	{
		B_Regone();
	};
};

func void PC_Regone_ItPo_Health_03_All()
{
	if(B_CheckAlchemySkill(20))
	{
		var int CountHealth01;
		var int CountHealth02;
		var int AllHealth01;
		var int AllHealth02;
		var int SummAllHealthMana;

		CountHealth01 = Npc_HasItems(hero,ItPo_Health_01);
		CountHealth02 = Npc_HasItems(hero,ItPo_Health_02);

		if(CountHealth01 >= 4)
		{
			AllHealth01 = CountHealth01 / 4;
		};
		if(CountHealth02 >= 2)
		{
			AllHealth02 = CountHealth02 / 2;
		};

		SummAllHealthMana = AllHealth01 + AllHealth02;
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Health_01,Npc_HasItems(hero,ItPo_Health_01));
		Npc_RemoveInvItems(hero,ItPo_Health_02,Npc_HasItems(hero,ItPo_Health_02));
		CreateInvItems(hero,ItPo_Health_03,SummAllHealthMana);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_Regone();
	}
	else
	{
		B_Regone();
	};
};

func void PC_Regone_ItPo_Mana_03()
{
	if(B_CheckAlchemySkill(20))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Mana_02,2);
		CreateInvItems(hero,ItPo_Mana_03,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_Regone();
	}
	else
	{
		B_Regone();
	};
};

func void PC_Regone_ItPo_Mana_02()
{
	if(B_CheckAlchemySkill(10))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Mana_01,2);
		CreateInvItems(hero,ItPo_Mana_02,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_Regone();
	}
	else
	{
		B_Regone();
	};
};

func void PC_Regone_ItPo_Mana_01()
{
	if(B_CheckAlchemySkill(20))
	{	
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Mana_01,4);
		CreateInvItems(hero,ItPo_Mana_03,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_Regone();
	}
	else
	{
		B_Regone();
	};
};

func void PC_Regone_ItPo_Health_03()
{
	if(B_CheckAlchemySkill(20))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Health_02,2);
		CreateInvItems(hero,ItPo_Health_03,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_Regone();
	}
	else
	{
		B_Regone();
	};
};

func void PC_Regone_ItPo_Health_02()
{
	if(B_CheckAlchemySkill(10))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Health_01,2);
		CreateInvItems(hero,ItPo_Health_02,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_Regone();
	}
	else
	{
		B_Regone();
	};
};

func void PC_Regone_ItPo_Health_01()
{
	if(B_CheckAlchemySkill(20))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItPo_Health_01,4);
		CreateInvItems(hero,ItPo_Health_03,1);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		Snd_Play("POTION_DONE");
		POTIONSTARTOK = 1;
		B_Regone();
	}
	else
	{
		B_Regone();
	};
};

instance PC_Booze_Start(C_Info)
{
	npc = PC_Hero;
	nr = 9;
	condition = PC_Booze_Start_Condition;
	information = PC_Booze_Start_Info;
	permanent = TRUE;
	description = "Připravit alkoholické nápoje";
};

func int PC_Booze_Start_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Booze_Start()
{
	Info_ClearChoices(PC_Booze_Start);
	Info_AddChoice(PC_Booze_Start,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if(READBOOKSDONE_09 == TRUE)
	{
		Info_AddChoice(PC_Booze_Start,"Připravit víno 'Zapomnění'",pc_booze_ealbalzamtwo);
	};
	if(READBOOKSDONE_08 == TRUE)
	{
		Info_AddChoice(PC_Booze_Start,"Připravit víno 'Balzám prozřetelnosti'",pc_booze_ealbalzam);
	};
	if(Knows_Schlafhammer == TRUE)
	{
		Info_AddChoice(PC_Booze_Start,"Připravit 'Dvojité Louovo kladivo'",PC_Booze_Schlaf);
	};
	if(Knows_LousHammer == TRUE)
	{
		Info_AddChoice(PC_Booze_Start,"Připravit 'Louovo kladivo'",PC_Booze_Lou);
	};
	if(Knows_SchnellerHering == TRUE)
	{
		Info_AddChoice(PC_Booze_Start,"Připravit 'Rychlý sled'",PC_Booze_SchnellerHering);
	};
	if(READBOOKSDONE_99 == TRUE)
	{
		Info_AddChoice(PC_Booze_Start,"Připravit 'Gin' (10 láhví kořalky)",PC_Booze_Start_compote_11);
	};
	if(MakePureAlcoholBooze == TRUE)
	{
		Info_AddChoice(PC_Booze_Start,"Připravit čistý alkohol (2 láhve kořalky)",PC_Booze_Start_Alcohol_Booze);
	};
	if(MakePureAlcoholGrog == TRUE)
	{
		Info_AddChoice(PC_Booze_Start,"Připravit čistý alkohol (2 láhve grogu)",PC_Booze_Start_Alcohol_Grog);
	};
	if(MakePureAlcoholRom == TRUE)
	{
		Info_AddChoice(PC_Booze_Start,"Připravit čistý alkohol (2 láhve rumu)",PC_Booze_Start_Alcohol_Rom);
		Info_AddChoice(PC_Booze_Start,"Připravit čistý alkohol (1 láhev skřetího pití)",PC_Booze_Start_Alcohol_Orc);
	};

	Info_AddChoice(PC_Booze_Start,DIALOG_BACK,PC_Booze_Start_Back_Info);
};

func void PC_Booze_Start_Info()
{
	B_Booze_Start();
};

func void PC_Booze_Start_Back_Info()
{
	Info_ClearChoices(PC_Booze_Start);
};

func void PC_Booze_Start_Alcohol_Orc()
{
	if(Npc_HasItems(hero,itfo_addon_orcrum) >= 1)
	{
		Npc_RemoveInvItems(hero,itfo_addon_orcrum,1);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		CreateInvItems(hero,ItFo_Alcohol,1);
		B_RaisekAlchemySkillNoInt(1);
		POTIONSTARTOK = 1;
	}
	else
	{
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};

	B_Booze_Start();
};

func void PC_Booze_Start_Alcohol_Booze()
{
	if(Npc_HasItems(hero,ItFo_Booze) >= 2)
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItFo_Booze,2);
		//Print(PRINT_AlchemySuccess);
		AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		CreateInvItems(hero,ItFo_Alcohol,1);
		B_RaisekAlchemySkillNoInt(1);
		POTIONSTARTOK = 1;
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};

	B_Booze_Start();
};

func void PC_Booze_Start_Alcohol_Grog()
{
	if(B_CheckAlchemySkill(10))
	{
		if(Npc_HasItems(hero,ItFo_Addon_Grog) >= 2)
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(hero,ItFo_Addon_Grog,2);
			//Print(PRINT_AlchemySuccess);
			AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			CreateInvItems(hero,ItFo_Alcohol,1);
			B_RaisekAlchemySkillNoInt(1);
			POTIONSTARTOK = 1;
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Booze_Start();
	}
	else
	{
		B_Booze_Start();
	};
};

func void PC_Booze_Start_Alcohol_Rom()
{
	if(B_CheckAlchemySkill(15))
	{
		if(Npc_HasItems(hero,ItFo_Addon_Rum) >= 2)
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(hero,ItFo_Addon_Rum,2);
			//Print(PRINT_AlchemySuccess);
			AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			CreateInvItems(hero,ItFo_Alcohol,1);
			B_RaisekAlchemySkillNoInt(1);
			POTIONSTARTOK = 1;
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Booze_Start();
	}
	else
	{
		B_Booze_Start();
	};
};

func void PC_Booze_Start_compote_11()
{
	if(B_CheckAlchemySkill(20))
	{
		if(Npc_HasItems(hero,ItFo_Booze) >= 10)
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(hero,ItFo_Booze,10);
			//Print(PRINT_AlchemySuccess);
			AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			CreateInvItems(hero,itfo_booze_ext,1);
			B_RaisekAlchemySkillNoInt(1);
			POTIONSTARTOK = 1;
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Booze_Start();
	}
	else
	{
		B_Booze_Start();
	};
};

func void PC_Booze_Lou()
{
	if(B_CheckAlchemySkill(20))
	{
		if((Npc_HasItems(self,ItPl_SwampHerb) >= 1) && (Npc_HasItems(self,ItMi_Flask) >= 1) && (Npc_HasItems(self,ItPl_Beet) >= 2) && (Npc_HasItems(self,ItAt_SharkTeeth) >= 1) && (Npc_HasItems(self,ItFo_Addon_Rum) >= 1))
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(self,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(self,ItPl_Beet,2);
			Npc_RemoveInvItems(self,ItAt_SharkTeeth,1);
			Npc_RemoveInvItems(self,ItFo_Addon_Rum,1);
			Npc_RemoveInvItems(hero,ItMi_Flask,1);
			//Print(PRINT_AlchemySuccess);
			AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			CreateInvItems(self,ItFo_Addon_LousHammer,1);
			B_RaisekAlchemySkillNoInt(2);
			POTIONSTARTOK = 1;
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Booze_Start();
	}
	else
	{
		B_Booze_Start();
	};
};

func void PC_Booze_Schlaf()
{
	if(B_CheckAlchemySkill(30))
	{
		if((Npc_HasItems(self,ItPl_SwampHerb) >= 1) && (Npc_HasItems(self,ItMi_Flask) >= 1) && (Npc_HasItems(self,ItPl_Beet) >= 2) && (Npc_HasItems(self,ItAt_SharkTeeth) >= 1) && (Npc_HasItems(self,ItFo_Addon_Rum) >= 2))
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(self,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(self,ItPl_Beet,2);
			Npc_RemoveInvItems(self,ItAt_SharkTeeth,1);
			Npc_RemoveInvItems(self,ItFo_Addon_Rum,2);
			Npc_RemoveInvItems(hero,ItMi_Flask,1);
			//Print(PRINT_AlchemySuccess);
			AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			CreateInvItems(self,ItFo_Addon_SchlafHammer,1);
			B_RaisekAlchemySkillNoInt(2);
			POTIONSTARTOK = 1;
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Booze_Start();
	}
	else
	{
		B_Booze_Start();
	};
};

func void PC_Booze_SchnellerHering()
{
	if(B_CheckAlchemySkill(30))
	{
		if((Npc_HasItems(self,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(self,ItMi_Flask) >= 1) && (Npc_HasItems(self,ItFo_Fish) >= 1) && (Npc_HasItems(self,ItFo_Addon_Rum) >= 1))
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(self,ItPl_Speed_Herb_01,1);
			Npc_RemoveInvItems(self,ItFo_Addon_Rum,1);
			Npc_RemoveInvItems(self,ItFo_Fish,1);
			Npc_RemoveInvItems(hero,ItMi_Flask,1);
			//Print(PRINT_AlchemySuccess);
			AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			CreateInvItems(self,ItFo_Addon_SchnellerHering,1);
			B_RaisekAlchemySkillNoInt(2);
			POTIONSTARTOK = 1;
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Booze_Start();
	}
	else
	{
		B_Booze_Start();
	};
};

func void pc_booze_ealbalzam()
{
	if(B_CheckAlchemySkill(40))
	{
		if((Npc_HasItems(self,itfo_wineberrys) >= 2) && (Npc_HasItems(self,ItMi_Flask) >= 1) && (Npc_HasItems(self,ItPl_SwampHerb) >= 2) && (Npc_HasItems(self,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(self,ItFo_Addon_Rum) >= 1))
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(self,itfo_wineberrys,2);
			Npc_RemoveInvItems(self,ItPl_SwampHerb,2);
			Npc_RemoveInvItems(self,ItAt_WaranFiretongue,1);
			Npc_RemoveInvItems(self,ItFo_Addon_Rum,1);
			Npc_RemoveInvItems(hero,ItMi_Flask,1);
			//Print(PRINT_AlchemySuccess);
			AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			CreateInvItems(self,itfo_ealbalzam,1);
			B_RaisekAlchemySkill(3);
			POTIONSTARTOK = 1;
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Booze_Start();
	}
	else
	{
		B_Booze_Start();
	};
};

func void pc_booze_ealbalzamtwo()
{
	if(B_CheckAlchemySkill(50))
	{
		if((Npc_HasItems(self,itfo_wineberrys) >= 4) && (Npc_HasItems(self,ItMi_Flask) >= 1) && (Npc_HasItems(self,ItAt_DemonHeart) >= 2) && (Npc_HasItems(self,ItPl_Temp_Herb) >= 3))
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(self,itfo_wineberrys,4);
			Npc_RemoveInvItems(self,ItAt_DemonHeart,2);
			Npc_RemoveInvItems(self,ItPl_Temp_Herb,3);
			Npc_RemoveInvItems(hero,ItMi_Flask,1);
			//Print(PRINT_AlchemySuccess);
			AI_PrintClr(PRINT_AlchemySuccess,83,152,48);
			CreateInvItems(self,itfo_ealbalzamtwo,1);
			//B_Say(self,self,"$ITEMREADY");
			B_RaisekAlchemySkill(3);
			POTIONSTARTOK = 1;
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Booze_Start();
	}
	else
	{
		B_Booze_Start();
	};
};

func void pc_Poison_start_back()
{
	Info_ClearChoices(pc_Poison_start);
};

instance PC_Poison_Start(C_Info)
{
	npc = PC_Hero;
	nr = 10;
	condition = PC_Poison_Start_Condition;
	information = PC_Poison_Start_Info;
	permanent = TRUE;
	description = "Připravit jedy a protijedy";
};

func int PC_Poison_Start_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Poison_Start()
{
	Info_ClearChoices(PC_Poison_Start);
	Info_AddChoice(PC_Poison_Start,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if(PoisonArrowKnow == TRUE)
	{
		Info_AddChoice(PC_Poison_Start,"Vyrobit otrávené šípy",PC_Poison_Start_PoisonArrow);
	};
	if(AnPoisonKnow == TRUE)
	{
		Info_AddChoice(PC_Poison_Start,"Připravit protijed",PC_Poison_Start_AnPoison);
	};
	if(MakePoisonKnow == TRUE)
	{
		Info_AddChoice(PC_Poison_Start,"Připravit jed",PC_Poison_Start_Poison);
	};

	Info_AddChoice(PC_Poison_Start,DIALOG_BACK,PC_Poison_Start_Back_Info);
};

func void PC_Poison_Start_Info()
{
	B_Poison_Start();
};


func void PC_Poison_Start_Back_Info()
{
	Info_ClearChoices(PC_Poison_Start);
};

func void PC_Poison_Start_AnPoison()
{
	if(B_CheckAlchemySkill(25))
	{
		if((Npc_HasItems(hero,ItFo_Water) >= 1) && (Npc_HasItems(hero,ItMi_Salt) >= 1) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 1))
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(hero,ItFo_Water,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,1);
			Npc_RemoveInvItems(hero,ItMi_Flask,1);
			Npc_RemoveInvItems(hero,ItMi_Salt,1);
			CreateInvItems(hero,ITPO_ANPOIS,1);
			POTIONSTARTOK = 1;
			B_RaisekAlchemySkill(1);
			AI_PrintClr(PRINT_Success,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Poison_Start();
	}
	else
	{
		B_Poison_Start();
	};
};

func void PC_Poison_Start_Poison()
{
	if(B_CheckAlchemySkill(50))
	{
		if((Npc_HasItems(hero,ItFo_Water) >= 1) && (Npc_HasItems(hero,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && ((Npc_HasItems(hero,ItAt_Sting) >= 1) || (Npc_HasItems(hero,ItAt_SpiderMandibles) >= 1)))
		{
			//B_GivePlayerXP(XP_HandMade_Alchemy);
			Npc_RemoveInvItems(hero,ItFo_Water,1);
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItMi_Flask,1);
		
			if(Npc_HasItems(hero,ItAt_Sting) >= 1)
			{
				Npc_RemoveInvItems(hero,ItAt_Sting,1);
			}
			else
			{
				Npc_RemoveInvItems(hero,ItAt_SpiderMandibles,1);
			};

			POTIONSTARTOK = 1;
			CreateInvItems(hero,ITPO_POISON,1);
			AI_PrintClr(PRINT_Success,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			B_RaisekAlchemySkill(3);
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Poison_Start();
	}
	else
	{
		B_Poison_Start();
	};
};

func void PC_Poison_Start_PoisonArrow()
{
	if(B_CheckAlchemySkill(10))
	{
		if((Npc_HasItems(hero,ItRw_Arrow) >= 20) && (Npc_HasItems(hero,ITPO_POISON) >= 1))
		{
			Npc_RemoveInvItems(hero,ItRw_Arrow,20);
			Npc_RemoveInvItems(hero,ITPO_POISON,1);
			CreateInvItems(hero,ItRw_PoisonArrow,20);
			AI_PrintClr(PRINT_Success,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
			B_RaisekAlchemySkill(1);
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};

		B_Poison_Start();
	}
	else
	{
		B_Poison_Start();
	};
};

var int TabakStart;

func void pc_tabak_start_back()
{
	Info_ClearChoices(PC_Tabak_Start);
};

instance PC_Tabak_Start(C_Info)
{
	npc = PC_Hero;
	nr = 11;
	condition = PC_Tabak_Start_Condition;
	information = PC_Tabak_Start_Info;
	permanent = TRUE;
	description = "Připravit tabák a ostatní";
};

func int PC_Tabak_Start_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void B_Tabak_Start()
{
	Info_ClearChoices(PC_Tabak_Start);
	Info_AddChoice(PC_Tabak_Start,DIALOG_ENDE_WORK,PC_PotionAlchemy_End_Info);

	if((Npc_HasItems(hero,ItMi_ApfelTabak) >= 1) && (AbuyinTellTabak == TRUE))
	{
		Info_AddChoice(PC_Tabak_Start,"Smíchat tabák...",PC_ItMi_Tabak);
	};
	if((MakeMuritanSweet == TRUE) && (MIS_TiamantMuritan != LOG_SUCCESS))
	{
		Info_AddChoice(PC_Tabak_Start,"Smíchat kus masa se sírou",PC_ItMi_MuritanSweet);
	};

	Info_AddChoice(PC_Tabak_Start,DIALOG_BACK,PC_Tabak_Start_Back_Info);
};

func void PC_Tabak_Start_Info()
{
	B_Tabak_Start();
};

func void PC_Tabak_Start_Back_Info()
{
	Info_ClearChoices(PC_Tabak_Start);
};

func void PC_ItMi_MuritanSweet()
{
	if((Npc_HasItems(hero,ItFoMuttonRaw) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
	{
		//B_GivePlayerXP(XP_HandMade_Alchemy);
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
		Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
		CreateInvItems(hero,ItMi_SulfurMuttonRaw,1);
		B_LogEntry(TOPIC_TiamantMuritan,"Udělal jsem návnadu! Nyní musím najít místo, kde je hodně síry.");
		AI_PrintClr(PRINT_Success,83,152,48);
		B_RaisekAlchemySkill(1);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print(PRINT_ProdItemsMissing);
		AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};

	B_Tabak_Start();
};

func void PC_ItMi_Tabak()
{
	Info_ClearChoices(PC_Tabak_Start);
	Info_AddChoice(PC_Tabak_Start,Dialog_Back,pc_tabak_start_back);

	if(Npc_HasItems(hero,ItFo_Honey) >= 1)
	{
		Info_AddChoice(PC_Tabak_Start,"... s medem",PC_ItMi_Tabak_Honey);
	};
	if(Npc_HasItems(hero,ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice(PC_Tabak_Start,"... s trávou z bažin",PC_ItMi_Tabak_Swampherb);
	};
	if(Npc_HasItems(hero,ItPl_Mushroom_01) >= 1)
	{
		Info_AddChoice(PC_Tabak_Start,"... s tmavými houbami",PC_ItMi_Tabak_Mushroom_01);
	};
};

func void PC_ItMi_Tabak_Honey()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItMi_ApfelTabak,1);
	Npc_RemoveInvItems(hero,ItFo_Honey,1);
	CreateInvItems(hero,ItMi_Honigtabak,1);
	AI_PrintClr(PRINT_TabakSuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_RaisekAlchemySkill(1);
	B_Tabak_Start();
};

func void PC_ItMi_Tabak_Swampherb()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItMi_ApfelTabak,1);
	Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
	CreateInvItems(hero,ItMi_SumpfTabak,1);
	AI_PrintClr(PRINT_TabakSuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_RaisekAlchemySkill(1);
	B_Tabak_Start();
};

func void PC_ItMi_Tabak_Mushroom_01()
{
	//B_GivePlayerXP(XP_HandMade_Alchemy);
	Npc_RemoveInvItems(hero,ItMi_ApfelTabak,1);
	Npc_RemoveInvItems(hero,ItPl_Mushroom_01,1);
	CreateInvItems(hero,ItMi_PilzTabak,1);
	AI_PrintClr(PRINT_TabakSuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_RaisekAlchemySkill(1);
	B_Tabak_Start();
};

instance PC_MIS_MyBrew(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_MIS_MyBrew_Condition;
	information = PC_MIS_MyBrew_Info;
	permanent = TRUE;
	description = "Připravit Constantinův lektvar";
};

func int PC_MIS_MyBrew_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (MIS_MyBrew == LOG_Running) && (KnowFakeRecept == FALSE))
	{
		return TRUE;
	};
};

func void PC_MIS_MyBrew_Info()
{
	var int ransfx;

	if((Npc_HasItems(self,ItMi_Flask) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1) && (Npc_HasItems(hero,ItMi_SilverRing) >= 1) && (Npc_HasItems(hero,ItFo_Water) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItPl_SwampHerb) >= 1) && (Npc_HasItems(hero,ItFo_Cheese) >= 1) && (Npc_HasItems(hero,ItPl_Mushroom_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Flask,1);
		Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
		Npc_RemoveInvItems(hero,ItMi_SilverRing,1);
		Npc_RemoveInvItems(hero,ItFo_Water,1);
		Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
		Npc_RemoveInvItems(hero,ItFo_Cheese,1);
		Npc_RemoveInvItems(hero,ItPl_Mushroom_01,1);

		ransfx = Hlp_Random(3);

		if(ransfx == 0)
		{
			B_Say(self,self,"$DONTWORK");
		}
		else if(ransfx == 1)
		{
			B_Say(self,self,"$TOOHARD");
		}
		else if(ransfx == 2)
		{
			B_Say(self,self,"$DONTKNOW");
		};

		Print("Nepovedlo se ti připravit lektvar!");

		if(FTConsPotion == FALSE)
		{
			FTConsPotion = TRUE;

			if(MIS_MyBrew == LOG_Running)
			{
				B_LogEntry(TOPIC_MyBrew,"S tím receptem není něco v pořádku! Nejspíš bych si měl o tom jít promluvit s ostatními alchymisty ve městě.");
			};
		};
	}
	else
	{
		AI_PrintClr("Nemáš potřebné ingredience!",177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};