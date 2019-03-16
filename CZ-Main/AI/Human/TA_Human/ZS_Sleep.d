
func void ZS_GotoBed()
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
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_StartState(self,ZS_Sleep,0,"");
};

func void B_AssessSleepTalk()
{
	if(C_BodyStateContains(self,BS_LIE))
	{
		AI_UseMob(self,"BEDHIGH",-1);
	};

	AI_StartState(self,ZS_ObservePlayer,0,"");
};

func void ZS_Sleep()
{
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessPortalCollision);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessSleepTalk);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_CATCHTHIEF,B_AssessSleepTalk);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if((Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) && (Npc_RefuseTalk(other) == FALSE))
	{
		B_Say(self,self,"$GOTOBED");
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Sleep_Loop()
{
	var int portalguild;
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
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_01");
				};
			}
			else if(rand == 1)
			{
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_02");
				};
			}
			else if(rand == 2)
			{
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_03");
				};
			}
			else if(rand == 3)
			{
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_04");
				};
			}
			else if(rand == 4)
			{
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_05");
				};
			}
			else if(rand == 5)
			{
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_06");
				};
			}
			else if(rand == 6)
			{
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_07");
				};
			}
			else if(rand == 7)
			{
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_08");
				};
			}
			else if(rand == 8)
			{
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_09");
				};
			}
			else if(rand == 9)
			{
				if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
				{
					Snd_Play3d(self,"SNORE_10");
				};
			};
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_Sleep_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(!Npc_IsInPlayersRoom(self))
	{
		if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
		{
			B_Say(self,self,"$AWAKE");
		};
	};
	AI_UseMob(self,"BEDHIGH",-1);
};