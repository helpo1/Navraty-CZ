
func int B_TeachPlayerTalentRunes(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int kosten;
	var int money;
	var int tempRuneSkill;
	var C_Npc scrolltrader_kdf;
	var C_Npc scrolltrader_kdw;
	var C_Npc scrolltrader_gur;
	var C_Npc scrolltrader_dmt;
	var C_Npc scrolltrader_prm;
	var int TEMPSSBMODE;

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

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);
	money = (kosten * 200) / TEMPSSBMODE;

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
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
	Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry(TOPIC_TalentRunes,"Для создания магической руны, кроме необходимого заклинания, мне еще понадобятся некоторые составляющие. С помощью этих составляющих и рунического камня определенного типа я могу создать на руническом столе необходимую мне руну. Для создания рун первого и второго круга необходимы обычные рунные камни, для рун третьего и четвертого круга - старшие рунные камни, для рун пятого и шестого кругов - высшие рунные камни. Сами рунные камни можно сделать на руническом столе из кусков рунического камня. Однако где его добывать мне неизвестно.");

	if(Npc_IsDead(Gorax) == FALSE)
	{
		scrolltrader_kdf = Hlp_GetNpc(Gorax);
	}
	else if(Npc_IsDead(Isgaroth) == FALSE)
	{
		scrolltrader_kdf = Hlp_GetNpc(Isgaroth);
	};
	if(Npc_IsDead(Cronos_ADW) == FALSE)
	{
		scrolltrader_kdw = Hlp_GetNpc(Cronos_ADW);
	};
	if(CHOOSESTONE == TRUE)
	{
		if(hero.guild == GIL_GUR)
		{
			if(Npc_IsDead(baaltyon) == FALSE)
			{
				scrolltrader_gur = Hlp_GetNpc(baaltyon);
			};
		}
		else
		{
			if(Npc_IsDead(NETBEK) == FALSE)
			{
				scrolltrader_gur = Hlp_GetNpc(NETBEK);
			};
		};
	}
	else
	{
		if(Npc_IsDead(baaltyon) == FALSE)
		{
			scrolltrader_gur = Hlp_GetNpc(baaltyon);
		};
	};
	if(Npc_IsDead(Xardas) == FALSE)
	{
		scrolltrader_dmt = Hlp_GetNpc(Xardas);
	};
	if(Npc_IsDead(vlk_6027_taliasan) == FALSE)
	{
		scrolltrader_prm = Hlp_GetNpc(vlk_6027_taliasan);
	};
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
	};
	if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalLightHeal,1);
	};
	if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
		CreateInvItems(hero,ItRu_PalHolyBolt,1);
	};
	if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalMediumHeal,1);
	};
	if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
		CreateInvItems(hero,ItRu_PalRepelEvil,1);
	};
	if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalFullHeal,1);
	};
	if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
		CreateInvItems(hero,ItRu_PalDestroyEvil,1);
	};
	if(spell == SPL_PalTeleportSecret)
	{
		PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
	};
	if(spell == SPL_TeleportSeaport)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportSeaport] = TRUE;
	};
	if(spell == SPL_TeleportMonastery)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportMonastery] = TRUE;
	};
	if(spell == SPL_TeleportFarm)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportFarm] = TRUE;
	};
	if(spell == SPL_TeleportXardas)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportXardas] = TRUE;
	};
	if(spell == SPL_TeleportPassNW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassNW] = TRUE;
	};
	if(spell == SPL_SummonCrait)
	{
		PLAYER_TALENT_RUNES[97] = TRUE;
	};
	if(spell == SPL_TeleportPassOW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassOW] = TRUE;
	};
	if(spell == SPL_TELEPORTDAGOT)
	{
		PLAYER_TALENT_RUNES[90] = TRUE;
	};
	if(spell == SPL_TeleportOC)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportOC] = TRUE;
	};
	if(spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		PLAYER_TALENT_RUNES_18 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Light,1);
		AI_Print("Обучен изготовлению руны - 'Свет'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Свет': магический свиток заклинания, золотая монета. ");
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		PLAYER_TALENT_RUNES_21 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_LightHeal,1);
		AI_Print("Обучен изготовлению руны - 'Исцеление'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Исцеление': магический свиток заклинания, лечебный корень. ");
	};
	if(spell == SPL_UnlockChest)
	{
		PLAYER_TALENT_RUNES[SPL_UnlockChest] = TRUE;
		PLAYER_TALENT_RUNES_99 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Unlock,1);
		AI_Print("Обучен изготовлению руны - 'Магический взлом'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Магический взлом': магический свиток заклинания, отмычка.");
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		PLAYER_TALENT_RUNES_25 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumWolf,1);
		AI_Print("Обучен изготовлению руны - 'Призыв варга'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв варга': магический свиток заклинания, шкура варга.");
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		PLAYER_TALENT_RUNES_35 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumGol,1);
		AI_Print("Обучен изготовлению руны - 'Призыв каменного голема'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв каменного голема': магический свиток заклинания, сердце каменного голема.");
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		PLAYER_TALENT_RUNES_28 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_MediumHeal,1);
		AI_Print("Обучен изготовлению руны - 'Очищающий свет'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Очищающий свет': магический свиток заклинания, противоядие, святая вода. ");
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		PLAYER_TALENT_RUNES_36 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_HarmUndead,1);
		AI_Print("Обучен изготовлению руны - 'Уничтожение нежити'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Уничтожение нежити': магический свиток заклинания, святая вода. ");
	};
	if(spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		PLAYER_TALENT_RUNES_41 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_FullHeal,1);
		AI_Print("Обучен изготовлению руны - 'Прилив бодрости'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Прилив бодрости': магический свиток заклинания, серафис, ледяной кварц, болотник.");
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		PLAYER_TALENT_RUNES_19 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firebolt,1);
		AI_Print("Обучен изготовлению руны - 'Огненная стрела'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненная стрела': магический свиток заклинания, сера.");
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		PLAYER_TALENT_RUNES_23 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_InstantFireball,1);
		AI_Print("Обучен изготовлению руны - 'Огненный шар'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненный шар': магический свиток заклинания, смола.");
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		PLAYER_TALENT_RUNES_38 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firestorm,1);
		AI_Print("Обучен изготовлению руны - 'Огненная буря'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненная буря': магический свиток заклинания, сера и смола.");
	};
	if(spell == SPL_SUMMONFIREGOLEM)
	{
		PLAYER_TALENT_RUNES[80] = TRUE;
		PLAYER_TALENT_RUNES_80 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itsc_sumfiregol,1);
		AI_Print("Обучен изготовлению руны - 'Призыв огненного голема'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв огненного голема': магический свиток заклинания, сердце огненного голема, огненный язык и сера.");
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		PLAYER_TALENT_RUNES_30 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_ChargeFireBall,1);
		AI_Print("Обучен изготовлению руны - 'Большой огненный шар'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Большой огненный шар': магический свиток заклинания, сера и смола.");
	};
	if(spell == SPL_FIRELIGHT)
	{
		PLAYER_TALENT_RUNES[93] = TRUE;
		PLAYER_TALENT_RUNES_93 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_firelight,1);
		AI_Print("Обучен изготовлению руны - 'Покров огня'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Покров огня': магическая формула заклинания, смола, огненный язык, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		PLAYER_TALENT_RUNES_37 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Pyrokinesis,1);
		AI_Print("Обучен изготовлению руны - 'Огненный шторм'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненный шторм': магический свиток заклинания, сера и огненный язык.");
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		PLAYER_TALENT_RUNES_42 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firerain,1);
		AI_Print("Обучен изготовлению руны - 'Огненный дождь'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненный дождь': магический свиток заклинания, смола, сера и огненный язык.");
	};
	if(spell == SPL_FireMeteor)
	{
		PLAYER_TALENT_RUNES[SPL_FireMeteor] = TRUE;
		PLAYER_TALENT_RUNES_103 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_FireMeteor,1);
		AI_Print("Обучен изготовлению руны - 'Метеорит'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Метеорит': магическая формула заклинания, сера, смола, горный хрусталь и огненный язык.");
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		PLAYER_TALENT_RUNES_24 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Zap,1);
		AI_Print("Обучен изготовлению руны - 'Молния'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Молния': магический свиток заклинания, горный хрусталь.");
	};
	if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		PLAYER_TALENT_RUNES_73 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icelance,1);
		AI_Print("Обучен изготовлению руны - 'Ледяное копье'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяное копье': магический свиток заклинания, ледяной кварц и горный хрусталь.");
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		PLAYER_TALENT_RUNES_20 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icebolt,1);
		AI_Print("Обучен изготовлению руны - 'Ледяная стрела'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяная стрела': магический свиток заклинания, ледяной кварц.");
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		PLAYER_TALENT_RUNES_33 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceCube,1);
		AI_Print("Обучен изготовлению руны - 'Ледяная глыба'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяная глыба': магический свиток заклинания, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		PLAYER_TALENT_RUNES_34 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_ThunderBall,1);
		AI_Print("Обучен изготовлению руны - 'Шаровая молния'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Шаровая молния': магический свиток заклинания, сера и горный хрусталь.");
	};
	if(spell == SPL_SUMMONSHOAL)
	{
		PLAYER_TALENT_RUNES[98] = TRUE;
		PLAYER_TALENT_RUNES_98 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumshoal,1);
		AI_Print("Обучен изготовлению руны - 'Призыв снежной стаи'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв снежной стаи': магический свиток заклинания, три шкуры снежного волка и ледяной кварц.");
	};
	if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		PLAYER_TALENT_RUNES_72 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Waterfist,1);
		AI_Print("Обучен изготовлению руны - 'Кулак воды'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Кулак воды': магический свиток заклинания, аквамарин и горный хрусталь.");
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		PLAYER_TALENT_RUNES_29 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_LightningFlash,1);
		AI_Print("Обучен изготовлению руны - 'Удар молнии'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Удар молнии': магический свиток заклинания, горный хрусталь и ледяной кварц.");
	};
	if(spell == SPL_SUMMONICEGOLEM)
	{
		PLAYER_TALENT_RUNES[89] = TRUE;
		PLAYER_TALENT_RUNES_89 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumicegol,1);
		AI_Print("Обучен изготовлению руны - 'Призыв ледяного голема'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв ледяного голема': магический свиток заклинания, сердце ледяного голема, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		PLAYER_TALENT_RUNES_39 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceWave,1);
		AI_Print("Обучен изготовлению руны - 'Ледяная волна'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяная волна': магический свиток заклинания, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		PLAYER_TALENT_RUNES_75 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Geyser,1);
		AI_Print("Обучен изготовлению руны - 'Гейзер'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Гейзер': магический свиток заклинания, аквамарин.");
	};
	if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		PLAYER_TALENT_RUNES_70 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Thunderstorm,1);
		AI_Print("Обучен изготовлению руны - 'Шторм'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Шторм': магический свиток заклинания, ледяной кварц и крыло.");
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		PLAYER_TALENT_RUNES_27 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Sleep,1);
		AI_Print("Обучен изготовлению руны - 'Сон'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Сон': магический свиток заклинания, болотник.");
	};
	if(spell == SPL_BERZERK)
	{
		PLAYER_TALENT_RUNES[95] = TRUE;
		PLAYER_TALENT_RUNES_95 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_berzerk,1);
		AI_Print("Обучен изготовлению руны - 'Копье Спящего'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Копье Спящего': магический свиток заклинания, болотник и ледяной кварц.");
	};
	if(spell == SPL_TELEKINESIS)
	{
		PLAYER_TALENT_RUNES[83] = TRUE;
		PLAYER_TALENT_RUNES_83 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_telekinesis,1);
		AI_Print("Обучен изготовлению руны - 'Поглощение духа'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Поглощение духа': магическая формула заклинания, смола, болотник, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		PLAYER_TALENT_RUNES_26 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Windfist,1);
		AI_Print("Обучен изготовлению руны - 'Кулак ветра'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Кулак ветра': магический свиток заклинания, уголь.");
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		PLAYER_TALENT_RUNES_32 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Fear,1);
		AI_Print("Обучен изготовлению руны - 'Страх'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Страх': магический свиток заклинания, черный жемчуг.");
	};
	if(spell == SPL_Charm)
	{
		PLAYER_TALENT_RUNES[SPL_Charm] = TRUE;
		PLAYER_TALENT_RUNES_59 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Charm,1);
		AI_Print("Обучен изготовлению руны - 'Забвение'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Забвение': магический свиток заклинания, аквамарин и ледяной кварц.");
	};
	if(spell == SPL_GreenTentacle)
	{
		PLAYER_TALENT_RUNES[SPL_GreenTentacle] = TRUE;
		PLAYER_TALENT_RUNES_82 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_greententacle,1);
		AI_Print("Обучен изготовлению руны - 'Опутать корнями'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Опутать корнями': магический свиток заклинания, смола и болотник.");
	};
	if(spell == SPL_SUMMONSWAMPGOLEM)
	{
		PLAYER_TALENT_RUNES[100] = TRUE;
		PLAYER_TALENT_RUNES_100 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_sumswpgol,1);
		AI_Print("Обучен изготовлению руны - 'Призыв болотного голема'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв болотного голема': магический свиток заклинания, сердце болотного голема, три стебля болотной травы.");
	};
	if(spell == SPL_SEVEREFETIDITY)
	{
		PLAYER_TALENT_RUNES[96] = TRUE;
		PLAYER_TALENT_RUNES_96 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_severefetidity,1);
		AI_Print("Обучен изготовлению руны - 'Ужасное зловоние'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ужасное зловоние': магический свиток заклинания, болотник, сера и уголь.");
	};
	if(spell == SPL_CONTROL)
	{
		PLAYER_TALENT_RUNES[94] = TRUE;
		PLAYER_TALENT_RUNES_94 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_control,1);
		AI_Print("Обучен изготовлению руны - 'Гипноз'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Гипноз': магическая формула заклинания, болотник, уголь и черный жемчуг.");
	};
	if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		PLAYER_TALENT_RUNES_71 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Whirlwind,1);
		AI_Print("Обучен изготовлению руны - 'Смерч'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Смерч': магический свиток заклинания, крыло кровавого шершня, болотник и ледяной кварц.");
	};
	if(spell == SPL_Deathbolt)
	{
		PLAYER_TALENT_RUNES[SPL_Deathbolt] = TRUE;
		PLAYER_TALENT_RUNES_61 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathbolt,1);
		AI_Print("Обучен изготовлению руны - 'Стрела мрака'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Стрела мрака': магический свиток заклинания, черный жемчуг.");
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_22 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumGobSkel,1);
		AI_Print("Обучен изготовлению руны - 'Призыв скелета'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв скелета': магический свиток заклинания, кость скелета. ");
	};
	if(spell == SPL_ManaForLife)
	{
		PLAYER_TALENT_RUNES[SPL_ManaForLife] = TRUE;
		PLAYER_TALENT_RUNES_86 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_ManaForLife,1);
		AI_Print("Обучен изготовлению руны - 'Раздирание души'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Раздирание души': магический свиток заклинания, сера и смола.");
	};
	if(spell == SPL_SummonZombie)
	{
		PLAYER_TALENT_RUNES[SPL_SummonZombie] = TRUE;
		PLAYER_TALENT_RUNES_88 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_sumzombie,1);
		AI_Print("Обучен изготовлению руны - 'Призыв зомби'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв зомби': магический свиток заклинания, уголь, мертвая плоть.");
	};
	if(spell == SPL_Swarm)
	{
		PLAYER_TALENT_RUNES[SPL_Swarm] = TRUE;
		PLAYER_TALENT_RUNES_81 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_swarm,1);
		AI_Print("Обучен изготовлению руны - 'Рой'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Рой': магический свиток заклинания, аквамарин, болотник и смола.");
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_31 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumSkel,1);
		AI_Print("Обучен изготовлению руны - 'Призыв скелета-воина'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв скелета-воина': магический свиток заклинания, кость скелета и черный жемчуг. ");
	};
	if(spell == SPL_Energyball)
	{
		PLAYER_TALENT_RUNES[SPL_Energyball] = TRUE;
		PLAYER_TALENT_RUNES_85 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_energyball,1);
		AI_Print("Обучен изготовлению руны - 'Копье тьмы'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Копье тьмы': магический свиток заклинания, черный жемчуг, ледяной кварц, горный хрусталь и сера.");
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		PLAYER_TALENT_RUNES_40 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumDemon,1);
		AI_Print("Обучен изготовлению руны - 'Призыв демона'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв демона': магический свиток заклинания, высший рунный камень, сердце демона, две серы, три смолы, уголь, три черных жемчужины.");
	};
	if(spell == SPL_Deathball)
	{
		PLAYER_TALENT_RUNES[SPL_Deathball] = TRUE;
		PLAYER_TALENT_RUNES_62 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathball,1);
		AI_Print("Обучен изготовлению руны - 'Шар смерти'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Шар смерти': магический свиток заклинания, огненный язык, сера и смола.");
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		PLAYER_TALENT_RUNES_45 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_ArmyOfDarkness,1);
		AI_Print("Обучен изготовлению руны - 'Армия тьмы'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Армия тьмы': магический свиток заклинания, кость скелета, черный жемчуг, сердце каменного голема и сердце демона. ");
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		PLAYER_TALENT_RUNES_44 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_MassDeath,1);
		AI_Print("Обучен изготовлению руны - 'Черный туман'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Черный туман': магический свиток заклинания, кость скелета, эктоплазма и черный жемчуг. ");
	};
	if(spell == SPL_Skull)
	{
		PLAYER_TALENT_RUNES[SPL_Skull] = TRUE;
		PLAYER_TALENT_RUNES_87 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_skull,1);
		AI_Print("Обучен изготовлению руны - 'Крик мертвых'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Крик мертвых': магический свиток заклинания, черный жемчуг, сердце демона, череп, смола и сера.");
	};
	if(spell == SPL_GuruWrath)
	{
		PLAYER_TALENT_RUNES[SPL_GuruWrath] = TRUE;
		PLAYER_TALENT_RUNES_104 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_GuruWrath,1);
		AI_Print("Обучен изготовлению руны - 'Гнев стихий'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Гнев стихий': магическая формула заклинания и сердца четырех големов различных стихий.");
	};
	if(spell == SPL_RapidFirebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidFirebolt] = TRUE;
		PLAYER_TALENT_RUNES_107 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_RapidFirebolt,1);
		AI_Print("Обучен изготовлению руны - 'Огненная вспышка'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненная вспышка': магический свиток заклинания, сера, смола.");
	};
	if(spell == SPL_MagicCage)
	{
		PLAYER_TALENT_RUNES[SPL_MagicCage] = TRUE;
		PLAYER_TALENT_RUNES_111 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_MagicCage,1);
		AI_Print("Обучен изготовлению руны - 'Огненная клетка'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненная клетка': магический свиток заклинания, сера, смола, огненный язык .");
	};
	if(spell == SPL_Explosion)
	{
		PLAYER_TALENT_RUNES[SPL_Explosion] = TRUE;
		PLAYER_TALENT_RUNES_114 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Explosion,1);
		AI_Print("Обучен изготовлению руны - 'Огненный взрыв'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненный взрыв': магический свиток заклинания, сера, смола, огненный язык и аквамарин.");
	};
	if(spell == SPL_RapidIcebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidIcebolt] = TRUE;
		PLAYER_TALENT_RUNES_108 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_RapidIcebolt,1);
		AI_Print("Обучен изготовлению руны - 'Ледяная вспышка'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяная вспышка': магический свиток заклинания, горный хрусталь и ледяной кварц.");
	};
	if(spell == SPL_AdanosBall)
	{
		PLAYER_TALENT_RUNES[SPL_AdanosBall] = TRUE;
		PLAYER_TALENT_RUNES_116 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_AdanosBall,1);
		AI_Print("Обучен изготовлению руны - 'Длань Хаоса'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Длань Хаоса': магический свиток заклинания, горный хрусталь, черный жемчуг, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_Rage)
	{
		PLAYER_TALENT_RUNES[SPL_Rage] = TRUE;
		PLAYER_TALENT_RUNES_109 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Rage,1);
		AI_Print("Обучен изготовлению руны - 'Одержимость'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Одержимость': магический свиток заклинания, кость скелета, эктоплазма, сера и смола.");
	};
	if(spell == SPL_Lacerate)
	{
		PLAYER_TALENT_RUNES[SPL_Lacerate] = TRUE;
		PLAYER_TALENT_RUNES_112 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Lacerate,1);
		AI_Print("Обучен изготовлению руны - 'Истощение'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Истощение': магический свиток заклинания, кость скелета, сера, горный хрусталь и ледяной кварц.");
	};
	if(spell == SPL_Extricate)
	{
		PLAYER_TALENT_RUNES[SPL_Extricate] = TRUE;
		PLAYER_TALENT_RUNES_113 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Extricate,1);
		AI_Print("Обучен изготовлению руны - 'Ударная волна'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ударная волна': магический свиток заклинания, крыло кровавого шершня, болотник, черный жемчуг, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_Elevate)
	{
		PLAYER_TALENT_RUNES[SPL_Elevate] = TRUE;
		PLAYER_TALENT_RUNES_115 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Elevate,1);
		AI_Print("Обучен изготовлению руны - 'Возвышение'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Возвышение': магический свиток заклинания, болотник, сера, уголь, черный жемчуг, ледяной кварц и смола.");
	};
	if(spell == SPL_Acid)
	{
		PLAYER_TALENT_RUNES[SPL_Acid] = TRUE;
		PLAYER_TALENT_RUNES_117 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Acid,1);
		CreateInvItems(scrolltrader_gur,ITPO_POISON,1);
		AI_Print("Обучен изготовлению руны - 'Ядовитый укус'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ядовитый укус': магический свиток заклинания, кость скелета, болотник, черный жемчуг, яд и смола.");
	};
	if(spell == SPL_Quake)
	{
		PLAYER_TALENT_RUNES[SPL_Quake] = TRUE;
		PLAYER_TALENT_RUNES_110 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Quake,1);
		AI_Print("Обучен изготовлению руны - 'Землетрясение'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Землетрясение': магический свиток заклинания, черный жемчуг, сердце каменного голема, болотник, черный жемчуг, аквамарин и смола.");
	};

	if(TalentCount_Rune[0] > 100)
	{
		TalentCount_Rune[0] = 100;
	};
	if(TalentCount_Rune[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,4);
	}
	else if(TalentCount_Rune[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,3);
	}
	else if(TalentCount_Rune[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_RUNES,TalentCount_Rune[0]);		
	Snd_Play("LevelUP");

	if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
	{
		ATR_INTELLECT = ATR_INTELLECT + 1;
		Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
	};

	return TRUE;
};

func int b_teachplayertalentrunesguardians(var C_Npc slf,var C_Npc oth,var int spell)
{
	var int kosten;
	var int tempRuneSkill;
	var C_Npc scrolltrader_kdf;
	var C_Npc scrolltrader_kdw;
	var C_Npc scrolltrader_gur;
	var C_Npc scrolltrader_dmt;
	var C_Npc scrolltrader_prm;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_RUNES,spell);

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		return FALSE;
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + kosten;
	Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
	B_LogEntry(TOPIC_TalentRunes,"Для создания магической руны, кроме необходимого заклинания, мне еще понадобятся некоторые составляющие. С помощью этих составляющих и рунического камня определенного типа я могу создать на руническом столе необходимую мне руну. Для создания рун первого и второго круга необходимы обычные рунные камни, для рун третьего и четвертого круга - старшие рунные камни, для рун пятого и шестого кругов - высшие рунные камни. Сами рунные камни можно сделать на руническом столе из кусков рунического камня. Однако где его добывать мне неизвестно.");

	if(Npc_IsDead(Gorax) == FALSE)
	{
		scrolltrader_kdf = Hlp_GetNpc(Gorax);
	}
	else if(Npc_IsDead(Isgaroth) == FALSE)
	{
		scrolltrader_kdf = Hlp_GetNpc(Isgaroth);
	};
	if(Npc_IsDead(Cronos_ADW) == FALSE)
	{
		scrolltrader_kdw = Hlp_GetNpc(Cronos_ADW);
	};
	if(Npc_IsDead(baaltyon) == FALSE)
	{
		scrolltrader_gur = Hlp_GetNpc(baaltyon);
	};
	if(Npc_IsDead(Xardas) == FALSE)
	{
		scrolltrader_dmt = Hlp_GetNpc(Xardas);
	};
	if(Npc_IsDead(vlk_6027_taliasan) == FALSE)
	{
		scrolltrader_prm = Hlp_GetNpc(vlk_6027_taliasan);
	};
	if(spell == SPL_PalLight)
	{
		PLAYER_TALENT_RUNES[SPL_PalLight] = TRUE;
	};
	if(spell == SPL_PalLightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalLightHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalLightHeal,1);
	};
	if(spell == SPL_PalHolyBolt)
	{
		PLAYER_TALENT_RUNES[SPL_PalHolyBolt] = TRUE;
		CreateInvItems(hero,ItRu_PalHolyBolt,1);
	};
	if(spell == SPL_PalMediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalMediumHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalMediumHeal,1);
	};
	if(spell == SPL_PalRepelEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalRepelEvil] = TRUE;
		CreateInvItems(hero,ItRu_PalRepelEvil,1);
	};
	if(spell == SPL_PalFullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_PalFullHeal] = TRUE;
		CreateInvItems(hero,ItRu_PalFullHeal,1);
	};
	if(spell == SPL_PalDestroyEvil)
	{
		PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] = TRUE;
		CreateInvItems(hero,ItRu_PalDestroyEvil,1);
	};
	if(spell == SPL_PalTeleportSecret)
	{
		PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
	};
	if(spell == SPL_TeleportSeaport)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportSeaport] = TRUE;
	};
	if(spell == SPL_TeleportMonastery)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportMonastery] = TRUE;
	};
	if(spell == SPL_TeleportFarm)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportFarm] = TRUE;
	};
	if(spell == SPL_TeleportXardas)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportXardas] = TRUE;
	};
	if(spell == SPL_TeleportPassNW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassNW] = TRUE;
	};
	if(spell == SPL_SummonCrait)
	{
		PLAYER_TALENT_RUNES[97] = TRUE;
	};
	if(spell == SPL_TeleportPassOW)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportPassOW] = TRUE;
	};
	if(spell == SPL_TELEPORTDAGOT)
	{
		PLAYER_TALENT_RUNES[90] = TRUE;
	};
	if(spell == SPL_TeleportOC)
	{
		PLAYER_TALENT_RUNES[SPL_TeleportOC] = TRUE;
	};
	if(spell == SPL_Light)
	{
		PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
		PLAYER_TALENT_RUNES_18 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Light,1);
		AI_Print("Обучен изготовлению руны - 'Свет'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Свет': магический свиток заклинания, золотая монета. ");
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		PLAYER_TALENT_RUNES_21 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_LightHeal,1);
		AI_Print("Обучен изготовлению руны - 'Исцеление'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Исцеление': магический свиток заклинания, лечебный корень. ");
	};
	if(spell == SPL_UnlockChest)
	{
		PLAYER_TALENT_RUNES[SPL_UnlockChest] = TRUE;
		PLAYER_TALENT_RUNES_99 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Unlock,1);
		AI_Print("Обучен изготовлению руны - 'Магический взлом'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Магический взлом': магический свиток заклинания, отмычка.");
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		PLAYER_TALENT_RUNES_25 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumWolf,1);
		AI_Print("Обучен изготовлению руны - 'Призыв варга'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв варга': магический свиток заклинания, шкура варга.");
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		PLAYER_TALENT_RUNES_35 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumGol,1);
		AI_Print("Обучен изготовлению руны - 'Призыв каменного голема'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв каменного голема': магический свиток заклинания, сердце каменного голема.");
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		PLAYER_TALENT_RUNES_28 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_MediumHeal,1);
		AI_Print("Обучен изготовлению руны - 'Очищающий свет'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Очищающий свет': магический свиток заклинания, противоядие, святая вода. ");
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		PLAYER_TALENT_RUNES_36 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_HarmUndead,1);
		AI_Print("Обучен изготовлению руны - 'Уничтожение нежити'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Уничтожение нежити': магический свиток заклинания, святая вода. ");
	};
	if(spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		PLAYER_TALENT_RUNES_41 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_FullHeal,1);
		AI_Print("Обучен изготовлению руны - 'Прилив бодрости'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Прилив бодрости': магический свиток заклинания, серафис, ледяной кварц, болотник.");
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		PLAYER_TALENT_RUNES_19 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firebolt,1);
		AI_Print("Обучен изготовлению руны - 'Огненная стрела'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненная стрела': магический свиток заклинания, сера.");
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		PLAYER_TALENT_RUNES_23 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_InstantFireball,1);
		AI_Print("Обучен изготовлению руны - 'Огненный шар'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненный шар': магический свиток заклинания, смола.");
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		PLAYER_TALENT_RUNES_38 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firestorm,1);
		AI_Print("Обучен изготовлению руны - 'Огненная буря'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненная буря': магический свиток заклинания, сера и смола.");
	};
	if(spell == SPL_SUMMONFIREGOLEM)
	{
		PLAYER_TALENT_RUNES[80] = TRUE;
		PLAYER_TALENT_RUNES_80 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itsc_sumfiregol,1);
		AI_Print("Обучен изготовлению руны - 'Призыв огненного голема'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв огненного голема': магический свиток заклинания, сердце огненного голема, огненный язык и сера.");
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		PLAYER_TALENT_RUNES_30 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_ChargeFireBall,1);
		AI_Print("Обучен изготовлению руны - 'Большой огненный шар'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Большой огненный шар': магический свиток заклинания, сера и смола.");
	};
	if(spell == SPL_FIRELIGHT)
	{
		PLAYER_TALENT_RUNES[93] = TRUE;
		PLAYER_TALENT_RUNES_93 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_firelight,1);
		AI_Print("Обучен изготовлению руны - 'Покров огня'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Покров огня': магическая формула заклинания, смола, огненный язык, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		PLAYER_TALENT_RUNES_37 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Pyrokinesis,1);
		AI_Print("Обучен изготовлению руны - 'Огненный шторм'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненный шторм': магический свиток заклинания, сера и огненный язык.");
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		PLAYER_TALENT_RUNES_42 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firerain,1);
		AI_Print("Обучен изготовлению руны - 'Огненный дождь'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненный дождь': магический свиток заклинания, смола, сера и огненный язык.");
	};
	if(spell == SPL_FireMeteor)
	{
		PLAYER_TALENT_RUNES[SPL_FireMeteor] = TRUE;
		PLAYER_TALENT_RUNES_103 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_FireMeteor,1);
		AI_Print("Обучен изготовлению руны - 'Метеорит'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Метеорит': магическая формула заклинания, сера, смола, горный хрусталь и огненный язык.");
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		PLAYER_TALENT_RUNES_24 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Zap,1);
		AI_Print("Обучен изготовлению руны - 'Молния'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Молния': магический свиток заклинания, горный хрусталь.");
	};
	if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		PLAYER_TALENT_RUNES_73 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icelance,1);
		AI_Print("Обучен изготовлению руны - 'Ледяное копье'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяное копье': магический свиток заклинания, ледяной кварц и горный хрусталь.");
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		PLAYER_TALENT_RUNES_20 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icebolt,1);
		AI_Print("Обучен изготовлению руны - 'Ледяная стрела'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяная стрела': магический свиток заклинания, ледяной кварц.");
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		PLAYER_TALENT_RUNES_33 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceCube,1);
		AI_Print("Обучен изготовлению руны - 'Ледяная глыба'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяная глыба': магический свиток заклинания, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		PLAYER_TALENT_RUNES_34 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_ThunderBall,1);
		AI_Print("Обучен изготовлению руны - 'Шаровая молния'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Шаровая молния': магический свиток заклинания, сера и горный хрусталь.");
	};
	if(spell == SPL_SUMMONSHOAL)
	{
		PLAYER_TALENT_RUNES[98] = TRUE;
		PLAYER_TALENT_RUNES_98 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumshoal,1);
		AI_Print("Обучен изготовлению руны - 'Призыв снежной стаи'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв снежной стаи': магический свиток заклинания, три шкуры снежного волка и ледяной кварц.");
	};
	if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		PLAYER_TALENT_RUNES_72 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Waterfist,1);
		AI_Print("Обучен изготовлению руны - 'Кулак воды'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Кулак воды': магический свиток заклинания, аквамарин и горный хрусталь.");
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		PLAYER_TALENT_RUNES_29 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_LightningFlash,1);
		AI_Print("Обучен изготовлению руны - 'Удар молнии'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Удар молнии': магический свиток заклинания, горный хрусталь и ледяной кварц.");
	};
	if(spell == SPL_SUMMONICEGOLEM)
	{
		PLAYER_TALENT_RUNES[89] = TRUE;
		PLAYER_TALENT_RUNES_89 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumicegol,1);
		AI_Print("Обучен изготовлению руны - 'Призыв ледяного голема'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв ледяного голема': магический свиток заклинания, сердце ледяного голема, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		PLAYER_TALENT_RUNES_39 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceWave,1);
		AI_Print("Обучен изготовлению руны - 'Ледяная волна'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяная волна': магический свиток заклинания, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		PLAYER_TALENT_RUNES_75 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Geyser,1);
		AI_Print("Обучен изготовлению руны - 'Гейзер'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Гейзер': магический свиток заклинания, аквамарин.");
	};
	if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		PLAYER_TALENT_RUNES_70 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Thunderstorm,1);
		AI_Print("Обучен изготовлению руны - 'Шторм'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Шторм': магический свиток заклинания, ледяной кварц и крыло.");
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		PLAYER_TALENT_RUNES_27 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Sleep,1);
		AI_Print("Обучен изготовлению руны - 'Сон'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Сон': магический свиток заклинания, болотник.");
	};
	if(spell == SPL_BERZERK)
	{
		PLAYER_TALENT_RUNES[95] = TRUE;
		PLAYER_TALENT_RUNES_95 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_berzerk,1);
		AI_Print("Обучен изготовлению руны - 'Копье Спящего'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Копье Спящего': магический свиток заклинания, болотник и ледяной кварц.");
	};
	if(spell == SPL_TELEKINESIS)
	{
		PLAYER_TALENT_RUNES[83] = TRUE;
		PLAYER_TALENT_RUNES_83 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_telekinesis,1);
		AI_Print("Обучен изготовлению руны - 'Поглощение духа'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Поглощение духа': магическая формула заклинания, смола, болотник, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		PLAYER_TALENT_RUNES_26 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Windfist,1);
		AI_Print("Обучен изготовлению руны - 'Кулак ветра'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Кулак ветра': магический свиток заклинания, уголь.");
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		PLAYER_TALENT_RUNES_32 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Fear,1);
		AI_Print("Обучен изготовлению руны - 'Страх'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Страх': магический свиток заклинания, черный жемчуг.");
	};
	if(spell == SPL_Charm)
	{
		PLAYER_TALENT_RUNES[SPL_Charm] = TRUE;
		PLAYER_TALENT_RUNES_59 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Charm,1);
		AI_Print("Обучен изготовлению руны - 'Забвение'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Забвение': магический свиток заклинания, аквамарин и ледяной кварц.");
	};
	if(spell == SPL_GreenTentacle)
	{
		PLAYER_TALENT_RUNES[SPL_GreenTentacle] = TRUE;
		PLAYER_TALENT_RUNES_82 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_greententacle,1);
		AI_Print("Обучен изготовлению руны - 'Опутать корнями'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Опутать корнями': магический свиток заклинания, смола и болотник.");
	};
	if(spell == SPL_SUMMONSWAMPGOLEM)
	{
		PLAYER_TALENT_RUNES[100] = TRUE;
		PLAYER_TALENT_RUNES_100 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_sumswpgol,1);
		AI_Print("Обучен изготовлению руны - 'Призыв болотного голема'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв болотного голема': магический свиток заклинания, сердце болотного голема, три стебля болотной травы.");
	};
	if(spell == SPL_SEVEREFETIDITY)
	{
		PLAYER_TALENT_RUNES[96] = TRUE;
		PLAYER_TALENT_RUNES_96 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_severefetidity,1);
		AI_Print("Обучен изготовлению руны - 'Ужасное зловоние'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ужасное зловоние': магический свиток заклинания, болотник, сера и уголь.");
	};
	if(spell == SPL_CONTROL)
	{
		PLAYER_TALENT_RUNES[94] = TRUE;
		PLAYER_TALENT_RUNES_94 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_control,1);
		AI_Print("Обучен изготовлению руны - 'Гипноз'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Гипноз': магическая формула заклинания, болотник, уголь и черный жемчуг.");
	};
	if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		PLAYER_TALENT_RUNES_71 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Whirlwind,1);
		AI_Print("Обучен изготовлению руны - 'Смерч'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Смерч': магический свиток заклинания, крыло кровавого шершня, болотник и ледяной кварц.");
	};
	if(spell == SPL_Deathbolt)
	{
		PLAYER_TALENT_RUNES[SPL_Deathbolt] = TRUE;
		PLAYER_TALENT_RUNES_61 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathbolt,1);
		AI_Print("Обучен изготовлению руны - 'Стрела мрака'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Стрела мрака': магический свиток заклинания, черный жемчуг.");
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_22 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumGobSkel,1);
		AI_Print("Обучен изготовлению руны - 'Призыв скелета'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв скелета': магический свиток заклинания, кость скелета. ");
	};
	if(spell == SPL_ManaForLife)
	{
		PLAYER_TALENT_RUNES[SPL_ManaForLife] = TRUE;
		PLAYER_TALENT_RUNES_86 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_ManaForLife,1);
		AI_Print("Обучен изготовлению руны - 'Раздирание души'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Раздирание души': магический свиток заклинания, сера и смола.");
	};
	if(spell == SPL_SummonZombie)
	{
		PLAYER_TALENT_RUNES[SPL_SummonZombie] = TRUE;
		PLAYER_TALENT_RUNES_88 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_sumzombie,1);
		AI_Print("Обучен изготовлению руны - 'Призыв зомби'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв зомби': магический свиток заклинания, уголь, мертвая плоть.");
	};
	if(spell == SPL_Swarm)
	{
		PLAYER_TALENT_RUNES[SPL_Swarm] = TRUE;
		PLAYER_TALENT_RUNES_81 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_swarm,1);
		AI_Print("Обучен изготовлению руны - 'Рой'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Рой': магический свиток заклинания, аквамарин, болотник и смола.");
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_31 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumSkel,1);
		AI_Print("Обучен изготовлению руны - 'Призыв скелета-воина'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв скелета-воина': магический свиток заклинания, кость скелета и черный жемчуг. ");
	};
	if(spell == SPL_Energyball)
	{
		PLAYER_TALENT_RUNES[SPL_Energyball] = TRUE;
		PLAYER_TALENT_RUNES_85 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_energyball,1);
		AI_Print("Обучен изготовлению руны - 'Копье тьмы'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Копье тьмы': магический свиток заклинания, черный жемчуг, ледяной кварц, горный хрусталь и сера.");
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		PLAYER_TALENT_RUNES_40 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumDemon,1);
		AI_Print("Обучен изготовлению руны - 'Призыв демона'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Призыв демона': магический свиток заклинания, высший рунный камень, сердце демона, две серы, три смолы, уголь, три черных жемчужины.");
	};
	if(spell == SPL_Deathball)
	{
		PLAYER_TALENT_RUNES[SPL_Deathball] = TRUE;
		PLAYER_TALENT_RUNES_62 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathball,1);
		AI_Print("Обучен изготовлению руны - 'Шар смерти'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Шар смерти': магический свиток заклинания, огненный язык, сера и смола.");
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		PLAYER_TALENT_RUNES_45 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_ArmyOfDarkness,1);
		AI_Print("Обучен изготовлению руны - 'Армия тьмы'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Армия тьмы': магический свиток заклинания, кость скелета, черный жемчуг, сердце каменного голема и сердце демона. ");
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		PLAYER_TALENT_RUNES_44 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_MassDeath,1);
		AI_Print("Обучен изготовлению руны - 'Черный туман'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Черный туман': магический свиток заклинания, кость скелета, эктоплазма и черный жемчуг. ");
	};
	if(spell == SPL_Skull)
	{
		PLAYER_TALENT_RUNES[SPL_Skull] = TRUE;
		PLAYER_TALENT_RUNES_87 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_skull,1);
		AI_Print("Обучен изготовлению руны - 'Крик мертвых'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Крик мертвых': магический свиток заклинания, черный жемчуг, сердце демона, череп, смола и сера.");
	};
	if(spell == SPL_GuruWrath)
	{
		PLAYER_TALENT_RUNES[SPL_GuruWrath] = TRUE;
		PLAYER_TALENT_RUNES_104 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_GuruWrath,1);
		AI_Print("Обучен изготовлению руны - 'Гнев стихий'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Гнев стихий': магическая формула заклинания и сердца четырех големов различных стихий.");
	};
	if(spell == SPL_RapidFirebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidFirebolt] = TRUE;
		PLAYER_TALENT_RUNES_107 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_RapidFirebolt,1);
		AI_Print("Обучен изготовлению руны - 'Огненная вспышка'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненная вспышка': магический свиток заклинания, сера, смола.");
	};
	if(spell == SPL_MagicCage)
	{
		PLAYER_TALENT_RUNES[SPL_MagicCage] = TRUE;
		PLAYER_TALENT_RUNES_111 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_MagicCage,1);
		AI_Print("Обучен изготовлению руны - 'Огненная клетка'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненная клетка': магический свиток заклинания, сера, смола, огненный язык .");
	};
	if(spell == SPL_Explosion)
	{
		PLAYER_TALENT_RUNES[SPL_Explosion] = TRUE;
		PLAYER_TALENT_RUNES_114 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Explosion,1);
		AI_Print("Обучен изготовлению руны - 'Огненный взрыв'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Огненный взрыв': магический свиток заклинания, сера, смола, огненный язык и аквамарин.");
	};
	if(spell == SPL_RapidIcebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidIcebolt] = TRUE;
		PLAYER_TALENT_RUNES_108 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_RapidIcebolt,1);
		AI_Print("Обучен изготовлению руны - 'Ледяная вспышка'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ледяная вспышка': магический свиток заклинания, горный хрусталь и ледяной кварц.");
	};
	if(spell == SPL_AdanosBall)
	{
		PLAYER_TALENT_RUNES[SPL_AdanosBall] = TRUE;
		PLAYER_TALENT_RUNES_116 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_AdanosBall,1);
		AI_Print("Обучен изготовлению руны - 'Длань Хаоса'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Длань Хаоса': магический свиток заклинания, горный хрусталь, черный жемчуг, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_Rage)
	{
		PLAYER_TALENT_RUNES[SPL_Rage] = TRUE;
		PLAYER_TALENT_RUNES_109 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Rage,1);
		AI_Print("Обучен изготовлению руны - 'Одержимость'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Одержимость': магический свиток заклинания, кость скелета, эктоплазма, сера и смола.");
	};
	if(spell == SPL_Lacerate)
	{
		PLAYER_TALENT_RUNES[SPL_Lacerate] = TRUE;
		PLAYER_TALENT_RUNES_112 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Lacerate,1);
		AI_Print("Обучен изготовлению руны - 'Истощение'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Истощение': магический свиток заклинания, кость скелета, сера, горный хрусталь и ледяной кварц.");
	};
	if(spell == SPL_Extricate)
	{
		PLAYER_TALENT_RUNES[SPL_Extricate] = TRUE;
		PLAYER_TALENT_RUNES_113 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Extricate,1);
		AI_Print("Обучен изготовлению руны - 'Ударная волна'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ударная волна': магический свиток заклинания, крыло кровавого шершня, болотник, черный жемчуг, ледяной кварц и аквамарин.");
	};
	if(spell == SPL_Elevate)
	{
		PLAYER_TALENT_RUNES[SPL_Elevate] = TRUE;
		PLAYER_TALENT_RUNES_115 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Elevate,1);
		AI_Print("Обучен изготовлению руны - 'Возвышение'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Возвышение': магический свиток заклинания, болотник, сера, уголь, черный жемчуг, ледяной кварц и смола.");
	};
	if(spell == SPL_Acid)
	{
		PLAYER_TALENT_RUNES[SPL_Acid] = TRUE;
		PLAYER_TALENT_RUNES_117 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Acid,1);
		AI_Print("Обучен изготовлению руны - 'Ядовитый укус'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Ядовитый укус': магический свиток заклинания, кость скелета, болотник, черный жемчуг, яд и смола.");
	};
	if(spell == SPL_Quake)
	{
		PLAYER_TALENT_RUNES[SPL_Quake] = TRUE;
		PLAYER_TALENT_RUNES_110 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Quake,1);
		AI_Print("Обучен изготовлению руны - 'Землетрясение'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие ингредиенты для изготовления руны 'Землетрясение': магический свиток заклинания, черный жемчуг, сердце каменного голема, болотник, черный жемчуг, аквамарин и смола.");
	};

	if(TalentCount_Rune[0] > 100)
	{
		TalentCount_Rune[0] = 100;
	};
	if(TalentCount_Rune[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,4);
	}
	else if(TalentCount_Rune[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,3);
	}
	else if(TalentCount_Rune[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_RUNES,TalentCount_Rune[0]);		
	Snd_Play("LevelUP");

	if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
	{
		ATR_INTELLECT = ATR_INTELLECT + 1;
		Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
	};

	return TRUE;
};

func void b_wispdetector_learneffect(var C_Npc teacher)
{
	AI_PlayAni(teacher,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_HealShrine",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
	Snd_Play("WSP_Dead_A1");
};

func int b_teachplayertalentwispdetector(var C_Npc slf,var C_Npc oth,var int wispskill,var int kosten)
{
	if(Npc_HasItems(hero,ItMi_Nugget) < kosten)
	{
		AI_PrintClr("У вас не хватает магической руды...",177,58,17);
		return FALSE;
	};

	Npc_RemoveInvItems(hero,ItMi_Nugget,kosten);

	if(wispskill == WISPSKILL_FF)
	{
		player_talent_wispdetector[WISPSKILL_FF] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_NONE)
	{
		player_talent_wispdetector[WISPSKILL_NONE] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_RUNE)
	{
		player_talent_wispdetector[WISPSKILL_RUNE] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_MAGIC)
	{
		player_talent_wispdetector[WISPSKILL_MAGIC] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_FOOD)
	{
		player_talent_wispdetector[WISPSKILL_FOOD] = TRUE;
		b_wispdetector_learneffect(slf);
	};
	if(wispskill == WISPSKILL_POTIONS)
	{
		player_talent_wispdetector[WISPSKILL_POTIONS] = TRUE;
		b_wispdetector_learneffect(slf);
	};

	AI_Print(PRINT_LearnWispDetector);
	return TRUE;
};