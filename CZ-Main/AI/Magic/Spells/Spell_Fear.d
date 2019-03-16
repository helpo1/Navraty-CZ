
instance Spell_Fear(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 0;
	spellType = SPELL_BAD;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1000;
};

func int Spell_Logic_Fear(var int manaInvested)
{
	if((other.guild == GIL_TROLL) || (other.flags == NPC_FLAG_XARADRIM) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XOR_12206_WARRIORNATURE)) || (other.aivar[90] == TRUE) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_126_Haniar)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(TROLL_CAVE_UNIQ)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Lord_LV)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (other.guild == GIL_DMT) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_DRAGON) || (other.guild == GIL_Stoneguardian) || (other.guild == GIL_ORC) || (other.guild == GIL_DEMON) || (other.aivar[90] == TRUE) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas)) || C_NpcIsUndead(other) || (other.guild == GIL_DRACONIAN))
	{
		AI_PrintClr("To nebude fungovat...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL3))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Fear)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Fear()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if((other.guild != GIL_DMT) && (other.guild != GIL_KDW) && (other.guild != GIL_KDF) && (other.guild != GIL_KDM) && (other.guild != GIL_GUR) && (other.guild != GIL_DRAGON) && (other.guild != GIL_Stoneguardian) && (other.guild != GIL_SKELETON) && (other.guild != GIL_DEMON) && (other.aivar[90] == FALSE))
	{
		AI_SetNpcsToState(self,ZS_MagicFlee,1000);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL3;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Fear;
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

