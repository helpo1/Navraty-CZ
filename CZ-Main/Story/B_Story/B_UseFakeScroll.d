
func void B_UseFakeScroll()
{
	var C_Npc target;

	AI_Standup(self);
	B_TurnToNpc(self,hero);
	AI_RemoveWeapon(self);

	if(Npc_HasItems(self,Fakescroll) == 0)
	{
		CreateInvItem(self,Fakescroll);
	};

	target = Npc_GetLookAtTarget(self);

	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,Fakescroll,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakescroll,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Fakescroll,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakescroll,-1);
	};
};

func void B_HeroUseFakeScroll()
{
	var C_Npc target;

	AI_Standup(hero);
	B_TurnToNpc(hero,self);
	AI_RemoveWeapon(hero);

	if(Npc_HasItems(self,Fakescroll) == 0)
	{
		CreateInvItem(self,Fakescroll);
	};

	target = Npc_GetLookAtTarget(hero);

	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(hero);
		AI_UseItemToState(hero,Fakescroll,1);
		AI_Wait(hero,1);
		AI_UseItemToState(hero,Fakescroll,-1);
		B_LookAtNpc(hero,self);
	}
	else
	{
		AI_UseItemToState(hero,Fakescroll,1);
		AI_Wait(hero,1);
		AI_UseItemToState(hero,Fakescroll,-1);
	};
};

func void B_UseFakeUnitor()
{
	var C_Npc target;

	AI_Standup(self);
	B_TurnToNpc(self,hero);
	AI_RemoveWeapon(self);

	if(Npc_HasItems(self,FakeUnitor) == 0)
	{
		CreateInvItem(self,FakeUnitor);
	};

	target = Npc_GetLookAtTarget(self);

	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,FakeUnitor,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,FakeUnitor,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,FakeUnitor,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,FakeUnitor,-1);
	};
};