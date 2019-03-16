var int lastheala;
var int RavenAwayTrue;
var int HaniarAwayTrue;
var int DarkMage_Count;
var int TempHealthAvabul;

func void B_AssessSurprise()
{
	Npc_SetTarget(self,other);
	self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
};

func void ZS_Attack()
{
	var C_Item AttWeap;

	if(Npc_IsPlayer(other) && (PLAYER_MOBSI_PRODUCTION != MOBSI_NONE))
	{
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};

	AttWeap = Npc_GetReadiedWeapon(self);

	if(Hlp_IsValidItem(AttWeap))
	{
		if(!Itm_OneHanded(AttWeap) && (self.aivar[AIV_MM_RoamEnd] == TRUE))
		{
			self.aivar[AIV_MM_RoamEnd] = FALSE;
			Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(self,"BIP01 L HAND");
			Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));
		};
	};

	Perception_Set_Minimal();
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_AssessSurprise);
	B_ValidateOther();
	b_staminainvent();

	if(self.aivar[AIV_MM_SleepStart] == TRUE)
	{
		Mdl_RemoveOverlayMds(self,"Humans_Woundz.mds");
		Mdl_RemoveOverlayMds(self,"PRE_START.MDS");
		self.aivar[AIV_MM_SleepStart] = FALSE;
	};

	self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_5570_Avabul))
	{
		self.protection[PROT_BLUNT] = 350;
		self.protection[PROT_EDGE] = 350;
		self.protection[PROT_POINT] = 350;
		self.protection[PROT_FIRE] = 299;
		self.protection[PROT_FLY] = 299;
		self.protection[PROT_MAGIC] = 299;
		TempHealthAvabul = TRUE;
	};
	if((CurrentLevel == PRIORATWORLD_ZEN) && (self.guild == GIL_BDT) && (PlayerIsPrioratFakeTemp == TRUE) && (PlayerIsPrioratFake == FALSE) && (PLAYER_MOBSI_PRODUCTION == MOBSI_NONE))
	{
		PlayerIsPrioratFake = TRUE;
	};
	if(C_WantToFlee(self,other))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Flee,0,"");
		return;
	};
	if(self.aivar[AIV_LOADGAME] == FALSE)
	{
		if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_111_Quarhodron)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_104_GOMEZ)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_105_CORRISTO)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_106_RODRIGUEZ)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_107_DAMAROK)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_108_DRAGO)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_109_TORREZ)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_112_Rhademes)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_1159_Rhademes)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_117_NERGAL)))
		{
			B_Say_AttackReason();
		};
	};
	if(Npc_IsInFightMode(self,FMODE_NONE))
	{
		AI_EquipBestRangedWeapon(self);
		AI_EquipBestMeleeWeapon(self);
	};
	if(Npc_IsInFightMode(self,FMODE_FAR))
	{
		AI_RemoveWeapon(self);
		AI_ReadyRangedWeapon(self);
	};

	AI_Standup(self);
	B_StopLookAt(self);
	B_TurnToNpc(self,other);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah)))
	{
		AI_SetWalkMode(self,NPC_WALK);
	}
	else
	{
		AI_SetWalkMode(self,NPC_RUN);
	};

	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	self.aivar[AIV_LastAbsolutionLevel] = B_GetCurrentAbsolutionLevel(self);
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0;
	LastHeala = hero.attribute[ATR_HITPOINTS];
	self.aivar[AIV_FreezeNoHeal] = FALSE;

	if((Npc_IsPlayer(other) == FALSE) && ((self.npcType == NPCTYPE_FRIEND) || (self.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		self.noFocus = TRUE;
	};
	if(Npc_IsPlayer(other))
	{
		if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			self.mission[4] = 0;
		}
		else
		{
			self.mission[4] = 1;
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_LASTBODY] == FALSE) && (self.aivar[90] == TRUE))
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas))
		{
			Snd_Play("BATTLE_XARDAS");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_5570_Avabul))
		{
			Snd_Play("BATTLE_AVABUL");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven))
		{
			Snd_Play("BATTLE_RAVEN");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_2090_Addon_Raven))
		{
			Snd_Play("BATTLE_RAVEN_DEMON");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_12971_STONNOS))
		{
			Snd_Play("BATTLE_STONNOS");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_117_NERGAL))
		{
			Snd_Play("BATTLE_NERGAL");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1299_OberDementor_DI))
		{
			Snd_Play("BATTLE_DEMENTOR");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1298_DARKMAGE))
		{
			Snd_Play("BATTLE_TEMPLEMAGE");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol))
		{
			Snd_Play("BATTLE_KREOL");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORC_8550_URNAZUL))
		{
			Snd_Play("BATTLE_URTRALL");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_130_CorGalomDemon))
		{
			Snd_Play("BATTLE_CORGALOM");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon))
		{
			Snd_Play("BATTLE_HANIAR");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Fire))
		{
			Snd_Play("BATTLE_DRG_FIRE");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Fire_Island))
		{
			Snd_Play("BATTLE_DRG_RED");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Swamp))
		{
			Snd_Play("BATTLE_DRG_SWAMP");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Ice))
		{
			Snd_Play("BATTLE_DRG_ICE");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Rock))
		{
			Snd_Play("BATTLE_DRG_ROCK");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dragon_Undead))
		{
			Snd_Play("BATTLE_DRG_UNDEAD");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DRAGON_BLACK))
		{
			Snd_Play("BATTLE_DRG_BLACK");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_Ginnok))
		{
			Snd_Play("BATTLE_LORD_GINNOK");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DARKTOWER_SKELETON_LORD))
		{
			Snd_Play("BATTLE_LORD_ULZAR");
			SwitchMusicOff = TRUE;
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_LORD_SERDAH)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_LORD_MIRAT)))
		{
			Snd_Play("BATTLE_LORD_SERDAH");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crypt_Skeleton_Lord))
		{
			Snd_Play("BATTLE_LORD_INNUBIS");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_Archol))
		{
			Snd_Play("BATTLE_LORD_ARCHOL");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_LORD_KADAR))
		{
			Snd_Play("BATTLE_LORD_KADAR");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_LORD_KELTUZED))
		{
			Snd_Play("BATTLE_LORD_DAKAT");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLEEPER))
		{
			Snd_Play("BATTLE_ZARKUL");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLEEPER_OLD))
		{
			Snd_Play("BATTLE_SLEEPER");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(LUZIAN_DEMON))
		{
			Snd_Play("BATTLE_DEMON_LUZIAN");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SHEMRON_DEMON))
		{
			Snd_Play("BATTLE_DEMON_SHEMRON");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SENYAK_DEMON))
		{
			Snd_Play("BATTLE_DEMON_SENYAK");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_WAY))
		{
			Snd_Play("BATTLE_DEMON_NEBIROS");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HaosDemon_Orcmine))
		{
			Snd_Play("BATTLE_DEMON_ORCMINE");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HaosDemon_Psicamp))
		{
			Snd_Play("BATTLE_DEMON_PSI");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DEMON_CHAOS))
		{
			Snd_Play("BATTLE_DEMON_CHAOS");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Shadow_Priest))
		{
			Snd_Play("BATTLE_HARDIMON");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Mage_TT))
		{
			Snd_Play("BATTLE_COMMON");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_War_TT))
		{
			Snd_Play("BATTLE_COMMON");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Stone))
		{
			Snd_Play("BATTLE_AVATAR_ROCK");
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Fire))
		{
			Snd_Play("BATTLE_AVATAR_FIRE");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Water))
		{
			Snd_Play("BATTLE_AVATAR_WATER");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FIREGOLEM_UNIQ))
		{
			Snd_Play("BATTLE_FIREGOLEM_UNIQ");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORC_6666_XASH_GOR))
		{
			Snd_Play("BATTLE_XASH_GOR");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah))
		{
			Snd_Play("BATTLE_ILARAH");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV))
		{
			Snd_Play("BATTLE_LORDLV");
			SwitchMusicOff = TRUE;
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ilesil_Evil)) && (IlesilCanFight == TRUE))
		{
			Snd_Play("BATTLE_ILESIL");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NECROMACERZOMBIE))
		{
			Snd_Play("BATTLE_ZOMBIE_DARK");
			SwitchMusicOff = TRUE;
		};

		self.aivar[AIV_LASTBODY] = TRUE;
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Attack_Loop()
{
	var int Poison_lvl;
	var C_Item OthWeap;
	var C_Npc HaniarVictim;
	var int DarkMageHitPoints;
	var int AvabulHealth;
	var int tmpDemDam;
	var float AvabulHeroFPS;

	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait)))
	{
		return LOOP_END;	
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1813_Ilesil))
	{
		return LOOP_END;	
	};
	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		return LOOP_END;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah))
	{
		CircleFightIlArah = TRUE;
	};
	if(Npc_IsPlayer(other) && (CurrentLevel == PRIORATWORLD_ZEN) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ass_128_Nrozas)) && (self.guild == GIL_BDT) && (NrozasIsDead == FALSE) && (NrozasStartTrueBattle == TRUE))
	{
		return LOOP_END;	
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1080_Addon_Tom)) && (other.guild == GIL_STRF))
	{
		return LOOP_END;	
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1080_Addon_Tom)) && (self.guild == GIL_STRF))
	{
		return LOOP_END;	
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Stefan))
	{
		return LOOP_END;	
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV)) && (C_BodyStateContains(self,BS_RUN) == TRUE))
	{
		AI_SetWalkMode(self,NPC_WALK);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ilarah)) && (C_BodyStateContains(self,BS_RUN) == TRUE))
	{
		AI_SetWalkMode(self,NPC_WALK);
	};

	B_CheckHealth_Fight(self);
	Npc_GetTarget(self);

	if((self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_DEMON) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_DRAGON) && ((self.guild == GIL_SUMMONED_GOBBO_SKELETON) || (self.guild == GIL_SUMMONED_WOLF) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_SummonedGuardian) || (self.guild == GIL_SummonedZombie) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))))
	{
		if((Npc_IsPlayer(other) == FALSE) && (Npc_GetDistToNpc(self,other) < 1000))
		{
			if(other.flags == NPC_FLAG_IMMORTAL)
			{
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
			}
			else if((other.aivar[90] == TRUE) && ((other.flags == NPC_FLAG_IMMORTAL) || (other.guild == GIL_DMT) || (other.guild == GIL_DEMON)))
			{
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ilarah))
	{
		if(IlarahStarts == FALSE)
		{
			IlarahStarts = TRUE;
			IlArahActOne = TRUE;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Imarah))
	{
		if(ImarahStarts == FALSE)
		{
			ImarahStarts = TRUE;
		};
	};
	if((self.guild == GIL_BDT) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_4302_Addon_Elvrich)))
	{
		Npc_GetNextTarget(self);
		return LOOP_CONTINUE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_129_DeadNrozas)) && (self.flags == NPC_FLAG_IMMORTAL))
	{
		self.flags = FALSE;
	};
	if((other.guild == GIL_ORC) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak))))
	{
		return LOOP_END;	
	};
	if((other.guild == GIL_ORC) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8152_UrTak)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return LOOP_END;
	};
	if(Npc_IsPlayer(other) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return LOOP_END;
	};
	if(Npc_IsPlayer(other) && (Npc_IsDead(Ass_178_Prior_ArchDemon) == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin)))
	{
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_184_Adept)) && (CurrentLevel == PRIORATWORLD_ZEN) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SEK_186_SLAVEOBSSEK)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SEK_387_SLAVEOBSSEK))))
	{
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Stoneguardian_Boss)))
	{
		Npc_ClearAIQueue(self);

		if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL) && (self.aivar[AIV_LASTTARGET] != Hlp_GetInstanceID(hero)))
		{
			self.aivar[AIV_LastFightComment] = TRUE;
		};

		return LOOP_END;	
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1257_dementor)) && (ZigosTeleportOn == TRUE))
	{
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Wait(self,2);
		AI_Teleport(self,"TOT");
		ZigosTeleportOn = FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_480_Fellan)) && (FellanTeleportOn == TRUE))
	{
		if((FELLANGORTHIRDMEET == FALSE) && (FELLANGORSECONDMEET == TRUE))
		{
			Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Bald",Face_N_Normal20,0,ITAR_Vlk_L);
			self.name[0] = "Rupert";
		}
		else if((FELLANGORTHIRDMEET == FALSE) && (FELLANGORSECONDMEET == FALSE))
		{
			Mdl_SetVisualBody(self,"Hum_Body_Babe0",BodyTexBabe_N,0,"Hum_Head_Babe",FaceBabe_N_GreyCloth,0,ITAR_BauBabe_L);
			self.name[0] = "Elena";
		};

		AI_Teleport(self,"TOT");
		FellanTeleportOn = FALSE;
		return LOOP_CONTINUE;	
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) && (HaniarAwayTrue == FALSE) && (HaniarAway == TRUE) && (Npc_GetDistToWP(self,"PW_HANIAR_MEET") < 3000))
	{
		AI_Teleport(self,"TOT");
		Npc_ExchangeRoutine(self,"TOT");
		HaniarAwayTrue = TRUE;
		return LOOP_CONTINUE;	
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) && (RavenAwayTrue == FALSE) && (RavenAway == TRUE) && (Npc_GetDistToWP(self,"RAVENPRAY") < 3000))
	{
		AI_Teleport(self,"TOT");
		Npc_ExchangeRoutine(self,"TOT");
		RavenAwayTrue = TRUE;

		if(RavenDoorClosed == TRUE)
		{
			Wld_SendTrigger("EVT_ADANOS_ROOM_RAVENPRAY");
			RavenDoorClosed = FALSE;
		};

		return LOOP_CONTINUE;	
	};
	if(Npc_GetDistToNpc(self,other) > self.aivar[AIV_FightDistCancel])
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};
	if(Npc_IsPlayer(other) && (CurrentLevel != PRIORATWORLD_ZEN) && (self.flags != NPC_FLAG_IMMORTAL) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8147_Dagrag)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8148_Gunnok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8149_Turuk)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8150_UrTrok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8151_Umrak)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8152_UrTak)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2153_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2154_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2155_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2156_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2157_Fighter)) && (self.guild != GIL_KDM) && (self.guild != GIL_DMT) && (self.aivar[90] == FALSE) && (Npc_GetDistToWP(self,self.spawnPoint) > 5000) && (self.guild < GIL_SEPERATOR_HUM) && (self.aivar[AIV_PursuitEnd] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);

		if(other.guild < GIL_SEPERATOR_HUM)
		{
			if((self.guild != GIL_BDT) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_111_Quarhodron)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_104_GOMEZ)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_105_CORRISTO)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_106_RODRIGUEZ)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_107_DAMAROK)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_108_DRAGO)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_109_TORREZ)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_112_Rhademes)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_1159_Rhademes)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_117_NERGAL)))
			{
				B_Say(self,other,"$RUNCOWARD");
			};
			if(Npc_IsInFightMode(self,FMODE_MAGIC))
			{
				AI_UnreadySpell(self);
			}
			else
			{
				AI_RemoveWeapon(self);
			};
			if(self.attribute[ATR_HITPOINTS] <= self.attribute[ATR_HITPOINTS_MAX])
			{
				Npc_RemoveInvItems(self,ItPo_Health_03,Npc_HasItems(self,ItPo_Health_03));
				CreateInvItems(self,ItPo_Health_03,1);

				if(Npc_HasItems(self,ItPo_Health_03) > 0)
				{
					AI_UseItem(self,ItPo_Health_03);
				};
			};
		};
	};
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime]) && (CurrentLevel != PRIORATWORLD_ZEN) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8147_Dagrag)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8148_Gunnok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8149_Turuk)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8150_UrTrok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8151_Umrak)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8152_UrTak)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2153_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2154_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2155_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2156_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2157_Fighter)) && (self.guild != GIL_KDM) && (self.guild != GIL_DMT) && (self.aivar[90] == FALSE) && (self.flags != NPC_FLAG_IMMORTAL) && (Npc_GetDistToWP(self,self.spawnPoint) > 5000) && (self.aivar[AIV_PursuitEnd] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);

		if(other.guild < GIL_SEPERATOR_HUM)
		{
			if((self.guild != GIL_BDT) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_111_Quarhodron)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_104_GOMEZ)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_105_CORRISTO)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_106_RODRIGUEZ)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_107_DAMAROK)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_108_DRAGO)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_109_TORREZ)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_112_Rhademes)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_ADDON_1159_Rhademes)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_117_NERGAL)))
			{
				B_Say(self,other,"$RUNCOWARD");
			};
			if(Npc_IsInFightMode(self,FMODE_MAGIC))
			{
				AI_UnreadySpell(self);
			}
			else
			{
				AI_RemoveWeapon(self);
			};
			if(self.attribute[ATR_HITPOINTS] <= self.attribute[ATR_HITPOINTS_MAX])
			{
				Npc_RemoveInvItems(self,ItPo_Health_03,Npc_HasItems(self,ItPo_Health_03));
				CreateInvItems(self,ItPo_Health_03,1);

				if(Npc_HasItems(self,ItPo_Health_03) > 0)
				{
					AI_UseItem(self,ItPo_Health_03);
				};
			};
		};
	};
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		if(Npc_IsPlayer(other) && (Npc_GetDistToWP(self,self.spawnPoint) > PERC_DIST_ACTIVE_MAX) && (self.guild < GIL_SEPERATOR_HUM))
		{
			return LOOP_END;
		};
		if(Npc_GetDistToNpc(self,other) > self.senses_range)
		{
			return LOOP_END;
		};
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			if((Npc_GetDistToNpc(self,other) < self.aivar[AIV_Dist]) || !(C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP)))
			{
				self.aivar[AIV_PursuitEnd] = FALSE;
				Npc_SetStateTime(self,0);
				self.aivar[AIV_StateTime] = 0;
			}
			else
			{
				B_TurnToNpc(self,other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
			};
		};

		return LOOP_CONTINUE;
	};
	if(B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel])
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};
	if(self.aivar[AIV_WaitBeforeAttack] >= 1)
	{
		AI_Wait(self,0.8);
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	if(self.aivar[AIV_MaxDistToWp] > 0)
	{
		if((Npc_GetDistToWP(self,self.wp) > self.aivar[AIV_MaxDistToWp]) && (Npc_GetDistToWP(other,self.wp) > self.aivar[AIV_MaxDistToWp]))
		{
			self.fight_tactic = FAI_NAILED;
		}
		else
		{
			self.fight_tactic = self.aivar[AIV_OriginalFightTactic];
		};
	};
	if(!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP))
	{
		Npc_SetStateTime(self,0);
	};
	if((Npc_GetStateTime(self) > 2) && (self.aivar[AIV_TAPOSITION] == 0))
	{
		B_CallGuards();
		self.aivar[AIV_TAPOSITION] = 1;
	};
	if((Npc_GetStateTime(self) > 8) && (self.aivar[AIV_TAPOSITION] == 1))
	{
		B_CallGuards();
		self.aivar[AIV_TAPOSITION] = 2;
	};

	B_CreateAmmo(self);

	if(self.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
	{
		B_SelectSpell(self,other);
	}
	else
	{
		B_SelectWeapon(self,other);
	};

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1298_DARKMAGE)) && (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2)) && (self.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if(DarkMage_Count == 0)
		{
			AI_Wait(hero,1);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			AI_PlayAni(hero,"T_FALLB_2_FALLENB");
			AI_Wait(hero,2);
			AI_Wait(self,2);
			AI_PlayAni(hero,"T_FALLENB_2_STAND");
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_Teleport(self,"DARKMAGE_TP_00");
			B_SetAttitude(self,ATT_HOSTILE);
			DarkMage_Count += 1;
			Wld_InsertNpc(Skeleton_Dark_NoExp,"DARKMAGE_TP_01");
			Wld_InsertNpc(Skeleton_Dark_NoExp,"DARKMAGE_TP_02");
			Wld_InsertNpc(Skeleton_Dark_NoExp,"DARKMAGE_TP_03");
			return LOOP_END;

		}
		else if(DarkMage_Count == 1)
		{	
			AI_Wait(hero,1);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			AI_PlayAni(hero,"T_FALLB_2_FALLENB");
			AI_Wait(hero,2);
			AI_Wait(self,2);
			AI_PlayAni(other,"T_FALLENB_2_STAND");
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_Teleport(self,"DARKMAGE_TP_01");
			B_SetAttitude(self,ATT_HOSTILE);
			DarkMage_Count += 1;
			Wld_InsertNpc(SKELETON_WARRIOR_DARK_NOEXP,"DARKMAGE_TP_00");
			Wld_InsertNpc(SKELETON_WARRIOR_DARK_NOEXP,"DARKMAGE_TP_02");
			Wld_InsertNpc(SKELETON_WARRIOR_DARK_NOEXP,"DARKMAGE_TP_03");
			return LOOP_END;
		}
		else if(DarkMage_Count == 2)
		{	
			AI_Wait(hero,1);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			AI_PlayAni(hero,"T_FALLB_2_FALLENB");
			AI_Wait(hero,2);
			AI_Wait(self,2);
			AI_PlayAni(hero,"T_FALLENB_2_STAND");
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_Teleport(self,"DARKMAGE_TP_02");
			B_SetAttitude(self,ATT_HOSTILE);
			Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_NOEXP,"DARKMAGE_TP_00");
			Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_NOEXP,"DARKMAGE_TP_01");
			Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_NOEXP,"DARKMAGE_TP_03");
			DarkMage_Count += 1;
			return LOOP_END;
		}
		else if(DarkMage_Count == 3)
		{	
			AI_Wait(hero,1);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			AI_PlayAni(hero,"T_FALLB_2_FALLENB");
			AI_Wait(hero,2);
			AI_Wait(self,2);
			AI_PlayAni(hero,"T_FALLENB_2_STAND");
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_Teleport(self,"DARKMAGE_TP_03");
			B_SetAttitude(self,ATT_HOSTILE);
			Wld_InsertNpc(DEMONLORD_NONEEXP,"DARKMAGE_TP_00");
			Wld_InsertNpc(DEMONLORD_NONEEXP,"DARKMAGE_TP_01");
			Wld_InsertNpc(DEMONLORD_NONEEXP,"DARKMAGE_TP_02");
			DarkMage_Count += 1;
			return LOOP_END;
		}
		else if(DarkMage_Count == 4)
		{	
			self.aivar[AIV_MagicUser] = MAGIC_ALWAYS_MINE;
			return LOOP_END;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_5570_Avabul)))
	{
		AvabulHealth = self.attribute[ATR_HITPOINTS_MAX] - ((self.attribute[ATR_HITPOINTS_MAX] / 10) * TempHealthAvabul);

		if(self.attribute[ATR_HITPOINTS] <= AvabulHealth)
		{
			if(self.protection[PROT_BLUNT] > 0)
			{
				self.protection[PROT_BLUNT] = self.protection[PROT_BLUNT] - 25;
			};
			if(self.protection[PROT_EDGE] > 0)
			{
				self.protection[PROT_EDGE] = self.protection[PROT_EDGE] - 25;
			};
			if(self.protection[PROT_POINT] > 0)
			{
				self.protection[PROT_POINT] = self.protection[PROT_POINT] - 25;
			};
			if(self.protection[PROT_FLY] > 0)
			{
				self.protection[PROT_FLY] = self.protection[PROT_FLY] - 25;
			};
			if(self.protection[PROT_FIRE] > 0)
			{
				self.protection[PROT_FIRE] = self.protection[PROT_FIRE] - 25;
			};
			if(self.protection[PROT_MAGIC] > 0)
			{
				self.protection[PROT_MAGIC] = self.protection[PROT_MAGIC] - 25;
			};

			Wld_PlayEffect("SPELLFX_MASSDEATH_EXPLOSION",self,other,0,250,DAM_MAGIC,TRUE);
			TempHealthAvabul += 1;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) && (TempleIsClear == TRUE) && (HaniarAway == FALSE) && (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2)))
	{
		self.flags = NPC_FLAG_IMMORTAL;

		if(GonsalesIsDead == FALSE)
		{
			HaniarVictim = Hlp_GetNpc(NONE_1190_Assasin);
		};

		AI_Wait(hero,1);
		AI_Wait(HaniarVictim,1);
		Wld_PlayEffect("spellFX_INCOVATION_GREEN",self,self,0,0,0,FALSE);
		AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
		AI_PlayAni(hero,"T_FALLB_2_FALLENB");
		AI_PlayAni(HaniarVictim,"T_FALLB_2_FALLENB");
		AI_Wait(hero,4);
		AI_Wait(HaniarVictim,4);
		AI_Wait(self,2);
		AI_PlayAni(hero,"T_FALLENB_2_STAND");
		AI_PlayAni(HaniarVictim,"T_FALLENB_2_STAND");
		Wld_PlayEffect("spellFX_INCOVATION_GREEN",self,self,0,0,0,FALSE);
		AI_Teleport(self,"TOT");
		Npc_ExchangeRoutine(self,"TOT");
		Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
		HaniarAway = TRUE;
		return LOOP_CONTINUE;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) && (RavenCanAway == TRUE) && (RavenAway == FALSE) && (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2)))
	{
		self.flags = NPC_FLAG_IMMORTAL;
		AI_Wait(hero,1);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
		AI_PlayAni(hero,"T_FALLB_2_FALLENB");
		AI_Wait(hero,4);
		AI_Wait(self,2);
		AI_PlayAni(hero,"T_FALLENB_2_STAND");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		AI_Teleport(self,"TOT");
		Npc_ExchangeRoutine(self,"TOT");
		RavenAway = TRUE;

		if(RavenDoorClosed == TRUE)
		{
			Wld_SendTrigger("EVT_ADANOS_ROOM_RAVENPRAY");
			RavenDoorClosed = FALSE;
		};

		return LOOP_CONTINUE;
	};
	if((Npc_CanSeeNpc(self,other) == FALSE) || (Npc_CanSeeNpcFreeLOS(self,other) == FALSE))
	{
		if(Npc_IsInFightMode(self,FMODE_FAR) == TRUE)
		{
			if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Skeleton_Bow))
			{
				if(Npc_HasEquippedMeleeWeapon(self) == TRUE)
				{
					AI_RemoveWeapon(self);
					AI_ReadyMeleeWeapon(self);
					AI_GotoNpc(self,other);
				};
			};
		};
	};
	if(Hlp_IsValidNpc(other) && (C_NpcIsDown(other) == FALSE))
	{
		if(other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			AI_Attack(self);
		}
		else
		{
			Npc_ClearAIQueue(self);
		};
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		return LOOP_CONTINUE;
	}
	else
	{
		Npc_ClearAIQueue(self);
		if(Hlp_IsValidNpc(other) && Npc_IsPlayer(other) && C_NpcIsDown(other))
		{
			Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
		};

		if(self.aivar[AIV_ATTACKREASON] != AR_KILL)
		{
			Npc_PerceiveAll(self);

			if((ArenaFightNow == TRUE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak))))
			{
				Npc_ClearAIQueue(self);

				if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL) && (self.aivar[AIV_LASTTARGET] != Hlp_GetInstanceID(hero)))
				{
					self.aivar[AIV_LastFightComment] = TRUE;
				};

				return LOOP_END;
			}
			else
			{
				Npc_GetNextTarget(self);
			};
		};
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other) && ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) && (Npc_GetHeightToNpc(self,other) < PERC_DIST_HEIGHT) && (other.aivar[AIV_INVINCIBLE] == FALSE) && !(C_PlayerIsFakeBandit(self,other) && (self.guild == GIL_BDT)))
		{
			if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
			{
				self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
				if(Npc_IsPlayer(other))
				{
					self.aivar[AIV_LastPlayerAR] = AR_GuildEnemy;
					self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
					self.aivar[AIV_LastFightComment] = FALSE;
				};
			}
			else if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
			{
				self.aivar[AIV_ATTACKREASON] = self.aivar[AIV_LastPlayerAR];
			};
			return LOOP_CONTINUE;
		}
		else
		{
			Npc_ClearAIQueue(self);
			if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL) && (self.aivar[AIV_LASTTARGET] != Hlp_GetInstanceID(hero)))
			{
				self.aivar[AIV_LastFightComment] = TRUE;
			};
			return LOOP_END;
		};
	};

	return LOOP_END;
};

func void ZS_Attack_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);

	if(Npc_WasInState(self,ZS_Rage))
	{
		AI_StartState(self,ZS_Rage,0,"");
	     return;
	};
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		if(Hlp_IsValidNpc(other) && Npc_IsPlayer(other) && (self.npcType != NPCTYPE_FRIEND))
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
		if(self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	};
	if((self.aivar[AIV_PursuitEnd] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Skeleton_Bow)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM3)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM4)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM5)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ancient_Warrior_02)))
	{
		if(B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel])
		{
			B_Say(self,other,"$WISEMOVE");
		}
		else
		{
			B_Say_AttackEnd();
		};
	};
	if((other.aivar[AIV_KilledByPlayer] == TRUE) && (Wld_GetGuildAttitude(self.guild,hero.guild) != ATT_HOSTILE))
	{
		B_SetAttitude(self,ATT_FRIENDLY);
	};
	if(Npc_IsInState(other,ZS_Unconscious) && C_NpcHasAttackReasonToKill(self) && (self.guild != GIL_DMT))
	{
		if(other.aivar[93] == FALSE)
		{
			B_FinishingMove(self,other);
		};
	};
	if(Npc_IsInFightMode(self,FMODE_MAGIC))
	{
		AI_UnreadySpell(self);
	}
	else
	{
		AI_RemoveWeapon(self);
	};
	if(C_NpcIsDown(other) && C_WantToRansack(self) && ((other.aivar[AIV_RANSACKED] == FALSE) || C_NpcRansacksAlways(self)) && (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT))
	{
		other.aivar[AIV_RANSACKED] = TRUE;

		if(other.guild < GIL_SEPERATOR_HUM)
		{
			if((self.flags != NPC_FLAG_XARADRIM) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.flags != NPC_FLAG_IMMORTAL) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_660_Olaf)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_661_Graden)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_662_Bram))  && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_663_Valgard)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ass_125_Tiamant)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ass_126_Haniar)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ass_127_Osair)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ass_128_Nrozas)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_1190_Assasin)) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Ass_130_CorGalomDemon)))
			{
				AI_StartState(self,ZS_RansackBody,0,"");
				return;
			};
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AlligatorJack)) && (Npc_HasItems(other,ItFoMuttonRaw) > 0))
		{
			AI_StartState(self,ZS_GetMeat,0,"");
			return;
		};
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(orc_8524_bumshak))
		{
			AI_StartState(self,ZS_HealSelf,0,"");
			return;
		}
		else
		{
			return;
		};
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
	{
		if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			B_SetAttitude(self,ATT_NEUTRAL);
		};
	};
	if(self.aivar[AIV_InflateStateTime] == TRUE)
	{
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + (self.attribute[ATR_STRENGTH] / 10);
		self.aivar[AIV_InflateStateTime] = FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron)) && (KvarhPeace == FALSE))
	{
		AI_RemoveWeapon(self);
		AI_Teleport(self,"AV_UNDEADTHRONE");
	};
	if((self.noFocus == TRUE) && ((self.npcType == NPCTYPE_FRIEND) || (self.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		self.noFocus = FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Imarah))
	{
		ImarahStarts = FALSE;
		tmpImarahCount = FALSE;
	};
};