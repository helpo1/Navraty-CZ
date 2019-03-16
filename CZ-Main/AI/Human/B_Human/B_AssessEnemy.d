
func int B_AssessEnemy()
{
	var C_Npc mgo;
	var C_Npc lar;
	var int daynowall;
	var C_Item itm;

	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Aim))
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
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Psionic)) && (Npc_KnowsInfo(hero,DIA_Lester_Hello) == FALSE))
	{
		return FALSE;	
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Stefan)) && (StefanCanFight == FALSE))
	{
		return FALSE;	
	};
	if((MIS_HauntedLighthouse == LOG_Running) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_444_Jack)) && (LeaveMeetGhost == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE) && (CurrentLevel != LOSTVALLEY_ZEN) && (self.aivar[94] != NPC_EPIC))
	{
		return FALSE;
	};
	if(other.flags == NPC_FLAG_IMMORTAL)
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mil_316_Wambo)) && ((self.guild == GIL_PAL) || (self.guild == GIL_MIL)))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Imarah)) && (Npc_GetDistToNpc(self,other) <= 500) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
	};
	if((self.guild == GIL_KDM) && (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON))
	{
		return FALSE;
	};
	if((self.guild == GIL_DMT) && ((other.guild == GIL_DEMON) || (other.guild == GIL_SKELETON)))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_DMT) && (NazgulsAwayMe == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && C_NpcIsUndead(self) && (CrownIsUp == TRUE) && (CurrentLevel == ADANOSVALLEY_ZEN))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1192_Fregeal))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV)) && (ReadyForBoss7 == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_01") <= 500) && (MageSpeechEnd == FALSE))
	{
		return FALSE;
	};
	if((CurrentLevel == OLDWORLD_ZEN) && (Npc_GetDistToNpc(self,other) > 600) && ((self.guild == GIL_PAL) || (self.guild == GIL_MIL) || (self.guild == GIL_DJG)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_4300_Addon_Cavalorn)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Bdt_1013_Bandit_L)) && (Npc_GetDistToNpc(self,other) > 600))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BAU_4300_Addon_Cavalorn)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Bdt_1013_Bandit_L)) && (Npc_GetDistToNpc(self,other) > 600))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_500_Pyrokar)) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") <= 500) && (MageSpeechEnd == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_439_Vatras)) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_04") <= 500) && (MageSpeechEnd == FALSE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,ZS_MageSpeech))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (PLAYER_MOBSI_PRODUCTION == MOBSI_Talk))
	{
		return FALSE;
	};
	if((STOPWATERRITUAL == FALSE) && ((WATERMAGESTART == TRUE) || (BEGINWATERRITUAL == TRUE)))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14000_Addon_Saturas_ADW)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14020_Addon_Nefarius_ADW)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14010_Addon_Cronos_ADW)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14050_Addon_Merdarion_ADW)))
		{
			return FALSE;
		};
	};
	if(other.guild == GIL_MEATBUG)
	{
		return FALSE;
	};
	if((other.guild == GIL_ORC)  && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_852_Darius)) && (CurrentLevel == ORCMOUNTAIN_ZEN))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bow)) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Bow)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ancient_Warrior_02)) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ancient_Warrior_02)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ZOMBIE_OM3)) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(ZOMBIE_OM3)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ZOMBIE_OM4)) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(ZOMBIE_OM4)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ZOMBIE_OM5)) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(ZOMBIE_OM5)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return FALSE;
	};
	if((CurrentLevel == PRIORATWORLD_ZEN) && (self.guild == GIL_STRF))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_167_Adept_Convoy)) && (ConvoyDetect == FALSE))
	{
		ConvoyDetect = TRUE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Psionic)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(alef_soul)))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_102_KREOL))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1297_stonnos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12140_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12170_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12200_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12970_stonnos)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Stoneguardian_Boss)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_436_Sonja)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PIR_1301_Addon_Skip_NW)))
	{
		return FALSE;
	};
	if((self.guild == GIL_BDT) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_4302_Addon_Elvrich)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_447_Cassia)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_446_Jesper)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_494_Attila)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_445_Ramirez)))
	{
		if(other.guild == GIL_ORC)
		{
			return FALSE;
		};
	};
	if((self.guild == GIL_STRF) && (other.guild == GIL_ORC) && ((CurrentLevel == ORCOREMINE_ZEN) || (CurrentLevel == ORCCITY_ZEN)))
	{
		return FALSE;
	};
	if((OsairGoKill == TRUE) && (OsairAttackMe == FALSE))
	{
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_1190_Assasin)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_127_Osair)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_133_Adept)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_134_Adept))))
		{
			return FALSE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin)) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_127_Osair)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_133_Adept)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_134_Adept))))
		{
			return FALSE;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_480_Fellan)) && (MIS_BELIARHELPME != FALSE))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1257_dementor))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin)) && (HaniarOrderKill == TRUE) && (GonsaOut == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) && (other.guild == GIL_DEMON))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_129_DeadNrozas)) && (DemonTrap_Blocked == FALSE))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_PALMORA) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE) && (PALADINCANTTRUST == FALSE))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (ALARMONPRISON == TRUE) && (CurrentLevel == NEWWORLD_ZEN) && ((self.guild == GIL_PAL) || (self.guild == GIL_MIL)))
	{
		ALARMONPRISON = FALSE;
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		B_Attack(self,other,AR_UseMob,0);
		return TRUE;
	};
	if((STARTBIGBATTLE == TRUE) && (CANATTACKBIGBATTLE == FALSE) && (other.guild == GIL_ORC))
	{
		return FALSE;
	};
	if(C_BodyStateContains(other,BS_SNEAK) || C_BodyStateContains(other,BS_STAND))
	{
		if(!Npc_CanSeeNpc(self,other))
		{
			return FALSE;
		};
	};
	if((PRESTARTBIGBATTLE == TRUE) && (STARTBIGBATTLE == FALSE) && (other.guild == GIL_ORC) && (Npc_GetDistToWP(self,"BIGFIGHT") < 5000))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_801_Torlof)) && (TORLOFCAPTURED == TRUE) && (TORLOFISFREE == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_705_Angar_NW)) && (ANGARCAPTURED == TRUE) && (ANGARISFREE == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf)) && (WOLFCAPTURED == TRUE) && (WOLFISFREE == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_449_Lares)) && (LARESCAPTURED == TRUE) && (LARESISFREE == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pal_207_Girion)) && (GIRIONCAPTURED == TRUE) && (GIRIONISFREE == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet)) && (BENNETCAPTURED == TRUE) && (BENNETISFREE == FALSE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_121200_dagot)) && (other.guild == GIL_DEMON))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14000_Addon_Saturas_ADW)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(none_103_dragon_gold)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol)) && (other.guild == GIL_SKELETON))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol)) || (self.guild == GIL_KDM))
	{
		if((other.guild == GIL_SKELETON) || (other.guild == GIL_ZOMBIE) || (other.guild == GIL_DEMON) || (other.guild == GIL_GOBBO_SKELETON) || (other.guild == GIL_SEPERATOR_ORC))
		{
			return FALSE;
		};
	};
	if((HaniarOrderKill == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_174_Adept_Demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_175_Adept_Demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)))
	{
		if(Npc_IsPlayer(other) && (HaniarOrderKill == FALSE))
		{
			return FALSE;
		};
		if((other.guild == GIL_SKELETON) || (other.guild == GIL_ZOMBIE) || (other.guild == GIL_DEMON) || (other.guild == GIL_GOBBO_SKELETON))
		{
			return FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_130_CorGalomDemon)) && (CorGalomDontSpeak == FALSE))
	{
		return FALSE;
	};
	if(((Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)) && (other.guild < GIL_SEPERATOR_HUM) && ((self.aivar[AIV_NoFightParker] == TRUE) || (other.aivar[AIV_NoFightParker] == TRUE))) || ((other.guild > GIL_SEPERATOR_HUM) && (other.aivar[AIV_NoFightParker] == TRUE)))
	{
		return FALSE;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		return FALSE;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return FALSE;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > 1500)
		{
			return FALSE;
		};
		if(!Npc_CanSeeNpc(self,other))
		{
			return FALSE;
		};
	};
	if((C_PlayerIsFakeBandit(self,other) == TRUE) && (self.guild == GIL_BDT))
	{
		return FALSE;
	};

	mgo = Hlp_GetNpc(MagicGolem);
	lar = Hlp_GetNpc(VLK_449_Lares);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(lar)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(mgo)))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ILARAH)) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		if(Npc_IsPlayer(other) && (CurrentLevel == HAOSWORLD_ZEN) && (Npc_GetDistToWP(other,"KRATUK") < 1500))
		{
			AI_TurnToNPC(self,other);
			self.aivar[AIV_EnemyOverride] = FALSE;
		};
	};
	if(((self.aivar[AIV_EnemyOverride] == TRUE) || (other.aivar[AIV_EnemyOverride] == TRUE)) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return FALSE;
	};
	if(Npc_GetAttitude(self,other) != ATT_HOSTILE)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	if((SAFEFLAGPALADIN == TRUE) && (PALADINAWAYORC == FALSE))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_250_Garond)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_251_Oric)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_252_Parcival)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_268_Udar)))
		{
			return FALSE;
		};
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
	{
		if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && ((Npc_GetStateTime(self) > 2) || Npc_IsInState(self,ZS_ObservePlayer)) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
		{
			B_Attack(self,other,self.aivar[AIV_LastPlayerAR],0);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(((ASMALCANAPPEAR == TRUE) && (ASMALWAMBOFIGHT == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_316_Wambo)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pir_1398_addon_inextremo_announcer)))) || ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mil_316_Wambo)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1398_addon_inextremo_announcer))))
	{
		b_changeguild(Mil_316_Wambo,GIL_MIL);
		ASMALWAMBOFIGHT = TRUE;
	};
	if(Npc_IsPlayer(other) && (self.guild <= GIL_SEPERATOR_HUM))
	{
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	};

	B_Attack(self,other,AR_GuildEnemy,0);
	return TRUE;
};

