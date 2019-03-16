instance Spell_ManaForLife(C_Spell_Proto)
{
    time_per_mana = 50;
    spelltype = SPELL_NEUTRAL;
    targetCollectAlgo = TARGET_COLLECT_CASTER;
    canTurnDuringInvest = FALSE;
};

func int Spell_Logic_ManaForLife(var int healthInvested)
{
	var String soundprefix;

	if((Mount_Up == TRUE) || (FlyCarpetIsOn == TRUE) || (PlayerSitDust == TRUE) || (HeroTRANS == TRUE))
	{
		AI_PrintClr("Это не сработает...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if(healthInvested == 0)
	{
		if(self.attribute[ATR_HITPOINTS] <= 5) || (self.attribute[ATR_MANA] == self.attribute[ATR_MANA_MAX])
		{
			return SPL_SENDSTOP;
		};

		self.aivar[AIV_SpellLevel] = 0;
		Wld_StopEffect("FOV_MORPH1");
        	return SPL_NEXTLEVEL;
	};
	if((self.attribute[ATR_HITPOINTS] <= 5) || (self.attribute[ATR_MANA] == self.attribute[ATR_MANA_MAX]))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_HITPOINTS] > 5)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-5);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		self.aivar[AIV_SpellLevel] += 1;
		soundprefix = ConcatStrings(ConcatStrings("SVM_",IntToString(self.voice)),"_AARGH_");

		if(self.aivar[AIV_SpellLevel] == 10)
		{
			Snd_Play3D(self,ConcatStrings(soundprefix, "1"));
		}
		else if(self.aivar[AIV_SpellLevel] == 20)
		{
			Snd_Play3D(self,ConcatStrings(soundprefix, "2"));
		}
		else if(self.aivar[AIV_SpellLevel] == 30)
		{
			Snd_Play3D(self,ConcatStrings(soundprefix, "3"));
			self.aivar[AIV_SpellLevel] = 0;
		};

		return SPL_STATUS_CANINVEST_NO_MANADEC;
	};

	return SPL_SENDCAST;
};

func void Spell_Cast_ManaForLife()
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

	Wld_StopEffect("FOV_MORPH1");
	self.aivar[AIV_SelectSpell] += 1;
};