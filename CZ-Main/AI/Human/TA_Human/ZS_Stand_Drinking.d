
func void ZS_Stand_Drinking()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_DeSynchronize();

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ItFo_Booze) == 0)
	{
		CreateInvItem(self,ItFo_Booze);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_Drinking_loop()
{
	var int random;

	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_ITEMINTERACT))
		{
			AI_UseItemToState(self,ItFo_Booze,-1);
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
		AI_UseItemToState(self,ItFo_Booze,0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 7) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		B_StopLookAt(self);

		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_128_Nrozas)) && (NrozasAway == FALSE))
		{
			if(Npc_GetStateTime(self) == 10)
			{
				AI_PlayAni(self,"T_POTION_RANDOM_1");
				AI_Wait(self,1);
				AI_UseItemToState(self,ItFo_Booze,-1);
			};
			if((MIS_NrozasPoisonGift == LOG_Success) && (HaniarGetGift == FALSE) && (Npc_GetStateTime(self) >= 15))
			{
				NrozasAway = TRUE;
				PlayerIsPrioratFake = TRUE;
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				B_LogEntry(TOPIC_MasiafStory,"Kruci! Víno, které mi dal Osair, bylo otráveno... Teď jsem obviněn z toho, že jsem zabil Nrozase. Nezbývá než bojovat!");
				return LOOP_END;
			}
			else if((MIS_NrozasPoisonGift == LOG_Success) && (HaniarGetGift == TRUE) && (Npc_GetStateTime(self) >= 15))
			{
				NrozasAway = TRUE;
				Npc_ExchangeRoutine(self,"TOT");
				AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
				Wld_PlayEffect("spellFX_Teleport_RING",self,self,0,0,0,FALSE);
				AI_Wait(self,2);
				AI_Teleport(self,"TOT");
				B_LogEntry(TOPIC_MasiafStory,"Nrozas vypil víno a zmizel... Zdá se, že Haniarův plán začal fungovat! Ale musím za každou cenu zjistit, co je zač tá vnitřní svatyně bratrstva, o které mluvil Haniar.");
				Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
				Npc_SetStateTime(self,0);
			};		
		}
		else
		{
			random = Hlp_Random(10);

			if(random == 0)
			{
				AI_PlayAniBS(self,"T_POTION_RANDOM_3",BS_ITEMINTERACT);
				AI_PlayAniBS(self,"T_POTION_RANDOM_1",BS_ITEMINTERACT);
			}
			else if(random == 1)
			{
				AI_PlayAniBS(self,"T_POTION_RANDOM_1",BS_ITEMINTERACT);
				AI_PlayAniBS(self,"T_POTION_RANDOM_2",BS_ITEMINTERACT);
			}
			else
			{
				AI_PlayAniBS(self,"T_POTION_RANDOM_1",BS_ITEMINTERACT);
			};

			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Stand_Drinking_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseItemToState(self,ItFo_Booze,-1);
};

