
func int C_PlayerHasFakeGuild(var C_Npc slf,var C_Npc oth)
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(oth);
	if(slf.aivar[AIV_IgnoresArmor] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IgnoresFakeGuild] == TRUE)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(self) == TRUE)
	{
		return FALSE;
	};
	if((slf.guild == GIL_BDT) && C_PlayerIsFakeBandit(slf,oth))
	{
		if(Npc_HasEquippedArmor(oth) == FALSE)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(Npc_HasEquippedArmor(oth) == FALSE)
	{
		return FALSE;
	}
	else if(slf.guild == oth.guild)
	{
		if((Hlp_IsItem(itm,itar_orearmor) == TRUE) || (Hlp_IsItem(itm,ITAR_Raven_Addon) == TRUE) || (Hlp_IsItem(itm,ItAr_GodArmor) == TRUE))
		{
			return FALSE;
		};
		if((Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v1) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v2) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v3) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v4) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v5) == TRUE))
		{
			return FALSE;
		};
		if(oth.guild == GIL_NONE)
		{
			return FALSE;
		}
		else if((oth.guild == GIL_MIL) && ((Hlp_IsItem(itm,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(itm,ItAr_MIL_M) == TRUE) || (Hlp_IsItem(itm,itar_mil_l_v1) == TRUE) || (Hlp_IsItem(itm,itar_mil_m_v1) == TRUE) || (Hlp_IsItem(itm,itar_mil_m_v12) == TRUE) || (Hlp_IsItem(itm,itar_mil_m_v13) == TRUE) || (Hlp_IsItem(itm,itar_mil_m_v14) == TRUE) || (Hlp_IsItem(itm,itar_mil_m_v15) == TRUE) || (Hlp_IsItem(itm,itar_mil_l_v12) == TRUE) || (Hlp_IsItem(itm,itar_mil_l_v13) == TRUE) || (Hlp_IsItem(itm,itar_mil_l_v14) == TRUE) || (Hlp_IsItem(itm,itar_mil_l_v15) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_PAL) && ((Hlp_IsItem(itm,ItAr_PAL_M) == TRUE) || (Hlp_IsItem(itm,ItAr_PAl_H) == TRUE) || (Hlp_IsItem(itm,itar_pal_m_v1) == TRUE) || (Hlp_IsItem(itm,itar_pal_m_v2) == TRUE) || (Hlp_IsItem(itm,itar_pal_h_v1) == TRUE) || (Hlp_IsItem(itm,itar_pal_h_v2) == TRUE) || (Hlp_IsItem(itm,itar_pal_h_v12) == TRUE) || (Hlp_IsItem(itm,itar_pal_h_v13) == TRUE) || (Hlp_IsItem(itm,itar_pal_h_v14) == TRUE) || (Hlp_IsItem(itm,itar_pal_h_v15) == TRUE) || (Hlp_IsItem(itm,itar_pal_m_v12) == TRUE) || (Hlp_IsItem(itm,itar_pal_m_v13) == TRUE) || (Hlp_IsItem(itm,itar_pal_m_v14) == TRUE) || (Hlp_IsItem(itm,itar_pal_m_v15) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_SLD) && ((Hlp_IsItem(itm,ItAr_Sld_L) == TRUE) || (Hlp_IsItem(itm,itar_sld_M) == TRUE) || (Hlp_IsItem(itm,ItAr_Sld_H) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v1) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v1) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v1) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v2) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v3) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v4) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v5) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v2) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v3) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v4) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v5) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v2) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v3) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v4) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v5) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_DJG) && ((Hlp_IsItem(itm,ItAr_Sld_L) == TRUE) || (Hlp_IsItem(itm,itar_sld_M) == TRUE) || (Hlp_IsItem(itm,ItAr_Sld_H) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v1) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v1) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v1) == TRUE) || (Hlp_IsItem(itm,itar_djg_l) == TRUE) || (Hlp_IsItem(itm,itar_djg_m) == TRUE) || (Hlp_IsItem(itm,itar_djg_h) == TRUE) || (Hlp_IsItem(itm,itar_djg_l_v1) == TRUE) || (Hlp_IsItem(itm,itar_djg_m_v1) == TRUE) || (Hlp_IsItem(itm,itar_djg_h_v1) == TRUE) || (Hlp_IsItem(itm,itar_djg_h_v2) == TRUE) || (Hlp_IsItem(itm,itar_djg_h_v3) == TRUE) || (Hlp_IsItem(itm,itar_djg_h_v4) == TRUE) || (Hlp_IsItem(itm,itar_djg_h_v5) == TRUE) || (Hlp_IsItem(itm,itar_djg_m_v2) == TRUE) || (Hlp_IsItem(itm,itar_djg_m_v3) == TRUE) || (Hlp_IsItem(itm,itar_djg_m_v4) == TRUE) || (Hlp_IsItem(itm,itar_djg_m_v5) == TRUE) || (Hlp_IsItem(itm,itar_djg_l_v2) == TRUE) || (Hlp_IsItem(itm,itar_djg_l_v3) == TRUE) || (Hlp_IsItem(itm,itar_djg_l_v4) == TRUE) || (Hlp_IsItem(itm,itar_djg_l_v5) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v2) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v3) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v4) == TRUE) || (Hlp_IsItem(itm,itar_sld_h_v5) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v2) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v3) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v4) == TRUE) || (Hlp_IsItem(itm,itar_sld_m_v5) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v2) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v3) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v4) == TRUE) || (Hlp_IsItem(itm,itar_sld_l_v5) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_NOV) && (Hlp_IsItem(itm,ItAr_NOV_L) == TRUE))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_KDF) && ((Hlp_IsItem(itm,ItAr_KDF_L) == TRUE) || (Hlp_IsItem(itm,itar_kdf_m) == TRUE) || (Hlp_IsItem(itm,ItAr_KDF_H) == TRUE) || (Hlp_IsItem(itm,ITAR_KDF_H_BLESSED) == TRUE) || (Hlp_IsItem(itm,ItAr_KDF_SH) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_NDW) && (Hlp_IsItem(itm,itar_ndw_l) == TRUE))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_KDW) && ((Hlp_IsItem(itm,ITAR_KDW_L_Addon) == TRUE) || (Hlp_IsItem(itm,itar_kdw_h) == TRUE) || (Hlp_IsItem(itm,itar_kdw_sh) == TRUE) || (Hlp_IsItem(itm,ITAR_KDW_ADANOS) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_NDM) && (Hlp_IsItem(itm,itar_ndm_l) == TRUE))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_KDM) && ((Hlp_IsItem(itm,itar_dmt_l) == TRUE) || (Hlp_IsItem(itm,itar_dmt_h) == TRUE) || (Hlp_IsItem(itm,ITAR_DMT_H_BELIAR_1) == TRUE) || (Hlp_IsItem(itm,ITAR_DMT_H_BELIAR_3) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_SEK) && ((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_TPL) && ((Hlp_IsItem(itm,itar_tpl_l) == TRUE) || (Hlp_IsItem(itm,itar_tpl_l_v1) == TRUE) || (Hlp_IsItem(itm,itar_tpl_m) == TRUE) || (Hlp_IsItem(itm,itar_tpl_m_v1) == TRUE) || (Hlp_IsItem(itm,itar_tpl_s) == TRUE) || (Hlp_IsItem(itm,itar_tpl_s_v1) == TRUE) || (Hlp_IsItem(itm,itar_tpl_s_v2) == TRUE) || (Hlp_IsItem(itm,itar_tpl_s_v3) == TRUE) || (Hlp_IsItem(itm,itar_tpl_s_v4) == TRUE) || (Hlp_IsItem(itm,itar_tpl_s_v5) == TRUE) || (Hlp_IsItem(itm,itar_tpl_m_v2) == TRUE) || (Hlp_IsItem(itm,itar_tpl_m_v3) == TRUE) || (Hlp_IsItem(itm,itar_tpl_m_v4) == TRUE) || (Hlp_IsItem(itm,itar_tpl_m_v5) == TRUE) || (Hlp_IsItem(itm,itar_tpl_l_v2) == TRUE) || (Hlp_IsItem(itm,itar_tpl_l_v3) == TRUE) || (Hlp_IsItem(itm,itar_tpl_l_v4) == TRUE) || (Hlp_IsItem(itm,itar_tpl_l_v5) == TRUE) || (Hlp_IsItem(itm,itar_tpl_lst) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_GUR) && ((Hlp_IsItem(itm,itar_gur_l) == TRUE) || (Hlp_IsItem(itm,itar_gur_h) == TRUE)))
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
	return FALSE;
};

