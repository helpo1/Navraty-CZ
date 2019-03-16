
func void ZS_HealSelf()
{
	Perception_Set_Minimal();
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_HealSelf_Loop()
{
	var int random;
	B_CheckHealth(self);

	if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(self.attribute[ATR_HITPOINTS_MAX] >= 600)
		{
			Npc_RemoveInvItems(self,ItPo_Health_03,Npc_HasItems(self,ItPo_Health_03));
			CreateInvItems(self,ItPo_Health_03,1);

			if(Npc_HasItems(self,ItPo_Health_03) > 0)
			{
				AI_UseItem(self,ItPo_Health_03);
				return LOOP_END;
			};
		}
		else if(self.attribute[ATR_HITPOINTS_MAX] >= 300)
		{
			Npc_RemoveInvItems(self,ItPo_Health_02,Npc_HasItems(self,ItPo_Health_02));
			CreateInvItems(self,ItPo_Health_02,1);

			if(Npc_HasItems(self,ItPo_Health_02) > 0)
			{
				AI_UseItem(self,ItPo_Health_02);
				return LOOP_END;
			};
		}
		else
		{
			Npc_RemoveInvItems(self,ItPo_Health_01,Npc_HasItems(self,ItPo_Health_01));
			CreateInvItems(self,ItPo_Health_01,1);

			if(Npc_HasItems(self,ItPo_Health_01) > 0)
			{
				AI_UseItem(self,ItPo_Health_01);
				return LOOP_END;
			};
		};
	};

	return LOOP_END;
};

func void ZS_HealSelf_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag))
	{
		CreateInvItems(self,ItMw_2H_OrcAxe_02,1);
		AI_EquipBestMeleeWeapon(self);
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart))
	{
		CreateInvItems(self,ItMw_2H_OrcAxe_02,1);
		AI_EquipBestMeleeWeapon(self);
		AI_PlayAni(self,"T_GREETGRD");
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
		AI_Wait(self,1);
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok))
	{
		CreateInvItems(self,ItMw_2H_OrcAxe_02,1);
		AI_EquipBestMeleeWeapon(self);
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk))
	{
		CreateInvItems(self,ItMw_2H_OrcAxe_02,1);
		AI_EquipBestMeleeWeapon(self);
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok))
	{
		CreateInvItems(self,ItMw_2H_OrcAxe_02,1);
		AI_EquipBestMeleeWeapon(self);
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak))
	{
		CreateInvItems(self,ItMw_2H_OrcAxe_02,1);
		AI_EquipBestMeleeWeapon(self);
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	};
};

func void ZS_HealSelfUnc()
{
	Perception_Set_Minimal();
	b_staminainvent();
};

func int ZS_HealSelfUnc_Loop()
{
	var int random;

	B_CheckHealth(self);

	if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(self.attribute[ATR_HITPOINTS_MAX] >= 600)
		{
			Npc_RemoveInvItems(self,ItPo_Health_03,Npc_HasItems(self,ItPo_Health_03));
			CreateInvItems(self,ItPo_Health_03,1);

			if(Npc_HasItems(self,ItPo_Health_03) > 0)
			{
				AI_UseItem(self,ItPo_Health_03);
				return LOOP_END;
			};
		}
		else if(self.attribute[ATR_HITPOINTS_MAX] >= 300)
		{
			Npc_RemoveInvItems(self,ItPo_Health_02,Npc_HasItems(self,ItPo_Health_02));
			CreateInvItems(self,ItPo_Health_02,1);

			if(Npc_HasItems(self,ItPo_Health_02) > 0)
			{
				AI_UseItem(self,ItPo_Health_02);
				return LOOP_END;
			};
		}
		else
		{
			Npc_RemoveInvItems(self,ItPo_Health_01,Npc_HasItems(self,ItPo_Health_01));
			CreateInvItems(self,ItPo_Health_01,1);

			if(Npc_HasItems(self,ItPo_Health_01) > 0)
			{
				AI_UseItem(self,ItPo_Health_01);
				return LOOP_END;
			};
		};
	};

	return LOOP_END;
};

func void ZS_HealSelfUnc_End()
{
	b_staminainvent();

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag))
	{
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart))
	{
		AI_PlayAni(self,"T_GREETGRD");
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
		AI_Wait(self,1);
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok))
	{
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk))
	{
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok))
	{
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak))
	{
		AI_PlayAni(self,"T_GREETGRD");
		AI_ContinueRoutine(self);
	};
	if((self.guild <= GIL_SEPERATOR_HUM) && (self.aivar[90] == FALSE) && (self.guild != GIL_DMT) && (self.aivar[AIV_MM_SleepStart] == FALSE) && (self.aivar[AIV_Gender] == MALE) && (self.voice != 16) && (self.voice != 17) && (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]))
	{
		if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8147_Dagrag)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8148_Gunnok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8149_Turuk)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8150_UrTrok)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8151_Umrak)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_8152_UrTak)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2153_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2154_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2155_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2156_Fighter)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(STRF_2157_Fighter)))
		{
			if(Hlp_Random(100) >= 50)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Woundz.mds");
				self.aivar[AIV_MM_SleepStart] = TRUE;
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"PRE_START.MDS");
				self.aivar[AIV_MM_SleepStart] = TRUE;
			};
		};
	};
};