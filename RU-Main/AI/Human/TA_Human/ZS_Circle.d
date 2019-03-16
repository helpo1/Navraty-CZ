
func void ZS_Circle()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	Npc_SetPercTime(self,0.3);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Circle_Loop()
{
	var int randy;
	var int randyKDW;
	var int randyKDW_Lightstar;

	B_CheckHealth(self);

	if(self.guild == GIL_DMT)
	{
		randy = Hlp_Random(3000);

		if(Npc_GetStateTime(self) > randy)
		{
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Npc_SetStateTime(self,0);

			if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13004_STONEMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13005_STONEMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13006_STONEMAGE)))
			{
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			}
			else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13007_FIREMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13008_FIREMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13009_FIREMAGE)))
			{
				Wld_PlayEffect("spellFX_INCOVATION_FIRE",self,self,0,0,0,FALSE);
			}
			else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13010_WATERMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13011_WATERMAGE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_13012_WATERMAGE)))
			{
				Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
			}
			else
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			};

			AI_PlayAni(self,"T_PRACTICEMAGIC5");
		};
	}
	else if(self.guild == GIL_KDW)
	{
		randyKDW = Hlp_Random(2500);
		randyKDW_Lightstar = Hlp_Random(2);
		if(Npc_GetStateTime(self) > randyKDW)
		{
			AI_AlignToWP(self);
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			Wld_PlayEffect("spellFX_RingRitual2",ItMi_AmbossEffekt_Addon,ItMi_AmbossEffekt_Addon,0,0,0,FALSE);
			if(randyKDW_Lightstar == 0)
			{
				Wld_PlayEffect("spellFX_RingRitual1",ItMi_AmbossEffekt_Addon,ItMi_AmbossEffekt_Addon,0,0,0,FALSE);
			}
			else if(randyKDW_Lightstar == 1)
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",ItMi_AmbossEffekt_Addon,ItMi_AmbossEffekt_Addon,0,0,0,FALSE);
			};
		};
	}
	else if(MIS_RitualInnosEyeRepair != LOG_SUCCESS)
	{
		randy = Hlp_Random(1000);
		if(Npc_GetStateTime(self) > randy)
		{
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xardas))
			{
				Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Pyrokar))
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			}
			else
			{
				Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
			};
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Circle_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

