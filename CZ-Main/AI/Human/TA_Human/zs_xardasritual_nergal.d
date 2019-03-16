
func void zs_xardasritual_nergal()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSTALK);
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int zs_xardasritual_nergal_loop()
{
	var int guardreaktion;

	B_CheckHealth(self);

	if(XARDASFINISHRITUAL == FALSE)
	{
		if(Npc_IsOnFP(self,"SMALLTALK"))
		{
			if(Npc_GetStateTime(self) >= 10)
			{
				Npc_PerceiveAll(self);
				if(Wld_DetectNpc(self,-1,zs_xardasritual_xardas,-1))
				{
					guardreaktion = Hlp_Random(1000);
					B_TurnToNpc(self,other);
					B_Say_Smalltalk();
					if(guardreaktion >= 900)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_11");
					}
					else if(guardreaktion >= 800)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_15");
					}
					else if(guardreaktion >= 700)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_16");
					}
					else if(guardreaktion >= 600)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_18");
					}
					else if(guardreaktion >= 500)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_21");
					}
					else if(guardreaktion >= 400)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_20");
					};
					AI_Wait(self,1);
					Npc_SetStateTime(self,0);
					return LOOP_CONTINUE;
				};
			};
		}
		else if(Wld_IsFPAvailable(self,"SMALLTALK"))
		{
			AI_GotoFP(self,"SMALLTALK");
			AI_Standup(self);
			AI_AlignToFP(self);
			return LOOP_CONTINUE;
		};
	}
	else if(Npc_GetStateTime(self) >= 1)
	{
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Snd_Play("ZOM_DIE");
		AI_Wait(self,2);
		AI_Teleport(self,"TOT");
		NERGALSOULAWAY = TRUE;
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_xardasritual_nergal_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};