var int DragonCanSpawnAdds;
var int monster_summon_int;
var int sprint;
var int raneat;
var int DragonTickAOE;
var int SleeperTickAOE;
var int XashGorAOETick;
var int XashGorRegTick;
var int ChaosAOETick;
var int XashGorSpawn;
var int GinnokSpawn;
var int IceAvatarTickAOE;
var int FireAvatarTickAOE;
var int RockAvatarTickAOE;
var int IceAddsRelax;
var int FireAddsRelax;
var int RockAddsRelax;
var int NioretVamp;
var string KratWP;
var int IzulgTickAOE;
var int tmp_BrogCount_01;
var int tmp_BrogCount_02;
var int tmp_TragCount_01;
var int tmp_TragCount_02;
var int tmp_RugCount_01;
var int tmp_RugCount_02;
var int Troll_RugReg;
var int Troll_TragReg;
var int Troll_BrogReg;

func void B_MM_AssessSurprise()
{
	Npc_SetTarget(self,other);
};

func void ZS_MM_Attack()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_MM_AssessSurprise);
	b_staminainvent();
	B_ValidateOther();

	if(self.attribute[ATR_REGENERATEMANA] == 150)
	{
		Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
		Mdl_ApplyOverlayMds(self,"Shield.MDS");
	};
	if(Npc_IsInFightMode(self,FMODE_FAR))
	{
		AI_RemoveWeapon(self);
		AI_ReadyRangedWeapon(self);
	};

	AI_Standup(self);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_SoulKeeper)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AncientTreeGolem)))
	{
		AI_SetWalkMode(self,NPC_WALK);
	}
	else
	{
		AI_SetWalkMode(self,NPC_RUN);
	};

	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_FreezeNoHeal] = FALSE;

	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Uniq)) && (UndeadCaprute == FALSE))
	{
		Wld_SendTrigger("EVT_GATEIN_INNER_02");
		Wld_SendTrigger("EVT_GATEIN_INNER_01");
		UndeadCaprute = TRUE;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_Ginnok)) && (GinnokCaprute == FALSE))
	{
		Wld_SendTrigger("GINNOK_GATE_ENTER");
		GinnokCaprute = TRUE;
	};
	if((self.guild == GIL_GOBBO_SKELETON) && (LessMagicPower == TRUE) && (CurrentLevel == ORCMOUNTAIN_ZEN) && (self.flags == NPC_FLAG_IMMORTAL))
	{
		self.flags = NPC_FLAG_NONE;
		self.attribute[ATR_STRENGTH] = 450;
		self.attribute[ATR_HITPOINTS_MAX] = 1500;
		self.attribute[ATR_HITPOINTS] = 1500;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Speer))
	{
		Mdl_RemoveOverlayMds(self,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST1.mds");
		Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");	
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss))
	{
		Mdl_SetModelScale(self,2.0,2.0,2.0);	
	};
	if(Npc_IsPlayer(other) && (self.mission[4] != 0))
	{
		self.mission[4] = 0;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_04)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_05)))
	{
		AI_Wait(self,5);
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
			SwitchMusicOff = TRUE;
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
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DarkZhnez))
		{
			Snd_Play("BATTLE_DARKZHNEZ");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NECROMACERZOMBIE))
		{
			Snd_Play("BATTLE_ZOMBIE_DARK");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Uniq))
		{
			Snd_Play("BATTLE_IZGUL");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AraharPlague))
		{
			Snd_Play("BATTLE_ARAHAR");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardOne))
		{
			Snd_Play("BATTLE_MOONSUN");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_SoulKeeper))
		{
			Snd_Play("BATTLE_SOULKEEPER");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_LV))
		{
			Snd_Play("BATTLE_FIARAS");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Dex))
		{
			Snd_Play("BATTLE_SKELBRO");
			SwitchMusicOff = TRUE;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AncientTreeGolem))
		{
			Snd_Play("BATTLE_EKRON");
			SwitchMusicOff = TRUE;
		};

		self.aivar[AIV_LASTBODY] = TRUE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DEMON_CHAOS))
	{
		KratWP = "KRATUK";
	};
};

func int ZS_MM_Attack_Loop()
{
	var int randweapon;
	var int zufall;
	var C_Npc outter1;
	var C_Npc outter2;
	var int Poison_lvl;
	var int Damage_lvl;
	var int Damage_Real;
	var int HP_Regen;
	var int DamageAOE;
	var int DamageXashGorAOE;
	var int DamageChaosAOE;
	var int IceDamageAOE;
	var int FireDamageAOE;
	var int RockDamageAOE;
	var int Regen_lvl;
	var int random;
	var int rankrat;
	var int tmpDemDam;
	var int IzulgDamageAOE;

	if(Npc_IsPlayer(other) && (OSTAISDEAD == FALSE) && (PalLightIsOn == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Npc_GetDistToNpc(self,other) <= 1000))
	{
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		OSTAISDEAD = TRUE;

		if((MIS_XARDASTASKSFOUR == LOG_Running) && (NERGALPETVIEW == TRUE) && (XARDASTELLMEOSTA == FALSE))
		{
			B_LogEntry(TOPIC_XARDASTASKSFOUR,"Святой магический свет - вот чего боятся теневые големы! Ведь он их мнгновенно убивает...");
		}
		else if((MIS_XARDASTASKSFOUR == LOG_Running) && (NERGALPETVIEW == FALSE) && (XARDASTELLMEOSTA == TRUE))
		{
			B_LogEntry(TOPIC_XARDASTASKSFOUR,"Святой магический свет мнгновенно убил теневого голема.");
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait)))
	{
		return LOOP_END;	
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
	{
		if(Npc_GetDistToNpc(self,hero) >= 3000)
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			CraitIsUp = FALSE;
			CraitCanUp = FALSE;
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_1813_Ilesil))
	{
		return LOOP_END;	
	};
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (other.aivar[AIV_EnemyOverride] == TRUE))
	{
		return LOOP_END;	
	};
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && ((other.flags == NPC_FLAG_IMMORTAL) || (other.flags == NPC_FLAG_XARADRIM) || (other.flags == ORCTEMPLENPCFLAGS)))
	{
		return LOOP_END;	
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Stefan))
	{
		return LOOP_END;	
	};
	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		return LOOP_END;
	};
	if(self.guild == GIL_MEATBUG)
	{
		return LOOP_END;	
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(ShadowGuardOne)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardTwo)))
	{
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardOne)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(ShadowGuardTwo)))
	{
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_04)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_05)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SoulKeeperWisp_06)))
	{
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Dex)) && (SkelFinalReady_Dex == TRUE) && (SkelBroFinalFight == FALSE))
	{
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Str)) && (SkelFinalReady_Str == TRUE) && (SkelBroFinalFight == FALSE))
	{
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Mag)) && (SkelFinalReady_Mag == TRUE) && (SkelBroFinalFight == FALSE))
	{
		return LOOP_END;
	};
	if(Npc_IsPlayer(other) && (HeroTransOpen == TRUE))
	{
		AI_Wait(self,3);
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AncientTreeGolem)) && (C_BodyStateContains(self,BS_RUN) == TRUE))
	{
		AI_SetWalkMode(self,NPC_WALK);
	};

	zufall = Hlp_Random(100);
	b_staminainvent_monster(self);

	if((self.npcType == NPCTYPE_FRIEND) || (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		self.noFocus = TRUE;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ogre)) && (Hlp_Random(500) < 10))
	{
		random = Hlp_Random(9);

		if(random == 0)
		{
			Snd_Play("OGRE_ATTACK");
		}
		else if(random == 1)
		{
			Snd_Play("OGRE_ATTACK_A1");
		}
		else if(random == 2)
		{
			Snd_Play("OGRE_ATTACK_A2");
		}
		else if(random == 3)
		{
			Snd_Play("OGRE_ATTACK_A3");
		}
		else if(random == 4)
		{
			Snd_Play("OGRE_ATTACK_A4");
		}
		else if(random == 5)
		{
			Snd_Play("OGRE_ATTACK_A5");
		}
		else if(random == 6)
		{
			Snd_Play("OGRE_ATTACK_A6");
		}
		else if(random == 7)
		{
			Snd_Play("OGRE_ATTACK_A7");
		}
		else if(random == 8)
		{
			Snd_Play("OGRE_ATTACK_A8");
		};
	};
	if((C_BodyStateContains(self,BS_SWIM) == TRUE) || (C_BodyStateContains(self,BS_DIVE) == TRUE) || (C_BodyStateContains(self,BS_CRAWL) == TRUE))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};

	b_staminainvent();
	Npc_GetTarget(self);

	Damage_lvl = 10 - SBMODE;
	Regen_lvl = 5 - SBMODE;

	if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
	{
		if((other.flags != NPC_FLAG_IMMORTAL) && (other.flags != NPC_FLAG_GHOST) && (other.flags != NPC_FLAG_XARADRIM) && (other.flags != ORCTEMPLENPCFLAGS))
		{
			self.aivar[AIV_TAPOSITION] += 1;

			if((Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && !C_BodyStateContains(self,BS_JUMP))
			{
				Damage_Real = ((ATR_INTELLECT / 2) * Npc_GetTalentSkill(hero,NPC_TALENT_MAGE)) + 250;
				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_CHARGEFIREBALL",self,other,2,Damage_Real,DAM_FIRE,TRUE);
			};
		};
	};
	if((self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON) && (other.aivar[90] == TRUE) && (other.level >= 300))
	{
		if((other.flags != NPC_FLAG_IMMORTAL) && (other.flags != NPC_FLAG_GHOST) && (other.flags != NPC_FLAG_XARADRIM) && (other.flags != ORCTEMPLENPCFLAGS))
		{
			if((Npc_GetDistToNpc(self,other) >= 650) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
			{
				Damage_Real = ((ATR_INTELLECT / 4) * Npc_GetTalentSkill(hero,NPC_TALENT_MAGE)) + 150;
				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,1);
				Wld_PlayEffect("SPELLFX_BELIARRUNE",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
			}
			else
			{
				Wld_PlayEffect("SPELLFX_FEAR_WINGS",other,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_WINGS2",other,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_GROUND",other,other,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
				Npc_ClearAIQueue(self);
				Npc_SetTarget(self,other);
				B_ClearPerceptions(self);
				AI_StartState(self,ZS_MM_Flee,0,"");
				return LOOP_END;
			};
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wolf_Druid)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_1192_Fregeal)))
	{
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Wld_PlayEffect("spellFX_INCOVATION_GREEN",other,other,0,0,0,FALSE);
	};
	//if((CountBelChos == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc))))
	//{
	//	Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
	//	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	//};
	if((self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_DEMON) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_DRAGON) && ((self.guild == GIL_SUMMONED_GOBBO_SKELETON) || (self.guild == GIL_SUMMONED_WOLF) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild == GIL_SUMMONED_GOLEM) || (self.guild == GIL_SummonedGuardian) || (self.guild == GIL_SummonedZombie) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))))
	{
		if((Npc_IsPlayer(other) == FALSE) && (Npc_GetDistToNpc(self,other) < 1000))
		{
			if(other.flags == NPC_FLAG_IMMORTAL)
			{
				if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
				{
					if(CountBelChos > 0)
					{
						CountBelChos -= 1;
					};
				};

				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);

				if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
				{
					CraitIsUp = FALSE;
					CraitCanUp = FALSE;
				};
			}
			else if((other.aivar[AIV_MM_REAL_ID] == ID_STONEAVATAR) || (other.aivar[AIV_MM_REAL_ID] == ID_ICEAVATAR) || (other.aivar[AIV_MM_REAL_ID] == ID_FIREAVATAR))
			{
				if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
				{
					if(CountBelChos > 0)
					{
						CountBelChos -= 1;
					};
				};

				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);

				if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
				{
					CraitIsUp = FALSE;
					CraitCanUp = FALSE;
				};
			}
			else if((other.aivar[90] == TRUE) && ((other.guild == GIL_DRAGON) || (other.guild == GIL_UNDEADORC) || (other.guild == GIL_DMT) || (other.guild == GIL_DEMON) || (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_LORD)))
			{
				if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
				{
					if(CountBelChos > 0)
					{
						CountBelChos -= 1;
					};
				};

				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);

				if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
				{
					CraitIsUp = FALSE;
					CraitCanUp = FALSE;
				};
			}
			else if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Stalker)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SLEEPER)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SLEEPER_OLD)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(ORC_8550_URNAZUL)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_126_Haniar)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_130_CorGalomDemon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(UndeadWolf)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ghost_Uniq)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(FIREGOLEM_UNIQ)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Draconian_Elite_Boss)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Draconian_Elite_Boss)))
			{
				if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
				{
					if(CountBelChos > 0)
					{
						CountBelChos -= 1;
					};
				};

				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);

				if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
				{
					CraitIsUp = FALSE;
					CraitCanUp = FALSE;
				};
			}
			else if(other.level >= 500)
			{
				if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
				{
					if(CountBelChos > 0)
					{
						CountBelChos -= 1;
					};
				};

				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);

				if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
				{
					CraitIsUp = FALSE;
					CraitCanUp = FALSE;
				};
			};
		};
	};
	if((Npc_GetDistToNpc(self,other) < 1000) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_121200_dagot)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_1297_stonnos)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12140_tegon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12170_farion)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12200_wakon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(dmt_12970_stonnos))))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
		{
			if(CountBelChos > 0)
			{
				CountBelChos -= 1;
			};
		};

		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)))
	{
		return LOOP_END;	
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)))
	{
		return LOOP_END;	
	};
	if((self.guild == GIL_ORC) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8147_Dagrag)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8148_Gunnok)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8149_Turuk)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8146_Hart)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8150_UrTrok)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8151_Umrak))))
	{
		return LOOP_END;	
	};
	if((self.guild == GIL_ORC) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2157_Fighter))))
	{
		return LOOP_END;
	};
	if((self.guild == GIL_SKELETON) || (self.guild == GIL_DMT) || (self.guild == GIL_DEMON) || (self.guild == GIL_SKELETON_MAGE) || (self.guild == GIL_DRAGON))
	{
		if((other.guild == GIL_SKELETON) || (other.guild == GIL_DMT) || (other.guild == GIL_DEMON) || (other.guild == GIL_SKELETON_MAGE) || (other.guild == GIL_DRAGON))
		{
			return LOOP_END;
		};
	};
	if((Npc_IsPlayer(other) == FALSE) && (self.guild == other.guild))
	{
		return LOOP_END;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLEEPER_OLD)))
	{
		if((SleeperStone == FALSE) && (Npc_GetDistToNpc(self,other) < PERC_DIST_MONSTER_ACTIVE_MAX) && (Npc_IsInState(other,ZS_MagicSleep) == FALSE) && (other.attribute[ATR_HITPOINTS] > 0))
		{
			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			AI_StartState(other,ZS_MagicSleep,0,"");
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-2500);
			return LOOP_CONTINUE;	
		}
		else if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
		{
		}
		else if(SleeperStep_01 == FALSE)
		{
			if((self.attribute[ATR_HITPOINTS] > 30000) && (self.attribute[ATR_HITPOINTS] < 45000))
			{
				SleeperHeart_01 = TRUE;
				self.attribute[ATR_HITPOINTS] = 45000;
				self.flags = NPC_FLAG_IMMORTAL;
				PlayerIsWeakness = TRUE;
				return LOOP_CONTINUE;	
			}
			else if(self.flags == NPC_FLAG_IMMORTAL)
			{
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",self,self,0,0,0,FALSE);
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 250;
				return LOOP_CONTINUE;	
			};
		}
		else if((SleeperStep_01 == TRUE) && (SleeperStep_02 == FALSE))
		{
			if((self.attribute[ATR_HITPOINTS] > 15000) && (self.attribute[ATR_HITPOINTS] < 30000))
			{
				SleeperHeart_02 = TRUE;
				self.attribute[ATR_HITPOINTS] = 30000;
				self.flags = NPC_FLAG_IMMORTAL;
				PlayerIsWeakness = TRUE;
				return LOOP_CONTINUE;	
			}
			else if(self.flags == NPC_FLAG_IMMORTAL)
			{
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",self,self,0,0,0,FALSE);
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 500;
				return LOOP_CONTINUE;	
			};
		}
		else if((SleeperStep_01 == TRUE) && (SleeperStep_02 == TRUE) && (SleeperStep_03 == FALSE))
		{
			if(self.attribute[ATR_HITPOINTS] < 15000)
			{
				SleeperHeart_03 = TRUE;
				self.attribute[ATR_HITPOINTS] = 15000;
				self.flags = NPC_FLAG_IMMORTAL;
				PlayerIsWeakness = TRUE;
				return LOOP_CONTINUE;	
			}
			else if(self.flags == NPC_FLAG_IMMORTAL)
			{
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",self,self,0,0,0,FALSE);
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 1000;
				return LOOP_CONTINUE;	
			};
		};
		if((Npc_GetDistToNpc(self,other) >= 1500) && (Npc_GetDistToNpc(self,other) < 3000) && !C_BodyStateContains(self,BS_JUMP) && (self.flags != NPC_FLAG_IMMORTAL))
		{
			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			AI_Wait(self,2);
			Wld_PlayEffect("SPELLFX_CHARGEFIREBALL",self,other,2,2000,DAM_FIRE,TRUE);
			Wld_PlayEffect("SPELLFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			return LOOP_CONTINUE;	
		};
	};
	if((self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2)) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_FIRESHPERE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_DARKSHPERE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_WATERSHPERE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_STONESHPERE))))
	{
		if(SBMODE == TRUE)
		{
			Wld_SpawnNpcRange(other,Skeleton_Dark_NoExp,2,500);
		}
		else
		{
			Wld_SpawnNpcRange(other,Skeleton_Dark_NoExp,1,500);
		};

		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	};
	
	// fix скелетов
	if (Npc_IsPlayer(other) && (sbmode == TRUE) && (respfireguard == FALSE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2)) && (Hlp_GetInstanceId(self) == Hlp_GetInstanceId(skeleton_warrior_dark_fireshpere))) {
        Wld_SpawnNpcRange(other, skeleton_dark_noexp, 3, 500.00);
        respfireguard = TRUE;
    };
    if (Npc_IsPlayer(other) && (sbmode == TRUE) && (respdarkguard == FALSE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2)) && (Hlp_GetInstanceId(self) == Hlp_GetInstanceId(skeleton_warrior_dark_darkshpere))) {
        Wld_SpawnNpcRange(other, skeleton_dark_noexp, 3, 500.00);
        respdarkguard = TRUE;
    };
    if (Npc_IsPlayer(other) && (sbmode == TRUE) && (respwaterguard == FALSE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2)) && (Hlp_GetInstanceId(self) == Hlp_GetInstanceId(skeleton_warrior_dark_watershpere))) {
        Wld_SpawnNpcRange(other, skeleton_dark_noexp, 3, 500.00);
        respwaterguard = TRUE;
    };
    if (Npc_IsPlayer(other) && (sbmode == TRUE) && (respstoneguard == FALSE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2)) && (Hlp_GetInstanceId(self) == Hlp_GetInstanceId(skeleton_warrior_dark_stoneshpere))) {
        Wld_SpawnNpcRange(other, skeleton_dark_noexp, 3, 500.00);
        respstoneguard = TRUE;
    };
	
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stalker)))
	{
		NioretVamp = NioretVamp + 1;

		if(NioretVamp >= 500)
		{
			AI_PlayAni(self,"T_WARN");
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-250);
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",self,other,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_UNDEAD_SCREENBLEND",self,other,0,0,0,FALSE);
			PlayerIsSick = TRUE;

			if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] += 250;
			};
			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};

			NioretVamp = FALSE;
		};
	};
	if(self.guild == GIL_DRAGON)
	{
		if((Npc_GetDistToWP(other,"DRT_HERO") > 1000) && (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD))
		{
			self.attribute[ATR_HITPOINTS] += Regen_lvl * 100;

			if(self.aivar[AIV_TAPOSITION] >= 4)
			{
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			};
			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};
		};

		self.aivar[AIV_TAPOSITION] += 1;

		if((self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) && (self.aivar[AIV_TAPOSITION] >= 2))
		{
			self.attribute[ATR_HITPOINTS] += Regen_lvl;
			self.aivar[AIV_TAPOSITION] = 0;
		};
		if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && !C_BodyStateContains(self,BS_JUMP) && (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_RED))
		{
			if(DragonTickAOE < 10)
			{
				Damage_Real = Damage_lvl * 150;

				if(Damage_Real > other.protection[PROT_FIRE])
				{
					Damage_Real = Damage_Real - other.protection[PROT_FIRE];
				}
				else
				{
					Damage_Real = 150;
				};

				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_FIREBALL");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_DRAGONFLAMEBALL",self,other,2,Damage_Real,DAM_FIRE,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_RED",self,self,0,0,0,FALSE);
				DragonTickAOE += 1;

				if(DragonRegenFast == TRUE)
				{
					if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] += Regen_lvl * 350;

						if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
						{
							self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
						};
					};

					DragonRegenFast = FALSE;
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
				Snd_Play("DRAGON_WRATH_01");
				AI_PlayAni(self,"T_STAND_2_TALK");
				AI_Wait(self,2);
				AI_PlayAni(self,"T_TALK_2_STAND");
				Wld_PlayEffect("SPELLFX_FIRERAIN_RAIN",self,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FIRERAIN_SCREENBLEND",self,other,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",other,other,0,0,0,FALSE);
				Wld_PlayEffect("VOB_MAGICBURN",other,other,0,0,0,FALSE);
				PlayerIsIgnition = TRUE;

				if(hero.protection[PROT_FIRE] < 900)
				{
					DamageAOE = 900 - other.protection[PROT_FIRE];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageAOE);
				};
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += Regen_lvl * self.level;

					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};

				if(SBMODE == TRUE)
				{
					Wld_SpawnNpcRange(other,Draconian_Minion,2,1000);		
				};
		
				DragonTickAOE = FALSE;
			};
		}
		else if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && !C_BodyStateContains(self,BS_JUMP) && (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			if(DragonTickAOE < 10)
			{
				Damage_Real = Damage_lvl * 95;

				if(Damage_Real > other.protection[PROT_FIRE])
				{
					Damage_Real = Damage_Real - other.protection[PROT_FIRE];
				}
				else
				{
					Damage_Real = 95;
				};

				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_FIREBALL");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_DRAGONFLAMEBALL",self,other,2,Damage_Real,DAM_FIRE,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",self,self,0,0,0,FALSE);
				DragonTickAOE += 1;

				if(DragonRegenFast == TRUE)
				{
					if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] += Regen_lvl * 250;

						if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
						{
							self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
						};
					};

					DragonRegenFast = FALSE;
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
				Snd_Play("DRAGON_WRATH_01");
				AI_PlayAni(self,"T_STAND_2_TALK");
				AI_Wait(self,2);
				AI_PlayAni(self,"T_TALK_2_STAND");
				Wld_PlayEffect("SPELLFX_FIRERAIN_RAIN",self,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FIRERAIN_SCREENBLEND",self,other,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",other,other,0,0,0,FALSE);
				Wld_PlayEffect("VOB_MAGICBURN",other,other,0,0,0,FALSE);
				PlayerIsIgnition = TRUE;

				if(other.protection[PROT_FIRE] < 700)
				{
					DamageAOE = 700 - other.protection[PROT_FIRE];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageAOE);
				};
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += Regen_lvl * self.level;

					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
				if(SBMODE == TRUE)
				{
					Wld_SpawnNpcRange(other,FireGolem_Dragon,2,1000);			
				};

				DragonTickAOE = FALSE;
			};
		}
		else if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && !C_BodyStateContains(self,BS_JUMP) && (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD))
		{
			if(DragonTickAOE < 10)
			{
				Damage_Real = Damage_lvl * 300;

				if(Damage_Real > other.protection[PROT_FIRE])
				{
					Damage_Real = Damage_Real - other.protection[PROT_FIRE];
				}
				else
				{
					Damage_Real = 300;
				};
				if((DragonTickAOE == 2) || (DragonTickAOE == 4) || (DragonTickAOE == 6) || (DragonTickAOE == 8))
				{
					AI_TurnToNPC(self,other);
					AI_PlayAni(self,"T_FIREBALL");
					AI_Wait(self,2);
					Wld_PlayEffect("SPELLFX_DRAGONFLAMEBALL",self,other,2,Damage_Real,DAM_FIRE,TRUE);
					Wld_PlayEffect("SPELLFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
				}
				else
				{
					AI_TurnToNPC(self,other);
					AI_Wait(self,2);
				};

				DragonTickAOE += 1;

				if(DragonRegenFast == TRUE)
				{
					if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] += Regen_lvl * 500;

						if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
						{
							self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
						};
					};

					DragonRegenFast = FALSE;
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
				Snd_Play("DRAGON_WRATH_01");
				AI_PlayAni(self,"T_STAND_2_TALK");
				Wld_PlayEffect("SPELLFX_SUCKENERGY_BLOODFLY",other,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_SUCKENERGY_SENDPERCEPTION",other,other,0,0,0,FALSE);
				AI_Wait(self,10);
				AI_PlayAni(self,"T_TALK_2_STAND");
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",self,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_UNDEAD_SCREENBLEND",self,other,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",other,other,0,0,0,FALSE);
				PlayerIsWeakness = TRUE;
				PlayerIsCurse = TRUE;

				if(other.protection[PROT_MAGIC] < 2500)
				{
					DamageAOE = 2500 - other.protection[PROT_MAGIC];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageAOE);
				};
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += Regen_lvl * self.level;

					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
				if(SBMODE == TRUE)
				{
					Wld_SpawnNpcRange(other,Skeleton_Lord_UD,2,300);	
				};

				DragonTickAOE = FALSE;
			};
		}
		else if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && !C_BodyStateContains(self,BS_JUMP) && (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
		{
			if(DragonTickAOE < 10)
			{
				Damage_Real = Damage_lvl * 100;

				if(Damage_Real > other.protection[PROT_MAGIC])
				{
					Damage_Real = Damage_Real - other.protection[PROT_MAGIC];
				}
				else
				{
					Damage_Real = 100;
				};

				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_FIREBALL");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_ICECUBE",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
				DragonTickAOE += 1;

				if(DragonRegenFast == TRUE)
				{
					if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] += Regen_lvl * 300;

						if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
						{
							self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
						};
					};

					DragonRegenFast = FALSE;
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
				Snd_Play("DRAGON_WRATH_01");
				AI_PlayAni(self,"T_STAND_2_TALK");
				AI_Wait(self,2);
				AI_PlayAni(self,"T_TALK_2_STAND");
				Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",self,other,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",other,other,0,0,0,FALSE);
				PlayerIsWeakness = TRUE;

				if(other.protection[PROT_MAGIC] < 800)
				{
					DamageAOE = 800 - other.protection[PROT_MAGIC];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageAOE);
				};
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += Regen_lvl * self.level;

					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
				if(SBMODE == TRUE)
				{
					Wld_SpawnNpcRange(other,IceGolem_Dragon,2,1000);	
				};

				DragonTickAOE = FALSE;
			};
		}
		else if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && !C_BodyStateContains(self,BS_JUMP) && (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK))
		{
			if(DragonTickAOE < 10)
			{
				Damage_Real = Damage_lvl * 90;

				if(Damage_Real > other.protection[PROT_FIRE])
				{
					Damage_Real = Damage_Real - other.protection[PROT_FIRE];
				}
				else
				{
					Damage_Real = 90;
				};

				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_FIREBALL");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_DRAGONFLAMEBALL",self,other,2,Damage_Real,DAM_FIRE,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",self,self,0,0,0,FALSE);
				DragonTickAOE += 1;

				if(DragonRegenFast == TRUE)
				{
					if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] += Regen_lvl * 200;

						if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
						{
							self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
						};
					};

					DragonRegenFast = FALSE;
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
				Snd_Play("DRAGON_WRATH_01");
				AI_PlayAni(self,"T_STAND_2_TALK");
				AI_Wait(self,2);
				AI_PlayAni(self,"T_TALK_2_STAND");
				Wld_PlayEffect("SPELLFX_FIRERAIN_RAIN",self,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FIRERAIN_SCREENBLEND",self,other,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",other,other,0,0,0,FALSE);
				Wld_PlayEffect("VOB_MAGICBURN",other,other,0,0,0,FALSE);
				PlayerIsIgnition = TRUE;

				if(other.protection[PROT_FIRE] < 600)
				{
					DamageAOE = 600 - other.protection[PROT_FIRE];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageAOE);
				};
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += Regen_lvl * self.level;

					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};

				if(SBMODE == TRUE)
				{
					Wld_SpawnNpcRange(other,StoneGolem_Dragon,2,1000);	
				};

				DragonTickAOE = FALSE;
			};
		}
		else if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && !C_BodyStateContains(self,BS_JUMP) && (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP))
		{
			if(DragonTickAOE < 10)
			{
				Damage_Real = Damage_lvl * 85;


				if(Damage_Real > other.protection[PROT_FIRE])
				{
					Damage_Real = Damage_Real - other.protection[PROT_FIRE];
				}
				else
				{
					Damage_Real = 85;
				};

				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_FIREBALL");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_DRAGONFLAMEBALL",self,other,2,Damage_Real,DAM_FIRE,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",self,self,0,0,0,FALSE);
				DragonTickAOE += 1;

				if(DragonRegenFast == TRUE)
				{
					if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] += Regen_lvl * 300;

						if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
						{
							self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
						};
					};

					DragonRegenFast = FALSE;
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
				Snd_Play("DRAGON_WRATH_01");
				AI_PlayAni(self,"T_STAND_2_TALK");
				AI_Wait(self,2);
				AI_PlayAni(self,"T_TALK_2_STAND");
				Wld_PlayEffect("SPELLFX_FIRERAIN_RAIN",self,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FIRERAIN_SCREENBLEND",self,other,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",other,other,0,0,0,FALSE);
				Wld_PlayEffect("VOB_MAGICBURN",other,other,0,0,0,FALSE);
				PlayerIsIgnition = TRUE;

				if(other.protection[PROT_FIRE] < 500)
				{
					DamageAOE = 500 - other.protection[PROT_FIRE];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageAOE);
				};
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += Regen_lvl * self.level;

					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
				if(SBMODE == TRUE)
				{
					Wld_SpawnNpcRange(other,SwampGolem_Dragon,2,1000);	
				};

				DragonTickAOE = FALSE;
			};
		}
		else if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && !C_BodyStateContains(self,BS_JUMP) && (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_BLACK))
		{
			if(DragonTickAOE < 10)
			{
				Damage_Real = Damage_lvl * 125;

				if(Damage_Real > other.protection[PROT_FIRE])
				{
					Damage_Real = Damage_Real - other.protection[PROT_FIRE];
				}
				else
				{
					Damage_Real = 125;
				};

				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_FIREBALL");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_DRAGONFLAMEBALL",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
				Wld_PlayEffect("SPELLFX_INCOVATION_GREEN",self,self,0,0,0,FALSE);
				DragonTickAOE += 1;

				if(DragonRegenFast == TRUE)
				{
					if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] += Regen_lvl * 400;

						if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
						{
							self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
						};
					};

					DragonRegenFast = FALSE;
				};
			}
			else
			{
				Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
				Snd_Play("DRAGON_WRATH_01");
				AI_PlayAni(self,"T_STAND_2_TALK");
				AI_Wait(self,2);
				AI_PlayAni(self,"T_TALK_2_STAND");
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",self,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_DARKRED_SCREENBLEND",self,other,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",other,other,0,0,0,FALSE);
				PlayerIsWeakness = TRUE;
				PlayerIsCurse = TRUE;

				if(other.protection[PROT_MAGIC] < 1000)
				{
					DamageAOE = 1000 - other.protection[PROT_MAGIC];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageAOE);
				};
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += Regen_lvl * self.level;

					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
				if(SBMODE == TRUE)
				{
					Wld_InsertNpc(Ghost_Azgalor,"FP_RESP_GHOST_01");
					Wld_InsertNpc(Ghost_Azgalor,"FP_RESP_GHOST_02");
					Wld_InsertNpc(Ghost_Azgalor,"FP_RESP_GHOST_03");
				};

				DragonTickAOE = FALSE;
			};
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Draconian_Minion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_UD)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Azgalor)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SwampGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(StoneGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IceGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_Dragon)))
	{
		DragonRegenFast = TRUE;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Uniq)))
	{
		if(IhiyalRingUp == FALSE)
		{
			IzulgTickAOE += 1;

			if(IzulgTickAOE >= 1000)
			{
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",self,other,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_UNDEAD_SCREENBLEND",self,other,0,0,0,FALSE);
				PlayerIsCurse = TRUE;

				IzulgDamageAOE = Npc_GetDistToNpc(self,other);

				if(other.protection[PROT_MAGIC] < IzulgDamageAOE)
				{
					IzulgDamageAOE = IzulgDamageAOE - other.protection[PROT_MAGIC];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-IzulgDamageAOE);
				};
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += IzulgDamageAOE;

					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};

				IzulgTickAOE = FALSE;
			};
		}
		else
		{
			IzulgTickAOE = FALSE;
		};
		if((IzgulStep_01 == FALSE) && (PalLightIsOn == FALSE) && (self.attribute[ATR_HITPOINTS] > 10000) && (self.attribute[ATR_HITPOINTS] <= 15000))
		{
			AI_TurnToNPC(self,hero);
			Snd_Play("GHOSTCURSE");
			Wld_PlayEffect("SPELLFX_MASSDEATH_EXPLOSION",self,hero,0,0,0,FALSE);
			Snd_Play("HERODEAD");
			AI_PlayAni(hero,"T_STAND_2_SUCKENERGY_VICTIM");
			AI_PlayAni(hero,"S_SUCKENERGY_VICTIM");
			AI_Wait(self,10);
			AI_PlayAni(hero,"T_SUCKENERGY_VICTIM_2_STAND");
			IzgulStep_01 = TRUE;
			IzgulCurse_01 = FALSE;
		};
		if((IzgulStep_02 == FALSE) && (PalLightIsOn == FALSE) && (self.attribute[ATR_HITPOINTS] > 5000) && (self.attribute[ATR_HITPOINTS] <= 10000))
		{
			AI_TurnToNPC(self,hero);
			Snd_Play("GHOSTCURSE");
			Wld_PlayEffect("SPELLFX_MASSDEATH_EXPLOSION",self,hero,0,0,0,FALSE);
			Snd_Play("HERODEAD");
			AI_PlayAni(hero,"T_STAND_2_SUCKENERGY_VICTIM");
			AI_PlayAni(hero,"S_SUCKENERGY_VICTIM");
			AI_Wait(self,10);
			AI_PlayAni(hero,"T_SUCKENERGY_VICTIM_2_STAND");
			IzgulStep_02 = TRUE;
			IzgulCurse_02 = FALSE;
		};
		if((IzgulStep_03 == FALSE) && (PalLightIsOn == FALSE) && (self.attribute[ATR_HITPOINTS] > 0) && (self.attribute[ATR_HITPOINTS] <= 5000))
		{
			AI_TurnToNPC(self,hero);
			Snd_Play("GHOSTCURSE");
			Wld_PlayEffect("SPELLFX_MASSDEATH_EXPLOSION",self,hero,0,0,0,FALSE);
			Snd_Play("HERODEAD");
			AI_PlayAni(hero,"T_STAND_2_SUCKENERGY_VICTIM");
			AI_PlayAni(hero,"S_SUCKENERGY_VICTIM");
			AI_Wait(self,10);
			AI_PlayAni(hero,"T_SUCKENERGY_VICTIM_2_STAND");
			IzgulStep_03 = TRUE;
			IzgulCurse_03 = FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORC_8550_URNAZUL)))
	{
		if((UrTrallStep_01 == FALSE) && (self.attribute[ATR_HITPOINTS] > 20000) && (self.attribute[ATR_HITPOINTS] <= 30000))
		{
			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			AI_Wait(self,1);
			self.protection[PROT_EDGE] = IMMUNE;
			UrTrallStep_01 = TRUE;
		}
		else if((UrTrallStep_02 == FALSE) && (self.attribute[ATR_HITPOINTS] > 10000) && (self.attribute[ATR_HITPOINTS] <= 20000))
		{
			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			AI_Wait(self,1);
			self.protection[PROT_BLUNT] = IMMUNE;
			UrTrallStep_01 = TRUE;
			UrTrallStep_02 = TRUE;
		}
		else if((UrTrallStep_03 == FALSE) && (self.attribute[ATR_HITPOINTS] <= 10000))
		{
			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_BELIARSHRINE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			AI_Wait(self,1);
			self.protection[PROT_EDGE] = 200;
			self.protection[PROT_BLUNT] = 200;
			self.attribute[ATR_STRENGTH] = 1500;
			UrTrallStep_01 = TRUE;
			UrTrallStep_02 = TRUE;
			UrTrallStep_03 = TRUE;
		};
	};
	if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) < 3000) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORC_6666_XASH_GOR)))
	{
		if((self.attribute[ATR_HITPOINTS] <= 15000) && (XashGorSpawn == 0) && (ORC_6666_XASH_GOR.flags == FALSE))
		{
			ORC_6666_XASH_GOR.flags = NPC_FLAG_IMMORTAL;
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_XASHGUARD_01");
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_XASHGUARD_02");
			Wld_InsertNpc(Orc_6667_RitualShaman,"FP_ROAM_HASHTAR_SHAMAN_01");
			Wld_InsertNpc(Orc_6668_RitualShaman,"FP_ROAM_HASHTAR_SHAMAN_02");
			Wld_InsertNpc(Orc_6669_RitualShaman,"FP_ROAM_HASHTAR_SHAMAN_03");
			XashGorSpawn += 1;
		}
		else if((self.attribute[ATR_HITPOINTS] <= 10000) && (XashGorSpawn == 1) && (ORC_6666_XASH_GOR.flags == FALSE))
		{
			ORC_6666_XASH_GOR.flags = NPC_FLAG_IMMORTAL;
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_XASHGUARD_01");
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_XASHGUARD_02");
			Wld_InsertNpc(Orc_6670_RitualShaman,"FP_ROAM_HASHTAR_SHAMAN_01");
			Wld_InsertNpc(Orc_6671_RitualShaman,"FP_ROAM_HASHTAR_SHAMAN_02");
			Wld_InsertNpc(Orc_6672_RitualShaman,"FP_ROAM_HASHTAR_SHAMAN_03");
			XashGorSpawn += 1;
		}
		else if((self.attribute[ATR_HITPOINTS] <= 5000) && (XashGorSpawn == 2) && (ORC_6666_XASH_GOR.flags == FALSE))
		{
			ORC_6666_XASH_GOR.flags = NPC_FLAG_IMMORTAL;
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_XASHGUARD_01");
			Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_XASHGUARD_02");
			Wld_InsertNpc(Orc_6673_RitualShaman,"FP_ROAM_HASHTAR_SHAMAN_01");
			Wld_InsertNpc(Orc_6674_RitualShaman,"FP_ROAM_HASHTAR_SHAMAN_02");
			Wld_InsertNpc(Orc_6675_RitualShaman,"FP_ROAM_HASHTAR_SHAMAN_03");
			XashGorSpawn += 1;
		};

		XashGorAOETick = XashGorAOETick + 1;
		XashGorRegTick = XashGorRegTick + 1;

		if((self.flags == NPC_FLAG_IMMORTAL) && (XashGorRegTick >= 100))
		{
			if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] += Regen_lvl * 100;

				if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
				};
			};

			XashGorRegTick = 0;
		};
		if(XashGorAOETick >= 1000)
		{
			AI_PlayAni(self,"T_STAND_2_PRAY");
			AI_PlayAni(self,"T_PRAY_RANDOM");
			AI_PlayAni(self,"T_PRAY_2_STAND");
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",self,other,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_UNDEAD_SCREENBLEND",self,other,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			PlayerIsCurse = TRUE;
			PlayerIsSick = TRUE;

			if(ProtectHashGorAoe == FALSE)
			{
				if(hero.protection[PROT_MAGIC] < 600)
				{
					DamageXashGorAOE = 600 - hero.protection[PROT_MAGIC];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageXashGorAOE);
				};
			}
			else
			{
				if(hero.protection[PROT_MAGIC] < 300)
				{
					DamageXashGorAOE = 300 - hero.protection[PROT_MAGIC];
					Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageXashGorAOE);
				};
			};

			XashGorAOETick = 0;
		};
	};

	//------------------проверка хп троллей-------------------------------------------

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Rug))
	{
		if(Troll_RugReg == TRUE)
		{
			Troll_Rug.attribute[ATR_HITPOINTS] += 1000;

			if(Troll_Rug.attribute[ATR_HITPOINTS] >= Troll_Rug.attribute[ATR_HITPOINTS_MAX])
			{
				Troll_Rug.attribute[ATR_HITPOINTS] = Troll_Rug.attribute[ATR_HITPOINTS_MAX];
				Troll_RugReg = FALSE;
			};
		};
		if(Troll_Rug.attribute[ATR_HITPOINTS] <= 2500)
		{
			if(Troll_Rug.attribute[ATR_HITPOINTS] < Troll_Trag.attribute[ATR_HITPOINTS])
			{
				tmp_RugCount_01 = Troll_Trag.attribute[ATR_HITPOINTS] - Troll_Rug.attribute[ATR_HITPOINTS];

				if(tmp_RugCount_01 > 1500)
				{
					Troll_RugReg = TRUE; 
				};
			};
			if(Troll_Rug.attribute[ATR_HITPOINTS] < Troll_Brog.attribute[ATR_HITPOINTS])
			{
				tmp_RugCount_02 = Troll_Brog.attribute[ATR_HITPOINTS] - Troll_Rug.attribute[ATR_HITPOINTS];

				if(tmp_RugCount_02 > 1500)
				{
					Troll_RugReg = TRUE; 
				};
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Trag))
	{
		if(Troll_TragReg == TRUE)
		{
			Troll_Trag.attribute[ATR_HITPOINTS] += 1000;

			if(Troll_Trag.attribute[ATR_HITPOINTS] >= Troll_Trag.attribute[ATR_HITPOINTS_MAX])
			{
				Troll_Trag.attribute[ATR_HITPOINTS] = Troll_Trag.attribute[ATR_HITPOINTS_MAX];
				Troll_TragReg = FALSE;
			};
		};
		if(Troll_Trag.attribute[ATR_HITPOINTS] <= 2500)
		{
			if(Troll_Trag.attribute[ATR_HITPOINTS] < Troll_Rug.attribute[ATR_HITPOINTS])
			{
				tmp_TragCount_01 = Troll_Rug.attribute[ATR_HITPOINTS] - Troll_Trag.attribute[ATR_HITPOINTS];

				if(tmp_TragCount_01 > 1500)
				{
					Troll_TragReg = TRUE; 
				};
			};
			if(Troll_Trag.attribute[ATR_HITPOINTS] < Troll_Brog.attribute[ATR_HITPOINTS])
			{
				tmp_TragCount_02 = Troll_Brog.attribute[ATR_HITPOINTS] - Troll_Trag.attribute[ATR_HITPOINTS];

				if(tmp_TragCount_02 > 1500)
				{
					Troll_TragReg = TRUE; 
				};
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Troll_Brog))
	{
		if(Troll_BrogReg == TRUE)
		{
			Troll_Brog.attribute[ATR_HITPOINTS] += 1000;

			if(Troll_Brog.attribute[ATR_HITPOINTS] >= Troll_Brog.attribute[ATR_HITPOINTS_MAX])
			{
				Troll_Brog.attribute[ATR_HITPOINTS] = Troll_Brog.attribute[ATR_HITPOINTS_MAX];
				Troll_BrogReg = FALSE;
			};
		};
		if(Troll_Brog.attribute[ATR_HITPOINTS] <= 2500)
		{
			if(Troll_Brog.attribute[ATR_HITPOINTS] < Troll_Trag.attribute[ATR_HITPOINTS])
			{
				tmp_BrogCount_01 = Troll_Trag.attribute[ATR_HITPOINTS] - Troll_Brog.attribute[ATR_HITPOINTS];

				if(tmp_BrogCount_01 > 1500)
				{
					Troll_BrogReg = TRUE; 
				};
			};
			if(Troll_Rug.attribute[ATR_HITPOINTS] < Troll_Rug.attribute[ATR_HITPOINTS])
			{
				tmp_BrogCount_02 = Troll_Rug.attribute[ATR_HITPOINTS] - Troll_Brog.attribute[ATR_HITPOINTS];

				if(tmp_BrogCount_01 > 1500)
				{
					Troll_BrogReg = TRUE; 
				};
			};
		};
	};
	if(Npc_IsPlayer(other) && (Npc_GetDistToNpc(self,other) < 3000) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_Ginnok)))
	{
		if((self.attribute[ATR_HITPOINTS] <= 30000) && (GinnokSpawn == 0) && (Skeleton_Lord_Ginnok.flags == FALSE))
		{
			self.flags = NPC_FLAG_IMMORTAL;
			AI_Teleport(self,"TOT");
			Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
			Wld_InsertNpc(skeleton_knight_ginnok_01,"FP_STAND_GINNOK_GUARD_01");
			Wld_InsertNpc(skeleton_knight_ginnok_02,"FP_STAND_GINNOK_GUARD_02");
			GinnokSpawn += 1;
			return LOOP_END;
		}
		else if((self.attribute[ATR_HITPOINTS] <= 20000) && (GinnokSpawn == 1) && (Skeleton_Lord_Ginnok.flags == FALSE))
		{
			self.flags = NPC_FLAG_IMMORTAL;
			AI_Teleport(self,"TOT");
			Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
			Wld_InsertNpc(skeleton_knight_ginnok_03,"FP_STAND_GINNOK_GUARD_03");
			Wld_InsertNpc(skeleton_knight_ginnok_04,"FP_STAND_GINNOK_GUARD_04");
			GinnokSpawn += 1;
			return LOOP_END;
		}
		else if((self.attribute[ATR_HITPOINTS] <= 10000) && (GinnokSpawn == 2) && (Skeleton_Lord_Ginnok.flags == FALSE))
		{
			self.flags = NPC_FLAG_IMMORTAL;
			AI_Teleport(self,"TOT");
			Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
			Wld_InsertNpc(skeleton_knight_ginnok_05,"FP_STAND_GINNOK_GUARD_05");
			Wld_InsertNpc(skeleton_knight_ginnok_06,"FP_STAND_GINNOK_GUARD_06");
			GinnokSpawn += 1;
			return LOOP_END;
		};
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_DEMON) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(DEMON_CHAOS)) && (self.aivar[AIV_MM_REAL_ID] != ID_SLEEPER) && (self.aivar[AIV_MM_REAL_ID] != ID_TROLL_BLACK_CAVE))
	{
		if((Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
		{
			Damage_Real = Damage_lvl * 15 * Kapitel;

			if(Damage_Real > hero.protection[PROT_MAGIC])
			{
				Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
			}
			else
			{
				Damage_Real = 1;
			};

			AI_TurnToNPC(self,other);
			AI_GotoNpc(self,other);
			AI_PlayAni(self,"T_WARN");
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_BELIARRUNE",self,other,2,Damage_Real,DAM_MAGIC,TRUE);

			if(self.aivar[90] == FALSE)
			{
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					if(self.level < 100)
					{
						self.attribute[ATR_HITPOINTS] += self.level;
					}
					else
					{
						self.attribute[ATR_HITPOINTS] += 100;
					};
					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
			}
			else
			{
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += 100;

					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
			};
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DEMON_CHAOS)))
	{
		ChaosAOETick = ChaosAOETick + 1;

		if(ChaosAOETick == 5)
		{
			rankrat = Hlp_Random(4);

			if(rankrat == 0)
			{
				AI_GotoWP(self,"KRATUK_01");
				KratWP = "KRATUK_01";
				self.wp = "KRATUK_01";
			}
			else if(rankrat == 1)
			{
				AI_GotoWP(self,"KRATUK_02");
				KratWP = "KRATUK_02";
				self.wp = "KRATUK_02";
			}
			else if(rankrat == 2)
			{
				AI_GotoWP(self,"KRATUK_03");
				KratWP = "KRATUK_03";
				self.wp = "KRATUK_03";
			}
			else if(rankrat == 3)
			{
				AI_GotoWP(self,"KRATUK_04");
				KratWP = "KRATUK_04";
				self.wp = "KRATUK_04";
			};
		};
		if((self.attribute[ATR_HITPOINTS] <= 75000) && (ChaosSpawn_FSTAGE == FALSE))
		{
			Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);

			if(SBMODE == TRUE)
			{
				Wld_SpawnNpcRange(other,Skeleton_Chaos,3,1000);
			}
			else
			{
				Wld_SpawnNpcRange(other,Skeleton_Chaos,2,1000);
			};

			ChaosSpawn_FSTAGE = TRUE;
		}
		else if((self.attribute[ATR_HITPOINTS] <= 50000) && (ChaosSpawn_FSTAGE == TRUE) && (ChaosSpawn_SSTAGE == FALSE))
		{
			Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);

			if(SBMODE == TRUE)
			{
				Wld_SpawnNpcRange(other,Skeleton_Demon_Chaos,2,1000);
			}
			else
			{
				Wld_SpawnNpcRange(other,Skeleton_Demon_Chaos,1,1000);
			};

			ChaosSpawn_SSTAGE = TRUE;
		}
		else if((self.attribute[ATR_HITPOINTS] <= 25000) && (ChaosSpawn_SSTAGE == TRUE) && (ChaosSpawn_TSTAGE == FALSE))
		{
			Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);

			if(SBMODE == TRUE)
			{
				Wld_SpawnNpcRange(other,Skeleton_Chaos_Lord,2,1000);
			}
			else
			{
				Wld_SpawnNpcRange(other,Skeleton_Chaos_Lord,1,1000);
			};

			ChaosSpawn_TSTAGE = TRUE;
		};
		if(ChaosAOETick == 15)
		{
			Wld_SendTrigger("EVT_CHAOSAOE_AWARE");
			AI_GotoWP(self,"KRATUK");
			KratWP = "KRATUK";
			self.wp = "KRATUK";
		};
		if(ChaosAOETick >= 20)
		{
			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",self,other,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_UNDEAD_SCREENBLEND",self,other,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			PlayerIsCurse = TRUE;
			PlayerIsWeakness = TRUE;

			DamageChaosAOE = Npc_GetDistToNpc(self,hero);
			DamageChaosAOE += 1000;

			if(hero.protection[PROT_MAGIC] < DamageChaosAOE)
			{
				DamageChaosAOE = DamageChaosAOE - hero.protection[PROT_MAGIC];
				Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageChaosAOE);
			}
			else
			{
				DamageChaosAOE = 1000;
				Npc_ChangeAttribute(other,ATR_HITPOINTS,-DamageChaosAOE);
			};

			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (DamageChaosAOE * 5);

			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};

			ChaosAOETick = 0;
			Wld_SendTrigger("EVT_CHAOSAOE_AWARE");
			return LOOP_CONTINUE;
		}
		else
		{
			if((Npc_GetDistToNpc(self,other) >= 300) && (Npc_GetDistToNpc(self,other) < 3000) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
			{
				Damage_Real = Damage_lvl * 20 * Kapitel;
	
				if(Damage_Real > hero.protection[PROT_MAGIC])
				{
					Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
				}
				else
				{
					Damage_Real = 1;
				};

				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,1);
				Wld_PlayEffect("SPELLFX_BELIARRUNE",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
				return LOOP_CONTINUE;
			}
			else
			{
				AI_Attack(self);
				AI_Wait(self,1);
				return LOOP_CONTINUE;
			};
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_MAGE))
	{
		if(Npc_GetDistToNpc(self,other) < PERC_DIST_DRAGON_ACTIVE_MAX)
		{
			Damage_Real = Damage_lvl * 15;

			if(Damage_Real > hero.protection[PROT_FIRE])
			{
				Damage_Real = Damage_Real - hero.protection[PROT_FIRE];
			}
			else
			{
				Damage_Real = 1;
			};

			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_SPELL_V2");
			AI_PlayAni(self,"T_SPELL_V1");
			AI_Wait(self,2);
			Wld_PlayEffect("SPELLFX_FIREBOLT",self,other,2,Damage_Real,DAM_FIRE,TRUE);
		};
		if((self.attribute[ATR_HITPOINTS] < 100) && (self.vars[8] == FALSE))
		{
			AI_PlayAni(self,"T_WARN");
			AI_Wait(self,2);
			Wld_PlayEffect("SPELLFX_HEAL",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,50);
			self.vars[8] = TRUE;
		};
	};
	if(Npc_IsPlayer(other) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PSI_ZOMBIE_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_LV)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mummy)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stalker)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NECROMACERDEMONZOMBIE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NECROMACERZOMBIE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PSI_ZOMBIE_05)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie04)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_04)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_05))))
	{
		if((Npc_CanSeeNpc(self,other) == TRUE) && (Npc_CanSeeNpcFreeLOS(self,other) == TRUE) && (Npc_GetDistToNpc(self,other) >= 400) && (Npc_GetDistToNpc(self,other) < 3000) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
		{
			if(self.aivar[90] == TRUE)
			{
				if(Hlp_Random(1000) <= 2)
				{
					Damage_Real = Damage_lvl * 25;

					if(Damage_Real > hero.protection[PROT_MAGIC])
					{
						Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
					}
					else
					{
						Damage_Real = 1;
					};

					AI_TurnToNPC(self,other);
					AI_PlayAni(self,"T_WARN");
					Wld_PlayEffect("SPELLFX_SWARM",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
				};
			}
			else
			{
				if(Hlp_Random(1000) <= 1)
				{
					Damage_Real = Damage_lvl * 10;

					if(Damage_Real > hero.protection[PROT_MAGIC])
					{
						Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
					}
					else
					{
						Damage_Real = 1;
					};

					AI_TurnToNPC(self,other);
					AI_PlayAni(self,"T_WARN");
					Wld_PlayEffect("SPELLFX_SWARM",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
				};
			};
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Minecrawler_Mini)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PaleCrawler)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PaleCrawler_Minion)) && ((self.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER) || (self.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)))
	{
		if((Npc_CanSeeNpc(self,other) == TRUE) && (Npc_CanSeeNpcFreeLOS(self,other) == TRUE) && (Npc_GetDistToNpc(self,other) >= 400) && (Npc_GetDistToNpc(self,other) < 3000) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
		{
			if(self.aivar[90] == TRUE)
			{
				if(Hlp_Random(1000) <= 2)
				{
					Damage_Real = Damage_lvl * 25;

					if(Damage_Real > hero.protection[PROT_MAGIC])
					{
						Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
					}
					else
					{
						Damage_Real = 1;
					};

					AI_TurnToNPC(self,other);
					AI_PlayAni(self,"T_WARN");
					Wld_PlayEffect("SPELLFX_SPIDERWEB",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
				};
			}
			else
			{
				if(Hlp_Random(1000) <= 1)
				{
					Damage_Real = Damage_lvl * 10;

					if(Damage_Real > hero.protection[PROT_MAGIC])
					{
						Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
					}
					else
					{
						Damage_Real = 1;
					};

					AI_TurnToNPC(self,other);
					AI_PlayAni(self,"T_WARN");
					Wld_PlayEffect("SPELLFX_SPIDERWEB",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
				};
			};
		};
	};
	if(Npc_IsPlayer(other) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MINECRAWLERQUEEN)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(POISONMINECRAWLERQUEEN))))
	{
		if((Npc_CanSeeNpc(self,other) == TRUE) && (Npc_CanSeeNpcFreeLOS(self,other) == TRUE) && (Npc_GetDistToNpc(self,other) >= 300) && (Npc_GetDistToNpc(self,other) < 3000) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
		{
			Damage_Real = Damage_lvl * 5 * Kapitel;

			if(Damage_Real > hero.protection[PROT_MAGIC])
			{
				Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
			}
			else
			{
				Damage_Real = 1;
			};

			AI_TurnToNPC(self,other);
			AI_Wait(self,10);
			Wld_PlayEffect("SPELLFX_SPIDERWEB",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_SLEEPER))
	{
		if(Npc_CanSeeNpc(self,hero) && (HEROOBSENT == FALSE))
		{
			if(MIS_MILTENANCIENT == LOG_Running)
			{
				outter1 = Hlp_GetNpc(demonlord_li_1);
				outter2 = Hlp_GetNpc(demonlord_li_2);
				Wld_PlayEffect("spellFX_Teleport_RING",outter1,outter1,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_Teleport_RING",outter2,outter2,0,0,0,FALSE);
				HEROOBSENT = TRUE;
			};
		};
		if(Npc_GetDistToNpc(self,other) <= 300)
		{
			AI_TurnToNPC(self,other);
			Snd_Play("DEM_Warn");
			AI_PlayAni(self,"T_HURT");
			AI_Wait(self,2);
			Wld_PlayEffect("spellFX_BELIARSRAGE",other,other,0,0,0,FALSE);
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-150);
		}
		else if(Npc_GetDistToNpc(self,other) <= PERC_DIST_DRAGON_ACTIVE_MAX)
		{
			Damage_Real = Damage_lvl * 150;

			if(Damage_Real > hero.protection[PROT_MAGIC])
			{
				Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
			}
			else
			{
				Damage_Real = 1;
			};

			AI_TurnToNPC(self,other);
			Snd_Play("DEM_Warn");
			AI_PlayAni(self,"T_HURT");
			AI_Wait(self,2);
			Wld_PlayEffect("SPELLFX_CHARGEFIREBALL",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_ICEAVATAR))
	{
		if((IceAvatarTickAOE == 10) || (IceAvatarTickAOE == 20) || (IceAvatarTickAOE == 30) || (IceAvatarTickAOE == 40) || (IceAvatarTickAOE == 60) || (IceAvatarTickAOE == 70) || (IceAvatarTickAOE == 90))
		{
			Damage_Real = Damage_lvl * 30;
			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_ICECUBE",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
			Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
			IceAvatarTickAOE += 1;
			return LOOP_CONTINUE;
		}
		else if(IceAvatarTickAOE == 50)
		{
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",self,other,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);

			if(hero.protection[PROT_MAGIC] < 450)
			{
				IceDamageAOE = 450 - hero.protection[PROT_MAGIC];
				Npc_ChangeAttribute(other,ATR_HITPOINTS,-IceDamageAOE);
			};
			if(IceAddsRelax == FALSE)
			{
				if(SBMODE == TRUE)
				{
					Wld_SpawnNpcRange(self,IceGolem_Avatar,3,500);
				}
				else if(SBMODE == 2)
				{
					Wld_SpawnNpcRange(self,IceGolem_Avatar,2,500);
				}
				else if(SBMODE == 4)
				{
					Wld_SpawnNpcRange(self,IceGolem_Avatar,1,500);
				};

				IceAddsRelax += 1;
			}
			else
			{
				IceAddsRelax += 1;

				if(IceAddsRelax >=3)
				{
					IceAddsRelax = FALSE;
				};
			};
			
			IceAvatarTickAOE += 1;
			return LOOP_CONTINUE;
		}
		else if((IceAvatarTickAOE == 80) && (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]))
		{
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 500;

			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};
			IceAvatarTickAOE += 1;
			return LOOP_CONTINUE;
		}
		else
		{
			IceAvatarTickAOE += 1;
		};
		if(IceAvatarTickAOE >= 100)
		{
			IceAvatarTickAOE = FALSE;
			return LOOP_CONTINUE;
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_FIREAVATAR))
	{
		if((FireAvatarTickAOE == 10) || (FireAvatarTickAOE == 20) || (FireAvatarTickAOE == 30) || (FireAvatarTickAOE == 40) || (FireAvatarTickAOE == 60) || (FireAvatarTickAOE == 70) || (FireAvatarTickAOE == 90))
		{
			Damage_Real = Damage_lvl * 30;
			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_CHARGEFIREBALL",self,other,2,Damage_Real,DAM_FIRE,TRUE);
			Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",self,self,0,0,0,FALSE);
			FireAvatarTickAOE += 1;
			return LOOP_CONTINUE;
		}
		else if(FireAvatarTickAOE == 50)
		{
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_FIRERAIN_RAIN",self,other,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_FIRERAIN_SCREENBLEND",self,other,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);

			if(hero.protection[PROT_FIRE] < 450)
			{
				FireDamageAOE = 450 - hero.protection[PROT_FIRE];
				Npc_ChangeAttribute(other,ATR_HITPOINTS,-FireDamageAOE);
			};
			if(FireAddsRelax == FALSE)
			{
				if(SBMODE == TRUE)
				{
					Wld_SpawnNpcRange(self,FireGolem_Avatar,3,500);
				}
				else if(SBMODE == 2)
				{
					Wld_SpawnNpcRange(self,FireGolem_Avatar,2,500);
				}
				else if(SBMODE == 4)
				{
					Wld_SpawnNpcRange(self,FireGolem_Avatar,1,500);
				};

				FireAddsRelax += 1;
			}
			else
			{
				FireAddsRelax += 1;

				if(FireAddsRelax >=3)
				{
					FireAddsRelax = FALSE;
				};
			};
			
			FireAvatarTickAOE += 1;
			return LOOP_CONTINUE;
		}
		else if((FireAvatarTickAOE == 80) && (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]))
		{
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",self,self,0,0,0,FALSE);
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 500;

			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};
			FireAvatarTickAOE += 1;
			return LOOP_CONTINUE;
		}
		else
		{
			FireAvatarTickAOE += 1;
		};
		if(FireAvatarTickAOE >= 100)
		{
			FireAvatarTickAOE = FALSE;
			return LOOP_CONTINUE;
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_STONEAVATAR))
	{
		if(RockAvatarTickAOE == FALSE)
		{
			AI_PlayAni(self,"T_WARN");
			Wld_SpawnNpcRange(self,StoneGolem_Avatar,2,500);
			RockAvatarTickAOE = TRUE;
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		if(Npc_GetDistToNpc(self,other) >= 650)
		{
			Damage_Real = Damage_lvl * 20 * Kapitel;

			if(Damage_Real > hero.protection[PROT_MAGIC])
			{
				Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
			}
			else
			{
				Damage_Real = 1;
			};

			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_ICELANCE",self,other,2,Damage_Real,DAM_MAGIC,TRUE);

			if(self.aivar[90] == FALSE)
			{
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					if(self.level < 100)
					{
						self.attribute[ATR_HITPOINTS] += self.level;
					}
					else
					{
						self.attribute[ATR_HITPOINTS] += 100;
					};
					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
			}
			else
			{
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += 100;
	
					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(summoned_icegolem))
	{
		if((other.flags != NPC_FLAG_IMMORTAL) && (other.flags != NPC_FLAG_GHOST) && (other.flags != NPC_FLAG_XARADRIM) && (other.flags != ORCTEMPLENPCFLAGS))
		{
			if((Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
			{
				Damage_Real = ((ATR_INTELLECT / 8) * Npc_GetTalentSkill(hero,NPC_TALENT_MAGE)) + 50;
				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,1);
				Wld_PlayEffect("SPELLFX_ICELANCE",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
			};
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(FireGolem_LV)) && (self.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		if(Npc_GetDistToNpc(self,other) >= FIGHT_DIST_MELEE)
		{
			Damage_Real = Damage_lvl * 15 * Kapitel;

			if(Damage_Real > hero.protection[PROT_FIRE])
			{
				Damage_Real = Damage_Real - hero.protection[PROT_FIRE];
			}
			else
			{
				Damage_Real = 1;
			};

			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_CHARGEFIREBALL",self,other,2,Damage_Real,DAM_FIRE,TRUE);

			if(self.aivar[90] == FALSE)
			{
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					if(self.level < 100)
					{
						self.attribute[ATR_HITPOINTS] += self.level;
					}
					else
					{
						self.attribute[ATR_HITPOINTS] += 100;
					};
					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
			}
			else
			{
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += 100;
	
					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(summoned_firegolem))
	{
		if((other.flags != NPC_FLAG_IMMORTAL) && (other.flags != NPC_FLAG_GHOST) && (other.flags != NPC_FLAG_XARADRIM) && (other.flags != ORCTEMPLENPCFLAGS))
		{
			if((Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
			{
				Damage_Real = ((ATR_INTELLECT / 8) * Npc_GetTalentSkill(hero,NPC_TALENT_MAGE)) + 50;
				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,1);
				Wld_PlayEffect("SPELLFX_CHARGEFIREBALL",self,other,2,Damage_Real,DAM_FIRE,TRUE);
			};
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(AncientTreeGolem)) && ((self.aivar[AIV_MM_REAL_ID] == ID_Swampgolem) || (self.aivar[AIV_MM_REAL_ID] == ID_WoodGolem)))
	{
		if((Npc_CanSeeNpc(self,other) == TRUE) && (Npc_CanSeeNpcFreeLOS(self,other) == TRUE) && (Npc_GetDistToNpc(self,other) >= FIGHT_DIST_MELEE))
		{
			Damage_Real = Damage_lvl * 10 * Kapitel;

			if(Damage_Real > hero.protection[PROT_MAGIC])
			{
				Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
			}
			else
			{
				Damage_Real = 1;
			};

			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_ROOTS",self,other,2,Damage_Real,DAM_MAGIC,TRUE);

			if(self.aivar[90] == FALSE)
			{
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					if(self.level < 100)
					{
						self.attribute[ATR_HITPOINTS] += self.level;
					}
					else
					{
						self.attribute[ATR_HITPOINTS] += 100;
					};
					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
			}
			else
			{
				if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
				{
					self.attribute[ATR_HITPOINTS] += 100;
	
					if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
					{
						self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
					};
				};
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(summoned_swampgolem))
	{
		if((other.flags != NPC_FLAG_IMMORTAL) && (other.flags != NPC_FLAG_GHOST) && (other.flags != NPC_FLAG_XARADRIM) && (other.flags != ORCTEMPLENPCFLAGS))
		{
			if((Npc_GetDistToNpc(self,other) >= 650) && (Npc_GetDistToNpc(self,other) < 3000) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
			{
				Damage_Real = ((ATR_INTELLECT / 8) * Npc_GetTalentSkill(hero,NPC_TALENT_MAGE)) + 50;
				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,1);
				Wld_PlayEffect("SPELLFX_ROOTS",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
			};
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Shelob)))
	{
		if((other.flags != NPC_FLAG_IMMORTAL) && (other.flags != NPC_FLAG_GHOST) && (other.flags != NPC_FLAG_XARADRIM) && (other.flags != ORCTEMPLENPCFLAGS))
		{
			if((Npc_GetDistToNpc(self,other) >= 1500) && (Npc_GetDistToNpc(self,other) < 3000) && (C_BodyStateContains(other,BS_SWIM) == FALSE) && (C_BodyStateContains(other,BS_DIVE) == FALSE) && (C_BodyStateContains(other,BS_CRAWL) == FALSE))
			{
				Damage_Real = Kapitel * 50;
				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_WARN");
				AI_Wait(self,2);
				Wld_PlayEffect("SPELLFX_SPIDERWEB",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
			};
		};
	};

	//----------------эпик------------------------

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PaleCrawler))
	{
		PaleCrawlerFight = TRUE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AraharPlague))
	{
		AraharPlagueFight = TRUE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_SoulKeeper))
	{
		SoulKeeperFight = TRUE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_LV))
	{
		FiarasFight = TRUE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AncientTreeGolem))
	{
		EkronFight = TRUE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardOne)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardTwo)))
	{
		ShadowGuardFight = TRUE;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_01)))
	{
		if((AraharPlagueIsDead == FALSE) && (AraharPlagueFight == TRUE))
		{
			Npc_PerceiveAll(self);
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_GotoNpc(self,AraharPlague);
			return LOOP_END;
		}
		else
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			AraharPlagueSpawn_01 = FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_02)))
	{
		if((AraharPlagueIsDead == FALSE) && (AraharPlagueFight == TRUE))
		{
			Npc_PerceiveAll(self);
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_GotoNpc(self,AraharPlague);
			return LOOP_END;
		}
		else
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			AraharPlagueSpawn_02 = FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_03)))
	{
		if((AraharPlagueIsDead == FALSE) && (AraharPlagueFight == TRUE))
		{
			Npc_PerceiveAll(self);
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_GotoNpc(self,AraharPlague);
			return LOOP_END;
		}
		else
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			AraharPlagueSpawn_03 = FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_04)))
	{
		if((AraharPlagueIsDead == FALSE) && (AraharPlagueFight == TRUE))
		{
			Npc_PerceiveAll(self);
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_GotoNpc(self,AraharPlague);
			return LOOP_END;
		}
		else
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			AraharPlagueSpawn_04 = FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Zombie_AraharPlague_05)))
	{
		if((AraharPlagueIsDead == FALSE) && (AraharPlagueFight == TRUE))
		{
			Npc_PerceiveAll(self);
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_GotoNpc(self,AraharPlague);
			return LOOP_END;
		}
		else
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			AraharPlagueSpawn_05 = FALSE;
		};
	};

	//----------------эпик------------------------

	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gobbo_black_uniq)))
	{
		if(Npc_GetDistToNpc(self,other) >= FIGHT_DIST_MELEE)
		{
			Damage_Real = Damage_lvl * 15;

			if(Damage_Real > hero.protection[PROT_MAGIC])
			{
				Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
			}
			else
			{
				Damage_Real = 1;
			};

			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_SPELL_V2");
			AI_PlayAni(self,"T_SPELL_V1");
			AI_Wait(self,2);
			Wld_PlayEffect("SPELLFX_ICEBOLT",self,other,2,250,DAM_MAGIC,TRUE);
		};
		if(self.attribute[ATR_HITPOINTS] < 150)
		{
			AI_PlayAni(self,"T_WARN");
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_HEAL",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,100);
		};
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_HARPY))
	{
		if(Npc_GetDistToNpc(self,other) >= FIGHT_DIST_MELEE)
		{
			Damage_Real = Damage_lvl * 20;

			if(Damage_Real > hero.protection[PROT_MAGIC])
			{
				Damage_Real = Damage_Real - hero.protection[PROT_MAGIC];
			}
			else
			{
				Damage_Real = 1;
			};

			AI_TurnToNPC(self,other);
			AI_PlayAni(self,"T_WARN");
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_ICELANCE",self,other,2,Damage_Real,DAM_MAGIC,TRUE);
		};
		if(self.attribute[ATR_HITPOINTS] < 150)
		{
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_HEAL",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,100);
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gobbo_green_uniq)))
	{
		if(self.attribute[ATR_HITPOINTS] < 150)
		{
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_HEAL",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,50);
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gobbo_grandwarrior_uniq)))
	{
		if(self.attribute[ATR_HITPOINTS] < 150)
		{
			AI_Wait(self,1);
			Wld_PlayEffect("SPELLFX_HEAL",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,100);
		};
	};
	if((RavenIsDead == TRUE) && (self.guild == GIL_Stoneguardian) && (self.aivar[AIV_MM_REAL_ID] != ID_SummonedGuardian))
	{
		B_KillNpc(self);
	};
	if(CurrentLevel == OldWorld_Zen)
	{
		if(Npc_GetDistToWP(self,"WP_COAST_PATH_08") <= 500)
		{
			Npc_ClearAIQueue(self);

			if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre))
			{
				AI_Standup(self);
				AI_PlayAni(self,"T_WARN");
			};

			self.aivar[AIV_PursuitEnd] = TRUE;
			return LOOP_END;
		};
	};
	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime]) && (self.aivar[AIV_PursuitEnd] == FALSE))
	{
		Npc_ClearAIQueue(self);

		if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre))
		{
			AI_Standup(self);
		};

		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);

		if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre))
		{
			AI_PlayAni(self,"T_WARN");
		};
	};
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
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
				AI_TurnToNPC(self,other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
			};
		};

		return LOOP_CONTINUE;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if(self.aivar[AIV_WaitBeforeAttack] == 1)
	{
		AI_Wait(self,0.8);
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	if((self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_WOLF) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOBBO_SKELETON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON) || (self.aivar[AIV_MM_REAL_ID] == ID_SummonedGuardian) || (self.aivar[AIV_MM_REAL_ID] == ID_SummonedZombie) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SWAMPDRONE) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM))
	{
		if(Npc_GetDistToNpc(self,hero) >= 2500)
		{
			if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
			{
				AI_Teleport(self,"TOT");
	
				if(HeroDragonLook == TRUE)
				{
					Wld_StopEffect("DRAGONLOOK_FX");	
					HeroDragonLook = FALSE;
				};
			};
			if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
			{
				if(CountBelChos > 0)
				{
					CountBelChos -= 1;
				};
			};
			
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if((Npc_GetStateTime(self) >= 1) && ((self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_WOLF) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOBBO_SKELETON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON) || (self.aivar[AIV_MM_REAL_ID] == ID_SummonedGuardian) || (self.aivar[AIV_MM_REAL_ID] == ID_SummonedZombie) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SWAMPDRONE) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM)))
	{
		if(hero.attribute[ATR_MANA] < 1)
		{
			if(XARDAS_KNOWSSACTANOME == TRUE)
			{
				if(hero.attribute[ATR_HITPOINTS] > self.attribute[ATR_MANA_MAX])
				{
					hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - self.attribute[ATR_MANA_MAX];
				}
				else
				{
					if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
					{
						AI_Teleport(self,"TOT");

						if(HeroDragonLook == TRUE)
						{
							Wld_StopEffect("DRAGONLOOK_FX");	
							HeroDragonLook = FALSE;
						};
					};
					if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
					{
						if(CountBelChos > 0)
						{
							CountBelChos -= 1;
						};
					};				

					Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
					Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else
			{
				if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
				{
					AI_Teleport(self,"TOT");

					if(HeroDragonLook == TRUE)
					{
						Wld_StopEffect("DRAGONLOOK_FX");	
						HeroDragonLook = FALSE;
					};
				};
				if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
				{
					if(CountBelChos > 0)
					{
						CountBelChos -= 1;
					};
				};			

				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			};
		}
		else
		{
			if(hero.attribute[ATR_MANA] >= self.attribute[ATR_MANA_MAX])
			{
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - self.attribute[ATR_MANA_MAX];
			}
			else
			{
				hero.attribute[ATR_MANA] = 0;
			};
		};

		Npc_SetStateTime(self,0);
	};
	if((Npc_GetStateTime(self) >= 1) && (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON_MAGE))
	{
		if(hero.attribute[ATR_MANA] < 1)
		{
			if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
			{
				AI_Teleport(self,"TOT");

				if(HeroDragonLook == TRUE)
				{
					Wld_StopEffect("DRAGONLOOK_FX");	
					HeroDragonLook = FALSE;
				};
			};

			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		}
		else
		{
			if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) || (XARDASTEACHCASTDEMON_LORD == TRUE))
			{
				if(hero.attribute[ATR_MANA] >= 2)
				{
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 2;
				}
				else
				{
					hero.attribute[ATR_MANA] = 0;
				};
			}
			else
			{
				if(hero.attribute[ATR_MANA] >= 4)
				{
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 4;
				}
				else
				{
					hero.attribute[ATR_MANA] = 0;
				};
			};
		};

		Npc_SetStateTime(self,0);
	};
	if(!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP) && (Npc_GetStateTime(self) > 0))
	{
		Npc_SetStateTime(self,0);
		self.aivar[AIV_StateTime] = 0;
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
	if(C_NpcIsMonsterMage(self))
	{
		B_CreateAmmo(self);
		Npc_ChangeAttribute(self,ATR_MANA,ATR_MANA_MAX);
		B_SelectWeapon(self,other);
	};
	if(Npc_HasEquippedRangedWeapon(self) == TRUE)
	{
		B_CreateAmmo(self);
		B_SelectWeapon(self,other);
	};
	if(Npc_IsPlayer(other) && (HeroIsOrc == TRUE) && (self.guild == GIL_ORC) && (CurrentLevel == PSICAMP_ZEN))
	{
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		AI_RemoveWeapon(self);
		return LOOP_END;
	};
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if((Npc_CanSeeNpc(self,other) == FALSE) || (Npc_CanSeeNpcFreeLOS(self,other) == FALSE))
	{
		if(Npc_IsInFightMode(self,FMODE_FAR) == TRUE)
		{
			if(Npc_HasEquippedMeleeWeapon(self) == TRUE)
			{
				AI_RemoveWeapon(self);
				AI_ReadyMeleeWeapon(self);
				AI_GotoNpc(self,other);
			};
		};
	};
	if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
	{
		if(other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			AI_Attack(self);
			if(C_BodyStateContains(self,BS_HIT) && Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] == ID_DEADMAGE))
			{
				Npc_ChangeAttribute(other,ATR_HITPOINTS,-GHOST_DAMAGE);
				AI_PlayAni(other,"T_GOTHIT");
				Npc_ClearAIQueue(self);
				AI_Standup(self);
				return LOOP_END;
			};
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
		RANEAT = Hlp_Random(100);
		if((self.aivar[AIV_MM_PRIORITY] == PRIO_EAT) && C_WantToEat(self,other) && (RANEAT > 65))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other) && ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) && (other.aivar[AIV_INVINCIBLE] == FALSE))
		{
			self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
			return LOOP_CONTINUE;
		}
		else
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
	};
	return LOOP_END;
};

func void ZS_MM_Attack_End()
{
	b_staminainvent();

	DragonTickAOE = FALSE;
	XashGorAOETick = FALSE;
	XashGorRegTick = FALSE;
	ChaosAOETick = FALSE;
	Troll_RugReg = FALSE;
	Troll_TragReg = FALSE;
	Troll_BrogReg = FALSE;

	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);

	if(C_NpcIsMonsterMage(self))
	{
		AI_RemoveWeapon(self);
	};
	if(Npc_IsDead(other) && C_WantToEat(self,other))
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_EatBody,0,"");
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Uniq))
	{
		IzgulStep_01 = FALSE;
		IzgulStep_02 = FALSE;
		IzgulStep_03 = FALSE;
		IzgulCurse_01 = FALSE;
		IzgulCurse_02 = FALSE;
		IzgulCurse_03 = FALSE;
		IzulgTickAOE = FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DEMON_CHAOS))
	{
		ChaosSpawn_FSTAGE = FALSE;
		ChaosSpawn_SSTAGE = FALSE;
		ChaosSpawn_TSTAGE = FALSE;
		AI_GotoWP(self,"KRATUK");
		self.wp = "KRATUK";
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORC_8550_URNAZUL))
	{
		UrTrallStep_01 = FALSE;
		UrTrallStep_02 = FALSE;
		UrTrallStep_03 = FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLEEPER_OLD))
	{
		SleeperHeart_01 = FALSE;
		SleeperHeart_02 = FALSE;
		SleeperHeart_03 = FALSE;
		SleeperStep_01 = FALSE;
		SleeperStep_02 = FALSE;
		SleeperStep_03 = FALSE;
	};
	if(self.aivar[AIV_InflateStateTime] == TRUE)
	{
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + (self.attribute[ATR_STRENGTH] / 10);
		self.aivar[AIV_InflateStateTime] = FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PaleCrawler))
	{
		PaleCrawlerFight = FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AraharPlague))
	{
		AraharPlagueFight = FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_LV))
	{
		FiarasFight = FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AncientTreeGolem))
	{
		EkronFight = FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_FIRESHPERE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_DARKSHPERE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_WATERSHPERE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_STONESHPERE)))
	{
		self.aivar[AIV_PlayerHasPickedMyPocket] = FALSE;
	};

	self.noFocus = FALSE;

	if(Npc_WasInState(self,ZS_Rage))
	{
		AI_StartState(self,ZS_Rage,0,"");
	     return;
	};
};