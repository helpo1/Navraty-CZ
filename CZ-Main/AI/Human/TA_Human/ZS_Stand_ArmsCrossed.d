
func void ZS_Stand_ArmsCrossed()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_DeSynchronize();

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_4571_Jan))
	{
		if(Npc_HasItems(self,ItAr_Helm_Janus) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Janus);
			AI_EquipArmor(self,ItAr_Helm_Janus);
		};		
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1398_addon_inextremo_announcer))
	{
		if((Npc_GetDistToWP(self,"NW_TAVERNE_KILLER") < 500) && (CheckGillianTaverne == TRUE))
		{
			if(Npc_HasItems(self,itar_asmal) == 0)
			{
				CreateInvItem(self,itar_asmal);
				AI_EquipArmor(self,itar_asmal);
			}
			else
			{
				AI_EquipArmor(self,itar_asmal);
			};		

			CheckGillianTaverne = FALSE;
		};
	};
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_ArmsCrossed_loop()
{
	var int random;
	var int Eventrandy;
	var int zufall;

	B_CheckHealth(self);

	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_Standup(self);
		AI_PlayAni(self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;

		if((IS_INEXTREMO_LOA_PLAYING == TRUE) && (ConcertLoaBonus == FALSE) && (Npc_GetDistToWP(self,"NW_BIGFARM_CAMPON_PSI_GURU_04") <= 1000))
		{
			B_LookAtNpc(self,SLD_10920_Loa);
		};
	};
	if((Npc_GetStateTime(self) > 10) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (self.flags != NPC_FLAG_IMMORTAL) && (self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR) && (self.guild != GIL_KDM) && (self.aivar[AIV_MagicUser] != MAGIC_ALWAYS))
	{
		random = Hlp_Random(11);

		if((IS_INEXTREMO_LOA_PLAYING == TRUE) && (ConcertLoaBonus == FALSE) && (Npc_GetDistToWP(self,"NW_BIGFARM_CAMPON_PSI_GURU_04") <= 1000))
		{
			zufall = Hlp_Random(100);

			if(zufall >= 50)
			{
				B_TurnToNpc(self,SLD_10920_Loa);
				B_LookAtNpc(self,SLD_10920_Loa);
				Snd_Play3d(self,"AMB_WHISLE_01");
				AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
				return LOOP_END;
			};
		};
		if(random == 0)
		{
			AI_PlayAni(self,"T_LGUARD_SCRATCH");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"CLEARTHROAT");
			};
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_LGUARD_STRETCH");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"T_LGUARD_CHANGELEG");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"COUGH");
			};
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"YAWN");
			};
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_PERCEPTION");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"COUGH");
			};
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_BORINGKICK");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_SEARCH");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"R_LEGSHAKE");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"COUGH");
			};
		}
		else if(random == 8)
		{
			AI_PlayAni(self,"R_SCRATCHLSHOULDER");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		}
		else if(random == 9)
		{
			AI_PlayAni(self,"R_SCRATCHEGG");
		}
		else if(random == 10)
		{
			AI_PlayAni(self,"R_SCRATCHHEAD");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"YAWN");
			};
		};

		Eventrandy = Hlp_Random(200);

		if((Eventrandy == 1) && (CurrentLevel == ADDONWORLD_ZEN) && (RavenIsDead == FALSE) && (self.guild != GIL_PIR))
		{
			b_event_portal_earthquake();
		};

		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_ArmsCrossed_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_LGUARD_2_STAND");
};