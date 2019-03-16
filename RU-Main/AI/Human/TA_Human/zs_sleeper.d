func void zs_sleeper()
{
	Npc_SetPercTime(self,0.5);
	b_staminainvent();
	AI_AlignToWP(self);
};

func int zs_sleeper_loop()
{
	var C_Npc outter1;
	var C_Npc outter2;
	var int randomMove;
	b_staminainvent();
	if(Npc_CanSeeNpc(self,hero) && (HEROOBSENT == FALSE))
	{
		if(MIS_MILTENANCIENT == LOG_Running)
		{
			outter1 = Hlp_GetNpc(demonlord_li_1);
			outter2 = Hlp_GetNpc(demonlord_li_2);
			Wld_PlayEffect("spellFX_Teleport_RING",outter1,outter1,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Teleport_RING",outter2,outter2,0,0,0,FALSE);
			HEROOBSENT = TRUE;
		};
	};
	if(!Npc_CanSeeNpc(self,hero) && (Npc_GetDistToNpc(self,hero) <= PERC_DIST_DRAGON_ACTIVE_MAX))
	{
		AI_TurnToNPC(self,hero);
	};
	if((Npc_GetStateTime(self) > 3) && Npc_CanSeeNpc(self,hero))
	{
		Snd_Play("DEM_Warn");
		AI_PlayAni(self,"T_HURT");
		Wld_PlayEffect("SPELLFX_SLEEPER_FIREBALL",self,hero,2,1000,DAM_FIRE,TRUE);

		if(Npc_GetDistToNpc(self,hero) <= 300)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,300);
		};

		Npc_SetStateTime(self,0);
	};

	return FALSE;
};

func void zs_sleeper_end()
{
	Wld_StopEffect("DEMENTOR_FX");
	b_staminainvent();
};