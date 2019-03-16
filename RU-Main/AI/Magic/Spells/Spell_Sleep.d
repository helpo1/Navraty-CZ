
instance Spell_Sleep(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	canTurnDuringInvest = 0;
};

func int Spell_Logic_Sleep(var int manaInvested)
{
	if((other.guild == GIL_KDW) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ass_126_Haniar)) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_DRAGON) || (other.guild == GIL_DEMON) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_299_Sergio)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(none_102_kreol)) || (other.aivar[90] == TRUE))
	{
		AI_PrintClr("Это не сработает...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)) || (self.attribute[ATR_MANA] >= SPL_Cost_Sleep))
	{
		AI_Wait(self,3);

		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Sleep;
		};
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Orc_8206_Dakar)) && (MIS_NeedRest == LOG_Running) && (DabarShakIsSleep == FALSE))
		{
			DabarShakIsSleep = TRUE;
			return SPL_SENDCAST;
		};
		if(!C_BodyStateContains(other,BS_SWIM) && !C_BodyStateContains(other,BS_DIVE) && !C_NpcIsDown(other) && (other.guild < GIL_SEPERATOR_HUM) && (other.flags != NPC_FLAG_IMMORTAL) && (Npc_GetDistToNpc(self,other) <= 1000) && (other.guild != GIL_KDF) && (other.guild != GIL_GUR) && (other.guild != GIL_DMT) && (other.guild != GIL_PAL) && (other.guild != GIL_DRAGON) && (other.guild != GIL_KDW) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(BDT_1090_Addon_Raven)) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(BDT_2090_Addon_Raven)) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(NONE_100_Xardas)) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(none_102_kreol)) && (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(vlk_6027_taliasan)))
		{
			Npc_ClearAIQueue(other);
			B_ClearPerceptions(other);
			AI_StartState(other,ZS_MagicSleep,0,"");
			return SPL_SENDCAST;
		}
		else
		{
			B_Say(self,self,"$DONTWORK");
			return SPL_SENDSTOP;
		};
	}
	else
	{
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Sleep()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
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

