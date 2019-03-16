func void B_WeaponSpecialDamageMagic(var C_Npc oth,var C_Npc slf)
{
	var int ShadowPriestDamage;
	var int TempResistInt;
	var int TempResistShield;
	var int HeroResistAll;
	var int BackFinalDamage;

	var C_Item selfweap;

	if((SkillBlockShield == TRUE) && (AIV_GiveShieldRes == TRUE))
	{
		if(hero.attribute[ATR_REGENERATEMANA] >= 10)
		{
			TempResistShield = hero.attribute[ATR_REGENERATEMANA] / 10;
		}
		else
		{
			TempResistShield = 1;
		};
	}
	else
	{
		TempResistShield = 0;
	};
	if(ATR_INTELLECT >= 10)
	{
		TempResistInt = ATR_INTELLECT / 10;
	}
	else
	{
		TempResistInt = 1;
	};

	HeroResistAll = (TempResistInt * HeroMageCirlce) + (TempResistShield * CurShieldRes);

	if(self.attribute[ATR_MANA_MAX] < 50)
	{
		self.attribute[ATR_MANA_MAX] = 50;
		self.attribute[ATR_MANA] = 50;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST)
	{
		selfweap = Npc_GetReadiedWeapon(slf);

		if(Npc_IsPlayer(oth) && ((Hlp_IsItem(selfweap,ITMW_SHADOWPRIEST) == TRUE) || (Hlp_IsItem(selfweap,ITMW_SHADOWPRIEST_ELITE) == TRUE) || (Hlp_IsItem(selfweap,ITMW_SHADOWPRIEST_OBER) == TRUE)))
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);
				};
			};
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NECROMACERZOMBIE))
	{
		ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
		if(ShadowPriestDamage > HeroResistAll)
		{
			BackFinalDamage = ShadowPriestDamage - HeroResistAll;

			if(Hlp_Random(100) >= oth.level)
			{
				if(Hlp_Random(100) >= 50)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
				};

				Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);	
			};
		};
		if(Hlp_Random(100) >= 95)
		{
			PlayerIsSick = TRUE;
		};
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13004_STONEMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13005_STONEMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13006_STONEMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13007_FIREMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13008_FIREMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13009_FIREMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13010_WATERMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13011_WATERMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13012_WATERMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13001_DARKMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13002_DARKMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13003_DARKMAGE)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);	
				};
			};
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_2090_Addon_Raven))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);
				};
			};
		};
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(HaosDemon_Orcmine)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(HaosDemon_Psicamp)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(WATERRITUALDEMON)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);	
				};
			};
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_12971_STONNOS))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);
				};
			};	
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SLEEPER_OLD))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			if(SleeperStone == FALSE)
			{
				BackFinalDamage = 2500;

				if(Hlp_Random(100) >= 50)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
				};

				Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);
			}
			else
			{
				ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
				if(ShadowPriestDamage > HeroResistAll)
				{
					BackFinalDamage = ShadowPriestDamage - HeroResistAll;

					if(Hlp_Random(100) >= oth.level)
					{
						if(Hlp_Random(100) >= 50)
						{
							Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
						};

						Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);
					};
				};
			};
		};
	}
	else if((slf.guild == GIL_DEMON) && (slf.aivar[90] == TRUE) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Gobbo_Gazcul)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Troll_Black_AV)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);
				};
			};
		};
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Gobbo_Gazcul)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Troll_Black_AV)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Demon_Lord_Milten)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);					
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);	
				};
			};
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	{
		if((Npc_IsPlayer(oth) == TRUE) && (Npc_GetDistToNpc(slf,oth) <= 650))
		{
			ShadowPriestDamage = 10 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",slf,slf,0,0,0,FALSE);
						Wld_PlayEffect("VOB_MAGICBURN",oth,oth,0,0,0,FALSE);
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);
				};
			};
		};
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
	{
		if((Npc_IsPlayer(oth) == TRUE) && (Npc_GetDistToNpc(slf,oth) <= 650))
		{
			ShadowPriestDamage = 10 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_ICEWAVE_WAVE",slf,slf,0,0,0,FALSE);
						Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",oth,oth,0,0,0,FALSE);
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);	
				};
			};
		};
	}
	else if((slf.guild == GIL_DMT) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Lord_LV)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ilesil_Evil)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(VLK_5570_Avabul)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Bow)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ancient_Warrior_02)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(ZOMBIE_OM3)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(ZOMBIE_OM4)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(ZOMBIE_OM5)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_129_DeadNrozas)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ass_130_CorGalomDemon)))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 10 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					if(Hlp_Random(100) >= 50)
					{
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);
					};

					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);	
				};
			};
		};
	}
	else	if(Npc_IsPlayer(oth) && (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ilarah)) && (IlArahActTwo == TRUE) && (IlArahAllDemonsRage == FALSE))
	{
		Wld_PlayEffect("VOB_MAGICBURN",oth,oth,0,0,0,FALSE);
		Npc_ChangeAttribute(oth,ATR_HITPOINTS,-100000);
		IlArahAllDemonsRage = TRUE;
	}
	else	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(AraharPlague))
	{
		if(Npc_IsPlayer(oth) == TRUE)
		{
			ShadowPriestDamage = 50 + Hlp_Random(slf.level);
	
			if(ShadowPriestDamage > HeroResistAll)
			{
				BackFinalDamage = ShadowPriestDamage - HeroResistAll;

				if(Hlp_Random(100) >= oth.level)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);
					Npc_ChangeAttribute(oth,ATR_HITPOINTS,-BackFinalDamage);	
				};
			};
			if(Hlp_Random(100) >= 50)
			{
				PlayerIsSick = TRUE;
			};
		};
	};
};

func void B_AssessMagic()
{
	var int ShadowPriestDamage;
	var int randy;
	var int randwait;

	if(Npc_GetLastHitSpellCat(self) == SPELL_BAD)
	{
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	};
	if((Npc_IsPlayer(other) == TRUE) && (AcidIsOn == TRUE) && (C_NpcIsUndead(self) == FALSE) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_GHOST) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(XranFreg)))
	{
		if(self.attribute[ATR_HITPOINTS] > 200)
		{
			Wld_PlayEffect("SPELLFX_BLOODDEAD3",self,self,0,0,0,FALSE);
			B_MagicHurtNpc(other,self,200);
		}
		else
		{
			self.protection[PROT_BLUNT] = TRUE;
			self.protection[PROT_EDGE] = TRUE;
			self.protection[PROT_POINT] = TRUE;
			self.protection[PROT_FIRE] = TRUE;
			self.protection[PROT_FLY] = TRUE;
			self.protection[PROT_MAGIC] = TRUE;
			self.flags = FALSE;
			B_MagicHurtNpc(other,self,200);
		};
	};
	if((Npc_IsPlayer(other) == TRUE) && (SleeperMaskIsOn == TRUE) && (Npc_IsDead(self) == FALSE) && (SleeperMaskIntBonus == FALSE))
	{
		randwait = Hlp_Random(100);

		if((randwait <= 10) && (SleeperMaskIntBonus == FALSE))
		{
			ATR_INTELLECT += 100;
			Npc_SetTalentSkill(other,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			SleeperMaskIntBonus = TRUE;
		};
	};
	if(Npc_IsPlayer(other) == TRUE)
	{
		if((PlayerIsCurse == FALSE) && (SBMODE == TRUE) && (HEROTRANS == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ancient_Warrior_02)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM3)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM4)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM5)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Skeleton_Bow)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Gobbo_Gazcul)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Troll_Black_AV)) && ((self.guild == GIL_DEMON) || (self.guild == GIL_DMT) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST) || (self.aivar[AIV_MM_REAL_ID] == ID_GHOST)))
		{
			if(self.aivar[90] == TRUE)
			{
				randy = Hlp_Random(100);
			
				if(randy <= 70)
				{
					if(hero.protection[PROT_MAGIC] < Hlp_Random(500))
					{
						PlayerIsCurse = TRUE;
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					};
				};
			}
			else
			{
				randy = Hlp_Random(100);
			
				if(randy <= 35)
				{
					if(hero.protection[PROT_MAGIC] < Hlp_Random(250))
					{
						PlayerIsCurse = TRUE;
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					};
				};
			};
		};
	};
	if(Npc_IsPlayer(other) == TRUE)
	{
		B_WeaponSpecialDamageMagic(other,self);
	};
	if((Npc_GetLastHitSpellID(self) == SPL_GreenTentacle) && (self.aivar[90] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre)) && (self.guild != GIL_TROLL) && (self.flags != NPC_FLAG_GHOST) && (self.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(XranFreg)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_Greententacle,0,"");
		return;
	};
	if((Npc_GetLastHitSpellID(self) == SPL_Swarm) && (self.aivar[90] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre)) && (self.guild != GIL_TROLL) && (self.flags != NPC_FLAG_GHOST) && (self.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(XranFreg)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_Swarm,0,"");
		return;
	};
	if((self.aivar[90] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre)) && (self.guild != GIL_TROLL) && (self.flags != NPC_FLAG_GHOST) && (self.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(XranFreg)) && ((Npc_GetLastHitSpellID(self) == SPL_IceCube) || (Npc_GetLastHitSpellID(self) == SPL_IceWave)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MagicFreeze,0,"");
		return;
	};
	if((Npc_GetLastHitSpellID(self) == SPL_Fear) && (self.aivar[90] == FALSE))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);

		if((self.guild < GIL_SEPERATOR_HUM) && (self.guild != GIL_KDF) && (self.guild != GIL_GUR) && (self.guild != GIL_KDW))
		{
			AI_StartState(self,ZS_MagicFlee,0,"");
			return;
		}
		else if((self.guild > GIL_SEPERATOR_HUM) && (self.guild != GIL_DRAGON) && (self.guild != GIL_TROLL) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_ICEGOLEM) && (self.guild != GIL_FIREGOLEM) && (self.flags != NPC_FLAG_GHOST) && (self.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(XranFreg)))
		{
			AI_StartState(self,ZS_MM_Flee,0,"");
			return;
		};
	};
	if((Npc_GetLastHitSpellID(self) == SPL_Firerain) && (self.aivar[90] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre)) && (self.guild != GIL_TROLL) && (self.flags != NPC_FLAG_GHOST) && (self.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(XranFreg)))
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MagicBurnShort,0,"");
		return;
	};
	if((Npc_GetLastHitSpellID(self) == SPL_CONTROL) && (self.aivar[90] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre)) && (self.guild != GIL_TROLL) && (self.flags != NPC_FLAG_GHOST) && (self.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(XranFreg)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,zs_controlled,0,"");
		return;
	};
	if((Npc_GetLastHitSpellID(self) == SPL_TELEKINESIS) && (self.aivar[90] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ogre)) && (self.guild != GIL_TROLL) && (self.flags != NPC_FLAG_GHOST) && (self.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(XranFreg)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,zs_telekinesis,0,"");
		return;
	};
	if(Npc_GetLastHitSpellID(self) == SPL_MagicCage)
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MagicCage,0,"");
		return;
	};
	if(Npc_GetLastHitSpellID(self) == SPL_Extricate)
	{
		if(self.guild < GIL_SEPERATOR_HUM)
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self, other);
			B_AssessDamage();
		};

		Npc_SetTarget(self, other);
		Npc_SetTempAttitude(self, ATT_HOSTILE);
		return;
	};
};


const func PLAYER_PERC_ASSESSMAGIC = B_AssessMagic;
