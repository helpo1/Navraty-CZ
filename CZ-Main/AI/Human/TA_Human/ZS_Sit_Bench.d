
func void ZS_Sit_Bench()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4350_Priscila))
	{
		if(Npc_HasItems(self,itmi_sonjawig) == 0)
		{
			CreateInvItem(self,itmi_sonjawig);
			AI_EquipArmor(self,itmi_sonjawig);
		};		
	};
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);

		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Sit_Bench_Loop()
{
	var int random;
	var int randsit;

	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"BENCH",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_SIT) && (self.aivar[AIV_TAPOSITION] == NOTINPOS))
	{
		if((self.guild != GIL_GUR) && (self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_KDM) && (self.guild != GIL_DMT) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_4350_Priscila)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(BAU_980_Sagitta)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_4570_Avabul)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_5570_Avabul)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_414_Hanna)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_435_Nadja)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_436_Sonja)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(SLD_10920_Loa)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PIR_6136_ABIGEIL)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(PIR_61360_ABIGEIL)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_447_Cassia)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_471_Edda)))
		{
			Mdl_RemoveOverlayMds(self,"Humans_Arr.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rel.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Trd.mds");
			randsit = Hlp_Random(4);

			if(randsit == 0)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Arr.mds");
			}
			else if(randsit == 1)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rel.mds");
			}		
			else if(randsit == 2)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Trd.mds");
			};
		};

		AI_StandupQuick(self);

		if(Wld_IsMobAvailable(self,"BENCH") == TRUE)
		{
			AI_UseMob(self,"BENCH",1);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		}
		else
		{
			AI_Standup(self);
			AI_PlayAni(self,"T_STAND_2_LGUARD");
			self.aivar[AIV_TAPOSITION] = NOTINPOS_STAND;
		};
	};
	if(C_BodyStateContains(self,BS_SIT) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (Npc_GetStateTime(self) > 5))
	{
		random = Hlp_Random(20);

		if(random == 0)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_1",BS_SIT);

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"CLEARTHROAT");
			};
		};
		if(random == 1)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_2",BS_SIT);

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		};
		if(random == 2)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_3",BS_SIT);

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"COUGH");
			};
		};
		if(random == 3)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_4",BS_SIT);

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"YAWN");
			};
		};

		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sit_Bench_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS_STAND)
	{
		AI_PlayAni(self,"T_LGUARD_2_STAND");
	};
	if(C_BodyStateContains(self,BS_SIT) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		AI_UseMob(self,"BENCH",-1);
	};

	Mdl_RemoveOverlayMds(self,"Humans_Arr.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rel.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Trd.mds");
};