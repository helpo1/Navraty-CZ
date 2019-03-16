/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func int c_schasrareweapons - itmw_1h_Crest (cyrilice -> latinka)

*/




func int c_schasrareweapons()
{
	if((Npc_HasItems(hero,ItMw_Morgenstern) >= 1) || (Npc_HasItems(hero,ItMw_Inquisitor) >= 1) || (Npc_HasItems(hero,ItMw_Rabenschnabel) >= 1) || (Npc_HasItems(hero,ITMW_2H_MACE_107) >= 1) || (Npc_HasItems(hero,ItMw_2H_Volebir) >= 1) || (Npc_HasItems(hero,ItMw_2H_IceHammer) >= 1) || (Npc_HasItems(hero,ItMw_1H_MolagBarMace) >= 1) || (Npc_HasItems(hero,ItMw_2H_SharpTeeth) >= 1) || (Npc_HasItems(hero,ItMw_Drakesaebel) >= 1) || (Npc_HasItems(hero,ITMW_1H_SWORD_LONG_05) >= 1) || (Npc_HasItems(hero,ItMw_Sturmbringer) >= 1) || (Npc_HasItems(hero,itmw_1h_Crest) >= 1) || (Npc_HasItems(hero,ItMw_Orkschlaechter) >= 1) || (Npc_HasItems(hero,ITMW_FEARUND) >= 1) || (Npc_HasItems(hero,ITMW_1H_KMR_SNAKESWORD_01) >= 1) || (Npc_HasItems(hero,itmw_normardsword) >= 1) || (Npc_HasItems(hero,ITMW_1H_BLACKSWORD) >= 1) || (Npc_HasItems(hero,ITMW_1H_G3A_DAEMONBLADE_01) >= 1) || (Npc_HasItems(hero,ItMw_1H_GinnokSword) >= 1) || (Npc_HasItems(hero,ItMw_Schlachtaxt) >= 1) || (Npc_HasItems(hero,ITMW_2H_KMR_SOULSWORD_01) >= 1) || (Npc_HasItems(hero,ItMw_Drachenschneide) >= 1) || (Npc_HasItems(hero,ItMw_RuneAxeAncient) >= 1) || (Npc_HasItems(hero,ITMW_2H_KMR_RHOBAR_01) >= 1) || (Npc_HasItems(hero,ItMw_DemonHand) >= 1) || (Npc_HasItems(hero,itmw_2h_urizel) >= 1) || (Npc_HasItems(hero,itmw_2h_urizel_nomagic) >= 1) || (Npc_HasItems(hero,itmw_2h_weltenspalter) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

func int C_SCHasBeliarsRune()
{
	if((Npc_HasItems(hero,itru_beliarsrune01) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune02) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune03) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune04) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune05) == TRUE) || (Npc_HasItems(hero,itru_beliarsrune06) == TRUE))
	{
		if(BELIARWEAPUPG06 == FALSE)
		{
			return TRUE;
		};

		return FALSE;
	};

	return FALSE;
};

func int C_ScHasBeliarsWeapon()
{
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20) || C_SCHasBeliarsRune())
	{
		return TRUE;
	};

	return FALSE;
};

func int C_IsItemBeliarsWeapon(var C_Item Weap)
{
	if((Hlp_IsItem(Weap,ItMw_BeliarWeapon_Raven) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_01) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_02) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_03) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_04) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_05) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_06) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_07) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_08) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_09) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_10) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_11) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_12) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_13) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_14) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_15) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_16) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_17) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_18) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_19) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_1H_20) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_01) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_02) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_03) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_04) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_05) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_06) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_07) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_08) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_09) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_10) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_11) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_12) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_13) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_14) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_15) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_16) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_17) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_18) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_19) == TRUE) || (Hlp_IsItem(Weap,ItMw_BeliarWeapon_2H_20) == TRUE) || (Hlp_IsItem(Weap,itru_beliarsrune01) == TRUE) || (Hlp_IsItem(Weap,itru_beliarsrune02) == TRUE) || (Hlp_IsItem(Weap,itru_beliarsrune03) == TRUE) || (Hlp_IsItem(Weap,itru_beliarsrune04) == TRUE) || (Hlp_IsItem(Weap,itru_beliarsrune05) == TRUE) || (Hlp_IsItem(Weap,itru_beliarsrune06) == TRUE))
	{
		return TRUE;
	};

	return FALSE;
};

func int C_ScHasReadiedBeliarsWeapon()
{
	var C_Item ReadyWeap;
	ReadyWeap = Npc_GetReadiedWeapon(hero);

	if(C_IsItemBeliarsWeapon(ReadyWeap))
	{
		return TRUE;
	};

	return FALSE;
};

func int C_ScHasEquippedBeliarsWeapon()
{
	var C_Item EquipWeap;
	EquipWeap = Npc_GetEquippedMeleeWeapon(hero);

	if(C_IsItemBeliarsWeapon(EquipWeap))
	{
		return TRUE;
	};

	return FALSE;
};

func void B_ClearBeliarsWeapon()
{
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_Raven,Npc_HasItems(hero,ItMw_BeliarWeapon_Raven));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_01,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_02,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_03,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_04,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_05,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_06,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_07,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_08,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_09,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_10,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_11,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_12,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_13,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_14,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_15,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_16,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_17,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_18,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_19,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_1H_20,Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_01,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_02,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_03,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_04,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_05,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_06,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_07,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_08,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_09,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_10,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_11,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_12,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_13,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_14,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_15,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_16,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_17,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_18,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_19,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19));
	Npc_RemoveInvItems(hero,ItMw_BeliarWeapon_2H_20,Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20));
	Npc_RemoveInvItems(hero,itru_beliarsrune01,Npc_HasItems(hero,itru_beliarsrune01));
	Npc_RemoveInvItems(hero,itru_beliarsrune02,Npc_HasItems(hero,itru_beliarsrune02));
	Npc_RemoveInvItems(hero,itru_beliarsrune03,Npc_HasItems(hero,itru_beliarsrune03));
	Npc_RemoveInvItems(hero,itru_beliarsrune04,Npc_HasItems(hero,itru_beliarsrune04));
	Npc_RemoveInvItems(hero,itru_beliarsrune05,Npc_HasItems(hero,itru_beliarsrune05));
	Npc_RemoveInvItems(hero,itru_beliarsrune06,Npc_HasItems(hero,itru_beliarsrune06));
};

//---------------------Kotgot' s dushoy demona---------------------------------------------

func void b_getbeliarsuperweapon()
{
	var int randy;

	if(BELIARPRAYCOUNT > 100)
	{
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
		Snd_Play("DEM_Warn");
		B_ClearBeliarsWeapon();
		Npc_RemoveInvItems(hero,itmi_stonesoul_senyak,1);

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NOV))
		{
			CreateInvItems(self,itru_beliarsuperrune,1);
			NUMBERBELIARRUNE = 1;
		}
		else
		{
			randy = Hlp_Random(100);

			if(hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
			{
				CreateInvItems(self,itmw_beliarsuperweapon_1h,1);
				NUMBERBELIARRUNE = 2;
			}
			else if(hero.HitChance[NPC_TALENT_1H] < hero.HitChance[NPC_TALENT_2H])
			{
				CreateInvItems(self,itmw_beliarsuperweapon_2h,1);
				NUMBERBELIARRUNE = 3;
			}
			else if(hero.HitChance[NPC_TALENT_1H] == hero.HitChance[NPC_TALENT_2H])
			{
				if(randy >= 50)
				{
					CreateInvItems(self,itmw_beliarsuperweapon_1h,1);
					NUMBERBELIARRUNE = 2;
				}
				else
				{
					CreateInvItems(self,itmw_beliarsuperweapon_2h,1);
					NUMBERBELIARRUNE = 3;
				};
			};
		};

		BELIARSUPERWEAPONGIVES = TRUE;
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSIGNORESYOU);
	};
};

//------------------------------------------------------------------

var int BeliarWeapNextLvL;
var int BeliarWeapCurrentLvL;

func int C_ScCanUpgrateBeliarsWeapon()
{
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NOV))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 6)
		{
			BeliarWeapNextLvL = 6;
			return TRUE;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
		{
			BeliarWeapNextLvL = 5;
			return TRUE;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
		{
			BeliarWeapNextLvL = 4;
			return TRUE;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
		{
			BeliarWeapNextLvL = 3;
			return TRUE;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
		{
			BeliarWeapNextLvL = 2;
			return TRUE;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
		{
			BeliarWeapNextLvL = 1;
			return TRUE;
		}
		else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == FALSE)
		{
			return FALSE;
		};

		return FALSE;
	}
	else if(hero.level > 60)
	{
		BeliarWeapNextLvL = 20;
	}
	else if(hero.level > 50)
	{
		BeliarWeapNextLvL = 19;
	}
	else if(hero.level > 45)
	{
		BeliarWeapNextLvL = 18;
	}
	else if(hero.level > 44)
	{
		BeliarWeapNextLvL = 17;
	}
	else if(hero.level > 43)
	{
		BeliarWeapNextLvL = 16;
	}
	else if(hero.level > 42)
	{
		BeliarWeapNextLvL = 15;
	}
	else if(hero.level > 41)
	{
		BeliarWeapNextLvL = 14;
	}
	else if(hero.level > 40)
	{
		BeliarWeapNextLvL = 13;
	}
	else if(hero.level > 38)
	{
		BeliarWeapNextLvL = 12;
	}
	else if(hero.level > 36)
	{
		BeliarWeapNextLvL = 11;
	}
	else if(hero.level > 32)
	{
		BeliarWeapNextLvL = 10;
	}
	else if(hero.level > 28)
	{
		BeliarWeapNextLvL = 9;
	}
	else if(hero.level > 24)
	{
		BeliarWeapNextLvL = 8;
	}
	else if(hero.level > 20)
	{
		BeliarWeapNextLvL = 7;
	}
	else if(hero.level > 18)
	{
		BeliarWeapNextLvL = 6;
	}
	else if(hero.level > 16)
	{
		BeliarWeapNextLvL = 5;
	}
	else if(hero.level > 14)
	{
		BeliarWeapNextLvL = 4;
	}
	else if(hero.level > 12)
	{
		BeliarWeapNextLvL = 3;
	}
	else if(hero.level > 10)
	{
		BeliarWeapNextLvL = 2;
	}
	else if(hero.level <= 10)
	{
		BeliarWeapNextLvL = 1;
	};

	if(BeliarWeapCurrentLvL < BeliarWeapNextLvL)
	{
		return TRUE;
	};

	return FALSE;
};

func void B_UpgrateBeliarsWeapon()
{
	var string concatText;
	var int canupgradebeliar;
	var int HasSouls;
	var int NeedSouls;
	var int TempNeedSouls;

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		if(BELIARPRAYCOUNT >= (BeliarWeapNextLvL * 15))
		{
			canupgradebeliar = TRUE;
		}
		else
		{
			canupgradebeliar = FALSE;
		};
	}
	else if(BELIARPRAYCOUNT >= (BeliarWeapNextLvL * 10))
	{
		canupgradebeliar = TRUE;
	}
	else
	{
		canupgradebeliar = FALSE;
	};

	if(canupgradebeliar == TRUE)
	{
		BeliarWeapCurrentLvL = BeliarWeapNextLvL;

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NOV))
		{
			Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);

			if((BeliarWeapCurrentLvL == 1) && (BELIARWEAPUPG01 == FALSE))
			{
				Info_AddChoice(pc_prayidol_upgratebeliarsweapon,NAME_GIFT_BELIARSRUNE_01,pc_prayidol_upgratebeliarsweapon_beliarsrune_01);
			};
			if((BeliarWeapCurrentLvL == 2) && (BELIARWEAPUPG02 == FALSE))
			{
				Info_AddChoice(pc_prayidol_upgratebeliarsweapon,NAME_GIFT_BELIARSRUNE_02,pc_prayidol_upgratebeliarsweapon_beliarsrune_02);
			};
			if((BeliarWeapCurrentLvL == 3) && (BELIARWEAPUPG03 == FALSE))
			{
				Info_AddChoice(pc_prayidol_upgratebeliarsweapon,NAME_GIFT_BELIARSRUNE_03,pc_prayidol_upgratebeliarsweapon_beliarsrune_03);
			};
			if((BeliarWeapCurrentLvL == 4) && (BELIARWEAPUPG04 == FALSE))
			{
				Info_AddChoice(pc_prayidol_upgratebeliarsweapon,NAME_GIFT_BELIARSRUNE_04,pc_prayidol_upgratebeliarsweapon_beliarsrune_04);
			};
			if((BeliarWeapCurrentLvL == 5) && (BELIARWEAPUPG05 == FALSE))
			{
				Info_AddChoice(pc_prayidol_upgratebeliarsweapon,NAME_GIFT_BELIARSRUNE_05,pc_prayidol_upgratebeliarsweapon_beliarsrune_05);
			};
			if((BeliarWeapCurrentLvL >= 6) && (BELIARWEAPUPG06 == FALSE))
			{
				Info_AddChoice(pc_prayidol_upgratebeliarsweapon,NAME_GIFT_BELIARSRUNE_06,pc_prayidol_upgratebeliarsweapon_beliarsrune_06);
			};
		}
		else if(hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
		{
			HasSouls = Npc_HasItems(hero,itmi_stonesoul);
			NeedSouls = HasSouls + AllCountBeliarWeapSouls;

			if(BeliarWeapCurrentLvL <= 1)
			{
				if(NeedSouls >= 20)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 20 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_01);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 20 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 2)
			{
				if(NeedSouls >= 40)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 40 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_02);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 40 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 3)
			{
				if(NeedSouls >= 60)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 60 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_03);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 60 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 4)
			{
				if(NeedSouls >= 80)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 80 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_04);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 80 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 5)
			{
				if(NeedSouls >= 100)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 100 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_05);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 100 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 6)
			{
				if(NeedSouls >= 120)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 120 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_06);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 120 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 7)
			{
				if(NeedSouls >= 140)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 140 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_07);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 140 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 8)
			{
				if(NeedSouls >= 160)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 160 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_08);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 160 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 9)
			{
				if(NeedSouls >= 180)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 180 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_09);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 180 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 10)
			{
				if(NeedSouls >= 200)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 200 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_10);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 200 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 11)
			{
				if(NeedSouls >= 220)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 220 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_11);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 220 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 12)
			{
				if(NeedSouls >= 240)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 240 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_12);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 240 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 13)
			{
				if(NeedSouls >= 260)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 260 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_13);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 260 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 14)
			{
				if(NeedSouls >= 280)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 280 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_14);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 280 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 15)
			{
				if(NeedSouls >= 300)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 300 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_15);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 300 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 16)
			{
				if(NeedSouls >= 320)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 320 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_16);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 320 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 17)
			{
				if(NeedSouls >= 340)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 340 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_17);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 340 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 18)
			{
				if(NeedSouls >= 360)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 360 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_18);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 360 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 19)
			{
				if(NeedSouls >= 380)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 380 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_19);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 380 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 20)
			{
				if(NeedSouls >= 400)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 400 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_1H_20);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
					Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 400 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			};
		}
		else
		{
			HasSouls = Npc_HasItems(hero,itmi_stonesoul);
			NeedSouls = HasSouls + AllCountBeliarWeapSouls;

			if(BeliarWeapCurrentLvL <= 1)
			{
				if(NeedSouls >= 20)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 20 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_01);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 20 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 2)
			{
				if(NeedSouls >= 40)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 40 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_02);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 40 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 3)
			{
				if(NeedSouls >= 60)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 60 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_03);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 60 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 4)
			{
				if(NeedSouls >= 80)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 80 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_04);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 80 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 5)
			{
				if(NeedSouls >= 100)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 100 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_05);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 100 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 6)
			{
				if(NeedSouls >= 120)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 120 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_06);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 120 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 7)
			{
				if(NeedSouls >= 140)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 140 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_07);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 140 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 8)
			{
				if(NeedSouls >= 160)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 160 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_08);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 160 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 9)
			{
				if(NeedSouls >= 180)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 180 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_09);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 180 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 10)
			{
				if(NeedSouls >= 200)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 200 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_10);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 200 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 11)
			{
				if(NeedSouls >= 220)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 220 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_11);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 220 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 12)
			{
				if(NeedSouls >= 240)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 240 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_12);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 240 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 13)
			{
				if(NeedSouls >= 260)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 260 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_13);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 260 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 14)
			{
				if(NeedSouls >= 280)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 280 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_14);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 280 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 15)
			{
				if(NeedSouls >= 300)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 300 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_15);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 300 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 16)
			{
				if(NeedSouls >= 320)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 320 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_16);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 320 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 17)
			{
				if(NeedSouls >= 340)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 340 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_17);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 340 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 18)
			{
				if(NeedSouls >= 360)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 360 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_18);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 360 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 19)
			{
				if(NeedSouls >= 380)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 380 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_19);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 380 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			}
			else if(BeliarWeapCurrentLvL == 20)
			{
				if(NeedSouls >= 400)
				{
					B_ClearBeliarsWeapon();
					TempNeedSouls = 400 - AllCountBeliarWeapSouls;
					
					if(TempNeedSouls > 0)
					{
						AllCountBeliarWeapSouls += TempNeedSouls;
						Npc_RemoveInvItems(hero,itmi_stonesoul,TempNeedSouls);
					};

					CreateInvItem(hero,ItMw_BeliarWeapon_2H_20);
					Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
					Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
					Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
					Snd_Play("CS_Prayer_WaveOfInsanity");
					BeliarsWeaponUpgrated = TRUE;
				}
				else
				{
					TempNeedSouls = 400 - AllCountBeliarWeapSouls;
					concatText = ConcatStrings("Chybí ",IntToString(TempNeedSouls));
					concatText = ConcatStrings(concatText," duší!");
					Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
					AI_Print(concatText);
				};
			};
		};
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSIGNORESYOU);
	};
};

func void pc_prayidol_upgratebeliarsweapon_beliarsrune_01()
{
	if(Npc_HasItems(hero,itmi_stonesoul) >= 20)
	{
		B_ClearBeliarsWeapon();
		Npc_RemoveInvItems(hero,itmi_stonesoul,20);
		CreateInvItems(self,itru_beliarsrune01,1);
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
		BELIARWEAPUPG01 = TRUE;
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSNOSOULS);
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	};
};

func void pc_prayidol_upgratebeliarsweapon_beliarsrune_02()
{
	if(Npc_HasItems(hero,itmi_stonesoul) >= 40)
	{
		B_ClearBeliarsWeapon();
		Npc_RemoveInvItems(hero,itmi_stonesoul,40);
		CreateInvItems(self,itru_beliarsrune02,1);
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
		BELIARWEAPUPG02 = TRUE;
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSNOSOULS);
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	};
};

func void pc_prayidol_upgratebeliarsweapon_beliarsrune_03()
{
	if(Npc_HasItems(hero,itmi_stonesoul) >= 60)
	{
		B_ClearBeliarsWeapon();
		Npc_RemoveInvItems(hero,itmi_stonesoul,60);
		CreateInvItems(self,itru_beliarsrune03,1);
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
		BELIARWEAPUPG03 = TRUE;
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSNOSOULS);
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	};
};

func void pc_prayidol_upgratebeliarsweapon_beliarsrune_04()
{
	if(Npc_HasItems(hero,itmi_stonesoul) >= 80)
	{
		B_ClearBeliarsWeapon();
		Npc_RemoveInvItems(hero,itmi_stonesoul,80);
		CreateInvItems(self,itru_beliarsrune04,1);
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
		BELIARWEAPUPG04 = TRUE;
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSNOSOULS);
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	};
};

func void pc_prayidol_upgratebeliarsweapon_beliarsrune_05()
{
	if(Npc_HasItems(hero,itmi_stonesoul) >= 100)
	{
		B_ClearBeliarsWeapon();
		Npc_RemoveInvItems(hero,itmi_stonesoul,100);
		CreateInvItems(self,itru_beliarsrune05,1);
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
		BELIARWEAPUPG05 = TRUE;
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSNOSOULS);
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	};
};

func void pc_prayidol_upgratebeliarsweapon_beliarsrune_06()
{
	if(Npc_HasItems(hero,itmi_stonesoul) >= 150)
	{
		Wld_PlayEffect("spellFX_BeliarsWeapon_Upgrate",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		B_ClearBeliarsWeapon();
		Npc_RemoveInvItems(hero,itmi_stonesoul,150);
		CreateInvItems(self,itru_beliarsrune06,1);
		Snd_Play("CS_Prayer_WaveOfInsanity");
		BeliarsWeaponUpgrated = TRUE;
		BELIARWEAPUPG06 = TRUE;
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	}
	else
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		AI_Print(PRINT_BLESSNOSOULS);
		Info_ClearChoices(pc_prayidol_upgratebeliarsweapon);
	};
};

func void b_givebeliarsouls()
{
	var int allcountsouls;
	var int allcountsoulshp;
	var int SoulsXP;
	var int SoulsHP;

	allcountsouls = Npc_HasItems(hero,itmi_stonesoul);
	SoulsOfAllTime = SoulsOfAllTime + allcountsouls;

	if(allcountsouls >= 10)
	{
		SoulsHP = allcountsouls / 10;
	};

	SoulsXP = allcountsouls;
	Npc_RemoveInvItems(hero,itmi_stonesoul,allcountsouls);
	B_Say(self,self,"$SACR_BELIAR");

	if(SoulsOfAllTime >= 1000)
	{
		AI_Print(PRINT_BLESSBELIARPRAY);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);

		if(hero.guild == GIL_KDM)
		{
			B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,15);
			Npc_ChangeAttribute(hero,ATR_MANA,15);
		}
		else if(hero.guild == GIL_KDF)
		{
			B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,5);
			Npc_ChangeAttribute(hero,ATR_MANA,5);
		}
		else if((hero.guild == GIL_KDW) || (hero.guild == GIL_GUR))
		{
			B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,10);
			Npc_ChangeAttribute(hero,ATR_MANA,10);
		}
		else if(hero.guild == GIL_PAL)
		{
			if(hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
			{
				B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,5);
			}
			else
			{
				B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,5);
			};
		}
		else
		{
			if(hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
			{
				B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,10);
			}
			else
			{
				B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,10);
			};
		};

		SoulsOfAllTime = FALSE;
	}
	else
	{
		if(hero.guild == GIL_KDM)
		{
			AI_Print(PRINT_BLESSBELIARPRAY);
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);

			if(SoulsHP > 0)
			{
				BELIARPRAYCOUNT = BELIARPRAYCOUNT + SoulsHP;
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + SoulsHP;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + SoulsHP;
				b_giveplayerxpsemiquietwithbonus(SoulsXP,SoulsHP);
			}
			else
			{
				b_giveplayerxpsemiquiet(SoulsXP);
			};
		}
		else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			AI_Print(PRINT_BLESSBELIARPRAYPALKDF);
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);

			if(SoulsHP > 0)
			{
				INNOSPRAYCOUNT = INNOSPRAYCOUNT - SoulsHP;
			};

			b_giveplayerxpsemiquiet(SoulsXP);
		}
		else
		{
			AI_Print(PRINT_BLESSBELIARPRAYNOKDM);
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);

			if(SoulsHP >= 10)
			{
				SoulsHP = SoulsHP / 10;
				BELIARPRAYCOUNT = BELIARPRAYCOUNT + SoulsHP;
				hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + SoulsHP;
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + SoulsHP;
				b_giveplayerxpsemiquietwithbonus(SoulsXP,SoulsHP);
			}
			else
			{
				b_giveplayerxpsemiquiet(SoulsXP);
			};
		};
	};

	//print_percent_bar_karma_beliar(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",90,64);
};

func void b_givebeliarsouls_SENYAK()
{
	var int SoulsXP;
	var int SoulsHP;

	B_Say(self,self,"$SACR_BELIAR");

	if(hero.guild == GIL_KDM)
	{
		AI_Print(PRINT_BLESSBELIARPRAY);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,itmi_stonesoul_senyak,1);
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 10;
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 30;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 30;
		SoulsXP = 3000;
		SoulsHP = 30;
		b_giveplayerxpsemiquietwithbonus(SoulsXP,SoulsHP);
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Print(PRINT_BLESSBELIARPRAY);
		Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,itmi_stonesoul_senyak,1);
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 3;
		INNOSPRAYCOUNT = INNOSPRAYCOUNT - 3;
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 10;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 10;
		SoulsXP = 1000;
		SoulsHP = 10;
		b_giveplayerxpsemiquietwithbonus(SoulsXP,SoulsHP);
	}
	else
	{
		AI_Print(PRINT_BLESSBELIARPRAYNOKDM);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Npc_RemoveInvItems(hero,itmi_stonesoul_senyak,1);
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 3;
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 15;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 15;
		SoulsXP = 1500;
		SoulsHP = 15;
		b_giveplayerxpsemiquietwithbonus(SoulsXP,SoulsHP);
	};

	//print_percent_bar_karma_beliar(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",90,64);
};