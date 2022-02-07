/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

systém spánku přepracován pomocí spinnerů


v1.01:

func void CZ_Recalculate_Needs - nová funkce
(10x) CZ_Recalculate_Needs - přidání možnosti zapnout/vypnout hlad/žízeň/únavu / omezení spánku na nižších obtížnostech
CZ_Settings_Diff_EnableSleepCap - přidání možnosti zapnout/vypnout omezení spánku
PRIORATWORLD_ZEN - vypnuto omezení spánku v doupěti bratrstva Masyaf
(2x) hitheal -  upraven výpočet obnovených HP za hodinu spánku

*/



func void CZ_Recalculate_Needs(var int hrs)
{
	
	var int hrs_halved;
	hrs_halved = (hrs + 1) / 2;
	
	if(CZ_Settings_Diff_EnableFatigue == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + hrs;
		
		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
	};
	
	if(CZ_Settings_Diff_EnableHunger == TRUE)
	{
		if(Hero_Hunger > hrs_halved)
		{
			Hero_Hunger -= hrs_halved;
		}		
		else
		{
			Hero_Hunger = FALSE;
		};	
	};
	
	if(CZ_Settings_Diff_EnableThirst == TRUE)
	{
		if(Hero_Thirst > hrs_halved)
		{
			Hero_Thirst -= hrs_halved;
		}		
		else
		{
			Hero_Thirst = FALSE;
		};	
	};
	
	if((CZ_Settings_Diff_EnableSleepCap == TRUE) && (CurrentLevel != PRIORATWORLD_ZEN))
	{
		DaySleepHour += hrs;
	};
	
};



func void sleepabit_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
	{
		B_Say(self,self,"$DOESNTWORK");
	}
	else
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
		{
			if(Menu_ReadInt("SOUND","musicEnabled") == TRUE)
			{
				Menu_WriteInt("SOUND","musicEnabled",FALSE);
				BeMusic = TRUE;
			};
			if(CinemaMod == TRUE)
			{
				Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
			};
			if((Npc_GetDistToWP(hero,"NW_CITY_HOTEL_BED_07") <= 500) || (Npc_GetDistToWP(hero,"NW_BIGFARM_STABLE_SLEEP_01") <= 1200))
			{
			}
			else
			{
				self.aivar[AIV_INVINCIBLE] = FALSE;
			};

			PLAYER_MOBSI_PRODUCTION = MOBSI_SleepAbit;
			AI_ProcessInfos(her);
		};
	};
};

func void use_sleepfur()
{
	if((Hlp_GetHeroStatus() == HERO_THREATENED) || (Hlp_GetHeroStatus() == HERO_FIGHTING))
	{
		B_Say(self,self,"$DOESNTWORK");

		if(Npc_HasItems(hero,ITMI_SLEEPSACK) == FALSE)
		{
			CreateInvItems(hero,ITMI_SLEEPSACK,1);
		};
	}
	else
	{
		SLEEPONGROUND = TRUE;
		CreateInvItems(self,ITMI_SLEEPSACK_TEMP,1);
		B_StopLookAt(self);
		AI_StopPointAt(self);
		AI_DropItem(self,ITMI_SLEEPSACK_TEMP);
		AI_PlayAni(self,"T_PLUNDER");
		AI_PlayAni(self,"T_STAND_2_SLEEPGROUND");
		sleepabit_s1();
	};
};

instance PC_NoSleep(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_NoSleep_Condition;
	information = PC_NoSleep_Info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_NoSleep_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};

func void PC_NoSleep_Info()
{
	//Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;

	if(SLEEPONGROUND == TRUE)
	{
		AI_PlayAni(hero,"T_SLEEPGROUND_2_STAND");
		SLEEPONGROUND = FALSE;
	};
	if(TorchIsOn == FALSE)
	{
		CheckTorchIsOn = TRUE;
	};
};

func void pc_sleep_random(var int hour)
{
	var int hitheal;
	var int hitmana;
	var int hit;
	var int hitmax;
	var int hitdelta;
	var int hithealhit;
	var int staminares;
	var int rnd_scream;

	hit = hero.attribute[ATR_HITPOINTS];
	hitmax = hero.attribute[ATR_HITPOINTS_MAX];
	hitdelta = hitmax - hit;
	hitheal = hitmax / 10;

	if(hitheal <= 0)
	{
		hitheal = 1;
	};

	if(SC_IsObsessed == TRUE)
	{
		AI_Print(PRINT_SleepOverObsessed);
		rnd_scream = Hlp_Random(100);

		if(rnd_scream >= 60)
		{
			Snd_Play("ZOM_DIE");		
		}
		else if(rnd_scream >= 30)
		{
			Snd_Play("ZOM_DIE_A1");	
		}
		else
		{
			Snd_Play("ZOM_DIE_A2");	
		};
	}
	else if(POISONED == TRUE)
	{
		AI_Print(PRINT_SleepOverPoisoned);
		rnd_scream = Hlp_Random(100);

		if(rnd_scream >= 60)
		{
			B_Say(hero,hero,"$Aargh_1");
		}
		else if(rnd_scream >= 30)
		{
			B_Say(hero,hero,"$Aargh_2");
		}
		else
		{
			B_Say(hero,hero,"$Aargh_3");	
		};
	}
	else
	{
		rnd_scream = Hlp_Random(4);

		if(rnd_scream == 0)
		{
			B_Say(hero,hero,"$IDLE_01");
		}
		else if(rnd_scream == 1)
		{
			B_Say(hero,hero,"$IDLE_02");
		}
		else if(rnd_scream == 2)
		{
			B_Say(hero,hero,"$IDLE_03");
		}
		else
		{
			B_Say(hero,hero,"$Awake");
		};

		hithealhit = hour * hitheal;
		hithealhit = hithealhit + hit;

		if(SBMODE == TRUE)
		{
			if(hithealhit >= hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = hithealhit;
			};
		}
		else
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};
		if(SBMODE == TRUE)
		{
			staminares = (ATR_STAMINA_MAX[0] * 10) / 5;
			ATR_STAMINA[0] = ATR_STAMINA[0] + (staminares * hour);
		}
		else
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};
		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
		{
			hit = hero.attribute[ATR_MANA];
			hitmax = hero.attribute[ATR_MANA_MAX];
			hitdelta = hitmax - hit;
			hitheal = hitmax / 10;

			if(hitheal <= 0)
			{
				hitheal = 1;
			};

			hithealhit = hour * hitheal;
			hithealhit = hithealhit + hit;

			if(hithealhit >= hero.attribute[ATR_MANA_MAX])
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
			}
			else
			{
				hero.attribute[ATR_MANA] = hithealhit;
			};
		};
	};

	Info_ClearChoices(pc_sleeptime_recover);
};



instance PC_SLEEPTIME_RECOVER(C_Info)
{
	npc = PC_Hero;
	condition = pc_sleeptime_recover_condition;
	information = pc_sleeptime_recover_info;
	important = FALSE;
	permanent = TRUE;
	description = "s@SPIN_SLEEPTIME_RECOVER Spát...";
};

func int pc_sleeptime_recover_condition()
{
	
	// Original dialogue condition
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		
		if((CZ_Settings_Diff_EnableSleepCap == FALSE) || (CurrentLevel == PRIORATWORLD_ZEN))
		{
			max = 10;
		}
		else
		{
			if(DaySleepHour >= 10)
			{
				max = 0;
			}
			else
			{
				max = 10 - DaySleepHour;
			};
		};
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_SLEEPTIME_RECOVER");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_SLEEPTIME_RECOVER
		newDescription = ConcatStrings(newDescription, "s@SPIN_SLEEPTIME_RECOVER ");
		newDescription = ConcatStrings(newDescription, "Spát...");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_SLEEPTIME_RECOVER.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void pc_sleeptime_recover_info()
{
	
	var int length;
	length = InfoManagerSpinnerValue;
	
	var int bHour;
	var int bMinute;
	var int rnd_scream;

	if(SC_IsObsessed == FALSE)
	{
		CZ_Recalculate_Needs(length);
		
		bHour = Wld_GetTimeHour();
		bMinute = Wld_GetTimeMin();
		bHour += length;
		Wld_SetTime(bHour,bMinute);
		pc_sleep_random(length);
	}
	else
	{
		AI_Print(PRINT_SleepOverObsessed);
		rnd_scream = Hlp_Random(100);

		if(rnd_scream >= 60)
		{
			Snd_Play("ZOM_DIE");		
		}
		else if(rnd_scream >= 30)
		{
			Snd_Play("ZOM_DIE_A1");	
		}
		else
		{
			Snd_Play("ZOM_DIE_A2");	
		};
	};
	
	InfoManagerSpinnerValue = 1;
	
};
