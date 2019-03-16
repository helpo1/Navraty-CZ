
instance Spell_Swarm(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
};

func int Spell_Logic_Swarm(var int manaInvested)
{
	if((other.protection[PROT_MAGIC] == IMMUNE) || (other.flags == NPC_FLAG_IMMORTAL) || (other.flags == NPC_FLAG_GHOST) || (other.flags == NPC_FLAG_XARADRIM) || (other.flags == ORCTEMPLENPCFLAGS) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XranFreg)) || (other.guild == GIL_TROLL) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XOR_12206_WARRIORNATURE)) || (other.aivar[90] == TRUE) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_126_Haniar)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(TROLL_CAVE_UNIQ)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (other.guild == GIL_DMT) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_DRAGON) || (other.guild == GIL_Stoneguardian) || (other.guild == GIL_DEMON) || (other.aivar[90] == TRUE) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas)) || C_NpcIsUndead(other))
	{
		AI_PrintClr("To nebude fungovat...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(other.aivar[AIV_SwarmStateTime] > 0)
	{
		AI_PrintClr("To nebude fungovat...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(SACTANOMEPROGRESS == TRUE)
	{
		SACTANOMEPROGRESS = FALSE;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL3))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Swarm)
	{
		return SPL_SENDCAST;
	}
	else if(Npc_IsPlayer(self) && (XARDAS_KNOWSSACTANOME == TRUE) && (SACTANOMEPROGRESS == FALSE))
	{
		SACTANOMEPROGRESS = TRUE;
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Swarm()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(SACTANOMEPROGRESS == TRUE)
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			if(self.attribute[ATR_MANA] >= SPL_COST_SCROLL3)
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL3;
			}
			else
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - (SPL_COST_SCROLL3 * 3);
			};
		}
		else if(self.attribute[ATR_MANA] >= SPL_Cost_Swarm)
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Swarm;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - (SPL_Cost_Swarm * 3);
		};
		SACTANOMEPROGRESS = FALSE;
	}
	else if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL3;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Swarm;
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

