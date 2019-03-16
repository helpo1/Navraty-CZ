
func void ZS_Flee()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	B_ValidateOther();
	b_staminainvent();

	if(self.aivar[AIV_LOADGAME] == FALSE)
	{
		if((self.guild == GIL_VLK) && (self.aivar[AIV_Gender] == FEMALE))
		{
			B_Say_Overlay(self,other,"$GUARDS");
		};
		if((self.guild == GIL_BAU) && (self.aivar[AIV_Gender] == FEMALE))
		{
			B_Say_Overlay(self,other,"$SPAREME");
		}
		else
		{
			B_Say_Overlay(self,other,"$RUNAWAY");
		};
	};

	AI_RemoveWeapon(self);
	AI_SetWalkMode(self,NPC_RUN);
	Mdl_ApplyOverlayMds(self,"Humans_MageSprint.MDS");
};

func int ZS_Flee_Loop()
{
	Npc_GetTarget(self);

	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(C_NpcIsDown(other))
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6108_salentin)) && (USESALENTINAMULET == TRUE) && (PLAYERISTRANSFER == FALSE))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,hero,"$Dead");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
		Mdl_SetVisualBody(hero,"hum_body_Naked0",BodyTex_L,0,"Hum_Head_Bald",Face_N_Normal_Blade,0,itar_bau_l_trans);
		PLAYERISTRANSFER = TRUE;
		return LOOP_END;
	};

	AI_Flee(self);
	return LOOP_CONTINUE;
};

func void ZS_Flee_End()
{
	b_staminainvent();

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6108_salentin))
	{
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_MageSprint.MDS");
		AI_Standup(self);
		AI_StartState(self,ZS_HealSelf,1,"");
	};
};

