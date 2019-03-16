
func void zs_drained_yberion()
{
	b_staminainvent();
	PrintDebugNpc(PD_TA_FRAME,"ZS_Drained_YBerion");
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int zs_drained_yberion_loop()
{
	B_CheckHealth(self);
	PrintDebugNpc(PD_TA_LOOP,"ZS_Drained_YBerion_Loop");
	AI_Wait(self,1);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas))
	{
		if((MIS_VIPERNUGGETS == LOG_Running) && (ALEFISDEAD == TRUE))
		{
			Npc_ExchangeRoutine(self,"Xar");
			AI_PlayAniBS(self,"T_VICTIM_SLE_2_STAND",BS_STAND);
			return LOOP_END;
		};
		if((MIS_XARDASTASKSFOUR == LOG_Running) && (XARDASRITUALFAIL == TRUE) && (NERGALISDEAD == TRUE))
		{
			Npc_ExchangeRoutine(self,"WaitForPlayerRitual");
			AI_PlayAniBS(self,"T_VICTIM_SLE_2_STAND",BS_STAND);
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
};

func void zs_drained_yberion_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	PrintDebugNpc(PD_TA_FRAME,"ZS_Drained_YBerion_End");
};

