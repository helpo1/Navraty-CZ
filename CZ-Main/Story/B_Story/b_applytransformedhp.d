func void B_Drunk()
{
	var int rand;

	if(HeroDrunk == FALSE)
	{
		DrunkX += 1;

		if(DrunkBonus == FALSE)
		{
			if(DrunkX >= 5)
			{
				rand = Hlp_Random(2);

				if(rand == FALSE)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_Drunken.MDS");
				}
				else
				{
					Mdl_ApplyOverlayMds(hero,"Humans_DrunkenExt.MDS");
				};

				DrunkX = FALSE;
				HeroDrunk = TRUE;
				AllDrunkTime += 1;

				if((AllDrunkTime >= 5) && (DrunkBonus == FALSE))
				{
					Snd_Play("LevelUp");
					hero.exp = hero.exp + 250;
					AI_NoticePrint(3000,4098,NAME_Addon_DrinkBonus);
					DrunkBonus = TRUE;
				};
			};
		}
		else
		{
			if(DrunkX >= 10)
			{
				rand = Hlp_Random(2);

				if(rand == FALSE)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_Drunken.MDS");
				}
				else
				{
					Mdl_ApplyOverlayMds(hero,"Humans_DrunkenExt.MDS");
				};

				DrunkX = FALSE;
				HeroDrunk = TRUE;
			};
		};
	};
};

func void b_applytransformedhp()
{
	if(HEROTRANSFORMEDHP > 0)
	{
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + HEROTRANSFORMEDHP;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + HEROTRANSFORMEDHP;
		HEROTRANSFORMEDHP = 0;
	};
};

func void b_applytransformedstm()
{
	var int startstamina;

	if(HEROTRANSFORMEDSTM > 0)
	{
		if(ATR_STAMINA_MAX[0] < 100)
		{
			startstamina = ATR_STAMINA_MAX[0];
			ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + HEROTRANSFORMEDSTM;

			if(ATR_STAMINA_MAX[0] > 100)
			{
				HEROTRANSFORMEDSTM = 100 - startstamina;
				ATR_STAMINA_MAX[0] = 100;
			};

			ATR_STAMINA[0] = ATR_STAMINA[0] + (startstamina * 10);
			Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
		};

		HEROTRANSFORMEDSTM = 0;
	};
};

func void B_GivePlayerXP(var int add_xp)
{
	var C_Item otherweap;
	var string concatText;

	RankPoints = RankPoints + (add_xp / 10);

	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};
	
	hero.exp = hero.exp + add_xp;

	if(hero.guild <= GIL_SEPERATOR_HUM)
	{
		HEROISTRANSFORMED = FALSE;

		if(HEROTRANSFORMEDHP > 0)
		{
			b_applytransformedhp();
		};
		if(HEROTRANSFORMEDSTM > 0)
		{
			b_applytransformedstm();
		};
	};
	if((self.guild == GIL_ORC) && Npc_IsDead(self) && ((c_equipulumulu(hero) == TRUE) || (c_rediedulumulu(hero) == TRUE)))
	{
		ULUMULUISEQUIP_NO = TRUE;
		ULUMULUISEQUIP = FALSE;
		AI_PrintClr("Skřeti už nerespektují člověka s Ulu-Mulu!",177,58,17);
	};
	if((self.guild == GIL_ORC) && Npc_IsDead(self) && (HeroIsOrcArmor == TRUE))
	{
		HeroIsOrcArmor = FALSE;
	};

	concatText = PRINT_XPGained;
	concatText = ConcatStrings(concatText,IntToString(add_xp));
	AI_PrintClr(concatText,52,200,4);

	if(hero.exp >= hero.exp_next)
	{
		hero.level = hero.level + 1;

		if(hero.level >= 60)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 1200);
		}
		else if(hero.level >= 50)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 1000);
		}
		else if(hero.level >= 40)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 900);
		}
		else if(hero.level >= 30)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 800);
		}
		else if(hero.level >= 20)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 650);
		}
		else if(hero.level >= 10)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 550);
		}
		else
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		};

		if(hero.guild > GIL_SEPERATOR_HUM)
		{
			if(SBMODE == 1)
			{
				if(NoHPForLevel == FALSE)
				{
					HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 10;
				};
			}
			else if(SBMODE == 2)
			{
				HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 20;
			}
			else if(SBMODE == 4)
			{
				HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 30;
			};
		}
		else
		{
			if(SBMODE == 1)
			{
				if(NoHPForLevel == FALSE)
				{
					hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 10;
					hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 10;
				};
			}
			else if(SBMODE == 2)
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 20;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 20;
			}
			else if(SBMODE == 4)
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 30;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 30;
			};
		};
		if(RealMode[2] == TRUE)
		{
			hero.lp = hero.lp + 10;
		}
		else if(SBMODE == 1)
		{
			hero.lp = hero.lp + 15;
		}
		else if(SBMODE == 2)
		{
			hero.lp = hero.lp + 20;
		}
		else if(SBMODE == 4)
		{
			hero.lp = hero.lp + 25;
		};

		AI_NoticePrint(3000,4098,PRINT_LevelUp);
		Snd_Play("LEVELUP_NEW");
	};
};

func void b_giveplayerxpquiet(var int add_xp)
{
	var string concatText;

	RankPoints = RankPoints + (add_xp / 10);

	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};

	hero.exp = hero.exp + add_xp;

	if(hero.guild < GIL_SEPERATOR_HUM)
	{
		HEROISTRANSFORMED = FALSE;
	
		if(HEROTRANSFORMEDHP > 0)
		{
			b_applytransformedhp();
		};
	};
	if((self.guild == GIL_ORC) && Npc_IsDead(self) && ((c_equipulumulu(hero) == TRUE) || (c_rediedulumulu(hero) == TRUE)))
	{
		ULUMULUISEQUIP_NO = TRUE;
		ULUMULUISEQUIP = FALSE;
		AI_PrintClr("Skřeti už nerespektují člověka s Ulu-Mulu!",177,58,17);
	};
	
	concatText = PRINT_XPGained;
	concatText = ConcatStrings(concatText,IntToString(add_xp));
	AI_Print(concatText);

	if(hero.exp >= hero.exp_next)
	{
		hero.level = hero.level + 1;

		if(hero.level >= 60)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 1200);
		}
		else if(hero.level >= 50)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 1000);
		}
		else if(hero.level >= 40)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 900);
		}
		else if(hero.level >= 30)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 800);
		}
		else if(hero.level >= 20)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 650);
		}
		else if(hero.level >= 10)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 550);
		}
		else
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		};
		if(hero.guild > GIL_SEPERATOR_HUM)
		{
			if(SBMODE == 1)
			{
				if(NoHPForLevel == FALSE)
				{
					HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 10;
				};
			}
			else if(SBMODE == 2)
			{
				HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 20;
			}
			else if(SBMODE == 4)
			{
				HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 30;
			};
		}
		else
		{
			if(SBMODE == 1)
			{
				if(NoHPForLevel == FALSE)
				{
					hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 10;
					hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 10;
				};
			}
			else if(SBMODE == 2)
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 20;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 20;
			}
			else if(SBMODE == 4)
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 30;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 30;
			};
		};
		if(RealMode[2] == TRUE)
		{
			hero.lp = hero.lp + 10;
		}
		else if(SBMODE == 1)
		{
			hero.lp = hero.lp + 15;
		}
		else if(SBMODE == 2)
		{
			hero.lp = hero.lp + 20;
		}
		else if(SBMODE == 4)
		{
			hero.lp = hero.lp + 25;
		};
	
		AI_NoticePrint(3000,4098,PRINT_LevelUp);
		Snd_Play("LEVELUP_NEW");
	};
};

func void b_removefromparty(var C_Npc npc)
{
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		if(npc.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			npc.aivar[AIV_PARTYMEMBER] = FALSE;
		};
	};
};

func void b_giveplayerxpsemiquiet(var int add_xp)
{
	var string concatText;

	RankPoints = RankPoints + (add_xp / 10);

	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};

	hero.exp = hero.exp + add_xp;

	if(hero.guild < GIL_SEPERATOR_HUM)
	{
		HEROISTRANSFORMED = FALSE;

		if(HEROTRANSFORMEDHP > 0)
		{
			b_applytransformedhp();
		};
	};
	if((self.guild == GIL_ORC) && Npc_IsDead(self) && ((c_equipulumulu(hero) == TRUE) || (c_rediedulumulu(hero) == TRUE)))
	{
		ULUMULUISEQUIP_NO = TRUE;
		ULUMULUISEQUIP = FALSE;
		AI_PrintClr("Skřeti už nerespektují člověka s Ulu-Mulu!",177,58,17);
	};

	concatText = ConcatStrings(PRINT_GAINED,IntToString(add_xp));
	concatText = ConcatStrings(concatText,PRINT_GAINED_2);
	AI_Print(concatText);

	if(hero.exp >= hero.exp_next)
	{
		hero.level = hero.level + 1;

		if(hero.level >= 60)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 1200);
		}
		else if(hero.level >= 50)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 1000);
		}
		else if(hero.level >= 40)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 900);
		}
		else if(hero.level >= 30)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 800);
		}
		else if(hero.level >= 20)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 650);
		}
		else if(hero.level >= 10)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 550);
		}
		else
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		};
		if(hero.guild > GIL_SEPERATOR_HUM)
		{
			if(SBMODE == 1)
			{
				if(NoHPForLevel == FALSE)
				{
					HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 10;
				};
			}
			else if(SBMODE == 2)
			{
				HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 20;
			}
			else if(SBMODE == 4)
			{
				HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 30;
			};
		}
		else
		{
			if(SBMODE == 1)
			{
				if(NoHPForLevel == FALSE)
				{
					hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 10;
					hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 10;
				};
			}
			else if(SBMODE == 2)
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 20;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 20;
			}
			else if(SBMODE == 4)
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 30;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 30;
			};
		};
		if(RealMode[2] == TRUE)
		{
			hero.lp = hero.lp + 10;
		}
		else if(SBMODE == 1)
		{
			hero.lp = hero.lp + 15;
		}
		else if(SBMODE == 2)
		{
			hero.lp = hero.lp + 20;
		}
		else if(SBMODE == 4)
		{
			hero.lp = hero.lp + 25;
		};

		AI_NoticePrint(3000,4098,PRINT_LevelUp);
		Snd_Play("LEVELUP_NEW");
	};
};

func void b_giveplayerxpsemiquietwithbonus(var int add_xp,var int bonus)
{
	var string concatText;

	RankPoints = RankPoints + (add_xp / 10);

	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};

	hero.exp = hero.exp + add_xp;

	if(hero.guild < GIL_SEPERATOR_HUM)
	{
		HEROISTRANSFORMED = FALSE;

		if(HEROTRANSFORMEDHP > 0)
		{
			b_applytransformedhp();
		};
	};
	if((self.guild == GIL_ORC) && Npc_IsDead(self) && ((c_equipulumulu(hero) == TRUE) || (c_rediedulumulu(hero) == TRUE)))
	{
		ULUMULUISEQUIP_NO = TRUE;
		ULUMULUISEQUIP = FALSE;
		AI_PrintClr("Skřeti už nerespektují člověka s Ulu-Mulu!",177,58,17);
	};

	concatText = ConcatStrings(PRINT_GAINED,IntToString(add_xp));
	concatText = ConcatStrings(concatText,PRINT_GAINED_2);
	concatText = ConcatStrings(concatText,PRINT_GAINED_3);
	concatText = ConcatStrings(concatText,PRINT_GAINED);
	concatText = ConcatStrings(concatText,IntToString(bonus));
	concatText = ConcatStrings(concatText,PRINT_GAINED_4);
	AI_Print(concatText);

	if(hero.exp >= hero.exp_next)
	{
		hero.level = hero.level + 1;

		if(hero.level >= 60)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 1200);
		}
		else if(hero.level >= 50)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 1000);
		}
		else if(hero.level >= 40)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 900);
		}
		else if(hero.level >= 30)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 800);
		}
		else if(hero.level >= 20)
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 650);
		}
		else if(hero.level >= 10)
			{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 550);
		}
		else
		{
			hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		};
		if(hero.guild > GIL_SEPERATOR_HUM)
		{
			if(SBMODE == 1)
			{
				if(NoHPForLevel == FALSE)
				{
					HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 10;
				};
			}
			else if(SBMODE == 2)
			{
				HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 20;
			}
			else if(SBMODE == 4)
			{
				HEROTRANSFORMEDHP = HEROTRANSFORMEDHP + 30;
			};
		}
		else
		{
			if(SBMODE == 1)
			{
				if(NoHPForLevel == FALSE)
				{
					hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 10;
					hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 10;
				};
			}
			else if(SBMODE == 2)
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 20;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 20;
			}
			else if(SBMODE == 4)
			{
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 30;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 30;
			};
		};
		if(RealMode[2] == TRUE)
		{
			hero.lp = hero.lp + 10;
		}
		else if(SBMODE == 1)
		{
			hero.lp = hero.lp + 15;
		}
		else if(SBMODE == 2)
		{
			hero.lp = hero.lp + 20;
		}
		else if(SBMODE == 4)
		{
			hero.lp = hero.lp + 25;
		};

		AI_NoticePrint(3000,4098,PRINT_LevelUp);
		Snd_Play("LEVELUP_NEW");
	};
};