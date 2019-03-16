
const int Value_HpEssenz = 50;
const int HP_Essenz = 50;
const int Value_HpExtrakt = 75;
const int HP_Extrakt = 70;
const int Value_HpElixier = 100;
const int HP_Elixier = 100;
const int Value_ManaEssenz = 50;
const int Mana_Essenz = 50;
const int Value_ManaExtrakt = 75;
const int Mana_Extrakt = 75;
const int Value_ManaElixier = 100;
const int Mana_Elixier = 100;
const int Value_StrElixier = 1500;
const int STR_Elixier = 1;
const int STR_Elixier_Prof = 2;
const int Value_DexElixier = 1500;
const int DEX_Elixier = 1;
const int DEX_Elixier_Prof = 2;
const int DEX_Elixier_Test = 50;
const int Value_HpMaxElixier = 2000;
const int HPMax_Elixier = 20;
const int Value_ManaMaxElixier = 2000;
const int ManaMax_Elixier = 2;
const int ManaMax_Elixier_Prof = 4;
const int VALUE_MANAMAXELIXIER_HI = 3000;
const int MANAMAX_ELIXIER_HI = 4;
const int MANAMAX_ELIXIER_HI_Prof = 6;
const int VALUE_TYONPOTION = 10000;
const int MANAMAX_TYONPOTION = 10;
const int Value_MegaDrink = 2500;
const int STRorDEX_MegaDrink = 5;
const int Value_Speed = 250;
const int VALUE_SPEED_02 = 450;
const int VALUE_POACROBAT = 3000;
const int Time_Speed = 240000;
const int TIME_SPEED_02 = 420000;
const int TIME_SPEED_03 = 600000;
const int Value_ManaTrunk = 250;
const int Value_HpTrunk = 200;
const int STAMINAMAX_ELIXIER = 1;
const int UrTrall_Elixier = 2;
const int STR_DEX_M_1 = 2;
const int STR_DEX_M_2 = 3;
const int STR_DEX_M_3 = 4;
const int STR_DEX_M_1_Prof = 3;
const int STR_DEX_M_2_Prof = 4;
const int STR_DEX_M_3_Prof = 5;
const int HP_M_1 = 25;
const int HP_M_2 = 30;
const int HP_M_3 = 40;
const int Mana_M_1 = 4;
const int Mana_M_2 = 6;
const int Mana_M_3 = 8;
const int Mana_M_1_Prof = 6;
const int Mana_M_2_Prof = 8;
const int Mana_M_3_Prof = 10;
const int Stamina_M_1 = 2;
const int Stamina_M_2 = 3;
const int Stamina_M_3 = 4;


instance ItPo_Mana_01(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ManaEssenz;
	visual = "ItPo_Mana_01_Ex.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_01;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Эссенция маны";
	text[1] = NAME_BONUS_MANA_PROC;
	count[1] = 25;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_ManaEssenz;
	inv_animate = 1;
};


func void UseItPo_Mana_01()
{
	var int manares;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(SBMode == TRUE)
		{
			RestoreMana = TRUE;
			SumTempManaRes = FALSE;
			RestoreMana_Proc = (hero.attribute[ATR_MANA_MAX] * 25) / 100;
		}
		else
		{
			manares = 1 + ((self.attribute[ATR_MANA_MAX] * 25) / 100);
			Npc_ChangeAttribute(self,ATR_MANA,manares);

			if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
			};
		};
	}
	else
	{
		manares = 1 + ((self.attribute[ATR_MANA_MAX] * 25) / 100);
		Npc_ChangeAttribute(self,ATR_MANA,manares);

		if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		};
	};
};

func void UseItPo_Mana_01_Fast()
{
	var int manares;

	Snd_Play3d(hero,"BOTTLE_OPEN");

	if(SBMode == TRUE)
	{
		RestoreMana = TRUE;
		SumTempManaRes = FALSE;
		RestoreMana_Proc = (hero.attribute[ATR_MANA_MAX] * 25) / 100;
	}
	else
	{
		manares = 1 + ((hero.attribute[ATR_MANA_MAX] * 25) / 100);
		Npc_ChangeAttribute(hero,ATR_MANA,manares);

		if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};
	};
};

instance ItPo_Mana_02(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ManaExtrakt;
	visual = "ItPo_Mana_02_Ex.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_02;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Экстракт маны";
	text[1] = NAME_BONUS_MANA_PROC;
	count[1] = 50;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_ManaExtrakt;
	inv_animate = 1;
};

func void UseItPo_Mana_02()
{
	var int manares;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(SBMode == TRUE)
		{
			RestoreMana = TRUE;
			SumTempManaRes = FALSE;
			RestoreMana_Proc = (hero.attribute[ATR_MANA_MAX] * 50) / 100;
		}
		else
		{
			manares = 1 + ((self.attribute[ATR_MANA_MAX] * 50) / 100);
			Npc_ChangeAttribute(self,ATR_MANA,manares);

			if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
			};
		};
	}
	else
	{
		manares = 1 + ((self.attribute[ATR_MANA_MAX] * 50) / 100);
		Npc_ChangeAttribute(self,ATR_MANA,manares);

		if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		};
	};
};

func void UseItPo_Mana_02_Fast()
{
	var int manares;

	Snd_Play3d(hero,"BOTTLE_OPEN");

	if(SBMode == TRUE)
	{
		RestoreMana = TRUE;
		SumTempManaRes = FALSE;
		RestoreMana_Proc = (hero.attribute[ATR_MANA_MAX] * 50) / 100;
	}
	else
	{
		manares = 1 + ((hero.attribute[ATR_MANA_MAX] * 50) / 100);
		Npc_ChangeAttribute(hero,ATR_MANA,manares);

		if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};
	};
};

instance ItPo_Mana_03(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ManaElixier;
	visual = "ItPo_Mana_03_Ex.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_03;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Эликсир маны";
	text[1] = NAME_BONUS_MANA_PROC;
	count[1] = 75;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_ManaElixier;
	inv_animate = 1;
};

func void UseItPo_Mana_03()
{
	var int manares;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(SBMode == TRUE)
		{
			RestoreMana = TRUE;
			SumTempManaRes = FALSE;
			RestoreMana_Proc = (hero.attribute[ATR_MANA_MAX] * 75) / 100;
		}
		else
		{
			manares = 1 + ((self.attribute[ATR_MANA_MAX] * 75) / 100);
			Npc_ChangeAttribute(self,ATR_MANA,manares);

			if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
			};
		};
	}
	else
	{
		manares = 1 + ((self.attribute[ATR_MANA_MAX] * 75) / 100);
		Npc_ChangeAttribute(self,ATR_MANA,manares);

		if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		};
	};
};

func void UseItPo_Mana_03_Fast()
{
	var int manares;

	Snd_Play3d(hero,"BOTTLE_OPEN");

	if(SBMode == TRUE)
	{
		RestoreMana = TRUE;
		SumTempManaRes = FALSE;
		RestoreMana_Proc = (hero.attribute[ATR_MANA_MAX] * 75) / 100;
	}
	else
	{
		manares = 1 + ((hero.attribute[ATR_MANA_MAX] * 75) / 100);
		Npc_ChangeAttribute(hero,ATR_MANA,manares);

		if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};
	};
};

instance ItPo_Health_01(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItPo_Health_01_Ex.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_01;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Лечебная эссенция";
	text[1] = NAME_BONUS_HP_PROC;
	count[1] = 25;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
	inv_animate = 1;
};

func void UseItPo_Health_01()
{
	var int hpres;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(SBMode == TRUE)
		{
			RestoreHealth = TRUE;
			SumTempHPRes = FALSE;
			RestoreHealth_Proc = (hero.attribute[ATR_HITPOINTS_MAX] * 25) / 100;
		}
		else
		{
			hpres = 1 + ((self.attribute[ATR_HITPOINTS_MAX] * 25) / 100);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,hpres);

			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};
		};
	}
	else
	{
		hpres = 1 + ((self.attribute[ATR_HITPOINTS_MAX] * 25) / 100);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,hpres);

		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
	};
};

func void UseItPo_Health_01_Fast()
{
	var int hpres;

	Snd_Play3d(hero,"BOTTLE_OPEN");

	if(SBMode == TRUE)
	{
		RestoreHealth = TRUE;
		SumTempHPRes = FALSE;
		RestoreHealth_Proc = (hero.attribute[ATR_HITPOINTS_MAX] * 25) / 100;
	}
	else
	{
		hpres = 1 + ((hero.attribute[ATR_HITPOINTS_MAX] * 25) / 100);
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,hpres);

		if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};
	};
};

instance ItPo_Health_02(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpExtrakt;
	visual = "ItPo_Health_02_Ex.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_02;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Лечебный экстракт";
	text[1] = NAME_BONUS_HP_PROC;
	count[1] = 50;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpExtrakt;
	inv_animate = 1;
};

func void UseItPo_Health_02()
{
	var int hpres;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(SBMode == TRUE)
		{
			RestoreHealth = TRUE;
			SumTempHPRes = FALSE;
			RestoreHealth_Proc = (hero.attribute[ATR_HITPOINTS_MAX] * 50) / 100;
		}
		else
		{
			hpres = 1 + ((self.attribute[ATR_HITPOINTS_MAX] * 50) / 100);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,hpres);

			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};
		};
	}
	else
	{
		hpres = 1 + ((self.attribute[ATR_HITPOINTS_MAX] * 50) / 100);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,hpres);

		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
	};
};

func void UseItPo_Health_02_Fast()
{
	var int hpres;

	Snd_Play3d(hero,"BOTTLE_OPEN");

	if(SBMode == TRUE)
	{
		RestoreHealth = TRUE;
		SumTempHPRes = FALSE;
		RestoreHealth_Proc = (hero.attribute[ATR_HITPOINTS_MAX] * 50) / 100;
	}
	else
	{
		hpres = 1 + ((hero.attribute[ATR_HITPOINTS_MAX] * 50) / 100);
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,hpres);

		if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};
	};
};

instance ItPo_Health_03(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpElixier;
	visual = "ItPo_Health_03_Ex.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_03;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Лечебный эликсир";
	text[1] = NAME_BONUS_HP_PROC;
	count[1] = 75;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpElixier;
	inv_animate = 1;
};

instance ItPo_Perm_STR(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_StrElixier;
	visual = "ITPO_MAGIC_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_STR;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир силы";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_Elixier;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_StrElixier;
	inv_animate = 1;
};

func void UseItPo_Perm_STR()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_STRENGTH] > 50) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_DEXTERITY]) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_Elixier_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_Elixier);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_STR_M_Low(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_StrElixier;
	visual = "ITPO_MUTAGEN_STR_01.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_STR_M_Low;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир силы";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_DEX_M_1;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_StrElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_STR_M_Low()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_STRENGTH] > 50) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_DEXTERITY]) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_DEX_M_1_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_DEX_M_1);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_STR_M_Normal(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_StrElixier;
	visual = "ITPO_MUTAGEN_STR_02.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_STR_M_Normal;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир силы";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_DEX_M_2;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_StrElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_STR_M_Normal()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_STRENGTH] > 50) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_DEXTERITY]) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_DEX_M_2_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_DEX_M_2);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_STR_M_Strong(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_StrElixier;
	visual = "ITPO_MUTAGEN_STR_03.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_STR_M_Strong;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир силы";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_DEX_M_3;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_StrElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_STR_M_Strong()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_STRENGTH] > 50) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_DEXTERITY]) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_DEX_M_3_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_DEX_M_3);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_STR_Fake(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITPO_MAGIC_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_STR_Fake;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Эликсир силы";
	text[5] = NAME_Value;
	count[5] = 1;
	inv_animate = 1;
};

func void UseItPo_Perm_STR_Fake()
{
	Snd_Play3d(hero,"BOTTLE_OPEN");
};

instance ItPo_Perm_DEX(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DexElixier;
	visual = "ITPO_MAGIC_04.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_DEX;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир ловкости";
	text[1] = NAME_Bonus_Dex;
	count[1] = DEX_Elixier;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_DexElixier;
	inv_animate = 1;
};

func void UseItPo_Perm_DEX()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_DEXTERITY] > 50) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_STRENGTH]) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,DEX_Elixier_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,DEX_Elixier);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_Dex_M_Low(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DexElixier;
	visual = "ITPO_MUTAGEN_DEX_01.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Dex_M_Low;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир ловкости";
	text[1] = NAME_Bonus_Dex;
	count[1] = STR_DEX_M_1;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_DexElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Dex_M_Low()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_DEXTERITY] > 50) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_STRENGTH]) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,STR_DEX_M_1_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,STR_DEX_M_1);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_Dex_M_Normal(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DexElixier;
	visual = "ITPO_MUTAGEN_DEX_02.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Dex_M_Normal;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир ловкости";
	text[1] = NAME_Bonus_Dex;
	count[1] = STR_DEX_M_2;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_DexElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Dex_M_Normal()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_DEXTERITY] > 50) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_STRENGTH]) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,STR_DEX_M_2_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,STR_DEX_M_2);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_Dex_M_Strong(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DexElixier;
	visual = "ITPO_MUTAGEN_DEX_03.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Dex_M_Strong;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир ловкости";
	text[1] = NAME_Bonus_Dex;
	count[1] = STR_DEX_M_3;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_DexElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Dex_M_Strong()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_DEXTERITY] > 50) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_STRENGTH]) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,STR_DEX_M_3_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,STR_DEX_M_3);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_Health(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpMaxElixier;
	visual = "ITPO_PERM_HEALTH_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_Health;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир жизни";
	text[1] = NAME_Bonus_HpMax;
	count[1] = HPMax_Elixier;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpMaxElixier;
	inv_animate = 1;
};


func void UseItPo_Perm_Health()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HPMax_Elixier);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMax_Elixier);
	Snd_Play("LevelUP");
};

instance ItPo_Perm_Health_M_Low(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpMaxElixier;
	visual = "ITPO_MUTAGEN_HPS_01.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Health_M_Low;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир жизни";
	text[1] = NAME_Bonus_HpMax;
	count[1] = HP_M_1;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpMaxElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Health_M_Low()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HP_M_1);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_M_1);
	Snd_Play("LevelUP");
};

instance ItPo_Perm_Health_M_Normal(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpMaxElixier;
	visual = "ITPO_MUTAGEN_HPS_02.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Health_M_Normal;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир жизни";
	text[1] = NAME_Bonus_HpMax;
	count[1] = HP_M_2;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpMaxElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Health_M_Normal()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HP_M_2);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_M_2);
	Snd_Play("LevelUP");
};

instance ItPo_Perm_Health_M_Strong(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpMaxElixier;
	visual = "ITPO_MUTAGEN_HPS_03.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Health_M_Strong;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир жизни";
	text[1] = NAME_Bonus_HpMax;
	count[1] = HP_M_3;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpMaxElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Health_M_Strong()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HP_M_3);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_M_3);
	Snd_Play("LevelUP");
};

instance ItPo_Perm_Mana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ManaMaxElixier;
	visual = "ITPO_PERM_MANA_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Perm_Mana;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир духа";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = ManaMax_Elixier;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_ManaMaxElixier;
	inv_animate = 1;
};


func void UseItPo_Perm_Mana()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_MANA_MAX] > 50) && (self.aivar[REAL_MANA_MAX] > self.aivar[REAL_DEXTERITY]) && (self.aivar[REAL_MANA_MAX] > self.aivar[REAL_STRENGTH]))
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,ManaMax_Elixier_Prof);
		Npc_ChangeAttribute(self,ATR_MANA,ManaMax_Elixier_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,ManaMax_Elixier);
		Npc_ChangeAttribute(self,ATR_MANA,ManaMax_Elixier);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_Mana_M_Low(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ManaMaxElixier;
	visual = "ITPO_MUTAGEN_MAN_01.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Mana_M_Low;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир духа";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = Mana_M_1;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_ManaMaxElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Mana_M_Low()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_MANA_MAX] > 50) && (self.aivar[REAL_MANA_MAX] > self.aivar[REAL_DEXTERITY]) && (self.aivar[REAL_MANA_MAX] > self.aivar[REAL_STRENGTH]))
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,Mana_M_1_Prof);
		Npc_ChangeAttribute(self,ATR_MANA,Mana_M_1_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,Mana_M_1);
		Npc_ChangeAttribute(self,ATR_MANA,Mana_M_1);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_Mana_M_Normal(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ManaMaxElixier;
	visual = "ITPO_MUTAGEN_MAN_02.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Mana_M_Normal;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир духа";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = Mana_M_2;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_ManaMaxElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Mana_M_Normal()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_MANA_MAX] > 50) && (self.aivar[REAL_MANA_MAX] > self.aivar[REAL_DEXTERITY]) && (self.aivar[REAL_MANA_MAX] > self.aivar[REAL_STRENGTH]))
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,Mana_M_2_Prof);
		Npc_ChangeAttribute(self,ATR_MANA,Mana_M_2_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,Mana_M_2);
		Npc_ChangeAttribute(self,ATR_MANA,Mana_M_2);
	};

	Snd_Play("LevelUP");
};

instance ItPo_Perm_Mana_M_Strong(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ManaMaxElixier;
	visual = "ITPO_MUTAGEN_MAN_03.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Mana_M_Strong;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир духа";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = Mana_M_3;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_ManaMaxElixier;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Mana_M_Strong()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_MANA_MAX] > 50) && (self.aivar[REAL_MANA_MAX] > self.aivar[REAL_DEXTERITY]) && (self.aivar[REAL_MANA_MAX] > self.aivar[REAL_STRENGTH]))
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,Mana_M_3_Prof);
		Npc_ChangeAttribute(self,ATR_MANA,Mana_M_3_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,Mana_M_3);
		Npc_ChangeAttribute(self,ATR_MANA,Mana_M_3);
	};

	Snd_Play("LevelUP");
};

instance ITPO_TYONPOTION(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_MANAMAXELIXIER_HI;
	visual = "ITPO_PERM_DEX_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = useitpo_tyonpotion;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Зелье Идола Тиона";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = MANAMAX_TYONPOTION;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = VALUE_TYONPOTION;
	inv_animate = 1;
};

func void useitpo_tyonpotion()
{
	if(self.id == 0)
	{
		if(TYONPOTIONTEST == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,MANAMAX_TYONPOTION);
			Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_TYONPOTION);
			TYONPOTIONTEST = TRUE;
			TYONPOTIONTESTCOUNT = 0;
		}
		else
		{
			if(TYONPOTIONTESTCOUNT == 0)
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
				B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,10);
				Npc_ChangeAttribute(self,ATR_MANA,10);
			}
			else if(TYONPOTIONTESTCOUNT == 1)
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
				B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,5);
				Npc_ChangeAttribute(self,ATR_MANA,5);
			}
			else if(TYONPOTIONTESTCOUNT == 2)
			{
				Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
				B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,1);
				Npc_ChangeAttribute(self,ATR_MANA,1);
			}
			else if(TYONPOTIONTESTCOUNT >= 3)
			{
				B_GivePlayerXP(100);
			};
			TYONPOTIONTESTCOUNT = TYONPOTIONTESTCOUNT + 1;
		};
	};
};


instance ItPo_Speed(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Speed;
	visual = "ITPO_SPEED_01_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Speed;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Напиток ускорения";
	text[3] = "Позволяет временно увеличить скорость передвижения...";
	text[4] = NAME_Duration;
	count[4] = 2;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItPo_Speed()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Mdl_ApplyOverlayMdsTimed(self,"Humans_MageSprint.MDS",120000);

	if(bSprintTime == FALSE)
	{
		bSprintTime = 6840;
	};
};

instance ITPO_SPEED_02(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SPEED_02;
	visual = "ITPO_SPEED_02_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_speed_02;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Напиток двойного ускорения";
	text[3] = "Позволяет временно увеличить скорость передвижения...";
	text[4] = NAME_Duration;
	count[4] = 4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useitpo_speed_02()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Mdl_ApplyOverlayMdsTimed(self,"Humans_MageSprint.MDS",240000);

	if(bSprintTime == FALSE)
	{
		bSprintTime = 13680;
	};
};


instance ITPO_SPEED_03(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SPEED_02;
	visual = "ITPO_SPEED_03_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_speed_03;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Черный глорх";
	text[3] = "Позволяет временно увеличить скорость передвижения...";
	text[4] = NAME_Duration;
	count[4] = 12;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useitpo_speed_03()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Mdl_ApplyOverlayMdsTimed(self,"Humans_MageSprint.MDS",720000);

	if(bSprintTime == FALSE)
	{
		bSprintTime = 41040;
	};
};

instance ItPo_Stamina(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ITPO_STAMINA_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_stamina;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Напиток выносливости";
	text[1] = NAME_BONUS_STAPROC ;
	count[1] = 50;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_Stamina()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(ATR_STAMINA[0] < (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA[0] + (ATR_STAMINA_MAX[0] * 5);
	
			if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
			{
				ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
			};
		};
	};
};


func void Use_ItPo_Stamina_Fast()
{
	Snd_Play3d(hero,"BOTTLE_OPEN");

	if(ATR_STAMINA[0] < (ATR_STAMINA_MAX[0] * 10))
	{
		ATR_STAMINA[0] = ATR_STAMINA[0] + (ATR_STAMINA_MAX[0] * 5);
	
		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};
	};
};

instance ItPo_Perm_Stamina(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ITPO_PERM_STA_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_perm_stamina;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир выносливости";
	text[1] = NAME_BONUS_STAMINAMAX;
	count[1] = STAMINAMAX_ELIXIER;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_perm_stamina()
{
	var string concatText;
	var int staminabonus;
	var int startstamina;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(ATR_STAMINA_MAX[0] < 100)
		{
			startstamina = ATR_STAMINA_MAX[0];
			ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;

			if(ATR_STAMINA_MAX[0] > 100)
			{
				staminabonus = 100 - startstamina;
				ATR_STAMINA_MAX[0] = 100;
				ATR_STAMINA[0] = ATR_STAMINA[0] + (staminabonus * 10);
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Snd_Play("LevelUP");
			}
			else
			{
				staminabonus = 1;
				ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Snd_Play("LevelUP");
			};
		}
		else
		{
			AI_Print(PRINT_NOMORESTAMINA);
		};
	};
};

instance ItPo_Perm_Stamina_M_Low(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ITPO_PERM_STA_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Stamina_M_Low;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир выносливости";
	text[1] = NAME_BONUS_STAMINAMAX;
	count[1] = Stamina_M_1;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Stamina_M_Low()
{
	var string concatText;
	var int staminabonus;
	var int startstamina;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(ATR_STAMINA_MAX[0] < 100)
		{
			startstamina = ATR_STAMINA_MAX[0];
			ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + Stamina_M_1;

			if(ATR_STAMINA_MAX[0] > 100)
			{
				staminabonus = 100 - startstamina;
				ATR_STAMINA_MAX[0] = 100;
				ATR_STAMINA[0] = ATR_STAMINA[0] + (staminabonus * 10);
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Snd_Play("LevelUP");
			}
			else
			{
				staminabonus = Stamina_M_1;
				ATR_STAMINA[0] = ATR_STAMINA[0] + 20;
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Snd_Play("LevelUP");
			};
		}
		else
		{
			AI_Print(PRINT_NOMORESTAMINA);
		};
	};
};

instance ItPo_Perm_Stamina_M_Normal(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ITPO_PERM_STA_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Stamina_M_Normal;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир выносливости";
	text[1] = NAME_BONUS_STAMINAMAX;
	count[1] = Stamina_M_2;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Stamina_M_Normal()
{
	var string concatText;
	var int staminabonus;
	var int startstamina;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(ATR_STAMINA_MAX[0] < 100)
		{
			startstamina = ATR_STAMINA_MAX[0];
			ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + Stamina_M_2;

			if(ATR_STAMINA_MAX[0] > 100)
			{
				staminabonus = 100 - startstamina;
				ATR_STAMINA_MAX[0] = 100;
				ATR_STAMINA[0] = ATR_STAMINA[0] + (staminabonus * 10);
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Snd_Play("LevelUP");
			}
			else
			{
				staminabonus = Stamina_M_2;
				ATR_STAMINA[0] = ATR_STAMINA[0] + 30;
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Snd_Play("LevelUP");
			};
		}
		else
		{
			AI_Print(PRINT_NOMORESTAMINA);
		};
	};
};

instance ItPo_Perm_Stamina_M_Strong(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ITPO_PERM_STA_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Perm_Stamina_M_Strong;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мутагенный эликсир выносливости";
	text[1] = NAME_BONUS_STAMINAMAX;
	count[1] = Stamina_M_3;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_Perm_Stamina_M_Strong()
{
	var string concatText;
	var int staminabonus;
	var int startstamina;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(ATR_STAMINA_MAX[0] < 100)
		{
			startstamina = ATR_STAMINA_MAX[0];
			ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + Stamina_M_3;

			if(ATR_STAMINA_MAX[0] > 100)
			{
				staminabonus = 100 - startstamina;
				ATR_STAMINA_MAX[0] = 100;
				ATR_STAMINA[0] = ATR_STAMINA[0] + (staminabonus * 10);
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Snd_Play("LevelUP");
			}
			else
			{
				staminabonus = Stamina_M_3;
				ATR_STAMINA[0] = ATR_STAMINA[0] + 40;
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				concatText = ConcatStrings(concatText," (Всего: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Snd_Play("LevelUP");
			};
		}
		else
		{
			AI_Print(PRINT_NOMORESTAMINA);
		};
	};
};

instance ITPO_XMAGICDEF(C_Item)
{
	name = "Эликсир бессмертия";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5000;
	visual = "ITPO_MAGIE_01_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_xmagicdef;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Эликсир бессмертия";
	text[3] = "Этот зелье дарует бессмертие...";
	text[4] = "Правда лишь на некоторе время и всего один раз...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itpo_xmagicdef()
{
	if((self.id == 0) && (NETBEKPOTIONUSED == FALSE))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		self.flags = NPC_FLAG_IMMORTAL;
		NETBEKPOTIONUSED = TRUE;
	};
};

const int ITPO_TROLLDEFSTR = 2;
const int ITPO_TROLLPOINTDEFSTR = 2;

instance ITPO_PERM_DEF(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_POACROBAT;
	visual = "ItPo_Perm_Str_Ex.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_perm_def;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Зелье тролля";
	text[1] = NAME_BONUS_DEFMAX;
	count[1] = ITPO_TROLLDEFSTR;
	text[2] = NAME_BONUS_DEFPOINTMAX;
	count[2] = ITPO_TROLLPOINTDEFSTR;
	text[4] = "Делает кожу дубовой, как у тролля...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_perm_def()
{
	if(self.id == 0)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",self,self,0,0,0,FALSE);
		Snd_Play("TRO_WARN01");
		self.protection[PROT_EDGE] += ITPO_TROLLDEFSTR;
		self.protection[PROT_BLUNT] += ITPO_TROLLDEFSTR;
		self.protection[PROT_POINT] += ITPO_TROLLPOINTDEFSTR;
		REALPROTEDGE += ITPO_TROLLDEFSTR;
		REALPROTBL += ITPO_TROLLDEFSTR;
		REALPROTPO += ITPO_TROLLPOINTDEFSTR;
		AI_Print(PRINT_LEARNPROTWEAPONS);
	};
};

instance ITPO_XORCPOTION(C_Item)
{
	name = "Орочье зелье";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_orcpotion;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Эффект неизвестен...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useitpo_orcpotion()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 1000;
};

instance ITPO_XORCPOTION02(C_Item)
{
	name = "Орочье зелье";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_orcpotion02;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = name;
	text[3] = "Безопасно для использования...";
	text[4] = "Эффект неизвестен...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useitpo_orcpotion02()
{
	var string concatText;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};
	if(self.attribute[ATR_STRENGTH] >= self.attribute[ATR_DEXTERITY])
	{
		B_RaiseAttribute_Bonus_Many(self,ATR_STRENGTH,1);
		B_RaiseAttribute_Bonus_Many(self,ATR_MANA_MAX,-4);

		if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		};

		concatText = "Сила + 1, Мана - 4";
		AI_Print(concatText);
	}
	else
	{
		B_RaiseAttribute_Bonus_Many(self,ATR_DEXTERITY,1);
		B_RaiseAttribute_Bonus_Many(self,ATR_MANA_MAX,-4);

		if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		};

		concatText = "Ловкость + 1, Мана - 4";
		AI_Print(concatText);
	};
};

instance ItPo_MegaDrink(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_MegaDrink;
	visual = "ITPO_MAGIE_02_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_MegaDrink;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эмбарла Фиргасто";
	text[4] = "Эффект неизвестен...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItPo_MegaDrink()
{
	if(self.id == 0)
	{
		Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);

		if((self.attribute[ATR_STRENGTH] <= self.attribute[ATR_DEXTERITY]) && (self.attribute[ATR_MANA_MAX] <= self.attribute[ATR_DEXTERITY]))
		{
			B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,10);
		}
		else if((self.attribute[ATR_STRENGTH] <= self.attribute[ATR_MANA_MAX]) && (self.attribute[ATR_DEXTERITY] <= self.attribute[ATR_MANA_MAX]))
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,20);
		}
		else if((self.attribute[ATR_MANA_MAX] <= self.attribute[ATR_STRENGTH]) && (self.attribute[ATR_DEXTERITY] <= self.attribute[ATR_STRENGTH]))
		{
			B_RaiseAttribute_Bonus(self,ATR_STRENGTH,10);
		};

		Snd_Play("DRAGON_WRATH_01");
	};
};


instance ITPO_SOULRIVER(C_Item)
{
	name = "Вытяжка Душ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5000;
	visual = "ITPO_PERM_DEX_EX.3DS";
	material = MAT_GLAS;
	description = name;
	text[4] = "Вытяжка душ из сердца Люциана...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITPO_POISON(C_Item)
{
	name = "Сосуд с ядом";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_PoisonFlask.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_ITPO_POISON;
	scemeName = "MAPSEALED";
	description = name;
	text[4] = "Используется для отравления оружия...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ITPO_POISON()
{
	var string concatText;
	var C_Item PotionBlade;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if(PoisonBladeKnow == TRUE)
	{
		PotionBlade = Npc_GetEquippedMeleeWeapon(hero);

		if((Hlp_IsValidItem(PotionBlade) == TRUE) && (PotionBlade.damage[DAM_INDEX_MAGIC] == TRUE))
		{		
			if(PotionBlade.weight == FALSE)
			{
				PotionBlade.weight = TRUE;
				concatText = PotionBlade.visual_change;
				concatText = ConcatStrings(concatText," | Отравлено");
				PotionBlade.visual_change = concatText;
				PotionBlade.text[4] = concatText;
				PotionBladeID = Hlp_GetInstanceID(PotionBlade);
				AI_PrintClr(PRINT_PoisonedBlade,83,152,48);
				B_Say(self,self,"$ITEMREADY");
			}
			else
			{
				AI_PrintClr(PRINT_PoisonedBladeAlready,177,58,17);
				CreateInvItems(hero,ITPO_POISON,1);
			};
		}
		else
		{
			if(PotionBlade.nutrition == FALSE)
			{
				CreateInvItems(hero,ITPO_POISON,1);
				//Print(PRINT_NoPoisonedBladeType);
				AI_PrintClr(PRINT_NoPoisonedBladeType,177,58,17);
			}
			else
			{
				CreateInvItems(hero,ITPO_POISON,1);
				//Print(PRINT_NoPoisonedBlade);
				AI_PrintClr(PRINT_NoPoisonedBlade,177,58,17);
			};
		};
	}
	else
	{
		Wld_PlayEffect("SPELLFX_BLOODDEAD3",self,self,0,0,0,FALSE);
		//Wld_PlayEffect("POISONED_FX",self,self,0,0,0,FALSE);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	};
};

instance ITPO_BLOODFLYPOISON(C_Item)
{
	name = "Пузырек с ядом";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_PoisonFlask.3DS";
	material = MAT_GLAS;
	on_state[0] = usebloodflypoison;
	scemeName = "POTION";
	description = name;
	text[3] = "Этот яд приготовлен из секрета жал ядовитых мух...";
	text[4] = "Обращаться ОЧЕНЬ осторожно!";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void usebloodflypoison()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Wld_PlayEffect("SPELLFX_BLOODDEAD3",self,self,0,0,0,FALSE);
	//Wld_PlayEffect("POISONED_FX",self,self,0,0,0,FALSE);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

instance ItMi_NrozasPoison(C_Item)
{
	name = "Яд Нрозаса";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_PoisonFlask.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_ItMi_NrozasPoison;
	scemeName = "POTION";
	description = name;
	text[3] = "Этот яд приготовлен мастером Нрозасом...";
	text[4] = "Смертельно! Источает очень сильный запах...";
	inv_animate = 1;
};

func void Use_ItMi_NrozasPoison()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Wld_PlayEffect("SPELLFX_BLOODDEAD3",self,self,0,0,0,FALSE);
	//Wld_PlayEffect("POISONED_FX",self,self,0,0,0,FALSE);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

instance ItMi_NrozasPoisonOsair(C_Item)
{
	name = "Яд Нрозаса";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_PoisonFlask.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_ItMi_NrozasPoisonOsair;
	scemeName = "POTION";
	description = name;
	text[3] = "Этот яд приготовлен мастером Нрозасом для Осаира...";
	text[4] = "Смертельно! Источает очень сильный запах...";
	inv_animate = 1;
};

func void Use_ItMi_NrozasPoisonOsair()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Wld_PlayEffect("SPELLFX_BLOODDEAD3",self,self,0,0,0,FALSE);
	//Wld_PlayEffect("POISONED_FX",self,self,0,0,0,FALSE);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

instance ItMi_NrozasPoisonHalf(C_Item)
{
	name = "Яд Нрозаса";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_PoisonFlask.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_ItMi_NrozasPoisonHalf;
	scemeName = "POTION";
	description = name;
	text[3] = "Этот яд приготовлен мастером Нрозасом...";
	text[4] = "Смертельно! Источает очень сильный запах...";
	text[5] = "Пузырек заполнен только наполовину";
	inv_animate = 1;
};

func void Use_ItMi_NrozasPoisonHalf()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Wld_PlayEffect("SPELLFX_BLOODDEAD3",self,self,0,0,0,FALSE);
	//Wld_PlayEffect("POISONED_FX",self,self,0,0,0,FALSE);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

instance ITPO_ELIGORFIRE(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 7000;
	visual = "ITPO_FIRE_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_eligorfire;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Пламя Элигора";
	text[1] = NAME_Prot_Fire;
	count[1] = 15;
	text[4] = "Магическая эссенция из железы красного дракона...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_eligorfire()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
	Snd_Play("DEM_WARN01");
	self.protection[PROT_FIRE] += 15;
	REALPROTFIRE += 15;
	AI_Print(PRINT_LEARNPROTFIRES);
};

instance ITPO_WATERFIRE(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1000;
	visual = "ITPO_WATER_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = use_itpo_waterfire;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Ледяной покров";
	text[1] = NAME_Prot_Magic;
	count[1] = 15;
	text[4] = "Магическое зелье из кристально чистого льда...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_waterfire()
{
	Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	self.protection[PROT_MAGIC] += 15;
	REALPROTMAGIC += 15;
	AI_Print("Защита от магии + 15");
};

instance ITPO_MEGAPOTIONSKILL(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5000;
	visual = "ITPO_MAGIC_02.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_megapotionskill;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир власти";
	text[1] = NAME_Bonus_Str;
	count[1] = 1;
	text[2] = NAME_Bonus_Dex;
	count[2] = 1;
	text[3] = NAME_Bonus_ManaMax;
	count[3] = 5;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useitpo_megapotionskill()
{
	var string concatText;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute_Bonus_Many(self,ATR_MANA_MAX,5);
	B_RaiseAttribute_Bonus_Many(self,ATR_DEXTERITY,1);
	B_RaiseAttribute_Bonus_Many(self,ATR_STRENGTH,1);
	Npc_ChangeAttribute(self,ATR_MANA,5);
	concatText = "Сила + 1, Ловкость + 1, Мана + 5";
	AI_Print(concatText);
};

instance ITPO_SAGITTACLAWPOTION(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 350;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_sagittaclawpotion;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Лекарство Сагитты";
	text[4] = "Это лекарство Сагитта приготовила для Клыка...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_sagittaclawpotion()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Npc_ChangeAttribute(self,ATR_HITPOINTS,ATR_HITPOINTS_MAX);
};

instance ITPO_MAGDEFENCE(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpMaxElixier;
	visual = "ITPO_MAGIE_02_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_magdefence;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир защиты от магии";
	text[1] = NAME_Prot_Magic;
	count[1] = 1;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpMaxElixier;
	inv_animate = 1;
};

func void use_itpo_magdefence()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	self.protection[PROT_MAGIC] += 1;
	REALPROTMAGIC += 1;
	AI_Print("Защита от магии + 1");
};

instance ITPO_INTELLECT(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpMaxElixier;
	visual = "ITPO_PERM_DEX_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = use_itpo_intellect;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир разума";
	text[1] = NAME_Bonus_Int;
	count[1] = 2;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpMaxElixier;
	inv_animate = 1;
};

func void use_itpo_intellect()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	ATR_INTELLECT = ATR_INTELLECT + 2;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	AI_Print("Интеллект + 2");
};

instance ItPo_Troll_Stamina(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ITPO_MAGIC_03.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Troll_Stamina;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эссенция выносливости из сердец тролля";
	text[1] = NAME_BONUS_STM;
	count[1] = 1;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_Troll_Stamina()
{
	var string concatText;
	var int staminabonus;
	var int startstamina;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(ATR_STAMINA_MAX[0] < 100)
		{
			startstamina = ATR_STAMINA_MAX[0];
			ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 1;

			if(ATR_STAMINA_MAX[0] > 100)
			{
				staminabonus = 100 - startstamina;
				ATR_STAMINA_MAX[0] = 100;
				ATR_STAMINA[0] = ATR_STAMINA[0] + (staminabonus * 10);
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				AI_Print(concatText);
				Snd_Play("LevelUP");
			}
			else
			{
				staminabonus = 1;
				ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				AI_Print(concatText);
				Snd_Play("LevelUP");
			};
		}
		else
		{
			AI_Print(PRINT_NOMORESTAMINA);
		};
	};
};

instance ITPO_FIREDEFENCE(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 3000;
	visual = "ITPO_MAGIE_01_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_firedefence;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир защиты от огня";
	text[1] = NAME_Prot_Fire;
	count[1] = 1;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_firedefence()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
	self.protection[PROT_FIRE] += 1;
	REALPROTFIRE += 1;
	AI_Print("Защита от огня + 1");
};

instance ITPO_PERM_DEX_DRACONIAN(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DexElixier;
	visual = "ITPO_MAGIC_04.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_dex_draconian;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир ловкости из сердец драконьих ящеров";
	text[1] = NAME_Bonus_Dex;
	count[1] = 1;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_DexElixier;
	inv_animate = 1;
};

func void useitpo_perm_dex_draconian()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_DEXTERITY] > 50) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_STRENGTH]) && (self.aivar[REAL_DEXTERITY] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,DEX_Elixier_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,DEX_Elixier);
	};

	Snd_Play("LevelUP");
};


instance ITPO_PERM_STR_ORC(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_StrElixier;
	visual = "ITPO_MAGIC_03.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_str_orc;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир силы из сердец орков";
	text[1] = NAME_Bonus_Str;
	count[1] = 1;
	text[4] = "Возможен дополнительный эффект при использовании...";
	text[5] = NAME_Value;
	count[5] = Value_StrElixier;
	inv_animate = 1;
};


func void useitpo_perm_str_orc()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if((self.aivar[REAL_STRENGTH] > 50) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_DEXTERITY]) && (self.aivar[REAL_STRENGTH] > self.aivar[REAL_MANA_MAX]))
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_Elixier_Prof);
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_Elixier);
	};

	Snd_Play("LevelUP");
};


instance ITPO_FALLDEFENCE(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 300;
	visual = "ITPO_BLACK_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_falldefence;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Эликсир защиты от падения";
	text[1] = NAME_Sec_Duration;
	count[1] = 15;
	text[4] = "Эффект накапливается при частом использовании...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_falldefence()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SKELETON_FLY.MDS",15000);
	self.protection[PROT_FALL] += 1;
};

instance ITPO_ANPOIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 25;
	visual = "ItPo_Unpoison_New_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_anpois;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Противоядие";
	text[4] = "Снимает эффект отравления и нейтрализует яд...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useitpo_anpois()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	POISONED = FALSE;
	POISONED_TIC = FALSE;
	CanPoisonMe = FALSE;
	MM_Poison_01_Up = FALSE;
	MM_Poison_02_Up = FALSE;
	MM_Poison_03_Up = FALSE;
	TimerPoisonUpTic = FALSE;
	TimerPoisonUp = FALSE;
};

func void useitpo_anpois_fast()
{
	Snd_Play3d(hero,"BOTTLE_OPEN");
	POISONED = FALSE;
	POISONED_TIC = FALSE;
	CanPoisonMe = FALSE;
	MM_Poison_01_Up = FALSE;
	MM_Poison_02_Up = FALSE;
	MM_Poison_03_Up = FALSE;
	TimerPoisonUpTic = FALSE;
	TimerPoisonUp = FALSE;
};

instance ItPo_UrTrallPotion(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ITPO_MAGIC_03.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_UrTrallPotion;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Древний эликсир орков";
	text[1] = NAME_Bonus_Str;
	count[1] = UrTrall_Elixier;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_UrTrallPotion()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute_Bonus(self,ATR_STRENGTH,UrTrall_Elixier);
};

instance ItPo_Memories(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ITPO_PERM_DEX_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Memories;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Напиток воспоминаний";
	text[3] = "Воздействует странным образом на разум";
	text[4] = ", оживляя в памяти забытые воспоминания...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_Memories()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		CreateInvItems(self,ItPo_Memories,1);
	};

	AI_StartState(self,ZS_MagicSleep,1,"");
};


instance ITPO_BREATH_OF_DEATH(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 30000;
	visual = "ITPO_MAGIE_01_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_breath_of_death;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Дыхание смерти";
	text[4] = "Используется для ритуала темного освящения...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_breath_of_death()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};


	if(self.level <= 50)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,50);
		Npc_ChangeAttribute(self,ATR_MANA,50);
	};
};

instance ITPO_NECROM_POTION_01(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1000;
	visual = "ITPO_MAGIC_02.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_necrom_potion_01;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Радость Некроманта";
	text[4] = "Если не уверен, что пойдет на пользу, лучше вылей и забудь...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itpo_necrom_potion_01()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};


	if(self.guild != GIL_KDM)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,2);
		Npc_ChangeAttribute(self,ATR_MANA,2);
	};
};

instance ITPO_DEMON_POTION(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 5000;
	visual = "ITPO_BLACK_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_demon_potion;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Темная мудрость";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_demon_potion()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};


	if(self.guild != GIL_KDM)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(self,ATR_MANA,5);
	};
};

instance ITPO_DEMON_POTION_BAD(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10000;
	visual = "ITPO_BLACK_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = use_itpo_demon_potion_bad;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Зловещий коктейль";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_demon_potion_bad()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};


	if(self.guild != GIL_KDM)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(self,ATR_MANA,5);
	};
};

instance ITPO_PERM_DEX_SUPER(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DexElixier;
	visual = "ITPO_MAGIC_04.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_dex_super;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир божественной ловкости";
	text[1] = NAME_Bonus_Dex;
	count[1] = 15;
	text[5] = NAME_Value;
	count[5] = 3500;
	inv_animate = 1;
};


func void useitpo_perm_dex_super()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,15);
};


instance ItPo_DemonBlood(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1000;
	visual = "ITPO_MAGIE_01_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_DemonBlood;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Демоническая кровь";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 25;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_DemonBlood()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,25);
	Npc_ChangeAttribute(self,ATR_MANA,25);
};

instance ITPO_SOULPOTION(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 5000;
	visual = "ITPO_PERM_DEX_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = use_itpo_soulpotion;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Темная Душа";
	text[4] = "Изготовлено из магической субстанции камней-душ...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itpo_soulpotion()
{
	var int rnd_bonus;

	rnd_bonus = Hlp_Random(4);

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if(rnd_bonus == 0)
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,3);
	}
	else if(rnd_bonus == 1)
	{
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,3);
	}
	else if(rnd_bonus == 2)
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,25);
		Npc_ChangeAttribute(self,ATR_MANA,25);
	}
	else if(rnd_bonus == 3)
	{
		B_RaiseAttribute_Bonus(self,ATR_HITPOINTS_MAX,50);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,50);
	};
};

instance ItPo_DragonMind_Epic(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 2000;
	visual = "ITPO_FIRE_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_DragonMind_Epic;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Мудрость дракона";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 50;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_DragonMind_Epic()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,50);
	Npc_ChangeAttribute(self,ATR_MANA,50);
};

instance ItPo_AncientPotion(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2500;
	visual = "ITPO_PERM_DEX_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_AncientPotion;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир божественного разума";
	text[1] = NAME_Bonus_Int;
	count[1] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpMaxElixier;
	inv_animate = 1;
};

func void Use_ItPo_AncientPotion()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	ATR_INTELLECT = ATR_INTELLECT + 10;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	AI_Print("Интеллект + 10");
};

instance ItPo_Sleeper(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5000;
	visual = "ITPO_PERM_DEX_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_Sleeper;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир Спящего";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 100;
	text[2] = NAME_Bonus_Int;
	count[2] = 15;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpMaxElixier;
	inv_animate = 1;
};

func void Use_ItPo_Sleeper()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,100);
	Npc_ChangeAttribute(self,ATR_MANA,100);
	ATR_INTELLECT = ATR_INTELLECT + 15;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	AI_Print("Интеллект + 15");
};

instance ItPo_ElixirSHadow(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 2000;
	visual = "ITPO_BLACK_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_ElixirSHadow;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Черный туман";
	text[3] = "Окутывает выпившего пеленой, делая его полностью невидимым";
	text[4] = "Время действия эликсира неизвестно...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_ElixirSHadow()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	if(HeroDragonLook == FALSE)
	{
		//Wld_PlayEffect("DRAGONLOOK_FX",hero,hero,0,0,0,FALSE);
		HeroDragonLook = TRUE;
	};

	HeroInvisibleTimerNow = 120 + Hlp_Random(60);
	Wld_PlayEffect("SPELLFX_FOG_SMOKE",hero,hero,0,0,0,FALSE);
	HeroInvisible = TRUE;
	HeroInvisibleTimer = FALSE;
};

instance ItPo_UndeadShield(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1000;
	visual = "ITPO_BLACK_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_UndeadShield;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Вуаль смерти";
	text[3] = "Превращает выпившего в нежить";
	text[4] = "Время действия эликсира неизвестно...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItPo_UndeadShield()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	ConvertToUndead = TRUE;
};

instance ItPo_Addon_Geist_01(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ITPO_PERM_DEX_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Geist_01;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Зелье изменения сознания";
	text[3] = "Очень сильно воздействующее на сознание зелье...";
	text[4] = "Применять с осторожностью!!!";
	text[5] = NAME_Value;
	count[5] = Value_ManaEssenz;
	inv_animate = 1;
};

func void UseItPo_Geist_01()
{
	Snd_Play3d(hero,"BOTTLE_OPEN");
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 1000;
};

instance ItPo_Addon_Geist_02(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ITPO_PERM_DEX_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Geist_02;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Зелье изменения сознания";
	text[3] = "Очень сильно воздействующее на сознание зелье...";
	text[4] = "Применять с осторожностью!!!";
	text[5] = NAME_Value;
	count[5] = Value_ManaEssenz;
	inv_animate = 1;
};

func void UseItPo_Geist_02()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		B_GivePlayerXP(XP_Ambient * 5);
	};
};

instance ItPo_Health_Addon_04_New(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpElixier;
	visual = "ITPO_HEALTH_03_EX.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_03;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Лечебная настойка из жал";
	text[1] = NAME_BONUS_HP_PROC;
	count[1] = 100;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_HpTrunk;
	inv_animate = 1;
};

func void UseItPo_Health_03()
{
	var int hpres;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(SBMode == TRUE)
		{
			RestoreHealth = TRUE;
			SumTempHPRes = FALSE;
			RestoreHealth_Proc = hero.attribute[ATR_HITPOINTS_MAX];
		}
		else
		{
			hpres = self.attribute[ATR_HITPOINTS_MAX];
			Npc_ChangeAttribute(self,ATR_HITPOINTS,hpres);

			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};
		};
	}
	else
	{
		hpres = 1 + ((self.attribute[ATR_HITPOINTS_MAX] * 75) / 100);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,hpres);

		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
	};
};

func void UseItPo_Health_03_Fast()
{
	var int hpres;

	Snd_Play3d(hero,"BOTTLE_OPEN");

	if(SBMode == TRUE)
	{
		RestoreHealth = TRUE;
		SumTempHPRes = FALSE;
		RestoreHealth_Proc = hero.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		hpres = hero.attribute[ATR_HITPOINTS_MAX];
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,hpres);

		if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};
	};
};

instance ItPo_Health_Addon_04(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpTrunk;
	visual = "ITPO_HEALTH_04.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_04;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Эликсир чистой жизненной энергии";
	text[1] = NAME_BONUS_HP_PROC_ELITE;
	count[1] = 50;
	text[5] = NAME_Value;
	count[5] = Value_HpTrunk;
};

func void UseItPo_Health_04()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(SBMode == TRUE)
		{
			Snd_Play3d(hero,"BOTTLE_OPEN");
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (self.attribute[ATR_HITPOINTS_MAX] / 2);

			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

func void UseItPo_Health_04_Fast()
{
	Snd_Play3d(hero,"BOTTLE_OPEN");

	if(SBMode == TRUE)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + (hero.attribute[ATR_HITPOINTS_MAX] / 2);

		if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};
	}
	else
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ItPo_Mana_Addon_04(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ManaTrunk;
	visual = "ItPo_Mana_04.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_04;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Эликсир чистой магической энергии";
	text[1] = NAME_BONUS_MANA_PROC_ELITE;
	count[1] = 50;
	text[5] = NAME_Value;
	count[5] = Value_ManaTrunk;
};

func void UseItPo_Mana_04()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(SBMode == TRUE)
		{
			Snd_Play3d(hero,"BOTTLE_OPEN");
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + (self.attribute[ATR_MANA_MAX] / 2);

			if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
			};
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		};
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

func void UseItPo_Mana_04_Fast()
{
	Snd_Play3d(hero,"BOTTLE_OPEN");

	if(SBMode == TRUE)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + (hero.attribute[ATR_MANA_MAX] / 2);

		if(hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};
	}
	else
	{
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	};
};

instance ItPo_GuardiansElixir(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ITPO_WATER_EX.3DS";
	material = MAT_GLAS;
	on_state[0] = Use_ItPo_GuardiansElixir;
	scemeName = "POTION";
	wear = WEAR_EFFECT;
	description = "Эликсир Хранителя";
	text[1] = NAME_Prot_Magic;
	count[1] = 5;
	text[2] = NAME_Prot_Fire;
	count[2] = 5;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = 1000;
	inv_animate = 1;
};

func void Use_ItPo_GuardiansElixir()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	self.protection[PROT_MAGIC] += 5;
	self.protection[PROT_FIRE] += 5;
	REALPROTMAGIC += 5;
	REALPROTFIRE += 5;
	AI_Print("Защита от огня и магии + 5");
};

instance ItFo_AdanosWater(C_Item)
{
	name = "Вода Аданоса";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItFo_Water.3ds";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_ItFo_AdanosWater;
	description = name;
	text[4] = "Священная вода Аданоса...";
	inv_animate = 1;
};

func void Use_ItFo_AdanosWater()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play("BLESSED_WEAPON");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + (self.attribute[ATR_HITPOINTS_MAX] / 2);

		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};

		ATR_STAMINA[0] = ATR_STAMINA[0] + (ATR_STAMINA_MAX[0] * 5);

		if(ATR_STAMINA[0] > ATR_STAMINA_MAX[0] * 10)
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 5;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		Hero_Fatigue = Hero_Fatigue + 5;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
	};
};

func void Use_ItFo_AdanosWater_Fast()
{
	Snd_Play("BLESSED_WEAPON");
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + (hero.attribute[ATR_HITPOINTS_MAX] / 2);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA[0] + (ATR_STAMINA_MAX[0] * 5);

	if(ATR_STAMINA[0] > ATR_STAMINA_MAX[0] * 10)
	{
		ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
	};

	Hero_Thirst = Hero_Thirst + 5;

	if(Hero_Thirst > 5)
	{
		Hero_Thirst = 5;
	};

	Hero_Fatigue = Hero_Fatigue + 5;

	if(Hero_Fatigue >= 10)
	{
		Hero_Fatigue = 10;
	};
};

instance ItFo_Alcohol(C_Item)
{
	name = "Чистый спирт";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 25;
	visual = "ITFO_ALCH_NEW.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_ItFo_Alcohol;
	description = name;
	text[3] = "Снимает эффект болезни...";
	text[4] = "Используется для приготовления напитков и зелий...";
	text[5] = NAME_Value;
	count[5] = Value_Booze;
	inv_animate = 1;
};

func void Use_ItFo_Alcohol()
{
	var int rand;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Npc_ChangeAttribute(self,ATR_HITPOINTS,-10);
	B_Say(self,self,"$COUGH");

	if(PlayerIsSick == TRUE)
	{
		TempPlayerIsSick = FALSE;
		PlayerIsSick = FALSE;
	}
	else
	{
		if(Npc_IsPlayer(self))
		{
			rand = Hlp_Random(2);

			if(rand == FALSE)
			{
				Mdl_ApplyOverlayMdsTimed(self,"Humans_Drunken.MDS",100000);
			}
			else
			{
				Mdl_ApplyOverlayMdsTimed(self,"Humans_DrunkenExt.MDS",100000);
			};
		}
		else
		{
			rand = Hlp_Random(2);

			if(rand == FALSE)
			{
				if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_187_melhior))
				{
					Mdl_ApplyOverlayMdsTimed(self,"Humans_Drunken.MDS",100000);
				}
				else if((self.guild != GIL_PAL) && (self.guild != GIL_KDW) && (self.guild != GIL_KDF) && (self.guild != GIL_KDM) && (self.guild != GIL_GUR) && (self.guild != GIL_NOV) && (self.guild != GIL_TPL) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(vlk_986_viper)))
				{
					Mdl_ApplyOverlayMdsTimed(self,"Humans_Drunken.MDS",60000);
				};
			}
			else
			{
				if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pal_187_melhior))
				{
					Mdl_ApplyOverlayMdsTimed(self,"Humans_DrunkenExt.MDS",100000);
				}
				else if((self.guild != GIL_PAL) && (self.guild != GIL_KDW) && (self.guild != GIL_KDF) && (self.guild != GIL_KDM) && (self.guild != GIL_GUR) && (self.guild != GIL_NOV) && (self.guild != GIL_TPL) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(vlk_986_viper)))
				{
					Mdl_ApplyOverlayMdsTimed(self,"Humans_DrunkenExt.MDS",60000);
				};
			};
		};
	};
};

func void Use_ItFo_Alcohol_Fast()
{
	var int rand;

	Snd_Play3d(hero,"BOTTLE_OPEN");
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,-10);
	B_Say(hero,hero,"$COUGH");

	if(PlayerIsSick == TRUE)
	{
		TempPlayerIsSick = FALSE;
		PlayerIsSick = FALSE;
	};
};

instance ItMi_HolyWater(C_Item)
{
	name = "Святая вода";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HolyWater;
	on_state[0] = use_water_blessed;
	visual = "ItFo_Water.3ds";
	scemeName = "POTIONFAST";
	material = MAT_GLAS;
	description = name;
	text[3] = "Немного снижает усталость...";
	text[4] = "Снимает эффект проклятия...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

var int bless_count;

func void use_water_blessed()
{
	if(Npc_IsPlayer(self))
	{
		if((SBMODE == TRUE) && (HolyRest == FALSE))
		{
			Hero_Fatigue = Hero_Fatigue + 3;

			if(Hero_Fatigue >= 10)
			{
				Hero_Fatigue = 10;
			};

			HolyRest = TRUE;
		};
		if(PlayerIsCurse == TRUE)
		{
			TempPlayerIsCurse = FALSE;
			PlayerIsCurse = FALSE;
		};
	};
};

func void use_water_blessed_fast()
{
	if((SBMODE == TRUE) && (HolyRest == FALSE))
	{
		Hero_Fatigue = Hero_Fatigue + 3;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};

		HolyRest = TRUE;
	};
	if(PlayerIsCurse == TRUE)
	{
		TempPlayerIsCurse = FALSE;
		PlayerIsCurse = FALSE;
	};
};

func void B_Hotkey_Health_Potion()
{
	if(SBMode != TRUE)
	{
		SumTempHPRes = FALSE;
		RestoreHealth_Proc = FALSE;
		RestoreHealth = FALSE;
	};
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if((Npc_HasItems(hero,ItFo_AdanosWater) >= 1) && (hero.attribute[ATR_HITPOINTS_MAX] > hero.attribute[ATR_HITPOINTS]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItFo_AdanosWater);
		}
		else if((Npc_HasItems(hero,ItPo_Health_Addon_04) >= 1) && (hero.attribute[ATR_HITPOINTS_MAX] > hero.attribute[ATR_HITPOINTS]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Health_Addon_04);
		}
		else if((Npc_HasItems(hero,ItPo_Health_Addon_04_New) >= 1) && (RestoreHealth == FALSE) && (hero.attribute[ATR_HITPOINTS_MAX] > hero.attribute[ATR_HITPOINTS]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Health_Addon_04_New);	
		}
		else if((Npc_HasItems(hero,ItPo_Health_03) >= 1) && (RestoreHealth == FALSE) && (hero.attribute[ATR_HITPOINTS_MAX] > hero.attribute[ATR_HITPOINTS]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Health_03);
		}
		else if((Npc_HasItems(hero,ItPo_Health_02) >= 1) && (RestoreHealth == FALSE) && (hero.attribute[ATR_HITPOINTS_MAX] > hero.attribute[ATR_HITPOINTS]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Health_02);
		}
		else if((Npc_HasItems(hero,ItPo_Health_01) >= 1) && (RestoreHealth == FALSE) && (hero.attribute[ATR_HITPOINTS_MAX] > hero.attribute[ATR_HITPOINTS]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Health_01);	
		}
		else if(RestoreHealth == TRUE)
		{
			AI_Print("Вы уже выпили напиток восстановления жизненной энергии...");
		}
		else if(hero.attribute[ATR_HITPOINTS_MAX] == hero.attribute[ATR_HITPOINTS])
		{
			AI_Print("У вас максимальное количество жизненной энергии! ");
		}
		else
		{
			AI_Print("У вас нет напитков восстановления жизненной энергии...");
		};
	};
};

func void B_Hotkey_Mana_Potion()
{
	if(SBMode != TRUE)
	{
		SumTempManaRes = FALSE;
		RestoreMana_Proc = FALSE;
		RestoreMana = FALSE;
	};
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if((Npc_HasItems(hero,ItPo_Mana_Addon_04) >= 1) && (hero.attribute[ATR_MANA_MAX] > hero.attribute[ATR_MANA]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Mana_Addon_04);	
		}
		else if((Npc_HasItems(hero,ItPo_Mana_03) >= 1) && (RestoreMana == FALSE) && (hero.attribute[ATR_MANA_MAX] > hero.attribute[ATR_MANA]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Mana_03);
		}
		else if((Npc_HasItems(hero,ItPo_Mana_02) >= 1) && (RestoreMana == FALSE) && (hero.attribute[ATR_MANA_MAX] > hero.attribute[ATR_MANA]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Mana_02);
		}
		else if((Npc_HasItems(hero,ItPo_Mana_01) >= 1) && (RestoreMana == FALSE) && (hero.attribute[ATR_MANA_MAX] > hero.attribute[ATR_MANA]))
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Mana_01);
		}
		else if(RestoreMana == TRUE)
		{
			AI_Print("Вы уже выпили напиток восстановления магической энергии...");
		}
		else if(hero.attribute[ATR_MANA_MAX] == hero.attribute[ATR_MANA])
		{
			AI_Print("У вас максимальное количество магической энергии! ");
		}
		else
		{
			AI_Print("У вас нет напитков восстановления магической энергии...");
		};
	};
};

func void B_Hotkey_Stamina_Potion()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if(Npc_HasItems(hero,ItPo_Stamina) >= 1)
		{
			AI_RemoveWeapon(hero);
			AI_StandUpQuick(hero);
			AI_UseItem(hero,ItPo_Stamina);
		}
		else if(ATR_STAMINA[0] >= ATR_STAMINA_MAX[0] * 10)
		{
			AI_Print("У вас максимальное количество выносливости! ");
		}
		else
		{
			AI_Print("У вас нет напитков восстановления выносливости...");
		};
	};
};

func void B_Hotkey_UnPoison_Potion()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if(POISONED == TRUE)
		{
			if(Npc_HasItems(hero,ITPO_ANPOIS) >= 1)
			{
				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					useitpo_anpois_fast();
					Npc_RemoveInvItems(hero,ITPO_ANPOIS,1);
				}
				else
				{
					AI_RemoveWeapon(hero);
					AI_StandUpQuick(hero);
					AI_UseItem(hero,ITPO_ANPOIS);
				};
			}
			else
			{
				AI_Print("У вас нет противоядия...");
			};
		}
		else if(PlayerIsSick == TRUE)
		{
			if(Npc_HasItems(hero,ItFo_Alcohol) >= 1)
			{
				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					Use_ItFo_Alcohol_Fast();
					Npc_RemoveInvItems(hero,ItFo_Alcohol,1);
				}
				else
				{
					AI_RemoveWeapon(hero);
					AI_StandUpQuick(hero);
					AI_UseItem(hero,ItFo_Alcohol);
				};
			}
			else
			{
				AI_Print("У вас нет чистого спирта...");
			};
		}
		else if(PlayerIsCurse == TRUE)
		{
			if(Npc_HasItems(hero,ItMi_HolyWater) >= 1)
			{
				if((Hlp_GetHeroStatus() == HERO_NORMAL) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
				{
					use_water_blessed_fast();
					Npc_RemoveInvItems(hero,ItMi_HolyWater,1);
				}
				else
				{
					AI_RemoveWeapon(hero);
					AI_StandUpQuick(hero);
					AI_UseItem(hero,ItMi_HolyWater);
				};
			}
			else
			{
				AI_Print("У вас нет святой воды...");
			};
		}
		else
		{
			AI_Print("На вас нет ослабляющих эффектов...");
		};		
	};
};
