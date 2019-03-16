
instance Spell_IceCube(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_ICECUBE;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_IceCube(var int manaInvested)
{
	if((other.guild == GIL_DMT) || (other.guild == GIL_KDW) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Lord_LV)) || (other.flags == NPC_FLAG_XARADRIM) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XOR_12206_WARRIORNATURE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_126_Haniar)) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_DRAGON) || (other.guild == GIL_DEMON) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_299_Sergio)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(none_102_kreol)) || (other.aivar[90] == TRUE))
	{
		AI_PrintClr("Это не сработает...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL3) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero)))
	{
		return SPL_SENDCAST;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL3))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_IceCube)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_IceCube()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL3;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_IceCube;
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

instance Spell_MagicCage(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_MagicCage;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectType = TARGET_TYPE_HUMANS;
	damagetype = DAM_FIRE;

};

func int Spell_Logic_MagicCage(var int manaInvested)
{
	if((other.guild == GIL_DMT) || (other.guild == GIL_KDW) || (other.flags == NPC_FLAG_XARADRIM) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XOR_12206_WARRIORNATURE)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_126_Haniar)) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_DRAGON) || (other.guild == GIL_DEMON) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_299_Sergio)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(none_102_kreol)) || (other.aivar[90] == TRUE))
	{
		AI_PrintClr("Это не сработает...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL3))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_MagicCage)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};

	return SPL_SENDSTOP;
};

func void Spell_Cast_MagicCage()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL3;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_MagicCage;
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