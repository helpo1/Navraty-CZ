func int B_AssessEnterRoom()
{
	var int portalguild;

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	portalguild = Wld_GetPlayerPortalGuild();

	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		return FALSE;	
	};
	if(self.guild == GIL_STRF)
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (Player_LeftRoomComment == TRUE) && (portalguild > GIL_NONE) && (portalguild != GIL_PUBLIC))
	{
		Player_LeftRoomComment = FALSE;
	};
	if(Npc_IsInState(self,ZS_Attack))
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	if(!Npc_IsPlayer(other))
	{
		return FALSE;
	};
	if(self.npcType == NPCTYPE_FRIEND)
	{
		return FALSE;
	};
	if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
			return FALSE;
	};
	if(C_BodyStateContains(other,BS_SNEAK))
	{
		if(!Npc_CanSeeNpc(self,other) && !Npc_IsInState(self,ZS_ObservePlayer))
		{
			return FALSE;
		};
	};
	if(Npc_IsInState(self,ZS_Sleep) && C_BodyStateContains(other,BS_SNEAK))
	{
		return FALSE;
	};
	if(self.guild == GIL_NONE)
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (Npc_IsInPlayersRoom(self) == FALSE) && (Npc_IsInState(self,ZS_Sleep) == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (Npc_IsInPlayersRoom(self) == FALSE) && (Npc_GetDistToNpc(self,other) <= 500)  && (HeroDrunk == TRUE) && (Npc_CheckInfo(self,1) == FALSE))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_StartState(self,ZS_ObservePlayer,0,"");
		}
		else
		{
			AI_StartState(self,ZS_ObservePlayer,1,"");
		};

		return TRUE;
	};
	if(Npc_IsPlayer(other) && (portalguild == GIL_PUBLIC) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY) && Npc_IsInPlayersRoom(self))
	{
		if(Npc_IsInState(self,ZS_ObservePlayer))
		{
			return FALSE;
		};
		if(C_BodyStateContains(self,BS_LIE))
		{
			B_MM_DeSynchronize();
		};

		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);

		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_StartState(self,ZS_ObservePlayer,0,"");
		}
		else
		{
			AI_StartState(self,ZS_ObservePlayer,1,"");
		};

		return TRUE;			
	};
	if(Npc_IsPlayer(other) && (portalguild == GIL_PUBLIC) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY) && !Npc_IsInPlayersRoom(self))
	{
		return FALSE;			
	};
	if(C_NpcIsBotheredByPlayerRoomGuildNew(self,other))
	{
		if(self.vars[0] == TRUE)
		{
			return FALSE;
		}
		else
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_ClearRoom,1,"");
			return TRUE;
		};
	};

	return FALSE;
};

func void B_AssessPortalCollision()
{
	var int formerportalguild;

	formerportalguild = Wld_GetFormerPlayerPortalGuild();

	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		return;
	};
	if(B_AssessEnterRoom() == TRUE)
	{
		return;
	};
	if(!Npc_CanSeeNpc(self,other) && C_BodyStateContains(other,BS_SNEAK))
	{
		return;
	};
	if(Npc_IsInState(self,ZS_Sleep) && C_BodyStateContains(other,BS_SNEAK))
	{
		return;
	};

	Npc_PerceiveAll(self);

	if(Wld_DetectNpcEx(self,-1,ZS_ClearRoom,-1,FALSE))
	{
		return;
	};
};