
func void B_MM_AssessDamage()
{
	var C_Npc MagGol;
	var C_Npc ghostex;
	var C_Npc AmasDouble;
	var C_Item OthWeap;
	var C_Item Cur2X2Weap;
	var int sneakweaponindex;
	var int curseheal;
	var int permvaluexp;
	var int Health_Lvls;
	var int Poison_Lvls;
	var int TempDamage;
	var int random;
	var int Crush2HBonus;
	var int Crush1HBonus;
	var int Crush2X2HBonus;
	var string concatText;
	var int MineQueenTickAOE;
	var int TararantulTickAOE;
	var int TempCritDam;
	var int ranblood;
	var int tmp2X2StaBonus;

	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;

	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (other.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return;
	};
	if((self.guild == GIL_DEMON) && ((other.guild == GIL_DMT) || (other.guild == GIL_SKELETON)))
	{
		return;
	};
	if((self.guild == GIL_SKELETON) && ((other.guild == GIL_DMT) || (other.guild == GIL_DEMON)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait)))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		KillCrait = FALSE;
		CraitIsUp = FALSE;
		Mount_Up = FALSE;
		CraitCanUp = FALSE;
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_GOBBO) && (GoblinKing == TRUE))
	{
		GoblinKing = FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_LV)) && (FiarasFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_FIRE",other,other,0,0,0,FALSE);
		Wld_PlayEffect("VOB_MAGICBURN",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_SoulKeeper)) && (SoulKeeperFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AncientTreeGolem)) && (EkronFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Dex)) && (SkelFinalReady_Dex == TRUE) && (SkelBroFinalFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Str)) && (SkelFinalReady_Str == TRUE) && (SkelBroFinalFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Mag)) && (SkelFinalReady_Mag == TRUE) && (SkelBroFinalFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Dex)) && (SkelBroDexFight == FALSE) && (SkelBroFinalFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Str)) && (SkelBroStrFight == FALSE) && (SkelBroFinalFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Bro_Mag)) && (SkelBroMagFight == FALSE) && (SkelBroFinalFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_Lord_Milten))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PrisonSoul01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PrisonSoul02)))
	{
		return;
	};
	if(Npc_IsPlayer(other))
	{
		if(!C_NpcIsUndead(self) && (self.guild != GIL_ORC) && (self.guild != GIL_DRACONIAN) && (self.guild != GIL_MEATBUG) && (self.guild != GIL_DEMON) && (self.guild != GIL_SWAMPGOLEM) && (self.guild != GIL_STONEGOLEM) && (self.guild != GIL_FIREGOLEM) && (self.guild != GIL_ICEGOLEM))
		{
			if((self.guild == GIL_Alligator) || (self.guild == GIL_MINECRAWLER) || (self.guild == GIL_WARAN) || (self.guild == GIL_BLOODFLY))
			{
				ranblood = Hlp_Random(100);
			
				if(ranblood >= 75)
				{
					Wld_PlayEffect("SPELLFX_BLOODDEAD3",self,self,0,0,0,FALSE);
				};
			}
			else
			{
				ranblood = Hlp_Random(100);
			
				if(ranblood >= 75)
				{
					Wld_PlayEffect("SPELLFX_BLOODDEAD1",self,self,0,0,0,FALSE);
				};
			};
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ogre)))
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			Snd_Play("OGRE_STUMBLE_A1");
		}
		else if(random == 1)
		{
			Snd_Play("OGRE_STUMBLE_A2");
		}
		else if(random == 2)
		{
			Snd_Play("OGRE_STUMBLE_A3");
		};
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
	if((other.guild == GIL_DMT) && (self.guild == GIL_DEMON))
	{
		return;
	};	
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13004_STONEMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13005_STONEMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13006_STONEMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13007_FIREMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13008_FIREMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13009_FIREMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13010_WATERMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13011_WATERMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13012_WATERMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13001_DARKMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13002_DARKMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13003_DARKMAGE)))
	{
		if((self.guild == GIL_FIREGOLEM) || (self.guild == GIL_ICEGOLEM) || (self.guild == GIL_STONEGOLEM) || (self.guild == GIL_DRACONIAN))
		{
			return;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HaosDemon_Orcmine)) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_2157_Fighter)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8152_UrTak))))
	{
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Wld_PlayEffect("VOB_MAGICBURN",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-50000);
	};
	if((StoneBossIsAwake == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (HeroIsOrc == TRUE) && (self.guild == GIL_ORC) && (CurrentLevel == PSICAMP_ZEN))
	{
		HeroIsOrc = FALSE;
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_MM_REAL_ID] != ID_SANDGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_GHOST) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STONEGOLEM_OSTA)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(XranFreg)) && (Npc_IsInFightMode(other,FMODE_MELEE) || Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_FIST) || Npc_IsInFightMode(other,FMODE_MAGIC)))
	{
		TempDamage = GL_DAMAGE_PLAYER;
		GL_DAMAGE_PLAYER = FALSE;

		if(TempDamage > 0)
		{
			if((other.guild == GIL_PAL) && (PalLightIsOn == TRUE))
			{
			}
			else
			{
				B_WeaponSpecialDamage(other,self);
			};
			if(Npc_IsPlayer(other) && (EquipedIndex_2H == TRUE) && (RH_Ready_2X2 == FALSE) && Npc_IsInFightMode(other,FMODE_MELEE) && !Npc_IsInState(self,ZS_MagicBurnShort) && !Npc_IsInState(self,ZS_MagicBurn))
			{
				if(CrushBonus2HOn == TRUE)
				{
					Crush2HBonus = (hero.attribute[ATR_STRENGTH] / 10) * CrushIndex_2H;

					if(ATR_STAMINA[0] > 0)
					{
						Crush2HBonus = (Crush2HBonus * ATR_STAMINA[0]) / (ATR_STAMINA_MAX[0] * 10);

						if(ATR_STAMINA[0] >= 5)
						{
							Crush2HBonus = Crush2HBonus + (ATR_STAMINA[0] / 5);
						};
					}
					else
					{
						Crush2HBonus = 1;
					};
					if(self.attribute[ATR_HITPOINTS] > Crush2HBonus)
					{
						Npc_ChangeAttribute(self,ATR_HITPOINTS,-Crush2HBonus);
						GLCrush2HBonus = Crush2HBonus;
					}
					else
					{
						Npc_ChangeAttributeExtra(self,ATR_HITPOINTS,-Crush2HBonus);
						GLCrush2HBonus = Crush2HBonus;
						Crush2HBonus = FALSE;
					};
				}
				else
				{
					Crush2HBonus = FALSE;
					GLCrush2HBonus = FALSE;
				};
			}
			else if(Npc_IsPlayer(other) && (TempDamage > NPC_MINIMAL_DAMAGE) && (RH_Ready_2X2 == FALSE) && (EquipedIndex_1H == TRUE) && (EquipedIndex_Chief == FALSE) && Npc_IsInFightMode(other,FMODE_MELEE) && !Npc_IsInState(self,ZS_MagicBurnShort) && !Npc_IsInState(self,ZS_MagicBurn))
			{
				if(CrushBonus2HOn == TRUE)
				{
					if(MELEEWEAPONINDEX > 0)
					{
						Crush1HBonus = (hero.attribute[ATR_STRENGTH] / 10) * MELEEWEAPONINDEX;

						if(ATR_STAMINA[0] > 0)
						{
							Crush1HBonus = (Crush1HBonus * ATR_STAMINA[0]) / (ATR_STAMINA_MAX[0] * 10);

							if(ATR_STAMINA[0] >= 10)
							{
								Crush1HBonus = Crush1HBonus + (ATR_STAMINA[0] / 10);
							};
						}
						else
						{
							Crush1HBonus = 1;
						};
						if(self.attribute[ATR_HITPOINTS] > Crush1HBonus)
						{
							Npc_ChangeAttribute(self,ATR_HITPOINTS,-Crush1HBonus);
							GLCrush1HBonus = Crush1HBonus;
							Crush1HBonus = FALSE;
						}
						else
						{
							Npc_ChangeAttributeExtra(self,ATR_HITPOINTS,-Crush1HBonus);
							GLCrush1HBonus = Crush1HBonus;
							Crush1HBonus = FALSE;
						};
					}
					else
					{
						Crush1HBonus = FALSE;
						GLCrush1HBonus = FALSE;
					};
				}
				else
				{
					Crush1HBonus = FALSE;
					GLCrush1HBonus = FALSE;
				};
			}
			else if(Npc_IsPlayer(other) && (TempDamage > NPC_MINIMAL_DAMAGE) && (RH_Ready_2X2 == TRUE) && Npc_IsInFightMode(other,FMODE_MELEE) && !Npc_IsInState(self,ZS_MagicBurnShort) && !Npc_IsInState(self,ZS_MagicBurn))
			{
				Cur2X2Weap = Npc_GetReadiedWeapon(other);

				if((CrushBonus2HOn == TRUE) && (Hlp_IsValidItem(Cur2X2Weap) == TRUE))
				{
					if(LH_Ready_2X2 == TRUE)
					{
						if(hero.HitChance[NPC_TALENT_1H] >= Hlp_Random(100))
						{
							if(((hero.attribute[ATR_DEXTERITY] / 10) + (hero.attribute[ATR_STRENGTH] / 10) + (Cur2X2Weap.damage[DAM_INDEX_EDGE] / 10)) > (self.protection[PROT_EDGE] / 10))
							{
								Crush2X2HBonus = ((hero.attribute[ATR_DEXTERITY] / 10) + (hero.attribute[ATR_STRENGTH] / 10) + (Cur2X2Weap.damage[DAM_INDEX_EDGE] / 10) - (self.protection[PROT_EDGE] / 10)) * 3;
								tmp2X2StaBonus = (Crush2X2HBonus * ATR_STAMINA[0]) / (ATR_STAMINA_MAX[0] * 10);
								Crush2X2HBonus = Crush2X2HBonus + Hlp_Random(1 + (tmp2X2StaBonus / 4));
							};
						}
						else
						{
							if(((hero.attribute[ATR_DEXTERITY] / 10) + (hero.attribute[ATR_STRENGTH] / 10) + (Cur2X2Weap.damage[DAM_INDEX_EDGE] / 10)) > (self.protection[PROT_EDGE] / 10))
							{
								Crush2X2HBonus = ((hero.attribute[ATR_DEXTERITY] / 10) + (hero.attribute[ATR_STRENGTH] / 10) + (Cur2X2Weap.damage[DAM_INDEX_EDGE] / 10) - (self.protection[PROT_EDGE] / 10)) * 2;
								tmp2X2StaBonus = (Crush2X2HBonus * ATR_STAMINA[0]) / (ATR_STAMINA_MAX[0] * 10);
								Crush2X2HBonus = Crush2X2HBonus + Hlp_Random(1 + (tmp2X2StaBonus / 4));
							};
						};
					}
					else
					{
						if(hero.HitChance[NPC_TALENT_1H] >= Hlp_Random(100))
						{
							if(((hero.attribute[ATR_DEXTERITY] / 10) + (hero.attribute[ATR_STRENGTH] / 10) + (Cur2X2Weap.damage[DAM_INDEX_EDGE] / 10)) > (self.protection[PROT_EDGE] / 10))
							{
								Crush2X2HBonus = ((hero.attribute[ATR_DEXTERITY] / 10) + (hero.attribute[ATR_STRENGTH] / 10) + (Cur2X2Weap.damage[DAM_INDEX_EDGE] / 10) - (self.protection[PROT_EDGE] / 10)) * 2;
								tmp2X2StaBonus = (Crush2X2HBonus * ATR_STAMINA[0]) / (ATR_STAMINA_MAX[0] * 10);
								Crush2X2HBonus = Crush2X2HBonus + Hlp_Random(1 + (tmp2X2StaBonus / 4));
							};
						}
						else
						{
							if(((hero.attribute[ATR_DEXTERITY] / 10) + (hero.attribute[ATR_STRENGTH] / 10) + (Cur2X2Weap.damage[DAM_INDEX_EDGE] / 10)) > (self.protection[PROT_EDGE] / 10)) 
							{
								Crush2X2HBonus = ((hero.attribute[ATR_DEXTERITY] / 10) + (hero.attribute[ATR_STRENGTH] / 10) + (Cur2X2Weap.damage[DAM_INDEX_EDGE] / 10) - (self.protection[PROT_EDGE] / 10)) * 1;
								tmp2X2StaBonus = (Crush2X2HBonus * ATR_STAMINA[0]) / (ATR_STAMINA_MAX[0] * 10);
								Crush2X2HBonus = Crush2X2HBonus + Hlp_Random(1 + (tmp2X2StaBonus / 4));
							};
						};
					};
					if(self.attribute[ATR_HITPOINTS] > Crush2X2HBonus)
					{
						Npc_ChangeAttribute(self,ATR_HITPOINTS,-Crush2X2HBonus);
						GLCrush2X2HBonus = Crush2X2HBonus;
						Crush2X2HBonus = FALSE;
					}
					else
					{
						Npc_ChangeAttributeExtra(self,ATR_HITPOINTS,-Crush2X2HBonus);
						GLCrush2X2HBonus = Crush2X2HBonus;
						Crush2X2HBonus = FALSE;
					};
				}
				else
				{
					Crush2X2HBonus = FALSE;
					GLCrush2X2HBonus = FALSE;
				};
			}
			else
			{
				Crush2X2HBonus = FALSE;
				GLCrush2X2HBonus = FALSE;
			};
		}
		else
		{
			Crush2HBonus = FALSE;
			GLCrush2HBonus = FALSE;
			Crush2HBonus = FALSE;
			GLCrush2HBonus = FALSE;
			Crush2X2HBonus = FALSE;
			GLCrush2X2HBonus = FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_test)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		HeroInvisible = FALSE;
		HeroInvisibleTimer = FALSE;
		Wld_StopEffect("SPELLFX_FOG_SMOKE");

		if(HeroDragonLook == TRUE)
		{
			Wld_StopEffect("DRAGONLOOK_FX");	
			HeroDragonLook = FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(other);
	};
	if((Npc_IsPlayer(other) == FALSE) && (other.guild == self.guild))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Aim))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PaleCrawler))
	{
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + 10;

		if(self.protection[PROT_BLUNT] > 200)
		{
			self.protection[PROT_BLUNT] = self.protection[PROT_BLUNT] - 10;
		};
		if(self.protection[PROT_EDGE] > 200)
		{
			self.protection[PROT_EDGE] = self.protection[PROT_EDGE] - 10;
		};
	};
	if(Npc_IsPlayer(other) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MINECRAWLERQUEEN)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(POISONMINECRAWLERQUEEN))))
	{
		MineQueenTickAOE = Hlp_Random(100);

		if(MineQueenTickAOE >= 50)
		{
			Wld_SpawnNpcRange(other,Minecrawler_Mini,1,200);
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Tararantul)))
	{
		TararantulTickAOE = Hlp_Random(100);

		if(TararantulTickAOE >= 75)
		{
			Wld_SpawnNpcRange(other,Spider_Tara,1,200);
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HaosDemon_Orcmine)) && (Npc_GetDistToWP(other,"OM_ARENA_CENTER_03") >= 800))
	{
		Wld_SpawnNpcRange(other,SKELETON_WARRIOR_DARK_NOEXP,2,400);
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Shadow_Priest_Quardimon))
	{
		if(CrownIsUp == FALSE)
		{
			self.flags = NPC_FLAG_IMMORTAL;
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];

			if((MIS_Qvardemon == LOG_Running) && (FTDamageQvardemon == FALSE))
			{
				FTDamageQvardemon = TRUE;
				B_LogEntry(Topic_JarCurse,"Сдается, что мне придется попотеть, чтобы одолеть этого жреца! Обычное оружие его не убивает. И как же мне быть?!");
			};
		}
		else
		{
			self.flags = FALSE;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_ADDON_1158_Quarhodron))
	{
		if(KvarhBattle == TRUE)
		{
			if(CrownIsUp == FALSE)
			{
				self.flags = NPC_FLAG_IMMORTAL;
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			}
			else
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
				Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
				self.flags = FALSE;
			};
		}
		else
		{
			self.flags = NPC_FLAG_IMMORTAL;
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(sleeper))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demonlord_li_1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(demonlord_li_2)))
		{
			return;
		};
	};
	if(other.guild == GIL_DRAGON)
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SwampGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Azgalor)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(StoneGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Draconian_Minion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_UD)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IceGolem_Dragon)))
		{
			return;
		};
	};
	if(self.guild == GIL_DRAGON)
	{
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SwampGolem_Dragon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ghost_Azgalor)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(StoneGolem_Dragon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Draconian_Minion)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(FireGolem_Dragon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Lord_UD)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(IceGolem_Dragon)))
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XARDAS_SKELETON_GUARD_SUM_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XARDAS_SKELETON_GUARD_SUM_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XARDAS_SKELETON_GUARD_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XARDAS_SKELETON_GUARD_02)))
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_130_CorGalomDemon))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Demon_PW_BOSS_GUARD_01)))
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_126_Haniar))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_03)))
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Haniar_Demon_01))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_03)))
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Haniar_Demon_02))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_03)))
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Haniar_Demon_03))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_02)))
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(none_102_kreol))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_kreol_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_kreol_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_kreol_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(skeleton_kreol_04)))
		{
			return;
		};
	};
	if(C_NpcIsUndead(other) && (C_NpcIsUndead(self) || (self.guild == GIL_DEMON)))
	{
		return;
	};
	if((other.guild == GIL_DEMON) && (C_NpcIsUndead(self) || (self.guild == GIL_DMT)))
	{
		return;
	};
	if((other.guild == GIL_DMT) && (C_NpcIsUndead(self) || self.guild == GIL_DEMON))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FIREGOLEM_UNIQ))
	{
		if((Wld_IsTime(22,0,4,0) == TRUE) || (Wld_IsRaining() == TRUE))
		{
			if(self.flags == NPC_FLAG_IMMORTAL)
			{
				self.flags = FALSE;
			};
		}
		else
		{
			if(self.flags != NPC_FLAG_IMMORTAL)
			{
				self.flags = NPC_FLAG_IMMORTAL;
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AmasSah))
	{
		AmasDouble = Hlp_GetNpc(AmasRaf);

		if((Npc_GetDistToNpc(self,AmasDouble) > 1000) && (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]))
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AmasRaf))
	{
		AmasDouble = Hlp_GetNpc(AmasSah);

		if((Npc_GetDistToNpc(self,AmasDouble) > 1000) && (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]))
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
	};
	if(Npc_IsPlayer(other) && ((self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_WOLF) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOBBO_SKELETON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON_MAGE) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON) || (self.aivar[AIV_MM_REAL_ID] == ID_SummonedGuardian) || (self.aivar[AIV_MM_REAL_ID] == ID_SummonedZombie) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SWAMPDRONE) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM)))
	{
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-10000);
		return;
	};
	if(Npc_IsPlayer(other) == TRUE)
	{
		B_BeliarsWeaponSpecialDamage(other,self);
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(xardas_goblin))
	{
		if(XARDASGOBLINATTACKED == FALSE)
		{
			XARDASGOBLINATTACKED = TRUE;
		};
		if(XARDASGOBLINHUNT == FALSE)
		{
			return;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(necromacerzombie))
	{
		B_GhostSpecialDamage(other,self);
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_DEMON) && (self.flags == NPC_FLAG_IMMORTAL) && ((Npc_HasItems(other,ITRW_HAOS_BOW_01) > 0) || (Npc_HasItems(other,itmw_1h_blessedblack_magic_dex) > 0) || (Npc_HasItems(other,itmw_1h_blessedblack_magic) > 0) || (Npc_HasItems(other,itmw_2h_blessedblack_magic) > 0)))
	{
		if(Npc_HasItems(other,itmw_1h_blessedblack_magic) > 0)
		{
			Npc_GetInvItem(other,itmw_1h_blessedblack_magic);
		}
		else if(Npc_HasItems(other,itmw_1h_blessedblack_magic_dex) > 0)
		{
			Npc_GetInvItem(other,itmw_1h_blessedblack_magic_dex);
		}
		else if(Npc_HasItems(other,itmw_2h_blessedblack_magic) > 0)
		{
			Npc_GetInvItem(other,itmw_2h_blessedblack_magic);
		}
		else if(Npc_HasItems(other,ITRW_HAOS_BOW_01) > 0)
		{
			Npc_GetInvItem(other,ITRW_HAOS_BOW_01);
		};

		OthWeap = Npc_GetReadiedWeapon(other);

		if(Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item))
		{
			self.flags = FALSE;
		};
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XranFreg)) && (XranFregIsMortal == TRUE) && Npc_IsInFightMode(other,FMODE_MAGIC) && (Npc_GetActiveSpell(other) == SPL_Inflate))
	{
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
		B_MagicHurtNpc_Immortal(other,self,2500);
		XranFregIsMortal = FALSE;
	};
	if(Npc_HasItems(other,Holy_Hammer_MIS) > 0)
	{
		MagGol = Hlp_GetNpc(MagicGolem);
		Npc_GetInvItem(other,Holy_Hammer_MIS);
		OthWeap = Npc_GetReadiedWeapon(other);

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MagGol)) && (Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item)))
		{
			B_MagicHurtNpc_Immortal(other,self,10000);
			return;
		};
	};
	if(Npc_IsPlayer(other) && !Npc_IsInFightMode(other,FMODE_FAR) && !Npc_IsInFightMode(other,FMODE_FIST) && !Npc_IsInFightMode(other,FMODE_MAGIC) && (other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX]))
	{
		if(Npc_HasItems(other,ItMw_1H_GoldBrand) > 0)
		{
			Npc_GetInvItem(other,ItMw_1H_GoldBrand);
			OthWeap = Npc_GetReadiedWeapon(other);

			if(Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item))
			{
				Npc_ChangeAttribute(other,ATR_HITPOINTS,15);

				if(other.attribute[ATR_HITPOINTS] > other.attribute[ATR_HITPOINTS_MAX])
				{
					other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
				};
			};
		};
	};
	if(Npc_HasItems(other,itmw_adanosmolot) > 0)
	{
		Npc_GetInvItem(other,itmw_adanosmolot);
		OthWeap = Npc_GetReadiedWeapon(other);

		if((Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Stoneguardian_AV_01)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Stoneguardian_AV_02)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Stoneguardian_AV_03)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Stoneguardian_AV_04)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Stoneguardian_AV_05)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Stoneguardian_Undead)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Stoneguardian_Undead_TT)) && ((self.guild == GIL_Stoneguardian) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Boss))))
		{
			B_MagicHurtNpc_Immortal(other,self,10000);
			return;
		};
		if((Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item)) && (ScipIsUp == TRUE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_04)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_05))))
		{
			B_MagicHurtNpc_Immortal(other,self,10000);
			return;
		};
		if((Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item)) && (CrownIsUp == TRUE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Stoneguardian_Undead_TT)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_Undead)))
		{
			B_MagicHurtNpc_Immortal(other,self,10000);
			return;
		};
	};
	if((self.guild == GIL_Stoneguardian) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		if(CurrentLevel != ADANOSVALLEY_ZEN)
		{
			b_awake_stoneguardian(self);
		}
		else
		{
			if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_03)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_04)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_AV_05)))
			{
				return;
			};
		};
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_ORC) && (GUARDIANSISDEFEATED == FALSE) && (KAPITELORCATC == TRUE))
	{
		if(Npc_GetDistToWP(other,"NW_CITY_MERCHANT_PATH_11") <= 32000)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_Warn");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			if(COUNTORCPROTECT == FALSE)
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
				COUNTORCPROTECT = TRUE;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 0;
				COUNTORCPROTECT = FALSE;
			};
			if(FIRSTSTRIKEME == FALSE)
			{
				B_GivePlayerXP(500);
				FIRSTSTRIKEME = TRUE;
				if(MIS_STRANGETHINGS == LOG_Running)
				{
					B_LogEntry(TOPIC_STRANGETHINGS,"Я вообще перестаю понимать, что здесь происходит! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
				}
				else if(MIS_STRANGETHINGS == FALSE)
				{
					MIS_STRANGETHINGS = LOG_Running;
					Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
					Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
					B_LogEntry(TOPIC_STRANGETHINGS,"Стали происходить довольно странные вещи! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
				};
			};
		}
		else if(Npc_GetDistToWP(other,"NW_PATH_TO_MONASTERY_09") <= 12000)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_Warn");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			if(COUNTORCPROTECT == FALSE)
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
				COUNTORCPROTECT = TRUE;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 0;
				COUNTORCPROTECT = FALSE;
			};
			if(FIRSTSTRIKEME == FALSE)
			{
				B_GivePlayerXP(500);
				FIRSTSTRIKEME = TRUE;
				if(MIS_STRANGETHINGS == LOG_Running)
				{
					B_LogEntry(TOPIC_STRANGETHINGS,"Я вообще перестаю понимать, что здесь происходит! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
				}
				else if(MIS_STRANGETHINGS == FALSE)
				{
					MIS_STRANGETHINGS = LOG_Running;
					Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
					Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
					B_LogEntry(TOPIC_STRANGETHINGS,"Стали происходить довольно странные вещи! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
				};
			};
		}
		else if(Npc_GetDistToWP(other,"NW_BIGFARM_ORC_SAFE") <= 15000)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
			Snd_Play("DEM_Warn");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			if(COUNTORCPROTECT == FALSE)
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
				COUNTORCPROTECT = TRUE;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 0;
				COUNTORCPROTECT = FALSE;
			};
			if(FIRSTSTRIKEME == FALSE)
			{
				B_GivePlayerXP(500);
				FIRSTSTRIKEME = TRUE;
				if(MIS_STRANGETHINGS == LOG_Running)
				{
					B_LogEntry(TOPIC_STRANGETHINGS,"Я вообще перестаю понимать, что здесь происходит! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
				}
				else if(MIS_STRANGETHINGS == FALSE)
				{
					MIS_STRANGETHINGS = LOG_Running;
					Log_CreateTopic(TOPIC_STRANGETHINGS,LOG_MISSION);
					Log_SetTopicStatus(TOPIC_STRANGETHINGS,LOG_Running);
					B_LogEntry(TOPIC_STRANGETHINGS,"Стали происходить довольно странные вещи! Когда я попытался атаковать одного из орков, то в меня ударил разряд молнии чуть не убивший меня. По всей видимости, какая-то магия защищает всех этих тварей. Похоже, что мне надо быть теперь поосторожнее...");
				};
			};
		};
	};
	if(C_PredatorFoundPrey(other,self))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if((self.aivar[AIV_MM_REAL_ID] == ID_WISP) || (self.aivar[AIV_MM_REAL_ID] == ID_BARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_ZIEGE))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	if(Npc_IsInState(self,ZS_MM_Attack))
	{
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON) && (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE))
		{
			return;
		};
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			if(self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other))
			{
				Npc_SetTarget(self,other);
			}
			else
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID(other);
			};
		};

		return;
	};

	Npc_ClearAIQueue(self);
	Npc_SetTarget(self,other);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_Attack,0,"");
};