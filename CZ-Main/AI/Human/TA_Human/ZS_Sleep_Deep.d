
func void ZS_GotoBed_Deep()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	AI_StartState(self,ZS_Sleep_Deep,0,"");
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func void ZS_Sleep_Deep()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessSleepTalk);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
};

func int ZS_Sleep_Deep_Loop()
{
	var int rand;

	B_CheckHealth(self);

	if(!C_BodyStateContains(self,BS_LIE))
	{
		if(Wld_IsMobAvailable(self,"BEDHIGH"))
		{
			AI_UseMob(self,"BEDHIGH",1);
		}
		else if((Player_GetOutOfMyBedComment == FALSE) && C_BodyStateContains(hero,BS_LIE) && (Npc_GetDistToNpc(self,hero) <= 500))
		{
			B_TurnToNpc(self,hero);
			B_Say(self,other,"$GETOUTOFMYBED");
			Player_GetOutOfMyBedComment = TRUE;
		};
	}
	else
	{
		rand = Hlp_Random(10);

		if(Hlp_Random(1000) <= 10)
		{
			if(rand == 0)
			{
				Snd_Play3d(self,"SNORE_01");
			}
			else if(rand == 1)
			{
				Snd_Play3d(self,"SNORE_02");
			}
			else if(rand == 2)
			{
				Snd_Play3d(self,"SNORE_03");
			}
			else if(rand == 3)
			{
				Snd_Play3d(self,"SNORE_04");
			}
			else if(rand == 4)
			{
				Snd_Play3d(self,"SNORE_05");
			}
			else if(rand == 5)
			{
				Snd_Play3d(self,"SNORE_06");
			}
			else if(rand == 6)
			{
				Snd_Play3d(self,"SNORE_07");
			}
			else if(rand == 7)
			{
				Snd_Play3d(self,"SNORE_08");
			}
			else if(rand == 8)
			{
				Snd_Play3d(self,"SNORE_09");
			}
			else if(rand == 9)
			{
				Snd_Play3d(self,"SNORE_10");
			};
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_Sleep_Deep_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(!Npc_IsInPlayersRoom(self))
	{
		B_Say(self,self,"$AWAKE");
	};
	AI_UseMob(self,"BEDHIGH",-1);
};

