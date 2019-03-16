
func void b_awake_stoneguardian(var C_Npc slf)
{
	if(slf.aivar[AIV_EnemyOverride] == TRUE)
	{
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",slf,slf,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",slf,slf,0,0,0,FALSE);
		slf.aivar[AIV_EnemyOverride] = FALSE;
		slf.noFocus = FALSE;

		if((slf.flags == NPC_FLAG_IMMORTAL) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Stoneguardian_Boss)))
		{
			slf.flags = FALSE;
		};
	};
};

var int StoneBossIsAwake;

func void b_awake_stoneguardian_boss()
{
	var C_Npc StoneBoss;

	StoneBossIsAwake = TRUE;
	StoneBoss = Hlp_GetNpc(Stoneguardian_boss);
	StoneBoss.wp = "ADW_ADANOSTEMPEL_RAVEN_01";
	StoneBoss.noFocus = FALSE;
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",StoneBoss,StoneBoss,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",StoneBoss,StoneBoss,0,0,0,FALSE);
	AI_Wait(StoneBoss,1);
	AI_GotoWP(StoneBoss,"ADW_ADANOSTEMPEL_RAVEN_01");
};

func void B_Lock_Scr_Test()
{
	if(Lock_Scr_Test == 100)
	{
	};
};
	