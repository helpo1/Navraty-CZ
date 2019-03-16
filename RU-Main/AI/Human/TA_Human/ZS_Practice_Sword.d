
func void ZS_Practice_Sword()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
	AI_EquipBestMeleeWeapon(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Practice_Sword_Loop()
{
	B_CheckHealth(self);

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(!Npc_HasEquippedMeleeWeapon(self))
		{
			CreateInvItems(self,ItMw_1h_Bau_Mace,1);
			AI_EquipBestMeleeWeapon(self);
		};
		AI_ReadyMeleeWeapon(self);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	AI_PlayAni(self,"T_1HSFREE");
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	return LOOP_CONTINUE;
};

func void ZS_Practice_Sword_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_Standup(self);
	AI_RemoveWeapon(self);
};

func void ZS_Practice_Bow()
{
	var C_Item rangedweapon;

	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PRACTICEBOW"))
	{
		AI_GotoFP(self,"PRACTICEBOW");
		AI_AlignToFP(self);
	};
	if(Npc_HasEquippedRangedWeapon(self))
	{
		rangedweapon = Npc_GetEquippedRangedWeapon(self);

		if(rangedweapon.munition == ItRw_Bolt)
		{
			if(Npc_HasItems(self,ItRw_Bolt) == 0)
			{
				CreateInvItem(self,ItRw_Bolt);
			};
			AI_ReadyRangedWeapon(self);
		}
		else if(rangedweapon.munition == ItRw_Arrow)
		{
			if(Npc_HasItems(self,ItRw_Arrow) == 0)
			{
				CreateInvItem(self,ItRw_Arrow);
			};
			AI_ReadyRangedWeapon(self);
		};
	}
	else
	{
		CreateInvItem(self,ItRw_Bolt);
		CreateInvItem(self,ItRw_Arrow);
		AI_EquipBestRangedWeapon(self);
		AI_StartState(self,zs_practice_bow_checkequippedweapon,1,"");
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func void ZS_Practice_Bow_Loop()
{
	var C_Item rangedweapon;
	var int aimtime;

	B_CheckHealth(self);

	rangedweapon = Npc_GetReadiedWeapon(self);

	if(rangedweapon.munition == ItRw_Bolt)
	{
		AI_Wait(self,4);
		AI_PlayAni(self,"T_CBOWWALK_2_CBOWAIM");
		AI_Waitms(self,400);
		AI_PlayAni(self,"T_CBOWAIM_2_CBOWSHOOT");
		AI_PlayAni(self,"T_CBOWRELOAD");
		AI_PlayAni(self,"T_CBOWAIM_2_CBOWWALK");
		AI_Wait(self,1);
	}
	else if(rangedweapon.munition == ItRw_Arrow)
	{
		AI_Wait(self,4);
		AI_PlayAni(self,"T_BOWWALK_2_BOWAIM");
		AI_Waitms(self,400);
		AI_PlayAni(self,"T_BOWAIM_2_BOWSHOOT");
		AI_PlayAni(self,"T_BOWRELOAD");
		AI_PlayAni(self,"T_BOWAIM_2_BOWWALK");
		AI_Wait(self,1);
	};
};

func void ZS_Practice_Bow_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_Standup(self);
	AI_RemoveWeapon(self);
};

func void zs_practice_bow_checkequippedweapon()
{
	Npc_RemoveInvItem(self,ItRw_Bolt);
	Npc_RemoveInvItem(self,ItRw_Arrow);

	if(Npc_HasEquippedRangedWeapon(self))
	{
		AI_StartState(self,ZS_Practice_Bow,1,"");
	}
	else
	{
		AI_StartState(self,ZS_Stand_WP,1,"");
	};
};
