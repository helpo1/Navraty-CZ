
func void B_AssessQuietSound()
{
	if(!Hlp_IsValidNpc(other))
	{
		return;
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if(self.guild == GIL_STRF)
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_449_Lares)) && ((LARESCAPTURED == TRUE) || (LARESRENTPARTY == TRUE)))
	{
		return;
	};
	if((Wld_GetPlayerPortalGuild() >= GIL_NONE) && (Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT))
	{
		return;
	};
	if(Npc_GetDistToNpc(self,other) >= 500)
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
	if(Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_51_94") <= 400)
	{
		return;
	};
	if((Npc_GetDistToWP(hero,"NW_TAVERNE_IN_03") <= 200) && (MIS_Rukhar_Wettkampf == LOG_Running))
	{
		if((Npc_GetDistToNpc(self,other) >= 300) && Wld_IsTime(23,0,5,0))
		{
			return;
		};
	};
	if((Npc_GetDistToWP(hero,"NW_CITY_RATS_01") <= 400) && (MIS_TALIASANHELP == LOG_SUCCESS))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (IsLockPickBroken == TRUE) && (Npc_GetDistToNpc(self,other) <= 250))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_ObservePlayer,1,"");
	};
	if((Npc_GetDistToNpc(self,other) < 350) && (Npc_GetDistToWP(hero,"LGR_TURM_01_02") <= 200))
	{
		B_Say(self,other,"$ALARM");
		B_Attack(self,other,AR_ClearRoom,1);
	};
	if(B_AssessEnterRoom())
	{
		return;
	};
	if(C_NpcIsGateGuard(self))
	{
		return;
	};
	if((Npc_GetAttitude(self,other) != ATT_HOSTILE) && (Npc_CheckInfo(self,1) == FALSE))
	{
		return;
	};
	if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && ((self.aivar[AIV_EnemyOverride] == TRUE) || (C_PlayerIsFakeBandit(self,other) && (self.guild == GIL_BDT))))
	{
		return;
	};
	if(Npc_CanSeeSource(self))
	{
		return;
	};

	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_ObservePlayer,1,"");
};

