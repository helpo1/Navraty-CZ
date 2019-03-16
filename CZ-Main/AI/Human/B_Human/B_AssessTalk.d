
func void B_AssessTalk()
{
	var int rnd;

	if(Npc_IsPlayer(other) && (HEROTRANS == TRUE))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (CamModeOn == TRUE))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (PlayerSitDust == TRUE))
	{
		AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
		PlayerSitDust = FALSE;
		WhistleCount = FALSE;
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
	if(Npc_IsPlayer(other) && (self.guild <= GIL_SEPERATOR_HUM) && (Npc_HasEquippedArmor(other) == FALSE) && (self.npcType != NPCTYPE_FRIEND) && (self.guild != GIL_DMT) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.aivar[AIV_NpcStartedTalk] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_CommentNakedHero,1,"");
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_250_Garond)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_Talk,0,"");
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_9158_VARUS)))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_Talk,0,"");
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) && (HaniarCantTalk == TRUE) && (HaniarFinalTalk == FALSE))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) && (HaniarCantTalk == TRUE) && (HaniarFinalTalk == TRUE))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);

		if(C_BodyStateContains(self,BS_SIT))
		{
			if(self.aivar[AIV_NpcStartedTalk] == TRUE)
			{
				AI_StandupQuick(other);
			}
			else
			{
				AI_Standup(other);
			};

			if(Npc_CanSeeNpc(self,other))
			{
				AI_StartState(self,ZS_Talk,0,"");
			}
			else
			{
				if(Npc_IsInState(self,ZS_ObservePlayer))
				{
					AI_Standup(self);
				};

				AI_StartState(self,ZS_Talk,1,"");
			};

			return;
		}
		else
		{
			if(self.aivar[AIV_NpcStartedTalk] == TRUE)
			{
				AI_StandupQuick(self);
				AI_StandupQuick(other);
			}
			else
			{
				AI_Standup(self);
				AI_Standup(other);
			};

			AI_StartState(self,ZS_Talk,0,"");
			return;
		};
	};
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		if(Npc_CheckInfo(self,1) == FALSE)
		{
			if(Npc_CheckInfo(self,0) == FALSE)
			{
				return;
			};
		};
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(B_AssessEnemy())
		{
			return;
		};
		if((B_GetPlayerCrime(self) == CRIME_MURDER) && C_WantToAttackMurder(self,other))
		{
			B_Attack(self,other,AR_HumanMurderedHuman,0);
			return;
		};
		if((C_PlayerIsFakeBandit(self,other) == TRUE) && (self.guild != GIL_BDT))
		{
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};
		if(C_RefuseTalk(self,other))
		{
			if(C_PlayerHasFakeGuild(self,other))
			{
				Npc_ClearAIQueue(self);
				AI_StartState(self,ZS_CommentFakeGuild,1,"");
				return;
			}
			else
			{
				B_Say(self,other,"$NOTNOW");
				return;
			};
		};
	};
	if(self.aivar[AIV_NpcStartedTalk] == FALSE)
	{
		if(C_BodyStateContains(self,BS_WALK) || C_BodyStateContains(self,BS_RUN))
		{
			B_Say(other,self,"$SC_HEYWAITASECOND");
		}
		else if(!Npc_CanSeeNpc(self,other))
		{
			if((self.guild != GIL_KDW) && (self.guild != GIL_KDF) && (self.guild != GIL_KDM) && (self.guild != GIL_PAL) && (self.guild != GIL_GUR) && (self.flags != NPC_FLAG_IMMORTAL) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_100_Xardas)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(NONE_102_Kreol)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ass_128_Nrozas)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ass_127_Osair)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ass_126_Haniar)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ass_125_Tiamant)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(BAU_980_Sagitta)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(SLD_10921_Loa_ADW)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(SLD_10920_Loa)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PIR_6136_ABIGEIL)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PIR_61360_ABIGEIL)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_414_Hanna)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PIR_1397_ADDON_INEXTREMO_CHARLOTTE)))
			{
				rnd = Hlp_Random(100);

				if(rnd <= 25)
				{
					B_Say(other,self,"$SC_HEYTURNAROUND");
				}
				else if(rnd <= 50)
				{
					B_Say(other,self,"$SC_HEYTURNAROUND02");
				}
				else if(rnd <= 75)
				{
					B_Say(other,self,"$SC_HEYTURNAROUND03");
				}
				else if(rnd <= 99)
				{
					B_Say(other,self,"$SC_HEYTURNAROUND04");
				};
			}
			else
			{
				B_Say(other,self,"$SC_HEYTURNAROUND05");
			};
		};
	};

	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);

	if(C_BodyStateContains(self,BS_SIT))
	{
		if(self.aivar[AIV_NpcStartedTalk] == TRUE)
		{
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(other);
		};
		if(Npc_CanSeeNpc(self,other))
		{
			AI_StartState(self,ZS_Talk,0,"");
		}
		else
		{
			if(Npc_IsInState(self,ZS_ObservePlayer))
			{
				AI_Standup(self);
			};

			AI_StartState(self,ZS_Talk,1,"");
		};

		return;
	}
	else
	{
		if(self.aivar[AIV_NpcStartedTalk] == TRUE)
		{
			AI_StandupQuick(self);
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(self);
			AI_Standup(other);
		};

		AI_StartState(self,ZS_Talk,0,"");
		return;
	};

	AI_StartState(self,ZS_Talk,0,"");
};

