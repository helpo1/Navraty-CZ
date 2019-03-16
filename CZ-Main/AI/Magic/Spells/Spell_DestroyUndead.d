
instance Spell_DestroyUndead(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_DESTROYUNDEAD;
	spellType = SPELL_NEUTRAL;
};


func int Spell_Logic_DestroyUndead(var int manaInvested)
{
	if(SBMODE == TRUE)
	{
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(senyak_demon)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(skeleton_warrior_dark_fireshpere)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(skeleton_warrior_dark_darkshpere)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(skeleton_warrior_dark_watershpere)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(skeleton_warrior_dark_stoneshpere)))
		{
			AI_PrintClr("To nebude fungovat...",177,58,17);
			//B_Say(self,self,"$DONTWORK");
			return SPL_SENDSTOP;
		};
	};
	if(other.guild == GIL_DEMON)
	{
		AI_PrintClr("To nebude fungovat...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(C_NpcIsUndead(other) == FALSE)
	{
		AI_PrintClr("To nebude fungovat...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL4))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_DESTROYUNDEAD)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_DestroyUndead()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL4;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_DESTROYUNDEAD;
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

