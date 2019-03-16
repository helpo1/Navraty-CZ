
func void B_AssessPlayer()
{
	var C_Npc pcl;
	var int daynowall;
	var C_Npc her;
	var int zufalz;
	var int zufaly;

	pcl = Hlp_GetNpc(PC_Levelinspektor);
	daynowall = Wld_GetDay();
	zufalz = Hlp_Random(100);

	if(Npc_IsPlayer(other) && (self.vars[0] == TRUE) && (Npc_IsInState(self,ZS_Sleep) == FALSE) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG))
	{
		B_AssignTalkChief(self);
		self.aivar[AIV_NpcStartedTalk] = TRUE;
		B_AssessTalk();
		return;
	};
	if((self.guild == GIL_KDM) && (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(DMT_2200_DarkSpeaker)))
	{
		return;
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return;
	};
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if(C_NpcIsDown(other))
	{
		return;
	};
	if(Npc_IsInState(self,ZS_Sleep) && C_BodyStateContains(other,BS_SNEAK))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Kapitel < 5) && (KAPITELORCATC == FALSE) && ((Npc_GetDistToWP(other,"SHIP_DECK_15") <= 1200) || (Npc_GetDistToWP(other,"SHIP_DECK_24") <= 1200) || (Npc_GetDistToWP(hero,"SHIP_DECK_17") <= 1200)) && ((self.guild == GIL_KDF) || (self.guild == GIL_PAL)))
	{
		if((MIS_ShipIsFree == FALSE) && (Npc_IsInState(self,ZS_Stand_Plaz) == FALSE))
		{
			if((Npc_CanSeeNpc(self,other) == TRUE) && !C_NpcIsDown(other))
			{
				B_Attack(self,other,AR_GuardCalledToKill,0);
				return;
			};
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_310_Stadtwache)) && (Npc_GetDistToNpc(self,hero) <= 600))
	{
		if(!Npc_IsInState(self,ZS_ObservePlayer))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_ObservePlayer,1,"");
			return;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mil_333_Stadtwache)) && (Npc_GetDistToNpc(self,hero) <= 600))
	{
		if(!Npc_IsInState(self,ZS_ObservePlayer))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_ObservePlayer,1,"");
			return;
		};
	};
	if((Npc_GetDistToWP(hero,"NW_CITY_ENTRANCE_MAIN") < 700) && !(Npc_IsInFightMode(hero,FMODE_NONE) || Npc_IsInFightMode(hero,FMODE_MAGIC)) && (CITYGATEACCESSGRANTED == FALSE))
	{
		AI_RemoveWeapon(hero);
		AI_UnreadySpell(hero);
	};
	if((Npc_GetDistToWP(hero,"NW_CITY_ENTRANCE_BACK") < 500) && !(Npc_IsInFightMode(hero,FMODE_NONE) || Npc_IsInFightMode(hero,FMODE_MAGIC)) && (CITYGATEACCESSGRANTED == FALSE))
	{
		AI_RemoveWeapon(hero);
		AI_UnreadySpell(hero);
	};
	if((Npc_GetDistToWP(hero,"NW_CITY_UPTOWN_GUARD_MIDDLE") < 500) && !(Npc_IsInFightMode(hero,FMODE_NONE) || Npc_IsInFightMode(hero,FMODE_MAGIC)) && (HIGHCITYGATEACCESSGRANTED == FALSE))
	{
		AI_RemoveWeapon(hero);
		AI_UnreadySpell(hero);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_507_Talamon)) && (Kapitel < 6) && (Npc_GetDistToWP(self,"NW_MONASTERY_CELLAR_15") < 700) && !(Npc_IsInFightMode(hero,FMODE_NONE) || Npc_IsInFightMode(hero,FMODE_MAGIC)))
	{
		AI_RemoveWeapon(hero);
		AI_UnreadySpell(hero);
	};
	if((PRESTARTBIGBATTLE == TRUE) && (STARTBIGBATTLE == FALSE) && (other.guild == GIL_ORC) && (Npc_GetDistToWP(self,"BIGFIGHT") < 5000))
	{
		return;
	};
	if((STARTBIGBATTLE == TRUE) && (CANATTACKBIGBATTLE == FALSE) && (other.guild == GIL_ORC))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_801_Torlof)) && (TORLOFCAPTURED == TRUE) && (TORLOFISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DJG_705_Angar_NW)) && (ANGARCAPTURED == TRUE) && (ANGARISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf)) && (WOLFCAPTURED == TRUE) && (WOLFISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_449_Lares)) && (LARESCAPTURED == TRUE) && (LARESISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pal_207_Girion)) && (GIRIONCAPTURED == TRUE) && (GIRIONISFREE == FALSE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_809_Bennet)) && (BENNETCAPTURED == TRUE) && (BENNETISFREE == FALSE))
	{
		return;
	};
	if((SAFEFLAGPALADIN == TRUE) && (PALADINAWAYORC == FALSE))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_250_Garond)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_251_Oric)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_252_Parcival)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_268_Udar)))
		{
			return;
		};
	};
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		if(C_NpcIsGateGuard(self))
		{
			AI_StandupQuick(self);
			B_Attack(self,other,AR_MonsterCloseToGate,0);
			return;
		}
		else if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
		{
			if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.npcType != NPCTYPE_FRIEND))
			{
				B_Attack(self,other,AR_GuildEnemy,0);
				return;
			};
		};
	};
	if(B_AssessEnemy())
	{
		return;
	};
	if(C_PlayerIsFakeBandit(self,other) && (self.guild != GIL_BDT))
	{
		B_Attack(self,other,AR_GuildEnemy,0);
	};
	if(C_PlayerIsFakePirate(self,other) && (self.guild != GIL_PIR))
	{
		B_Attack(self,other,AR_GuildEnemy,0);
	};
	if((B_GetPlayerCrime(self) == CRIME_MURDER) && C_WantToAttackMurder(self,other) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
	{
		B_Attack(self,other,AR_HumanMurderedHuman,0);
		return;
	};
	if(C_BodyStateContains(other,BS_SNEAK))
	{
		if(!Npc_IsInState(self,ZS_ObservePlayer) && C_WantToReactToSneaker(self,other))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_ObservePlayer,1,"");
			return;
		};
	}
	else if(!C_BodyStateContains(other,BS_STAND))
	{
		Player_SneakerComment = FALSE;
	};
	if(B_AssessEnterRoom())
	{
		return;
	};
	if(B_AssessDrawWeapon())
	{
		return;
	}
	else
	{
		Player_DrawWeaponComment = FALSE;
	};
	if(!C_BodyStateContains(other,BS_LIE))
	{
		Player_GetOutOfMyBedComment = FALSE;
	};
	if(Npc_IsPlayer(other) && Npc_CheckInfo(self,1) && ((HEROTRANS == TRUE) || (CamModeOn == TRUE)))
	{
		return;
	};

	B_AssignDementorTalk(self);

	if((Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) && Npc_CheckInfo(self,1))
	{
		if(Mount_Up == FALSE)
		{
			if(C_NpcIsGateGuard(self))
			{
				self.aivar[AIV_NpcStartedTalk] = TRUE;
				B_AssessTalk();
				return;
			}
			else if(!C_BodyStateContains(other,BS_FALL) && !C_BodyStateContains(other,BS_SWIM) && !C_BodyStateContains(other,BS_DIVE) && (B_GetPlayerCrime(self) == CRIME_NONE) && (C_RefuseTalk(self,other) == FALSE) && (C_PlayerHasFakeGuild(self,other) == FALSE))
			{
				self.aivar[AIV_NpcStartedTalk] = TRUE;
				B_AssessTalk();
				return;
			};
		};
	};
	if((Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (zufalz <= 5) && (Npc_RefuseTalk(other) == FALSE) && (self.guild != GIL_DMT) && !C_NpcIsGateGuard(self) && (C_PlayerHasFakeGuild(self,other) == FALSE) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_10920_Loa)) && (IS_INEXTREMO_LOA_PLAYING == TRUE) && (ConcertLoaBonus == FALSE))
		{
			return;
		}
		else
		{
			B_LookAtNpc(self,other);
			B_Say_GuildGreetings(self,other);
			B_StopLookAt(self);
			Npc_SetRefuseTalk(other,20);
		};
	};
	if(C_NpcIsGateGuard(self) && (Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG))
	{
		self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	};
	if(Npc_IsPlayer(other) && (KAPITELORCATC == FALSE) && !C_NpcIsGateGuard(self) && !Npc_CheckInfo(self,1) && (Npc_IsInState(self,ZS_ObservePlayer) == FALSE) && (Npc_GetDistToNpc(self,other) < 500) && ((self.guild == GIL_PAL) || (self.guild == GIL_MIL)))
	{
		if(hero.guild == GIL_SLD)
		{
			AI_StartState(self,ZS_ObservePlayer,1,"");
			return;
		};
	}
	else if(Npc_IsPlayer(other) && (KAPITELORCATC == FALSE) && !C_NpcIsGateGuard(self) && !Npc_CheckInfo(self,1) && (Npc_IsInState(self,ZS_ObservePlayer) == FALSE) && (Npc_GetDistToNpc(self,other) < 500) && ((self.guild == GIL_KDF) || (self.guild == GIL_PAL) || (self.guild == GIL_MIL)))
	{
		if(hero.guild == GIL_KDM)
		{
			AI_StartState(self,ZS_ObservePlayer,1,"");
			return;
		};
	}
	else if(Npc_IsPlayer(other) && (KAPITELORCATC == FALSE) && !C_NpcIsGateGuard(self) && !Npc_CheckInfo(self,1) && (Npc_IsInState(self,ZS_ObservePlayer) == FALSE) && (Npc_GetDistToNpc(self,other) < 500) && (self.guild == GIL_SLD))
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_StartState(self,ZS_ObservePlayer,1,"");
			return;
		};
	};
};