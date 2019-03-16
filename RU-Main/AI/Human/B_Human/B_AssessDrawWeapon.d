func int B_AssessDrawWeapon()
{
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1191_Assasin))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1813_Ilesil)) && (IlesilCanFight == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Stefan)) && (StefanCanFight == FALSE))
	{
		return FALSE;	
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_304_Torwache)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_309_Stadtwache)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_325_Miliz)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_332_Stadtwache)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pal_204_Torwache)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_203_Lothar)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak)))
	{
		return FALSE;
	};
	if((CurrentLevel == PRIORATWORLD_ZEN) && (self.guild == GIL_BDT))
	{
		return FALSE;
	};
	if((self.guild == GIL_KDW) && (READYWATERRITUAL == TRUE) && (KDW_JOINHAGEN == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_102_KREOL)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1297_stonnos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12140_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12170_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12200_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12970_stonnos)) || ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_507_Talamon)) && (Kapitel < 5)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) && (TempleIsClear == FALSE) && (KnowPlaceMeeting == TRUE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10005_Addon_Wache_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1081_Addon_Wache_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1083_Addon_Esteban)))
	{
		return FALSE;
	};
	if(self.guild == GIL_STRF)
	{
		return FALSE;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
	if(Npc_IsInFightMode(other,FMODE_NONE))
	{
		return FALSE;
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG)
	{
		return FALSE;
	};
	if(!C_NpcIsBotheredByWeapon(self,other))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,ZS_ReactToWeapon))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,ZS_ObservePlayer) && Npc_WasInState(self,ZS_WatchFight))
	{
		return FALSE;
	};
	if(!Npc_CanSeeNpc(self,other))
	{
		return FALSE;
	};
	if((MOVEFORCESCOMPLETE_02 == TRUE) && (BIGBATTLEBACKPOSITION == FALSE) && (other.guild < GIL_SEPERATOR_HUM) && (Npc_GetDistToWP(self,"BIGFIGHT") <= 15000))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (other.guild == self.guild))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_STRF))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (MOVEFORCESCOMPLETE_01 == TRUE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sld_805_Cord)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_850_Kharim)))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (Kapitel < 5) && (CurrentLevel == NEWWORLD_ZEN) && (KAPITELORCATC == FALSE) && ((self.guild == GIL_PAL) || (self.guild == GIL_MIL)))
	{
		if(other.guild == GIL_SLD)
		{
			if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
			{
				B_Attack(self,other,AR_GuildEnemy,0);
				return FALSE;
			};
		};
	};
	if(Npc_IsPlayer(other) && (Kapitel < 5) && (CurrentLevel == NEWWORLD_ZEN) && (KAPITELORCATC == FALSE) && (self.guild == GIL_SLD))
	{
		if(other.guild == GIL_MIL)
		{
			if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
			{
				B_Attack(self,other,AR_GuildEnemy,0);
				return FALSE;
			};
		};
		if(other.guild == GIL_PAL)
		{
			if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
			{
				B_Attack(self,other,AR_ReactToWeapon,0);
				return FALSE;
			};
		};
	};
	if(Npc_IsPlayer(other) && (Kapitel < 5) && (CurrentLevel == NEWWORLD_ZEN) && (KAPITELORCATC == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_PAL)))
	{
		if(other.guild == GIL_KDM)
		{
			if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
			{
				B_Attack(self,other,AR_ReactToWeapon,0);
				return FALSE;
			};
		};
	};
	if(Npc_IsPlayer(other) && (Kapitel < 5) && (CurrentLevel == NEWWORLD_ZEN)  && (KAPITELORCATC == FALSE) && ((Npc_GetDistToWP(hero,"SHIP_DECK_15") <= 1500) || (Npc_GetDistToWP(hero,"SHIP_DECK_24") <= 1500) || (Npc_GetDistToWP(hero,"SHIP_DECK_17") <= 1500)) && ((self.guild == GIL_KDF) || (self.guild == GIL_PAL)))
	{
		if(MIS_ShipIsFree == FALSE)
		{
			if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
			{
				B_Attack(self,other,AR_GuardCalledToKill,0);
				return FALSE;
			};
		};
	};
	if(Npc_IsPlayer(other) && ((self.guild == GIL_VLK) || (self.guild == GIL_NOV) || (self.guild == GIL_NDW) || (self.guild == GIL_KDW) || (self.guild == GIL_KDF) || (self.guild == GIL_PAL) || (self.guild == GIL_MIL)))
	{
		if((other.guild == GIL_MIL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_NDW) || (other.guild == GIL_PAL) || (other.guild == GIL_VLK))
		{
			return FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_BAU))
	{
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) || (other.guild == GIL_MIL) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
		{
			return FALSE;
		};
	};
	if(Npc_IsPlayer(other) && ((self.guild == GIL_SLD) || (self.guild == GIL_DJG)))
	{
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF))
		{
			return FALSE;
		};
	};
	if(Npc_IsPlayer(other) && ((self.guild == GIL_SEK) || (self.guild == GIL_GUR) || (self.guild == GIL_TPL)))
	{
		if((other.guild == GIL_SEK) || (other.guild == GIL_GUR) || (other.guild == GIL_TPL) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF))
		{
			return FALSE;
		};
	};

	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_ReactToWeapon,0,"");
	return TRUE;
};