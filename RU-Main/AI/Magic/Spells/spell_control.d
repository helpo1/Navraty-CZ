
instance SPELL_CONTROL(C_Spell_Proto)
{
	time_per_mana = 500;
	spellType = SPELL_BAD;
	damage_per_level = SPL_CONTROL_DAMAGE_PER_SEC;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1000;
	targetCollectType = TARGET_TYPE_HUMANS;
};


func int spell_logic_control(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_CONTROL))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_CONTROL;
		return SPL_NEXTLEVEL;
	};
	if(self.attribute[ATR_MANA] >= SPL_COST_FIRELIGHT)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_CONTROL;
		return SPL_NEXTLEVEL;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_control()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(self.attribute[ATR_MANA] < 0)
	{
		self.attribute[ATR_MANA] = 0;
	};
	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Как интересно! В отличие от Пирокара и других прочих магов, я могу использовать рунную магию. Что бы это значило?!");
		}
		else
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Как интересно! В отличие от Пирокара, я могу использовать рунную магию. Что бы это значило?!");
		};
		TESTRUNEME = TRUE;
	};

	self.aivar[AIV_SelectSpell] += 1;
};

instance Spell_Rage(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_BAD;
};

func int Spell_Logic_Rage(var int manaInvested)
{
	if((Npc_IsInState(other,ZS_Unconscious) == TRUE) || (other.flags == NPC_FLAG_IMMORTAL) || (other.aivar[AIV_MM_REAL_ID] == ID_SANDGOLEM) || (other.aivar[AIV_MM_REAL_ID] == ID_GHOST) || (other.flags == NPC_FLAG_GHOST) || (other.flags == NPC_FLAG_GHOST) || (other.flags == NPC_FLAG_XARADRIM) || (other.flags == ORCTEMPLENPCFLAGS) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(STONEGOLEM_OSTA)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XranFreg)) || (C_NpcIsUndead(other) == TRUE) || (other.guild == GIL_DMT) || (other.guild == GIL_KDW) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_126_Haniar)) || (other.guild == GIL_PAL) || (other.guild == GIL_TPL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_DRAGON) || (other.guild == GIL_DEMON) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_299_Sergio)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(none_102_kreol)) || (other.aivar[90] == TRUE))
	{
		AI_PrintClr("Это не сработает...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL6))
	{
		return SPL_SENDCAST;
	};
	if(self.attribute[ATR_MANA] >= SPL_Cost_Rage)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func void Spell_Cast_Rage()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL6;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Rage;
	};

	Npc_ClearAIQueue(other);
	B_ClearPerceptions(other);
	other.aivar[AIV_RageStateTime] = 0;
	AI_StartState(other,ZS_Rage,0,"");

	if(Npc_IsPlayer(self) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (TESTRUNEME == FALSE) && !Npc_GetActiveSpellIsScroll(self))
	{
		if((FIREMAGERUNESNOT == TRUE) || (WATERMAGERUNESNOT == TRUE) || (GURUMAGERUNESNOT == TRUE) || (PALADINRUNESNOT == TRUE))
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Как интересно! В отличие от Пирокара и других прочих магов, я могу использовать рунную магию. Что бы это значило?!");
		}
		else
		{
			B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Как интересно! В отличие от Пирокара, я могу использовать рунную магию. Что бы это значило?!");
		};
		TESTRUNEME = TRUE;
	};

	self.aivar[AIV_SelectSpell] += 1;
};