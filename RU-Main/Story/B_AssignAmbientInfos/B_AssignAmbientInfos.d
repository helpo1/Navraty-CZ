
func void B_AssignAmbientInfos(var C_Npc slf)
{
	if(slf.npcType == NPCTYPE_XBSAMBIENT)
	{
		b_assignambientinfos_xbs(slf);
	};
	if(slf.guild == GIL_SEK)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				b_assignambientinfos_sek_2(slf);
			}
			else if(slf.voice == 3)
			{
				b_assignambientinfos_sek_3(slf);
			}
			else if(slf.voice == 5)
			{
				b_assignambientinfos_sek_5(slf);
			};
		};
	};
	if(slf.guild == GIL_TPL)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 8)
			{
				b_assignambientinfos_tpl_8(slf);
			}
			else if(slf.voice == 9)
			{
				b_assignambientinfos_tpl_9(slf);
			}
			else if(slf.voice == 13)
			{
				b_assignambientinfos_tpl_13(slf);
			};
		};
	};
	if(slf.guild == GIL_VLK)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_VLK_1(slf);
			}
			else if(slf.voice == 6)
			{
				B_AssignAmbientInfos_VLK_6(slf);
			}
			else if(slf.voice == 8)
			{
				B_AssignAmbientInfos_VLK_8(slf);
			}
			else if(slf.voice == 16)
			{
				B_AssignAmbientInfos_VLK_16(slf);
			}
			else if(slf.voice == 17)
			{
				B_AssignAmbientInfos_VLK_17(slf);
			};
		};
	};
	if(slf.guild == GIL_MIL)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_MIL_6(slf);
			}
			else if(slf.voice == 7)
			{
				B_AssignAmbientInfos_MIL_7(slf);
			}
			else if(slf.voice == 8)
			{
				b_assignambientinfos_mil_8(slf);
			};
		};
		if(slf.npcType == NPCTYPE_OCAMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_OCVLK_1(slf);
			}
			else if(slf.voice == 6)
			{
				B_AssignAmbientInfos_OCVLK_6(slf);
			};
		};
		if(slf.npcType == NPCTYPE_CSP_AMBIENT)
		{
			b_assignambientinfos_csp(slf);
		};
	};
	if(slf.guild == GIL_PAL)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 4)
			{
				B_AssignAmbientInfos_PAL_4(slf);
			}
			else if(slf.voice == 9)
			{
				B_AssignAmbientInfos_PAL_9(slf);
			}
			else if(slf.voice == 12)
			{
				B_AssignAmbientInfos_PAL_12(slf);
			}
			else if(slf.voice == 13)
			{
				b_assignambientinfos_pal_13(slf);
			};
		};
		if(slf.npcType == NPCTYPE_OCAMBIENT)
		{
			if(slf.voice == 4)
			{
				B_AssignAmbientInfos_OCPAL_4(slf);
			}
			else if(slf.voice == 9)
			{
				B_AssignAmbientInfos_OCPAL_9(slf);
			}
			else if(slf.voice == 8)
			{
				B_AssignAmbientInfos_OWPAL_4(slf);
			};
		};
		if(slf.npcType == NPCTYPE_CSP_AMBIENT)
		{
			b_assignambientinfos_csp(slf);
		};
	};
	if(slf.guild == GIL_BAU)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_BAU_1(slf);
			}
			else if(slf.voice == 7)
			{
				B_AssignAmbientInfos_BAU_7(slf);
			}
			else if(slf.voice == 13)
			{
				B_AssignAmbientInfos_BAU_13(slf);
			}
			else if(slf.voice == 16)
			{
				B_AssignAmbientInfos_BAU_16(slf);
			};
		};
	};
	if(slf.guild == GIL_SLD)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_SLD_6(slf);
			}
			else if(slf.voice == 7)
			{
				B_AssignAmbientInfos_SLD_7(slf);
			};
		};
	};
	if(slf.guild == GIL_NOV)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 3)
			{
				B_AssignAmbientInfos_NOV_3(slf);
			}
			else if(slf.voice == 8)
			{
				B_AssignAmbientInfos_NOV_8(slf);
			};
		};
	};
	if(slf.guild == GIL_DJG)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			B_AssignAmbientInfos_DJG_Syl(slf);
		};
	};
	if(slf.guild == GIL_PIR)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				B_AssignAmbientInfos_Addon_PIR_6(slf);
			}
			else if(slf.voice == 7)
			{
				B_AssignAmbientInfos_Addon_PIR_7(slf);
			};
		};
	};
	if(slf.guild == GIL_OUT)
	{
		if(slf.npcType == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_OUT_1(slf);
			}
			else if(slf.voice == 7)
			{
				B_AssignAmbientInfos_OUT_7(slf);
			}
			else if(slf.voice == 13)
			{
				B_AssignAmbientInfos_OUT_13(slf);
			}
			else if(slf.voice == 15)
			{
				b_assignambientinfos_out_15(slf);
			}
			else if(slf.voice == 16)
			{
				b_assignambientinfos_out_16(slf);
			}
			else if(slf.voice == 17)
			{
				b_assignambientinfos_out_17(slf);
			}
			else if(slf.voice == 18)
			{
				b_assignambientinfos_out_18(slf);
			}
			else if(slf.voice == 19)
			{
				b_assignambientinfos_out_19(slf);
			}
			else if(slf.voice == 20)
			{
				b_assignambientinfos_out_20(slf);
			};
		};
		if(slf.npcType == NPCTYPE_OCAMBIENT)
		{
			if(slf.voice == 1)
			{
				b_assignambientinfos_out_15(slf);
			}
			else if(slf.voice == 4)
			{
				B_AssignAmbientInfos_OWPAL_4(slf);
			}
			else if(slf.voice == 7)
			{
				b_assignambientinfos_out_16(slf);
			}
			else if(slf.voice == 13)
			{
				b_assignambientinfos_out_17(slf);
			}
			else if(slf.voice == 15)
			{
				b_assignambientinfos_out_15(slf);
			}
			else if(slf.voice == 16)
			{
				b_assignambientinfos_out_16(slf);
			}
			else if(slf.voice == 17)
			{
				b_assignambientinfos_out_17(slf);
			}
			else if(slf.voice == 18)
			{
				b_assignambientinfos_out_18(slf);
			}
			else if(slf.voice == 19)
			{
				b_assignambientinfos_out_19(slf);
			}
			else if(slf.voice == 20)
			{
				b_assignambientinfos_out_20(slf);
			};
		};
	};
	if(slf.guild == GIL_STRF)
	{
		if((slf.npcType == NPCTYPE_AMBIENT) || (slf.npcType == NPCTYPE_OCAMBIENT))
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_STRF_1(slf);
			}
			else if(slf.voice == 13)
			{
				B_AssignAmbientInfos_STRF_13(slf);
			};
		};
		if(slf.npcType == NPCTYPE_BL_AMBIENT)
		{
			B_AssignAmbientInfos_Addon_Sklaven_3(slf);
		};
	};
	if(slf.guild == GIL_BDT)
	{
		if((slf.npcType == NPCTYPE_AMBIENT) || (slf.npcType == NPCTYPE_OCAMBIENT))
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_BDT_1(slf);
			}
			else if(slf.voice == 10)
			{
				B_AssignAmbientInfos_BDT_13(slf);
			}
			else if(slf.voice == 13)
			{
				B_AssignAmbientInfos_BDT_13(slf);
			};
		};
		if(slf.npcType == NPCTYPE_BL_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_Addon_BL_BDT_1(slf);
			}
			else if(slf.voice == 13)
			{
				B_AssignAmbientInfos_Addon_BL_BDT_13(slf);
			};
		};
		if(slf.npcType == NPCTYPE_TAL_AMBIENT)
		{
			if(slf.voice == 1)
			{
				B_AssignAmbientInfos_Addon_TAL_BDT_1(slf);
			}
			else if(slf.voice == 13)
			{
				B_AssignAmbientInfos_Addon_TAL_BDT_13(slf);
			};
		};
	};
	if(slf.guild == GIL_DMT)
	{
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Lord_LV)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Stefan)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ilesil_Evil)) && ((slf.npcType == NPCTYPE_AMBIENT) || (slf.npcType == NPCTYPE_OCAMBIENT)))
		{
			if(slf.voice == 18)
			{
				B_AssignDeadTalk(slf);
			}
			else if(slf.voice == 19)
			{
				B_AssignDementorTalk(slf);
			};
		};
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Lord_LV)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Stefan)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ilesil_Evil)) && (slf.npcType == NPCTYPE_BL_AMBIENT))
		{
			if(slf.voice == 19)
			{
				B_AssignDementorTalkFriendly(slf);
			};
		};
	};
	if((slf.aivar[91] == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(PAL_200_Hagen)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(SLD_800_Lee)))
		{
			b_assignnotalk(slf);
		};
	};
};