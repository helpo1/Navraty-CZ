/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(2x) CZ_Settings_Diff_XPMult - falešná konstanta nahrazena upravitelnou proměnnou (na žádost hráčů)

*/



func void ZS_Unconscious()
{
	var int permvaluexp;

	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	b_staminainvent();

	if(self.aivar[93] == FALSE)
	{
		if(self.guild <= GIL_SEPERATOR_HUM)
		{
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			self.aivar[AIV_MM_RoamEnd] = FALSE;
			Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
			Ext_RemoveFromSlot(self,"BIP01 L HAND");
			Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));
		};
	};
	Npc_RemoveInvItems(self,ItSl_GoldPocket_None,Npc_HasItems(self,ItSl_GoldPocket_None));
	Npc_RemoveInvItems(self,ItSl_GoldPocket_Low,Npc_HasItems(self,ItSl_GoldPocket_Low));
	Npc_RemoveInvItems(self,ItSl_GoldPocket_Medium,Npc_HasItems(self,ItSl_GoldPocket_Medium));
	Npc_RemoveInvItems(self,ItSl_GoldPocket_Full,Npc_HasItems(self,ItSl_GoldPocket_Full));
	Npc_RemoveInvItems(self,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1077_Addon_Bandit)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_709_Rethon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1070_Addon_Paul)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_315_Kasernenwache)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_453_Buerger)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1095_Addon_Crimson)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_714_Jan)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_314_Mortis)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sek_8013_joru)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sek_8009_viran)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet_DI)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld_809_bennet_li)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_412_Harad)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_461_Carl)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4106_Dobar)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4107_Parlaf)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4100_Brutus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_457_Brian)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1099_Addon_Huno)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(xbs_7513_darrion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_908_Hodges)))
	{
		Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
		Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
		Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
		Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	};

	if(C_BodyStateContains(self,BS_SWIM) || C_BodyStateContains(self,BS_DIVE))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_Dead,0,"");
		return;
	};

	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);

	if(self.aivar[AIV_MM_WuselEnd] == FALSE)
	{
		if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MIL_311_Andre)))
		{
			Npc_RemoveInvItems(self,ItMi_Feder,Npc_HasItems(self,ItMi_Feder));
		};
		if(Npc_IsPlayer(other) && (LoaAntiBonus == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_10920_Loa)))
		{
			LoaAntiBonus = TRUE;
		};
		if(Npc_HasItems(self,ItMw_1h_Sld_Sword) >= 1)
		{
			Npc_RemoveInvItems(self,ItMw_1h_Sld_Sword,Npc_HasItems(self,ItMw_1h_Sld_Sword));
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_930_Sekob)) && (self.aivar[AIV_ToughGuy] == TRUE))
		{
			self.aivar[AIV_ToughGuy] = FALSE;
		};
		if(Npc_IsPlayer(other) && (Fight_Olaf_Now == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_660_Olaf)))
		{
			FightCurrentWin = TRUE;
			FightCurrentLost = FALSE;
			Fight_Olaf_Now = FALSE;
			Fight_Olaf = FALSE;
			OlafWin = TRUE;
			B_StartOtherRoutine(VLK_663_Valgard,"Start");
			B_StartOtherRoutine(VLK_660_Olaf,"Start");
			B_StartOtherRoutine(VLK_662_Bram,"Start");
			B_StartOtherRoutine(VLK_661_Graden,"Start");
		}
		else if(Npc_IsPlayer(self) && (Fight_Olaf_Now == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_660_Olaf)))
		{
			FightCurrentWin = FALSE;
			FightCurrentLost = TRUE;
			Fight_Olaf_Now = FALSE;
			Fight_Olaf = FALSE;
			Snd_Play3d(hero,"YOULOST");
			B_StartOtherRoutine(VLK_663_Valgard,"Start");
			B_StartOtherRoutine(VLK_660_Olaf,"Start");
			B_StartOtherRoutine(VLK_662_Bram,"Start");
			B_StartOtherRoutine(VLK_661_Graden,"Start");
		};
		if(Npc_IsPlayer(other) && (Fight_Graden_Now == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_661_Graden)))
		{
			FightCurrentWin = TRUE;
			FightCurrentLost = FALSE;
			Fight_Graden_Now = FALSE;
			Fight_Graden = FALSE;
			GradenWin = TRUE;
			B_StartOtherRoutine(VLK_663_Valgard,"Start");
			B_StartOtherRoutine(VLK_660_Olaf,"Start");
			B_StartOtherRoutine(VLK_662_Bram,"Start");
			B_StartOtherRoutine(VLK_661_Graden,"Start");
		}
		else if(Npc_IsPlayer(self) && (Fight_Graden_Now == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_661_Graden)))
		{
			FightCurrentWin = FALSE;
			FightCurrentLost = TRUE;
			Fight_Graden_Now = FALSE;
			Fight_Graden = FALSE;
			Snd_Play3d(hero,"YOULOST");
			B_StartOtherRoutine(VLK_663_Valgard,"Start");
			B_StartOtherRoutine(VLK_660_Olaf,"Start");
			B_StartOtherRoutine(VLK_662_Bram,"Start");
			B_StartOtherRoutine(VLK_661_Graden,"Start");
		};
		if(Npc_IsPlayer(other) && (Fight_Bram_Now == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_662_Bram)))
		{
			FightCurrentWin = TRUE;
			FightCurrentLost = FALSE;
			Fight_Bram_Now = FALSE;
			Fight_Bram = FALSE;
			BramWin = TRUE;
			B_StartOtherRoutine(VLK_663_Valgard,"Start");
			B_StartOtherRoutine(VLK_660_Olaf,"Start");
			B_StartOtherRoutine(VLK_662_Bram,"Start");
			B_StartOtherRoutine(VLK_661_Graden,"Start");
		}
		else if(Npc_IsPlayer(self) && (Fight_Bram_Now == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_662_Bram)))
		{
			FightCurrentWin = FALSE;
			FightCurrentLost = TRUE;
			Fight_Bram_Now = FALSE;
			Fight_Bram = FALSE;
			Snd_Play3d(hero,"YOULOST");
			B_StartOtherRoutine(VLK_663_Valgard,"Start");
			B_StartOtherRoutine(VLK_660_Olaf,"Start");
			B_StartOtherRoutine(VLK_662_Bram,"Start");
			B_StartOtherRoutine(VLK_661_Graden,"Start");
		};	
		if(Npc_IsPlayer(other) && (Fight_Valgard_Now == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_663_Valgard)))
		{
			FightCurrentWin = TRUE;
			FightCurrentLost = FALSE;
			Fight_Valgard_Now = FALSE;
			Fight_Valgard = FALSE;
			ValgardWin = TRUE;
			B_StartOtherRoutine(VLK_663_Valgard,"Start");
			B_StartOtherRoutine(VLK_660_Olaf,"Start");
			B_StartOtherRoutine(VLK_662_Bram,"Start");
			B_StartOtherRoutine(VLK_661_Graden,"Start");
		}
		else if(Npc_IsPlayer(self) && (Fight_Valgard_Now == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_663_Valgard)))
		{
			FightCurrentWin = FALSE;
			FightCurrentLost = TRUE;
			Fight_Valgard_Now = FALSE;
			Fight_Valgard = FALSE;
			Snd_Play3d(hero,"YOULOST");
			B_StartOtherRoutine(VLK_663_Valgard,"Start");
			B_StartOtherRoutine(VLK_660_Olaf,"Start");
			B_StartOtherRoutine(VLK_662_Bram,"Start");
			B_StartOtherRoutine(VLK_661_Graden,"Start");
		};
		if(Npc_IsPlayer(other) && (DagragIsFight == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_01_Won = TRUE;
			DagragIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Porazil jsem Dagraga!");
			B_StartOtherRoutine(self,"Start");
		}
		else if(Npc_IsPlayer(self) && (DagragIsFight == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8147_Dagrag)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_01_Lost = TRUE;
			DagragIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Prohrál jsem s Dagragem.");
			B_StartOtherRoutine(other,"Start");
		};
		if(Npc_IsPlayer(other) && (GunnokIsFight == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_02_Won = TRUE;
			GunnokIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Porazil jsem Gunnoka!");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(self,"Start");
		}
		else if(Npc_IsPlayer(self) && (GunnokIsFight == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8148_Gunnok)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_02_Lost = TRUE;
			GunnokIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Prohrál jsem s Gunnokem.");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(other,"Start");
		};
		if(Npc_IsPlayer(other) && (TurukIsFight == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_03_Won = TRUE;
			TurukIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Porazil jsem Turuka!");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(self,"Start");
		}
		else if(Npc_IsPlayer(self) && (TurukIsFight == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8149_Turuk)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_03_Lost = TRUE;
			TurukIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Prohrál jsem s Turukem.");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(other,"Start");
		};	
		if(Npc_IsPlayer(other) && (HartIsFight == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_04_Won = TRUE;
			HartIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Porazil jsem Harta!");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(self,"Start");
		}
		else if(Npc_IsPlayer(self) && (HartIsFight == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8146_Hart)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_04_Lost = TRUE;
			HartIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Prohrál jsem s Hartem.");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(other,"Start");
		};
		if(Npc_IsPlayer(other) && (UrTrokIsFight == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_05_Won = TRUE;
			UrTrokIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Porazil jsem Ur Troka!");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(self,"Start");
		}
		else if(Npc_IsPlayer(self) && (UrTrokIsFight == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8150_UrTrok)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_05_Lost = TRUE;
			UrTrokIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Prohrál jsem s Ur Trokem.");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(other,"Start");
		};
		if(Npc_IsPlayer(other) && (UmrakIsFight == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_06_Won = TRUE;
			UmrakIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Porazil jsem Umraka!");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(self,"Start");
		}
		else if(Npc_IsPlayer(self) && (UmrakIsFight == TRUE) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STRF_8151_Umrak)))
		{
			Wld_SendTrigger("EVT_ORCARENA_01");
			ArenaBattle_06_Lost = TRUE;
			UmrakIsFight = FALSE;
			B_LogEntry(TOPIC_OrcArena,"Prohrál jsem s Umrakem.");
			Print("Raději bych si měl opět nasadit Ulu-Mulu...");
			B_StartOtherRoutine(other,"Start");
		};
		if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_432_Moe)))
		{
			MOEISBEATEN = TRUE;
		};	
		if((MIS_MOEBORED == LOG_Running) && (MOEATTACKME == TRUE) && Npc_IsPlayer(self) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_432_Moe)))
		{
			B_LogEntry(TOPIC_MOEBORED,"K mému zármutku mě Moe stejně porazil! Od teď bude nejspíše marné hledat u Kardifa nějakou práci.");
			MOEBEATME = TRUE;
		};
		if((MIS_Fester_KillBugs == LOG_Running) && (Fester_FightVerarscht == TRUE))
		{
			if(Npc_IsPlayer(self) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Sld_816_Fester)))
			{
				B_LogEntry_Failed(TOPIC_FesterRauber);
				MIS_Fester_KillBugs = LOG_FAILED;
			};
			if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sld_816_Fester)))
			{
				B_LogEntry(TOPIC_FesterRauber,"Porazil jsem Festera! Teď už snad bude vědět, že se se mnou nemá zahrávat.");
				Log_SetTopicStatus(TOPIC_FesterRauber,LOG_SUCCESS);
				MIS_Fester_KillBugs = LOG_SUCCESS;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_989_reinar))
		{
			B_CreateAmbientInv(self);

			if(Npc_IsPlayer(other))
			{
				REINARPISSOFF = TRUE;
			};
		};
		if(Npc_IsPlayer(self) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(xor_12206_warriornature)))
		{
			if(PERMTESTHARADRIMNOTE == FALSE)
			{
				B_LogEntry(TOPIC_GUARDIANS,"K mé velké lítosti jsem nedokázal Asgarda v čestném boji porazit. Zřejmě bych se měl příště lépe připravit!");
				PERMTESTHARADRIMNOTE = TRUE;
			};
		};
		if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(xor_12206_warriornature)) && (TARINAKSBATTLEWIN == FALSE))
		{
			self.flags = NPC_FLAG_IMMORTAL;
			B_LogEntry(TOPIC_GUARDIANS,"Podařilo se mi porazit Asgarda v čestném boji. Teď se musím vrátit k mistru Tarinaksovi a říct mu o tom!");
			TARINAKSBATTLEWIN = TRUE;
			CHALANGEHARADRIMSTART = FALSE;
		};
		if((self.guild < GIL_SEPERATOR_HUM) && Npc_IsPlayer(other))
		{
			self.aivar[AIV_DefeatedByPlayer] = TRUE;
			self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
	
			if((self.aivar[AIV_LastPlayerAR] == AR_NONE) && (self.aivar[AIV_DuelLost] == FALSE) && (self.guild == GIL_SLD))
			{
				Sld_Duelle_gewonnen = Sld_Duelle_gewonnen + 1;
				self.aivar[AIV_DuelLost] = TRUE;
			};
			if(self.aivar[AIV_ArenaFight] == AF_RUNNING)
			{
				self.aivar[AIV_ArenaFight] = AF_AFTER;
			};
		};
		if(Npc_IsPlayer(self))
		{
			other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;

			if(other.aivar[AIV_ArenaFight] == AF_RUNNING)
			{
				other.aivar[AIV_ArenaFight] = AF_AFTER;
			};
		};

		B_GiveTradeInv(self);
		B_ClearRuneInv(self);

		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6027_taliasan))
		{
			B_ClearBookInv(self);
		};
		if((self.aivar[AIV_VictoryXPGiven] == FALSE) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
		{
			if(!Npc_IsPlayer(self) && (self.level > 0))
			{
				if(SBMODE == TRUE)
				{
					// permvaluexp = self.level * XP_PER_VICTORY;
					permvaluexp = self.level * CZ_Settings_Diff_XPMult;

					if(BELIARCURSEYOU == TRUE)
					{
						permvaluexp = permvaluexp / 2;
					}
					else if(!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == TRUE))
					{
						permvaluexp = permvaluexp / 2;
					};
				}
				else
				{
					// permvaluexp = self.level * XP_PER_VICTORY;
					permvaluexp = self.level * CZ_Settings_Diff_XPMult;
				};
				if(self.guild == GIL_MEATBUG)
				{
					permvaluexp = 1;
				};

				self.aivar[AIV_VictoryXPGiven] = TRUE;

				if(Npc_IsPlayer(other) && (CanBeatRodFistDo == FALSE) && (CanBeatRodFist == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sld_804_Rod)) && (Npc_IsInFightMode(other,FMODE_FIST) == TRUE))
				{
					CanBeatRodFistDo = TRUE;
				};
				if(self.aivar[90] == TRUE)
				{
					b_giveplayerxpquiet(permvaluexp);
				}
				else
				{
					B_GivePlayerXP(permvaluexp);
				};
			};
		};

		AI_UnequipWeapons(self);

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dar)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Cipher)))
		{
			Dar_LostAgainstCipher = TRUE;
		};

		self.aivar[AIV_MM_WuselEnd] = TRUE;
	};
};

func int ZS_Unconscious_Loop()
{
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak)))
	{
		return LOOP_END;
	}
	else if(Npc_GetStateTime(self) < HAI_TIME_UNCONSCIOUS)
	{
		return LOOP_CONTINUE;
	}
	else
	{
		return LOOP_END;
	};

	return LOOP_END;
};

func void ZS_Unconscious_End()
{
	b_staminainvent();
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_MM_WuselEnd] = FALSE;
	AI_Standup(self);

	if(Npc_IsPlayer(self))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Raven))
	{
		self.aivar[AIV_MagicUser] = MAGIC_ALWAYS;
		B_Attack(self,hero,AR_GuildEnemy,0);
		return;
	};
	if(Npc_CanSeeNpcFreeLOS(self,other) && (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) && (self.aivar[92] == FALSE))
	{
		B_TurnToNpc(self,other);

		if(C_NpcIsToughGuy(self) && (Npc_GetPermAttitude(self,other) != ATT_HOSTILE) && (self.npcType != NPCTYPE_FRIEND))
		{
			B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
		}
		else
		{
			B_Say(self,other,"$OHMYHEAD");
		};
	};

	Npc_PerceiveAll(self);

	if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_438_Alrik)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8151_Umrak)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8150_UrTrok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8149_Turuk)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8148_Gunnok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8147_Dagrag)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8146_Hart)))
	{
		if(Wld_DetectItem(self,ITEM_KAT_NF) == TRUE)
		{
			if(Hlp_IsValidItem(item))
			{
				if(Npc_GetDistToItem(self,item) <= 600)
				{
					if(self.aivar[AIV_MagicUser] != MAGIC_ALWAYS)
					{
						AI_TakeItem(self,item);
					};
				};
			};
		};
		if(Wld_DetectItem(self,ITEM_KAT_FF) == TRUE)
		{
			if(Hlp_IsValidItem(item))
			{
				if(Npc_GetDistToItem(self,item) <= 600)
				{
					if(self.aivar[AIV_MagicUser] != MAGIC_ALWAYS)
					{
						AI_TakeItem(self,item);
					};
				};
			};
		};
	}
	else
	{
		if(Wld_DetectItem(self,ITEM_KAT_NF) == TRUE)
		{
			if(Hlp_IsValidItem(item))
			{
				if(Npc_GetDistToItem(self,item) <= 600)
				{
					if(self.aivar[AIV_MagicUser] != MAGIC_ALWAYS)
					{
						AI_TakeItem(self,item);
					};
				};
			};
		}
		else
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag))
			{
				if(Npc_HasItems(self,ItMw_2H_OrcAxe_02) == 0)
				{
					CreateInvItems(self,ItMw_2H_OrcAxe_02,1);
				};
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart))
			{
				if(Npc_HasItems(self,ItMw_2H_OrcAxe_01) == 0)
				{
					CreateInvItems(self,ItMw_2H_OrcAxe_01,1);
				};
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok))
			{
				if(Npc_HasItems(self,ItMw_2H_OrcAxe_03) == 0)
				{
					CreateInvItems(self,ItMw_2H_OrcAxe_03,1);
				};
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk))
			{
				if(Npc_HasItems(self,ItMw_2H_OrcAxe_04) == 0)
				{
					CreateInvItems(self,ItMw_2H_OrcAxe_04,3);
				};
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok))
			{
				if(Npc_HasItems(self,ItMw_2H_OrcSword_01) == 0)
				{
					CreateInvItems(self,ItMw_2H_OrcSword_01,1);
				};
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak))
			{
				if(Npc_HasItems(self,ItMw_2H_OrcSword_02) == 0)
				{
					CreateInvItems(self,ItMw_2H_OrcSword_02,1);
				};
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_438_Alrik))
			{
				if(Npc_HasItems(self,ItMw_1h_Bau_Mace) == 0)
				{
					CreateInvItems(self,ItMw_1h_Bau_Mace,1);
				};
			};
		};
	};
	if(self.aivar[93] == TRUE)
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
		if(self.aivar[92] == TRUE)
		{
			self.aivar[92] = FALSE;
		};
	};
	if(Npc_HasEquippedMeleeWeapon(self) == FALSE)
	{
		AI_EquipBestMeleeWeapon(self);
	};
	if((Npc_HasEquippedRangedWeapon(self) == FALSE) && (self.guild <= GIL_SEPERATOR_HUM))
	{
		AI_EquipBestRangedWeapon(self);
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_StartState(self,ZS_HealSelfUnc,0,"");
	};
};

func void ZS_Rage()
{
	if(self.aivar[AIV_RageStateTime] == 0)
	{
		self.aivar[AIV_Guardpassage_Status] = GP_NONE;
		Npc_SetRefuseTalk(self,0);
		Npc_SetTempAttitude(self,Npc_GetPermAttitude(self, hero));
		B_StopLookAt(self);
		AI_StopPointAt(self);
		Npc_ClearAIQueue(self);

		if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
		{
			AI_StandUp(self);
		}
		else
		{
			AI_StandUpQuick(self);
		};

		B_ClearPerceptions(self);
		Wld_PlayEffect("spellFX_Rage_TARGET",self,self,0,0,0,0);
        
		if(self.guild < GIL_SEPERATOR_HUM)
		{
			AI_Wait(self, 0.5);
			AI_TurnToNpc(self, hero); // Achtung: Setzt voraus, dass nur Hero den Spell benutzt.
			AI_Wait(self, 0.5);
			AI_PlayAni(self, "T_GREETNOV");
			AI_Wait(self, 0.3);
		};
	};
};

func int ZS_Rage_Loop ()
{
	var int rnd;

	if(self.aivar[AIV_RageStateTime] > 0)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp(self);
		return LOOP_END;
	};

	self.aivar[AIV_RageStateTime] = self.aivar[AIV_RageStateTime] + 1;
	Npc_PerceiveAll(self);

	if(Wld_DetectNpcEx(self, -1, NOFUNC, -1, 0) == TRUE)
	{
		if(self.guild < GIL_SEPERATOR_HUM)
		{
			rnd = Hlp_Random(100);
            
			if(rnd <= 40)
			{
				Snd_Play3D(self,"SVM_1_BERZERK");
            	}
            	else if(rnd <= 80)
			{
                	Snd_Play3D(self,"SVM_2_BERZERK");
            	}
            	else if(rnd <= 99)
			{
                	Snd_Play3D(self,"SVM_3_BERZERK");
			};
		};

		Npc_SetTarget(self,other);

		if(other.guild < GIL_SEPERATOR_HUM)
		{
			B_Attack(self,other,AR_NONE,0);
        	} 
		else
		{
			AI_StartState(self,ZS_MM_Attack,0,"");
        	};
    };

    return LOOP_CONTINUE;
};

func void ZS_Rage_End() 
{
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_Dodge(self);
		AI_Dodge(self);
		AI_PlayAni(self,"T_SEARCH");
		B_Say_Overlay(self,self,"$WHATWASTHAT");
		AI_RemoveWeapon(self);
		AI_Wait(self, 1);
		AI_PlayAni(self, "T_DONTKNOW");
		AI_Wait(self, 0.5);

		if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX]/2))
		{
			AI_StartState(self,ZS_HealSelf,0,"");
			return;
		};
	};
};