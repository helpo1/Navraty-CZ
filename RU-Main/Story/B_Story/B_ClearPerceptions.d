
func void B_ClearPerceptions(var C_Npc slf)
{
	Npc_PercDisable(slf,PERC_ASSESSPLAYER);
	Npc_PercDisable(slf,PERC_ASSESSENEMY);
	Npc_PercDisable(slf,PERC_ASSESSBODY);
	Npc_PercDisable(slf,PERC_ASSESSMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSMURDER);
	Npc_PercDisable(slf,PERC_ASSESSTHEFT);
	Npc_PercDisable(slf,PERC_ASSESSUSEMOB);
	Npc_PercDisable(slf,PERC_ASSESSENTERROOM);
	Npc_PercDisable(slf,PERC_ASSESSTHREAT);
	Npc_PercDisable(slf,PERC_DRAWWEAPON);
	Npc_PercDisable(slf,PERC_ASSESSFIGHTSOUND);
	Npc_PercDisable(slf,PERC_ASSESSQUIETSOUND);
	Npc_PercDisable(slf,PERC_ASSESSWARN);
	Npc_PercDisable(slf,PERC_ASSESSTALK);
	Npc_PercDisable(slf,PERC_MOVEMOB);
	Npc_PercDisable(slf,PERC_ASSESSOTHERSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSSTOPMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSSURPRISE);
};

