
func void ZS_RansackBody()
{
	Perception_Set_Normal();
	b_staminainvent();
	AI_Standup(self);
	AI_GotoNpc(self,other);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_RansackBody_Loop()
{
	B_CheckHealth(self);
	return LOOP_END;
};

func void ZS_RansackBody_End()
{
	var int x;
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	B_TurnToNpc(self,other);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(xor_12206_warriornature))
	{
		B_Say(self,other,"$toughguy_playerattack");
		Npc_PerceiveAll(self);

		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			AI_StartState(self,ZS_HealSelf,0,"");
			return;
		};

		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1297_stonnos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12140_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12170_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12200_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12970_stonnos)))
	{
		B_Say(self,other,"$toughguy_playerattack");
		Npc_PerceiveAll(self);

		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			AI_StartState(self,ZS_HealSelf,0,"");
			return;
		};

		return;
	};

	AI_PlayAni(self,"T_PLUNDER");

	if((Npc_HasItems(other,Holy_Hammer_MIS) > 0) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Garwig)))
	{
		CreateInvItems(self,Holy_Hammer_MIS,1);
		Npc_RemoveInvItems(other,Holy_Hammer_MIS,1);
	};
	if((Npc_HasItems(other,ItMw_2h_Rod) > 0) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rod)))
	{
		CreateInvItems(self,ItMw_2h_Rod,1);
		Npc_RemoveInvItems(other,ItMw_2h_Rod,1);
		AI_EquipBestMeleeWeapon(self);
	};
	if(Npc_HasItems(other,ITKE_Greg_ADDON_MIS) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Francis)))
	{
		CreateInvItems(self,ITKE_Greg_ADDON_MIS,1);
		Npc_RemoveInvItems(other,ITKE_Greg_ADDON_MIS,1);
	};
	if(Npc_HasItems(other,ItMi_Gold) > 0)
	{
		x = Npc_HasItems(other,ItMi_Gold);
		CreateInvItems(self,ItMi_Gold,x);
		Npc_RemoveInvItems(other,ItMi_Gold,x);
		B_Say(self,other,"$ITOOKYOURGOLD");
	}
	else
	{
		B_Say(self,other,"$SHITNOGOLD");
	};

	Npc_PerceiveAll(self);

	if(Wld_DetectItem(self,ITEM_KAT_NF))
	{
		if(Hlp_IsValidItem(item))
		{
			if(Npc_GetDistToItem(self,item) < 500)
			{
				AI_TakeItem(self,item);
				B_Say(self,self,"$ITAKEYOURWEAPON");
			};
		};
	};
	if(Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item))
		{
			if(Npc_GetDistToItem(self,item) < 500)
			{
				AI_TakeItem(self,item);
			};
		};
	};
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};

func void ZS_GetMeat()
{
	var int x;
	Perception_Set_Minimal();
	AI_Standup(self);
	AI_GotoNpc(self,other);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_PLUNDER");
	x = Npc_HasItems(other,ItFoMuttonRaw);
	CreateInvItems(self,ItFoMuttonRaw,x);
	Npc_RemoveInvItems(other,ItFoMuttonRaw,x);
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_StartState(self,ZS_HealSelf,0,"");
		return;
	};
};