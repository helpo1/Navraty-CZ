
func void B_UseItem(var C_Npc slf,var int itmInstance)
{
	var C_Npc target;

	AI_Standup(slf);
	B_TurnToNpc(slf,hero);
	AI_RemoveWeapon(slf);

	if(Npc_HasItems(slf,itmInstance) == 0)
	{
		CreateInvItem(slf,itmInstance);
	};

	target = Npc_GetLookAtTarget(slf);

	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(slf);
		AI_UseItem(slf,itmInstance);
		B_LookAtNpc(slf,target);
	}
	else
	{
		AI_UseItem(slf,itmInstance);
	};
};

