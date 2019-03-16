
const int SMALLTALKFREQORC = 4;

func void zs_orc_smalltalk()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	}
	else
	{
		AI_AlignToWP(self);
	};
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int zs_orc_smalltalk_loop()
{
	var int random;
	B_CheckHealth(self);
	if(Npc_IsOnFP(self,"SMALLTALK"))
	{
		if(Npc_GetStateTime(self) >= (SMALLTALKFREQORC * 2))
		{
			Npc_PerceiveAll(self);
			if(Wld_DetectNpc(self,-1,zs_orc_smalltalk,-1))
			{
				if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
				{
					Npc_SetStateTime(other,SMALLTALKFREQORC);
					B_TurnToNpc(self,other);
					random = Hlp_Random(8);
					if(random == 0)
					{
						AI_PlayAniBS(self,"T_DIALOGGESTURE_01",BS_STAND);
						Snd_Play3d(self,"ORC_HAPPY01");
					}
					else if(random == 1)
					{
						AI_PlayAniBS(self,"T_DIALOGGESTURE_02",BS_STAND);
						Snd_Play3d(self,"ORC_Die_A1");
					}
					else if(random == 2)
					{
						AI_PlayAniBS(self,"T_DIALOGGESTURE_03",BS_STAND);
						Snd_Play3d(self,"ORC_Die_A2");
					}
					else if(random == 3)
					{
						AI_PlayAniBS(self,"T_DIALOGGESTURE_04",BS_STAND);
						Snd_Play3d(self,"ORC_Die_A1");
					}
					else if(random == 4)
					{
						AI_PlayAniBS(self,"T_DIALOGGESTURE_05",BS_STAND);
						Snd_Play3d(self,"ORC_Die_A2");
					}
					else if(random == 5)
					{
						AI_PlayAniBS(self,"T_DIALOGGESTURE_06",BS_STAND);
						Snd_Play3d(self,"ORC_Angry");
					}
					else if(random == 6)
					{
						AI_PlayAniBS(self,"T_DIALOGGESTURE_07",BS_STAND);
						Snd_Play3d(self,"ORC_Frightened");
					}
					else if(random == 7)
					{
						AI_PlayAniBS(self,"T_DIALOGGESTURE_08",BS_STAND);
						Snd_Play3d(self,"ORC_Angry");
					};
				};
			};
			Npc_SetStateTime(self,0);
		};
	}
	else if(Wld_IsFPAvailable(self,"SMALLTALK"))
	{
		AI_GotoFP(self,"SMALLTALK");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void zs_orc_smalltalk_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

