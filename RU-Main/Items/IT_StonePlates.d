func int C_ScHasMagicStonePlate()
{
	if(Npc_HasItems(hero,ITWR_STAMINAPOINTSTONEPLATE) || Npc_HasItems(hero,ItWr_StrStonePlate1_Addon) || Npc_HasItems(hero,ItWr_StrStonePlate2_Addon) || Npc_HasItems(hero,ItWr_StrStonePlate3_Addon) || Npc_HasItems(hero,ItWr_DexStonePlate1_Addon) || Npc_HasItems(hero,ItWr_DexStonePlate2_Addon) || Npc_HasItems(hero,ItWr_DexStonePlate3_Addon) || Npc_HasItems(hero,ItWr_HitPointStonePlate1_Addon) || Npc_HasItems(hero,ItWr_HitPointStonePlate2_Addon) || Npc_HasItems(hero,ItWr_HitPointStonePlate3_Addon) || Npc_HasItems(hero,ItWr_ManaStonePlate1_Addon) || Npc_HasItems(hero,ItWr_ManaStonePlate2_Addon) || Npc_HasItems(hero,ItWr_ManaStonePlate3_Addon) || Npc_HasItems(hero,ItWr_OneHStonePlate1_Addon) || Npc_HasItems(hero,ItWr_OneHStonePlate2_Addon) || Npc_HasItems(hero,ItWr_OneHStonePlate3_Addon) || Npc_HasItems(hero,ItWr_TwoHStonePlate1_Addon) || Npc_HasItems(hero,ItWr_TwoHStonePlate2_Addon) || Npc_HasItems(hero,ItWr_TwoHStonePlate3_Addon) || Npc_HasItems(hero,ItWr_BowStonePlate1_Addon) || Npc_HasItems(hero,ItWr_BowStonePlate2_Addon) || Npc_HasItems(hero,ItWr_BowStonePlate3_Addon) || Npc_HasItems(hero,ItWr_CrsBowStonePlate1_Addon) || Npc_HasItems(hero,ItWr_CrsBowStonePlate2_Addon) || Npc_HasItems(hero,ItWr_CrsBowStonePlate3_Addon))
	{
		return TRUE;
	};

	return FALSE;
};

prototype Prototype_StonePlate(C_Item)
{
	name = "Древняя скрижаль";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	wear = WEAR_EFFECT;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	text[4] = StPl_MagicAuraText;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//------------------------------скрижали обычного языка Зодчих---------------------------------------------

instance ITWR_STAMINAPOINTSTONEPLATE(Prototype_StonePlate)
{
	name = "Древняя скрижаль";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	wear = WEAR_EFFECT;
	description = "Древняя скрижаль гонца";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_staminastoneplate;
};

func void use_staminastoneplate()
{
	var c_item StItem;
	var int staminaplusstone;
	var int startstamina;
	var string concatText;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if(ATR_STAMINA_MAX[0] < 100)
		{
			startstamina = ATR_STAMINA_MAX[0];
			ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;

			if(ATR_STAMINA_MAX[0] > 100)
			{
				staminaplusstone = 100 - startstamina;
				ATR_STAMINA_MAX[0] = 100;
				ATR_STAMINA[0] = ATR_STAMINA[0] + (staminaplusstone * 10);
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminaplusstone));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
				Snd_Play("SFX_HealObsession");
			}
			else
			{
				staminaplusstone = 1;
				ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminaplusstone));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
				Snd_Play("SFX_HealObsession");
			};
		}
		else
		{
			AI_Print(PRINT_NOMORESTAMINA);
		};
	}
	else
	{
		CreateInvItems(hero,ITWR_STAMINAPOINTSTONEPLATE,1);
		B_Say(self,self,"$CANTREADTHIS");
	};
};

instance ItWr_HitPointStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль целителя";
	on_state[0] = Use_HitPointStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

instance ItWr_HitPointStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль целителя";
	on_state[0] = Use_HitPointStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

instance ItWr_HitPointStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль целителя";
	on_state[0] = Use_HitPointStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

func void Use_HitPointStonePlate1()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		CreateInvItems(hero,ItWr_HitPointStonePlate1_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,10);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_RED",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_HitPointStonePlate2()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		CreateInvItems(hero,ItWr_HitPointStonePlate2_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,10);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_RED",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_HitPointStonePlate3()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		CreateInvItems(hero,ItWr_HitPointStonePlate3_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,10);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_RED",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};


//------------------------------скрижали языка воинов Зодчих---------------------------------------------

instance ItWr_StrStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль воина";
	on_state[0] = Use_StrStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};

instance ItWr_StrStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль воина";
	on_state[0] = Use_StrStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};

instance ItWr_StrStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль воина";
	on_state[0] = Use_StrStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};

func void Use_StrStonePlate1()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_StrStonePlate1_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,2);
		Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_StrStonePlate2()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_StrStonePlate2_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,2);
		Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_StrStonePlate3()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_StrStonePlate3_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,2);
		Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

instance ItWr_DexStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль охотника";
	on_state[0] = Use_DexStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};

instance ItWr_DexStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль охотника";
	on_state[0] = Use_DexStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};

instance ItWr_DexStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль охотника";
	on_state[0] = Use_DexStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};

func void Use_DexStonePlate1()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_DexStonePlate1_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,2);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_GREEN",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_DexStonePlate2()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_DexStonePlate2_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,2);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_GREEN",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_DexStonePlate3()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_DexStonePlate3_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,2);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_GREEN",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

instance ItWr_OneHStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль мечника";
	on_state[0] = Use_OneHStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};

instance ItWr_OneHStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль мечника";
	on_state[0] = Use_OneHStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};

func void Use_OneHStonePlate1()
{
	var c_item StItem;
	var string concatText;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_OneHStonePlate1_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseFightTalent_Bonus(self,NPC_TALENT_1H,1);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		concatText = ConcatStrings(PRINT_Learn1H," + ");
		concatText = ConcatStrings(concatText,IntToString(1));
		concatText = ConcatStrings(concatText," (Навык: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_1H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
	};
};

func void Use_OneHStonePlate2()
{
	var c_item StItem;
	var string concatText;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_OneHStonePlate2_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseFightTalent_Bonus(self,NPC_TALENT_1H,1);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		concatText = ConcatStrings(PRINT_Learn1H," + ");
		concatText = ConcatStrings(concatText,IntToString(1));
		concatText = ConcatStrings(concatText," (Навык: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_1H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
	};
};

instance ItWr_TwoHStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль копьеносца";
	on_state[0] = Use_TwoHStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};

instance ItWr_TwoHStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль копьеносца";
	on_state[0] = Use_TwoHStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};

func void Use_TwoHStonePlate1()
{
	var c_item StItem;
	var string concatText;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_TwoHStonePlate1_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseFightTalent_Bonus(self,NPC_TALENT_2H,1);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		concatText = ConcatStrings(PRINT_Learn2H," + ");
		concatText = ConcatStrings(concatText,IntToString(1));
		concatText = ConcatStrings(concatText," (Навык: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_2H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
	};
};

func void Use_TwoHStonePlate2()
{
	var c_item StItem;
	var string concatText;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_TwoHStonePlate2_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseFightTalent_Bonus(self,NPC_TALENT_2H,1);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		concatText = ConcatStrings(PRINT_Learn2H," + ");
		concatText = ConcatStrings(concatText,IntToString(1));
		concatText = ConcatStrings(concatText," (Навык: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_2H]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
	};
};

instance ItWr_BowStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль лучника";
	on_state[0] = Use_BowStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

instance ItWr_BowStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль лучника";
	on_state[0] = Use_BowStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

func void Use_BowStonePlate1()
{
	var c_item StItem;
	var string concatText;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_BowStonePlate1_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseFightTalent_Bonus(self,NPC_TALENT_BOW,1);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		concatText = ConcatStrings(PRINT_LearnBow," + ");
		concatText = ConcatStrings(concatText,IntToString(1));
		concatText = ConcatStrings(concatText," (Навык: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_BOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
	};
};

func void Use_BowStonePlate2()
{
	var c_item StItem;
	var string concatText;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_BowStonePlate2_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseFightTalent_Bonus(self,NPC_TALENT_BOW,1);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		concatText = ConcatStrings(PRINT_LearnBow," + ");
		concatText = ConcatStrings(concatText,IntToString(1));
		concatText = ConcatStrings(concatText," (Навык: ");
		concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_BOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
	};
};

instance ItWr_CrsBowStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль арбалетчика";
	on_state[0] = Use_CrsBowStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};

instance ItWr_CrsBowStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль арбалетчика";
	on_state[0] = Use_CrsBowStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};

func void Use_CrsBowStonePlate1()
{
	var c_item StItem;
	var string concatText;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_CrsBowStonePlate1_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseFightTalent_Bonus(self,NPC_TALENT_CROSSBOW,1);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		concatText = ConcatStrings(PRINT_LearnCrossbow," + ");
		concatText = ConcatStrings(concatText,IntToString(1));
		concatText = ConcatStrings(concatText," (Навык: ");
		concatText = ConcatStrings(concatText,IntToString(self.HitChance[NPC_TALENT_CROSSBOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
	};
};

func void Use_CrsBowStonePlate2()
{
	var c_item StItem;
	var string concatText;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	{
		CreateInvItems(hero,ItWr_CrsBowStonePlate2_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseFightTalent_Bonus(self,NPC_TALENT_CROSSBOW,1);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		concatText = ConcatStrings(PRINT_LearnCrossbow," + ");
		concatText = ConcatStrings(concatText,IntToString(1));
		concatText = ConcatStrings(concatText," (Навык: ");
		concatText = ConcatStrings(concatText,IntToString(self.HitChance[NPC_TALENT_CROSSBOW]));
		concatText = ConcatStrings(concatText,"%)");
		AI_Print(concatText);
	};
};

//------------------------------скрижали языка жрецов Зодчих---------------------------------------------

instance ItWr_ManaStonePlate1_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль жреца";
	on_state[0] = Use_ManaStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

instance ItWr_ManaStonePlate2_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль жреца";
	on_state[0] = Use_ManaStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

instance ItWr_ManaStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль жреца";
	on_state[0] = Use_ManaStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

func void Use_ManaStonePlate1()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		CreateInvItems(hero,ItWr_ManaStonePlate1_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(self,ATR_MANA,5);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_ManaStonePlate2()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		CreateInvItems(hero,ItWr_ManaStonePlate2_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(self,ATR_MANA,5);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_ManaStonePlate3()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		CreateInvItems(hero,ItWr_ManaStonePlate3_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(self,ATR_MANA,5);
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

instance ItWr_OneHStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль мудреца";
	on_state[0] = Use_OneHStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

instance ItWr_TwoHStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль мудреца";
	on_state[0] = Use_TwoHStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};
instance ItWr_BowStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль мудреца";
	on_state[0] = Use_BowStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};
instance ItWr_CrsBowStonePlate3_Addon(Prototype_StonePlate)
{
	description = "Древняя скрижаль мудреца";
	on_state[0] = Use_CrsBowStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};

func void Use_OneHStonePlate3()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		CreateInvItems(hero,ItWr_OneHStonePlate3_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_TwoHStonePlate3()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		CreateInvItems(hero,ItWr_TwoHStonePlate3_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_BowStonePlate3()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		CreateInvItems(hero,ItWr_BowStonePlate3_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};

func void Use_CrsBowStonePlate3()
{
	var c_item StItem;

	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		CreateInvItems(hero,ItWr_CrsBowStonePlate3_Addon,1);
		B_Say(self,self,"$CANTREADTHIS");
	}
	else
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
};