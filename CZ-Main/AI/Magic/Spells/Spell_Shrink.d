
instance Spell_Shrink(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1200;
};


func int Spell_Logic_Shrink(var int manaInvested)
{
	if(ShrinkUse == TRUE)
	{
		return SPL_SENDSTOP;
	};
	if((other.guild == GIL_DRAGON) || (other.guild == GIL_DEMON) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Lord_LV)) || (other.aivar[90] == TRUE) || (other.guild == GIL_ORC) || (other.guild == GIL_DRACONIAN))
	{
		AI_PrintClr("To nebude fungovat...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(C_NpcIsUndead(other))
	{
		AI_PrintClr("To nebude fungovat...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL4))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Shrink)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Shrink()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL4;
		ShrinkUse = TRUE;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Shrink;
		ShrinkUse = TRUE;
	};

	if((other.flags != NPC_FLAG_IMMORTAL) && !C_NpcIsUndead(other) && (other.guild > GIL_SEPERATOR_HUM) && (other.aivar[AIV_MM_ShrinkState] == 0))
	{
		Npc_ClearAIQueue(other);
		B_ClearPerceptions(other);
		AI_StartState(other,ZS_MagicShrink,0,"");
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