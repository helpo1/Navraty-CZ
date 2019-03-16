
func void ZS_ReactToDamage()
{
	Perception_Set_Normal();
	b_staminainvent();
	B_LookAtNpc(self,other);

	if(self.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
	{
		B_SelectSpell(self,other);
	}
	else
	{
		B_SelectWeapon(self,other);
	};

	B_TurnToNpc(self,other);
	B_Say(self,other,"$WHATAREYOUDOING");

	if(Npc_IsPlayer(other) && ((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (self.npcType == NPCTYPE_FRIEND)))
	{
		B_SetAttitude(self,ATT_NEUTRAL);
		self.npcType = npctype_main;
	};

	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_ReactToDamage_Loop()
{
	B_CheckHealth(self);

	if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
	{
		if(!Npc_CanSeeNpc(self,other))
		{
			AI_TurnToNPC(self,other);
		};

		self.aivar[AIV_StateTime] = self.aivar[AIV_StateTime] + 1;
	};
	if(Npc_GetStateTime(self) > 10)
	{
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};

	return LOOP_CONTINUE;
};

func void ZS_ReactToDamage_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_RemoveWeapon(self);
	B_StopLookAt(self);
};

