var int prayidolday_ch1;
var int prayidolday_ch2;
var int prayidolday_ch3;
var int prayidolday_ch4;
var int RecievedMoney;
var int GivenHitpoints;
var int GivenMana;
const int BeliarsDispo = 10000;

func void b_checkshvinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKSHV = FALSE;
	}
	else
	{
		CHECKSHV = TRUE;
	};
};

func void B_BlitzInArsch()
{
	var int BlitzInArsch_Hitpoints;
	var int CurrentHitpoints;
	var int Abzug;
	var string concatText1;
	var string concatText2;
	var int zufall;

	zufall = Hlp_Random(10);
	CurrentHitpoints = hero.attribute[ATR_HITPOINTS];
	BlitzInArsch_Hitpoints = (CurrentHitpoints * 4) / 5;
	if(BlitzInArsch_Hitpoints < 2)
	{
		BlitzInArsch_Hitpoints = 2;
	};
	Abzug = hero.attribute[ATR_HITPOINTS] - BlitzInArsch_Hitpoints - zufall;

	if(Abzug > 0)
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
	};
	hero.attribute[ATR_HITPOINTS] = BlitzInArsch_Hitpoints - zufall;
	if(hero.attribute[ATR_HITPOINTS] <= 2)
	{
		hero.attribute[ATR_HITPOINTS] = 2;
	};
	hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - zufall;
	if(hero.attribute[ATR_HITPOINTS_MAX] <= 2)
	{
		hero.attribute[ATR_HITPOINTS_MAX] = 2;
	};
};

func void PrayIdol_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		b_checkshvinpresence(SHVALLEY_ZEN);

		if(CHECKSHV == FALSE)
		{
			B_Say(self,self,"$HELLO_BELIAR");
		};
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PRAYIDOL;
		AI_ProcessInfos(her);
	};
};

instance PC_PrayIdol_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PrayIdol_End_Condition;
	information = PC_PrayIdol_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_PrayIdol_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL)
	{
		return TRUE;
	};
};

func void PC_PrayIdol_End_Info()
{
	b_endproductiondialog();
};

instance PC_PrayIdol_PrayIdol(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_PrayIdol_PrayIdol_Condition;
	information = PC_PrayIdol_PrayIdol_Info;
	permanent = TRUE;
	description = "Pomodlit se";
};

func int PC_PrayIdol_PrayIdol_Condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE))
	{
		return TRUE;
	};
};

func void PC_PrayIdol_PrayIdol_Info()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		if(PrayIdolDay != Wld_GetDay())
		{
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_RITUAL_01");

			if(hero.guild == GIL_KDM)
			{
				B_GivePlayerXP(50);
				BELIARPRAYCOUNT = BELIARPRAYCOUNT + 2;
			}
			else
			{
				if(hero.guild == GIL_NDM)
				{
					B_GivePlayerXP(25);
				};

				BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
			};

			RankPoints = RankPoints + 1;
			PrayIdolDay = Wld_GetDay();
			AI_Print(Print_BeliarPrayOk);
		}
		else
		{
			AI_Print(PRINT_ENOUGHTPRAY);
		};
	}
	else
	{
		AI_Print(PRINT_BLESSBELIARPRAYPALKDF);
	};
};


instance PC_PrayIdol_Sacred(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayIdol_Sacred_Condition;
	information = PC_PrayIdol_Sacred_Info;
	permanent = TRUE;
	description = "Pomodlit se a věnovat...";
};

func int PC_PrayIdol_Sacred_Condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE))
	{
		return TRUE;
	};
};

func void PC_PrayIdol_Sacred_Info()
{
	Info_ClearChoices(PC_PrayIdol_Sacred);
	Info_AddChoice(PC_PrayIdol_Sacred,Dialog_Back,PC_PrayIdol_Sacred_Back);

	if(hero.guild == GIL_KDM)
	{
		if(Npc_HasItems(hero,ItMi_Gold) >= 100)
		{
			Info_AddChoice(PC_PrayIdol_Sacred,"... 100 zlatých (+ 2 karma u Beliara)",PC_PrayIdol_Sacred_SmallPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 500)
		{
			Info_AddChoice(PC_PrayIdol_Sacred,"... 500 zlatých (+ 10 karma u Beliara)",PC_PrayIdol_Sacred_MediumPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(PC_PrayIdol_Sacred,"... 1000 zlatých (+ 20 karma u Beliara)",PC_PrayIdol_Sacred_BigPay);
		};
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{	
		if(Npc_HasItems(hero,ItMi_Gold) >= 500)
		{
			Info_AddChoice(PC_PrayIdol_Sacred,"... 500 zlatých (+ 1 karma u Beliara)",PC_PrayIdol_Sacred_MediumPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(PC_PrayIdol_Sacred,"... 1000 zlatých (+ 5 karma u Beliara, - 5 karma u Innose)",PC_PrayIdol_Sacred_BigPay);
		};
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Gold) >= 100)
		{
			Info_AddChoice(PC_PrayIdol_Sacred,"... 100 zlatých (+ 1 karma u Beliara)",PC_PrayIdol_Sacred_SmallPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 500)
		{
			Info_AddChoice(PC_PrayIdol_Sacred,"... 500 zlatých (+ 5 karma u Beliara)",PC_PrayIdol_Sacred_MediumPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(PC_PrayIdol_Sacred,"... 1000 zlatých (+ 10 karma u Beliara)",PC_PrayIdol_Sacred_BigPay);
		};
	};
};

func void PC_PrayIdol_Sacred_Back()
{
	Info_ClearChoices(PC_PrayIdol_Sacred);
};

func void PC_PrayIdol_Sacred_SmallPay()
{
	B_Say(self,self,"$SACR_INNOS");
	Npc_RemoveInvItems(hero,ItMi_Gold,100);

	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL)) 
	{
		if(hero.guild == GIL_KDM)
		{
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_RITUAL_01");
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 2;
			AI_Print(Print_BeliarSacredOk);
		}
		else
		{
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_RITUAL_01");
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
			AI_Print(Print_BeliarSacredOk);
		};
	}
	else
	{
		AI_Print(PRINT_BLESSBELIARPRAYPALKDF);
	};

	Info_ClearChoices(PC_PrayIdol_Sacred);
};

func void PC_PrayIdol_Sacred_MediumPay()
{
	B_Say(self,self,"$SACR_INNOS");
	Npc_RemoveInvItems(hero,ItMi_Gold,500);

	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL)) 
	{
		if(hero.guild == GIL_KDM)
		{
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_RITUAL_01");
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 10;
			AI_Print(Print_BeliarSacredOk);
		}
		else
		{
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_RITUAL_01");
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 5;
			AI_Print(Print_BeliarSacredOk);
		};
	}
	else
	{
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		AI_Print(Print_BeliarSacredOk);
	};

	Info_ClearChoices(PC_PrayIdol_Sacred);
};

func void PC_PrayIdol_Sacred_BigPay()
{
	B_Say(self,self,"$SACR_INNOS");
	Npc_RemoveInvItems(hero,ItMi_Gold,1000);

	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL)) 
	{
		if(hero.guild == GIL_KDM)
		{
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_RITUAL_01");
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 20;
			AI_Print(Print_BeliarSacredOk);
		}
		else
		{
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_RITUAL_01");
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 10;
			AI_Print(Print_BeliarSacredOk);
		};
	}
	else
	{
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Snd_Play("DEM_RITUAL_01");
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 5;
		INNOSPRAYCOUNT = INNOSPRAYCOUNT - 5;
		AI_Print(Print_BeliarSacredOk);
	};

	Info_ClearChoices(PC_PrayIdol_Sacred);
};

instance PC_PrayIdol_RaiseAttribute(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_PrayIdol_RaiseAttribute_Condition;
	information = PC_PrayIdol_RaiseAttribute_Info;
	permanent = TRUE;
	description = "Beliarovy dary...";
};

func int PC_PrayIdol_RaiseAttribute_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (BELIARPRAYCOUNT >= 50))
	{
		return TRUE;
	};
};

func void PC_PrayIdol_RaiseAttribute_Info()
{
	var int TempMaxUpGod;

	if(hero.level >= 10)
	{
		TempMaxUpGod = hero.level / 10;
	}
	else
	{
		TempMaxUpGod = 0;
	};

	if(TempMaxUpGod > MaxUpGod)
	{
		Info_ClearChoices(PC_PrayIdol_RaiseAttribute);
		Info_AddChoice(PC_PrayIdol_RaiseAttribute,Dialog_Back,PC_PrayIdol_RaiseAttribute_Back);
		Info_AddChoice(PC_PrayIdol_RaiseAttribute,"... dej mi sílu (síla + 5, karma - 100)",PC_PrayIdol_RaiseAttribute_STR);
		Info_AddChoice(PC_PrayIdol_RaiseAttribute,"... dej mi obratnost (obratnost + 10, karma - 100)",PC_PrayIdol_RaiseAttribute_DEX);
		Info_AddChoice(PC_PrayIdol_RaiseAttribute,"... dej mi magickou energii (mana + 15, karma - 100)",PC_PrayIdol_RaiseAttribute_MANA);
		Info_AddChoice(PC_PrayIdol_RaiseAttribute,"... dej mi životní sílu (zdraví + 40, karma - 100)",PC_PrayIdol_RaiseAttribute_HP);
		Info_AddChoice(PC_PrayIdol_RaiseAttribute,"... dej mi inteligenci (inteligence + 5, karma - 50)",PC_PrayIdol_RaiseAttribute_INT);

		if(ATR_STAMINA_MAX[0] <= 90)
		{
			Info_AddChoice(PC_PrayIdol_RaiseAttribute,"... dej mi výdrž (výdrž + 10, karma - 50)",PC_PrayIdol_RaiseAttribute_STM);
		};
	}
	else
	{
		AI_PrintClr("Na tohle ještě nejsi připraven...",177,58,17);
		B_Say(self,self,"$DONTREADYFORTHIS");
	};
};

func void PC_PrayIdol_RaiseAttribute_Back()
{
	Info_ClearChoices(PC_PrayIdol_RaiseAttribute);
};

func void PC_PrayIdol_RaiseAttribute_STR()
{
	if(BELIARPRAYCOUNT >= 100)
	{
		B_Say(self,self,"$BLESSED_STR");
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Snd_Play("DEM_RITUAL_02");
		BELIARPRAYCOUNT = BELIARPRAYCOUNT - 100;
		B_BlessAttribute(hero,ATR_STRENGTH,5);
		MaxUpGod += 1;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaBeliar,177,58,17);
	};

	Info_ClearChoices(PC_PrayIdol_RaiseAttribute);
};

func void PC_PrayIdol_RaiseAttribute_DEX()
{
	if(BELIARPRAYCOUNT >= 100)
	{
		B_Say(self,self,"$BLESSED_DEX");
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Snd_Play("DEM_RITUAL_02");
		BELIARPRAYCOUNT = BELIARPRAYCOUNT - 100;
		B_BlessAttribute(hero,ATR_DEXTERITY,10);
		MaxUpGod += 1;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaBeliar,177,58,17);
	};

	Info_ClearChoices(PC_PrayIdol_RaiseAttribute);
};

func void PC_PrayIdol_RaiseAttribute_MANA()
{
	if(BELIARPRAYCOUNT >= 100)
	{
		B_Say(self,self,"$BLESSED_MANA");
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Snd_Play("DEM_RITUAL_02");
		BELIARPRAYCOUNT = BELIARPRAYCOUNT - 100;
		B_BlessAttribute(hero,ATR_MANA_MAX,15);
		MaxUpGod += 1;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaBeliar,177,58,17);
	};

	Info_ClearChoices(PC_PrayIdol_RaiseAttribute);
};

func void PC_PrayIdol_RaiseAttribute_HP()
{
	if(BELIARPRAYCOUNT >= 100)
	{
		B_Say(self,self,"$BLESSED_HP");
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Snd_Play("DEM_RITUAL_02");
		BELIARPRAYCOUNT = BELIARPRAYCOUNT - 100;
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,40);
		MaxUpGod += 1;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaBeliar,177,58,17);
	};

	Info_ClearChoices(PC_PrayIdol_RaiseAttribute);
};

func void PC_PrayIdol_RaiseAttribute_INT()
{
	if(BELIARPRAYCOUNT >= 50)
	{
		B_Say(self,self,"$BLESSED_INT");
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Snd_Play("DEM_RITUAL_02");
		BELIARPRAYCOUNT = BELIARPRAYCOUNT - 50;
		ATR_INTELLECT += 5;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 5");
		MaxUpGod += 1;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaBeliar,177,58,17);
	};

	Info_ClearChoices(PC_PrayIdol_RaiseAttribute);
};

func void PC_PrayIdol_RaiseAttribute_STM()
{
	if(BELIARPRAYCOUNT >= 50)
	{
		B_Say(self,self,"$BLESSED_STAMINA");
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Snd_Play("DEM_RITUAL_02");
		BELIARPRAYCOUNT = BELIARPRAYCOUNT - 50;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + 100;

		if(ATR_STAMINA_MAX[0] > 100)
		{
			ATR_STAMINA_MAX[0] = 100;
		};
		if(ATR_STAMINA[0] > 1000)
		{
			ATR_STAMINA_MAX[0] = 1000;
		};

		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
		AI_Print("Výdrž + 10");
		MaxUpGod += 1;
	}
	else
	{
		AI_PrintClr(PRINT_NotEnoughKarmaBeliar,177,58,17);
	};

	Info_ClearChoices(PC_PrayIdol_RaiseAttribute);
};

instance PC_PRAYRITUALSTONE_AZGOLOR(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_prayritualstone_azgolor_condition;
	information = pc_prayritualstone_azgolor_info;
	permanent = FALSE;
	description = "Začít rituál přivolání";
};

func int pc_prayritualstone_azgolor_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (Npc_HasItems(hero,itmi_prisonsoul_awake) >= 1) && (CHECKSHV == TRUE) && (KNOWS_AZGOGLOR_SUMMON == TRUE))
	{
		return TRUE;
	};
};

func void pc_prayritualstone_azgolor_info()
{
	PlayVideo("RET2_Azgolor.BIK");
	AI_Print(PRAY_AZGOLOR1);
	AI_Print(PRAY_AZGOLOR2);
	AI_Print(PRAY_AZGOLOR3);
	AI_Print(PRAY_AZGOLOR4);
	Wld_SendTrigger("EVENT_FIRELEFTAZGOLOR");
	Wld_SendTrigger("EVENT_FIRERIGHTAZGOLOR");
	Wld_SendTrigger("EVENT_FIRECENTERAZGOLOR");
	Wld_SendTrigger("EVENT_FIREAZGOLORFINAL");
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	Wld_InsertNpc(dragon_black,"SV_AZGALOR");
	Wld_SetTime(0,0);
	Npc_RemoveInvItems(hero,itmi_prisonsoul_awake,1);
	AZGOLORAPPEAR = TRUE;
	B_GivePlayerXP(100);
};

instance PC_PRAYIDOL_TRIRAMAR(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_prayidol_triramar_condition;
	information = pc_prayidol_triramar_info;
	permanent = FALSE;
	description = "Požádat o Mora Ulartu";
};

func int pc_prayidol_triramar_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (Npc_HasItems(hero,itmi_triramar) >= 1) && (CHECKSHV == FALSE) && (Npc_KnowsInfo(other,dia_xardas_findamulet) || Npc_KnowsInfo(other,dia_kreol_findamulet)))
	{
		return TRUE;
	};
};

func void pc_prayidol_triramar_info()
{
	var int sumchance;
	sumchance = CHANCEGETDARKSOUL + Hlp_Random(50);
	Snd_Play("DEM_RITUAL_01");
	Npc_RemoveInvItems(hero,itmi_triramar,1);

	if(sumchance >= Hlp_Random(100))
	{
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		CreateInvItems(hero,itru_moraulartu,1);
		AI_Print(PRAY_TRIRAMAR5);
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - (hero.attribute[ATR_HITPOINTS] / 2);
	};

	BELIARPRAYCOUNT = BELIARPRAYCOUNT + 5;
};

instance PC_PRAYIDOL_UPGRATEBELIARSWEAPON(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = pc_prayidol_upgratebeliarsweapon_condition;
	information = pc_prayidol_upgratebeliarsweapon_info;
	permanent = TRUE;
	description = "Vylepšit 'Beliarův dráp' (vyžaduje duše)";
};

func int pc_prayidol_upgratebeliarsweapon_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE) && (C_ScCanUpgrateBeliarsWeapon() == TRUE))
	{
		if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20) || C_SCHasBeliarsRune())
		{
			return TRUE;
		};
	};
};

func void pc_prayidol_upgratebeliarsweapon_info()
{
	if(Npc_HasItems(hero,itmi_stonesoul) > 0)
	{
		B_UpgrateBeliarsWeapon();
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSNOSOULS);
	};
};

instance PC_PRAYIDOL_GETBELIARSUPERWEAPON(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_prayidol_getbeliarsuperweapon_condition;
	information = pc_prayidol_getbeliarsuperweapon_info;
	permanent = TRUE;
	description = "Přenést duši Senyaka do Beliarova drápu";
};

func int pc_prayidol_getbeliarsuperweapon_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE) && (Npc_HasItems(hero,itmi_stonesoul_senyak) >= 1) && (TELLCANSUPERBELIARWEAPON == TRUE) && (BELIARSUPERWEAPONGIVES == FALSE))
	{
		if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20) || (Npc_HasItems(hero,itru_beliarsrune01) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune02) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune03) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune04) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune05) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune06) == TRUE))
		{
			return TRUE;
		};
	};
};

func void pc_prayidol_getbeliarsuperweapon_info()
{
	b_getbeliarsuperweapon();
};

instance PC_PRAYIDOL_INVOKESOULSSTONEINSBW(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_prayidol_invokesoulsstoneinsbw_condition;
	information = pc_prayidol_invokesoulsstoneinsbw_info;
	permanent = TRUE;
	description = "Obětovat duše";
};

func int pc_prayidol_invokesoulsstoneinsbw_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (KNOWSHOWDEALSOULS == TRUE) && (CHECKSHV == FALSE) && (Npc_HasItems(hero,itmi_stonesoul) >= 1))
	{
		return TRUE;
	};
};

func void pc_prayidol_invokesoulsstoneinsbw_info()
{
	b_givebeliarsouls();
};

instance PC_PRAYIDOL_INVOKESOULSSTONEINSBW_SENYAK(C_Info)
{
	npc = PC_Hero;
	nr = 997;
	condition = pc_prayidol_invokesoulsstoneinsbw_SENYAK_condition;
	information = pc_prayidol_invokesoulsstoneinsbw_SENYAK_info;
	permanent = TRUE;
	description = "Obětovat duši Senyaka";
};

func int pc_prayidol_invokesoulsstoneinsbw_SENYAK_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (KNOWSHOWDEALSOULS == TRUE) && (CHECKSHV == FALSE) && (Npc_HasItems(hero,itmi_stonesoul_senyak) >= 1))
	{
		return TRUE;
	};
};

func void pc_prayidol_invokesoulsstoneinsbw_SENYAK_info()
{
	b_givebeliarsouls_SENYAK();
};

func void pc_prayidol_prayforgomez_back()
{
	Info_ClearChoices(pc_prayidol_prayforgomez);
};

func void pc_prayidol_prayforgomez_str()
{
	var string concatText;
	concatText = "Beliar uděluje Gomezově duší své odpuštění!";
	b_raiseattributeminus(hero,ATR_STRENGTH,-5);
	Snd_Play("DEM_RITUAL_02");
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	AI_Print(concatText);
	RESCUEGOMEZPRAYBELIAR = TRUE;
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze Beliarovo odpuštení.");
	if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
	{
		RESCUEGOMEZSTEPONEDONE = TRUE;
		RESCUEGOMEZSTEPTWO = TRUE;
		Log_AddEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze odpuštění od všech třech bohů! Nyní bych měl navštívit Starý důl.");
	};
	Info_ClearChoices(pc_prayidol_prayforgomez);
};

func void pc_prayidol_prayforgomez_dex()
{
	var string concatText;
	concatText = "Beliar uděluje Gomezově duší své odpuštění!";
	b_raiseattributeminus(hero,ATR_DEXTERITY,-5);
	Snd_Play("DEM_RITUAL_02");
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	AI_Print(concatText);
	RESCUEGOMEZPRAYBELIAR = TRUE;
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze Beliarovo odpuštení.");
	if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
	{
		RESCUEGOMEZSTEPONEDONE = TRUE;
		RESCUEGOMEZSTEPTWO = TRUE;
		Log_AddEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze odpuštění od všech třech bohů! Nyní bych měl navštívit Starý důl.");
	};
	Info_ClearChoices(pc_prayidol_prayforgomez);
};

func void pc_prayidol_prayforgomez_mana()
{
	var string concatText;
	concatText = "Beliar uděluje Gomezově duší své odpuštění!";
	b_raiseattributeminus(hero,ATR_MANA_MAX,-20);
	Npc_ChangeAttribute(hero,ATR_MANA,ATR_MANA_MAX);
	Snd_Play("DEM_RITUAL_02");
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	AI_Print(concatText);
	RESCUEGOMEZPRAYBELIAR = TRUE;
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze Beliarovo odpuštení.");
	if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
	{
		RESCUEGOMEZSTEPONEDONE = TRUE;
		RESCUEGOMEZSTEPTWO = TRUE;
		Log_AddEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze odpuštění od všech třech bohů! Nyní bych měl navštívit Starý důl.");
	};
	Info_ClearChoices(pc_prayidol_prayforgomez);
};

func void pc_prayidol_prayforgomez_life()
{
	var string concatText;
	concatText = "Beliar uděluje Gomezově duší své odpuštění!";
	b_raiseattributeminus(hero,ATR_HITPOINTS_MAX,-40);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("DEM_RITUAL_02");
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	AI_Print(concatText);
	RESCUEGOMEZPRAYBELIAR = TRUE;
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze Beliarovo odpuštení.");
	if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
	{
		RESCUEGOMEZSTEPONEDONE = TRUE;
		RESCUEGOMEZSTEPTWO = TRUE;
		Log_AddEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze odpuštění od všech třech bohů! Nyní bych měl navštívit Starý důl.");
	};
	Info_ClearChoices(pc_prayidol_prayforgomez);
};

func void pc_prayidol_prayforgomez_money()
{
	var string concatText;
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		concatText = "Beliar uděluje Gomezově duší své odpuštění!";
		Npc_RemoveInvItems(hero,ItMi_Gold,5000);
		Snd_Play("DEM_RITUAL_02");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_Print(concatText);
		RESCUEGOMEZPRAYBELIAR = TRUE;
		B_LogEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze Beliarovo odpuštení.");
		if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
		{
			RESCUEGOMEZSTEPONEDONE = TRUE;
			RESCUEGOMEZSTEPTWO = TRUE;
			Log_AddEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze odpuštění od všech třech bohů! Nyní bych měl navštívit Starý důl.");
		};
		Info_ClearChoices(pc_prayidol_prayforgomez);
	}
	else
	{
		B_BlitzInArsch();
		Info_ClearChoices(pc_prayidol_prayforgomez);
	};
};

instance PC_PRAYIDOL_PRAYFORGOMEZ(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_prayidol_prayforgomez_condition;
	information = pc_prayidol_prayforgomez_info;
	permanent = TRUE;
	description = "Pomodlit se za Gomezovu duši";
};

func int pc_prayidol_prayforgomez_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE) && (MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYBELIAR == FALSE))
	{
		return TRUE;
	};
};

func void pc_prayidol_prayforgomez_info()
{
	var string concatText;

	if(BeliarBonus == FALSE)
	{
		concatText = "Temný bůh požaduje oběť...";
		AI_Print(concatText);
		Info_ClearChoices(pc_prayidol_prayforgomez);
		Info_AddChoice(pc_prayidol_prayforgomez,Dialog_Back,pc_prayidol_prayforgomez_back);
		Info_AddChoice(pc_prayidol_prayforgomez,"... 5000 zlatých",pc_prayidol_prayforgomez_money);
		Info_AddChoice(pc_prayidol_prayforgomez,"... 40 bodů zdraví",pc_prayidol_prayforgomez_life);
		Info_AddChoice(pc_prayidol_prayforgomez,"... 20 bodů many",pc_prayidol_prayforgomez_mana);
		Info_AddChoice(pc_prayidol_prayforgomez,"... 5 bodů obratnosti",pc_prayidol_prayforgomez_dex);
		Info_AddChoice(pc_prayidol_prayforgomez,"... 5 bodů síly",pc_prayidol_prayforgomez_str);
	}
	else
	{
		concatText = "Beliar uděluje Gomezově duší své odpuštění!";
		Snd_Play("DEM_RITUAL_02");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_Print(concatText);
		RESCUEGOMEZPRAYBELIAR = TRUE;
		B_LogEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze Beliarovo odpuštení.");

		if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
		{
			RESCUEGOMEZSTEPONEDONE = TRUE;
			RESCUEGOMEZSTEPTWO = TRUE;
			Log_AddEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze odpuštění od všech třech bohů! Nyní bych měl navštívit Starý důl.");
		};
	};
};

var int BELIARSAYHISWILL;

instance PC_PRAYIDOL_PRAYFORPOWER(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_prayidol_prayforpower_condition;
	information = pc_prayidol_prayforpower_info;
	permanent = TRUE;
	description = "Požádat o dar síly a moci";
};

func int pc_prayidol_prayforpower_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE) && (NETBEKLEADME_STEP1 == TRUE) && (BELIARGIVEPOWER == FALSE))
	{
		return TRUE;
	};
};

func void pc_prayidol_prayforpower_info()
{
	if(BELIARSAYHISWILL == TRUE)
	{
		if(ORCLEADERISDEAD == TRUE)
		{
			B_Say(self,self,"$BELIARGIVEPOWERDONE");

			if(BELIARPRAYCOUNT < 666)
			{
				BELIARPRAYCOUNT = 666;
			};

			b_giveplayerxpquiet(500);
			Snd_Play("DEM_Warn");
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_Print(PRINT_BELIARGIVEPOWER);
			BELIARGIVEPOWER = TRUE;
			MIS_BELIARWILL = LOG_Success;
			Log_SetTopicStatus(TOPIC_BELIARWILL,LOG_Success);
			B_LogEntry(TOPIC_GUARDIANS,"Obdržel jsem část Beliarovy moci.");
			AI_Wait(hero,1);

			if((INNOSGIVEPOWER == TRUE) && (BELIARGIVEPOWER == TRUE) && (ADANOSGIVEPOWER == TRUE))
			{
				NETBEKLEADME_STEP1DONE = TRUE;
				Log_AddEntry(TOPIC_GUARDIANS,"Zajistil jsem si podporu všech tří bohů a stal se jejich Vyvoleným!");
				CreateInvItems(hero,ItAr_GodArmor,1);
				AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
				AI_Wait(hero,3);
				AI_EquipArmor(hero,ItAr_GodArmor);
			};
		}
		else
		{
			AI_Print(PRINT_DOWILLBELIAR);
		};
	}
	else
	{
		B_Say(self,self,"$BELIARGIVEPOWERWILL");
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		BELIARSAYHISWILL = TRUE;
		MIS_BELIARWILL = LOG_Running;
		Log_CreateTopic(TOPIC_BELIARWILL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BELIARWILL,LOG_Running);

		if(ORCLEADERISDEAD == TRUE)
		{
			B_LogEntry(TOPIC_BELIARWILL,"Beliar mi přikázal zabít vůdce skřetů! Zřejmě myslí Ur-Thralla... Jenže ten už mrtvý je! Takže myslím, že bych měl prostě Beliara požádat o pomoc znovu.");
			AI_Wait(hero,1);
		}
		else
		{
			B_LogEntry(TOPIC_BELIARWILL,"Beliar mi přikázal zabít vůdce skřetů! Zřejmě myslí Ur-Thralla...");
			AI_Wait(hero,1);
		};
	};

	b_endproductiondialog();
};

instance PC_PRAYIDOL_PRAYFORHELP(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_prayidol_prayforhelp_condition;
	information = pc_prayidol_prayforhelp_info;
	permanent = TRUE;
	description = "Pomodlit se a požádat o pomoc";
};

func int pc_prayidol_prayforhelp_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE) && (ASKABOUTPEACEWAY == TRUE) && (BELIARSENDHELPSERVANT == FALSE))
	{
		return TRUE;
	};
};

func void pc_prayidol_prayforhelp_info()
{
	AI_Print(PRAY_BELIARHELP_1);
	AI_Print(PRAY_BELIARHELP_2);
	AI_Print(PRAY_BELIARHELP_3);
	AI_Print(PRAY_BELIARHELP_4);

	if((BELIARPRAYCOUNT > 0) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		BELIARSENDHELPSERVANT = TRUE;
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		AI_Wait(self,10);
		Log_AddEntry(TOPIC_GOLDDRAGONPORTAL,"Zdá se, že Beliar vyslyšel moji modlitbu!");
		AI_Print("Zdá se, že Beliar vyslyšel moji modlitbu!");
	}
	else
	{
		AI_Wait(self,10);
		AI_Print("Nic se nestalo...");
	};
};

instance PC_PRAYIDOL_PRAY_BLESSROBA(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_PRAYIDOL_PRAY_BLESSROBA_condition;
	information = PC_PRAYIDOL_PRAY_BLESSROBA_info;
	permanent = TRUE;
	description = "Požádat o posvěcení roucha...";
};

func int PC_PRAYIDOL_PRAY_BLESSROBA_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE) && (Npc_HasItems(hero,itar_dmt_h) >= 1) && (Npc_HasItems(hero,itpo_breath_of_death) >= 1) && (Npc_HasItems(hero,itmi_stonesoul) >= 100))
	{
		return TRUE;
	};
};

func void PC_PRAYIDOL_PRAY_BLESSROBA_info()
{
	Info_ClearChoices(PC_PRAYIDOL_PRAY_BLESSROBA);
	Info_AddChoice(PC_PRAYIDOL_PRAY_BLESSROBA,Dialog_Back,PC_PRAYIDOL_PRAY_BLESSROBA_Back);

	if(Npc_HasItems(hero,itmi_stonesoul_senyak) >= 1)
	{
		Info_AddChoice(PC_PRAYIDOL_PRAY_BLESSROBA,"... přinést jako dar Senyakovu duši",PC_PRAYIDOL_PRAY_BLESSROBA_Senyak);
	};
	if(Npc_HasItems(hero,itmi_stonesoul) >= 100)
	{
		Info_AddChoice(PC_PRAYIDOL_PRAY_BLESSROBA,"... přinést jako dar obyčejné duše",PC_PRAYIDOL_PRAY_BLESSROBA_Common);
	};
};

func void PC_PRAYIDOL_PRAY_BLESSROBA_Back()
{
	Info_ClearChoices(PC_PRAYIDOL_PRAY_BLESSROBA);
};

func void PC_PRAYIDOL_PRAY_BLESSROBA_Senyak()
{
 	if(BELIARPRAYCOUNT >= 200)
	{
		B_GivePlayerXP(1000);
		Snd_Play("DEM_RITUAL_01");
		AI_Wait(hero,2);
		Npc_RemoveInvItems(hero,itpo_breath_of_death,1);
		Npc_RemoveInvItems(hero,itmi_stonesoul_senyak,1);
		CreateInvItems(hero,itar_dmt_h_beliar_3,1);
		AI_EquipArmor(hero,itar_dmt_h_beliar_3);
		Npc_RemoveInvItems(hero,itar_dmt_h,1);
		AI_Print("Temný bůh posvětil tvůj šat!");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	}
	else
	{
		if(BeliarFailRobe == FALSE)
		{
			BeliarFailRobe = TRUE;
		};

		AI_Wait(hero,2);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSIGNORESYOU);
	};

	Info_ClearChoices(PC_PRAYIDOL_PRAY_BLESSROBA);
};

func void PC_PRAYIDOL_PRAY_BLESSROBA_Common()
{
 	if(BELIARPRAYCOUNT >= 200)
	{
		B_GivePlayerXP(500);
		Snd_Play("DEM_RITUAL_02");
		AI_Wait(hero,2);
		Npc_RemoveInvItems(hero,itpo_breath_of_death,1);
		Npc_RemoveInvItems(hero,itmi_stonesoul,100);
		CreateInvItems(hero,itar_dmt_h_beliar_1,1);
		AI_EquipArmor(hero,itar_dmt_h_beliar_1);
		Npc_RemoveInvItems(hero,itar_dmt_h,1);
		AI_Print("Temný bůh posvětil tvůj šat!");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	}
	else
	{
		if(BeliarFailRobe == FALSE)
		{
			BeliarFailRobe = TRUE;
		};

		AI_Wait(hero,2);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSIGNORESYOU);
	};

	Info_ClearChoices(PC_PRAYIDOL_PRAY_BLESSROBA);
};

instance PC_PRAYIDOL_PRAY_HASIM(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_PRAYIDOL_PRAY_HASIM_condition;
	information = PC_PRAYIDOL_PRAY_HASIM_info;
	permanent = TRUE;
	description = "Pomodlit se za Hasimovu duši";
};

func int PC_PRAYIDOL_PRAY_HASIM_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE) && (HaniarKnowKiller == TRUE) && (PrayForHasim == FALSE))
	{
		return TRUE;
	};
};

func void PC_PRAYIDOL_PRAY_HASIM_info()
{
	AI_Print(PRAY_HASIM1);
	AI_Print(PRAY_HASIM2);
	AI_Wait(hero,3);
	Snd_Play("DEM_Warn");
	PrayForHasim = TRUE;
};

func void PRAYIDOL_HIDE_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PRAYIDOL_HIDE;
		AI_ProcessInfos(her);
	};
};

instance PC_PRAYIDOL_HIDE_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PRAYIDOL_HIDE_End_Condition;
	information = PC_PRAYIDOL_HIDE_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_PRAYIDOL_HIDE_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL_HIDE)
	{
		return TRUE;
	};
};

func void PC_PRAYIDOL_HIDE_End_Info()
{
	b_endproductiondialog();
};

instance PC_PRAYIDOL_HIDE_Open(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_PRAYIDOL_HIDE_Open_Condition;
	information = PC_PRAYIDOL_HIDE_Open_Info;
	permanent = FALSE;
	description = "(přečíst Masyafský svitek)";
};

func int PC_PRAYIDOL_HIDE_Open_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL_HIDE) && (Npc_HasItems(hero,ItWr_HaniarDemonScroll) >= 1))
	{
		return TRUE;
	};
};

func void PC_PRAYIDOL_HIDE_Open_Info()
{
	AI_Print(PRAY_HIDEDOOR);
	AI_Wait(hero,1);
	B_Say(self,self,"$HOWINTEREST");
	Snd_Play("DEM_Warn");
	Wld_SendTrigger("EVT_CORGALOM_ENTRANCE_01");
	Wld_SendTrigger("EVT_PW_INNER_SACTUM_GATE");
	MasiafSecret = TRUE;
	B_LogEntry(TOPIC_MasiafStory,"Přečetl jsem svitek před Beliarovým oltářem a otevřela se tajná chodba.");
};

instance PC_PRAYIDOL_HANIARTRIBE(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_PRAYIDOL_HANIARTRIBE_Condition;
	information = PC_PRAYIDOL_HANIARTRIBE_Info;
	permanent = TRUE;
	description = "Obětovat Haniarovo zlato";
};

func int PC_PRAYIDOL_HANIARTRIBE_Condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (CHECKSHV == FALSE) && (MIS_BeliarTribe == LOG_Running) && (Npc_HasItems(hero,ItMi_Gold) >= 2000))
	{
		return TRUE;
	};
};

func void PC_PRAYIDOL_HANIARTRIBE_Info()
{
	var string concatText;

	concatText = "Temný bůh přijal tvůj dar...";
	AI_Print(concatText);
	Npc_RemoveInvItems(hero,ItMi_Gold,2000);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	MIS_BeliarTribe = LOG_Success;
	Log_SetTopicStatus(TOPIC_BeliarTribe,LOG_Success);
	B_LogEntry(TOPIC_BeliarTribe,"Přinesl jsem Beliarovi dar! Tahle zpráva určitě Haniara potěší.");
	BELIARPRAYCOUNT = BELIARPRAYCOUNT + 5;
};

instance PC_PRAYIDOL_SOULRIVER(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_prayidol_soulriver_condition;
	information = pc_prayidol_soulriver_info;
	permanent = TRUE;
	description = "Pomodlit se a přinést oběť";
};

func int pc_prayidol_soulriver_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (Npc_HasItems(hero,itpo_soulriver) >= 1) && (SOUL_PRAY_BLESSED == FALSE) && (CHECKSHV == FALSE))
	{
		return TRUE;
	};
};

func void pc_prayidol_soulriver_info()
{
	B_Say(self,self,"$BELIARPRAY");
	SOUL_PRAY_BLESSED = TRUE;
	BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
};


instance PC_PRAYIDOL_SOULRIVER_BLESS(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_prayidol_soulriver_bless_condition;
	information = pc_prayidol_soulriver_bless_info;
	permanent = TRUE;
	description = "(pokropit oltář Extraktem duší)";
};

func int pc_prayidol_soulriver_bless_condition()
{
	b_checkshvinpresence(SHVALLEY_ZEN);

	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (Npc_HasItems(hero,itpo_soulriver) >= 1) && (SOUL_PRAY_BLESSED == TRUE) && (SOUL_PRAY == FALSE) && (CHECKSHV == FALSE))
	{
		return TRUE;
	};
};

func void pc_prayidol_soulriver_bless_info()
{
	var string concatText;
	concatText = "Temný bůh přijal tvůj dar...";
	AI_Print(concatText);
	Npc_RemoveInvItems(hero,itpo_soulriver,1);
	Wld_PlayEffect("SPELLFX_BELIARSHRINE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	SOUL_PRAY = TRUE;
	SOUL_PRAY_AFTER = TRUE;
	BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
};