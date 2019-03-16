
func void B_AssessUseMob()
{
	var string detMob;
	var int portalguild;

	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(!Npc_IsPlayer(other))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1300_Addon_Greg_NW))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XBS_7501_CAMPER))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6134_valeran)) && (valeranrecruiteddt == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4303_Addon_Erol)) && (erolrecruiteddt == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_41111_huntynw)) && (huntygrimesrecruiteddt == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_41110_grimesnw)) && (huntygrimesrecruiteddt == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_986_viper)) && (viperrecruiteddt == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4132_Talbin_NW)) && (talbinrecruiteddt == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_984_Niclas)) && (niclasrecruiteddt == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4301_Addon_Farim)) && (farimrecruiteddt == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_471_Edda)) && (eddarecruiteddt == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_360_Miliz))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_361_Miliz))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf)) && (wolfrecruiteddt == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_8111_Soeldner))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_8112_Soeldner))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_461_Carl)) && (CARLRECRUITEDDT == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_980_Sagitta)) && (SagittaRECRUITEDDT == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bau_987_snipes)) && (SNIPESRECRUITEDDT == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_438_Alrik)) && (AlrikRECRUITEDDT == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6132_gayvern)) && (GAYVERNRECRUITEDDT == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_41200_Bilgot)) && (BILGOTRECRUITEDDT == TRUE))
	{
		return;
	};
	if(self.guild == GIL_STRF)
	{
		return;
	};

	detMob = Npc_GetDetectedMob(other);
	portalguild = Wld_GetPlayerPortalGuild();

	//Print(detMob);

	if(Npc_IsPlayer(other) && ((Hlp_StrCmp(detMob,"LADDER") == TRUE) || (Hlp_StrCmp(detMob,"BENCH") == TRUE) || (Hlp_StrCmp(detMob,"VWHEEL") == TRUE)))
	{
		return;
	};
	if(C_IsUsedMobMyPossession(self,other) == FALSE)
	{
		return;
	};
	if(Npc_IsPlayer(other) && Npc_GetDistToWP(other,"PUBLICPLACE_FLAG_19") <= 2000)
	{
		if(KAPITELORCATC == TRUE)
		{
			return;
		};
		if((other.guild == GIL_PAL) || (other.guild == GIL_MIL) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF))
		{
			return;
		}
		else if((self.guild == GIL_PAL) || (self.guild == GIL_MIL))
		{
			ALARMONPRISON = FALSE;

			if((Hlp_StrCmp(detMob,"DOOR") == TRUE) && (PERMTOPRISON == TRUE))
			{
				return;
			}
			else
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		}
		else
		{
			return;
		};
	};
	if((HEROISHUNTER == TRUE) && (Npc_GetDistToWP(other,"NW_HUNTCAMP_CHEST") <= 3000))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_104_GOMEZ)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_StrCmp(detMob,"BAKE") == TRUE) && (Thekla_Areed == TRUE))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_StrCmp(detMob,"RMAKER") == TRUE) && (Matteo_TeachJewel == TRUE) && (Npc_GetDistToWP(other,"NW_CITY_BED_RUPERT") <= 500))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_StrCmp(detMob,"TISCHLER") == TRUE) && (Player_IsApprentice == APP_Bosper) && (Npc_GetDistToWP(other,"NW_CITY_MERCHANT_SHOP01_IN_02") <= 500))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_StrCmp(detMob,"TOUCHPLATE") == TRUE) && (Npc_GetDistToWP(other,"NW_CITY_HABOUR_HUT_08_BED_02") <= 500))
	{
		if(Npc_CanSeeSource(self) == FALSE)
		{
			return;
		};
		if(Npc_IsInState(self,ZS_Sleep))
		{
			return;
		};
		if(Npc_CanSeeNpc(self,other) == FALSE)
		{
			return;
		}
		else if(Npc_CanSeeNpcFreeLOS(self,other) == FALSE)
		{
			return;
		}
		else
		{
			B_Attack(self,other,AR_UseMob,0);
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_StrCmp(detMob,"TOUCHPLATE") == TRUE))
	{
		if(Npc_CanSeeSource(self) == FALSE)
		{
			return;
		};
		if(Npc_IsInState(self,ZS_Sleep))
		{
			return;
		};
		if(Npc_CanSeeNpc(self,other) == FALSE)
		{
			return;
		}
		else if(Npc_CanSeeNpcFreeLOS(self,other) == FALSE)
		{
			return;
		}
		else
		{
			B_Attack(self,other,AR_UseMob,0);
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_801_Torlof)) && (TORLOFCAPTURED == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_705_Angar_NW)) && (ANGARCAPTURED == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf)) && (WOLFCAPTURED == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_449_Lares)) && ((LARESCAPTURED == TRUE) || (LARESRENTPARTY == TRUE)))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pal_207_Girion)) && (GIRIONCAPTURED == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet)) && (BENNETCAPTURED == TRUE))
	{
		return;
	};
	if((KAPITELORCATC == TRUE) && ((self.guild == GIL_PAL) || (self.guild == GIL_MIL)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Npc_GetDistToWP(other,"PUBLICPLACE_FLAG_17") <= 1200) && (TaliasanHomeIsMine == TRUE))
	{
		return;
	};
	if((Npc_GetDistToWP(other,"PUBLICPLACE_FLAG_20") <= 2000) && (KAPITELORCATC == TRUE))
	{
		return;
	};
	if((Npc_GetDistToWP(other,"PUBLICPLACE_FLAG_19") <= 2000) && (KAPITELORCATC == TRUE))
	{
		return;
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		return;
	};
	if(Wld_GetPlayerPortalGuild() >= GIL_NONE)
	{
		if(Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT)
		{
			return;
		};
	};
	if((Npc_GetDistToNpc(self,other) >= 500) && Wld_IsTime(23,0,5,0))
	{
		return;
	};
	if(Npc_GetDistToWP(hero,"NW_CITY_KANAL_ROOM_02_02") <= 400)
	{
		return;
	};
	if((Npc_GetDistToWP(hero,"OC_STORE_IN") <= 1000) || (Npc_GetDistToWP(hero,"OC_STORE_CENTER") <= 600) || (Npc_GetDistToWP(hero,"OC_CENTER_GUARD_04") <= 1000))
	{
		return;
	};
	if((Npc_GetDistToWP(hero,"ADW_PIRATECAMP_HUT4_IN") <= 400) || (Npc_GetDistToWP(hero,"BL_INN_BAR_02") <= 800) || (Npc_GetDistToWP(hero,"BL_DOWN_SIDE_02") <= 400))
	{
		return;
	};
	if(Npc_GetDistToWP(hero,"NW_FARM1_CITYWALL_FOREST_15") <= 400)
	{
		return;
	};
	if(Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_51_94") <= 500)
	{
		return;
	};
	if((Npc_GetDistToWP(hero,"NW_TAVERNE_IN_03") <= 200) && (MIS_Rukhar_Wettkampf == LOG_Running))
	{
		if((Npc_GetDistToNpc(self,other) > 500) && Wld_IsTime(23,0,5,0))
		{
			return;
		};
	};
	if((Npc_GetDistToWP(hero,"NW_CITY_RATS_01") <= 400) && (MIS_TALIASANHELP == LOG_SUCCESS))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Wld_GetPlayerPortalGuild() == GIL_PUBLIC) && (Npc_GetDistToWP(hero,"PUBLICPLACE_FLAG_19") <= 700))
	{
		if(KAPITELORCATC == TRUE)
		{
			return;
		}
		else if((other.guild == GIL_PAL) || (other.guild == GIL_MIL) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF))
		{
			return;
		}
		else if((self.guild == GIL_PAL) || (self.guild == GIL_MIL))
		{
			B_Attack(self,other,AR_UseMob,0);
		}
		else
		{
			return;
		};
	};
	if((Hlp_StrCmp(detMob,"BOOK") == TRUE) || (Hlp_StrCmp(detMob,"CHAIR") == TRUE) || (Hlp_StrCmp(detMob,"THRONE") == TRUE))
	{
		return;
	};
	if(Npc_IsDetectedMobOwnedByNpc(other,self))
	{
		if(Npc_GetDistToNpc(self,other) < 500)
		{
			if(Npc_IsInState(self,ZS_Sleep))
			{
				return;
			};
			if(Npc_IsInState(self,ZS_ObservePlayer) == FALSE)
			{
				Npc_ClearAIQueue(self);
				B_ClearPerceptions(self);
		
				if(C_BodyStateContains(self,BS_SIT))
				{
					AI_StartState(self,ZS_ObservePlayer,0,"");
				}
				else
				{
					AI_StartState(self,ZS_ObservePlayer,1,"");
				};
			};
			if(Npc_CanSeeNpc(self,other) == FALSE)
			{
				return;
			}
			else if(Npc_CanSeeNpcFreeLOS(self,other) == FALSE)
			{
				return;
			}
			else
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		}
		else
		{
			if(Npc_CanSeeSource(self) == FALSE)
			{
				return;
			};
			if(Npc_IsInState(self,ZS_Sleep))
			{
				return;
			};
			if(Npc_CanSeeNpc(self,other) == FALSE)
			{
				return;
			};
			if(Npc_CanSeeNpcFreeLOS(self,other) == FALSE)
			{
				return;
			};
		};
	};
	if(Hlp_StrCmp(detMob,"DOOR") == TRUE)
	{
		if((portalguild == GIL_NONE) || (portalguild == GIL_PUBLIC))
		{
			return;
		};
		if((Npc_GetDistToWP(other,"NW_MONASTERY_RUNEMAKER_09") <= 1500) && (KlosterKeyGive == TRUE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_510_Hyglas)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_503_Karras)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_505_Marduk))))
		{
			return;
		};
		if(Npc_GetDistToWP(other,"LGR_TURM_01_02") <= 250)
		{
			if((other.guild != GIL_PAL) && (other.guild != GIL_KDF) && (other.guild != GIL_KDW) && (other.guild != GIL_MIL))
			{
				B_Say(self,other,"$ALARM");
				B_Attack(self,other,AR_GuardStopsIntruder,1);
			};
		};
		if((Npc_IsDetectedMobOwnedByGuild(other,GIL_PAL) == TRUE) && (Wld_GetGuildAttitude(self.guild,GIL_PAL) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
			{
				return;
			}
			else
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((self.guild == GIL_GUR) && (Wld_GetGuildAttitude(self.guild,GIL_GUR) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_GUR) || (other.guild == GIL_TPL))
			{
				return;
			}
			else
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((portalguild > GIL_NONE) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY) && ((self.guild == portalguild) || (Wld_GetGuildAttitude(self.guild,portalguild) == ATT_FRIENDLY)))
		{
			if(Npc_CanSeeSource(self) == FALSE)
			{
				return;
			}
			else if(Npc_IsInState(self,ZS_Sleep))
			{
				return;
			}
			else if(Npc_CanSeeNpc(self,other) == FALSE)
			{
				return;
			}
			else if(Npc_CanSeeNpcFreeLOS(self,other) == FALSE)
			{
				return;
			}
			else
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		}
		else
		{
			return;
		};
	};
	if((Hlp_StrCmp(detMob,"WARDROBE") == TRUE) || (Hlp_StrCmp(detMob,"CUPBOARD") == TRUE) || (Hlp_StrCmp(detMob,"CUPBOARD2") == TRUE))
	{
		if(portalguild == GIL_NONE)
		{
			return;
		};
		if((Npc_IsDetectedMobOwnedByGuild(other,GIL_PAL) == TRUE) && (Wld_GetGuildAttitude(self.guild,GIL_PAL) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
			{
				return;
			}
			else
			{
				bMobReact = 2;
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((self.guild == GIL_GUR) && (Wld_GetGuildAttitude(self.guild,GIL_GUR) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_GUR) || (other.guild == GIL_TPL))
			{
				return;
			}
			else
			{
				bMobReact = 2;
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((portalguild > GIL_NONE) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY) && ((self.guild == portalguild) || (Wld_GetGuildAttitude(self.guild,portalguild) == ATT_FRIENDLY)))
		{
			if(Npc_CanSeeSource(self) == FALSE)
			{
				return;
			}
			else if(Npc_IsInState(self,ZS_Sleep))
			{
				return;
			}
			else if(Npc_CanSeeNpc(self,other) == FALSE)
			{
				return;
			}
			else if(Npc_CanSeeNpcFreeLOS(self,other) == FALSE)
			{
				return;
			}
			else
			{
				bMobReact = 2;
				B_Attack(self,other,AR_UseMob,0);
			};
		}
		else
		{
			return;
		};
	};
	if((Hlp_StrCmp(detMob,"CHESTBIG") == TRUE) || (Hlp_StrCmp(detMob,"CHESTSMALL") == TRUE))
	{
		if(portalguild == GIL_NONE)
		{
			return;
		};
		if((Npc_IsDetectedMobOwnedByGuild(other,GIL_PAL) == TRUE) && (Wld_GetGuildAttitude(self.guild,GIL_PAL) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
			{
				return;
			}
			else
			{
				bMobReact = 2;
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((self.guild == GIL_GUR) && (Wld_GetGuildAttitude(self.guild,GIL_GUR) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_GUR) || (other.guild == GIL_TPL))
			{
				return;
			}
			else
			{
				bMobReact = 2;
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((portalguild > GIL_NONE) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY) && ((self.guild == portalguild) || (Wld_GetGuildAttitude(self.guild,portalguild) == ATT_FRIENDLY)))
		{
			if(Npc_CanSeeSource(self) == FALSE)
			{
				return;
			}
			else if(Npc_IsInState(self,ZS_Sleep))
			{
				return;
			}
			else if(Npc_CanSeeNpc(self,other) == FALSE)
			{
				return;
			}
			else if(Npc_CanSeeNpcFreeLOS(self,other) == FALSE)
			{
				return;
			}
			else
			{
				bMobReact = 2;
				B_Attack(self,other,AR_UseMob,0);
			};
		}
		else
		{
			return;
		};
	};
	if(Hlp_StrCmp(detMob,"BEDHIGH") == TRUE)
	{
		if((portalguild == GIL_NONE) || (portalguild == GIL_PUBLIC))
		{
			return;
		};
		if((Npc_IsDetectedMobOwnedByGuild(other,GIL_PAL) == TRUE) && (Wld_GetGuildAttitude(self.guild,GIL_PAL) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
			{
				return;
			}
			else
			{
				bMobReact = 1;
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((self.guild == GIL_GUR) && (Wld_GetGuildAttitude(self.guild,GIL_GUR) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_GUR) || (other.guild == GIL_TPL))
			{
				return;
			}
			else
			{
				bMobReact = 1;
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((portalguild > GIL_NONE) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY) && ((self.guild == portalguild) || (Wld_GetGuildAttitude(self.guild,portalguild) == ATT_FRIENDLY)))
		{
			if(Npc_CanSeeSource(self) == FALSE)
			{
				return;
			}
			else if(Npc_IsInState(self,ZS_Sleep))
			{
				return;
			}
			else if(Npc_CanSeeNpc(self,other) == FALSE)
			{
				return;
			}
			else if(Npc_CanSeeNpcFreeLOS(self,other) == FALSE)
			{
				return;
			}
			else
			{
				bMobReact = 1;
				B_Attack(self,other,AR_UseMob,0);
			};
		}
		else
		{
			return;
		};
	};
	if((Hlp_StrCmp(detMob,"STOVE") == TRUE) || (Hlp_StrCmp(detMob,"RMAKER") == TRUE) || (Hlp_StrCmp(detMob,"TISCHLER") == TRUE) || (Hlp_StrCmp(detMob,"LAB") == TRUE) || (Hlp_StrCmp(detMob,"LAB_PSI") == TRUE) || (Hlp_StrCmp(detMob,"KARTHOGRAPHIE") == TRUE))
	{
		if((portalguild == GIL_NONE) || (portalguild == GIL_PUBLIC))
		{
			return;
		};
		if((Npc_IsDetectedMobOwnedByGuild(other,GIL_PAL) == TRUE) && (Wld_GetGuildAttitude(self.guild,GIL_PAL) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
			{
				return;
			}
			else
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((self.guild == GIL_GUR) && (Wld_GetGuildAttitude(self.guild,GIL_GUR) == ATT_FRIENDLY))
		{
		  	if((other.guild == GIL_GUR) || (other.guild == GIL_TPL))
			{
				return;
			}
			else
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		};
		if((portalguild > GIL_NONE) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY) && ((self.guild == portalguild) || (Wld_GetGuildAttitude(self.guild,portalguild) == ATT_FRIENDLY)))
		{
			if(Npc_CanSeeSource(self) == FALSE)
			{
				return;
			}
			else if(Npc_IsInState(self,ZS_Sleep))
			{
				return;
			}
			else if(Npc_CanSeeNpc(self,other) == FALSE)
			{
				return;
			}
			else if(Npc_CanSeeNpcFreeLOS(self,other) == FALSE)
			{
				return;
			}
			else
			{
				B_Attack(self,other,AR_UseMob,0);
			};
		}
		else
		{
			return;
		};
	};

	B_Attack(self,other,AR_UseMob,0);
};