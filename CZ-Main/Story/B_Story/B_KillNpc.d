func void B_Npc_DeSynchronize(var C_Npc slf, var int nCycle)
{
	//var int msec;
	//msec = Hlp_Random(5000);

	AI_Waitms(slf,nCycle);
};

func void B_ClearRuneInv(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her))
	{
		Npc_RemoveInvItems(slf,ItRu_PalLightHeal,Npc_HasItems(slf,ItRu_PalLightHeal));
		Npc_RemoveInvItems(slf,ItRu_PalMediumHeal,Npc_HasItems(slf,ItRu_PalMediumHeal));
		Npc_RemoveInvItems(slf,ItRu_PalFullHeal,Npc_HasItems(slf,ItRu_PalFullHeal));
		Npc_RemoveInvItems(slf,ItRu_PalHolyBolt,Npc_HasItems(slf,ItRu_PalHolyBolt));
		Npc_RemoveInvItems(slf,ItRu_PalRepelEvil,Npc_HasItems(slf,ItRu_PalRepelEvil));
		Npc_RemoveInvItems(slf,ItRu_PalDestroyEvil,Npc_HasItems(slf,ItRu_PalDestroyEvil));
		Npc_RemoveInvItems(slf,ItRu_PalTeleportSecret,Npc_HasItems(slf,ItRu_PalTeleportSecret));
		Npc_RemoveInvItems(slf,ItRu_Light,Npc_HasItems(slf,ItRu_PalLight));
		Npc_RemoveInvItems(slf,ItRu_PalLight,Npc_HasItems(slf,ItRu_Light));
		Npc_RemoveInvItems(slf,ItRu_FireBolt,Npc_HasItems(slf,ItRu_FireBolt));
		Npc_RemoveInvItems(slf,ItRu_Zap,Npc_HasItems(slf,ItRu_Zap));
		Npc_RemoveInvItems(slf,ItRu_LightHeal,Npc_HasItems(slf,ItRu_LightHeal));
		Npc_RemoveInvItems(slf,ItRu_SumGobSkel,Npc_HasItems(slf,ItRu_SumGobSkel));
		Npc_RemoveInvItems(slf,ItRu_InstantFireball,Npc_HasItems(slf,ItRu_InstantFireball));
		Npc_RemoveInvItems(slf,ItRu_Icebolt,Npc_HasItems(slf,ItRu_Icebolt));
		Npc_RemoveInvItems(slf,ItRu_SumWolf,Npc_HasItems(slf,ItRu_SumWolf));
		Npc_RemoveInvItems(slf,ItRu_Windfist,Npc_HasItems(slf,ItRu_Windfist));
		Npc_RemoveInvItems(slf,ItRu_Sleep,Npc_HasItems(slf,ItRu_Sleep));
		Npc_RemoveInvItems(slf,ItRu_MediumHeal,Npc_HasItems(slf,ItRu_MediumHeal));
		Npc_RemoveInvItems(slf,ItRu_LightningFlash,Npc_HasItems(slf,ItRu_LightningFlash));
		Npc_RemoveInvItems(slf,ItRu_ChargeFireball,Npc_HasItems(slf,ItRu_ChargeFireball));
		Npc_RemoveInvItems(slf,ItRu_SumSkel,Npc_HasItems(slf,ItRu_SumSkel));
		Npc_RemoveInvItems(slf,ItRu_Fear,Npc_HasItems(slf,ItRu_Fear));
		Npc_RemoveInvItems(slf,ItRu_IceCube,Npc_HasItems(slf,ItRu_IceCube));
		Npc_RemoveInvItems(slf,ItRu_ThunderBall,Npc_HasItems(slf,ItRu_ThunderBall));
		Npc_RemoveInvItems(slf,ItRu_SumGol,Npc_HasItems(slf,ItRu_SumGol));
		Npc_RemoveInvItems(slf,itru_sumshoal,Npc_HasItems(slf,itru_sumshoal));
		Npc_RemoveInvItems(slf,ItRu_HarmUndead,Npc_HasItems(slf,ItRu_HarmUndead));
		Npc_RemoveInvItems(slf,ItRu_Pyrokinesis,Npc_HasItems(slf,ItRu_Pyrokinesis));
		Npc_RemoveInvItems(slf,ItRu_Firestorm,Npc_HasItems(slf,ItRu_Firestorm));
		Npc_RemoveInvItems(slf,ItRu_IceWave,Npc_HasItems(slf,ItRu_IceWave));
		Npc_RemoveInvItems(slf,ItRu_SumDemon,Npc_HasItems(slf,ItRu_SumDemon));
		Npc_RemoveInvItems(slf,ItRu_FullHeal,Npc_HasItems(slf,ItRu_FullHeal));
		Npc_RemoveInvItems(slf,ItRu_Firerain,Npc_HasItems(slf,ItRu_Firerain));
		Npc_RemoveInvItems(slf,ItRu_BreathOfDeath,Npc_HasItems(slf,ItRu_BreathOfDeath));
		Npc_RemoveInvItems(slf,ItRu_MassDeath,Npc_HasItems(slf,ItRu_MassDeath));
		Npc_RemoveInvItems(slf,ItRu_ArmyOfDarkness,Npc_HasItems(slf,ItRu_ArmyOfDarkness));
		Npc_RemoveInvItems(slf,ItRu_Deathbolt,Npc_HasItems(slf,ItRu_Deathbolt));
		Npc_RemoveInvItems(slf,ItRu_Deathball,Npc_HasItems(slf,ItRu_Deathball));
		Npc_RemoveInvItems(slf,ItRu_Concussionbolt,Npc_HasItems(slf,ItRu_Concussionbolt));
		Npc_RemoveInvItems(slf,Fakescroll,Npc_HasItems(slf,Fakescroll));
		Npc_RemoveInvItems(slf,Fakescroll_Addon,Npc_HasItems(slf,Fakescroll_Addon));
		Npc_RemoveInvItems(slf,ItRu_Thunderstorm,Npc_HasItems(slf,ItRu_Thunderstorm));
		Npc_RemoveInvItems(slf,ItRu_Whirlwind,Npc_HasItems(slf,ItRu_Whirlwind));
		Npc_RemoveInvItems(slf,ItRu_Geyser,Npc_HasItems(slf,ItRu_Geyser));
		Npc_RemoveInvItems(slf,ItRu_Waterfist,Npc_HasItems(slf,ItRu_Waterfist));
		Npc_RemoveInvItems(slf,ItRu_Icelance,Npc_HasItems(slf,ItRu_Icelance));
		Npc_RemoveInvItems(slf,ItRu_BeliarsRage,Npc_HasItems(slf,ItRu_BeliarsRage));
		Npc_RemoveInvItems(slf,ItRu_ManaForLife,Npc_HasItems(slf,ItRu_ManaForLife));
		Npc_RemoveInvItems(slf,ItRu_GreenTentacle,Npc_HasItems(slf,ItRu_GreenTentacle));
		Npc_RemoveInvItems(slf,ItRu_Swarm,Npc_HasItems(slf,ItRu_Swarm));
		Npc_RemoveInvItems(slf,ItRu_Skull,Npc_HasItems(slf,ItRu_Skull));
		Npc_RemoveInvItems(slf,ItRu_SummonZombie,Npc_HasItems(slf,ItRu_SummonZombie));
		Npc_RemoveInvItems(slf,ItRu_SummonGuardian,Npc_HasItems(slf,ItRu_SummonGuardian));
		Npc_RemoveInvItems(slf,itru_charm,Npc_HasItems(slf,itru_charm));
		Npc_RemoveInvItems(slf,itru_teleportdagot,Npc_HasItems(slf,itru_teleportdagot));
		Npc_RemoveInvItems(slf,itru_severefetidity,Npc_HasItems(slf,itru_severefetidity));
		Npc_RemoveInvItems(slf,itru_sumshoal,Npc_HasItems(slf,itru_sumshoal));
		Npc_RemoveInvItems(slf,itru_sumfiregol,Npc_HasItems(slf,itru_sumfiregol));
		Npc_RemoveInvItems(slf,ItRu_GuruWrath,Npc_HasItems(slf,ItRu_GuruWrath));
		Npc_RemoveInvItems(slf,ItRu_FireMeteor,Npc_HasItems(slf,ItRu_FireMeteor));
		Npc_RemoveInvItems(slf,ITRU_SUMTREANT,Npc_HasItems(slf,ITRU_SUMTREANT));
		Npc_RemoveInvItems(slf,ItRu_Unlock,Npc_HasItems(slf,ItRu_Unlock));
		Npc_RemoveInvItems(slf,ItRu_RapidFirebolt,Npc_HasItems(slf,ItRu_RapidFirebolt));
		Npc_RemoveInvItems(slf,ItRu_RapidIcebolt,Npc_HasItems(slf,ItRu_RapidIcebolt));
		Npc_RemoveInvItems(slf,ItRu_Rage,Npc_HasItems(slf,ItRu_Rage));
		Npc_RemoveInvItems(slf,ItRu_Quake,Npc_HasItems(slf,ItRu_Quake));
		Npc_RemoveInvItems(slf,ItRu_MagicCage,Npc_HasItems(slf,ItRu_MagicCage));
		Npc_RemoveInvItems(slf,ItRu_Lacerate,Npc_HasItems(slf,ItRu_Lacerate));
		Npc_RemoveInvItems(slf,ItRu_Extricate,Npc_HasItems(slf,ItRu_Extricate));
		Npc_RemoveInvItems(slf,ItRu_Explosion,Npc_HasItems(slf,ItRu_Explosion));
		Npc_RemoveInvItems(slf,ItRu_Elevate,Npc_HasItems(slf,ItRu_Elevate));
		Npc_RemoveInvItems(slf,ItRu_AdanosBall,Npc_HasItems(slf,ItRu_AdanosBall));
		Npc_RemoveInvItems(slf,ItRu_Acid,Npc_HasItems(slf,ItRu_Acid));
	};
};

func int C_CheckNpcBelongsToOldCamp(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_OCMAIN) || (slf.npcType == NPCTYPE_OCAMBIENT))
	{
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_CheckNpcBelongsToCity(var C_Npc slf)
{
	if(!C_CheckNpcBelongsToOldCamp(slf) && (slf.npcType != NPCTYPE_CSP_AMBIENT))
	{
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_CheckNpcBelongsToMonastery(var C_Npc slf)
{
	if((slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_CheckNpcBelongsToFarm(var C_Npc slf)
{
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_SLD))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_CheckNpcBelongsToBL(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_BL_AMBIENT) || (slf.npcType == NPCTYPE_BL_MAIN))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_Checknpcbelongstocoast(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_XBSMAIN) || (slf.npcType == NPCTYPE_XBSAMBIENT))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_Checknpcbelongstopsicamp(var C_Npc slf)
{
	if((slf.guild == GIL_SEK) || (slf.guild == GIL_TPL) || (slf.guild == GIL_GUR))
	{
		return TRUE;
	};
	return FALSE;
};

func int B_CheckCurrentAbsolutionLevel(var C_Npc slf)
{
	if(C_CheckNpcBelongsToOldCamp(slf))
	{
		return ABSOLUTIONLEVEL_OldCamp;
	};
	if(C_CheckNpcBelongsToCity(slf))
	{
		return ABSOLUTIONLEVEL_City;
	};
	if(C_CheckNpcBelongsToMonastery(slf))
	{
		return ABSOLUTIONLEVEL_Monastery;
	};
	if(C_CheckNpcBelongsToFarm(slf))
	{
		return ABSOLUTIONLEVEL_Farm;
	};
	if(c_Checknpcbelongstocoast(slf))
	{
		return ABSOLUTIONLEVEL_COAST;
	};
	if(c_Checknpcbelongstopsicamp(slf))
	{
		return ABSOLUTIONLEVEL_PSICAMP;
	};
	return 0;
};

func int B_CheckPlayerCrime(var C_Npc slf)
{
	if(slf.aivar[AIV_NpcSawPlayerCommit] <= CRIME_ATTACK)
	{
		if(slf.aivar[AIV_NpcSawPlayerCommitDay] < (Wld_GetDay() - 2))
		{
			return CRIME_NONE;
		};
	};
	if(slf.aivar[AIV_CrimeAbsolutionLevel] < B_CheckCurrentAbsolutionLevel(slf))
	{
		return CRIME_NONE;
	};
	return slf.aivar[AIV_NpcSawPlayerCommit];
};

func void B_RuneProcCheck(var C_Npc slf,var C_Npc oth)
{
	var int curproc;
	var int curres;
	var int curres2;
	var int randwait;
	var int FlagCurRes;

	if(Npc_IsPlayer(oth) && (Npc_IsInFightMode(oth,FMODE_MAGIC) == TRUE) && (slf.flags != NPC_FLAG_IMMORTAL) && (slf.flags != NPC_FLAG_XARADRIM) && (slf.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(XranFreg)))
	{
		if((Npc_IsDead(slf) == FALSE) && ((Npc_GetActiveSpell(oth) == SPL_Firebolt) || (Npc_GetActiveSpell(oth) == SPL_RapidFirebolt)))
		{
			if((slf.protection[PROT_FIRE] >= 10) && (slf.vars[9] < 5) && (slf.protection[PROT_FIRE] != IMMUNE))
			{
				if(slf.vars[10] == FALSE)
				{
					slf.vars[10] = slf.protection[PROT_FIRE];
				};

				slf.vars[9] += 1;
				curproc = 10 * (10 - slf.vars[9]);
				curres = (slf.vars[10] * curproc) / 100;
				slf.protection[PROT_FIRE] = curres;
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_InstantFireball) && (Npc_IsDead(slf) == FALSE))
		{
			if((slf.protection[PROT_FIRE] >= 10) && (slf.vars[9] < 5) && (slf.protection[PROT_FIRE] != IMMUNE))
			{
				if(slf.vars[10] == FALSE)
				{
					slf.vars[10] = slf.protection[PROT_FIRE];
				};

				slf.vars[9] += 2;
				curproc = 10 * (10 - slf.vars[9]);
				curres = (slf.vars[10] * curproc) / 100;
				slf.protection[PROT_FIRE] = curres;
			};
		}
		else if((Npc_IsDead(slf) == FALSE) && ((Npc_GetActiveSpell(oth) == SPL_Firestorm) || (Npc_GetActiveSpell(oth) == SPL_Explosion)))
		{
			if((slf.protection[PROT_FIRE] >= 10) && (slf.vars[9] < 5) && (slf.protection[PROT_FIRE] != IMMUNE))
			{
				if(slf.vars[10] == FALSE)
				{
					slf.vars[10] = slf.protection[PROT_FIRE];
				};

				slf.vars[9] += 3;
				curproc = 10 * (10 - slf.vars[9]);
				curres = (slf.vars[10] * curproc) / 100;
				slf.protection[PROT_FIRE] = curres;
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_Firerain) && (Npc_IsDead(slf) == FALSE))
		{
			if((slf.protection[PROT_FIRE] >= 10) && (slf.vars[9] < 5) && (slf.protection[PROT_FIRE] != IMMUNE))
			{
				if(slf.vars[10] == FALSE)
				{
					slf.vars[10] = slf.protection[PROT_FIRE];
				};

				slf.vars[9] += 5;
				curproc = 10 * (10 - slf.vars[9]);
				curres = (slf.vars[10] * curproc) / 100;
				slf.protection[PROT_FIRE] = curres;
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_FireMeteor) && (Npc_IsDead(slf) == FALSE))
		{
			randwait = Hlp_Random(100);

			if((slf.aivar[94] == FALSE) && (randwait <= 25) && (slf.vars[13] == FALSE) && (slf.vars[14] == FALSE) && (slf.vars[15] == FALSE) && (slf.protection[PROT_FIRE] != IMMUNE) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ogre)))
			{
				slf.vars[15] = TRUE;
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_Zap) && (Npc_IsDead(slf) == FALSE))
		{
			if((slf.protection[PROT_MAGIC] >= 10) && (slf.vars[11] < 5) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[12] == FALSE)
				{
					slf.vars[12] = slf.protection[PROT_MAGIC];
				};

				slf.vars[11] += 1;
				curproc = 10 * (10 - slf.vars[11]);
				curres = (slf.vars[12] * curproc) / 100;
				slf.protection[PROT_MAGIC] = curres;
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_LightningFlash) && (Npc_IsDead(slf) == FALSE))
		{
			if((slf.protection[PROT_MAGIC] >= 10) && (slf.vars[11] < 5) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[12] == FALSE)
				{
					slf.vars[12] = slf.protection[PROT_MAGIC];
				};

				slf.vars[11] += 2;
				curproc = 10 * (10 - slf.vars[11]);
				curres = (slf.vars[12] * curproc) / 100;
				slf.protection[PROT_MAGIC] = curres;
			};
		}
		else if((Npc_IsDead(slf) == FALSE) && ((Npc_GetActiveSpell(oth) == SPL_Icebolt) || (Npc_GetActiveSpell(oth) == SPL_RapidIcebolt)))
		{
			randwait = Hlp_Random(100);

			if((slf.aivar[94] == FALSE) && (randwait <= 15) && (slf.vars[13] == FALSE) && (slf.vars[14] == FALSE) && (slf.vars[15] == FALSE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if((slf.guild != GIL_DRAGON) && (slf.guild != GIL_DEMON) && (slf.guild != GIL_TROLL))
				{
					slf.vars[13] = TRUE;
				};
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_Icelance) && (Npc_IsDead(slf) == FALSE))
		{
			randwait = Hlp_Random(100);

			if((slf.protection[PROT_MAGIC] != IMMUNE) && (randwait <= 15) && (oth.attribute[ATR_MANA] < oth.attribute[ATR_MANA_MAX]))
			{
				oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA] + ((SPL_DAMAGE_Icebolt * 5) / 100);

				if(oth.attribute[ATR_MANA] > oth.attribute[ATR_MANA_MAX])
				{
					oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
				};
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_Thunderstorm) && (Npc_IsDead(slf) == FALSE))
		{
			randwait = Hlp_Random(100);

			if((slf.aivar[94] == FALSE) && (randwait <= 20) && (slf.vars[13] == FALSE) && (slf.vars[14] == FALSE) && (slf.vars[15] == FALSE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if((slf.guild != GIL_DRAGON) && (slf.guild != GIL_DEMON) && (slf.guild != GIL_TROLL))
				{
					slf.vars[13] = TRUE;
				};
			};
		}
		else if(Npc_GetActiveSpell(oth) == SPL_Waterfist)
		{
			randwait = Hlp_Random(100);

			if((slf.protection[PROT_MAGIC] != IMMUNE) && (randwait <= 20) && (oth.attribute[ATR_HITPOINTS] < oth.attribute[ATR_HITPOINTS_MAX]))
			{
				oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS] + ((SPL_DAMAGE_Waterfist * 5) / 100);

				if(oth.attribute[ATR_HITPOINTS] > oth.attribute[ATR_HITPOINTS_MAX])
				{
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
				};
			};
		}
		else if(Npc_GetActiveSpell(oth) == SPL_Geyser)
		{
			randwait = Hlp_Random(100);

			if((slf.protection[PROT_MAGIC] != IMMUNE) && (randwait <= 25) && (oth.attribute[ATR_MANA] < oth.attribute[ATR_MANA_MAX]))
			{
				oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA] + ((SPL_DAMAGE_Geyser * 5) / 100);

				if(oth.attribute[ATR_MANA] > oth.attribute[ATR_MANA_MAX])
				{
					oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
				};
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_BERZERK) && (Npc_IsDead(slf) == FALSE))
		{
			randwait = Hlp_Random(100);

			if((slf.aivar[94] == FALSE) && (randwait <= 20) && (slf.vars[13] == FALSE) && (slf.vars[14] == FALSE) && (slf.vars[15] == FALSE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if((slf.guild != GIL_DRAGON) && (slf.guild != GIL_TROLL) && (slf.guild != GIL_DEMON) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ogre)))
				{
					slf.vars[14] = TRUE;
				};
			};
		}
		else if(Npc_GetActiveSpell(oth) == SPL_Whirlwind)
		{
			randwait = Hlp_Random(100);

			if((slf.protection[PROT_MAGIC] != IMMUNE) && (randwait <= 30))
			{
				oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA] + ((SPL_Whirlwind_DAMAGE * 15) / 100);

				if(oth.attribute[ATR_MANA] > oth.attribute[ATR_MANA_MAX])
				{
					oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
				};
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_Deathbolt) && (Npc_IsDead(slf) == FALSE))
		{
			if((slf.protection[PROT_EDGE] >= 10) && (slf.vars[16] < 5) && (slf.protection[PROT_EDGE] != IMMUNE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[17] == FALSE)
				{
					slf.vars[17] = slf.protection[PROT_EDGE];
				};

				slf.vars[16] += 1;
				curproc = 10 * (10 - slf.vars[16]);
				curres = (slf.vars[17] * curproc) / 100;
				slf.protection[PROT_EDGE] = curres;
			};
			if((slf.protection[PROT_BLUNT] >= 10) && (slf.vars[18] < 5) && (slf.protection[PROT_BLUNT] != IMMUNE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[19] == FALSE)
				{
					slf.vars[19] = slf.protection[PROT_BLUNT];
				};

				slf.vars[18] += 1;
				curproc = 10 * (10 - slf.vars[18]);
				curres = (slf.vars[19] * curproc) / 100;
				slf.protection[PROT_BLUNT] = curres;
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_Lacerate) && (Npc_IsDead(slf) == FALSE))
		{
			if((slf.protection[PROT_EDGE] >= 10) && (slf.vars[16] < 5) && (slf.protection[PROT_EDGE] != IMMUNE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[17] == FALSE)
				{
					slf.vars[17] = slf.protection[PROT_EDGE];
				};

				slf.vars[16] += 1;
				curproc = 10 * (10 - slf.vars[16]);
				curres = (slf.vars[17] * curproc) / 100;
				slf.protection[PROT_EDGE] = curres;
			};
			if((slf.protection[PROT_BLUNT] >= 10) && (slf.vars[18] < 5) && (slf.protection[PROT_BLUNT] != IMMUNE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[19] == FALSE)
				{
					slf.vars[19] = slf.protection[PROT_BLUNT];
				};

				slf.vars[18] += 1;
				curproc = 10 * (10 - slf.vars[18]);
				curres = (slf.vars[19] * curproc) / 100;
				slf.protection[PROT_BLUNT] = curres;
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_Deathball) && (Npc_IsDead(slf) == FALSE))
		{
			if((slf.protection[PROT_EDGE] >= 10) && (slf.vars[16] < 5) && (slf.protection[PROT_EDGE] != IMMUNE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[17] == FALSE)
				{
					slf.vars[17] = slf.protection[PROT_EDGE];
				};

				slf.vars[16] += 2;
				curproc = 10 * (10 - slf.vars[16]);
				curres = (slf.vars[17] * curproc) / 100;
				slf.protection[PROT_EDGE] = curres;
			};
			if((slf.protection[PROT_BLUNT] >= 10) && (slf.vars[18] < 5) && (slf.protection[PROT_BLUNT] != IMMUNE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[19] == FALSE)
				{
					slf.vars[19] = slf.protection[PROT_BLUNT];
				};

				slf.vars[18] += 2;
				curproc = 10 * (10 - slf.vars[18]);
				curres = (slf.vars[19] * curproc) / 100;
				slf.protection[PROT_BLUNT] = curres;
			};
		}
		else if((Npc_GetActiveSpell(oth) == SPL_Skull) && (Npc_IsDead(slf) == FALSE))
		{
			if((slf.protection[PROT_EDGE] >= 10) && (slf.vars[16] < 5) && (slf.protection[PROT_EDGE] != IMMUNE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[17] == FALSE)
				{
					slf.vars[17] = slf.protection[PROT_EDGE];
				};

				slf.vars[16] += 5;
				curproc = 10 * (10 - slf.vars[16]);
				curres = (slf.vars[17] * curproc) / 100;
				slf.protection[PROT_EDGE] = curres;
			};
			if((slf.protection[PROT_BLUNT] >= 10) && (slf.vars[18] < 5) && (slf.protection[PROT_BLUNT] != IMMUNE) && (slf.protection[PROT_MAGIC] != IMMUNE))
			{
				if(slf.vars[19] == FALSE)
				{
					slf.vars[19] = slf.protection[PROT_BLUNT];
				};

				slf.vars[18] += 5;
				curproc = 10 * (10 - slf.vars[18]);
				curres = (slf.vars[19] * curproc) / 100;
				slf.protection[PROT_BLUNT] = curres;
			};
		}
		else if(Npc_GetActiveSpell(oth) == SPL_MassDeath)
		{
			randwait = Hlp_Random(100);

			if((slf.protection[PROT_MAGIC] != IMMUNE) && (randwait <= 30) && (oth.attribute[ATR_HITPOINTS] < oth.attribute[ATR_HITPOINTS_MAX]))
			{
				oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS] + ((SPL_Damage_MassDeath * 10) / 100);

				if(oth.attribute[ATR_HITPOINTS] > oth.attribute[ATR_HITPOINTS_MAX])
				{
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
				};
			};
		};
	};
};

func void B_BeastDownDef(var C_Npc Beast)
{
	if((Beast.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (Gobbo_Green_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER) && (Scavenger_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER_DEMON) && (Scavenger_Demon_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_WOLF) && (Wolf_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SNAPPER) && (Snapper_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) && (ShadowBeast_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_ALLIGATOR) && (Alligator_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_BLATTCRAWLER) && (Blattcrawler_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_BLOODHOUND) && (Bloodhound_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (Gobbo_Black_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF) && (Icewolf_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_KEILER) && (Keiler_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE) && (Zombie_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_ORCBITER) && (OrcBiter_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_RAZOR) && (Razor_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_GHOST) && (Ghost_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_STONEGUARDIAN) && (Stoneguardian_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_STONEPUMA) && (StonePuma_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE) && (SwampDrone_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM) && (Swampgolem_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SWAMPRAT) && (Swamprat_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY) && (BloodFly_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_DEMON) && (Demon_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD) && (DemonLord_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_DRACONIAN) && (Draconian_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) && (DragonSnapper_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM) && (FireGolem_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) && (FireWaran_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_GIANT_BUG) && (Giant_Bug_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_GOBBO_MAGE) && (Gobbo_Shaman_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_HARPY) && (Harpie_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM) && (IceGolem_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_LURKER) && (Lurker_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER) && (Minecrawler_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SPIDER) && (Spider_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR) && (MinecrawlerWarrior_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_OREBUG) && (OreBug_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_MOLERAT) && (Molerat_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST_SKELETON) && (Shadowbeast_Skeleton_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) && (Skeleton_Mage_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM) && (StoneGolem_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK) && (Swampshark_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_DESERTSHARK) && (Desertshark_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_TROLL) && (Troll_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_OGRE) && (Ogre_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK) && (Troll_Black_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_WARG) && (Warg_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SKELETON) && (Skeleton_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (OrcWarrior_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SKELETON_LORD) && (Skeleton_Lord_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST) && (Skeleton_Priest_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_DARKGUARD) && (DarkGuard_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_WARAN) && (Waran_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (OrcElite_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (OrcShaman_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCWARRIOR) && (UndeadOrcWarrior_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCSHAMAN) && (UndeadOrcShaman_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;
	}
	else if((Beast.aivar[AIV_MM_REAL_ID] == ID_SANDGOLEM) && (SandGolem_B2 == TRUE))
	{
		if((Beast.protection[PROT_EDGE] >= 10) && (Beast.protection[PROT_EDGE] <= 500))
		{
			Beast.protection[PROT_EDGE] = Beast.protection[PROT_EDGE] - (Beast.protection[PROT_EDGE] / 10);
		};
		if((Beast.protection[PROT_BLUNT] >= 10) && (Beast.protection[PROT_BLUNT] <= 500))
		{
			Beast.protection[PROT_BLUNT] = Beast.protection[PROT_BLUNT] - (Beast.protection[PROT_BLUNT] / 10);
		};
		if((Beast.protection[PROT_POINT] >= 10) && (Beast.protection[PROT_POINT] <= 500))
		{
			Beast.protection[PROT_POINT] = Beast.protection[PROT_POINT] - (Beast.protection[PROT_POINT] / 10);
		};
		if((Beast.protection[PROT_FIRE] >= 10) && (Beast.protection[PROT_FIRE] <= 500))
		{
			Beast.protection[PROT_FIRE] = Beast.protection[PROT_FIRE] - (Beast.protection[PROT_FIRE] / 10);
		};
		if((Beast.protection[PROT_MAGIC] >= 10) && (Beast.protection[PROT_MAGIC] <= 500))
		{
			Beast.protection[PROT_MAGIC] = Beast.protection[PROT_MAGIC] - (Beast.protection[PROT_MAGIC] / 10);
		};
		if((Beast.protection[PROT_FLY] >= 10) && (Beast.protection[PROT_FLY] <= 500))
		{
			Beast.protection[PROT_FLY] = Beast.protection[PROT_FLY] - (Beast.protection[PROT_FLY] / 10);
		};

		Beast.vars[7] = TRUE;	
	};
};

func void B_ClearPercep(var C_Npc slf)
{
	Npc_PercDisable(slf,PERC_ASSESSPLAYER);
	Npc_PercDisable(slf,PERC_ASSESSENEMY);
	Npc_PercDisable(slf,PERC_ASSESSBODY);
	Npc_PercDisable(slf,PERC_ASSESSMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSMURDER);
	Npc_PercDisable(slf,PERC_ASSESSTHEFT);
	Npc_PercDisable(slf,PERC_ASSESSUSEMOB);
	Npc_PercDisable(slf,PERC_ASSESSENTERROOM);
	Npc_PercDisable(slf,PERC_ASSESSTHREAT);
	Npc_PercDisable(slf,PERC_DRAWWEAPON);
	Npc_PercDisable(slf,PERC_ASSESSFIGHTSOUND);
	Npc_PercDisable(slf,PERC_ASSESSQUIETSOUND);
	Npc_PercDisable(slf,PERC_ASSESSWARN);
	Npc_PercDisable(slf,PERC_ASSESSTALK);
	Npc_PercDisable(slf,PERC_MOVEMOB);
	Npc_PercDisable(slf,PERC_ASSESSOTHERSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSSTOPMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSSURPRISE);
};

func void b_givebonusforelitemonsterhurt(var int bunusho6)
{
	var string concattextbonus;

	hero.lp = hero.lp + bunusho6;
	concattextbonus = ConcatStrings(PRINT_BONUSLP_2,IntToString(bunusho6));
	concattextbonus = ConcatStrings(concattextbonus,PRINT_BONUSLP_8);
	AI_Print(PRINT_BONUSLP_1);
	AI_Print(concattextbonus);
	Snd_Play("CS_BOSSKILL");
};

func int C_NpcIsUndead_New(var C_Npc slf)
{
	if((slf.guild == GIL_GOBBO_SKELETON) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZOMBIE_OM3)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZOMBIE_OM4)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZOMBIE_OM5)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_02)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton_Bow)) || (slf.guild == GIL_SKELETON) || (slf.guild == GIL_SKELETON_MAGE) || (slf.guild == GIL_ZOMBIE) || (slf.guild == GIL_SHADOWBEAST_SKELETON) || (slf.guild == GIL_UNDEADORC) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD) || (slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ghost_senyak_demon)) || (slf.guild == GIL_SUMMONED_GOBBO_SKELETON) || (slf.guild == GIL_SUMMONED_SKELETON))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_MagicHurtNpc(var C_Npc slf,var C_Npc oth,var int Damage)
{
	var string concatText;

	if((Npc_IsPlayer(slf) == TRUE) && (oth.flags != NPC_FLAG_IMMORTAL) && (oth.flags != NPC_FLAG_XARADRIM) && (oth.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(XranFreg)))
	{
		if(oth.attribute[ATR_HITPOINTS] > Damage)
		{
			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-Damage);

			if(Menu_ReadInt("AST","bShowDamage") == TRUE)
			{
				concatText = ConcatStrings("Způsobil jsi ",IntToString(Damage));
				concatText = ConcatStrings(concatText," bodů poškození");
				AI_PrintClr(concatText,83,152,48);
			};
		}
		else
		{
			oth.flags = FALSE;

			if(Npc_IsInFightMode(slf,FMODE_FAR) == TRUE)
			{
				oth.protection[PROT_POINT] = 1;
			}
			else
			{
				Npc_ChangeAttributeExtra(oth,ATR_HITPOINTS,-Damage);
			};
		};
	};
};

func void B_MagicHurtMe(var C_Npc slf,var int Damage)
{
	var string concatText;

	if(Npc_IsPlayer(slf) == TRUE)
	{
		Npc_ChangeAttribute(slf,ATR_HITPOINTS,-Damage);

		if(Menu_ReadInt("AST","bShowDamage") == TRUE)
		{
			concatText = ConcatStrings("Utrpěl jsi ",IntToString(Damage));
			concatText = ConcatStrings(concatText," bodů poškození");
			AI_PrintClr(concatText,177,58,17);
		};
	};
};

func void B_MagicHurtNpc_Immortal(var C_Npc slf,var C_Npc oth,var int damage)
{
	var string concatText;

	if(Npc_IsPlayer(slf) == TRUE)
	{
		if(oth.attribute[ATR_HITPOINTS] > Damage)
		{
			oth.flags = FALSE;
			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-Damage);
			oth.flags = TRUE;
		}
		else
		{
			oth.flags = FALSE;
			Npc_ChangeAttributeExtra(oth,ATR_HITPOINTS,-Damage);
		};
	};
};

func void B_KillNpc(var int npcInstance)
{
	var C_Npc npc;

	npc = Hlp_GetNpc(npcInstance);

	if(Hlp_IsValidNpc(npc))
	{
		npc.flags = 0;
		npc.aivar[93] = FALSE;

		if(npc.aivar[AIV_StoryBandit] == FALSE)
		{
			npc.aivar[AIV_StoryBandit] = TRUE;
		};
		if(npc.guild == GIL_ORC)
		{
			B_GiveDeathInv(npc);
		}
		else if(npc.guild == GIL_DRAGON)
		{
			B_GiveDeathInv(npc);
		}
		else if(npc.guild == GIL_ZOMBIE)
		{
			B_GiveDeathInv(npc);
		};

		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

func void B_KillNpc_Fire(var int npcInstance)
{
	var C_Npc npc;

	npc = Hlp_GetNpc(npcInstance);

	if(Hlp_IsValidNpc(npc))
	{
		npc.flags = 0;
		npc.aivar[93] = FALSE;

		if(npc.aivar[AIV_StoryBandit] == FALSE)
		{
			npc.aivar[AIV_StoryBandit] = TRUE;
		};

		B_ClearNpcInventory(npc);
		Wld_PlayEffect("spellFX_BELIARSRAGE",npc,npc,0,0,0,FALSE);
		Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

func void B_KillNpc_Force(var int npcInstance)
{
	var C_Npc npc;

	npc = Hlp_GetNpc(npcInstance);

	if(Hlp_IsValidNpc(npc))
	{
		npc.flags = 0;
		npc.aivar[93] = FALSE;

		if(npc.aivar[AIV_StoryBandit] == FALSE)
		{
			npc.aivar[AIV_StoryBandit] = TRUE;
		};

		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

func void b_changeguild(var int npcInstance,var int npcguild)
{
	var C_Npc npc;

	npc = Hlp_GetNpc(npcInstance);

	if(Hlp_IsValidNpc(npc))
	{
		npc.guild = npcguild;
		Npc_SetTrueGuild(npc,npcguild);
	};
};

func void b_changehp(var C_Npc npc)
{
	npc.attribute[ATR_HITPOINTS] = 50;
};

func void b_changeoverride(var C_Npc npc)
{
	if(Hlp_IsValidNpc(npc))
	{
		if(npc.aivar[AIV_EnemyOverride] == TRUE)
		{
			npc.aivar[AIV_EnemyOverride] = FALSE;
		}
		else
		{
			npc.aivar[AIV_EnemyOverride] = TRUE;
		};
	};
};

func void b_changeoverridefalse(var C_Npc npc)
{
	if(Hlp_IsValidNpc(npc))
	{
		npc.aivar[AIV_EnemyOverride] = FALSE;
	};
};

func void b_changestatustocandead(var C_Npc npc)
{
	if(Hlp_IsValidNpc(npc))
	{
		if(npc.aivar[93] == TRUE)
		{
			npc.aivar[93] = FALSE;
		};
	};
};

func void b_killnpc_now(var int npcInstance)
{
	var C_Npc npc;

	npc = Hlp_GetNpc(npcInstance);

	if(Hlp_IsValidNpc(npc))
	{
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

func void b_transferback(var C_Npc npc)
{
	PLAYERISTRANSFERDONE = TRUE;
	Wld_PlayEffect("spellFX_Innoseye",npc,npc,0,0,0,FALSE);

	if(LowHealth == FALSE)
	{
		if(HelmIsUp == TRUE)
		{
			if(TempHelmModel == FALSE)
			{
				if(HeroBoldHead == TRUE)
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					};
				}
				else
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_X_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_X_Player,0,NO_ARMOR);
					};
				};
			}
			else
			{
				if(HeroBoldHead == TRUE)
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					};
				}
				else
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
					};			
				};
			};
		}
		else
		{
			if(HeroBoldHead == TRUE)
			{
				if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
				};
			}
			else
			{
				if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_XG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_X_Player,0,NO_ARMOR);
				};
			};
		};
	}
	else
	{
		if(HelmIsUp == TRUE)
		{
			if(TempHelmModel == FALSE)
			{
				if(HeroBoldHead == TRUE)
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					};
				}
				else
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
					};
				};
			}
			else
			{
				if(HeroBoldHead == TRUE)
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
					};
				}
				else
				{
					if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
					}
					else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
					{
						Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
					};
				};
			};
		}
		else
		{
			if(HeroBoldHead == TRUE)
			{
				if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
				};
			}
			else
			{
				if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
				}
				else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
				{
					Mdl_SetVisualBody(npc,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
				};
			};
		};
	};

	AI_UnequipArmor(npc);
	Npc_RemoveInvItems(npc,itar_bau_l_trans,Npc_HasItems(npc,itar_bau_l_trans));
	AI_EquipBestArmor(npc);
	AI_Print("Magická iluze je zničena!");
};

func void B_CheckDots(var C_Npc slf)
{
	var int TempSwarmDamage;

	if(slf.aivar[AIV_SwarmStateTime] > 0)
	{
		if(slf.aivar[AIV_SwarmStateTime] == 1)
		{
			Wld_PlayEffect("SPELLFX_SUCKENERGY_BLOODFLY",slf,slf,0,0,0,FALSE);
		};
		if(slf.attribute[ATR_HITPOINTS] > SPL_Swarm_Damage)
		{
			B_MagicHurtNpc(hero,slf,SPL_Swarm_Damage);	

			if(slf.guild < GIL_SEPERATOR_HUM)
			{
				AI_PlayAni(slf,"T_STAND_2_SWARM_VICTIM");
			};
		}
		else
		{
			if(slf.aivar[90] == FALSE)
			{
				B_MagicHurtNpc(hero,slf,SPL_Swarm_Damage);
			}
			else
			{
				if(slf.attribute[ATR_HITPOINTS] > 1)
				{
					TempSwarmDamage = slf.attribute[ATR_HITPOINTS] - 1;
					B_MagicHurtNpc(hero,slf,TempSwarmDamage);
				};

				slf.protection[PROT_BLUNT] = TRUE;
				slf.protection[PROT_EDGE] = TRUE;
				slf.protection[PROT_POINT] = TRUE;
				slf.protection[PROT_FIRE] = TRUE;
				slf.protection[PROT_FLY] = TRUE;
				slf.protection[PROT_MAGIC] = TRUE;
				slf.flags = FALSE;
			};
		};
		if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + SPL_Swarm_Damage;

			if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			};
		};

		slf.aivar[AIV_SwarmStateTime] += 1;

		if(slf.aivar[AIV_SwarmStateTime] >= 5)
		{
			slf.aivar[AIV_SwarmStateTime] = FALSE;
		};
	};
};

func void B_CheckHealth_Fight(var C_Npc npc)
{
	var int TempDamElite;
	var int randypfxelite;
	var int DamInnos;
	var int KarmaInnos;
	var int DamBeliar;
	var int DamAdanos;
	var int TempFireLightDamage;

	if(Npc_GetDistToNpc(npc,hero) <= 3000)
	{
		if(npc.aivar[AIV_MM_RoamEnd] == TRUE)
		{
			npc.aivar[AIV_MM_RoamEnd] = FALSE;
			Mdl_RemoveOverlayMds(npc,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(npc,"BIP01 L HAND");
			Npc_RemoveInvItems(npc,ItLsFireTorch,Npc_HasItems(npc,ItLsFireTorch));
		};
		if((FireShieldIsUp == TRUE) && (Npc_GetDistToNpc(npc,hero) <= 500) && (Npc_GetGuildAttitude(npc,hero) == ATT_HOSTILE) && (npc.flags != NPC_FLAG_IMMORTAL) && (npc.flags != NPC_FLAG_XARADRIM) && (npc.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(npc) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(npc) != Hlp_GetInstanceID(XranFreg)))
		{
			if(npc.aivar[AIV_SuckEnergyStateTime] == FALSE)
			{
				if(npc.attribute[ATR_HITPOINTS] > SPL_Damage_FireLight)
				{
					B_MagicHurtNpc(hero,npc,SPL_Damage_FireLight);
					Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);		
				}
				else
				{
					if(npc.aivar[90] == FALSE)
					{
						B_MagicHurtNpc(hero,npc,SPL_Damage_FireLight);
						Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);		
					}
					else
					{
						if(npc.attribute[ATR_HITPOINTS] > 1)
						{
							TempFireLightDamage = npc.attribute[ATR_HITPOINTS] - 1;
							B_MagicHurtNpc(hero,npc,TempFireLightDamage);
							Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);		
						};
	
						npc.protection[PROT_BLUNT] = TRUE;
						npc.protection[PROT_EDGE] = TRUE;
						npc.protection[PROT_POINT] = TRUE;
						npc.protection[PROT_FIRE] = TRUE;
						npc.protection[PROT_FLY] = TRUE;
						npc.protection[PROT_MAGIC] = TRUE;
						npc.flags = FALSE;
					};
				};

				npc.aivar[AIV_SuckEnergyStateTime] = TRUE;
			}
			else
			{
				npc.aivar[AIV_SuckEnergyStateTime] += 1;
	
				if(npc.aivar[AIV_SuckEnergyStateTime] >= 60)
				{
					npc.aivar[AIV_SuckEnergyStateTime] = FALSE;
				};
			};
		};
		if(npc.vars[13] == TRUE)
		{
			Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",npc,npc,0,0,0,FALSE);
			AI_Wait(npc,3);
			npc.vars[13] = FALSE;
		};
		if(npc.vars[14] == TRUE)
		{
			Wld_PlayEffect("SPELLFX_SLEEP_TARGET",npc,npc,0,0,0,FALSE);
			AI_PlayAni(npc,"T_STAND_2_FREEZE_VICTIM");
			AI_Wait(npc,5);
			npc.vars[14] = FALSE;
		};
		if(npc.vars[15] == TRUE)
		{
			Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);
			AI_PlayAni(npc,"T_STAND_2_FREEZE_VICTIM");
			AI_Wait(npc,3);
			npc.vars[15] = FALSE;
		};

		B_CheckDots(npc);

		if(npc.aivar[AIV_SummonTime] == TRUE)
		{
			npc.aivar[AIV_SummonTime] = FALSE;
			Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if((Npc_GetDistToNpc(npc,hero) > 3000) && (npc.aivar[AIV_MM_EatGroundStart] == TRUE))
	{
		npc.aivar[AIV_MM_EatGroundStart] = FALSE;
	};
};

func void B_CheckHealth(var C_Npc npc)
{
	var int TempDamElite;
	var int randypfxelite;
	var int DamInnos;
	var int KarmaInnos;
	var int DamBeliar;
	var int DamAdanos;
	var int TempFireLightDamage;

	if((Npc_GetDistToNpc(npc,hero) <= 600) && (Npc_KnowsInfo(npc,1) == FALSE) && (Npc_IsInState(npc,ZS_Guard_Passage) == FALSE))
	{
		if(Wld_DetectItem(npc,ITEM_KAT_NONE) == TRUE)
		{
			if(Hlp_IsValidItem(item) && (Hlp_IsItem(item,ItMi_Gold) == TRUE))
			{
				if(Npc_GetDistToItem(npc,item) <= 600)
				{
					AI_SetWalkMode(npc,NPC_RUN);
					AI_TakeItem(npc,item);
					B_Say(npc,npc,"$ITOOKYOURGOLD");
				};
			};
		};
	};
	if((Npc_GetDistToNpc(npc,hero) <= 3000) && (npc.aivar[AIV_MM_EatGroundStart] == FALSE))
	{
		if(npc.vars[6] == TRUE)
		{
			npc.vars[6] = FALSE;
		};

		nCycleChar += 250;
		B_Npc_DeSynchronize(npc,nCycleChar);

		if(nCycleChar >= 3000)
		{
			nCycleChar = FALSE;
		};

		npc.aivar[AIV_MM_EatGroundStart] == TRUE;

		if(Menu_ReadInt("AST","bScaleStr") == TRUE)
		{
			if(npc.aivar[AIV_MM_RoamStart] == FALSE)
			{
				if(npc.attribute[ATR_STRENGTH] >= 200)
				{
					Mdl_SetModelScale(npc,1.1,1,1.1);
				}
				else if(npc.attribute[ATR_STRENGTH] >= 100)
				{
					Mdl_SetModelScale(npc,1,1,1.1);
				};

				npc.aivar[AIV_MM_RoamStart] = TRUE;
			};
		}
		else
		{
			if(npc.aivar[AIV_MM_RoamStart] == TRUE)
			{
				Mdl_SetModelScale(npc,1,1,1);
				npc.aivar[AIV_MM_RoamStart] = FALSE;
			};
		};
		if((npc.aivar[AIV_MM_RoamEnd] == TRUE) && (Wld_IsTime(21,0,4,0) == FALSE))
		{
			npc.aivar[AIV_MM_RoamEnd] = FALSE;
			Mdl_RemoveOverlayMds(npc,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(npc,"BIP01 L HAND");
			Npc_RemoveInvItems(npc,ItLsFireTorch,Npc_HasItems(npc,ItLsFireTorch));
		};
		if(Hlp_StrCmp(Npc_GetNearestWP(npc),npc.spawnPoint) == FALSE)
		{
			if(!Npc_IsInState(npc,ZS_Attack) && !Npc_IsInState(npc,ZS_Unconscious))
			{
				npc.spawnPoint = Npc_GetNearestWP(npc);
			};
		};
		if((npc.aivar[AIV_ToughGuy] == FALSE) && ((npc.guild == GIL_SLD) && (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(VLK_459_Buerger)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(VLK_986_VIPER)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(VLK_478_Buergerin)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(VLK_988_GRAVO))))
		{
			npc.aivar[AIV_ToughGuy] = TRUE;
		};
		if((B_CheckPlayerCrime(npc) == CRIME_NONE) && (Npc_GetAttitude(npc,hero) == ATT_ANGRY) && (Npc_IsInFightMode(npc,FMODE_NONE) == TRUE))
		{
			Npc_SetAttitude(npc,ATT_NEUTRAL);
			Npc_SetTempAttitude(npc,ATT_NEUTRAL);
			npc.mission[4] = 2;
		};
		if((Npc_GetGuildAttitude(npc,hero) != ATT_HOSTILE) && (Npc_GetAttitude(npc,hero) != ATT_HOSTILE) && (npc.mission[4] != 2) && ((npc.guild > GIL_SEPERATOR_HUM) || (npc.guild == GIL_KDM)))
		{
			Npc_SetAttitude(npc,ATT_NEUTRAL);
			Npc_SetTempAttitude(npc,ATT_NEUTRAL);
			npc.mission[4] = 2;
		};
		if((B_CheckPlayerCrime(npc) == CRIME_NONE) && (Npc_GetGuildAttitude(npc,hero) != ATT_HOSTILE) && (Npc_GetAttitude(npc,hero) != ATT_HOSTILE) && (npc.mission[4] == 0) && (npc.guild <= GIL_SEPERATOR_HUM))
		{
			Npc_SetAttitude(npc,ATT_NEUTRAL);
			Npc_SetTempAttitude(npc,ATT_NEUTRAL);
			npc.mission[4] = 2;
		};
		if((npc.aivar[AIV_MM_SleepStart] == TRUE) && (Npc_GetDistToWP(npc,npc.wp) <= 150))
		{
			Mdl_RemoveOverlayMds(npc,"Humans_Woundz.mds");
			Mdl_RemoveOverlayMds(npc,"PRE_START.MDS");
			npc.aivar[AIV_MM_SleepStart] = FALSE;
		};
		if(npc.vars[13] == TRUE)
		{
			Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",npc,npc,0,0,0,FALSE);
			AI_Wait(npc,3);
			npc.vars[13] = FALSE;
		};
		if(npc.vars[14] == TRUE)
		{
			Wld_PlayEffect("SPELLFX_SLEEP_TARGET",npc,npc,0,0,0,FALSE);
			AI_PlayAni(npc,"T_STAND_2_FREEZE_VICTIM");
			AI_Wait(npc,5);
			npc.vars[14] = FALSE;
		};
		if(npc.vars[15] == TRUE)
		{
			Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);
			AI_PlayAni(npc,"T_STAND_2_FREEZE_VICTIM");
			AI_Wait(npc,3);
			npc.vars[15] = FALSE;
		};
		if(Npc_IsInState(npc,ZS_Attack) == FALSE)
		{
			if((npc.vars[10] != FALSE) && (npc.vars[9] != FALSE))
			{
				npc.protection[PROT_FIRE] = npc.vars[10];
				npc.vars[9] = FALSE;
				npc.vars[10] = FALSE;
			};
			if((npc.vars[12] != FALSE) && (npc.vars[11] != FALSE))
			{
				npc.protection[PROT_MAGIC] = npc.vars[12];
				npc.vars[11] = FALSE;
				npc.vars[12] = FALSE;
			};
			if((npc.vars[17] != FALSE) && (npc.vars[16] != FALSE))
			{
				npc.protection[PROT_EDGE] = npc.vars[17];
				npc.vars[16] = FALSE;
				npc.vars[17] = FALSE;
			};
			if((npc.vars[19] != FALSE) && (npc.vars[18] != FALSE))
			{
				npc.protection[PROT_BLUNT] = npc.vars[19];
				npc.vars[18] = FALSE;
				npc.vars[19] = FALSE;
			};
		};
		if(npc.aivar[AIV_SummonTime] == TRUE)
		{
			npc.aivar[AIV_SummonTime] = FALSE;
			Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if((Npc_GetDistToNpc(npc,hero) > 3000) && (npc.aivar[AIV_MM_EatGroundStart] == TRUE))
	{
		npc.aivar[AIV_MM_EatGroundStart] = FALSE;
	};
};

func void b_staminainvent_monster(var C_Npc npc)
{
	var int TempDamElite;
	var int randypfxelite;
	var int DamInnos;
	var int KarmaInnos;
	var int DamBeliar;
	var int DamAdanos;
	var int TempFireLightDamage;
	var int RanHealth;
	var int RanStrength;

	if(Npc_GetDistToNpc(npc,hero) <= 3000)
	{
		if(npc.vars[6] == TRUE)
		{
			npc.vars[6] = FALSE;
		};
		if((npc.attribute[ATR_HITPOINTS] < npc.attribute[ATR_HITPOINTS_MAX]) && (self.aivar[AIV_FreezeNoHeal] == FALSE) && (Npc_IsInState(npc,ZS_MM_ThreatenEnemy) == FALSE) && (Npc_IsInState(npc,ZS_MM_Attack) == FALSE) && (Hlp_GetHeroStatus() != HERO_THREATENED) && (Hlp_GetHeroStatus() != HERO_FIGHTING) && (Npc_GetDistToNpc(npc,hero) > PERC_DIST_MONSTER_ACTIVE_MAX))
		{
			Npc_ChangeAttribute(npc,ATR_HITPOINTS,npc.attribute[ATR_HITPOINTS_MAX]);
		};
		if((npc.aivar[AIV_DropDeadAndKill] == FALSE) && (npc.aivar[90] == FALSE) && (npc.guild >= GIL_GOBBO) && (npc.aivar[AIV_PARTYMEMBER] == FALSE))
		{
			RanHealth = Hlp_Random(21);
			RanStrength = Hlp_Random(11);

			if(Hlp_Random(100) <= 50)
			{
				npc.attribute[ATR_HITPOINTS_MAX] = npc.attribute[ATR_HITPOINTS_MAX] + ((npc.attribute[ATR_HITPOINTS_MAX] * RanHealth) / 100);
				npc.attribute[ATR_HITPOINTS] = npc.attribute[ATR_HITPOINTS_MAX];
			}
			else
			{
				npc.attribute[ATR_HITPOINTS_MAX] = npc.attribute[ATR_HITPOINTS_MAX] - ((npc.attribute[ATR_HITPOINTS_MAX] * RanHealth) / 100);
				npc.attribute[ATR_HITPOINTS] = npc.attribute[ATR_HITPOINTS_MAX];
			};
			if(Hlp_Random(100) <= 50)
			{
				npc.attribute[ATR_STRENGTH] = npc.attribute[ATR_STRENGTH] + ((npc.attribute[ATR_STRENGTH] * RanStrength) / 100);
			}
			else
			{
				npc.attribute[ATR_STRENGTH] = npc.attribute[ATR_STRENGTH] - ((npc.attribute[ATR_STRENGTH] * RanStrength) / 100);
			};

			npc.aivar[AIV_DropDeadAndKill] = TRUE;
		};
		if((FireShieldIsUp == TRUE) && (Npc_GetDistToNpc(npc,hero) <= 500) && (Npc_GetGuildAttitude(npc,hero) == ATT_HOSTILE) && (npc.flags != NPC_FLAG_IMMORTAL) && (npc.flags != NPC_FLAG_XARADRIM) && (npc.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(npc) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(npc) != Hlp_GetInstanceID(XranFreg)))
		{
			if(npc.aivar[AIV_SuckEnergyStateTime] == FALSE)
			{
				if(npc.attribute[ATR_HITPOINTS] > SPL_Damage_FireLight)
				{
					B_MagicHurtNpc(hero,npc,SPL_Damage_FireLight);
					Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);		
				}
				else
				{
					if(npc.aivar[90] == FALSE)
					{
						B_MagicHurtNpc(hero,npc,SPL_Damage_FireLight);
						Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);		
					}
					else
					{
						if(npc.attribute[ATR_HITPOINTS] > 1)
						{
							TempFireLightDamage = npc.attribute[ATR_HITPOINTS] - 1;
							B_MagicHurtNpc(hero,npc,TempFireLightDamage);
							Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);		
						};

						npc.protection[PROT_BLUNT] = TRUE;
						npc.protection[PROT_EDGE] = TRUE;
						npc.protection[PROT_POINT] = TRUE;
						npc.protection[PROT_FIRE] = TRUE;
						npc.protection[PROT_FLY] = TRUE;
						npc.protection[PROT_MAGIC] = TRUE;
						npc.flags = FALSE;
					};
				};

				npc.aivar[AIV_SuckEnergyStateTime] = TRUE;
			}
			else
			{
				npc.aivar[AIV_SuckEnergyStateTime] += 1;

				if(npc.aivar[AIV_SuckEnergyStateTime] >= 60)
				{
					npc.aivar[AIV_SuckEnergyStateTime] = FALSE;
				};
			};	
		};
		if((npc.aivar[AIV_EnemyOverride] == TRUE) && (npc.mission[4] != 1))
		{
			npc.mission[4] = 1;
		};
		if((npc.mission[4] != 2) && ((npc.guild == GIL_SHEEP) || (npc.guild == GIL_MEATBUG)))
		{
			npc.mission[4] = 2;
		};
		if(npc.vars[7] == FALSE)
		{
			B_BeastDownDef(npc);
		};
		if((npc.aivar[90] == FALSE) && (SBMODE == 4) && (npc.vars[2] == FALSE) && (npc.attribute[ATR_HITPOINTS_MAX] >= 20))
		{
			npc.attribute[ATR_HITPOINTS_MAX] = npc.attribute[ATR_HITPOINTS_MAX] / 2;
		
			if(npc.attribute[ATR_HITPOINTS] > npc.attribute[ATR_HITPOINTS_MAX])
			{
				npc.attribute[ATR_HITPOINTS] = npc.attribute[ATR_HITPOINTS_MAX];
			};

			npc.vars[2] = TRUE;
		};
		if(npc.vars[13] == TRUE)
		{
			Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",npc,npc,0,0,0,FALSE);
			AI_Wait(npc,3);
			npc.vars[13] = FALSE;
		};
		if(npc.vars[14] == TRUE)
		{
			Wld_PlayEffect("SPELLFX_SLEEP_TARGET",npc,npc,0,0,0,FALSE);
			AI_PlayAni(npc,"T_STAND_2_FREEZE_VICTIM");
			AI_Wait(npc,5);
			npc.vars[14] = FALSE;
		};
		if(npc.vars[15] == TRUE)
		{
			Wld_PlayEffect("VOB_MAGICBURN",npc,npc,0,0,0,FALSE);
			AI_PlayAni(npc,"T_STAND_2_FREEZE_VICTIM");
			AI_Wait(npc,3);
			npc.vars[15] = FALSE;
		};
		if(Npc_IsInState(npc,ZS_MM_Attack) == FALSE)
		{
			if((npc.vars[10] != FALSE) && (npc.vars[9] != FALSE))
			{
				npc.protection[PROT_FIRE] = npc.vars[10];
				npc.vars[9] = FALSE;
				npc.vars[10] = FALSE;
			};
			if((npc.vars[12] != FALSE) && (npc.vars[11] != FALSE))
			{
				npc.protection[PROT_MAGIC] = npc.vars[12];
				npc.vars[11] = FALSE;
				npc.vars[12] = FALSE;
			};
			if((npc.vars[17] != FALSE) && (npc.vars[16] != FALSE))
			{
				npc.protection[PROT_EDGE] = npc.vars[17];
				npc.vars[16] = FALSE;
				npc.vars[17] = FALSE;
			};
			if((npc.vars[19] != FALSE) && (npc.vars[18] != FALSE))
			{
				npc.protection[PROT_BLUNT] = npc.vars[19];
				npc.vars[18] = FALSE;
				npc.vars[19] = FALSE;
			};
		};

		B_CheckDots(npc);

		if(npc.aivar[AIV_SummonTime] == TRUE)
		{
			npc.aivar[AIV_SummonTime] = FALSE;
			Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		};
	};
};

func void b_staminainvent()
{
};

func void b_staminainventbug()
{
};
