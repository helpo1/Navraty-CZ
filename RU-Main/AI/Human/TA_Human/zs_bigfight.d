
func void zs_bigfight()
{
	Perception_Set_Normal();
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		B_ResetAll(self);
	}
	else
	{
		if((self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR))
		{
			AI_ReadyMeleeWeapon(self);
		};
		B_StopLookAt(self);
	};
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	if((self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR))
	{
		AI_EquipBestMeleeWeapon(self);
		AI_EquipBestArmor(self);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_bigfight_loop()
{
	var int zufall;
	var int zufallstand;
	var int zufallgreet;
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if((self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR))
		{
			AI_PlayAni(self,"T_STAND_2_LGUARD");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		}
		else
		{
			AI_PlayAni(self,"T_STAND_2_HGUARD");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	};
	if((STARTBIGBATTLE == TRUE) && (self.aivar[98] == FALSE))
	{
		if((self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR))
		{
			self.aivar[AIV_MaxDistToWp] = 200;
			AI_Wait(self,10);
			AI_ReadyMeleeWeapon(self);
		};
		self.aivar[98] = TRUE;
		if(self.guild == GIL_PAL)
		{
			B_Say_Overlay(self,self,"$PALGREETINGS");
		};
	};
	if((CANATTACKBIGBATTLE == TRUE) && (self.aivar[AIV_MaxDistToWp] > 0))
	{
		self.aivar[AIV_MaxDistToWp] = FALSE;
		return LOOP_END;
	};
	if((STARTBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (STOPBIGBATTLE == TRUE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		zufall = Hlp_Random(4);
		zufallstand = Hlp_Random(2);
		zufallgreet = Hlp_Random(100);
		if((self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR))
		{
			AI_ReadyMeleeWeapon(self);
			if(zufallstand == 0)
			{
				AI_PlayAni(self,"T_STAND_2_LGUARD");
			}
			else
			{
				AI_PlayAni(self,"T_STAND_2_HGUARD");
			};
		};
		if(zufall <= 1)
		{
			AI_TurnToNPC(self,hero);
			AI_PlayAni(self,"T_GREETRIGHT");
			Snd_Play3d(self,"BIGBATTLE_WIN");
			if(zufallstand == 0)
			{
				AI_PlayAni(self,"T_STAND_2_LGUARD");
			}
			else
			{
				AI_PlayAni(self,"T_STAND_2_HGUARD");
			};
		}
		else
		{
			AI_TurnToNPC(self,hero);
		};
		AI_Wait(self,1);
	};
	return LOOP_CONTINUE;
};

func void zs_bigfight_end()
{
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

