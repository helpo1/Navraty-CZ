func int ZS_Swarm()
{
	Npc_StopAni(self,"S_SWARM_VICTIM");
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	return TRUE;
};

func int ZS_Swarm_Loop()
{
	var int ranAargh;

	ranAargh = Hlp_Random(3);

	if(Npc_GetStateTime(self) > 0)
	{
		self.aivar[AIV_SwarmStateTime] = TRUE;

		if(self.guild < GIL_SEPERATOR_HUM)
		{
			if(ranAargh == 0)
			{
				B_Say(self,other,"$Aargh_1");
			}
			else if(ranAargh == 1)
			{
				B_Say(self,other,"$Aargh_2");
			}
			else if(ranAargh == 2)
			{
				B_Say(self,other,"$Aargh_3");
			};
		};

		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
		Npc_ClearAIQueue(self);
		AI_Standup(self);

		if(self.guild < GIL_SEPERATOR_HUM)
		{
			if(!Npc_CanSeeNpc(self,hero))
			{
				AI_TurnToNPC(self,hero);
			};

			B_AssessDamage();
		}
		else
		{
			if(!Npc_CanSeeNpc(self,hero))
			{
				AI_TurnToNPC(self,hero);
			};

			Npc_SetTempAttitude(self,ATT_HOSTILE);
			B_MM_AssessDamage();
		};

		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void ZS_Swarm_End()
{
};

