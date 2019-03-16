
func void B_AssessThreat()
{
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG)
	{
		return;
	};
	if(!Npc_CanSeeNpc(self,other))
	{
		return;
	};
	if(!C_NpcIsBotheredByWeapon(self,other))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Npc_IsInFightMode(other,FMODE_FAR) == TRUE) && ((self.aivar[AIV_PARTYMEMBER] == TRUE) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (self.npcType == NPCTYPE_FRIEND)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Npc_IsInFightMode(other,FMODE_FAR) == TRUE))
	{
		B_Attack(self,other,AR_ReactToDamage,0);
	}
	else
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_ReactToWeapon,0,"");
	};
};

