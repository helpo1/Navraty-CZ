
func void B_SetFightSkills(var C_Npc slf,var int percent)
{
	if(slf.npcType == NPCTYPE_PALMORA)
	{
		B_RaiseFightTalent(slf,NPC_TALENT_1H,100);
		B_RaiseFightTalent(slf,NPC_TALENT_2H,100);
		B_RaiseFightTalent(slf,NPC_TALENT_BOW,100);
		B_RaiseFightTalent(slf,NPC_TALENT_CROSSBOW,100);
	}	
	else
	{
		B_RaiseFightTalent(slf,NPC_TALENT_1H,percent);
		B_RaiseFightTalent(slf,NPC_TALENT_2H,percent);
		B_RaiseFightTalent(slf,NPC_TALENT_BOW,percent);
		B_RaiseFightTalent(slf,NPC_TALENT_CROSSBOW,percent);
	};
};

