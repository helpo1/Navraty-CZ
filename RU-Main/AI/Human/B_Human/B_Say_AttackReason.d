
func void B_Say_AttackReason()
{
	var int rnd;
	var int random;

	if((Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE) && (Npc_GetAttitude(self,other) == ATT_HOSTILE))
	{
		if(self.aivar[AIV_ATTACKREASON] == AR_KILL)
		{
			return;
		};
		B_Say_Overlay(self,other,"$IGETYOUSTILL");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
	{
		if(self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			rnd = Hlp_Random(100);
			if(rnd > 15)
			{
				return;
			};
		};
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			if(C_PlayerIsFakeBandit(self,other) == TRUE)
			{
				if(self.guild == GIL_BDT)
				{
					B_Say_Overlay(self,other,"$DIEENEMY");
				}
				else
				{
					B_Say_Overlay(self,other,"$ADDON_DIEBANDIT");
				};

				Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			};
			if(C_PlayerIsFakePirate(self,other) == TRUE)
			{
				if(self.guild == GIL_PIR)
				{
					B_Say_Overlay(self,other,"$DIEENEMY");
				}
				else
				{
					B_Say_Overlay(self,other,"$ADDON_DIEBANDIT");
				};

				B_Say_Overlay(self,other,"$ADDON_DIRTYPIRATE");
				Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
			};
			if((C_PlayerIsFakeBandit(self,other) == FALSE) && (C_PlayerIsFakePirate(self,other) == FALSE))
			{
				B_Say_Overlay(self,other,"$DIEENEMY");
			};
		}
		else
		{
			if(self.voice == 9)
			{
				random = Hlp_Random(3);
				if(random < 1)
				{
					B_Say_Overlay(self,other,"$DIEMONSTER");
				}
				else if(random == 1)
				{
					B_Say_Overlay(self,other,"$ADDON_DIEMONSTER");
				}
				else
				{
					B_Say_Overlay(self,other,"$ADDON_DIEMONSTER2");
				};
			}
			else
			{
				B_Say_Overlay(self,other,"$DIEMONSTER");
			};
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_Theft)
	{
		B_Say_Overlay(self,other,"$DIRTYTHIEF");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_UseMob)
	{
		if(bMobReact == 1)
		{
			B_Say(self,other,"$GETOUTOFMYBED");
		}
		else if(bMobReact == 2)
		{
			B_Say_Overlay(self,other,"$DIRTYTHIEF");
		}
		else
		{
			B_Say_Overlay(self,other,"$HANDSOFF");
		};

		bMobReact = FALSE;
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
	{
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			B_Say_Overlay(self,other,"$SHEEPKILLER");
		}
		else
		{
			B_Say_Overlay(self,other,"$SHEEPKILLERMONSTER");
		};
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		B_Say_Overlay(self,other,"$YOUMURDERER");
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterMurderedHuman)
	{
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterVsHuman)
	{
		B_Say_Overlay(self,other,"$DIEMONSTER");
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
	{
		B_Say_Overlay(self,other,"$DIESTUPIDBEAST");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	{
		if(other.guild > GIL_SEPERATOR_HUM)
		{
			B_Say_Overlay(self,other,"$YOUASKEDFORIT");
			return;
		}
		else
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(none_102_kreol))
			{
				B_Say_Overlay(self,other,"$YouDareHitMeKreol");
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas))
			{
				B_Say_Overlay(self,other,"$YouDareHitMeXar");
			}
			else
			{
				B_Say_Overlay(self,other,"$YOUDAREHITME");
			};

			return;
		};
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		B_Say_Overlay(self,other,"$YOUASKEDFORIT");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_ClearRoom)
	{
		B_Say_Overlay(self,other,"$THENIBEATYOUOUTOFHERE");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)
	{
		B_Say_Overlay(self,other,"$WHATDIDYOUDOINTHERE");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
	{
		B_Say_Overlay(self,other,"$WILLYOUSTOPFIGHTING");
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)
	{
		return;
	};
	if(self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom)
	{
		return;
	};
};

