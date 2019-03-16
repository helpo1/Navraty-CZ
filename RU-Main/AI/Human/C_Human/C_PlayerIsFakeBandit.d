
func int C_PlayerIsFakeBandit(var C_Npc slf,var C_Npc oth)
{
	var C_Item itm;

	if(slf.aivar[AIV_IgnoresArmor] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IgnoresFakeGuild] == TRUE)
	{
		return FALSE;
	};
	if(slf.guild == GIL_PIR)
	{
		return FALSE;
	};
	if(GLOBAL_MAKE_BANDIT_FORCITY == 1)
	{
		if(slf.guild == GIL_MIL)
		{
			return TRUE;
		};
		if(slf.guild == GIL_PAL)
		{
			return TRUE;
		};
		if(slf.guild == GIL_VLK)
		{
			return TRUE;
		};
	};
	if(GLOBAL_MAKE_BANDIT_FORMON == 1)
	{
		if(slf.guild == GIL_KDF)
		{
			return TRUE;
		};
		if(slf.guild == GIL_NOV)
		{
			return TRUE;
		};
	};
	if(GLOBAL_MAKE_BANDIT_FORFARM == 1)
	{
		if(slf.guild == GIL_BAU)
		{
			return TRUE;
		};
		if(slf.guild == GIL_SLD)
		{
			return TRUE;
		};
	};
	if(GLOBAL_MAKE_BANDIT_FORCOAST == 1)
	{
		if(slf.guild == GIL_OUT)
		{
			return TRUE;
		};
	};
	if(GLOBAL_MAKE_BANDIT_FORPSICAMP == 1)
	{
		if(slf.guild == GIL_GUR)
		{
			return TRUE;
		};
		if(slf.guild == GIL_TPL)
		{
			return TRUE;
		};
		if(slf.guild == GIL_SEK)
		{
			return TRUE;
		};
	};
	if(Npc_HasEquippedArmor(oth) == TRUE)
	{
		itm = Npc_GetEquippedArmor(oth);

		if((slf.guild == GIL_BDT) && (CurrentLevel == ADDONWORLD_ZEN) && ((Player_HasTalkedToBanditCamp == TRUE) || (BDT_1071_Addon_Ramon.aivar[AIV_PASSGATE] == TRUE)))
		{
			if((Hlp_IsItem(itm,ItAr_KDF_SH) == TRUE) || (Hlp_IsItem(itm,ITAR_KDF_H_BLESSED) == TRUE) || (Hlp_IsItem(itm,ItAr_KDF_H) == TRUE) || (Hlp_IsItem(itm,ITAR_KDF_M_NEW) == TRUE) || (Hlp_IsItem(itm,ITAR_KDF_M) == TRUE) || (Hlp_IsItem(itm,ItAr_KDF_L) == TRUE) || (Hlp_IsItem(itm,ItAr_NOV_L) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_H_V2) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_H_V15) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_H_V14) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_H_V13) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_H_V12) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_H_V1) == TRUE) || (Hlp_IsItem(itm,ItAr_PAl_H) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_M_V2) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_M_V15) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_M_V14) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_M_V13) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_M_V12) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_M_V1) == TRUE) || (Hlp_IsItem(itm,ItAr_PAL_M) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_L) == TRUE) || (Hlp_IsItem(itm,ITAR_MIL_L_V15) == TRUE) || (Hlp_IsItem(itm,ITAR_MIL_L_V14) == TRUE) || (Hlp_IsItem(itm,ITAR_MIL_L_V13) == TRUE) || (Hlp_IsItem(itm,ITAR_MIL_L_V12) == TRUE) || (Hlp_IsItem(itm,ITAR_MIL_L_V1) == TRUE) || (Hlp_IsItem(itm,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(itm,ITAR_TOWNGUARD) == TRUE))
			{
				return FALSE;
			}
			else
			{
				return TRUE;
			};
		}
		else if((CurrentLevel != PRIORATWORLD_ZEN) && ((Hlp_IsItem(itm,ItAr_BDT_M) == TRUE) || (Hlp_IsItem(itm,ItAr_BDT_H) == TRUE) || (Hlp_IsItem(itm,ITAR_BDT_F) == TRUE)))
		{
			return TRUE;
		}
		else if((slf.guild == GIL_BDT) && (CurrentLevel == ADDONWORLD_ZEN) && (Kapitel >= 4))
		{
			return TRUE;
		}
		else if((CurrentLevel == PRIORATWORLD_ZEN) && (PlayerIsPrioratFake == FALSE) && ((Hlp_IsItem(itm,ITAR_ASSASINS_01) == TRUE) || (Hlp_IsItem(itm,ITAR_ASSASINS_02) == TRUE) || (Hlp_IsItem(itm,ITAR_ASSASINS_03) == TRUE) || (Hlp_IsItem(itm,ITAR_ASSASINS_04) == TRUE)))
		{
			if(HelmIsUp == TRUE)
			{
				return FALSE;
			}
			else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				return FALSE;
			}
			else
			{
				return TRUE;
			};
		}
		else
		{
			return FALSE;
		};
	}
	else
	{
		return FALSE;
	};

	return FALSE;
};

func int c_equipulumulu(var C_Npc oth)
{
	var C_Item heroweapon;

	heroweapon = Npc_GetEquippedMeleeWeapon(oth);

	if(Hlp_IsItem(heroweapon,itmw_2h_orcprestige) == TRUE)
	{
		return TRUE;
	};

	return FALSE;
};

func int c_rediedulumulu(var C_Npc oth)
{
	var C_Item heroweaponredied;

	heroweaponredied = Npc_GetReadiedWeapon(oth);

	if(Hlp_IsItem(heroweaponredied,itmw_2h_orcprestige) == TRUE)
	{
		return TRUE;
	};

	return FALSE;
};