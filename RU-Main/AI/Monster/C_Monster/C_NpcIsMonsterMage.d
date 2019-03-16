
func int C_NpcIsMonsterMage(var C_Npc slf)
{
	if((self.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) || (self.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCSHAMAN) || (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON_MAGE) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (self.aivar[AIV_MM_REAL_ID] == ID_DEMENTOR) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gobbo_black_uniq)))
	{
		return TRUE;
	};
	return FALSE;
};

