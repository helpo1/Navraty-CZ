
func void B_MM_AssessOthersDamage()
{
	if(Npc_IsPlayer(other) && (HeroIsOrc == TRUE) && (self.guild == GIL_ORC) && (CurrentLevel == PSICAMP_ZEN))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PrisonSoul01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PrisonSoul02)))
	{
		return;
	};
	if((Npc_IsPlayer(other) == FALSE) && (other.guild == self.guild))
	{
		return;
	};
	if(self.guild == GIL_MEATBUG)
	{
		return;	
	};
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (other.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Stefan))
	{
		return;	
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Stefan))
	{
		return;	
	};
	if(other.guild == GIL_DRAGON)
	{
		if((self.guild == GIL_FIREGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_DRACONIAN) || (self.guild == GIL_SWAMPGOLEM))
		{
			return;
		};
	};
	if((other.guild == GIL_FIREGOLEM) || (other.guild == GIL_ICEGOLEM) || (other.guild == GIL_STONEGOLEM) || (other.guild == GIL_DRACONIAN) || (other.guild == GIL_SWAMPGOLEM))
	{
		if(self.guild == GIL_DRAGON)
		{
			return;
		};
	};
	if((StoneBossIsAwake == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss)))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Dex)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Str)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Mag)))
	{
		return;
	};
	if((self.guild == GIL_KDM) && (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON))
	{
		return;
	};
	if((self.guild == GIL_ORC) && (other.guild == GIL_STRF) && ((CurrentLevel == ORCOREMINE_ZEN) || (CurrentLevel == ORCCITY_ZEN)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (HeroIsOrc == TRUE) && (self.guild == GIL_ORC) && (CurrentLevel == PSICAMP_ZEN))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_480_Fellan)) && (MIS_BELIARHELPME != FALSE))
	{
		return;
	};
	if((self.aivar[AIV_MM_REAL_ID] == ID_ORCBF) && (ALLBIGFIGHTERSORC < 70))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demonlord_li_1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demonlord_li_2)))
	{
		return;
	};
	if((Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1297_stonnos)))
	{
		return;
	};
	if((self.guild == GIL_ORC) || (self.guild == GIL_FRIENDLY_ORC) || (self.guild == GIL_SEPERATOR_ORC))
	{
		if((MIS_KILLURTRALL == LOG_Running) && (Npc_HasItems(other,itmi_orcmaintotem) >= 1) && (TELLHAGTARKILLYOU == TRUE) && (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(orc_8566_urhan)))
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan))
	{
		if((MIS_CHALLANGEORC == LOG_Running) && (HAGTARISINSERTED == TRUE) && (URHANSPEAKBEFOREBATTLE == FALSE))
		{
			return;
		};
	};
	if(self.flags == ORCTEMPLENPCFLAGS)
	{
		return;
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_ORC) && (CurrentLevel == SHVALLEY_ZEN) && (BLKDRAGNISDEAD == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_1))
	{
		if(GOMEZSOULTALK_1 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_2))
	{
		if(GOMEZSOULTALK_2 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_3))
	{
		if(GOMEZSOULTALK_3 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_4))
	{
		if(GOMEZSOULTALK_4 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_5))
	{
		if(GOMEZSOULTALK_5 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_6))
	{
		if(GOMEZSOULTALK_6 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_7))
	{
		if(GOMEZSOULTALK_7 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_8))
	{
		if(GOMEZSOULTALK_8 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_9))
	{
		if(GOMEZSOULTALK_9 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_10))
	{
		if(GOMEZSOULTALK_10 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_11))
	{
		if(GOMEZSOULTALK_11 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_12))
	{
		if(GOMEZSOULTALK_12 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_13))
	{
		if(GOMEZSOULTALK_13 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_14))
	{
		if(GOMEZSOULTALK_14 == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomezworkersoul_15))
	{
		if(GOMEZSOULTALK_15 == FALSE)
		{
			return;
		};
	};
	if(!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	if(Npc_IsPlayer(other) && ((self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_WOLF) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOBBO_SKELETON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON_MAGE) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON) || (self.aivar[AIV_MM_REAL_ID] == ID_SummonedGuardian) || (self.aivar[AIV_MM_REAL_ID] == ID_SummonedZombie) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SWAMPDRONE) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,victim);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if((other.guild == GIL_DMT) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (C_NpcIsUndead(self) == TRUE))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,victim);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if((self.guild == GIL_DMT) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (C_NpcIsUndead(other) == TRUE))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,victim);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_IsPlayer(victim))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
		if(Npc_IsPlayer(other) && !Npc_IsDead(victim))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,victim);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
	};
	if((self.guild == GIL_Stoneguardian) && (victim.guild == GIL_Stoneguardian) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		b_awake_stoneguardian(self);
	};
	if((Wld_GetGuildAttitude(self.guild,victim.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,victim.guild) != ATT_FRIENDLY) && !Npc_IsDead(victim))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,victim);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
};

