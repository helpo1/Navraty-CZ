
func void B_AssessTheft()
{
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_104_GOMEZ)))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1300_Addon_Greg_NW))
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
	if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return;
	};
	if(!Npc_IsPlayer(other))
	{
		return;
	};
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
	if((Wld_GetPlayerPortalGuild() >= GIL_NONE) && (Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT))
	{
		return;
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if(Hlp_IsValidItem(item) && Npc_OwnedByNpc(item,self))
		{
		}
		else
		{
			return;
		};
	};
	if(C_IsTakenItemMyPossession(self,other,item) == FALSE)
	{
		return;
	};
	if(C_WantToAttackThief(self,other) == FALSE)
	{
		if(C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime(self,other,CRIME_THEFT);
		};

		return;
	};
	if(Hlp_IsItem(item,itwr_rhetorikbook) == TRUE)
	{
		return;
	};

	B_Attack(self,other,AR_Theft,0);
};

