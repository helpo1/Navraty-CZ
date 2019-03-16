
instance SPELL_SUMMONELIGOR(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summoneligor(var int manaInvested)
{
	if(CurrentLevel == LOSTVALLEY_ZEN)
	{
		AI_Print("Что-то мешает это сделать...");
		B_Say(self,self,"$DOESNTWORK");
		return SPL_SENDSTOP;
	};
	if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONELIGOR)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_summoneligor()
{
	var string concatText;
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONELIGOR;

	if(Npc_IsPlayer(self))
	{
		if(COUNTDEMON < 10)
		{
			if(ELIGORSUM01 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_01,1,1000);
				Snd_Play("MYSTERY_03");
				ELIGORSUM01 = TRUE;
				COUNTDEMON = COUNTDEMON + 1;
			}
			else if(ELIGORSUM02 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_02,1,1000);
				ELIGORSUM02 = TRUE;
				Snd_Play("MYSTERY_03");
				COUNTDEMON = COUNTDEMON + 1;
			}
			else if(ELIGORSUM03 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_03,1,1000);
				ELIGORSUM03 = TRUE;
				Snd_Play("MYSTERY_03");
				COUNTDEMON = COUNTDEMON + 1;
			}
			else if(ELIGORSUM04 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_04,1,1000);
				ELIGORSUM04 = TRUE;
				Snd_Play("MYSTERY_03");
				COUNTDEMON = COUNTDEMON + 1;
			}
			else if(ELIGORSUM05 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_05,1,1000);
				ELIGORSUM05 = TRUE;
				Snd_Play("MYSTERY_03");
				COUNTDEMON = COUNTDEMON + 1;
			}
			else if(ELIGORSUM06 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_06,1,1000);
				ELIGORSUM06 = TRUE;
				Snd_Play("MYSTERY_03");
				COUNTDEMON = COUNTDEMON + 1;
			}
			else if(ELIGORSUM07 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_07,1,1000);
				ELIGORSUM07 = TRUE;
				Snd_Play("MYSTERY_03");
				COUNTDEMON = COUNTDEMON + 1;
			}
			else if(ELIGORSUM08 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_08,1,1000);
				ELIGORSUM08 = TRUE;
				Snd_Play("MYSTERY_03");
				COUNTDEMON = COUNTDEMON + 1;
			}
			else if(ELIGORSUM09 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_09,1,1000);
				ELIGORSUM09 = TRUE;
				Snd_Play("MYSTERY_03");
				COUNTDEMON = COUNTDEMON + 1;
			}
			else if(ELIGORSUM10 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_10,1,1000);
				ELIGORSUM10 = TRUE;
				Snd_Play("MYSTERY_03");
				COUNTDEMON = COUNTDEMON + 1;
			};
		}
		else if(ELIGORSUMMON == FALSE)
		{
			Snd_Play("MYSTERY_07");
			Wld_SpawnNpcRange(self,eligor_demon,1,1500);
			ELIGORSUMMON = TRUE;
		}
		else if((ELIGOR_FOREVER == TRUE) && (ELIGOR_TALK == TRUE))
		{
			ELIGORTRIBUTE = 25;
			hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] - ELIGORTRIBUTE;

			if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
			{
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			};

			concatText = ConcatStrings(PRINT_Beliarshitpoints_MAX,IntToString(ELIGORTRIBUTE));
			AI_Print(concatText);

			if(ELIGORSUM01 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_01,1,1000);
				Snd_Play("MYSTERY_03");
				ELIGORSUM01 = TRUE;
				ELIGORSUM10 = FALSE;
			}
			else if(ELIGORSUM02 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_02,1,1000);
				ELIGORSUM02 = TRUE;
				Snd_Play("MYSTERY_03");
			}
			else if(ELIGORSUM03 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_03,1,1000);
				ELIGORSUM03 = TRUE;
				Snd_Play("MYSTERY_03");
			}
			else if(ELIGORSUM04 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_04,1,1000);
				ELIGORSUM04 = TRUE;
				Snd_Play("MYSTERY_03");
			}
			else if(ELIGORSUM05 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_05,1,1000);
				ELIGORSUM05 = TRUE;
				Snd_Play("MYSTERY_03");
			}
			else if(ELIGORSUM06 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_06,1,1000);
				ELIGORSUM06 = TRUE;
				Snd_Play("MYSTERY_03");
			}
			else if(ELIGORSUM07 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_07,1,1000);
				ELIGORSUM07 = TRUE;
				Snd_Play("MYSTERY_03");
			}
			else if(ELIGORSUM08 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_08,1,1000);
				ELIGORSUM08 = TRUE;
				Snd_Play("MYSTERY_03");
			}
			else if(ELIGORSUM09 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_09,1,1000);
				ELIGORSUM09 = TRUE;
				Snd_Play("MYSTERY_03");
			}
			else if(ELIGORSUM10 == FALSE)
			{
				Wld_SpawnNpcRange(self,summoned_eligordemon_10,1,1000);
				ELIGORSUM10 = TRUE;
				ELIGORSUM01 = FALSE;
				ELIGORSUM02 = FALSE;
				ELIGORSUM03 = FALSE;
				ELIGORSUM04 = FALSE;
				ELIGORSUM05 = FALSE;
				ELIGORSUM06 = FALSE;
				ELIGORSUM07 = FALSE;
				ELIGORSUM08 = FALSE;
				ELIGORSUM09 = FALSE;
				Snd_Play("MYSTERY_03");
			};
		}
		else
		{
			Snd_Play("MYSTERY_05");
		};
	}
	else
	{
		Wld_SpawnNpcRange(self,Summoned_Demon,1,1000);
	};
	self.aivar[AIV_SelectSpell] += 1;
};

