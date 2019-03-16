prototype BeliarWeaponPrototype_1H(C_Item)
{
	name = NAME_ADDON_BELIARSWEAPON;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_01;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_01;
	range = Range_Orkschlaechter;
	visual = "ItMw_BeliarWeapon_1H_NEW.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

prototype BeliarWeaponPrototype_2H(C_Item)
{
	name = NAME_ADDON_BELIARSWEAPON;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_01;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_01;
	range = Range_Drachenschneide;
	visual = "ItMw_BeliarWeapon_2H_NEW.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//-----------kogot' Vorona----------------------------------------

instance ItMw_BeliarWeapon_Raven(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_Raven;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_01;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_01;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 666666;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = Value_BeliarW_Raven;
	inv_animate = 1;
};

//-----------1H----------------------------------------

instance ItMw_BeliarWeapon_1H_01(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_01;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_01;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_01;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_02(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_02;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_02;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_02;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_03(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_03;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_03;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_03;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	text[3] = "Při boji s démony zraňuje nositele...";
	count[2] = damage[DAM_INDEX_MAGIC];
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_04(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_04;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_04;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_04;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_05(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_05;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_05;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_05;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_06(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_06;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_06;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_06;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_07(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_07;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_07;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_07;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_08(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_08;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_08;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_08;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_09(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_09;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_09;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_09;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_10(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_10;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_10;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_10;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_11(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_11;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_11;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_11;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_12(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_12;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_12;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_12;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_13(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_13;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_13;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_13;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_14(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_14;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_14;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_14;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_15(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_15;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_15;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_15;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_16(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_16;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_16;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_16;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_17(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_17;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_17;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_17;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_18(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_18;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_18;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_18;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_19(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_19;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_19;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_19;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_1H_20(BeliarWeaponPrototype_1H)
{
	value = Value_BeliarW_1H_20;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_1H_20;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_20;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

//-----------2H----------------------------------------


instance ItMw_BeliarWeapon_2H_01(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_01;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_01;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_01;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_02(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_02;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_02;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_02;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_03(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_03;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_03;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_03;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_04(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_04;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_04;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_04;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_05(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_05;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_05;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_05;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_06(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_06;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_06;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_06;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_07(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_07;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_07;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_07;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_08(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_08;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_08;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_08;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_09(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_09;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_09;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_09;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_10(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_10;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_10;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_10;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_11(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_11;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_11;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_11;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_12(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_12;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_12;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_12;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_13(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_13;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_13;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_13;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_14(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_14;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_14;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_14;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_15(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_15;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_15;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_15;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_16(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_16;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_16;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_16;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_17(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_17;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_17;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_17;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_18(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_18;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_18;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_18;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_19(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_19;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_19;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_19;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};

instance ItMw_BeliarWeapon_2H_20(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_20;
	damage[DAM_INDEX_EDGE] = Damage_BeliarW_2H_20;
	damage[DAM_INDEX_MAGIC] = BeliarDamageChance_20;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Při boji s démony zraňuje nositele...";
	count[5] = value;
};


//-------------------Kogot' s dushoy demona------------------------------------

instance ITMW_BELIARSUPERWEAPON_1H(C_Item)
{
	name = "Beliarův dráp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = DAMAGE_BELIARSUPERWEAPON_1H_EDGE;
	damage[DAM_INDEX_MAGIC] = DAMAGE_BELIARSUPERWEAPON_1H_MAGIC;
	range = Range_Orkschlaechter;
	value = VALUE_BELIARSUPERWEAPON_1H;
	visual = "ItMw_BeliarWeapon_1H_NEW.3DS";
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Tenhle meč v sobě ukrývá duši arcidémona Senyaka...";
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_BELIARSUPERWEAPON_2H(C_Item)
{
	name = "Beliarův dráp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = DAMAGE_BELIARSUPERWEAPON_2H_EDGE;
	damage[DAM_INDEX_MAGIC] = DAMAGE_BELIARSUPERWEAPON_2H_MAGIC;
	range = Range_Drachenschneide;
	value = VALUE_BELIARSUPERWEAPON_2H;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 0;
	visual = "ItMw_BeliarWeapon_2H_NEW.3DS";
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = "Tenhle meč v sobě ukrývá duši arcidémona Senyaka...";
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};