func void B_Hotkey_Sprint()
{
	var int bTempHealth;

	if(SPRINT_ACTIVE == TRUE)
	{
		SPRINT_ACTIVE = FALSE;
	}
	else
	{
		if(hero.attribute[ATR_HITPOINTS_MAX] > 500)
		{
			bTempHealth = (hero.attribute[ATR_HITPOINTS_MAX] - 500) / (SBMODE * 10);
			bTempHealth = bTempHealth + 100;
		}
		else
		{
			bTempHealth = hero.attribute[ATR_HITPOINTS_MAX] / (SBMODE * 5);
		};
		if((ATR_STAMINA[0] > 0) && (hero.attribute[ATR_HITPOINTS] > bTempHealth))
		{
			SPRINT_ACTIVE = TRUE;
		}
		else
		{
			SPRINT_ACTIVE = FALSE;
		};
	};
};

//---------------------------STATUSBARS-------------------------------

func void print_karma_innos(var int x_pos,var int y_pos)
{
	var string karma;
	var int karma_value;

	karma_value = INNOSPRAYCOUNT - INNOSCRIMECOUNT;
	karma = IntToString(karma_value);
	PrintScreen("(",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(karma,x_pos,y_pos + 2,"FONT_OLD_10_WHITE_HO.tga",1);
};

func void print_karma_beliar(var int x_pos,var int y_pos)
{
	var string karma;

	karma = IntToString(BELIARPRAYCOUNT);
	PrintScreen(")",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(karma,x_pos,y_pos + 2,"FONT_OLD_10_WHITE_HO.tga",1);
};

func void print_Thief_Status(var int x_pos,var int y_pos)
{
	var string karma;

	karma = IntToString(THIEF_REPUTATION);
	PrintScreen("H",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(karma,x_pos,y_pos + 2,"FONT_OLD_10_WHITE_HO.tga",1);
};

func void print_karma_innos_none(var int x_pos,var int y_pos)
{
	var string Context;

	Context = "";
	PrintScreen(Context,x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(Context,x_pos,y_pos + 2,"FONT_OLD_10_WHITE_HO.tga",1);
};

func void print_karma_beliar_none(var int x_pos,var int y_pos)
{
	var string Context;

	Context = "";
	PrintScreen(Context,x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(Context,x_pos,y_pos + 2,"FONT_OLD_10_WHITE_HO.tga",1);
};

func void print_real_status_hunger(var int x_pos,var int y_pos)
{
	var string Context;

	Context = ConcatStrings(STR_HUNGER,"%");
	PrintScreen("C",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(Context,x_pos,y_pos + 2,"FONT_OLD_10_WHITE.tga",1);
};

func void print_real_status_hunger_none(var int x_pos,var int y_pos)
{
	var string Context;

	Context = "";
	PrintScreen(Context,x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(Context,x_pos,y_pos + 2,"FONT_OLD_10_WHITE.tga",1);
};

func void print_real_status_thirs(var int x_pos,var int y_pos)
{
	var string Context;

	Context = ConcatStrings(STR_THIRST,"%");
	PrintScreen("A",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(Context,x_pos,y_pos + 2,"FONT_OLD_10_WHITE.tga",1);
};

func void print_real_status_thirs_none(var int x_pos,var int y_pos)
{
	var string Context;

	Context = "";
	PrintScreen(Context,x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(Context,x_pos,y_pos + 2,"FONT_OLD_10_WHITE.tga",1);
};

func void print_real_status_fatigue(var int x_pos,var int y_pos)
{
	var string Context;

	Context = ConcatStrings(STR_FATIGUE,"%");
	PrintScreen("E",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(Context,x_pos,y_pos + 2,"FONT_OLD_10_WHITE.tga",1);
};

func void print_real_status_fatigue_none(var int x_pos,var int y_pos)
{
	var string Context;

	Context = "";
	PrintScreen(Context,x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(Context,x_pos,y_pos + 2,"FONT_OLD_10_WHITE.tga",1);
};

func void print_threat_status(var int x_pos,var int y_pos)
{
	if(Npc_IsInFightMode(hero,FMODE_NONE) != TRUE)
	{
		if(threatST == FALSE)
		{
			threatST = TRUE;
			threatPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen("G",threatPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(threatST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

func void print_canint_status(var int x_pos,var int y_pos)
{
	if(MageRobeIsUp == TRUE)
	{
		if(canintST == FALSE)
		{
			canintST = TRUE;
			canintPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen("@",canintPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(canintST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

func void print_acrobat_status(var int x_pos,var int y_pos)
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == TRUE) && (AcrobatTurnOFF == FALSE))
	{
		if(acrobatST == FALSE)
		{
			acrobatST = TRUE;
			acrobatPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen("<",acrobatPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(acrobatST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

func void print_sprint_status(var int x_pos,var int y_pos)
{
	if(SPRINT_ACTIVE == TRUE)
	{
		if(sprintST == FALSE)
		{
			sprintST = TRUE;
			sprintPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen(">",sprintPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(sprintST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

func void print_iceshield_status(var int x_pos,var int y_pos)
{
	if(IceShield == TRUE)
	{
		if(iceshieldST == FALSE)
		{
			iceshieldST = TRUE;
			iceshieldPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen("#",iceshieldPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(iceshieldST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

func void print_fireshield_status(var int x_pos,var int y_pos)
{
	if(FireShieldIsUp == TRUE)
	{
		if(fireshieldST == FALSE)
		{
			fireshieldST = TRUE;
			fireshieldPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen("$",fireshieldPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(fireshieldST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

func void print_health_res(var int x_pos,var int y_pos)
{
	if(RestoreHealth == TRUE)
	{
		if(healthST == FALSE)
		{
			healthST = TRUE;
			healthPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen("%",healthPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(healthST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

func void print_mana_res(var int x_pos,var int y_pos)
{
	if(RestoreMana == TRUE)
	{
		if(manaST == FALSE)
		{
			manaST = TRUE;
			manaPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen("&",manaPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(manaST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

func void print_regenmobs_status(var int x_pos,var int y_pos)
{
	if(RegenSummoned == TRUE)
	{
		if(regenmobsST == FALSE)
		{
			regenmobsST = TRUE;
			regenmobsPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen("!",regenmobsPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(regenmobsST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

func void print_ogonek_status(var int x_pos,var int y_pos)
{
	if(OgonekIsUp == TRUE)
	{
		if(ogonekST == FALSE)
		{
			ogonekST = TRUE;
			ogonekPosX = threatST + canintST + acrobatST + sprintST + iceshieldST + fireshieldST + healthST + manaST + regenmobsST + ogonekST;
		};

		PrintScreen("P",ogonekPosX,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	}
	else
	{
		if(ogonekST == TRUE)
		{
			threatPosX = FALSE;
			canintPosX = FALSE;
			acrobatPosX = FALSE;
			sprintPosX = FALSE;
			iceshieldPosX = FALSE;
			fireshieldPosX = FALSE;
			healthPosX = FALSE;
			manaPosX = FALSE;
			regenmobsPosX = FALSE;
			ogonekPosX = FALSE;
			threatST = FALSE;
			canintST = FALSE;
			acrobatST = FALSE;
			sprintST = FALSE;
			iceshieldST = FALSE;
			fireshieldST = FALSE;
			healthST = FALSE;
			manaST = FALSE;
			regenmobsST = FALSE;
			ogonekST = FALSE;
			AI_PrintClrScreen();
		};
	};
};

//--------------------------------------------------------------------------------------------------

func void print_poison_status(var int x_pos,var int y_pos)
{
	if(POISONED == TRUE)
	{
		PrintScreen("K",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	};
};

func void print_sick_status(var int x_pos,var int y_pos)
{
	if(PlayerIsSick == TRUE)
	{
		PrintScreen("L",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	};
};

func void print_bleeding_status(var int x_pos,var int y_pos)
{
	if(PlayerIsBleeding == TRUE)
	{
		PrintScreen("J",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	};
};

func void print_curse_status(var int x_pos,var int y_pos)
{
	if(PlayerIsCurse == TRUE)
	{
		PrintScreen("N",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	};
};

func void print_weakness_status(var int x_pos,var int y_pos)
{
	if(PlayerIsWeakness == TRUE)
	{
		PrintScreen("M",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	};
};

func void print_ignition_status(var int x_pos,var int y_pos)
{
	if(PlayerIsIgnition == TRUE)
	{
		PrintScreen("O",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	};
};

func void print_arrow_count(var int x_pos,var int y_pos)
{
	var string Context;
	var int SummMunition;
	var C_Item weapon;

	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) || (Npc_IsInFightMode(hero,FMODE_FAR) == TRUE))
	{

		if(Npc_HasEquippedRangedWeapon(hero) == TRUE)
		{
			weapon = Npc_GetEquippedRangedWeapon(hero);
		}
		else
		{
			weapon = Npc_GetReadiedWeapon(hero);
		};
		if((weapon.flags & ITEM_BOW) == ITEM_BOW)
		{
			if(Use_OreArrow == FALSE)
			{
				if(Use_Arrow == TRUE)
				{
					SummMunition = Npc_HasItems(hero,ItRw_Arrow);
					Context = ConcatStrings(" Обычные стрелы: ",IntToString(SummMunition));
					PrintScreen("{",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
					PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
				}
				else if(Use_FireArrow == TRUE)
				{
					SummMunition = Npc_HasItems(hero,ItRw_Addon_FireArrow);
					Context = ConcatStrings(" Огненные стрелы: ",IntToString(SummMunition));
					PrintScreen("|",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
					PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
				}
				else if(Use_PoisonArrow == TRUE)
				{
					SummMunition = Npc_HasItems(hero,ItRw_PoisonArrow);
					Context = ConcatStrings(" Отравленные стрелы: ",IntToString(SummMunition));
					PrintScreen("/",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
					PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
				}
				else if(Use_HolyArrow == TRUE)
				{
					SummMunition = Npc_HasItems(hero,ItRw_HolyArrow);
					Context = ConcatStrings(" Освященные стрелы: ",IntToString(SummMunition));
					PrintScreen(";",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
					PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
				}
				else if(Use_MagicArrow == TRUE)
				{
					SummMunition = Npc_HasItems(hero,ItRw_Addon_MagicArrow);
					Context = ConcatStrings(" Магические стрелы: ",IntToString(SummMunition));
					PrintScreen(".",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
					PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
				};
			}
			else
			{
				SummMunition = Npc_HasItems(hero,ITRW_MYHUNTARROW);
				Context = ConcatStrings(" Кереновые стрелы: ",IntToString(SummMunition));
				PrintScreen(":",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
				PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
			};
		};
		if((weapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW)
		{
			if(Use_ShvBolt == FALSE)
			{
				if(Use_Bolt == TRUE)
				{
					SummMunition = Npc_HasItems(hero,ItRw_Bolt);
					Context = ConcatStrings(" Обычные болты: ",IntToString(SummMunition));
					PrintScreen("}",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
					PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
				}
				else if(Use_HolyBolt == TRUE)
				{
					SummMunition = Npc_HasItems(hero,ItRw_HolyBolt);
					Context = ConcatStrings(" Освященные болты: ",IntToString(SummMunition));
					PrintScreen(",",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
					PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
				}
				else if(Use_MagicBolt == TRUE)
				{
					SummMunition = Npc_HasItems(hero,ItRw_Addon_MagicBolt);
					Context = ConcatStrings(" Магические болты: ",IntToString(SummMunition));
					PrintScreen("+",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
					PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
				};
			}
			else
			{
				SummMunition = Npc_HasItems(hero,ITRW_ADDON_MAGICBOLT_SHV);
				Context = ConcatStrings(" Стрела 'Вершителя': ",IntToString(SummMunition));
				PrintScreen("~",x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
				PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
			};
		};
	};
};

func void print_arrow_count_none(var int x_pos,var int y_pos)
{
	var string Context;

	Context = "";
	PrintScreen(Context,x_pos,y_pos,"FONT_OLD_10_WHITE_HO.tga",1);
	PrintScreen(Context,x_pos + 1,y_pos,FONT_CurTime,1);
};

func void print_campinfo()
{
	var string concatText1;

	var int DT_TOTAL_DAILY_ORECOME;
	var int DT_TOTAL_DAILY_FOODLOSS;
	var int DT_TOTAL_DAILY_FOODGATHER;
	var int DT_TOTAL_DAILY_PAYMENTS;
	var int DT_TOTAL_DAILY_IRONCOME;
	var int DT_TOTAL_DAILY_INCOME;

	DT_TOTAL_DAILY_IRONCOME = FALSE;
	DT_TOTAL_DAILY_ORECOME = FALSE;
	DT_TOTAL_DAILY_FOODLOSS = FALSE;
	DT_TOTAL_DAILY_FOODGATHER = FALSE;
	DT_TOTAL_DAILY_PAYMENTS = FALSE;
	DT_TOTAL_DAILY_INCOME = FALSE;


	PrintScreen("--- Общая информация по лагерю ----",5,32,"FONT_OLD_10_WHITE.tga",1);	

	concatText1 = ConcatStrings("Казна лагеря (зол.): ",IntToString(DT_BUDGET));
	PrintScreen(concatText1,5,36,"FONT_OLD_10_WHITE.tga",1);

	concatText1 = ConcatStrings("Запасы магической руды (кус.): ",IntToString(DT_BUDGET_ORE));
	PrintScreen(concatText1,5,38,"FONT_OLD_10_WHITE.tga",1);
	concatText1 = ConcatStrings("Запасы железной руды (кус.): ",IntToString(DT_BUDGET_IRON));
	PrintScreen(concatText1,5,40,"FONT_OLD_10_WHITE.tga",1);

	concatText1 = ConcatStrings("Запасы провизии (ед.): ",IntToString(DT_FOODSTOCK));
	PrintScreen(concatText1,5,42,"FONT_OLD_10_WHITE.tga",1);

	if(DT_BUDGETACTIVE == TRUE)
	{
		if((VALERANRECRUITEDDT == TRUE) && (ValeranIsDead == FALSE))
		{
			if(VALERANBONUS == TRUE)
			{
				DT_TOTAL_DAILY_PAYMENTS += VALERANWAGECH;
			}
			else
			{
				DT_TOTAL_DAILY_PAYMENTS += VALERANWAGE;
			};
		};
		if((EROLRECRUITEDDT == TRUE) && (ErolIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += EROLWAGE;
		};
		if((niclasrecruiteddt == TRUE) && (NiclasIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += NICLASWAGE;
		};
		if((farimrecruiteddt == TRUE) && (FarimIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += FARIMWAGE;
		};
		if((huntygrimesrecruiteddt == TRUE) && (HuntyNWIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += HUNTYWAGE;
		};
		if((huntygrimesrecruiteddt == TRUE) && (GrimesNWIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += GRIMESWAGE;
		};
		if((CARLRECRUITEDDT == TRUE) && (CarlIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += CARLWAGE;
		};
		if((SagittaRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += SAGITTAWAGE;
		};
		if((SNIPESRECRUITEDDT == TRUE) && (SnipesIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += SNIPESWAGE;
		};
		if((AlrikRECRUITEDDT == TRUE) && (AlrikIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += ALRIKWAGE;
		};
		if((GAYVERNRECRUITEDDT == TRUE) && (GayvernIsDead == FALSE))
		{
			DT_TOTAL_DAILY_PAYMENTS += GAYVERNWAGE;
		};

		DT_TOTAL_DAILY_PAYMENTS +=	DT_TOTAL_DAILY_PAYMENTS_ONAR;
		DT_TOTAL_DAILY_INCOME = DT_SMITH_INC_ORE + DT_SMITH_INC_IRON;

		if(DT_TOTAL_DAILY_INCOME > 0)
		{
			concatText1 = ConcatStrings("Доходы лагеря (зол. в день): ",IntToString(DT_TOTAL_DAILY_PAYMENTS));
			PrintScreen(concatText1,5,46,"FONT_OLD_10_WHITE.tga",1);
		}
		else
		{
			PrintScreen("Доходы лагеря (зол. в день): - ",5,46,"FONT_OLD_10_WHITE.tga",1);
		};
		if(DT_TOTAL_DAILY_PAYMENTS > 0)
		{
			concatText1 = ConcatStrings("Расходы на содержание (зол. в день): ",IntToString(DT_TOTAL_DAILY_PAYMENTS));
			PrintScreen(concatText1,5,48,"FONT_OLD_10_WHITE.tga",1);
		}
		else
		{
			PrintScreen("Расходы на содержание (зол. в день): - ",5,48,"FONT_OLD_10_WHITE.tga",1);
		};
	}
	else
	{
		PrintScreen("Расходы на содержание (зол. в день): - ",5,48,"FONT_OLD_10_WHITE.tga",1);
	};
	if(DT_OREGATHER_START == TRUE)
	{
		if((ViperIsDead == FALSE) && (VIPERRECRUITEDDT == TRUE))
		{
			DT_TOTAL_DAILY_ORECOME = DT_TOTAL_DAILY_ORECOME + 75 + DELTA_VIPER;
		};
		if(HUNTYGRIMESRECRUITEDDT == TRUE)
		{
			if(GrimesNWIsDead == FALSE)
			{
				DT_TOTAL_DAILY_ORECOME = DT_TOTAL_DAILY_ORECOME + 125 + DELTA_GRIMES;
			};
		};
		if(DT_TOTAL_DAILY_ORECOME > 0)
		{
			concatText1 = ConcatStrings("Добыча магической руды (кус. в день): ",IntToString(DT_TOTAL_DAILY_ORECOME));
			PrintScreen(concatText1,5,50,"FONT_OLD_10_WHITE.tga",1);
		}
		else
		{
			PrintScreen("Добыча магической руды (кус. в день): - ",5,50,"FONT_OLD_10_WHITE.tga",1);
		};
	}
	else
	{
		PrintScreen("Добыча магической руды (кус. в день): - ",5,50,"FONT_OLD_10_WHITE.tga",1);
	};
	if(DT_IRONGATHER_START == TRUE)
	{
		if(HUNTYGRIMESRECRUITEDDT == TRUE)
		{
			if(HuntyNWIsDead == FALSE)
			{
				DT_TOTAL_DAILY_IRONCOME = DT_TOTAL_DAILY_IRONCOME + 75 + DELTA_HUNTY;
			};
		};
		if((SNIPESRECRUITEDDT == TRUE) && (SnipesIsDead == FALSE))
		{
			DT_TOTAL_DAILY_IRONCOME = DT_TOTAL_DAILY_IRONCOME + 100 + DELTA_SNIPES;
		};
		if(DT_TOTAL_DAILY_IRONCOME > 0)
		{
			concatText1 = ConcatStrings("Добыча железной руды (кус. в день): ",IntToString(DT_TOTAL_DAILY_IRONCOME));
			PrintScreen(concatText1,5,52,"FONT_OLD_10_WHITE.tga",1);
		}
		else
		{
			PrintScreen("Добыча железной руды (кус. в день): - ",5,52,"FONT_OLD_10_WHITE.tga",1);
		};
	}
	else
	{
		PrintScreen("Добыча железной руды (кус. в день): - ",5,52,"FONT_OLD_10_WHITE.tga",1);
	};
	if(DT_FOODSTOCKACTIVE == TRUE)
	{
		if((VALERANRECRUITEDDT == TRUE) && (ValeranIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += VALERANFOODCONS;
		};
		if((EROLRECRUITEDDT == TRUE) && (ErolIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += EROLFOODCONS;
		};
		if((MIS_MYNEWMANSION == LOG_SUCCESS) && (GuardOneIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += GUARD1FOODCONS;
		};
		if((MIS_MYNEWMANSION == LOG_SUCCESS) && (GuardTwoIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += GUARD2FOODCONS;
		};
		if((niclasrecruiteddt == TRUE) && (NiclasIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += NICLASFOODCONS;
			DT_TOTAL_DAILY_FOODGATHER += NICLASHUNTFOOD;
		};
		if((talbinrecruiteddt == TRUE) && (TalbinNWIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += TALBINFOODCONS;
			DT_TOTAL_DAILY_FOODGATHER += TALBINHUNTFOOD;
		};
		if((farimrecruiteddt == TRUE) && (FarimIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += FARIMFOODCONS;
			DT_TOTAL_DAILY_FOODGATHER += FARIMSUPPLIESFOOD;
		};
		if((huntygrimesrecruiteddt == TRUE) && (HuntyNWIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += HUNTYFOODCONS;
		};
		if((huntygrimesrecruiteddt == TRUE) && (GrimesNWIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += GRIMESFOODCONS;
		};
		if((viperrecruiteddt == TRUE) && (ViperIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += VIPERFOODCONS;
		};
		if((eddarecruiteddt == TRUE) && (EddaIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += EDDAFOODCONS;
		};
		if((wolfrecruiteddt == TRUE) && (WolfMIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += WOLFFOODCONS;
		};
		if((wolfrecruiteddt == TRUE) && (GuardThreeIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += GUARD3FOODCONS;
		};
		if((wolfrecruiteddt == TRUE) && (GuardFourIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += GUARD4FOODCONS;
		};
		if((CARLRECRUITEDDT == TRUE) && (CarlIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += CARLFOODCONS;
		};
		if((SagittaRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += SAGITTAFOODCONS;
		};
		if((SNIPESRECRUITEDDT == TRUE) && (SnipesIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += SNIPESFOODCONS;
		};
		if((AlrikRECRUITEDDT == TRUE) && (AlrikIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += ALRIKFOODCONS;
		};
		if((GAYVERNRECRUITEDDT == TRUE) && (GayvernIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += GAYVERNFOODCONS;
		};
		if((BILGOTRECRUITEDDT == TRUE) && (BilgotNWIsDead == FALSE))
		{
			DT_TOTAL_DAILY_FOODLOSS += BILGOTFOODCONS;
		};

		if(DT_TOTAL_DAILY_FOODGATHER > 0)
		{
			concatText1 = ConcatStrings("Поставка провизии (ед. в день): ",IntToString(DT_TOTAL_DAILY_FOODGATHER));
			PrintScreen(concatText1,5,54,"FONT_OLD_10_WHITE.tga",1);
		}
		else
		{
			PrintScreen("Поставка провизии (ед. в день): - ",5,54,"FONT_OLD_10_WHITE.tga",1);
		};

		if(DT_TOTAL_DAILY_FOODLOSS > 0)
		{
			concatText1 = ConcatStrings("Расход провизии (ед. в день): ",IntToString(DT_TOTAL_DAILY_FOODLOSS));
			PrintScreen(concatText1,5,56,"FONT_OLD_10_WHITE.tga",1);
		}
		else
		{
			PrintScreen("Расходы провизии (ед. в день): - ",5,56,"FONT_OLD_10_WHITE.tga",1);
		};
	}
	else
	{
		PrintScreen("Поставка провизии (ед. в день): - ",5,54,"FONT_OLD_10_WHITE.tga",1);
		PrintScreen("Расходы провизии (ед. в день): - ",5,56,"FONT_OLD_10_WHITE.tga",1);
	};
};