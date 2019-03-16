
func void b_killnpccannodead(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		npc.aivar[93] = FALSE;
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

