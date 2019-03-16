
func int B_GoldMob_Bestimmung()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_01") && (GoldMob_01_AmounT_MAX > GoldMob_01_Amount))
	{
		GoldMob_01_Amount = GoldMob_01_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_02") && (GoldMob_02_AmounT_MAX > GoldMob_02_Amount))
	{
		GoldMob_02_Amount = GoldMob_02_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_03") && (GoldMob_03_AmounT_MAX > GoldMob_03_Amount))
	{
		GoldMob_03_Amount = GoldMob_03_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_04") && (GoldMob_04_AmounT_MAX > GoldMob_04_Amount))
	{
		GoldMob_04_Amount = GoldMob_04_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_SIDE_PICK_01") && (GoldMob_05_AmounT_MAX > GoldMob_05_Amount))
	{
		GoldMob_05_Amount = GoldMob_05_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_SIDE_PICK_02") && (GoldMob_06_AmounT_MAX > GoldMob_06_Amount))
	{
		GoldMob_06_Amount = GoldMob_06_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_06") && (GoldMob_07_AmounT_MAX > GoldMob_07_Amount))
	{
		GoldMob_07_Amount = GoldMob_07_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_01") && (GoldMob_08_AmounT_MAX > GoldMob_08_Amount))
	{
		GoldMob_08_Amount = GoldMob_08_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_02") && (GoldMob_09_AmounT_MAX > GoldMob_09_Amount))
	{
		GoldMob_09_Amount = GoldMob_09_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_03") && (GoldMob_10_AmounT_MAX > GoldMob_10_Amount))
	{
		GoldMob_10_Amount = GoldMob_10_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_MC_PICK_04") && (GoldMob_11_AmounT_MAX > GoldMob_11_Amount))
	{
		GoldMob_11_Amount = GoldMob_11_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_09_PICK") && (GoldMob_12_AmounT_MAX > GoldMob_12_Amount))
	{
		GoldMob_12_Amount = GoldMob_12_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_TO_MC_04_B") && (GoldMob_13_AmounT_MAX > GoldMob_13_Amount))
	{
		GoldMob_13_Amount = GoldMob_13_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_06") && (GoldMob_14_AmounT_MAX > GoldMob_14_Amount))
	{
		GoldMob_14_Amount = GoldMob_14_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_07") && (GoldMob_15_AmounT_MAX > GoldMob_15_Amount))
	{
		GoldMob_15_Amount = GoldMob_15_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_08") && (GoldMob_16_AmounT_MAX > GoldMob_16_Amount))
	{
		GoldMob_16_Amount = GoldMob_16_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_PICK_09") && (GoldMob_17_AmounT_MAX > GoldMob_17_Amount))
	{
		GoldMob_17_Amount = GoldMob_17_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_19") && (GoldMob_18_AmounT_MAX > GoldMob_18_Amount))
	{
		GoldMob_18_Amount = GoldMob_18_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_SLAVE_01") && (GoldMob_19_AmounT_MAX > GoldMob_19_Amount))
	{
		GoldMob_19_Amount = GoldMob_19_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"ADW_MINE_LAGER_05") && (GoldMob_20_AmounT_MAX > GoldMob_20_Amount))
	{
		GoldMob_20_Amount = GoldMob_20_Amount + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_01") && (GOLDMOB_A01_AMOUNT_MAX > GOLDMOB_A01_AMOUNT))
	{
		GOLDMOB_A01_AMOUNT = GOLDMOB_A01_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_02") && (GOLDMOB_A02_AMOUNT_MAX > GOLDMOB_A02_AMOUNT))
	{
		GOLDMOB_A02_AMOUNT = GOLDMOB_A02_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_03") && (GOLDMOB_A03_AMOUNT_MAX > GOLDMOB_A03_AMOUNT))
	{
		GOLDMOB_A03_AMOUNT = GOLDMOB_A03_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_04") && (GOLDMOB_A04_AMOUNT_MAX > GOLDMOB_A04_AMOUNT))
	{
		GOLDMOB_A04_AMOUNT = GOLDMOB_A04_AMOUNT + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_05") && (GOLDMOB_A05_AMOUNT_MAX > GOLDMOB_A05_AMOUNT))
	{
		GOLDMOB_A05_AMOUNT = GOLDMOB_A05_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_06") && (GOLDMOB_A06_AMOUNT_MAX > GOLDMOB_A06_AMOUNT))
	{
		GOLDMOB_A06_AMOUNT = GOLDMOB_A06_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_07") && (GOLDMOB_A07_AMOUNT_MAX > GOLDMOB_A07_AMOUNT))
	{
		GOLDMOB_A07_AMOUNT = GOLDMOB_A07_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_08") && (GOLDMOB_A08_AMOUNT_MAX > GOLDMOB_A08_AMOUNT))
	{
		GOLDMOB_A08_AMOUNT = GOLDMOB_A08_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_09") && (GOLDMOB_A09_AMOUNT_MAX > GOLDMOB_A09_AMOUNT))
	{
		GOLDMOB_A09_AMOUNT = GOLDMOB_A09_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"AM_PICKORE_10") && (GOLDMOB_A10_AMOUNT_MAX > GOLDMOB_A10_AMOUNT))
	{
		GOLDMOB_A10_AMOUNT = GOLDMOB_A10_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_01") && (GOLDMOB_GM01_AMOUNT_MAX > GOLDMOB_GM01_AMOUNT))
	{
		GOLDMOB_GM01_AMOUNT = GOLDMOB_GM01_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_02") && (GOLDMOB_GM02_AMOUNT_MAX > GOLDMOB_GM02_AMOUNT))
	{
		GOLDMOB_GM02_AMOUNT = GOLDMOB_GM02_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_03") && (GOLDMOB_GM03_AMOUNT_MAX > GOLDMOB_GM03_AMOUNT))
	{
		GOLDMOB_GM03_AMOUNT = GOLDMOB_GM03_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_04") && (GOLDMOB_GM04_AMOUNT_MAX > GOLDMOB_GM04_AMOUNT))
	{
		GOLDMOB_GM04_AMOUNT = GOLDMOB_GM04_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_05") && (GOLDMOB_GM05_AMOUNT_MAX > GOLDMOB_GM05_AMOUNT))
	{
		GOLDMOB_GM05_AMOUNT = GOLDMOB_GM05_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_06") && (GOLDMOB_GM06_AMOUNT_MAX > GOLDMOB_GM06_AMOUNT))
	{
		GOLDMOB_GM06_AMOUNT = GOLDMOB_GM06_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_07") && (GOLDMOB_GM07_AMOUNT_MAX > GOLDMOB_GM07_AMOUNT))
	{
		GOLDMOB_GM07_AMOUNT = GOLDMOB_GM07_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_08") && (GOLDMOB_GM08_AMOUNT_MAX > GOLDMOB_GM08_AMOUNT))
	{
		GOLDMOB_GM08_AMOUNT = GOLDMOB_GM08_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_09") && (GOLDMOB_GM09_AMOUNT_MAX > GOLDMOB_GM09_AMOUNT))
	{
		GOLDMOB_GM09_AMOUNT = GOLDMOB_GM09_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"GM_PICKORE_10") && (GOLDMOB_GM10_AMOUNT_MAX > GOLDMOB_GM10_AMOUNT))
	{
		GOLDMOB_GM10_AMOUNT = GOLDMOB_GM10_AMOUNT + 1;
		RankPoints = RankPoints + 1;
		return TRUE;
	};

	return FALSE;
};

var int WarnPerOnceGold;
var int TempCountFatigueGold;

func void Goldhacken_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CurrentLevel != ADANOSVALLEY_ZEN)
		{
			if(CinemaMod == TRUE)
			{
				Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
			};
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		WarnPerOnceGold = FALSE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_GOLDHACKEN;
		AI_ProcessInfos(her);
	};
};

instance PC_Goldhacken_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Goldhacken_End_Condition;
	information = PC_Goldhacken_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_Goldhacken_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};

func void PC_Goldhacken_End_Info()
{
	Truemmer_Count = 0;
	b_endproductiondialog();
};

instance PC_Goldhacken_Addon_Hour(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Goldhacken_Addon_Hour_Condition;
	information = PC_Goldhacken_Addon_Hour_Info;
	permanent = TRUE;
	description = "Добывать золото.";
};

func int PC_Goldhacken_Addon_Hour_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN) && (CurrentLevel != ADANOSVALLEY_ZEN) && (KNOWHOWPICKGOLD == TRUE))
	{
		return TRUE;
	};
};


var int GoldCounter;

func void PC_Goldhacken_Addon_Hour_Info()
{
	var string concatText;
	var string textgold;
	var int CurrentChance;
	var int MultiNugget;
	var int goldpick;
	var int sumgoldpick;
	var int staminaforpickgold;
	var int pickgoldpercent;
	var int TempFatigueMark;

	if(Hero_HackChance >= 10)
	{
		staminaforpickgold = 15 - (Hero_HackChance / 10);
	}
	else
	{
		staminaforpickgold = 15;
	};
	if((SBMODE == TRUE) && (Hero_Fatigue == FALSE))
	{
		B_Say(hero,hero,"$NEEDSLEEP");
		AI_PrintClr("Вы утомлены! Пора отдохнуть...",177,58,17);
		B_Say(self,self,"$TOOHARD");
	}
	else if(ATR_STAMINA[0] >= staminaforpickgold)
	{
		ATR_STAMINA[0] = ATR_STAMINA[0] - staminaforpickgold;

		if(ATR_STAMINA[0] < 1)
		{
			ATR_STAMINA[0] = 0;
		};
		if(SBMODE == TRUE)
		{
			TempCountFatigueGold += 1;

			if(Hero_HackChance >= 90)
			{
				TempFatigueMark = 10;
			}
			else if(Hero_HackChance >= 60)
			{
				TempFatigueMark = 8;
			}
			else if(Hero_HackChance >= 30)
			{
				TempFatigueMark = 6;
			}
			else if(Hero_HackChance >= 0)
			{
				TempFatigueMark = 4;
			};
			if(TempCountFatigueGold >= TempFatigueMark)
			{
				if(Hero_Fatigue > 1)
				{
					Hero_Fatigue -= 1;
					TempCountFatigueGold = FALSE;
				}
				else
				{
					Hero_Fatigue = FALSE;
					TempCountFatigueGold = FALSE;

					if(WarnPerOnceGold == FALSE)
					{
						B_Say(hero,hero,"$NEEDSLEEP");
						AI_PrintClr("Вы утомлены! Пора отдохнуть...",177,58,17);
						WarnPerOnceGold = TRUE;
					};
				};
			};
		};

		CurrentChance = Hlp_Random(50);

		if(B_GoldMob_Bestimmung() == TRUE)
		{
			Snd_Play("ORE_HACK");

			if(Hero_HackChance >= CurrentChance)
			{
				if(Hero_HackChance >= 80)
				{
					MultiNugget = 5;
				}
				else if(Hero_HackChance >= 60)
				{
					MultiNugget = 4;
				}
				else if(Hero_HackChance >= 40)
				{
					MultiNugget = 3;
				}
				else if(Hero_HackChance >= 20)
				{
					MultiNugget = 2;
				}
				else if(Hero_HackChance >= 0)
				{
					MultiNugget = 1;
				};
				goldpick = Hlp_Random(3);
				sumgoldpick = goldpick * MultiNugget;

				if(sumgoldpick > 0)
				{
					if(sumgoldpick == 1)
					{
						textgold = " золотой самородок.";
					}
					else if((sumgoldpick > 1) && (sumgoldpick < 5))
					{
						textgold = " золотых самородка.";
					}
					else if(sumgoldpick >= 5)
					{
						textgold = " золотых самородков.";
					};

					CreateInvItems(hero,ItMi_Addon_GoldNugget,sumgoldpick);
					concatText = "Вы добыли ";
					concatText = ConcatStrings(concatText,IntToString(sumgoldpick));
					concatText = ConcatStrings(concatText,textgold);
					concatText = ConcatStrings(concatText," (Всего: ");
					concatText = ConcatStrings(concatText,IntToString(Npc_HasItems(hero,ItMi_Addon_GoldNugget)));
					concatText = ConcatStrings(concatText,")");
					AI_PrintClr(concatText,83,152,48);
				}
				else
				{
					AI_PrintClr("Золотая крошка разлетелась во все стороны...",245,247,225);
					Truemmer_Count = Truemmer_Count + 1;
				};
			}
			else
			{
				goldpick = Hlp_Random(3);

				if(goldpick > 0)
				{
					if(goldpick == 1)
					{
						textgold = " золотой самородок.";
					}
					else if((goldpick > 1) && (goldpick < 4))
					{
						textgold = " золотых самородка.";
					};

					CreateInvItems(hero,ItMi_Addon_GoldNugget,goldpick);
					concatText = "Вы добыли ";
					concatText = ConcatStrings(concatText,IntToString(goldpick));
					concatText = ConcatStrings(concatText,textgold);
					concatText = ConcatStrings(concatText," (Всего: ");
					concatText = ConcatStrings(concatText,IntToString(Npc_HasItems(hero,ItMi_Addon_GoldNugget)));
					concatText = ConcatStrings(concatText,")");
					AI_PrintClr(concatText,83,152,48);
				}
				else
				{
					AI_PrintClr("Золотая крошка разлетелась во все стороны...",245,247,225);
					Truemmer_Count = Truemmer_Count + 1;
				};
			};
		}
		else
		{
			AI_PrintClr("Здесь больше нечего взять!",177,58,17);
		};
	}
	else
	{
		AI_PrintClr(PRINT_NOMORESTAMINAFORHACKEN,177,58,17);
		B_Say(self,self,"$TOOHARD");
	};
};


instance PC_Goldhacken_Addon_TSchlag(C_Info)
{
	npc = PC_Hero;
	nr = 997;
	condition = PC_Goldhacken_Addon_TSchlag_Condition;
	information = PC_Goldhacken_Addon_TSchlag_Info;
	permanent = TRUE;
	description = "Добывать золото. (применить осколочный удар)";
};


func int PC_Goldhacken_Addon_TSchlag_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN) && (CurrentLevel != ADANOSVALLEY_ZEN) && (Truemmer_Count >= 2) && (Knows_Truemmerschlag == TRUE) && (KNOWHOWPICKGOLD == TRUE))
	{
		return TRUE;
	};
};

func void PC_Goldhacken_Addon_TSchlag_Info()
{
	var string concatText;
	var int staminaforpickgold;
	var int pickgoldpercent;

	if(Hero_HackChance >= 10)
	{
		staminaforpickgold = 15 - (Hero_HackChance / 10);
	}
	else
	{
		staminaforpickgold = 15;
	};
	if(ATR_STAMINA[0] >= staminaforpickgold)
	{
		ATR_STAMINA[0] = ATR_STAMINA[0] - staminaforpickgold;

		if(ATR_STAMINA[0] < 1)
		{
			ATR_STAMINA[0] = 0;
		};

		Snd_Play("RAVENS_EARTHQUAKE3");
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);

		if(Hero_HackChance >= 85)
		{
			CreateInvItems(hero,ItMi_Addon_GoldNugget,15);
			concatText = "Вы добыли ";
			concatText = ConcatStrings(concatText,IntToString(15));
			concatText = ConcatStrings(concatText,"золотых самородков");
			concatText = ConcatStrings(concatText," (Всего: ");
			concatText = ConcatStrings(concatText,IntToString(Npc_HasItems(hero,ItMi_Addon_GoldNugget)));
			concatText = ConcatStrings(concatText,")");
			AI_PrintClr(concatText,83,152,48);
		}
		else if(Hero_HackChance >= 60)
		{
			CreateInvItems(hero,ItMi_Addon_GoldNugget,10);
			concatText = "Вы добыли ";
			concatText = ConcatStrings(concatText,IntToString(10));
			concatText = ConcatStrings(concatText,"золотых самородков");
			concatText = ConcatStrings(concatText," (Всего: ");
			concatText = ConcatStrings(concatText,IntToString(Npc_HasItems(hero,ItMi_Addon_GoldNugget)));
			concatText = ConcatStrings(concatText,")");
			AI_PrintClr(concatText,83,152,48);
		}
		else if(Hero_HackChance >= 30)
		{
			CreateInvItems(hero,ItMi_Addon_GoldNugget,5);
			concatText = "Вы добыли ";
			concatText = ConcatStrings(concatText,IntToString(5));
			concatText = ConcatStrings(concatText,"золотых самородков");
			concatText = ConcatStrings(concatText," (Всего: ");
			concatText = ConcatStrings(concatText,IntToString(Npc_HasItems(hero,ItMi_Addon_GoldNugget)));
			concatText = ConcatStrings(concatText,")");
			AI_PrintClr(concatText,83,152,48);
		}
		else
		{
			AI_PrintClr("Золотая крошка разлетелась во все стороны...",245,247,225);
		};

		Truemmer_Count = 0;

		Snd_Play("ORE_HACK");
	}
	else
	{
		AI_PrintClr(PRINT_NOMORESTAMINAFORHACKEN,177,58,17);
		B_Say(self,self,"$TOOHEAVYFORME");
		Snd_Play("ORE_HACK");
	};
};

var int GoldOre_Exp;

instance PC_Goldhacken_Osair(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Goldhacken_Osair_Condition;
	information = PC_Goldhacken_Osair_Info;
	permanent = TRUE;
	description = "Отколоть кусок породы.";
};

func int PC_Goldhacken_Osair_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN) && (CurrentLevel == PRIORATWORLD_ZEN) && (MIS_PW_GOLDSHAHT == LOG_Running) && (GoldOre_Exp == FALSE))
	{
		return TRUE;
	};
};

func void PC_Goldhacken_Osair_Info()
{
	GoldOre_Exp = TRUE;
	CreateInvItems(hero,ItMi_Osair_GoldNugget,1);
	AI_PrintClr("Вы откололи большой кусок золотой руды!",83,152,48);
	Snd_Play("ORE_HACK");
	B_LogEntry(TOPIC_PW_GOLDSHAHT,"Теперь у меня есть образец золотой породы из подгорной шахты! Пора возвращаться к Осаиру.");
};

var int AllCrystal;

instance PC_Goldhacken_Crystall(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Goldhacken_Crystall_Condition;
	information = PC_Goldhacken_Crystall_Info;
	permanent = TRUE;
	description = "Отколоть кусок кристалла.";
};

func int PC_Goldhacken_Crystall_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN) && (CurrentLevel == ADANOSVALLEY_ZEN) && (Npc_GetDistToWP(hero,"AV_CRYSTALL_01") < 500))
	{
		return TRUE;
	};
};

func void PC_Goldhacken_Crystall_Info()
{
	var int staminaforpickgold;

	staminaforpickgold = 15;

	if(AllCrystal <= 6)
	{
		Snd_Play("ORE_HACK");

		if(ATR_STAMINA[0] >= staminaforpickgold)
		{
			ATR_STAMINA[0] = ATR_STAMINA[0] - staminaforpickgold;

			if(ATR_STAMINA[0] < 1)
			{
				ATR_STAMINA[0] = 0;
			};

			AI_PrintClr("Вы добыли кристалл...",83,152,48);
			CreateInvItems(hero,ItMi_UnSharp_MagicCrystal,1);
			AllCrystal = AllCrystal + 1;
		}
		else
		{
			AI_PrintClr(PRINT_NOMORESTAMINAFORHACKEN,177,58,17);
			B_Say(self,self,"$TOOHEAVYFORME");
		};
	}
	else
	{
		AI_PrintClr("Здесь больше нечего взять!",177,58,17);
		B_Say(self,self,"$NOTHINGTOGET03");
		Truemmer_Count = 0;
		b_endproductiondialog();
	};
};