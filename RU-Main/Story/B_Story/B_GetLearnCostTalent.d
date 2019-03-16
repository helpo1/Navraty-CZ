
func int B_GetLearnCostTalent(var C_Npc oth,var int talent,var int skill)
{
	var int kosten;
	kosten = 0;
	if(talent == NPC_TALENT_MAGE)
	{
		if(skill == 1)
		{
			kosten = 20;
		}
		else if(skill == 2)
		{
			kosten = 30;
		}
		else if(skill == 3)
		{
			kosten = 40;
		}
		else if(skill == 4)
		{
			kosten = 60;
		}
		else if(skill == 5)
		{
			kosten = 80;
		}
		else if(skill == 6)
		{
			kosten = 100;
		};
	};
	if(talent == NPC_TALENT_1H)
	{
		if(oth.aivar[REAL_TALENT_1H] >= 90)
		{
			if(oth.aivar[REAL_TALENT_1H] >= oth.aivar[REAL_TALENT_2H])
			{
				kosten = 4;
			}
			else
			{
				kosten = 5;
			};
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 60)
		{
			if(oth.aivar[REAL_TALENT_1H] >= oth.aivar[REAL_TALENT_2H])
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 30)
		{
			if(oth.aivar[REAL_TALENT_1H] >= oth.aivar[REAL_TALENT_2H])
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

		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_2H)
	{
		if(oth.aivar[REAL_TALENT_2H] >= 90)
		{
			if(oth.aivar[REAL_TALENT_2H] >= oth.aivar[REAL_TALENT_1H])
			{
				kosten = 4;
			}
			else
			{
				kosten = 5;
			};
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 60)
		{
			if(oth.aivar[REAL_TALENT_2H] >= oth.aivar[REAL_TALENT_1H])
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 30)
		{
			if(oth.aivar[REAL_TALENT_2H] >= oth.aivar[REAL_TALENT_1H])
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

		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_BOW)
	{
		if(oth.aivar[REAL_TALENT_BOW] >= 60)
		{
			if(oth.aivar[REAL_TALENT_BOW] >= oth.aivar[REAL_TALENT_CROSSBOW])
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 30)
		{
			if(oth.aivar[REAL_TALENT_BOW] >= oth.aivar[REAL_TALENT_CROSSBOW])
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

		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(oth.aivar[REAL_TALENT_CROSSBOW] >= 60)
		{
			if(oth.aivar[REAL_TALENT_CROSSBOW] >= oth.aivar[REAL_TALENT_BOW])
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 30)
		{
			if(oth.aivar[REAL_TALENT_CROSSBOW] >= oth.aivar[REAL_TALENT_BOW])
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

		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		kosten = 5;
	};
	if((talent == NPC_TALENT_PICKLOCK) || (talent == NPC_TALENT_PICKPOCKET))
	{
		kosten = 10;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		kosten = 10;
	};
	if(talent == NPC_TALENT_SMITH)
	{
		if(skill == WEAPON_Common)
		{
			kosten = 1;
		}
		else if(skill == WEAPON_1H_Special_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_2H_Special_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_Special_02)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_2H_Special_02)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_Special_03)
		{
			kosten = 16;
		}
		else if(skill == WEAPON_2H_Special_03)
		{
			kosten = 16;
		}
		else if(skill == WEAPON_1H_Special_04)
		{
			kosten = 32;
		}
		else if(skill == WEAPON_2H_Special_04)
		{
			kosten = 32;
		}
		else if(skill == WEAPON_1H_Harad_01)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_1H_Harad_02)
		{
			kosten = 3;
		}
		else if(skill == WEAPON_1H_Harad_03)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_Harad_04)
		{
			kosten = 5;
		}
		else if(skill == WEAPON_ITAR_MIL_L_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_MIL_M_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_SLD_L_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_SLD_M_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_SLD_H_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_STT_M_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_STT_S_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_GRD_L_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_BLOODWYN_ADDON_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_THORUS_ADDON_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_SEKBED_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_RANGER_ADDON_V1)
		{
			kosten = 0;
		}
		else if(skill == WEAPON_ITAR_PAL_M_V1)
		{
			kosten = 1;
		}
		else if(skill == WEAPON_ITAR_PAL_H_V1)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_ITAR_DJG_L_V1)
		{
			kosten = 1;
		}
		else if(skill == WEAPON_ITAR_DJG_M_V1)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_ITAR_DJG_H_V1)
		{
			kosten = 3;
		}
		else if(skill == WEAPON_ITAR_TPL_L_V1)
		{
			kosten = 1;
		}
		else if(skill == WEAPON_ITAR_TPL_M_V1)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_ITAR_TPL_S_V1)
		{
			kosten = 3;
		};
	};
	if(talent == NPC_TALENT_ALCHEMY)
	{
		if(skill == POTION_Health_01)
		{
			kosten = 1;
		}
		else if(skill == POTION_Health_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_Health_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_Health_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_Mana_01)
		{
			kosten = 1;
		}
		else if(skill == POTION_Mana_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_Mana_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_Mana_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_Speed)
		{
			kosten = 5;
		}
		else if(skill == POTION_SPEED_02)
		{
			kosten = 10;
		}
		else if(skill == POTION_STAMINA)
		{
			kosten = 1;
		}
		else if(skill == POTION_PERM_STAMINA)
		{
			kosten = 5;
		}
		else if(skill == POTION_Perm_STR)
		{
			kosten = 20;
		}
		else if(skill == POTION_Perm_DEX)
		{
			kosten = 20;
		}
		else if(skill == POTION_Perm_Mana)
		{
			kosten = 10;
		}
		else if(skill == POTION_Perm_Health)
		{
			kosten = 10;
		}
		else if(skill == POTION_MegaDrink)
		{
			kosten = 20;
		}
		else if(skill == POTION_PERM_SUPERMANA)
		{
			kosten = 25;
		};
	};
	if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if(skill == TROPHY_Teeth)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_Claws)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_Fur)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_Heart)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_ShadowHorn)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_FireTongue)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_BFWing)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFSting)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_Mandibles)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_CrawlerPlate)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DrgSnapperHorn)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_DragonScale)
		{
			kosten = 10;
		}
		else if(skill == TROPHY_DragonBlood)
		{
			kosten = 10;
		}
		else if(skill == TROPHY_ReptileSkin)
		{
			kosten = 3;
		};
	};
	if(talent == NPC_TALENT_FOREIGNLANGUAGE)
	{
		if(skill == LANGUAGE_1)
		{
			kosten = 3;
		}
		else if(skill == LANGUAGE_2)
		{
			kosten = 5;
		}
		else if(skill == LANGUAGE_3)
		{
			kosten = 5;
		}
		else if(skill == LANGUAGE_4)
		{
			kosten = 10;
		};
	};
	if(talent == NPC_TALENT_RUNES)
	{
		if(skill == SPL_PalLight)
		{
			kosten = 1;
		}
		else if(skill == SPL_PalLightHeal)
		{
			kosten = 3;
		}
		else if(skill == SPL_PalHolyBolt)
		{
			kosten = 3;
		}
		else if(skill == SPL_PalMediumHeal)
		{
			kosten = 5;
		}
		else if(skill == SPL_PalRepelEvil)
		{
			kosten = 5;
		}
		else if(skill == SPL_PalFullHeal)
		{
			kosten = 10;
		}
		else if(skill == SPL_PalDestroyEvil)
		{
			kosten = 10;
		}
		else if(skill == SPL_PalTeleportSecret)
		{
			kosten = 5;
		}
		else if(skill == SPL_Light)
		{
			kosten = 1;
		}
		else if(skill == SPL_LightHeal)
		{
			kosten = 3;
		}
		else if(skill == SPL_UnlockChest)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonWolf)
		{
			kosten = 4;
		}
		else if(skill == SPL_MediumHeal)
		{
			kosten = 5;
		}
		else if(skill == SPL_DestroyUndead)
		{
			kosten = 20;
		}
		else if(skill == SPL_FullHeal)
		{
			kosten = 15;
		}
		else if(skill == SPL_Firebolt)
		{
			kosten = 10;
		}
		else if(skill == SPL_InstantFireball)
		{
			kosten = 20;
		}
		else if(skill == ItRu_RapidFirebolt)
		{
			kosten = 25;
		}
		else if(skill == SPL_Firestorm)
		{
			kosten = 30;
		}
		else if(skill == SPL_MagicCage)
		{
			kosten = 35;
		}
		else if(skill == SPL_SUMMONFIREGOLEM)
		{
			kosten = 25;
		}
		else if(skill == SPL_ChargeFireball)
		{
			kosten = 40;
		}
		else if(skill == SPL_FIRELIGHT)
		{
			kosten = 30;
		}
		else if(skill == SPL_Explosion)
		{
			kosten = 55;
		}
		else if(skill == SPL_Pyrokinesis)
		{
			kosten = 50;
		}
		else if(skill == SPL_Firerain)
		{
			kosten = 60;
		}
		else if(skill == SPL_FireMeteor)
		{
			kosten = 60;
		}
		else if(skill == SPL_Zap)
		{
			kosten = 5;
		}
		else if(skill == SPL_IceLance)
		{
			kosten = 15;
		}
		else if(skill == SPL_Icebolt)
		{
			kosten = 10;
		}
		else if(skill == SPL_RapidIcebolt)
		{
			kosten = 20;
		}
		else if(skill == SPL_IceCube)
		{
			kosten = 25;
		}
		else if(skill == SPL_ChargeZap)
		{
			kosten = 25;
		}
		else if(skill == SPL_AdanosBall)
		{
			kosten = 30;
		}
		else if(skill == SPL_SUMMONSHOAL)
		{
			kosten = 20;
		}
		else if(skill == SPL_LightningFlash)
		{
			kosten = 30;
		}
		else if(skill == SPL_SUMMONICEGOLEM)
		{
			kosten = 30;
		}
		else if(skill == SPL_WaterFist)
		{
			kosten = 40;
		}
		else if(skill == SPL_IceWave)
		{
			kosten = 40;
		}
		else if(skill == SPL_Geyser)
		{
			kosten = 50;
		}
		else if(skill == SPL_Thunderstorm)
		{
			kosten = 60;
		}
		else if(skill == SPL_Sleep)
		{
			kosten = 15;
		}
		else if(skill == SPL_BERZERK)
		{
			kosten = 10;
		}
		else if(skill == SPL_TELEKINESIS)
		{
			kosten = 20;
		}
		else if(skill == SPL_WindFist)
		{
			kosten = 25;
		}
		else if(skill == SPL_Fear)
		{
			kosten = 15;
		}
		else if(skill == SPL_Charm)
		{
			kosten = 30;
		}
		else if(skill == SPL_GreenTentacle)
		{
			kosten = 30;
		}
		else if(skill == SPL_Extricate)
		{
			kosten = 30;
		}
		else if(skill == SPL_SummonGolem)
		{
			kosten = 20;
		}
		else if(skill == SPL_Acid)
		{
			kosten = 30;
		}
		else if(skill == SPL_SUMMONSWAMPGOLEM)
		{
			kosten = 25;
		}
		else if(skill == SPL_SEVEREFETIDITY)
		{
			kosten = 30;
		}
		else if(skill == SPL_Whirlwind)
		{
			kosten = 30;
		}
		else if(skill == SPL_CONTROL)
		{
			kosten = 25;
		}
		else if(skill == SPL_Elevate)
		{
			kosten = 40;
		}
		else if(skill == SPL_Quake)
		{
			kosten = 60;
		}
		else if(skill == SPL_Deathbolt)
		{
			kosten = 15;
		}
		else if(skill == SPL_Rage)
		{
			kosten = 15;
		}
		else if(skill == SPL_Lacerate)
		{
			kosten = 20;
		}
		else if(skill == SPL_SummonGoblinSkeleton)
		{
			kosten = 10;
		}
		else if(skill == SPL_ManaForLife)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonZombie)
		{
			kosten = 15;
		}
		else if(skill == SPL_Swarm)
		{
			kosten = 15;
		}
		else if(skill == SPL_SummonSkeleton)
		{
			kosten = 20;
		}
		else if(skill == SPL_Energyball)
		{
			kosten = 30;
		}
		else if(skill == SPL_SummonDemon)
		{
			kosten = 40;
		}
		else if(skill == SPL_Deathball)
		{
			kosten = 40;
		}
		else if(skill == SPL_ArmyOfDarkness)
		{
			kosten = 30;
		}
		else if(skill == SPL_MassDeath)
		{
			kosten = 60;
		}
		else if(skill == SPL_Skull)
		{
			kosten = 60;
		}
		else if(skill == SPL_BreathOfDeath)
		{
			kosten = 30;
		}
		else if(skill == SPL_MasterOfDisaster)
		{
			kosten = 30;
		}
		else if(skill == SPL_GuruWrath)
		{
			kosten = 50;
		}
		else
		{
			kosten = 5;
		};
	};
	if(talent == NPC_TALENT_GOLDWORK)
	{
		kosten = 1;
	};
	if(talent == NPC_TALENT_ERZWORK)
	{
		kosten = 1;
	};
	if(talent == NPC_TALENT_MAKEARROWS)
	{
		kosten = 2;
	};
	if(talent == NPC_TALENT_STAMINA)
	{
		if(ATR_STAMINA_MAX[0] >= 90)
		{
			kosten = 4;
		}
		else if(ATR_STAMINA_MAX[0] >= 60)
		{
			kosten = 3;
		}
		else if(ATR_STAMINA_MAX[0] >= 30)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};

		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_DEMONOLOG)
	{
		if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
		{
			kosten = 10;
		}
		else if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
		{
			kosten = 20;
		}
		else
		{
			kosten = 10;
		};
	};
	return kosten;
};

func int B_GetLearnCostTalentOrc(var C_Npc oth,var int talent,var int skill)
{
	var int kosten;

	kosten = 0;

	if(talent == NPC_TALENT_MAGE)
	{
		if(skill == 1)
		{
			kosten = 15;
		}
		else if(skill == 2)
		{
			kosten = 30;
		}
		else if(skill == 3)
		{
			kosten = 45;
		}
		else if(skill == 4)
		{
			kosten = 60;
		}
		else if(skill == 5)
		{
			kosten = 75;
		}
		else if(skill == 6)
		{
			kosten = 90;
		};
	};
	if(talent == NPC_TALENT_1H)
	{
		if(oth.aivar[REAL_TALENT_1H] >= 80)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 60)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 40)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 20)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};

		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_2H)
	{
		if(oth.aivar[REAL_TALENT_2H] >= 80)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 60)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 40)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 20)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};

		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_BOW)
	{
		if(oth.aivar[REAL_TALENT_BOW] >= 80)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 60)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 40)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 20)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};

		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(oth.aivar[REAL_TALENT_CROSSBOW] >= 80)
		{
			kosten = 5;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 60)
		{
			kosten = 4;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 40)
		{
			kosten = 3;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 20)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};

		kosten = kosten * skill;
	};
	if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if(skill == TROPHY_Teeth)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_Claws)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_Fur)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_Heart)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_ShadowHorn)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_FireTongue)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_BFWing)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFSting)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_Mandibles)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_CrawlerPlate)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DrgSnapperHorn)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_DragonScale)
		{
			kosten = 10;
		}
		else if(skill == TROPHY_DragonBlood)
		{
			kosten = 10;
		}
		else if(skill == TROPHY_ReptileSkin)
		{
			kosten = 3;
		};
	};
	if(talent == NPC_TALENT_FOREIGNLANGUAGE)
	{
		if(skill == ORC_LANGUAGE)
		{
			kosten = 20;
		};
	};

	return kosten;
};