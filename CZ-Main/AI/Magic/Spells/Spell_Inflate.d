
instance Spell_Inflate(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_CRESTELEMENTS;
	damagetype = DAM_MAGIC;
};

func int Spell_Logic_Inflate(var int manaInvested)
{
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(senyak_demon))
	{
		DESTOYSENYAKSOUL = TRUE;
		return SPL_SENDCAST;
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(XranFreg))
	{
		XranFregIsMortal = TRUE;
		return SPL_SENDCAST;
	};
	if(other.aivar[90] == TRUE)
	{
		return SPL_SENDCAST;
	};

	return SPL_SENDSTOP;
};

func void Spell_Cast_Inflate()
{
	if(Npc_IsPlayer(self) && (PLAYERISTRANSFER == TRUE) && (PLAYERISTRANSFERDONE == FALSE))
	{
		b_transferback(self);
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

INSTANCE Spell_Elevate(C_Spell_Proto)
{
    time_per_mana           = 60;
    damage_per_level        = 0;
    spelltype               = SPELL_NEUTRAL;
    targetCollectAlgo       = TARGET_COLLECT_CASTER;
    canTurnDuringInvest     = FALSE;
};

func int Spell_Logic_Elevate(var int manaInvested)
{
	return SPL_SENDSTOP;
};

func void Spell_Cast_Elevate(var int spellLevel)
{
};

func void Spell_MagParade()
{
	if((hero.guild != GIL_KDM) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_GUR))
	{
        return;
	};
	if(!Npc_IsInFightMode(hero, FMODE_MAGIC) || !PLAYER_TALENT_MagParade)
	{
        return;
	};
	
	var oCNpc her; her = Hlp_GetNpc(hero);

    if (C_BodyStateContains(hero, BS_PARADE))
    && !(her.bitfield[4] & oCNpc_bitfield4_m_bAniMessageRunning)
    && !(her._zCVob_bitfield[0] & zCVob_bitfield0_collDetectionDynamic) {
        her._zCVob_bitfield[0] = (her._zCVob_bitfield[0]
            | zCVob_bitfield0_collDetectionDynamic);
    }
    else if (!C_BodyStateContains(hero, BS_PARADE))
    && !(her._zCVob_bitfield[0] & zCVob_bitfield0_collDetectionDynamic) {
        her._zCVob_bitfield[0] = (her._zCVob_bitfield[0]
            | zCVob_bitfield0_collDetectionDynamic);
    };
    if (MagParade_Overlay == 2)
    && (!C_BodyStateContains(hero, BS_PARADE)) {
        Mdl_RemoveOverlayMDS(hero, "Humans_MagDisable.mds");
        MagParade_Overlay = 0;
    };

    var int returnState_down1;
    var int returnState_down2;
    var int returnState_action1;
    var int returnState_action2;

    returnState_down1   = MEM_KeyState(MEM_GetKey("keyDown"));
    returnState_down2   = MEM_KeyState(MEM_GetSecondaryKey("keyDown"));
    returnState_action1 = MEM_KeyState(MEM_GetKey("keyAction"));
    returnState_action2 = MEM_KeyState(MEM_GetSecondaryKey("keyAction"));

    if (((returnState_action1 == KEY_PRESSED  // Aktionstaste gedrückt
        || returnState_action1 == KEY_HOLD)
    || (returnState_action2 == KEY_PRESSED    // Aktionstaste gedrückt
        || returnState_action2 == KEY_HOLD))
    && (returnState_down1 == KEY_PRESSED      // Down-Taste neu gedrückt
        || returnState_down2 == KEY_PRESSED))
    && (!C_BodyStateContains(hero, BS_PARADE))
    && (!C_BodyStateContains(hero, BS_FALL))
    && (!C_BodyStateContains(hero, BS_SWIM))
    && (!C_BodyStateContains(hero, BS_DIVE))
    && (!C_BodyStateContains(hero, BS_JUMP))
    && (!C_BodyStateContains(hero, BS_SIT))
    && (!C_BodyStateContains(hero, BS_LIE))
    && (!C_BodyStateContains(hero, BS_STUMBLE))
    && (!C_BodyStateContains(hero, BS_UNCONSCIOUS))
    && (!C_BodyStateContains(hero, BS_DEAD))
    && (!C_BodyStateContains(hero, BS_CRAWL))
    && (!C_BodyStateContains(hero, BS_CLIMB)) {
        if (hero.attribute[ATR_MANA] >= MagParade_Cost) {
            hero.attribute[ATR_MANA] = (hero.attribute[ATR_MANA]
                - MagParade_Cost);
            Mdl_ApplyOverlayMds(hero,  "Humans_MagDisable.mds");
            MagParade_Overlay = 1;
            AI_PlayAniBS(hero, "S_MAGPARADE", BS_PARADE);
            her._zCVob_bitfield[0] = (her._zCVob_bitfield[0]
                & ~ zCVob_bitfield0_collDetectionDynamic);
        } else {
            AI_PlayAniBS (hero, "T_CASTFAIL", BS_STAND);
        };
    } else if (MagParade_Overlay)              // Overlay an UND...
    && ((returnState_down1 == KEY_HOLD          // ...ENTWEDER:
        || returnState_down2 == KEY_HOLD)       // Down-Taste gedrückt
    &&  (returnState_action1 == KEY_RELEASED    // Aktionstaste nicht
        || returnState_action2 == KEY_RELEASED))
    || ((returnState_action1 == KEY_HOLD        // ...ODER:
        || returnState_action2 == KEY_HOLD)     // Aktionstaste gedrückt
    &&  (returnState_down1 == KEY_RELEASED      // Down-Taste nicht
        || returnState_down2 == KEY_RELEASED))
    || ((returnState_action1 == KEY_RELEASED    // ...ODER:
        || returnState_down2 == KEY_RELEASED)   // Down-Taste nicht
    &&  (returnState_down1 == KEY_RELEASED      // Aktionstaste auch nicht
        || returnState_down2 == KEY_RELEASED)) {
        MagParade_Overlay = 2;
    };
};