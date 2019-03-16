
instance Spell_Light(C_Spell_Proto)
{
	time_per_mana = 500;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
	canTurnDuringInvest = 0;
};

instance Spell_PalLight(C_Spell_Proto)
{
	time_per_mana = 500;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
	canTurnDuringInvest = 0;
};


func int Spell_Logic_PalLight(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_PalLight)
	{
		if(Npc_IsPlayer(self))
		{
			if(self.guild != GIL_PAL)
			{
				AI_PlayAni(self,"S_FIRE_VICTIM");
				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				B_Say(self,self,"$Dead");
				AI_StopFX(self,"VOB_MAGICBURN");
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				Npc_StopAni(self,"S_FIRE_VICTIM");
				return SPL_SENDSTOP;
			}
			else
			{
				return SPL_SENDCAST;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_PalLight()
{
	var C_Npc osta;

	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalLight;
	};
	self.aivar[AIV_SelectSpell] += 1;
	AI_Print("Obklopuje tě posvátná ochranná aura...");
	PalLightIsOn = TRUE;

	if(Npc_IsPlayer(self))
	{
		if(Npc_GetDistToNpc(STONEGOLEM_OSTA,self) <= 1500)
		{
			OSTAISDEAD = TRUE;
			Wld_PlayEffect("VOB_MAGICBURN",STONEGOLEM_OSTA,STONEGOLEM_OSTA,0,0,0,FALSE);
			Npc_ChangeAttribute(STONEGOLEM_OSTA,ATR_HITPOINTS,-STONEGOLEM_OSTA.attribute[ATR_HITPOINTS_MAX]);

			if((MIS_XARDASTASKSFOUR == LOG_Running) && (NERGALPETVIEW == TRUE) && (XARDASTELLMEOSTA == FALSE))
			{
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Svaté magické světlo - tak toho se stínoví golemové tolik bojí! Koneckonců je okamžitě zničí...");
			}
			else if((MIS_XARDASTASKSFOUR == LOG_Running) && (NERGALPETVIEW == FALSE) && (XARDASTELLMEOSTA == TRUE))
			{
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Svaté magické světlo okamžitě stínového golema zničilo.");
			};
		};
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara a ostatních mágů, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		}
		else
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		};
		TESTRUNEME = TRUE;
	};
	if((hero.guild == GIL_PAL) && (PalLightIsOn == FALSE))
	{
		hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + 25;
		HolyAuraIsUp = TRUE;
	};
};

func int Spell_Logic_Light(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_LIGHT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func void Spell_Cast_Light()
{
	var C_Npc osta;

	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_LIGHT;
	};

	self.aivar[AIV_SelectSpell] += 1;

	if(Npc_IsPlayer(self) && (OSTAISDEAD == FALSE) && (TrySimpleLight == FALSE))
	{
		osta = Hlp_GetNpc(stonegolem_osta);

		if((Npc_GetDistToNpc(osta,self) <= 1000) && Npc_CanSeeNpc(osta,self))
		{
			TrySimpleLight = TRUE;

			if((MIS_XARDASTASKSFOUR == LOG_Running) && (NERGALPETVIEW == TRUE) && (XARDASTELLMEOSTA == FALSE))
			{
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Zkusil jsem použít na stínového golema magické světlo, ale nijak to nepomohlo...");
			}
			if((MIS_XARDASTASKSFOUR == LOG_Running) && (NERGALPETVIEW == FALSE) && (XARDASTELLMEOSTA == TRUE))
			{
				B_LogEntry(TOPIC_XARDASTASKSFOUR,"Xardas řekl, že jasné magické světlo stínového golema okamžitě zničí. Ale proč se to nestalo? Co mám udělat teď?");
			};
		};
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara a ostatních mágů, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		}
		else
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		};

		TESTRUNEME = TRUE;
	};
};

instance Spell_UnlockChest(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 0;
	spellType = SPELL_NEUTRAL;
};

func int Spell_Logic_UnlockChest(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL3))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Unlock)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func void Spell_Cast_UnlockChest()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		Mob_SetUnLocked();
		BreakChest = FALSE;
	}
	else
	{
		Mob_SetUnLocked_Rune();
		BreakChest = FALSE;
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara a ostatních mágů, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		}
		else
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Zajímavé! Na rozdíl od Pyrokara, já runovou magii pořád používat můžu! Co by to mohlo znamenat?");
		};

		TESTRUNEME = TRUE;
	};

	self.aivar[AIV_SelectSpell] += 1;
};
