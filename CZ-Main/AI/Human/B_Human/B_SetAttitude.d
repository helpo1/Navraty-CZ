func void B_SetAttitude(var C_Npc slf,var int att)
{
	Npc_SetAttitude(slf,att);
	Npc_SetTempAttitude(slf,att);

	if(att == ATT_FRIENDLY)
	{
		slf.mission[4] = 3;
	}
	else if(att == ATT_NEUTRAL)
	{
		slf.mission[4] = 2;
	}
	else if(att == ATT_ANGRY)
	{
		slf.mission[4] = 1;
	}
	else if(att == ATT_HOSTILE)
	{
		slf.mission[4] = 0;
	};
};

