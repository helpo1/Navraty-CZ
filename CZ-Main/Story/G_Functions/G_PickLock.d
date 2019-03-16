
func void G_PickLock(var int bSuccess,var int bBrokenOpen)
{
	if(bSuccess)
	{
		Snd_Play3d(self,"PICKLOCK_SUCCESS");
	}
	else if(bBrokenOpen)
	{
		Snd_Play3d(self,"PICKLOCK_FAILURE");
		AI_Print(PRINT_PICKLOCK_BROKEN);
		IsLockPickBroken = TRUE;

		if(hero.attribute[ATR_DEXTERITY] < Hlp_Random(100))
		{
			Npc_SendPassivePerc(hero,PERC_ASSESSQUIETSOUND,hero,hero);
		};
	}
	else
	{
		Snd_Play3d(self,"PICKLOCK_FAILURE");
		AI_Print(PRINT_PICKLOCK_FAILURE);
	};
};

