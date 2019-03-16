func int B_GetLearnCostFutureAttribute(var C_Npc oth,var int attribut,var int FutAtrib)
{
	var int kosten;

	kosten = 0;

	if(attribut == ATR_STRENGTH)
	{
		if(FutAtrib >= 400)
		{
			if((FutAtrib >= oth.aivar[REAL_DEXTERITY]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 6;
			}
			else
			{
				kosten = 10;
			};
		}
		else if(FutAtrib >= 300)
		{
			if((FutAtrib >= oth.aivar[REAL_DEXTERITY]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 5;
			}
			else
			{
				kosten = 8;
			};
		}
		else if(FutAtrib >= 200)
		{
			if((FutAtrib >= oth.aivar[REAL_DEXTERITY]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 4;
			}
			else
			{
				kosten = 6;
			};
		}
		else if(FutAtrib >= 100)
		{
			if((FutAtrib >= oth.aivar[REAL_DEXTERITY]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(FutAtrib >= 50)
		{
			if((FutAtrib >= oth.aivar[REAL_DEXTERITY]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 2;
			}
			else
			{
				kosten = 3;
			};
		}
		else
		{
			kosten = 1;
		};
	};
	if(attribut == ATR_DEXTERITY)
	{
		if(FutAtrib >= 400)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 6;
			}
			else
			{
				kosten = 10;
			};
		}
		else if(FutAtrib >= 300)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 5;
			}
			else
			{
				kosten = 8;
			};
		}
		else if(FutAtrib >= 200)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 4;
			}
			else
			{
				kosten = 6;
			};
		}
		else if(FutAtrib >= 100)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(FutAtrib >= 50)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 2;
			}
			else
			{
				kosten = 3;
			};
		}
		else
		{
			kosten = 1;
		};
	};
	if(attribut == ATR_MANA_MAX)
	{
		if(FutAtrib >= 600)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 6;
			}
			else
			{
				kosten = 10;
			};
		}
		else if(FutAtrib >= 400)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 5;
			}
			else
			{
				kosten = 8;
			};
		}
		else if(FutAtrib >= 200)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 4;
			}
			else
			{
				kosten = 6;
			};
		}
		else if(FutAtrib >= 100)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(FutAtrib >= 50)
		{
			if((FutAtrib >= oth.aivar[REAL_STRENGTH]) && (FutAtrib >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 2;
			}
			else
			{
				kosten = 3;
			};
		}
		else
		{
			kosten = 1;
		};
	};

	return kosten;
};

func int B_TeachAttributePoints(var C_Npc slf,var C_Npc oth,var int attrib,var int points,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realAttribute;
	var int money;
	var int TEMPSSBMODE;
	var int FutAtrib;
	var int NowAtribCost;
	var int FutAtribCost;

	if(points > 1)
	{
		if(attrib == ATR_STRENGTH)
		{
			FutAtrib = oth.aivar[REAL_STRENGTH] + points;
			FutAtribCost = B_GetLearnCostFutureAttribute(oth,attrib,FutAtrib);
		}
		else if(attrib == ATR_DEXTERITY)
		{
			FutAtrib = oth.aivar[REAL_DEXTERITY] + points;
			FutAtribCost = B_GetLearnCostFutureAttribute(oth,attrib,FutAtrib);
		}
		else if(attrib == ATR_MANA_MAX)
		{
			FutAtrib = oth.aivar[REAL_MANA_MAX] + points;
			FutAtribCost = B_GetLearnCostFutureAttribute(oth,attrib,FutAtrib);
		};

		NowAtribCost = B_GetLearnCostAttribute(oth,attrib);

		if(FutAtribCost > NowAtribCost)
		{
			AI_PrintClr(PRINT_NoDoThis,177,58,17);
			return FALSE;
		};
	};

	kosten = B_GetLearnCostAttribute(oth,attrib) * points;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	if(hero.level >= 100)
	{
		money = (kosten * 200) / TEMPSSBMODE;
	}
	else if(hero.level >= 70)
	{
		money = (kosten * 175) / TEMPSSBMODE;
	}
	else if(hero.level >= 60)
	{
		money = (kosten * 150) / TEMPSSBMODE;
	}
	else if(hero.level >= 50)
	{
		money = (kosten * 125) / TEMPSSBMODE;
	}
	else if(hero.level >= 45)
	{
		money = (kosten * 100) / TEMPSSBMODE;
	}
	else if(hero.level >= 40)
	{
		money = (kosten * 90) / TEMPSSBMODE;
	}
	else if(hero.level >= 35)
	{
		money = (kosten * 80) / TEMPSSBMODE;
	}
	else if(hero.level >= 30)
	{
		money = (kosten * 70) / TEMPSSBMODE;
	}
	else if(hero.level >= 25)
	{
		money = (kosten * 60) / TEMPSSBMODE;
	}
	else if(hero.level >= 20)
	{
		money = (kosten * 50) / TEMPSSBMODE;
	}
	else if(hero.level >= 15)
	{
		money = (kosten * 40) / TEMPSSBMODE;
	}
	else if(hero.level >= 10)
	{
		money = (kosten * 30) / TEMPSSBMODE;
	}
	else if(hero.level >= 5)
	{
		money = (kosten * 20) / TEMPSSBMODE;
	}
	else
	{
		money = (kosten * 10) / TEMPSSBMODE;
	};
	if((attrib != ATR_STRENGTH) && (attrib != ATR_DEXTERITY) && (attrib != ATR_MANA_MAX))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(attrib == ATR_STRENGTH)
	{
		realAttribute = oth.attribute[ATR_STRENGTH];
	}
	else if(attrib == ATR_DEXTERITY)
	{
		realAttribute = oth.attribute[ATR_DEXTERITY];
	}
	else if(attrib == ATR_MANA_MAX)
	{
		realAttribute = oth.attribute[ATR_MANA_MAX];
	};
	if(realAttribute >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if((realAttribute + points) > teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLP,177,58,17);
		return FALSE;
	};
	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + kosten;
	Npc_RemoveInvItems(oth,ItMi_Gold,money);
	B_RaiseAttribute(oth,attrib,points);
	return TRUE;
};

func int b_teachattributepointstarinaks(var C_Npc slf,var C_Npc oth,var int attrib,var int points,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realAttribute;
	var int FutAtrib;
	var int NowAtribCost;
	var int FutAtribCost;

	if(points > 1)
	{
		if(attrib == ATR_STRENGTH)
		{
			FutAtrib = oth.aivar[REAL_STRENGTH] + points;
			FutAtribCost = B_GetLearnCostFutureAttribute(oth,attrib,FutAtrib);
		}
		else if(attrib == ATR_DEXTERITY)
		{
			FutAtrib = oth.aivar[REAL_DEXTERITY] + points;
			FutAtribCost = B_GetLearnCostFutureAttribute(oth,attrib,FutAtrib);
		}
		else if(attrib == ATR_MANA_MAX)
		{
			FutAtrib = oth.aivar[REAL_MANA_MAX] + points;
			FutAtribCost = B_GetLearnCostFutureAttribute(oth,attrib,FutAtrib);
		};

		NowAtribCost = B_GetLearnCostAttribute(oth,attrib);

		if(FutAtribCost > NowAtribCost)
		{
			AI_PrintClr(PRINT_NoDoThis,177,58,17);
			return FALSE;
		};
	};

	kosten = B_GetLearnCostAttribute(oth,attrib) * points;

	if((attrib != ATR_STRENGTH) && (attrib != ATR_DEXTERITY) && (attrib != ATR_MANA_MAX))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(attrib == ATR_STRENGTH)
	{
		realAttribute = oth.attribute[ATR_STRENGTH];
	}
	else if(attrib == ATR_DEXTERITY)
	{
		realAttribute = oth.attribute[ATR_DEXTERITY];
	}
	else if(attrib == ATR_MANA_MAX)
	{
		realAttribute = oth.attribute[ATR_MANA_MAX];
	};
	if(realAttribute >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if((realAttribute + points) > teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLP,177,58,17);
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + kosten;
	B_RaiseAttribute(oth,attrib,points);
	return TRUE;
};

func int B_TeachShield(var C_Npc slf,var C_Npc oth,var int points,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int money;
	var int RealShield;

	kosten = points;
	money = points * 250;
	RealShield = hero.attribute[ATR_REGENERATEMANA];

	if(RealShield >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLP,177,58,17);
		return FALSE;
	};
	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		return FALSE;
	};

	hero.lp = hero.lp - kosten;
	RankPoints = RankPoints + kosten;
	Npc_RemoveInvItems(hero,ItMi_Gold,money);
	Snd_Play("LevelUP");
	hero.attribute[ATR_REGENERATEMANA] = hero.attribute[ATR_REGENERATEMANA] + points;

	if(hero.attribute[ATR_REGENERATEMANA] > 100)
	{
		hero.attribute[ATR_REGENERATEMANA] = 100;
	};
	if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
	{
		Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
		Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
		Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
		Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
		Mdl_RemoveOverlayMds(hero,"Shield.MDS");
		Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");

		if(LowHealth == TRUE)
		{
			Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
		}
		else
		{
			if(hero.attribute[ATR_REGENERATEMANA] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
			}
			else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
			}
			else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
			}
			else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
			{
				Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
			};
		};
	};
	if(hero.attribute[ATR_REGENERATEMANA] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RHETORIKA,4);
	}
	else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RHETORIKA,3);
	}
	else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RHETORIKA,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RHETORIKA,1);
	};
	if(hero.attribute[ATR_REGENERATEMANA] <= 100)
	{
		Npc_SetTalentValue(oth,NPC_TALENT_RHETORIKA,hero.attribute[ATR_REGENERATEMANA]);		
	};

	concatText = ConcatStrings(PRINT_Shield," + ");
	concatText = ConcatStrings(concatText,IntToString(points));
	concatText = ConcatStrings(concatText," (Навык: ");
	concatText = ConcatStrings(concatText,IntToString(hero.attribute[ATR_REGENERATEMANA]));
	concatText = ConcatStrings(concatText,"%)");
	AI_Print(concatText);
	return TRUE;
};


func int B_TeachShieldNoMoney(var C_Npc slf,var C_Npc oth,var int points,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int RealShield;

	kosten = points;
	RealShield = hero.attribute[ATR_REGENERATEMANA];

	if(RealShield >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLP,177,58,17);
		return FALSE;
	};

	hero.lp = hero.lp - kosten;
	RankPoints = RankPoints + kosten;
	Snd_Play("LevelUP");
	hero.attribute[ATR_REGENERATEMANA] = hero.attribute[ATR_REGENERATEMANA] + points;

	if(hero.attribute[ATR_REGENERATEMANA] > 100)
	{
		hero.attribute[ATR_REGENERATEMANA] = 100;
	};

	if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
	{
		Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
		Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
		Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
		Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
		Mdl_RemoveOverlayMds(hero,"Shield.MDS");
		Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");

		if(LowHealth == TRUE)
		{
			Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
		}
		else
		{
			if(hero.attribute[ATR_REGENERATEMANA] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
			}
			else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
			}
			else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
			}
			else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
			{
				Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
			};
		};
	};
	if(hero.attribute[ATR_REGENERATEMANA] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RHETORIKA,4);
	}
	else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RHETORIKA,3);
	}
	else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RHETORIKA,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RHETORIKA,1);
	};
	if(hero.attribute[ATR_REGENERATEMANA] <= 100)
	{
		Npc_SetTalentValue(oth,NPC_TALENT_RHETORIKA,hero.attribute[ATR_REGENERATEMANA]);		
	};

	concatText = ConcatStrings(PRINT_Shield," + ");
	concatText = ConcatStrings(concatText,IntToString(points));
	concatText = ConcatStrings(concatText," (Навык: ");
	concatText = ConcatStrings(concatText,IntToString(hero.attribute[ATR_REGENERATEMANA]));
	concatText = ConcatStrings(concatText,"%)");
	AI_Print(concatText);
	return TRUE;
};
