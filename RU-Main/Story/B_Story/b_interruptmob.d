
func void b_interruptmob(var string mobsi)
{
	var int randomize_mob;
	AI_UseMob(self,mobsi,-1);
	randomize_mob = Hlp_Random(7);
	if(randomize_mob == 1)
	{
		AI_PlayAni(self,"T_BORINGKICK");
	};
	if(randomize_mob == 2)
	{
		AI_PlayAni(self,"T_SEARCH");
	};
	if(randomize_mob == 3)
	{
		AI_PlayAni(self,"R_SCRATCHHEAD");
	};
	if(randomize_mob == 4)
	{
		AI_PlayAni(self,"R_LEGSHAKE");
	};
	if(randomize_mob == 5)
	{
		AI_PlayAni(self,"R_SCRATCHRSHOULDER");
	};
	if(randomize_mob == 6)
	{
		AI_PlayAni(self,"R_SCRATCHLSHOULDER");
	};
	Npc_SetStateTime(self,0);
};

