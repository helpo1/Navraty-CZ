
func void ZS_Guard_Hammer()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	B_DeSynchronize();

	AI_SetWalkMode(self,NPC_WALK);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Guard_Hammer_loop()
{
	var int random;

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
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_HasItems(self,Holy_Hammer_MIS) == 1) && (Npc_GetDistToWP(self,"NW_MONASTERY_SANCTUM_01") <= 500))
	{
		Npc_RemoveInvItems(self,Holy_Hammer_MIS,1);
		Wld_InsertItem(Holy_Hammer_MIS,"FP_HAMMER");
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random(10);
		if(random == 0)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Guard_Hammer_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_HGUARD_2_STAND");
};

