var int KeiraStartSong;
var int KeiraStartSong2;

func void ZS_Play_Lute()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4350_Priscila))
	{
		if(Npc_HasItems(self,itmi_sonjawig) == 0)
		{
			CreateInvItem(self,itmi_sonjawig);
			AI_EquipArmor(self,itmi_sonjawig);
		};		
	};
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItMi_Lute) == 0)
	{
		CreateInvItem(self,ItMi_Lute);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Play_Lute_Loop()
{
	var int randyface;

	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_ITEMINTERACT))
		{
			AI_UseItemToState(self,ItMi_Lute,-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
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
		AI_UseItemToState(self,ItMi_Lute,1);
		self.aivar[AIV_TAPOSITION] = ISINPOS;

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4350_Priscila)) && (PriscilaOnSc == FALSE))
		{
			PriscilaOnSc = TRUE;
		};
	};
	if((IS_INEXTREMO_LOA_PLAYING == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_811_Wolf)) && (Wld_IsTime(18,30,20,0)) && (Npc_GetDistToWP(SLD_10920_Loa,"NW_BIGFARM_CAMPON_PSI_GURU_04") <= 250) && (Npc_GetDistToWP(hero,"NW_BIGFARM_CAMPON_PSI_GURU_04") <= 650))
	{
		bManaBar = 0;
		bHealthBar = 0;
		CamModeOn = TRUE;
		Wld_SendTrigger("EVT_START_LOA");
		Snd_Play("CS_INEXTREMO_LOA");
		IS_INEXTREMO_LOA_PLAYING = TRUE;
		Npc_ModifyBodyState(hero,0,BS_MOD_CONTROLLED);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4350_Priscila)) && (KeiraStartSong == FALSE) && (AbigailPlaySong == TRUE) && (AbigailPlaySongDone == FALSE))
	{
		Npc_SetStateTime(self,0);
		KeiraStartSong = TRUE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4350_Priscila)) && (KeiraStartSong == TRUE) && (KeiraStartSong2 == FALSE) && (AbigailPlaySong == TRUE) && (AbigailPlaySongDone == FALSE) && (Npc_GetStateTime(self) >= 25))
	{
		Npc_SetStateTime(self,15);
		KeiraStartSong2 = TRUE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4350_Priscila)) && (KeiraStartSong2 == TRUE) && (AbigailPlaySong == TRUE) && (AbigailPlaySongDone == FALSE) && (Npc_GetStateTime(self) >= 15))
	{
		randyface = Hlp_Random(3);

		if(randyface == 0)
		{
			AI_LookAtNpc(self,VLK_435_Nadja);
		}
		else if(randyface == 1)
		{
			AI_LookAtNpc(self,VLK_433_Bromor);
		}			
		else if(randyface == 2)
		{
			AI_LookAtNpc(self,hero);
		};

		Mdl_ApplyRandomFaceAni(self,"VISEME",0,15,0,0,0);
		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_Play_Lute_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseItemToState(self,ItMi_Lute,-1);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4350_Priscila)) && (PriscilaOnSc == TRUE))
	{
		PriscilaOnSc = FALSE;
	};
};