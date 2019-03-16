
func void zs_firespit()
{
	Perception_Set_Normal();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	AI_RemoveWeapon(self);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int zs_firespit_loop()
{
	var int spitreaktion;
	B_CheckHealth(self);

	if((self.vars[0] == TRUE) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG))
	{
		if(C_BodyStateContains(self,BS_ITEMINTERACT))
		{
			AI_UseItemToState(self,ItLsTorchFirespit,-1);
			B_TurnToNpc(self,hero);
			B_LookAtNpc(self,hero);
		};

		AI_StartState(self,ZS_ObservePlayer,0,"");
		return LOOP_END;
	};
	if(Npc_HasItems(self,ItLsTorchFirespit) <= 1)
	{
		CreateInvItem(self,ItLsTorchFirespit);
	};
	spitreaktion = Hlp_Random(100);
	if(spitreaktion >= 25)
	{
		AI_UseItemToState(self,ItLsTorchFirespit,5);
	}
	else
	{
		AI_UseItemToState(self,ItLsTorchFirespit,-1);
	};
	return LOOP_CONTINUE;
};

func void zs_firespit_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_UseItemToState(self,ItLsTorchFirespit,-1);
	AI_ContinueRoutine(self);
};

