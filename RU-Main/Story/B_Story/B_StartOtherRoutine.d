
func void B_StartOtherRoutine(var C_Npc slf,var string newRoutine)
{
	if(Hlp_IsValidNpc(slf))
	{
		if(Npc_IsDead(slf) == FALSE)
		{	
			Npc_ExchangeRoutine(slf,newRoutine);

			if(Npc_IsInState(slf,ZS_Talk) == FALSE)
			{
				AI_Standup(slf);
				AI_ContinueRoutine(slf);
			};
		};
	};
};

