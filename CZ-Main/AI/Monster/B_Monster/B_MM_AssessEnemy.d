/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

if(Npc_IsInFightMode(other,FMODE_MAGIC) == TRUE) - upraveny neutrální kouzla (SPL_Light, SPL_TeleportXardas)

*/




func void B_MM_AssessEnemy()
{
	var C_Npc pcl;
	var C_Npc mgo;
	var C_Npc lar;
	var C_Item itm;

	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (other.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return;
	};
	if((Npc_IsPlayer(other) == FALSE) && (other.flags == NPC_FLAG_IMMORTAL))
	{
		return;
	};
	if(!C_NpcIsUndead(self) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_1192_Fregeal)) && (self.guild != GIL_ORC) && (self.guild != GIL_DEMON))
	{
		return;
	};
	if((self.guild == GIL_DEMON) && ((other.guild == GIL_DMT) || (other.guild == GIL_SKELETON)))
	{
		return;
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_1813_Ilesil))
	{
		return;	
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Stefan))
	{
		return;	
	};
	if((self.guild == GIL_SKELETON) && ((other.guild == GIL_DMT) || (other.guild == GIL_DEMON)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_GOBBO) && (GoblinKing == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Dex)) && (SkelFinalReady_Dex == TRUE) && (SkelBroFinalFight == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Str)) && (SkelFinalReady_Str == TRUE) && (SkelBroFinalFight == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Mag)) && (SkelFinalReady_Mag == TRUE) && (SkelBroFinalFight == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_LV)) && (Npc_GetDistToWP(hero,"WDS_LAVA_DEADTREE_01") <= 500))
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
		self.flags = FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_SoulKeeper)) && (Npc_GetDistToWP(hero,"LOSTVALLEY_SOULKEEPER_01") <= 500))
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
		self.flags = FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AncientTreeGolem)) && (Npc_GetDistToWP(hero,"WDS_LAVA_EKRON_01") <= 500))
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
		self.flags = FALSE;
	};
	if(Npc_IsPlayer(other) && (CurrentLevel == ADANOSVALLEY_ZEN) && (self.guild == GIL_GOBBO) && (MIS_GoblinTotem == LOG_SUCCESS) && (Npc_GetDistToWP(hero,"GOBLINCAMP_02") < 3000))
	{
		return;
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Crait))
	{
		if((CurrentLevel != ORCMOUNTAIN_ZEN) && ((self.guild == GIL_ORC) || (self.aivar[AIV_MM_REAL_ID] == ID_WARG) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Black_War))))
		{
			return;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PrisonSoul01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PrisonSoul02)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE) && (CurrentLevel != LOSTVALLEY_ZEN) && (self.aivar[94] != NPC_EPIC))
	{
		return;
	};
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if((self.guild == GIL_KDM) && (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON))
	{
		return;
	};
	if((StoneBossIsAwake == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss)))
	{
		return;
	};
	if((StoneBossIsAwake == TRUE) && (KnowAboutAdVal == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss)))
	{
		return;
	};
	if((other.guild == GIL_TROLL) && (self.guild >= GIL_MEATBUG) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return;
	};
	if((self.guild == GIL_TROLL) && (other.guild >= GIL_MEATBUG) && (other.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_447_Cassia)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_494_Attila)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_446_Jesper)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_445_Ramirez)))
	{
		if(self.guild == GIL_ORC)
		{
			return;
		};
	};
	if(C_NpcIsUndead(self) && (Npc_IsPlayer(other) == TRUE) && (ConvertToUndead == TRUE) && (CurrentLevel != LOSTVALLEY_ZEN) && (self.aivar[94] != NPC_EPIC))
	{
		return;
	};
	if(C_NpcIsUndead(self) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && ((other.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK) || (other.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK_CAVE) || (other.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER) || (other.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (KvarhPeace == TRUE) && (self.guild == GIL_SKELETON) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (CurrentLevel == ADANOSVALLEY_ZEN))
	{
		B_KillNpc(self);
		return;
	};
	if(Npc_IsPlayer(other) && C_NpcIsUndead(self) && (CrownIsUp == TRUE) && (CurrentLevel == ADANOSVALLEY_ZEN))
	{
		return;
	};
	if(Npc_IsPlayer(other) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORC_8216_TorDal)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORCWARRIOR_TORDAL_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORCWARRIOR_TORDAL_02))))
	{
		if(HeroIsOrc == TRUE)
		{
			return;
		};
	};
	if(Npc_IsPlayer(other) && (HeroIsOrc == TRUE) && (self.guild == GIL_ORC) && (CurrentLevel == PSICAMP_ZEN))
	{
		return;
	};
	if((self.guild == GIL_ORC) && (other.guild == GIL_STRF) && ((CurrentLevel == ORCOREMINE_ZEN) || (CurrentLevel == ORCCITY_ZEN)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Caracust)) && (Npc_GetDistToWP(other,"AV_KOLONA_CARACUST") <= 400))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TROLL_YOUNG_PW)) && (Npc_GetDistToWP(other,"PW_TROLL_MEAT") <= 250))
	{
		return;
	}
	else if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TROLL_YOUNG_PW)) && (Npc_GetDistToWP(other,"PW_TROLL_MEAT") <= 250) && ((PoisonDoneFull == TRUE) || (PoisonDoneHalf == TRUE) || (PoisonDoneOneTear == TRUE)))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_126_Haniar)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_03))))
	{
		return;
	};
	if(Npc_IsPlayer(other) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_04)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_05))))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_01)) && (StoneGuardsAVisAwake_01 == FALSE))
		{
			return;
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_02)) && (StoneGuardsAVisAwake_02 == FALSE))
		{
			return;
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_03)) && (StoneGuardsAVisAwake_03 == FALSE))
		{
			return;
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_04)) && (StoneGuardsAVisAwake_04 == FALSE))
		{
			return;
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_05)) && (StoneGuardsAVisAwake_05 == FALSE))
		{
			return;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol)) && (other.guild == GIL_SKELETON))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)) && (other.guild == GIL_SKELETON))
	{
		return;
	};
	if((self.guild == GIL_SKELETON) || (self.guild == GIL_ZOMBIE) || (self.guild == GIL_DEMON) || (self.guild == GIL_GOBBO_SKELETON))
	{
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_174_Adept_Demon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_175_Adept_Demon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)))
		{
			return;
		};
	};
	if(Npc_IsPlayer(other) && (CorGalomDontSpeak == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_03))))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_130_CorGalomDemon)) && (CorGalomDontSpeak == FALSE))
	{
		return;
	};
	if((self.guild == GIL_ORC)  && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SLD_852_Darius)) && (CurrentLevel == ORCMOUNTAIN_ZEN))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Npc_HasEquippedArmor(other) == TRUE) && (CurrentLevel != ORCMOUNTAIN_ZEN) && ((self.guild == GIL_ORC) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Black_War)) || (self.aivar[AIV_MM_REAL_ID] == ID_WARG)))
	{
		itm = Npc_GetEquippedArmor(other);

		if((Hlp_IsItem(itm,ITAR_ORCARMOR) == TRUE) || (Hlp_IsItem(itm,ITAR_ORCARMOR_DEX) == TRUE) || (Hlp_IsItem(itm,ITAR_SHAMANROBE) == TRUE))
		{
			if(HeroIsOrcArmor == TRUE)
			{
				return;
			};
		};
	};
	if(Npc_IsPlayer(other) && (Npc_HasEquippedArmor(other) == TRUE) && (CurrentLevel == ORCMOUNTAIN_ZEN) && ((self.guild == GIL_ORC) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Black_War)) || (self.aivar[AIV_MM_REAL_ID] == ID_WARG)))
	{
		itm = Npc_GetEquippedArmor(other);

		if((Hlp_IsItem(itm,ITAR_ORCARMOR) == TRUE) || (Hlp_IsItem(itm,ITAR_ORCARMOR_DEX) == TRUE) || (Hlp_IsItem(itm,ITAR_SHAMANROBE) == TRUE))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORC_7550_GORKAR))
			{
				return;
			}
			else if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ORC_7550_GORKAR)) && (MagicPlace04 == TRUE) && (GrumLokGivesMagic == FALSE))
			{
			}
			else if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ORC_7550_GORKAR)) && (PassGrumLok == TRUE) && (FinishSTLSD == FALSE))
			{
				return;
			}
			else if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ORC_7550_GORKAR)) && (GorKarShowMe == TRUE) && (Npc_GetDistToWP(other,"ORM_CAMPLAGER") <= 3500) && (FinishSTLSD == FALSE))
			{
				return;
			};
		};
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_ORC) && (CurrentLevel == ORCCITY_ZEN))
	{
		if((ArenaFightNow == TRUE) && ((Npc_IsInFightMode(other,FMODE_FAR) == TRUE) || (Npc_IsInFightMode(other,FMODE_MAGIC) == TRUE)))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
		if((CanArenaFightNoUluMulu == TRUE) && (ArenaFightNow == TRUE) && (KillArenaWarrior == FALSE) && (Npc_GetDistToWP(other,"ORC_CITY_ARENA_HERO") <= 1500) && (Npc_IsInFightMode(other,FMODE_FAR) == FALSE) && (Npc_IsInFightMode(other,FMODE_MAGIC) == FALSE))
		{
			return;
		};
		if((ArenaFightNow == TRUE) && (KillArenaWarrior == FALSE) && (Npc_GetDistToWP(other,"ORC_CITY_ARENA_HERO") <= 1500) && (Npc_IsInFightMode(other,FMODE_FAR) == FALSE) && (Npc_IsInFightMode(other,FMODE_MAGIC) == FALSE) && ((ArenaBattle_01_Lost == TRUE) || (ArenaBattle_02_Lost == TRUE) || (ArenaBattle_03_Lost == TRUE) || (ArenaBattle_04_Lost == TRUE) || (ArenaBattle_05_Lost == TRUE) || (ArenaBattle_06_Lost == TRUE)))
		{
			return;
		};
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_ORC) && (CurrentLevel != ORCMOUNTAIN_ZEN) && (ULUMULUISEQUIP_NO == FALSE) && ((c_equipulumulu(other) == TRUE) || (c_rediedulumulu(other) == TRUE)))
	{
		if(CurrentLevel == ORCCITY_ZEN)
		{
			if((ORCPASSNOTRALL == FALSE) && (ULUMULUISEQUIP == TRUE) && (KillArenaWarrior == FALSE))
			{
				return;
			};
		}
		else if(Npc_IsInFightMode(other,FMODE_FAR) == TRUE)
		{
		}
		else if(Npc_IsInFightMode(other,FMODE_MAGIC) == TRUE)
		{
			if((Npc_GetActiveSpell(other) == SPL_TELEPORTORC) || (Npc_GetActiveSpell(other) == SPL_Light) || (Npc_GetActiveSpell(other) == SPL_TeleportXardas))
			{
				return;
			};
		}
		else
		{
			return;
		};
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_480_Fellan)) && (MIS_BELIARHELPME != FALSE))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8563_urgrom)))
	{
		return;
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1257_dementor))
	{
		return;
	};
	if((self.guild == GIL_DRAGON) && (Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1) && (self.aivar[AIV_MM_REAL_ID] != ID_DRAGON_BLACK))
	{
		return;
	};
	if((PRESTARTBIGBATTLE == TRUE) && (STARTBIGBATTLE == FALSE) && (self.guild == GIL_ORC) && (other.guild < GIL_SEPERATOR_HUM) && (Npc_GetDistToWP(self,"BIGFIGHT") < 5000))
	{
		return;
	};
	if((STARTBIGBATTLE == TRUE) && (CANATTACKBIGBATTLE == FALSE) && (self.guild == GIL_ORC) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_121200_dagot)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1297_stonnos)))
	{
		return;
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
	if((self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_BLACK) && (DRAGONBLACKMEET == FALSE))
	{
		return;
	};
	if((self.aivar[AIV_NoFightParker] == TRUE) || (other.aivar[AIV_NoFightParker] == TRUE))
	{
		return;
	};
	if((self.aivar[AIV_EnemyOverride] == TRUE) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (DAGOTTELLALL == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_04))))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (DAGOTHIDEONCE == FALSE) && (DAGOTTELLALL == TRUE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demondagot_04))))
	{
		DAGOTHIDEONCE = TRUE;
		Npc_ExchangeRoutine(dmt_121200_dagot,"Start");
		AI_Teleport(dmt_121200_dagot,"TOT");
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan)) && (URHANSPEAKBEFOREBATTLE == TRUE) && (URHANBEATEN == TRUE) && (MIS_CHALLANGEORC == LOG_Running))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (other.guild == GIL_WOLF) && (self.guild == GIL_WOLF))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan)))
	{
		if((MIS_CHALLANGEORC == LOG_Running) && (HAGTARISINSERTED == TRUE) && (URHANSPEAKBEFOREBATTLE == FALSE))
		{
			return;
		};
		if(URHANFUCKOFF == TRUE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8550_urnazul)))
	{
		if((URNAZULFUCKOFF == TRUE) && (MIS_BELIARWILL != FALSE))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_8566_urhan)) && (URHANSPEAKBEFOREBATTLE == TRUE) && (URHANBEATEN == FALSE) && (MIS_CHALLANGEORC == LOG_Running))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(scavenger_sprint))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	if((self.aivar[AIV_MM_REAL_ID] == ID_BARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_ZIEGE))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(shemron_demon))
	{
		if((SHEMRON_TALK == FALSE) && (KNOWDEMENTORLANGUAGE == TRUE) && (Npc_HasItems(hero,itmi_darkshpere) >= 1))
		{
			return;
		};
		if((SHEMRON_FIGHT == FALSE) && (SHEMRON_TALK == TRUE))
		{
			return;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(eligor_demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(eligor_demon_ow)))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(xardas_goblin))
	{
		if(XARDASGOBLINHUNT == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(senyak_demon))
	{
		if(TALKSENYAK == FALSE)
		{
			return;
		};
	};
	if((self.guild == GIL_SKELETON) || (self.guild == GIL_ZOMBIE) || (self.guild == GIL_DEMON) || (self.guild == GIL_GOBBO_SKELETON) || (self.guild == GIL_SKELETON_MAGE))
	{
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(none_102_kreol)))
		{
			return;
		};
	};

	pcl = Hlp_GetNpc(PC_Levelinspektor);

	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return;
	};

	mgo = Hlp_GetNpc(MagicGolem);
	lar = Hlp_GetNpc(VLK_449_Lares);

	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(lar)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(mgo)))
	{
		return;
	};
	if(Npc_GetDistToWP(self,"WP_COAST_PATH_08") <= 500)
	{
		return;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if(Npc_IsPlayer(other) && (other.guild > GIL_SEPERATOR_HUM))
	{
		if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
		{
			return;
		};
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_ORC) && (CurrentLevel == SHVALLEY_ZEN) && (BLKDRAGNISDEAD == TRUE))
	{
		return;
	};
	if((self.guild == GIL_ORC) || (self.guild == GIL_FRIENDLY_ORC) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Black_War)) || (self.aivar[AIV_MM_REAL_ID] == ID_WARG) || (self.guild == GIL_SEPERATOR_ORC))
	{
		if(C_BodyStateContains(other,BS_SNEAK))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
		if(C_BodyStateContains(other,BS_STAND))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
		if(self.flags == ORCTEMPLENPCFLAGS)
		{
			return;
		};
		if(Npc_IsPlayer(other) && (Npc_HasItems(other,itmi_orcmaintotem) >= 1) && (ULUMULUISEQUIP_NO == FALSE) && (CurrentLevel != ORCMOUNTAIN_ZEN))
		{
			return;
		};
	};
	if((SAFEFLAGPALADIN == TRUE) && (PALADINAWAYORC == FALSE))
	{
		if((self.guild == GIL_ORC) || (self.aivar[AIV_MM_REAL_ID] == ID_WARG))
		{
			if(Npc_IsPlayer(other) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_250_Garond)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_251_Oric)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_252_Parcival)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_268_Udar)))
			{
				return;
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(alef_soul))
	{
		if(TALKTOALEF == FALSE)
		{
			return;
		};
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
	if(self.senses_range < Npc_GetDistToNpc(self,other))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Caracust)) || (self.guild == GIL_GOBBO) || (self.guild == GIL_SCAVENGER) || (self.guild == GIL_Giant_Rat) || (self.guild == GIL_GIANT_BUG) || (self.guild == GIL_BLOODFLY) || (self.guild == GIL_WARAN) || (self.guild == GIL_MINECRAWLER) || (self.guild == GIL_LURKER) || (self.guild == GIL_SNAPPER) || (self.guild == GIL_SHADOWBEAST) || (self.guild == GIL_HARPY) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_TROLL) || (self.guild == GIL_SWAMPSHARK) || (self.guild == GIL_MOLERAT) || (self.guild == GIL_Alligator) || (self.guild == GIL_SWAMPGOLEM) || (self.guild == GIL_Gargoyle) || (self.guild == GIL_DRACONIAN) || (self.guild == GIL_WOLF))
	{
		if(C_BodyStateContains(other,BS_SNEAK))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			}
			else if(Npc_IsInState(self,ZS_MM_Rtn_Sleep))
			{
				return;
			};
		};
		if(C_BodyStateContains(other,BS_STAND))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
	};
	if(!Npc_CanSeeNpcFreeLOS(self,other))
	{
		return;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(other.npcType == NPCTYPE_FRIEND)
		{
			return;
		};

		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if(self.aivar[AIV_MM_ThreatenBeforeAttack] == FALSE)
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if(Npc_IsInState(self,ZS_MM_EatBody))
	{
		if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};

		return;
	};

	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_ThreatenEnemy,0,"");
};