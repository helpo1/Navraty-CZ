
func int C_Beklauen(var int TheftDex,var int TheftGold)
{
	return FALSE;
};

func void B_Beklauen()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if(BELIARCURSEYOU == FALSE)
	{
		if(other.attribute[ATR_DEXTERITY] >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
		{
			if(Npc_IsPlayer(other))
			{
				if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
				{
					INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				}
				else
				{
					GlobalThiefCount += 1;

					if(GlobalThiefCount >= 3)
					{
						INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
						GlobalThiefCount = FALSE;
					};
				};
			};
			B_GiveInvItems(self,other,ItMi_Gold,TheftGoldGlob);
			self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
			B_GiveThiefXP();
			Snd_Play("Geldbeutel");

			if(PickPocketBonus == FALSE)
			{
				PickPocketBonusCount += 1;
			};
		}
		else
		{
			if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			};

			THIEFCATCHER = Hlp_GetNpc(self);
			HERO_CANESCAPEFROMGOTCHA = TRUE;
			self.vars[0] = TRUE;
			B_ResetThiefLevel();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};

		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		self.vars[0] = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
	};
};

func void B_Beklauen_Fingers()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if(Npc_IsPlayer(other))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};

		B_GiveInvItems(self,other,ItMi_PocketFingers,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Snd_Play("Geldbeutel");
		FingersPocket = TRUE;

		if(PickPocketBonus == FALSE)
		{
			PickPocketBonusCount += 1;
		};
	};
};