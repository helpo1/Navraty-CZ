
const int COLL_DONOTHING = 0;
const int COLL_DOEVERYTHING = 1;
const int COLL_APPLYDAMAGE = 2;
const int COLL_APPLYHALVEDAMAGE = 4;
const int COLL_APPLYDOUBLEDAMAGE = 8;
const int COLL_APPLYVICTIMSTATE = 16;
const int COLL_DONTKILL = 32;

func int C_CanNpcCollideWithSpell(var int spellType)
{
	if((Npc_IsPlayer(other) == TRUE) && ((self.aivar[AIV_PARTYMEMBER] == TRUE) || (self.npcType == npctype_friend)))
	{
		return COLL_DONOTHING;
	};
	if((Npc_IsPlayer(other) == FALSE) && (other.guild == self.guild))
	{
		return COLL_DONOTHING;
	};
	if((Npc_IsPlayer(self) == TRUE) && (SkillBlockShield == TRUE) && (AIV_GiveShieldRes == TRUE) && (self.attribute[ATR_REGENERATEMANA] >= 1))
	{
		return COLL_APPLYHALVEDAMAGE;
	};
	if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
	{
		return COLL_DONOTHING;
	};
	if((spellType == SPL_DestroyUndead) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bow)))
	{
		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_DestroyUndead) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ancient_Warrior_02)))
	{
		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_DestroyUndead) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ZOMBIE_OM3)))
	{
		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_DestroyUndead) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ZOMBIE_OM4)))
	{
		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_DestroyUndead) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ZOMBIE_OM5)))
	{
		return COLL_DOEVERYTHING;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss))
	{
		return COLL_DONOTHING;
	};
	if(spellType == SPL_Extricate)
	{
		if((self.guild == GIL_DMT) || (self.guild == GIL_KDW) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV)) || (self.flags == NPC_FLAG_XARADRIM) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XOR_12206_WARRIORNATURE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) || (self.guild == GIL_KDF) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_DRAGON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DEMON) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_299_Sergio)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol)) || (self.aivar[90] == TRUE))
		{
			return COLL_DONOTHING;
		};
	};
	if((spellType == SPL_GuruWrath) || (spellType == SPL_Extricate))
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardOne))
		{
			return COLL_DONOTHING;
		};
	};
	if((spellType == SPL_Firebolt) || (spellType == SPL_RapidFirebolt) || (spellType == SPL_FireMeteor) || (spellType == SPL_OrcFireball) || (spellType == SPL_InstantFireball) || (spellType == SPL_Explosion) || (spellType == SPL_Firestorm) || (spellType == SPL_ChargeFireball) || (spellType == SPL_FIRELIGHT) || (spellType == SPL_Pyrokinesis) || (spellType == SPL_Firerain))
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Fire))
		{
			return COLL_DONOTHING;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Water))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if(self.protection[PROT_FIRE] == IMMUNE)
		{
			return COLL_DONOTHING;
		};

		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_Zap) || (spellType == SPL_IceLance) || (spellType == SPL_Icebolt) || (spellType == SPL_RapidIcebolt) || (spellType == SPL_IceCube) || (spellType == SPL_ChargeZap) || (spellType == SPL_WaterFist) || (spellType == SPL_LightningFlash) || (spellType == SPL_Geyser) || (spellType == SPL_IceWave) || (spellType == SPL_Thunderstorm))
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Water))
		{
			return COLL_DONOTHING;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Avatar_Fire))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if(self.protection[PROT_MAGIC] == IMMUNE)
		{
			return COLL_DONOTHING;
		};

		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_BERZERK) || (spellType == SPL_GuruWrath) || (spellType == SPL_Acid) || (spellType == SPL_WindFist) || (spellType == SPL_Quake) || (spellType == SPL_CONTROL) || (spellType == SPL_Whirlwind) || (spellType == SPL_TPLLIGHTSTRIKE) || (spellType == SPL_TPLMEDIUMSTRIKE) || (spellType == SPL_TPLHEAVYSTRIKE) || (spellType == SPL_TPLSUPERSTRIKE))
	{
		if(self.protection[PROT_MAGIC] == IMMUNE)
		{
			return COLL_DONOTHING;
		};

		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_Deathbolt) || (spellType == SPL_Lacerate) || (spellType == SPL_Swarm) || (spellType == SPL_Energyball) || (spellType == SPL_Deathball) || (spellType == SPL_BreathOfDeath) || (spellType == SPL_Skull) || (spellType == SPL_MassDeath) || (spellType == SPL_MasterOfDisaster) || (spellType == SPL_BELIARRUNE))
	{
		if(self.protection[PROT_MAGIC] == IMMUNE)
		{
			return COLL_DONOTHING;
		};

		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Whirlwind)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON) || (self.guild == GIL_Stoneguardian) || (self.flags == NPC_FLAG_IMMORTAL) || (self.guild == GIL_Gargoyle))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsGateGuard(self) == TRUE)
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Quake)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON) || (self.guild == GIL_Stoneguardian) || (self.flags == NPC_FLAG_IMMORTAL))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsGateGuard(self) == TRUE)
		{
			return COLL_APPLYDAMAGE;
		};

		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Acid)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (C_NpcIsUndead(self) == TRUE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_Stoneguardian) || (self.flags == NPC_FLAG_IMMORTAL))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsGateGuard(self) == TRUE)
		{
			return COLL_APPLYDAMAGE;
		};

		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Extricate)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || (self.aivar[94] == NPC_EPIC) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON) || (self.guild == GIL_Stoneguardian) || (self.flags == NPC_FLAG_IMMORTAL))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsGateGuard(self) == TRUE)
		{
			return COLL_APPLYDAMAGE;
		};

		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_IceLance)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (self.guild == GIL_Gargoyle))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_APPLYDAMAGE;
	};
	if(spellType == SPL_Thunderstorm)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) || (self.guild == GIL_Gargoyle))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Geyser)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_APPLYDAMAGE;
	};
	if(spellType == SPL_WaterFist)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_DRAGON) || (self.guild == GIL_TROLL))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_Gargoyle) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_APPLYDAMAGE;
	};
	if(spellType == SPL_Energyball)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsUndead(self))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_GreenTentacle)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (C_NpcIsGateGuard(self) == TRUE) || (self.guild == GIL_BLOODFLY) || (self.guild == GIL_BLOODFLY_SUMMONED) || (self.guild == GIL_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON) || (self.guild == GIL_HARPY) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (self.guild == GIL_Gargoyle))
		{
			return COLL_DONOTHING;
		};

		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Swarm)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_UNCONSCIOUS) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_FIREGOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_BLOODFLY) || (self.guild == GIL_DRAGON) || (self.guild == GIL_Stoneguardian) || (C_NpcIsUndead(self) == TRUE))
		{
			return COLL_DONOTHING;
		};

		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Skull)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (C_NpcIsUndead(self) == TRUE))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_WindFist)
	{
		if(Npc_GetDistToNpc(other,self) >= 1200)
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_Zap) || (spellType == SPL_ChargeZap) || (spellType == SPL_ConcussionBolt) || (spellType == SPL_BERZERK))
	{
		if(C_NpcIsDown(self))
		{
			return COLL_DONOTHING;
		};
		return COLL_APPLYDAMAGE | COLL_DONTKILL;
	};
	if(spellType == SPL_BELIARRUNE)
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE) || (self.guild == GIL_DEMON) || (self.guild == GIL_DMT) || (self.guild == GIL_DRAGON))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if((other.guild == GIL_DMT) || (other.guild == GIL_SKELETON) || (other.guild == GIL_UNDEADORC) || (other.guild == GIL_DEMON)) 
	{
		if((spellType == SPL_Firerain) || (spellType == SPL_Extricate) || (spellType == SPL_BELIARRUNE) || (spellType == SPL_Energyball) || (spellType == SPL_Thunderstorm) || (spellType == SPL_LightningFlash) || (spellType == SPL_DeathBall) || (spellType == SPL_Skull) || (spellType == SPL_GuruWrath))
		{
			if((self.guild == GIL_DMT) || (self.guild == GIL_SKELETON) || (self.guild == GIL_DEMON) || (self.guild == GIL_ZOMBIE) || (self.guild == GIL_GOBBO_SKELETON) || (self.guild == GIL_UNDEADORC))
			{
				return COLL_DONOTHING;
			};
		};
		if((spellType == SPL_Firestorm) && (self.guild == GIL_DMT))
		{
			return COLL_DONOTHING;
		};
	};
	if((spellType == SPL_ChargeFireball) || (spellType == SPL_OrcFireball) || (spellType == SPL_InstantFireball) || (spellType == SPL_FireMeteor) || (spellType == SPL_Firerain) || (spellType == SPL_Firebolt) || (spellType == SPL_RapidFirebolt) || (spellType == SPL_Explosion) || (spellType == SPL_Firestorm) || (spellType == SPL_Pyrokinesis) || (spellType == SPL_FIRELIGHT))
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};

		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_Deathbolt) || (spellType == SPL_Deathball))
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_GOBBO_SKELETON) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (self.guild == GIL_ZOMBIE) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild == GIL_SHADOWBEAST_SKELETON) || (self.guild == GIL_SKELETON) || (self.guild == GIL_UNDEADORC) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD) || (self.guild == GIL_SUMMONED_GOBBO_SKELETON))
		{
			return COLL_APPLYHALVEDAMAGE;
		};

		return COLL_DOEVERYTHING;
	};
	if((spellType == SPL_IceCube) || (spellType == SPL_IceWave) || (spellType == SPL_Icebolt) || (spellType == SPL_RapidIcebolt))
	{
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_Gargoyle) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf))
		{
			return COLL_DONOTHING;
		};
		if((self.guild == GIL_STONEGOLEM) || (self.guild == GIL_DEMON) || (self.guild == GIL_TROLL) || (self.guild == GIL_DRAGON))
		{
			return COLL_APPLYDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_LightningFlash)
	{
		if(C_NpcIsDown(self))
		{
			return COLL_DONOTHING;
		};
		if(C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_Fear)
	{
		if((self.guild != GIL_FIREGOLEM) && (self.guild != GIL_ICEGOLEM) && (self.guild != GIL_DRAGON) && (self.guild != GIL_DMT) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_SWAMPSHARK) && (self.guild != GIL_TROLL) && !C_NpcIsEvil(self) && (C_NpcIsGateGuard(self) == FALSE))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_Charm)
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MIL_311_Andre)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gur_8002_orun)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_504_Parlan)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_200_Hagen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_250_Garond)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_800_Lee)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_9158_varus)))
		{
			return COLL_DONOTHING;
		};
		if((self.guild < GIL_SEPERATOR_HUM) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_110_Urshak)))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_CONTROL)
	{
		if(self.guild < GIL_SEPERATOR_HUM)
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_DestroyUndead)
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(senyak_demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Capitan_Drake)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_warrior_dark_fireshpere)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_warrior_dark_darkshpere)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_warrior_dark_watershpere)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_warrior_dark_stoneshpere)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_kreol_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_kreol_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_kreol_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_kreol_04)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(undeadorcshaman_1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(undeadorcshaman_2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(undeadorcshaman_3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(undeadorcshaman_4)) || (self.guild == GIL_DEMON))
		{
			return COLL_DONOTHING;
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_LORD) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(necromacerzombie)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(necromacerdemonzombie)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(waterritualzombie_04)))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsUndead(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_BreathOfDeath)
	{
		if(!C_NpcIsUndead(self))
		{
			if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1297_stonnos)))
			{
				return COLL_DONOTHING;
			};
			if((self.guild == GIL_DRAGON) || (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(hero)))
			{
				return COLL_APPLYDOUBLEDAMAGE;
			};
			if((self.guild == GIL_DMT) || (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(hero)))
			{
				return COLL_DONOTHING;
			};
			if((self.guild == GIL_PAL) || (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(hero)))
			{
				return COLL_DONOTHING;
			};
			return COLL_APPLYHALVEDAMAGE;
		}
		else if((self.guild == GIL_DRAGON) || (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(hero)))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		}
		else
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_MassDeath)
	{
		if(!C_NpcIsUndead(self))
		{
			if(self.guild == GIL_DRAGON)
			{
				return COLL_APPLYHALVEDAMAGE;
			};
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_MasterOfDisaster)
	{
		if(!C_NpcIsDown(self) && !C_BodyStateContains(self,BS_SWIM) && !C_BodyStateContains(self,BS_DIVE) && C_NpcIsEvil(self))
		{
			return COLL_DOEVERYTHING;
		};
		if(C_NpcIsUndead(self) == TRUE)
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_Shrink)
	{
		if((self.guild == GIL_DRAGON) || (self.guild == GIL_DEMON) || (self.aivar[90] == TRUE) || (self.guild == GIL_ORC))
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsUndead(self) == TRUE)
		{
			return COLL_DONOTHING;
		};
		if(C_NpcIsDown(self) || C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
		{
			return COLL_DONOTHING;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_PalHolyBolt)
	{
		if(C_NpcIsUndead(self) == TRUE)
		{
			return COLL_APPLYDOUBLEDAMAGE;
		};
		if(C_NpcIsEvil(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	}
	else if(spellType == SPL_PalRepelEvil)
	{
		if(C_NpcIsEvil(self))
		{
			if(c_npcisraven(self) || (C_NpcIsUndead(self) == TRUE))
			{
				return COLL_APPLYDOUBLEDAMAGE;
			}
			else
			{
				return COLL_DOEVERYTHING;
			};
		};
		return COLL_DONOTHING;
	}
	else if(spellType == SPL_PalDestroyEvil)
	{
		if(c_npcisraven(self) || (C_NpcIsUndead(self) == TRUE))
		{
			return COLL_APPLYDOUBLEDAMAGE;
		}
		else if(C_NpcIsEvil(self))
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_FIRELIGHT)
	{
		if((self.guild != GIL_DRAGON) || (self.guild != GIL_TROLL) || (self.guild != GIL_FIREGOLEM) || (self.guild != GIL_ICEGOLEM) || (self.guild != GIL_SWAMPGOLEM) || (self.guild != GIL_STONEGOLEM) || (self.guild != GIL_SKELETON) || (self.guild != GIL_ZOMBIE))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_CONTROL)
	{
		if((self.guild != GIL_DRAGON) || (self.guild != GIL_TROLL) || (self.guild != GIL_FIREGOLEM) || (self.guild != GIL_ICEGOLEM) || (self.guild != GIL_SWAMPGOLEM) || (self.guild != GIL_STONEGOLEM) || (self.guild != GIL_SKELETON) || (self.guild != GIL_ZOMBIE))
		{
			return COLL_APPLYHALVEDAMAGE;
		};
		return COLL_DOEVERYTHING;
	};
	if(spellType == SPL_TELEKINESIS)
	{
		if(self.guild < GIL_SEPERATOR_HUM)
		{
			return COLL_DOEVERYTHING;
		};
		return COLL_DONOTHING;
	};
	if(spellType == SPL_DESTROYGUARDIANS)
	{
		return COLL_DOEVERYTHING;
	};
	return COLL_DOEVERYTHING;
};