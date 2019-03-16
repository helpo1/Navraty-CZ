/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(2x) Npc_IsDead(Kreol) - přidán náhradní obchodník se svitky temné magie
(8x) opraven zápis do deníku (SPL_TELEKINESIS, SPL_AdanosBall, SPL_Extricate, SPL_Elevate)

*/




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
	B_LogEntry(TOPIC_TalentRunes,"K vytvoření magické runy potřebuji svitek příslušného kouzla a potřebné ingredience. S pomocí těchto ingrediencí a runového kamene určitého typu pak mohu na runovém stole vytvářet runy. K vytvoření run prvního a druhého kruhu stačí obyčejné runové kameny, třetí a čtvrtý kruh vyžadují starší runové kameny a pro runy pátého a šestého kruhu jsou potřeba vyšší runové kameny. Samotné runové kameny mohu vytvářet na runovém stolu z úlomků. Nevím však, kde je získat.");

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
	}
	else if(Npc_IsDead(Kreol) == FALSE)
	{
		scrolltrader_dmt = Hlp_GetNpc(Kreol);		
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
		AI_Print("Naučeno: Tvorba run - 'Světlo'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy SVĚTLO: svitek kouzla a zlatá mince.");
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		PLAYER_TALENT_RUNES_21 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_LightHeal,1);
		AI_Print("Naučeno: Tvorba run - 'Léčení'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LÉČENÍ: svitek kouzla a léčivý kořen.");
	};
	if(spell == SPL_UnlockChest)
	{
		PLAYER_TALENT_RUNES[SPL_UnlockChest] = TRUE;
		PLAYER_TALENT_RUNES_99 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Unlock,1);
		AI_Print("Naučeno: Tvorba run - 'Požírač zámků'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy POŽÍRAČ ZÁMKŮ: svitek kouzla a paklíč.");
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		PLAYER_TALENT_RUNES_25 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumWolf,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání warga'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ WARGA: svitek kouzla a kůže warga.");
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		PLAYER_TALENT_RUNES_35 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumGol,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání kamenného golema'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ KAMENNÉHO GOLEMA: svitek kouzla a srdce kamenného golema.");
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		PLAYER_TALENT_RUNES_28 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_MediumHeal,1);
		AI_Print("Naučeno: Tvorba run - 'Očisťující světlo'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OČISŤUJÍCÍ SVĚTLO: svitek kouzla, protijed a svěcená voda.");
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		PLAYER_TALENT_RUNES_36 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_HarmUndead,1);
		AI_Print("Naučeno: Tvorba run - 'Zničení nemrtvého'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ZNIČENÍ NEMRTVÉHO: svitek kouzla a svěcená voda.");
	};
	if(spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		PLAYER_TALENT_RUNES_41 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_FullHeal,1);
		AI_Print("Naučeno: Tvorba run - 'Příliv čilosti'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy PŘÍLIV ČILOSTI: svitek kouzla, modrý bez, křemen a tráva z bažin.");
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		PLAYER_TALENT_RUNES_19 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firebolt,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý šíp'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ ŠÍP: svitek kouzla a síra.");
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		PLAYER_TALENT_RUNES_23 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_InstantFireball,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivá koule'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÁ KOULE: svitek kouzla a pryskyřice.");
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		PLAYER_TALENT_RUNES_38 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firestorm,1);
		AI_Print("Naučeno: Tvorba run - 'Malá ohnivá bouře'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy MALÁ OHNIVÁ BOUŘE: svitek kouzla, síra a pryskyřice.");
	};
	if(spell == SPL_SUMMONFIREGOLEM)
	{
		PLAYER_TALENT_RUNES[80] = TRUE;
		PLAYER_TALENT_RUNES_80 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itsc_sumfiregol,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání ohnivého golema'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ OHNIVÉHO GOLEMA: svitek kouzla, srdce ohnivého golema, ohnivý jazyk a síra.");
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		PLAYER_TALENT_RUNES_30 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_ChargeFireBall,1);
		AI_Print("Naučeno: Tvorba run - 'Velká ohnivá koule'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VELKÁ OHNIVÁ KOULE: svitek kouzla, síra a pryskyřice.");
	};
	if(spell == SPL_FIRELIGHT)
	{
		PLAYER_TALENT_RUNES[93] = TRUE;
		PLAYER_TALENT_RUNES_93 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_firelight,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý plášť'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ PLÁŠŤ: magické zaříkadlo kouzla, pryskyřice, ohnivý jazyk, křemen a akvamarín.");
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		PLAYER_TALENT_RUNES_37 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Pyrokinesis,1);
		AI_Print("Naučeno: Tvorba run - 'Velká ohnivá bouře'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VELKÁ OHNIVÁ BOUŘE: svitek kouzla, síra a ohnivý jazyk.");
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		PLAYER_TALENT_RUNES_42 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firerain,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý déšť'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ DÉŠŤ: svitek kouzla, pryskyřice, síra a ohnivý jazyk.");
	};
	if(spell == SPL_FireMeteor)
	{
		PLAYER_TALENT_RUNES[SPL_FireMeteor] = TRUE;
		PLAYER_TALENT_RUNES_103 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_FireMeteor,1);
		AI_Print("Naučeno: Tvorba run - 'Meteorit'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy METEORIT: magické zaříkadlo kouzla, síra, pryskyřice, kamenný krystal a ohnivý jazyk.");
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		PLAYER_TALENT_RUNES_24 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Zap,1);
		AI_Print("Naučeno: Tvorba run - 'Blesk'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy BLESK: svitek kouzla a kamenný krystal.");
	};
	if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		PLAYER_TALENT_RUNES_73 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icelance,1);
		AI_Print("Naučeno: Tvorba run - 'Ledové kopí'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÉ KOPÍ: svitek kouzla, křemen a kamenný krystal.");
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		PLAYER_TALENT_RUNES_20 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icebolt,1);
		AI_Print("Naučeno: Tvorba run - 'Ledový šíp'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÝ ŠÍP: svitek kouzla a křemen.");
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		PLAYER_TALENT_RUNES_33 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceCube,1);
		AI_Print("Naučeno: Tvorba run - 'Ledový blok'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÝ BLOK: svitek kouzla, křemen a akvamarín.");
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		PLAYER_TALENT_RUNES_34 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_ThunderBall,1);
		AI_Print("Naučeno: Tvorba run - 'Kulový blesk'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy KULOVÝ BLESK: svitek kouzla, síra a kamenný krystal.");
	};
	if(spell == SPL_SUMMONSHOAL)
	{
		PLAYER_TALENT_RUNES[98] = TRUE;
		PLAYER_TALENT_RUNES_98 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumshoal,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání smečky ledových vlků'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ SMEČKY LEDOVÝCH VLKŮ: svitek kouzla, 3x kůže ledového vlka a křemen.");
	};
	if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		PLAYER_TALENT_RUNES_72 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Waterfist,1);
		AI_Print("Naučeno: Tvorba run - 'Vodní pěst'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VODNÍ PĚST: svitek kouzla, akvamarín a kamenný krystal.");
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		PLAYER_TALENT_RUNES_29 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_LightningFlash,1);
		AI_Print("Naučeno: Tvorba run - 'Úder blesku'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ÚDER BLESKU: svitek kouzla, kamenný krystal a křemen.");
	};
	if(spell == SPL_SUMMONICEGOLEM)
	{
		PLAYER_TALENT_RUNES[89] = TRUE;
		PLAYER_TALENT_RUNES_89 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumicegol,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání ledového golema'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ LEDOVÉHO GOLEMA: svitek kouzla, srdce ledového golema, křemen a akvamarín.");
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		PLAYER_TALENT_RUNES_39 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceWave,1);
		AI_Print("Naučeno: Tvorba run - 'Ledová vlna'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÁ VLNA: svitek kouzla, křemen a akvamarín.");
	};
	if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		PLAYER_TALENT_RUNES_75 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Geyser,1);
		AI_Print("Naučeno: Tvorba run - 'Gejzír'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy GEJZÍR: svitek kouzla a akvamarín.");
	};
	if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		PLAYER_TALENT_RUNES_70 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Thunderstorm,1);
		AI_Print("Naučeno: Tvorba run - 'Bouře'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy BOUŘE: svitek kouzla, křemen a křídlo krvavé mouchy.");
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		PLAYER_TALENT_RUNES_27 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Sleep,1);
		AI_Print("Naučeno: Tvorba run - 'Spánek'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy SPÁNEK: svitek kouzla a tráva z bažin.");
	};
	if(spell == SPL_BERZERK)
	{
		PLAYER_TALENT_RUNES[95] = TRUE;
		PLAYER_TALENT_RUNES_95 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_berzerk,1);
		AI_Print("Naučeno: Tvorba run - 'Spáčovo kopí'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy SPÁČOVO KOPÍ: svitek kouzla, tráva z bažin a křemen.");
	};
	if(spell == SPL_TELEKINESIS)
	{
		PLAYER_TALENT_RUNES[83] = TRUE;
		PLAYER_TALENT_RUNES_83 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_telekinesis,1);
		AI_Print("Naučeno: Tvorba run - 'Vysátí ducha'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYSÁTÍ DUCHA: magické zaříkadlo kouzla, tráva z bažin, křemen a akvamarín.");
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		PLAYER_TALENT_RUNES_26 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Windfist,1);
		AI_Print("Naučeno: Tvorba run - 'Větrná pěst'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VĚTRNÁ PĚST: svitek kouzla a uhlí.");
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		PLAYER_TALENT_RUNES_32 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Fear,1);
		AI_Print("Naučeno: Tvorba run - 'Strach'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy STRACH: svitek kouzla a černá perla.");
	};
	if(spell == SPL_Charm)
	{
		PLAYER_TALENT_RUNES[SPL_Charm] = TRUE;
		PLAYER_TALENT_RUNES_59 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Charm,1);
		AI_Print("Naučeno: Tvorba run - 'Zapomnění'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ZAPOMNĚNÍ: svitek kouzla, akvamarín a křemen.");
	};
	if(spell == SPL_GreenTentacle)
	{
		PLAYER_TALENT_RUNES[SPL_GreenTentacle] = TRUE;
		PLAYER_TALENT_RUNES_82 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_greententacle,1);
		AI_Print("Naučeno: Tvorba run - 'Spletité kořeny'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy SPLETITÉ KOŘENY: svitek kouzla, pryskyřice a tráva z bažin.");
	};
	if(spell == SPL_SUMMONSWAMPGOLEM)
	{
		PLAYER_TALENT_RUNES[100] = TRUE;
		PLAYER_TALENT_RUNES_100 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_sumswpgol,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání bažinného golema'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ BAŽINNÉHO GOLEMA: svitek kouzla, srdce bažinného golema a 3x tráva z bažin.");
	};
	if(spell == SPL_SEVEREFETIDITY)
	{
		PLAYER_TALENT_RUNES[96] = TRUE;
		PLAYER_TALENT_RUNES_96 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_severefetidity,1);
		AI_Print("Naučeno: Tvorba run - 'Strašný zápach'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy STRAŠNÝ ZÁPACH: svitek kouzla, tráva z bažin, síra a uhlí.");
	};
	if(spell == SPL_CONTROL)
	{
		PLAYER_TALENT_RUNES[94] = TRUE;
		PLAYER_TALENT_RUNES_94 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_control,1);
		AI_Print("Naučeno: Tvorba run - 'Hypnóza'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy HYPNÓZA: magické zaříkadlo kouzla, tráva z bažin, uhlí a černá perla.");
	};
	if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		PLAYER_TALENT_RUNES_71 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Whirlwind,1);
		AI_Print("Naučeno: Tvorba run - 'Tornádo'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy TORNÁDO: svitek kouzla, křídlo krvavé mouchy, tráva z bažin a křemen.");
	};
	if(spell == SPL_Deathbolt)
	{
		PLAYER_TALENT_RUNES[SPL_Deathbolt] = TRUE;
		PLAYER_TALENT_RUNES_61 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathbolt,1);
		AI_Print("Naučeno: Tvorba run - 'Temný šíp'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy TEMNÝ ŠÍP: svitek kouzla a černá perla.");
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_22 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumGobSkel,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání kostlivce'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ KOSTLIVCE: svitek kouzla a kost z kostlivce.");
	};
	if(spell == SPL_ManaForLife)
	{
		PLAYER_TALENT_RUNES[SPL_ManaForLife] = TRUE;
		PLAYER_TALENT_RUNES_86 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_ManaForLife,1);
		AI_Print("Naučeno: Tvorba run - 'Rozervání duše'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ROZERVÁNÍ DUŠE: svitek kouzla, síra a pryskyřice.");
	};
	if(spell == SPL_SummonZombie)
	{
		PLAYER_TALENT_RUNES[SPL_SummonZombie] = TRUE;
		PLAYER_TALENT_RUNES_88 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_sumzombie,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání zombie'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ ZOMBIE: svitek kouzla, uhlí a maso z mrtvoly.");
	};
	if(spell == SPL_Swarm)
	{
		PLAYER_TALENT_RUNES[SPL_Swarm] = TRUE;
		PLAYER_TALENT_RUNES_81 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_swarm,1);
		AI_Print("Naučeno: Tvorba run - 'Roj hmyzu'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ROJ HMYZU: svitek kouzla, akvamarín, tráva z bažin a pryskyřice.");
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_31 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumSkel,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání kostlivého válečníka'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ KOSTLIVÉHO VÁLEČNÍKA: svitek kouzla, kost z kostlivce a černá perla.");
	};
	if(spell == SPL_Energyball)
	{
		PLAYER_TALENT_RUNES[SPL_Energyball] = TRUE;
		PLAYER_TALENT_RUNES_85 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_energyball,1);
		AI_Print("Naučeno: Tvorba run - 'Temné kopí'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy TEMNÉ KOPÍ: svitek kouzla, černá perla, křemen, kamenný krystal a síra.");
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		PLAYER_TALENT_RUNES_40 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumDemon,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání démona'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ DÉMONA: svitek kouzla, vyšší runový kámen, srdce démona, 2x síra, 3x pryskyřice, uhlí a 3x černá perla.");
	};
	if(spell == SPL_Deathball)
	{
		PLAYER_TALENT_RUNES[SPL_Deathball] = TRUE;
		PLAYER_TALENT_RUNES_62 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathball,1);
		AI_Print("Naučeno: Tvorba run - 'Koule smrti'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy KOULE SMRTI: svitek kouzla, ohnivý jazyk, síra a pryskyřice.");
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		PLAYER_TALENT_RUNES_45 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_ArmyOfDarkness,1);
		AI_Print("Naučeno: Tvorba run - 'Armáda temnot'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ARMÁDA TEMNOT: svitek kouzla, kost z kostlivce, černá perla, srdce kamenného golema a srdce démona.");
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		PLAYER_TALENT_RUNES_44 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_MassDeath,1);
		AI_Print("Naučeno: Tvorba run - 'Černá mlha'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ČERNÁ MLHA: svitek kouzla, kost z kostlivce, ektoplazma a černá perla.");
	};
	if(spell == SPL_Skull)
	{
		PLAYER_TALENT_RUNES[SPL_Skull] = TRUE;
		PLAYER_TALENT_RUNES_87 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_skull,1);
		AI_Print("Naučeno: Tvorba run - 'Řev mrtvých'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ŘEV MRTVÝCH: svitek kouzla, černá perla, srdce démona, lebka, pryskyřice a síra.");
	};
	if(spell == SPL_GuruWrath)
	{
		PLAYER_TALENT_RUNES[SPL_GuruWrath] = TRUE;
		PLAYER_TALENT_RUNES_104 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_GuruWrath,1);
		AI_Print("Naučeno: Tvorba run - 'Hněv elementů'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy HNĚV ELEMENTŮ: magické zaříkadlo kouzla a srdce golemů všech čtyř elementů.");
	};
	if(spell == SPL_RapidFirebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidFirebolt] = TRUE;
		PLAYER_TALENT_RUNES_107 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_RapidFirebolt,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý záblesk'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ ZÁBLESK: svitek kouzla, síra a pryskyřice.");
	};
	if(spell == SPL_MagicCage)
	{
		PLAYER_TALENT_RUNES[SPL_MagicCage] = TRUE;
		PLAYER_TALENT_RUNES_111 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_MagicCage,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivá klec'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÁ KLEC: svitek kouzla, síra, pryskyřice a ohnivý jazyk.");
	};
	if(spell == SPL_Explosion)
	{
		PLAYER_TALENT_RUNES[SPL_Explosion] = TRUE;
		PLAYER_TALENT_RUNES_114 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Explosion,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý výbuch'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ VÝBUCH: svitek kouzla, síra, pryskyřice, ohnivý jazyk a akvamarín.");
	};
	if(spell == SPL_RapidIcebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidIcebolt] = TRUE;
		PLAYER_TALENT_RUNES_108 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_RapidIcebolt,1);
		AI_Print("Naučeno: Tvorba run - 'Ledový záblesk'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÝ ZÁBLESK: svitek kouzla, kamenný krystal a křemen.");
	};
	if(spell == SPL_AdanosBall)
	{
		PLAYER_TALENT_RUNES[SPL_AdanosBall] = TRUE;
		PLAYER_TALENT_RUNES_116 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_AdanosBall,1);
		AI_Print("Naučeno: Tvorba run - 'Ruka Chaosu'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy RUKA CHAOSU: svitek kouzla, kamenný krystal, černá perla a akvamarín.");
	};
	if(spell == SPL_Rage)
	{
		PLAYER_TALENT_RUNES[SPL_Rage] = TRUE;
		PLAYER_TALENT_RUNES_109 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Rage,1);
		AI_Print("Naučeno: Tvorba run - 'Posedlost'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy POSEDLOST: svitek kouzla, kost z kostlivce, ektoplazma, síra a pryskyřice.");
	};
	if(spell == SPL_Lacerate)
	{
		PLAYER_TALENT_RUNES[SPL_Lacerate] = TRUE;
		PLAYER_TALENT_RUNES_112 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Lacerate,1);
		AI_Print("Naučeno: Tvorba run - 'Únava'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ÚNAVA: svitek kouzla, kost z kostlivce, síra, kamenný krystal a křemen.");
	};
	if(spell == SPL_Extricate)
	{
		PLAYER_TALENT_RUNES[SPL_Extricate] = TRUE;
		PLAYER_TALENT_RUNES_113 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Extricate,1);
		AI_Print("Naučeno: Tvorba run - 'Tlaková vlna'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy TLAKOVÁ VLNA: svitek kouzla, křídlo krvavé mouchy, tráva z bažin a černá perla.");
	};
	if(spell == SPL_Elevate)
	{
		PLAYER_TALENT_RUNES[SPL_Elevate] = TRUE;
		PLAYER_TALENT_RUNES_115 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Elevate,1);
		AI_Print("Naučeno: Tvorba run - 'Elevace'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ELEVACE: svitek kouzla, tráva z bažin, síra, uhlí a křemen.");
	};
	if(spell == SPL_Acid)
	{
		PLAYER_TALENT_RUNES[SPL_Acid] = TRUE;
		PLAYER_TALENT_RUNES_117 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Acid,1);
		CreateInvItems(scrolltrader_gur,ITPO_POISON,1);
		AI_Print("Naučeno: Tvorba run - 'Jedovaté kousnutí'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy JEDOVATÉ KOUSNUTÍ: svitek kouzla, kost z kostlivce, tráva z bažin, černá perla, jed a pryskyřice.");
	};
	if(spell == SPL_Quake)
	{
		PLAYER_TALENT_RUNES[SPL_Quake] = TRUE;
		PLAYER_TALENT_RUNES_110 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Quake,1);
		AI_Print("Naučeno: Tvorba run - 'Zemětřesení'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ZEMĚTŘESENÍ: svitek kouzla, černá perla, srdce kamenného golema, tráva z bažin, akvamarín a pryskyřice.");
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
		AI_Print("Inteligence + 1");
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
	B_LogEntry(TOPIC_TalentRunes,"K vytvoření magické runy potřebuji svitek příslušného kouzla a potřebné ingredience. S pomocí těchto ingrediencí a runového kamene určitého typu pak mohu na runovém stole vytvářet runy. K vytvoření run prvního a druhého kruhu stačí obyčejné runové kameny, třetí a čtvrtý kruh vyžadují starší runové kameny a pro runy pátého a šestého kruhu jsou potřeba vyšší runové kameny. Samotné runové kameny mohu vytvářet na runovém stolu z úlomků. Nevím však, kde je získat.");

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
	}
	else if(Npc_IsDead(Kreol) == FALSE)
	{
		scrolltrader_dmt = Hlp_GetNpc(Kreol);		
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
		AI_Print("Naučeno: Tvorba run - 'Světlo'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy SVĚTLO: svitek kouzla a zlatá mince.");
	};
	if(spell == SPL_LightHeal)
	{
		PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
		PLAYER_TALENT_RUNES_21 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_LightHeal,1);
		AI_Print("Naučeno: Tvorba run - 'Léčení'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LÉČENÍ: svitek kouzla a léčivý kořen.");
	};
	if(spell == SPL_UnlockChest)
	{
		PLAYER_TALENT_RUNES[SPL_UnlockChest] = TRUE;
		PLAYER_TALENT_RUNES_99 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_Unlock,1);
		AI_Print("Naučeno: Tvorba run - 'Požírač zámků'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy POŽÍRAČ ZÁMKŮ: svitek kouzla a paklíč.");
	};
	if(spell == SPL_SummonWolf)
	{
		PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
		PLAYER_TALENT_RUNES_25 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumWolf,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání warga'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ WARGA: svitek kouzla a kůže warga.");
	};
	if(spell == SPL_SummonGolem)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
		PLAYER_TALENT_RUNES_35 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_SumGol,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání kamenného golema'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ KAMENNÉHO GOLEMA: svitek kouzla a srdce kamenného golema.");
	};
	if(spell == SPL_MediumHeal)
	{
		PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
		PLAYER_TALENT_RUNES_28 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_MediumHeal,1);
		AI_Print("Naučeno: Tvorba run - 'Očisťující světlo'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OČISŤUJÍCÍ SVĚTLO: svitek kouzla, protijed a svěcená voda.");
	};
	if(spell == SPL_DestroyUndead)
	{
		PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
		PLAYER_TALENT_RUNES_36 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_HarmUndead,1);
		AI_Print("Naučeno: Tvorba run - 'Zničení nemrtvého'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ZNIČENÍ NEMRTVÉHO: svitek kouzla a svěcená voda.");
	};
	if(spell == SPL_FullHeal)
	{
		PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
		PLAYER_TALENT_RUNES_41 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_prm,ItSc_FullHeal,1);
		AI_Print("Naučeno: Tvorba run - 'Příliv čilosti'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy PŘÍLIV ČILOSTI: svitek kouzla, modrý bez, křemen a tráva z bažin.");
	};
	if(spell == SPL_Firebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
		PLAYER_TALENT_RUNES_19 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firebolt,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý šíp'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ ŠÍP: svitek kouzla a síra.");
	};
	if(spell == SPL_InstantFireball)
	{
		PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
		PLAYER_TALENT_RUNES_23 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_InstantFireball,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivá koule'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÁ KOULE: svitek kouzla a pryskyřice.");
	};
	if(spell == SPL_Firestorm)
	{
		PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
		PLAYER_TALENT_RUNES_38 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firestorm,1);
		AI_Print("Naučeno: Tvorba run - 'Malá ohnivá bouře'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy MALÁ OHNIVÁ BOUŘE: svitek kouzla, síra a pryskyřice.");
	};
	if(spell == SPL_SUMMONFIREGOLEM)
	{
		PLAYER_TALENT_RUNES[80] = TRUE;
		PLAYER_TALENT_RUNES_80 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itsc_sumfiregol,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání ohnivého golema'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ OHNIVÉHO GOLEMA: svitek kouzla, srdce ohnivého golema, ohnivý jazyk a síra.");
	};
	if(spell == SPL_ChargeFireball)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
		PLAYER_TALENT_RUNES_30 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_ChargeFireBall,1);
		AI_Print("Naučeno: Tvorba run - 'Velká ohnivá koule'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VELKÁ OHNIVÁ KOULE: svitek kouzla, síra a pryskyřice.");
	};
	if(spell == SPL_FIRELIGHT)
	{
		PLAYER_TALENT_RUNES[93] = TRUE;
		PLAYER_TALENT_RUNES_93 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_firelight,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý plášť'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ PLÁŠŤ: magické zaříkadlo kouzla, pryskyřice, ohnivý jazyk, křemen a akvamarín.");
	};
	if(spell == SPL_Pyrokinesis)
	{
		PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
		PLAYER_TALENT_RUNES_37 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Pyrokinesis,1);
		AI_Print("Naučeno: Tvorba run - 'Velká ohnivá bouře'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VELKÁ OHNIVÁ BOUŘE: svitek kouzla, síra a ohnivý jazyk.");
	};
	if(spell == SPL_Firerain)
	{
		PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
		PLAYER_TALENT_RUNES_42 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Firerain,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý déšť'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ DÉŠŤ: svitek kouzla, pryskyřice, síra a ohnivý jazyk.");
	};
	if(spell == SPL_FireMeteor)
	{
		PLAYER_TALENT_RUNES[SPL_FireMeteor] = TRUE;
		PLAYER_TALENT_RUNES_103 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,itwr_FireMeteor,1);
		AI_Print("Naučeno: Tvorba run - 'Meteorit'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy METEORIT: magické zaříkadlo kouzla, síra, pryskyřice, kamenný krystal a ohnivý jazyk.");
	};
	if(spell == SPL_Zap)
	{
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		PLAYER_TALENT_RUNES_24 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Zap,1);
		AI_Print("Naučeno: Tvorba run - 'Blesk'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy BLESK: svitek kouzla a kamenný krystal.");
	};
	if(spell == SPL_IceLance)
	{
		PLAYER_TALENT_RUNES[SPL_IceLance] = TRUE;
		PLAYER_TALENT_RUNES_73 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icelance,1);
		AI_Print("Naučeno: Tvorba run - 'Ledové kopí'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÉ KOPÍ: svitek kouzla, křemen a kamenný krystal.");
	};
	if(spell == SPL_Icebolt)
	{
		PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
		PLAYER_TALENT_RUNES_20 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Icebolt,1);
		AI_Print("Naučeno: Tvorba run - 'Ledový šíp'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÝ ŠÍP: svitek kouzla a křemen.");
	};
	if(spell == SPL_IceCube)
	{
		PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
		PLAYER_TALENT_RUNES_33 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceCube,1);
		AI_Print("Naučeno: Tvorba run - 'Ledový blok'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÝ BLOK: svitek kouzla, křemen a akvamarín.");
	};
	if(spell == SPL_ChargeZap)
	{
		PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
		PLAYER_TALENT_RUNES_34 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_ThunderBall,1);
		AI_Print("Naučeno: Tvorba run - 'Kulový blesk'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy KULOVÝ BLESK: svitek kouzla, síra a kamenný krystal.");
	};
	if(spell == SPL_SUMMONSHOAL)
	{
		PLAYER_TALENT_RUNES[98] = TRUE;
		PLAYER_TALENT_RUNES_98 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumshoal,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání smečky ledových vlků'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ SMEČKY LEDOVÝCH VLKŮ: svitek kouzla, 3x kůže ledového vlka a křemen.");
	};
	if(spell == SPL_WaterFist)
	{
		PLAYER_TALENT_RUNES[SPL_WaterFist] = TRUE;
		PLAYER_TALENT_RUNES_72 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Waterfist,1);
		AI_Print("Naučeno: Tvorba run - 'Vodní pěst'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VODNÍ PĚST: svitek kouzla, akvamarín a kamenný krystal.");
	};
	if(spell == SPL_LightningFlash)
	{
		PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
		PLAYER_TALENT_RUNES_29 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_LightningFlash,1);
		AI_Print("Naučeno: Tvorba run - 'Úder blesku'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ÚDER BLESKU: svitek kouzla, kamenný krystal a křemen.");
	};
	if(spell == SPL_SUMMONICEGOLEM)
	{
		PLAYER_TALENT_RUNES[89] = TRUE;
		PLAYER_TALENT_RUNES_89 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,itsc_sumicegol,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání ledového golema'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ LEDOVÉHO GOLEMA: svitek kouzla, srdce ledového golema, křemen a akvamarín.");
	};
	if(spell == SPL_IceWave)
	{
		PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
		PLAYER_TALENT_RUNES_39 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_IceWave,1);
		AI_Print("Naučeno: Tvorba run - 'Ledová vlna'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÁ VLNA: svitek kouzla, křemen a akvamarín.");
	};
	if(spell == SPL_Geyser)
	{
		PLAYER_TALENT_RUNES[SPL_Geyser] = TRUE;
		PLAYER_TALENT_RUNES_75 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Geyser,1);
		AI_Print("Naučeno: Tvorba run - 'Gejzír'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy GEJZÍR: svitek kouzla a akvamarín.");
	};
	if(spell == SPL_Thunderstorm)
	{
		PLAYER_TALENT_RUNES[SPL_Thunderstorm] = TRUE;
		PLAYER_TALENT_RUNES_70 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_Thunderstorm,1);
		AI_Print("Naučeno: Tvorba run - 'Bouře'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy BOUŘE: svitek kouzla, křemen a křídlo krvavé mouchy.");
	};
	if(spell == SPL_Sleep)
	{
		PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
		PLAYER_TALENT_RUNES_27 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Sleep,1);
		AI_Print("Naučeno: Tvorba run - 'Spánek'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy SPÁNEK: svitek kouzla a tráva z bažin.");
	};
	if(spell == SPL_BERZERK)
	{
		PLAYER_TALENT_RUNES[95] = TRUE;
		PLAYER_TALENT_RUNES_95 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_berzerk,1);
		AI_Print("Naučeno: Tvorba run - 'Spáčovo kopí'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy SPÁČOVO KOPÍ: svitek kouzla, tráva z bažin a křemen.");
	};
	if(spell == SPL_TELEKINESIS)
	{
		PLAYER_TALENT_RUNES[83] = TRUE;
		PLAYER_TALENT_RUNES_83 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_telekinesis,1);
		AI_Print("Naučeno: Tvorba run - 'Vysátí ducha'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYSÁTÍ DUCHA: magické zaříkadlo kouzla, tráva z bažin, křemen a akvamarín.");
	};
	if(spell == SPL_WindFist)
	{
		PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
		PLAYER_TALENT_RUNES_26 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Windfist,1);
		AI_Print("Naučeno: Tvorba run - 'Větrná pěst'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VĚTRNÁ PĚST: svitek kouzla a uhlí.");
	};
	if(spell == SPL_Fear)
	{
		PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
		PLAYER_TALENT_RUNES_32 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Fear,1);
		AI_Print("Naučeno: Tvorba run - 'Strach'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy STRACH: svitek kouzla a černá perla.");
	};
	if(spell == SPL_Charm)
	{
		PLAYER_TALENT_RUNES[SPL_Charm] = TRUE;
		PLAYER_TALENT_RUNES_59 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Charm,1);
		AI_Print("Naučeno: Tvorba run - 'Zapomnění'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ZAPOMNĚNÍ: svitek kouzla, akvamarín a křemen.");
	};
	if(spell == SPL_GreenTentacle)
	{
		PLAYER_TALENT_RUNES[SPL_GreenTentacle] = TRUE;
		PLAYER_TALENT_RUNES_82 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_greententacle,1);
		AI_Print("Naučeno: Tvorba run - 'Spletité kořeny'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy SPLETITÉ KOŘENY: svitek kouzla, pryskyřice a tráva z bažin.");
	};
	if(spell == SPL_SUMMONSWAMPGOLEM)
	{
		PLAYER_TALENT_RUNES[100] = TRUE;
		PLAYER_TALENT_RUNES_100 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_sumswpgol,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání bažinného golema'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ BAŽINNÉHO GOLEMA: svitek kouzla, srdce bažinného golema a 3x tráva z bažin.");
	};
	if(spell == SPL_SEVEREFETIDITY)
	{
		PLAYER_TALENT_RUNES[96] = TRUE;
		PLAYER_TALENT_RUNES_96 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itsc_severefetidity,1);
		AI_Print("Naučeno: Tvorba run - 'Strašný zápach'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy STRAŠNÝ ZÁPACH: svitek kouzla, tráva z bažin, síra a uhlí.");
	};
	if(spell == SPL_CONTROL)
	{
		PLAYER_TALENT_RUNES[94] = TRUE;
		PLAYER_TALENT_RUNES_94 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_control,1);
		AI_Print("Naučeno: Tvorba run - 'Hypnóza'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy HYPNÓZA: magické zaříkadlo kouzla, tráva z bažin, uhlí a černá perla.");
	};
	if(spell == SPL_Whirlwind)
	{
		PLAYER_TALENT_RUNES[SPL_Whirlwind] = TRUE;
		PLAYER_TALENT_RUNES_71 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Whirlwind,1);
		AI_Print("Naučeno: Tvorba run - 'Tornádo'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy TORNÁDO: svitek kouzla, křídlo krvavé mouchy, tráva z bažin a křemen.");
	};
	if(spell == SPL_Deathbolt)
	{
		PLAYER_TALENT_RUNES[SPL_Deathbolt] = TRUE;
		PLAYER_TALENT_RUNES_61 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathbolt,1);
		AI_Print("Naučeno: Tvorba run - 'Temný šíp'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy TEMNÝ ŠÍP: svitek kouzla a černá perla.");
	};
	if(spell == SPL_SummonGoblinSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_22 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumGobSkel,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání kostlivce'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ KOSTLIVCE: svitek kouzla a kost z kostlivce.");
	};
	if(spell == SPL_ManaForLife)
	{
		PLAYER_TALENT_RUNES[SPL_ManaForLife] = TRUE;
		PLAYER_TALENT_RUNES_86 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_ManaForLife,1);
		AI_Print("Naučeno: Tvorba run - 'Rozervání duše'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ROZERVÁNÍ DUŠE: svitek kouzla, síra a pryskyřice.");
	};
	if(spell == SPL_SummonZombie)
	{
		PLAYER_TALENT_RUNES[SPL_SummonZombie] = TRUE;
		PLAYER_TALENT_RUNES_88 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_sumzombie,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání zombie'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ ZOMBIE: svitek kouzla, uhlí a maso z mrtvoly.");
	};
	if(spell == SPL_Swarm)
	{
		PLAYER_TALENT_RUNES[SPL_Swarm] = TRUE;
		PLAYER_TALENT_RUNES_81 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_swarm,1);
		AI_Print("Naučeno: Tvorba run - 'Roj hmyzu'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ROJ HMYZU: svitek kouzla, akvamarín, tráva z bažin a pryskyřice.");
	};
	if(spell == SPL_SummonSkeleton)
	{
		PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
		PLAYER_TALENT_RUNES_31 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumSkel,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání kostlivého válečníka'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ KOSTLIVÉHO VÁLEČNÍKA: svitek kouzla, kost z kostlivce a černá perla.");
	};
	if(spell == SPL_Energyball)
	{
		PLAYER_TALENT_RUNES[SPL_Energyball] = TRUE;
		PLAYER_TALENT_RUNES_85 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_energyball,1);
		AI_Print("Naučeno: Tvorba run - 'Temné kopí'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy TEMNÉ KOPÍ: svitek kouzla, černá perla, křemen, kamenný krystal a síra.");
	};
	if(spell == SPL_SummonDemon)
	{
		PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
		PLAYER_TALENT_RUNES_40 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_SumDemon,1);
		AI_Print("Naučeno: Tvorba run - 'Vyvolání démona'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy VYVOLÁNÍ DÉMONA: svitek kouzla, vyšší runový kámen, srdce démona, 2x síra, 3x pryskyřice, uhlí a 3x černá perla.");
	};
	if(spell == SPL_Deathball)
	{
		PLAYER_TALENT_RUNES[SPL_Deathball] = TRUE;
		PLAYER_TALENT_RUNES_62 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_deathball,1);
		AI_Print("Naučeno: Tvorba run - 'Koule smrti'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy KOULE SMRTI: svitek kouzla, ohnivý jazyk, síra a pryskyřice.");
	};
	if(spell == SPL_ArmyOfDarkness)
	{
		PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
		PLAYER_TALENT_RUNES_45 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_ArmyOfDarkness,1);
		AI_Print("Naučeno: Tvorba run - 'Armáda temnot'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ARMÁDA TEMNOT: svitek kouzla, kost z kostlivce, černá perla, srdce kamenného golema a srdce démona.");
	};
	if(spell == SPL_MassDeath)
	{
		PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
		PLAYER_TALENT_RUNES_44 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_MassDeath,1);
		AI_Print("Naučeno: Tvorba run - 'Černá mlha'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ČERNÁ MLHA: svitek kouzla, kost z kostlivce, ektoplazma a černá perla.");
	};
	if(spell == SPL_Skull)
	{
		PLAYER_TALENT_RUNES[SPL_Skull] = TRUE;
		PLAYER_TALENT_RUNES_87 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,itsc_skull,1);
		AI_Print("Naučeno: Tvorba run - 'Řev mrtvých'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ŘEV MRTVÝCH: svitek kouzla, černá perla, srdce démona, lebka, pryskyřice a síra.");
	};
	if(spell == SPL_GuruWrath)
	{
		PLAYER_TALENT_RUNES[SPL_GuruWrath] = TRUE;
		PLAYER_TALENT_RUNES_104 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,itwr_GuruWrath,1);
		AI_Print("Naučeno: Tvorba run - 'Hněv elementů'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy HNĚV ELEMENTŮ: magické zaříkadlo kouzla a srdce golemů všech čtyř elementů.");
	};
	if(spell == SPL_RapidFirebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidFirebolt] = TRUE;
		PLAYER_TALENT_RUNES_107 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_RapidFirebolt,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý záblesk'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ ZÁBLESK: svitek kouzla, síra a pryskyřice.");
	};
	if(spell == SPL_MagicCage)
	{
		PLAYER_TALENT_RUNES[SPL_MagicCage] = TRUE;
		PLAYER_TALENT_RUNES_111 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_MagicCage,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivá klec'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÁ KLEC: svitek kouzla, síra, pryskyřice a ohnivý jazyk.");
	};
	if(spell == SPL_Explosion)
	{
		PLAYER_TALENT_RUNES[SPL_Explosion] = TRUE;
		PLAYER_TALENT_RUNES_114 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdf,ItSc_Explosion,1);
		AI_Print("Naučeno: Tvorba run - 'Ohnivý výbuch'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy OHNIVÝ VÝBUCH: svitek kouzla, síra, pryskyřice, ohnivý jazyk a akvamarín.");
	};
	if(spell == SPL_RapidIcebolt)
	{
		PLAYER_TALENT_RUNES[SPL_RapidIcebolt] = TRUE;
		PLAYER_TALENT_RUNES_108 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_RapidIcebolt,1);
		AI_Print("Naučeno: Tvorba run - 'Ledový záblesk'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy LEDOVÝ ZÁBLESK: svitek kouzla, kamenný krystal a křemen.");
	};
	if(spell == SPL_AdanosBall)
	{
		PLAYER_TALENT_RUNES[SPL_AdanosBall] = TRUE;
		PLAYER_TALENT_RUNES_116 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_kdw,ItSc_AdanosBall,1);
		AI_Print("Naučeno: Tvorba run - 'Ruka Chaosu'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy RUKA CHAOSU: svitek kouzla, kamenný krystal, černá perla a akvamarín.");
	};
	if(spell == SPL_Rage)
	{
		PLAYER_TALENT_RUNES[SPL_Rage] = TRUE;
		PLAYER_TALENT_RUNES_109 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Rage,1);
		AI_Print("Naučeno: Tvorba run - 'Posedlost'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy POSEDLOST: svitek kouzla, kost z kostlivce, ektoplazma, síra a pryskyřice.");
	};
	if(spell == SPL_Lacerate)
	{
		PLAYER_TALENT_RUNES[SPL_Lacerate] = TRUE;
		PLAYER_TALENT_RUNES_112 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_dmt,ItSc_Lacerate,1);
		AI_Print("Naučeno: Tvorba run - 'Únava'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ÚNAVA: svitek kouzla, kost z kostlivce, síra, kamenný krystal a křemen.");
	};
	if(spell == SPL_Extricate)
	{
		PLAYER_TALENT_RUNES[SPL_Extricate] = TRUE;
		PLAYER_TALENT_RUNES_113 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Extricate,1);
		AI_Print("Naučeno: Tvorba run - 'Tlaková vlna'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy TLAKOVÁ VLNA: svitek kouzla, křídlo krvavé mouchy, tráva z bažin a černá perla.");
	};
	if(spell == SPL_Elevate)
	{
		PLAYER_TALENT_RUNES[SPL_Elevate] = TRUE;
		PLAYER_TALENT_RUNES_115 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Elevate,1);
		AI_Print("Naučeno: Tvorba run - 'Elevace'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ELEVACE: svitek kouzla, tráva z bažin, síra, uhlí, černá perla a křemen.");
	};
	if(spell == SPL_Acid)
	{
		PLAYER_TALENT_RUNES[SPL_Acid] = TRUE;
		PLAYER_TALENT_RUNES_117 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Acid,1);
		AI_Print("Naučeno: Tvorba run - 'Jedovaté kousnutí'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy JEDOVATÉ KOUSNUTÍ: svitek kouzla, kost z kostlivce, tráva z bažin, černá perla, jed a pryskyřice.");
	};
	if(spell == SPL_Quake)
	{
		PLAYER_TALENT_RUNES[SPL_Quake] = TRUE;
		PLAYER_TALENT_RUNES_110 = TRUE;
		CountLearnSpell += 1;
		CreateInvItems(scrolltrader_gur,ItSc_Quake,1);
		AI_Print("Naučeno: Tvorba run - 'Zemětřesení'");
		B_LogEntry(TOPIC_TalentRunes,"Ingredience pro vytvoření runy ZEMĚTŘESENÍ: svitek kouzla, černá perla, srdce kamenného golema, tráva z bažin, akvamarín a pryskyřice.");
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
		AI_Print("Inteligence + 1");
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
		AI_PrintClr("Nemáš dostatek magické rudy...",177,58,17);
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