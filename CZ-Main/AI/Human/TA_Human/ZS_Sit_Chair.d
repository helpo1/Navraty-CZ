
func void ZS_Sit_Chair()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Sit_Chair_Loop()
{
	var int random;
	var int randomeat;
	var int randsit;

	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			AI_UseMob(self,"CHAIR",-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(!C_BodyStateContains(self,BS_SIT))
	{
		if((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_STAND_01") <= 600) || (Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_09") <= 500) || (Npc_GetDistToWP(self,"NW_TAVERNE_IN_GRAVO") <= 500) || (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING") <= 500) || (Npc_GetDistToWP(self,"NW_CITY_TAVERN_IN_04") <= 700))
		{
			Mdl_RemoveOverlayMds(self,"Humans_Sit_Eat.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Sit_Drink.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Sit_Smoke.mds");
			randsit = Hlp_Random(100);

			if(randsit >= 70)
			{
				Mdl_RemoveOverlayMds(self,"Humans_Arr.mds");
				Mdl_RemoveOverlayMds(self,"Humans_Rel.mds");
				Mdl_RemoveOverlayMds(self,"Humans_Trd.mds");
				Mdl_ApplyOverlayMds(self,"Humans_Sit_Eat.mds");
				self.vars[4] = 1;

				if(Npc_HasItems(self,ItFoMutton) == 0)
				{
					CreateInvItems(self,ItFoMutton,1);
				};
			}
			else if(randsit >= 40)
			{
				Mdl_RemoveOverlayMds(self,"Humans_Arr.mds");
				Mdl_RemoveOverlayMds(self,"Humans_Rel.mds");
				Mdl_RemoveOverlayMds(self,"Humans_Trd.mds");
				Mdl_ApplyOverlayMds(self,"Humans_Sit_Drink.mds");
				self.vars[4] = 2;

				if(Npc_HasItems(self,ItFo_Booze) == 0)
				{
					CreateInvItems(self,ItFo_Booze,1);
				};
			}	
			else if(randsit >= 10)
			{
				Mdl_RemoveOverlayMds(self,"Humans_Arr.mds");
				Mdl_RemoveOverlayMds(self,"Humans_Rel.mds");
				Mdl_RemoveOverlayMds(self,"Humans_Trd.mds");
				Mdl_ApplyOverlayMds(self,"Humans_Sit_Smoke.mds");
				self.vars[4] = 3;

				if(Npc_HasItems(self,ItMi_Joint) == 0)
				{
					CreateInvItems(self,ItMi_Joint,1);
				};
			}
			else
			{
				self.vars[4] = 0;
			};
		};

		AI_StandupQuick(self);

		if(Wld_IsMobAvailable(self,"CHAIR") == TRUE)
		{
			AI_UseMob(self,"CHAIR",1);
		};
	};
	if(C_BodyStateContains(self,BS_SIT) && (Npc_GetStateTime(self) > 5))
	{
		if(self.vars[4] == 0)
		{
			random = Hlp_Random(10);

			if(random == 0)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_1",BS_SIT);

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"CLEARTHROAT");
				};
			}
			else if(random == 1)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_2",BS_SIT);

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"SNIFF");
				};
			}
			else if(random == 2)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_3",BS_SIT);

				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"COUGH");
				};
			}
			else if(random == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_4",BS_SIT);
	
				if(Npc_GetDistToNpc(self,hero) < 650)
				{
					Snd_Play3d(self,"YAWN");
				};
			};
		}
		else if(self.vars[4] == 1)
		{
			randomeat = Hlp_Random(4);

			if(randomeat == 1)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_7",BS_SIT);
			}
			else if(randomeat == 3)
			{				
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_8",BS_SIT);
			};
		}
		else if(self.vars[4] == 2)
		{
			randomeat = Hlp_Random(6);

			if(randomeat == 1)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_5",BS_SIT);
			}
			else if(randomeat == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_9",BS_SIT);
			}
			else if(randomeat == 5)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_10",BS_SIT);
			};
		}
		else if(self.vars[4] == 3)
		{
			randomeat = Hlp_Random(3);

			if(randomeat == 1)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_6",BS_SIT);
			};
		};

		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_Sit_Chair_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseMob(self,"CHAIR",-1);
	Mdl_RemoveOverlayMds(self,"Humans_Arr.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rel.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Trd.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Sit_Eat.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Sit_Drink.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Sit_Smoke.mds");
};