
func void ZS_Stand_Eating()
{
	var int random;
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_DeSynchronize();

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4350_Priscila))
	{
		if(Npc_HasItems(self,itmi_sonjawig) == 0)
		{
			CreateInvItem(self,itmi_sonjawig);
			AI_EquipArmor(self,itmi_sonjawig);
		};		
	};
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	random = Hlp_Random(4);

	if(random == 0)
	{
		if(Npc_HasItems(self,ItFo_Apple) == 0)
		{
			CreateInvItem(self,ItFo_Apple);
		};
		self.aivar[AIV_Food] = FOOD_Apple;
	}
	else if(random == 1)
	{
		if(Npc_HasItems(self,ItFo_Cheese) == 0)
		{
			CreateInvItem(self,ItFo_Cheese);
		};
		self.aivar[AIV_Food] = FOOD_Cheese;
	}
	else if(random == 2)
	{
		if(Npc_HasItems(self,ItFo_Bacon) == 0)
		{
			CreateInvItem(self,ItFo_Bacon);
		};
		self.aivar[AIV_Food] = FOOD_Bacon;
	}
	else if(random == 3)
	{
		if(Npc_HasItems(self,ItFoMutton) == 0)
		{
			CreateInvItem(self,ItFoMutton);
		};
		self.aivar[AIV_Food] = FOOD_Bread;
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_Eating_Loop()
{
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_ITEMINTERACT))
		{
			if(self.aivar[AIV_Food] == FOOD_Apple)
			{
				AI_UseItemToState(self,ItFo_Apple,-1);
				Npc_RemoveInvItems(self,ItFo_Apple,1);
			};
			if(self.aivar[AIV_Food] == FOOD_Cheese)
			{
				AI_UseItemToState(self,ItFo_Cheese,-1);
				Npc_RemoveInvItems(self,ItFo_Cheese,1);
			};
			if(self.aivar[AIV_Food] == FOOD_Bacon)
			{
				AI_UseItemToState(self,ItFo_Bacon,-1);
				Npc_RemoveInvItems(self,ItFo_Bacon,1);
			};
			if(self.aivar[AIV_Food] == FOOD_Bread)
			{
				AI_UseItemToState(self,ItFoMutton,-1);
				Npc_RemoveInvItems(self,ItFoMutton,1);
			};

			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);

		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);

		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(self.aivar[AIV_Food] == FOOD_Apple)
		{
			B_StopLookAt(self);
			AI_UseItemToState(self,ItFo_Apple,0);
			AI_PlayAniBS(self,"T_FOOD_RANDOM_2",BS_ITEMINTERACT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(self.aivar[AIV_Food] == FOOD_Cheese)
		{
			B_StopLookAt(self);
			AI_UseItemToState(self,ItFo_Cheese,0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(self.aivar[AIV_Food] == FOOD_Bacon)
		{
			B_StopLookAt(self);
			AI_UseItemToState(self,ItFo_Bacon,0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(self.aivar[AIV_Food] == FOOD_Bread)
		{
			B_StopLookAt(self);
			AI_UseItemToState(self,ItFoMutton,0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		if(self.aivar[AIV_Food] == FOOD_Apple)
		{
			B_StopLookAt(self);
			AI_PlayAniBS(self,"T_FOOD_RANDOM_1",BS_ITEMINTERACT);
		}
		else if((self.aivar[AIV_Food] == FOOD_Bacon) || (self.aivar[AIV_Food] == FOOD_Bread))
		{
			B_StopLookAt(self);
			AI_PlayAniBS(self,"T_MEAT_RANDOM_1",BS_ITEMINTERACT);
		}
		else
		{
			B_StopLookAt(self);
			AI_PlayAniBS(self,"T_FOODHUGE_RANDOM_1",BS_ITEMINTERACT);
		};

		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Stand_Eating_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAniBS(self,"T_POTION_RANDOM_2",BS_ITEMINTERACT);

	if(self.aivar[AIV_Food] == FOOD_Apple)
	{
		AI_UseItemToState(self,ItFo_Apple,-1);
		Npc_RemoveInvItems(self,ItFo_Apple,1);
	};
	if(self.aivar[AIV_Food] == FOOD_Cheese)
	{
		AI_UseItemToState(self,ItFo_Cheese,-1);
		Npc_RemoveInvItems(self,ItFo_Cheese,1);
	};
	if(self.aivar[AIV_Food] == FOOD_Bacon)
	{
		AI_UseItemToState(self,ItFo_Bacon,-1);
		Npc_RemoveInvItems(self,ItFo_Bacon,1);
	};
	if(self.aivar[AIV_Food] == FOOD_Bread)
	{
		AI_UseItemToState(self,ItFoMutton,-1);
		Npc_RemoveInvItems(self,ItFoMutton,1);
	};
};