
func void B_AssessFightSound()
{
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(!Hlp_IsValidNpc(victim))
	{
		return;
	};
	if(victim.guild == GIL_DMT)
	{
		return;
	};
	if(victim.guild == GIL_KDM)
	{
		return;
	};
	if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Crait))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1813_Ilesil))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Stefan)) && (StefanCanFight == FALSE))
	{
		return;	
	};
	if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Mil_316_Wambo))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_4568_KINJARTS))
	{
		return;
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mil_316_Wambo))
	{
		return;
	};
	if(self.guild == GIL_STRF)
	{
		return;
	};
	if((self.guild == GIL_SLD) && ((victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_WatchFight,0,"");
		return;
	};
	if((self.guild == GIL_DJG) && ((victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_WatchFight,0,"");
		return;
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_BDT) && (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	if((self.guild == GIL_STRF) && (self.aivar[AIV_NoFightParker] == TRUE) && (CurrentLevel == ORCOREMINE_ZEN))
	{
		return;
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Aim))
	{
		return;
	};
	if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Aim))
	{
		return;
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_438_Alrik))
	{
		return;
	};
	if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(VLK_438_Alrik))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1191_Assasin))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1192_Fregeal))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV))
	{
		return;
	};
	if((self.guild == GIL_KDM) && (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_01") <= 500) && (MageSpeechEnd == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_500_Pyrokar)) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") <= 500) && (MageSpeechEnd == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_439_Vatras)) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_04") <= 500) && (MageSpeechEnd == FALSE))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven))
	{
		return;
	};
	if((self.guild == GIL_BDT) && (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(VLK_4302_Addon_Elvrich)))
	{
		return;
	};
	if((self.guild == GIL_BDT) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_4302_Addon_Elvrich)))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4131_Engrom)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4130_Talbin)))
	{
		return;
	};
	if((CurrentLevel == PRIORATWORLD_ZEN) && (self.guild == GIL_STRF))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak)))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1297_stonnos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12140_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12170_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12200_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12970_stonnos)))
	{
		return;
	};
	if((self.guild == GIL_STRF) && (other.guild == GIL_ORC) && ((CurrentLevel == ORCOREMINE_ZEN) || (CurrentLevel == ORCCITY_ZEN)))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_480_Fellan)) && (MIS_BELIARHELPME != FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_175_Adept_Demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_174_Adept_Demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_173_Adept_Demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_172_Adept_Demon)))
	{
		return;
	};
	if((STARTBIGBATTLE == TRUE) && (self.aivar[98] == TRUE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (victim.aivar[AIV_MM_REAL_ID] == ID_NATTER))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (victim.aivar[AIV_MM_REAL_ID] == ID_CRAB))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Rabbit)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Rabbit_02)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (victim.aivar[AIV_MM_REAL_ID] == ID_MEATBUG))
	{
		return;
	};
	if(Npc_IsPlayer(other)  && (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(BDT_1083_Addon_Esteban)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10005_Addon_Wache_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1081_Addon_Wache_01))))
	{
		B_Attack(self,other,AR_NONE,0);
		return;
	};
	if(Npc_IsPlayer(other)  && (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(BDT_10005_Addon_Wache_02)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1083_Addon_Esteban)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1081_Addon_Wache_01))))
	{
		B_Attack(self,other,AR_NONE,0);
		return;
	};
	if(Npc_IsPlayer(other)  && (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(BDT_1081_Addon_Wache_01)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10005_Addon_Wache_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1083_Addon_Esteban))))
	{
		B_Attack(self,other,AR_NONE,0);
		return;
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && ((victim.guild == GIL_BDT) || (victim.guild == GIL_DMT) || (victim.guild >= GIL_GOBBO)))
	{
		B_Attack(self,victim,AR_GuildEnemy,0);
		return;
	};
	if((STOPWATERRITUAL == FALSE) && ((WATERMAGESTART == TRUE) || (BEGINWATERRITUAL == TRUE)))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14000_Addon_Saturas_ADW)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14020_Addon_Nefarius_ADW)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14010_Addon_Cronos_ADW)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14050_Addon_Merdarion_ADW)))
		{
			return;
		};
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SLD_801_Torlof)) && (TORLOFCAPTURED == TRUE) && (TORLOFISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DJG_705_Angar_NW)) && (ANGARCAPTURED == TRUE) && (ANGARISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SLD_811_Wolf)) && (WOLFCAPTURED == TRUE) && (WOLFISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_449_Lares)) && (LARESCAPTURED == TRUE) && (LARESISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Pal_207_Girion)) && (GIRIONCAPTURED == TRUE) && (GIRIONISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SLD_809_Bennet)) && (BENNETCAPTURED == TRUE) && (BENNETISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_121200_dagot)) && (other.guild == GIL_DEMON))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) && (other.guild == GIL_DEMON))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas))
	{
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XARDAS_SKELETON_GUARD_SUM_01)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XARDAS_SKELETON_GUARD_SUM_02)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XARDAS_SKELETON_GUARD_01)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XARDAS_SKELETON_GUARD_02)))
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol))
	{
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(skeleton_kreol_01)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(skeleton_kreol_02)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(skeleton_kreol_03)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(skeleton_kreol_04)))
		{
			return;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SEK_168_SLAVEOBSSEK)) && (PW_BeginFakeDone == TRUE) && (Npc_IsDead(Ass_167_Adept_Convoy) == FALSE))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_WatchFight,0,"");
		return;
	};
	if((victim.guild == GIL_DMT) && (self.guild == GIL_DMT))
	{
		B_Attack(self,other,AR_GuildEnemy,0);
		return;
	};
	if(self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		if(C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE) || C_BodyStateContains(victim,BS_SWIM) || C_BodyStateContains(victim,BS_DIVE))
		{
			return;
		};
	};
	if((other.fight_tactic == FAI_NAILED) || (victim.fight_tactic == FAI_NAILED))
	{
		return;
	};
	if((Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT) && (Npc_GetHeightToNpc(self,victim) > PERC_DIST_HEIGHT))
	{
		return;
	};
	if((Npc_GetHeightToNpc(self,other) > 500) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_04") <= 3000))
	{
		return;
	};
	if((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self)))
	{
		return;
	};
	if((victim.aivar[AIV_ToughGuy] == FALSE) && ((victim.aivar[AIV_MM_REAL_ID] == ID_BARAN) || (victim.aivar[AIV_MM_REAL_ID] == ID_ZIEGE)))
	{
		if(C_WantToAttackSheepKiller(self,other))
		{
			B_Attack(self,other,AR_SheepKiller,0);
			return;
		}
		else if(C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime(self,other,CRIME_SHEEPKILLER);
			return;
		};
		return;
	};
	if(C_NpcIsGateGuard(self))
	{
		return;
	};
	if((other.guild > GIL_SEPERATOR_HUM) && (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	if((other.guild > GIL_SEPERATOR_HUM) && (Npc_GetAttitude(self,victim) != ATT_HOSTILE))
	{
		B_Attack(self,other,AR_MonsterVsHuman,0);
		return;
	};
	if((victim.guild > GIL_SEPERATOR_HUM) && (Npc_GetAttitude(self,other) != ATT_HOSTILE) && !Npc_IsDead(victim))
	{
		B_Attack(self,victim,AR_MonsterVsHuman,0);
		return;
	};
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);

		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
		{
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};

		return;
	};
	if(((C_PlayerIsFakeBandit(self,other) == TRUE) || (C_PlayerIsFakeBandit(self,victim) == TRUE)) && ((other.guild == GIL_BDT) || (victim.guild == GIL_BDT)))
	{
		if(self.guild == GIL_BDT)
		{
			if(CurrentLevel == ADDONWORLD_ZEN)
			{
				if((self.aivar[AIV_StoryBandit_Esteban] == TRUE) && (other.aivar[AIV_StoryBandit_Esteban] == TRUE))
				{
					B_Attack(self,victim,AR_NONE,0);
					return;
				};
				if((self.aivar[AIV_StoryBandit_Esteban] == TRUE) && (victim.aivar[AIV_StoryBandit_Esteban] == TRUE))
				{
					B_Attack(self,other,AR_NONE,0);
					return;
				};
				if((other.aivar[AIV_ATTACKREASON] == AR_NONE) && (victim.aivar[AIV_ATTACKREASON] == AR_NONE))
				{
					Npc_ClearAIQueue(self);
					B_ClearPerceptions(self);
					AI_StartState(self,ZS_WatchFight,0,"");
					return;
				};
				if((other.aivar[AIV_StoryBandit] == TRUE) || (victim.aivar[AIV_StoryBandit] == TRUE))
				{
					Npc_ClearAIQueue(self);
					B_ClearPerceptions(self);
					AI_StartState(self,ZS_WatchFight,0,"");
					return;
				};
			}
			else
			{
				if(Npc_IsPlayer(other))
				{
					B_Attack(self,other,AR_GuildEnemy,0);
					return;
				};
			};
		};
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder) || (other.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate) || (other.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman) || (other.aivar[AIV_ATTACKREASON] == AR_GuildEnemy) || (other.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		B_Attack(self,victim,AR_GuardCalledToKill,0);
		return;
	};
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder) || (victim.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate) || (victim.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman) || (victim.aivar[AIV_ATTACKREASON] == AR_GuildEnemy) || (victim.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		B_Attack(self,other,AR_GuardCalledToKill,0);
		return;
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight) || (other.aivar[AIV_ATTACKREASON] == AR_ReactToDamage) || (other.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		if(((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE)) && ((victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE)))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_WatchFight,0,"");
			return;
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim))
		{
			return;
		}
		else
		{
			B_Attack(self,victim,AR_GuardStopsFight,0);
			return;
		};
	};
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight) || (victim.aivar[AIV_ATTACKREASON] == AR_ReactToDamage) || (victim.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE)) && ((victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE)))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_WatchFight,0,"");
			return;
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim))
		{
			return;
		}
		else
		{
			B_Attack(self,other,AR_GuardStopsFight,0);
			return;
		};
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_NONE) || (other.aivar[AIV_ATTACKREASON] == AR_KILL)) && ((victim.aivar[AIV_ATTACKREASON] == AR_NONE) || (victim.aivar[AIV_ATTACKREASON] == AR_KILL)) && (self.guild == GIL_MIL) && (self.guild == GIL_TPL))
	{
		if((Npc_GetAttitude(self,other) == ATT_FRIENDLY) && (Npc_GetAttitude(self,victim) != ATT_FRIENDLY))
		{
			B_Attack(self,victim,AR_GuardStopsFight,0);
			return;
		}
		else if((Npc_GetAttitude(self,victim) == ATT_FRIENDLY) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY))
		{
			B_Attack(self,other,AR_GuardStopsFight,0);
			return;
		}
		else if(Npc_IsPlayer(other))
		{
			B_Attack(self,victim,AR_GuardStopsFight,0);
			return;
		}
		else if(Npc_IsPlayer(victim))
		{
			B_Attack(self,other,AR_GuardStopsFight,0);
			return;
		}
		else
		{
			B_Attack(self,other,AR_GuardStopsFight,0);
			return;
		};
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_UseMob) || (other.aivar[AIV_ATTACKREASON] == AR_Theft) || (other.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		if(C_WantToAttackThief(self,victim))
		{
			B_Attack(self,victim,AR_GuardCalledToThief,0);
		};
		return;
	};
	if(((victim.aivar[AIV_ATTACKREASON] == AR_UseMob) || (victim.aivar[AIV_ATTACKREASON] == AR_Theft) || (victim.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(C_WantToAttackThief(self,other))
		{
			B_Attack(self,other,AR_GuardCalledToThief,0);
		};
		return;
	};
	if((other.aivar[AIV_ATTACKREASON] == AR_ClearRoom) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		B_Attack(self,victim,AR_GuardCalledToRoom,0);
		return;
	};
	if((victim.aivar[AIV_ATTACKREASON] == AR_ClearRoom) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		B_Attack(self,other,AR_GuardCalledToRoom,0);
		return;
	};
	if((Npc_GetAttitude(self,other) == ATT_HOSTILE) || (Npc_GetAttitude(self,victim) == ATT_HOSTILE))
	{
		if(self.guild != GIL_BDT)
		{
			return;
		};
	};
	if((C_PlayerIsFakeBandit(self,other) == FALSE) && Npc_IsPlayer(other) && ((self.guild == GIL_BDT) || (victim.guild == GIL_BDT)))
	{
		B_Attack(self,other,AR_GuildEnemy,0);
		return;
	};
	if((Npc_GetGuildAttitude(self,victim) == ATT_FRIENDLY) && (self.aivar[AIV_ToughGuy] == FALSE))
	{
		B_Attack(self,other,AR_GuardStopsFight,0);
		return;
	};

	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_WatchFight,0,"");
};

