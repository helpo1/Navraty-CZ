/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func int B_TeachFightTalentPercent - dovysvětlení nejasné formulace

*/



func int B_GetLearnCostFutureTalent(var C_Npc oth,var int talent,var int skill)
{
	var int kosten;
	kosten = 0;

	if(talent == NPC_TALENT_1H)
	{
		if(skill >= 90)
		{
			if(skill >= oth.aivar[REAL_TALENT_2H])
			{
				kosten = 4;
			}
			else
			{
				kosten = 5;
			};
		}
		else if(skill >= 60)
		{
			if(skill >= oth.aivar[REAL_TALENT_2H])
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(skill >= 30)
		{
			if(skill >= oth.aivar[REAL_TALENT_2H])
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
	if(talent == NPC_TALENT_2H)
	{
		if(skill >= 90)
		{
			if(skill >= oth.aivar[REAL_TALENT_1H])
			{
				kosten = 4;
			}
			else
			{
				kosten = 5;
			};
		}
		else if(skill >= 60)
		{
			if(skill >= oth.aivar[REAL_TALENT_1H])
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(skill >= 30)
		{
			if(skill >= oth.aivar[REAL_TALENT_1H])
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
	if(talent == NPC_TALENT_BOW)
	{
		if(skill >= 60)
		{
			if(skill >= oth.aivar[REAL_TALENT_CROSSBOW])
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(skill >= 30)
		{
			if(skill >= oth.aivar[REAL_TALENT_CROSSBOW])
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
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(skill >= 60)
		{
			if(skill >= oth.aivar[REAL_TALENT_BOW])
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(skill >= 30)
		{
			if(skill >= oth.aivar[REAL_TALENT_BOW])
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

func int B_TeachFightTalentPercent(var C_Npc slf,var C_Npc oth,var int talent,var int percent,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realHitChance;
	var int money;
	var int TEMPSSBMODE;
	var int FutTalent;
	var int NowTalentCost;
	var int FutTalentCost;

	if(percent > 1)
	{
		if(talent == NPC_TALENT_1H)
		{
			FutTalent = oth.HitChance[NPC_TALENT_1H] + percent;
			FutTalentCost = B_GetLearnCostFutureTalent(oth,talent,FutTalent);
		}
		else if(talent == NPC_TALENT_2H)
		{
			FutTalent = oth.HitChance[NPC_TALENT_2H] + percent;
			FutTalentCost = B_GetLearnCostFutureTalent(oth,talent,FutTalent);
		}
		else if(talent == NPC_TALENT_BOW)
		{
			FutTalent = oth.HitChance[NPC_TALENT_BOW] + percent;
			FutTalentCost = B_GetLearnCostFutureTalent(oth,talent,FutTalent);
		}
		else if(talent == NPC_TALENT_CROSSBOW)
		{
			FutTalent = oth.HitChance[NPC_TALENT_CROSSBOW] + percent;
			FutTalentCost = B_GetLearnCostFutureTalent(oth,talent,FutTalent);
		};

		NowTalentCost = B_GetLearnCostTalent(oth,talent,1);

		if(FutTalentCost > NowTalentCost)
		{
			AI_PrintClr(PRINT_NoDoThis,177,58,17);
			AI_PrintClr("(Pro dosažení dalšího intervalu navyšuj atribut nebo dovednost pouze po jednom bodu.)",177,58,17);
			return FALSE;
		};
	};
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

	kosten = B_GetLearnCostTalent(oth,talent,1) * percent;

	if(hero.level >= 100)
	{
		money = (kosten * 300) / TEMPSSBMODE;
	}
	else if(hero.level >= 70)
	{
		money = (kosten * 200) / TEMPSSBMODE;
	}
	else if(hero.level >= 60)
	{
		money = (kosten * 150) / TEMPSSBMODE;
	}
	else if(hero.level >= 50)
	{
		money = (kosten * 125) / TEMPSSBMODE;
	}
	else if(hero.level >= 40)
	{
		money = (kosten * 100) / TEMPSSBMODE;
	}
	else if(hero.level >= 30)
	{
		money = (kosten * 75) / TEMPSSBMODE;
	}
	else if(hero.level >= 20)
	{
		money = (kosten * 50) / TEMPSSBMODE;
	}
	else if(hero.level >= 10)
	{
		money = (kosten * 30) / TEMPSSBMODE;
	}
	else
	{
		money = (kosten * 15) / TEMPSSBMODE;
	};

	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(talent == NPC_TALENT_1H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_CROSSBOW];
	};
	if(realHitChance >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if((realHitChance + percent) > teacherMAX)
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

	if(talent == NPC_TALENT_1H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_1H,percent);
		concatText = ConcatStrings(PRINT_Learn1H," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_1H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_2H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_2H,percent);
		concatText = ConcatStrings(PRINT_Learn2H," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_2H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_BOW,percent);
		concatText = ConcatStrings(PRINT_LearnBow," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_BOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_CROSSBOW,percent);
		concatText = ConcatStrings(PRINT_LearnCrossbow," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_CROSSBOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	return FALSE;
};

func int b_teachfighttalentpercentfree(var C_Npc slf,var C_Npc oth,var int talent,var int percent,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realHitChance;
	kosten = 0;
	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(talent == NPC_TALENT_1H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_CROSSBOW];
	};
	if(realHitChance >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if((realHitChance + percent) > teacherMAX)
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

	if(talent == NPC_TALENT_1H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_1H,percent);
		concatText = ConcatStrings(PRINT_Learn1H," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_1H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_2H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_2H,percent);
		concatText = ConcatStrings(PRINT_Learn2H," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_2H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_BOW,percent);
		concatText = ConcatStrings(PRINT_LearnBow," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_BOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_CROSSBOW,percent);
		concatText = ConcatStrings(PRINT_LearnCrossbow," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_CROSSBOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	return FALSE;
};

func int b_teachfighttalentpercenttarinaks(var C_Npc slf,var C_Npc oth,var int talent,var int percent,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realHitChance;
	kosten = B_GetLearnCostTalent(oth,talent,1) * percent;
	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(talent == NPC_TALENT_1H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_CROSSBOW];
	};
	if(realHitChance >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if((realHitChance + percent) > teacherMAX)
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

	if(talent == NPC_TALENT_1H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_1H,percent);
		concatText = ConcatStrings(PRINT_Learn1H," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_1H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_2H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_2H,percent);
		concatText = ConcatStrings(PRINT_Learn2H," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_2H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_BOW,percent);
		concatText = ConcatStrings(PRINT_LearnBow," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_BOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_CROSSBOW,percent);
		concatText = ConcatStrings(PRINT_LearnCrossbow," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_CROSSBOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	return FALSE;
};

func int B_TeachFightTalentPercentOrc(var C_Npc slf,var C_Npc oth,var int talent,var int percent,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realHitChance;

	kosten = B_GetLearnCostTalentOrc(oth,talent,1) * percent;

	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(talent == NPC_TALENT_1H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_CROSSBOW];
	};

	if(realHitChance >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if((realHitChance + percent) > teacherMAX)
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

	if(talent == NPC_TALENT_1H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_1H,percent);
		concatText = ConcatStrings(PRINT_Learn1H," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_1H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_2H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_2H,percent);
		concatText = ConcatStrings(PRINT_Learn2H," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_2H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_BOW,percent);
		concatText = ConcatStrings(PRINT_LearnBow," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_BOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_CROSSBOW,percent);
		concatText = ConcatStrings(PRINT_LearnCrossbow," + ");
		concatText = ConcatStrings(concatText,IntToString(percent));
		concatText = ConcatStrings(concatText," (Dovednost: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_CROSSBOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
		return TRUE;
	};

	return FALSE;
};

func int B_TeachFightTalentPercent_Quiet(var C_Npc slf,var C_Npc oth,var int talent,var int percent)
{
	var int realHitChance;

	if((talent != NPC_TALENT_1H) && (talent != NPC_TALENT_2H) && (talent != NPC_TALENT_BOW) && (talent != NPC_TALENT_CROSSBOW))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(talent == NPC_TALENT_1H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		realHitChance = oth.HitChance[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		realHitChance = oth.HitChance[NPC_TALENT_CROSSBOW];
	};
	if(talent == NPC_TALENT_1H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_1H,percent);
		return TRUE;
	};
	if(talent == NPC_TALENT_2H)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_2H,percent);
		return TRUE;
	};
	if(talent == NPC_TALENT_BOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_BOW,percent);
		return TRUE;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		B_RaiseFightTalent(oth,NPC_TALENT_CROSSBOW,percent);
		return TRUE;
	};
	return FALSE;
};