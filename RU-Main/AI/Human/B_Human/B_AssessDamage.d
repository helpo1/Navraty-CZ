
var int kreolgurd;
var int xardasgurd;

func void B_AssessDamage()
{
	var C_Npc Quarho;
	var C_Npc Rhadem;
	var C_Npc gomez;
	var C_Npc corristo;
	var C_Npc rodriguez;
	var C_Npc damarok;
	var C_Npc drago;
	var C_Npc torrez;
	var C_Npc rav;
	var C_Npc ravd;
	var int sneakweaponindex;
	var C_Item OthWeap;
	var C_Npc guardex;
	var int curseheal;
	var int permvaluexp;
	var int TributeDagger;
	var int Health_Lvls;
	var int Poison_Lvls;
	var int TempDamage;
	var int ProcFall;
	var int FallHitChance;
	var int Crush2HBonus;
	var int Crush1HBonus;
	var int Crush2X2HBonus;
	var int randypfxdead;
	var int ranblood;
	var string concatText;
	var C_Item Cur2X2Weap;
	var int tmp2X2StaBonus;

	Quarho = Hlp_GetNpc(NONE_ADDON_111_Quarhodron);
	Rhadem = Hlp_GetNpc(NONE_ADDON_112_Rhademes);
	gomez = Hlp_GetNpc(none_104_gomez);
	corristo = Hlp_GetNpc(none_105_corristo);
	rodriguez = Hlp_GetNpc(none_106_rodriguez);
	damarok = Hlp_GetNpc(none_107_damarok);
	drago = Hlp_GetNpc(none_108_drago);
	torrez = Hlp_GetNpc(none_109_torrez);

	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if((self.guild == GIL_DMT) && ((other.guild == GIL_DEMON) || (other.guild == GIL_SKELETON)))
	{
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(ShadowGuardOne)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardTwo)))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ShadowGuardOne)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(ShadowGuardTwo)))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Stefan)) && (StefanCanFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;	
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1299_OberDementor_DI)) && (other.guild ==GIL_DMT))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Imarah)) && (ImarahHeals == TRUE))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + other.attribute[ATR_HITPOINTS_MAX];

		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};

		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS] - (other.attribute[ATR_HITPOINTS_MAX] / 4);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord)) && (ReadyForBoss7 == FALSE))
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
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1192_Fregeal)))
	{
		Wld_SpawnNpcRange(self,Wolf_Druid,3,500);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_LV)) && (ReadyForBoss7 == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1813_Ilesil)) && (IlesilCanFight == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",other,other,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
		Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13004_STONEMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13005_STONEMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13006_STONEMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13007_FIREMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13008_FIREMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13009_FIREMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13010_WATERMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13011_WATERMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13012_WATERMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13001_DARKMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13002_DARKMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13003_DARKMAGE)))
	{
		if((other.guild == GIL_FIREGOLEM) || (other.guild == GIL_ICEGOLEM) || (other.guild == GIL_STONEGOLEM) || (other.guild == GIL_DRACONIAN))
		{
			return;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13004_STONEMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13005_STONEMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13006_STONEMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13007_FIREMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13008_FIREMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13009_FIREMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13010_WATERMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13011_WATERMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13012_WATERMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13001_DARKMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13002_DARKMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13003_DARKMAGE)))
	{
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13004_STONEMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13005_STONEMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13006_STONEMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13007_FIREMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13008_FIREMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13009_FIREMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13010_WATERMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13011_WATERMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13012_WATERMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13001_DARKMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13002_DARKMAGE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(DMT_13003_DARKMAGE)))
		{
			return;
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
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sld_804_Rod)) && (CanBeatRodFist == TRUE) && (CanBeatRodFistDo == FALSE) && (Npc_IsInFightMode(other,FMODE_FIST) != TRUE))
	{
		CanBeatRodFist = FALSE;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_10920_Loa)) && (LoaPissOff[1] == FALSE))
	{
		LoaPissOff[1] = TRUE;
	};
	if(Npc_IsPlayer(other))
	{
		ranblood = Hlp_Random(100);
			
		if(ranblood >= 75)
		{
			Wld_PlayEffect("SPELLFX_BLOODDEAD1",self,self,0,0,0,FALSE);
		};
	};
	if((self.guild <= GIL_SEPERATOR_HUM) && (self.aivar[90] == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(BAU_980_Sagitta)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(SLD_10921_Loa_ADW)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(SLD_10920_Loa)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PIR_6136_ABIGEIL)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PIR_61360_ABIGEIL)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_414_Hanna)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PIR_1397_ADDON_INEXTREMO_CHARLOTTE)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8147_Dagrag)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8148_Gunnok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8149_Turuk)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8150_UrTrok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8151_Umrak)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8152_UrTak)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2153_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2154_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2155_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2156_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2157_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Skeleton_Bow)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ancient_Warrior_02)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM3)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM4)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM5)) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != NPC_FLAG_IMMORTAL) && (C_NpcIsDown(self) == FALSE) && (Npc_IsInFightMode(self,FMODE_MAGIC) == FALSE) && (Npc_IsInFightMode(self,FMODE_FAR) == FALSE))
	{
		if(Npc_IsPlayer(other) == TRUE)
		{
			if(Npc_IsInFightMode(other,FMODE_MELEE))
			{
				if(other.HitChance[NPC_TALENT_2H] >= other.HitChance[NPC_TALENT_1H])
				{
					FallHitChance = other.HitChance[NPC_TALENT_2H];

					ProcFall = Hlp_Random(750);
	
					if(ProcFall <= FallHitChance)
					{
						AI_PlayAni(self,"T_FALLB_2_FALLENB");
						AI_Wait(self,1);
					};
				}
				else
				{
					FallHitChance = other.HitChance[NPC_TALENT_1H];

					ProcFall = Hlp_Random(1000);

					if(ProcFall <= FallHitChance)
					{
						AI_PlayAni(self,"T_FALLB_2_FALLENB");
						AI_Wait(self,1);
					};
				};
			}
			else if(Npc_IsInFightMode(other,FMODE_FAR))
			{
				if(other.HitChance[NPC_TALENT_CROSSBOW] >= other.HitChance[NPC_TALENT_BOW])
				{
					FallHitChance = other.HitChance[NPC_TALENT_CROSSBOW];
				}
				else
				{
					FallHitChance = other.HitChance[NPC_TALENT_BOW];
				};

				ProcFall = Hlp_Random(1000);

				if(ProcFall <= FallHitChance)
				{
					AI_PlayAni(self,"T_FALLB_2_FALLENB");
					AI_Wait(self,1);
				};
			}
			else if(Npc_IsInFightMode(other,FMODE_FIST))
			{
				ProcFall = Hlp_Random(100);

				if(ProcFall <= 5)
				{
					AI_PlayAni(self,"T_FALLB_2_FALLENB");
					AI_Wait(self,1);
				};
			};
		}
		else
		{
			ProcFall = Hlp_Random(100);

			if(ProcFall <= 5)
			{
				AI_PlayAni(self,"T_FALLB_2_FALLENB");
				AI_Wait(self,1);
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_1298_DARKMAGE))
	{
		if((Npc_IsPlayer(other) == TRUE) && (MeetDarkTempleMage == FALSE))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(orc_6666_xash_gor))
	{
		if((Npc_IsPlayer(other) == TRUE) && (HashGorBattleStart == FALSE))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sleeper_Old))
	{
		if((Npc_IsPlayer(other) == TRUE) && (SleeperHello == FALSE))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_130_CorGalomDemon))
	{
		if((Npc_IsPlayer(other) == TRUE) && (CorGalomDontSpeak == FALSE))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon))
	{
		if((Npc_IsPlayer(other) == TRUE) && (HaniarOrderKill == FALSE))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_4572_Trazege))
	{
		if(Npc_IsPlayer(other) == TRUE)
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4570_Avabul))
	{
		if(Npc_IsPlayer(other) == TRUE)
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_4571_Jan))
	{
		if(Npc_IsPlayer(other) == TRUE)
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1090_Addon_Raven))
	{
		if((Npc_IsPlayer(other) == TRUE) && ((hero.guild > GIL_SEPERATOR_HUM) || (RavenCanAway == FALSE)))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_2090_Addon_Raven))
	{
		if((Npc_IsPlayer(other) == TRUE) && ((hero.guild > GIL_SEPERATOR_HUM) || (RavenCanKill == FALSE)))
		{
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",other,other,0,0,0,FALSE);
			self.flags = NPC_FLAG_IMMORTAL;
			Npc_ChangeAttribute(other,ATR_HITPOINTS,-other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if((CurrentLevel == PRIORATWORLD_ZEN) && (self.guild == GIL_STRF))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (CurrentLevel == PRIORATWORLD_ZEN) && (self.guild == GIL_BDT) && (PlayerChooseFight_PW == FALSE) && (PlayerChooseSpy_PW == FALSE) && (InsMasiafKillers == FALSE))
	{
		PlayerIsPrioratFake = TRUE;
		InsMasiafKillers = TRUE;
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
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_IsPlayer(other) && (KillArenaWarrior == FALSE) && (ArenaFightNow == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak))))
	{
		KillArenaWarrior = TRUE;
	};
	if(Npc_IsPlayer(other) && (KillArenaWarrior == FALSE) && (ArenaFightNow == TRUE))
	{
 		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)) && (DagragIsFight == FALSE))
		{
			KillArenaWarrior = TRUE;
		};
 		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)) && (GunnokIsFight == FALSE))
		{
			KillArenaWarrior = TRUE;
		};
 		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)) && (TurukIsFight == FALSE))
		{
			KillArenaWarrior = TRUE;
		};
 		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)) && (HartIsFight == FALSE))
		{
			KillArenaWarrior = TRUE;
		};
 		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)) && (UrTrokIsFight == FALSE))
		{
			KillArenaWarrior = TRUE;
		};
 		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak)) && (UmrakIsFight == FALSE))
		{
			KillArenaWarrior = TRUE;
		};
	};
	if((self.guild == GIL_DMT) && (C_NpcIsUndead(other) || (other.guild == GIL_DEMON)))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_130_CorGalomDemon)) && (other.guild == GIL_DEMON))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) && (other.guild == GIL_DEMON))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_1190_Assasin)) && (HaniarOrderKill == TRUE) && (GonsaOut == FALSE))
	{
		return;
	};
	if(Npc_IsPlayer(other)  && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1083_Addon_Esteban)))
	{
		B_Attack(BDT_10005_Addon_Wache_02,other,AR_NONE,0);
		B_Attack(BDT_1081_Addon_Wache_01,other,AR_NONE,0);
	};
	if(Npc_IsPlayer(other)  && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_10005_Addon_Wache_02)))
	{
		B_Attack(BDT_1083_Addon_Esteban,other,AR_NONE,0);
		B_Attack(BDT_1081_Addon_Wache_01,other,AR_NONE,0);
	};
	if(Npc_IsPlayer(other)  && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1081_Addon_Wache_01)))
	{
		B_Attack(BDT_10005_Addon_Wache_02,other,AR_NONE,0);
		B_Attack(BDT_1083_Addon_Esteban,other,AR_NONE,0);
	};
	if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && ((victim.guild == GIL_BDT) || (victim.guild == GIL_DMT) || (victim.guild >= GIL_GOBBO)))
	{
		B_Attack(self,victim,AR_GuildEnemy,0);
		return;
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_1190_Assasin)) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_174_Adept_Demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_175_Adept_Demon))))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-10000);
	};
	if(Npc_IsPlayer(other) && (CurrentLevel != ADANOSVALLEY_ZEN) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM5)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM4)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM3)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ancient_Warrior_02)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Skeleton_Bow)) && (self.guild == GIL_DMT) && (self.npcType == NPCTYPE_AMBIENT) && (Npc_GetDistToNpc(self,other) >= FIGHT_DIST_MELEE) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_STRENGTH] > other.attribute[ATR_MANA_MAX]) && (other.attribute[ATR_STRENGTH] > other.attribute[ATR_DEXTERITY]))
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
	if(Npc_IsPlayer(other) && (CurrentLevel != ADANOSVALLEY_ZEN) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM5)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM4)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM3)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ancient_Warrior_02)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Skeleton_Bow)) && (self.guild == GIL_DMT) && (self.npcType == NPCTYPE_AMBIENT) && (Npc_GetDistToNpc(self,other) >= WATCHFIGHT_DIST_MAX) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] > other.attribute[ATR_MANA_MAX]) && (other.attribute[ATR_DEXTERITY] > other.attribute[ATR_STRENGTH]))
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
	if(Npc_IsPlayer(other) && (CurrentLevel != ADANOSVALLEY_ZEN) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM5)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM4)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(ZOMBIE_OM3)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ancient_Warrior_02)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Skeleton_Bow)) && (self.guild == GIL_DMT) && (self.npcType == NPCTYPE_AMBIENT) && (Npc_GetDistToNpc(self,other) >= WATCHFIGHT_DIST_MAX) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_MANA_MAX] > other.attribute[ATR_DEXTERITY]) && (other.attribute[ATR_MANA_MAX] > other.attribute[ATR_STRENGTH]))
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
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon))
	{
		if((Adept_Demon_1_DEAD == FALSE) || (Adept_Demon_2_DEAD == FALSE) || (Adept_Demon_3_DEAD == FALSE) || (Adept_Demon_4_DEAD == FALSE))
		{
			if((self.attribute[ATR_HITPOINTS] < 8000) && (Adept_Demon_1_DEAD == FALSE))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 2000;
				B_KillNpc(Demon_PW_01);
				Adept_Demon_1_DEAD = TRUE;
				Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
			}
			else if((self.attribute[ATR_HITPOINTS] < 6000) && (Adept_Demon_2_DEAD == FALSE))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 2000;
				B_KillNpc(Demon_PW_02);
				Adept_Demon_2_DEAD = TRUE;
				Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
			}
			else if((self.attribute[ATR_HITPOINTS] < 4000) && (Adept_Demon_3_DEAD == FALSE))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 2000;
				B_KillNpc(Demon_PW_03);
				Adept_Demon_3_DEAD = TRUE;
				Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
			}
			else if((self.attribute[ATR_HITPOINTS] < 2000) && (Adept_Demon_4_DEAD == FALSE))
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 2000;
				B_KillNpc(Demon_PW_04);
				Adept_Demon_4_DEAD = TRUE;
				Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				Snd_Play("DEM_Warn");
			};
		}; 
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1257_dementor)))
	{
		if(MIS_BELIARHELPME == LOG_Running)
		{
			MIS_BELIARHELPME = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
		};
		Wld_StopEffect("DEMENTOR_FX");
		B_StartOtherRoutine(self,"Start");
		AI_Teleport(self,"TOT");
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_ADDON_1159_Rhademes)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(corristo)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rodriguez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(damarok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(drago)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(torrez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhadem)))
	{
		B_GhostSpecialDamage(other,self);
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_121200_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1297_stonnos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12140_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12170_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12200_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12970_stonnos)))
	{
		B_GhostSpecialDamage(other,self);
	};
	if(Npc_IsPlayer(other) && (Npc_HasItems(other,ItMw_1h_TributeDagger) > 0) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8568_NagDumgar)))
	{
		TributeDagger = Hlp_Random(200) + 10;

		if(self.attribute[ATR_HITPOINTS] > TributeDagger)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-TributeDagger);
			return;
		}
		else
		{
			self.flags = NPC_FLAG_NONE;
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttributeExtra(self,ATR_HITPOINTS,-TributeDagger);
			return;
		};
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_DMT) && (self.flags == NPC_FLAG_IMMORTAL) && ((Npc_HasItems(other,itmw_1h_blessedblack_magic_dex) > 0) || (Npc_HasItems(other,itmw_1h_blessedblack_magic) > 0) || (Npc_HasItems(other,itmw_2h_blessedblack_magic) > 0)))
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
		};

		OthWeap = Npc_GetReadiedWeapon(other);

		if(Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item))
		{
			self.flags = 0;
		};
	};
	if(Npc_IsPlayer(other) && (self.guild == GIL_DMT) && (self.flags == NPC_FLAG_XARADRIM) && ((Npc_HasItems(other,itmw_1h_blessedblack_magic_dex) > 0) || (Npc_HasItems(other,itmw_1h_blessedblack_magic) > 0) || (Npc_HasItems(other,itmw_2h_blessedblack_magic) > 0)))
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
		};

		OthWeap = Npc_GetReadiedWeapon(other);

		if(Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item))
		{
			self.flags = 0;
		};
	};
	if(Npc_IsPlayer(other) == TRUE)
	{
		B_BeliarsWeaponSpecialDamage(other,self);
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
	if((STARTBIGBATTLE == TRUE) && (self.aivar[98] == TRUE) && (BIGBATTLEBACKPOSITION == FALSE) && (other.guild < GIL_SEPERATOR_HUM) && (Npc_GetDistToWP(self,"BIGFIGHT") <= 15000))
	{
		return;
	};
	if(self.aivar[AIV_ArenaFight] == AF_AFTER)
	{
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE;
	};
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
		rav = Hlp_GetNpc(BDT_1090_Addon_Raven);

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rav))
		{
			self.aivar[AIV_EnemyOverride] = FALSE;
		};

		ravd = Hlp_GetNpc(BDT_2090_Addon_Raven);

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ravd))
		{
			self.aivar[AIV_EnemyOverride] = FALSE;
		};
	};
	if((Npc_IsPlayer(other) == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_484_Lehmar)))
	{
		if((Npc_GetDistToNpc(self,vlk_6120_lemarguard) <= 600))
		{
			B_Attack(vlk_6120_lemarguard,other,AR_ReactToDamage,0);
		};
	};
	if(B_AssessEnemy())
	{
		return;
	};
	if((Npc_IsPlayer(other) == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_507_Talamon)))
	{
		B_Attack(self,other,AR_GuardStopsIntruder,0);
		return;
	};
	if(!Npc_IsPlayer(other) && (other.aivar[AIV_ATTACKREASON] == AR_NONE))
	{
		B_Attack(self,other,AR_NONE,0);
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_MELEE) || Npc_IsInFightMode(other,FMODE_FIST) || Npc_IsInFightMode(other,FMODE_NONE))
	{
		if(Npc_IsPlayer(other) && ((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (self.npcType == NPCTYPE_FRIEND)))
		{
			if(!Npc_IsInState(self,ZS_ReactToDamage))
			{
				Npc_ClearAIQueue(self);
				B_ClearPerceptions(self);
				AI_StartState(self,ZS_ReactToDamage,0,"");
				return;
			};
		};
	};
	if(Npc_IsPlayer(other) && (self.guild <= GIL_SEPERATOR_HUM))
	{
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	};

	B_Attack(self,other,AR_ReactToDamage,0);
};


var int VictimCount;
var int VictimLevel;
var int ThiefLevel;
const int ThiefXP = 50;

func void B_GiveThiefXP()
{
	VictimCount = VictimCount + 1;

	if(VictimLevel == 0)
	{
		VictimLevel = 2;
	};
	if(VictimCount >= VictimLevel)
	{
		ThiefLevel = ThiefLevel + 1;
		VictimLevel = VictimCount + ThiefLevel;
	};

	B_GivePlayerXP(100);
};

func void B_ResetThiefLevel()
{
	if(VictimCount > ThiefLevel)
	{
		VictimCount = VictimCount - 1;
	};
};

func void B_CatchThief()
{
	self.vars[0] = TRUE;
	bThiefXP = FALSE;
	CanTakeXP = FALSE;
	THIEFCATCHER = Hlp_GetNpc(self);
	HERO_CANESCAPEFROMGOTCHA = TRUE;
	B_ResetThiefLevel();
	return;
};