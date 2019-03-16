
instance Spell_Charm(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	damage_per_level = 0;
	damagetype = DAM_MAGIC;
	canTurnDuringInvest = 0;
};


func int Spell_Logic_Charm(var int manaInvested)
{
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(GUR_8002_ORUN)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Skeleton_Lord_LV)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(KDF_500_Pyrokar)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(KDW_1400_Addon_Saturas_NW)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(KDW_14000_Addon_Saturas_ADW)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(KDF_504_Parlan)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(MIL_311_Andre)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_200_Hagen)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_250_Garond)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SLD_800_Lee)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PAL_9158_VARUS)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XBS_7507_NETBEK)))
	{
		AI_PrintClr("Это не сработает...",177,58,17);
		//B_Say(self,self,"$DONTWORK");
		return SPL_SENDSTOP;
	};
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL2)) || (self.attribute[ATR_MANA] >= SPL_Cost_Charm))
	{
		AI_Wait(self,3);

		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_445_Ramirez)) && (RamirezPissOff == TRUE) && (RamirezMagicDone == FALSE) && (RamirezTechMe == FALSE))
		{
			RamirezMagicDone = TRUE;
		};
		if((other.aivar[AIV_NpcSawPlayerCommit] != CRIME_NONE) && (MIS_Ignaz_Charm == LOG_Running))
		{
			Charm_Test = TRUE;
		};

		B_DeletePetzCrime(other);
		other.vars[0] = FALSE;

		other.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;

		if((other.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_498_Ignaz)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BAU_980_Sagitta)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(xbs_7513_darrion)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PIR_1351_Addon_Samuel)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_458_Rupert)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_4303_Addon_Erol)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_100_Xardas))))
		{
		}
		else
		{
			other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
		};
		if(Wld_GetGuildAttitude(other.guild,self.guild) != ATT_HOSTILE)
		{
			if(Npc_GetAttitude(other,self) == ATT_HOSTILE)
			{
				Npc_SetTempAttitude(other,Wld_GetGuildAttitude(other.guild,self.guild));
			};
		};
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(NONE_110_Urshak)) && (URSHAK_SUCKED == TRUE) && (URSHAKNOMAGIC == FALSE))
		{
			URSHAK_SUCKED = FALSE;
			URSHAKNOMAGIC = TRUE;
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Charm()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL2;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Charm;
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

instance Spell_TeleportSeaport(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
};

func int Spell_Logic_TeleportSeaport(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_TeleportSeaport()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
	};
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SCROLL4;
	};

	self.aivar[AIV_SelectSpell] += 1;
};



