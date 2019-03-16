/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

instance ItMw_Addon_Betty - opraven typ zbraně (ITEM_AXE -> ITEM_SWD)
instance ITMW_1H_CREST - ITMW_1H_CREST (cyrilice -> latinka)

*/



//------------------epicheskiy shmot dlya danzha-------------------

instance ItMw_Axe_Blood(C_Item)
{
	name = "Ar'Dashar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damageTotal = 400;
	damagetype = DAM_BLUNT;
	damage[DAM_INDEX_FIRE] = 1;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 500;
	protection[PROT_MAGIC] = 50;
	visual = "ItMw_DemonFist_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_ONEHANDED_CRUSH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Speer_Blood(C_Item)
{
	name = "Ar'Ikhair";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 9575;
	damageTotal = 450;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	range = 150;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 500;
	protection[PROT_MAGIC] = 50;
	visual = "ITMW_SPEER_BLOOD.3DS";
	on_equip = equip_2h_heavy_speer;
	on_unequip = unequip_2h_heavy_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 45;
	text[1] = NAME_Damage;
	count[1] = 450;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_TWOHANDED_PIERCE_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE_LEGEND;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Sword_Blood(C_Item)
{
	name = "Ar'Urat";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 7500;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 475;
	damage[DAM_INDEX_MAGIC] = 250;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 500;
	protection[PROT_MAGIC] = 50;
	visual = "ITMW_2H_BLOODSWORD_01.3DS";
	on_equip = equip_2h_superheavy;
	on_unequip = unequip_2h_superheavy;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Staff_Blood(C_Item)
{
	name = "Ar'Krakh";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 4000;
	damagetype = DAM_MAGIC;
	damageTotal = DAMAGE_STABBLOOD;
	damage[DAM_INDEX_MAGIC] = DAMAGE_STABBLOOD;
	range = Range_Stab03;
	on_equip = equip_zauberstab_blood;
	on_unequip = unequip_zauberstab_blood;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_StabBlood;
	visual = "ItMw_2H_BloodStaff_01.3DS";
	description = name;
	text[1] = NAME_Mana_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STABS_BLOOD;
	text[4] = NAME_TWOHANDED_MAGIC_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItRw_Bow_Blood(C_Item) 
{
	name = "Luk krve";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetype = DAM_POINT;
	damage[DAM_INDEX_POINT] = 380;
	damageTotal = 380;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 480;
	cond_atr[1] = ATR_REGENERATEHP;
	cond_value[1] = 100;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FIRE] = 50;
	visual = "ITRW_BOW_S_DAEDRIC.mms";
	on_equip = equip_bow_blood;
	on_unequip = unequip_bow_blood;
	description = name;
	text[0] = NAME_Bow_needed;
	count[0] = cond_value[1];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//--------------kvestovoye oruzhiye-------------------------------

instance ITMW_2H_ORCPRESTIGE(C_Item)
{
	name = "Ulu-Mulu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 100;
	damageTotal = 70;
	damagetype = DAM_BLUNT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	weight = 10;
	range = 100;
	on_equip = equip_ulumulu;
	on_unequip = unequip_ulumulu;
	//visual = "ItMw_2h_OrcPrestige.3DS";
	visual = "ITMW_ULUMULU.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Symbol síly a úcty mezi skřety...";
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	inv_animate = 1;
};

instance ITMW_ADANOSMOLOT(C_Item)
{
	name = "Bič strážců";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 100;
	damageTotal = 80;
	damagetype = DAM_BLUNT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	range = 100;
	visual = "ITMW_2H_KMR_ORKHAMMER_H_01.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Účinný proti kamenným strážcům...";
	text[4] = NAME_TWOHANDED_CRUSH_LEGEND;
	inv_animate = 1;
};

instance ITMI_TARACOTHAMMER(C_Item)
{
	name = "Tarakotovo kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_AXE;
	material = MAT_METAL;
	value = 100;
	damageTotal = 90;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	//visual = "ItMw_1H_Warhammer_03.3ds";
	visual = "ITMI_TARACOTHAMMER_NEW.3ds";
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH_LEGEND;
	inv_animate = 1;
};

instance ItMw_1h_TributeDagger(C_Item)
{
	name = "Sothova dýka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 100;
	damageTotal = 100;
	damagetype = DAM_POINT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	range = Range_VLKDolch;
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	visual = "ITMW_1H_TRIBUTES_DAGGER_01.3DS";
	description = "Sothova obětní dýka";
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Tuhle dýku používali skřeti k rituálním obětem...";
	text[4] = "Na ostří je vidět kapky zaschlé krve...";
	inv_animate = 1;
};


//------------------------------parnoye------------------------------

instance ItMw_1H_IlArahBlade_Left(C_Item)
{
	name = "Ruka Chaosu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 750;
	damage[DAM_INDEX_MAGIC] = 250;
	value = 5555;
	range = 140;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 100;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 600;
	visual = "ItMw_1H_IlArahBlade_Left.3DS";
	on_equip = Equip_ItMw_CHAOSDUAL_Left;
	on_unequip = UnEquip_ItMw_CHAOSDUAL_Left;
	description = name;
	text[0] = NAME_Damage_Dual;
	count[0] = 500;
	text[1] = NAME_Dam_Magic;
	count[1] = damage[DAM_INDEX_MAGIC];
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 1000;
	text[4] = NAME_ONEHANDED_SLASH_DUAL_LEFT_EPIC;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_IlArahBlade_Right(C_Item)
{
	name = "Ruka Chaosu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_DAG;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 750;
	damage[DAM_INDEX_MAGIC] = 250;
	value = 5555;
	weight = 1;
	range = 140;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 100;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 600;
	visual = "ItMw_1H_IlArahBlade.3DS";
	on_equip = Equip_ItMw_CHAOSDUAL_RIGHT;
	on_unequip = UnEquip_ItMw_CHAOSDUAL_RIGHT;
	description = name;
	text[0] = NAME_Damage_Dual;
	count[0] = 500;
	text[1] = NAME_Dam_Magic;
	count[1] = damage[DAM_INDEX_MAGIC];
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 1000;
	text[4] = NAME_ONEHANDED_SLASH_DUAL_RIGHT_EPIC;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_ChelDrak_Left_Hero(C_Item)
{
	name = "Sekera prastarého strážce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 600;
	damage[DAM_INDEX_MAGIC] = 100;
	value = 3725;
	range = 130;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 70;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 500;
	visual = "ItMw_1H_ChelDrak_Left.3DS";
	on_equip = Equip_ItMw_CHELDRAK_Left;
	on_unequip = UnEquip_ItMw_CHELDRAK_Left;
	description = name;
	text[0] = NAME_Damage_Dual;
	count[0] = 350;
	text[1] = NAME_Dam_Magic;
	count[1] = damage[DAM_INDEX_MAGIC];
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 700;
	text[4] = NAME_ONEHANDED_SLASH_DUAL_LEFT_EPIC;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_ChelDrak_Right_Hero(C_Item)
{
	name = "Sekera prastarého strážce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_DAG;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 600;
	damage[DAM_INDEX_MAGIC] = 100;
	value = 3725;
	weight = 1;
	range = 130;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 70;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 500;
	visual = "ItMw_1H_ChelDrak_Right.3DS";
	on_equip = Equip_ItMw_CHELDRAK_RIGHT;
	on_unequip = UnEquip_ItMw_CHELDRAK_RIGHT;
	description = name;
	text[0] = NAME_Damage_Dual;
	count[0] = 350;
	text[1] = NAME_Dam_Magic;
	count[1] = damage[DAM_INDEX_MAGIC];
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 700;
	text[4] = NAME_ONEHANDED_SLASH_DUAL_RIGHT_EPIC;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ITMW_1H_MOONBLADE_LEFT(C_Item)
{
	name = "Měsíční čepel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_METAL;
	value = 2555;
	damageTotal = 450;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 400;
	visual = "ITMW_KATANA_02.3DS";
	on_equip = Equip_ITMW_1H_MOONBLADE_LEFT;
	on_unequip = UnEquip_ITMW_1H_MOONBLADE_LEFT;
	description = name;
	text[1] = NAME_Damage_Dual;
	count[1] = 225;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 500;
	text[4] = NAME_ONEHANDED_SLASH_DUAL_LEFT;
	text[5] = NAME_Value;
	count[5] = value;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ITMW_1H_MOONBLADE_RIGHT(C_Item)
{
	name = "Měsíční čepel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_DAG;
	material = MAT_METAL;
	value = 2555;
	damageTotal = 450;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 400;
	visual = "ITMW_KATANA_01.3DS";
	on_equip = Equip_ITMW_1H_MOONBLADE_RIGHT;
	on_unequip = UnEquip_ITMW_1H_MOONBLADE_RIGHT;
	description = name;
	text[1] = NAME_Damage_Dual;
	count[1] = 225;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 500;
	text[4] = NAME_ONEHANDED_SLASH_DUAL_RIGHT;
	text[5] = NAME_Value;
	count[5] = value;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_Ancient_Left(C_Item)
{
	name = "Amul Sah";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_METAL;
	value = 1355;
	damageTotal = 350;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 350;
	visual = "ItMw_1H_Ancient_Left.3DS";
	on_equip = Equip_ItMw_1H_Ancient_Left;
	on_unequip = UnEquip_ItMw_1H_Ancient_Left;
	description = name;
	text[1] = NAME_Damage_Dual;
	count[1] = 175;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 400;
	text[4] = NAME_ONEHANDED_SLASH_DUAL_LEFT;
	text[5] = NAME_Value;
	count[5] = value;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_Ancient_Right(C_Item)
{
	name = "Amul Raf";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_DAG;
	material = MAT_METAL;
	value = 1355;
	damageTotal = 350;
	damagetype = DAM_EDGE;
	weight = 1;
	range = 110;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 350;
	visual = "ItMw_1H_Ancient_Right.3DS";
	on_equip = Equip_ItMw_1H_Ancient_RIGHT;
	on_unequip = UnEquip_ItMw_1H_Ancient_RIGHT;
	description = name;
	text[1] = NAME_Damage_Dual;
	count[1] = 175;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 400;
	text[4] = NAME_ONEHANDED_SLASH_DUAL_RIGHT;
	text[5] = NAME_Value;
	count[5] = value;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_AssBlade_Left(C_Item)
{
	name = "Ruka Masyafu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_METAL;
	value = 555;
	damageTotal = 250;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	range = 110;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 250;
	visual = "ItMw_1H_AssBlade_Left.3DS";
	on_equip = Equip_ItMw_1H_AssBlade_Left;
	on_unequip = UnEquip_ItMw_1H_AssBlade_Left;
	description = name;
	text[1] = NAME_Damage_Dual;
	count[1] = 125;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 300;
	text[4] = NAME_ONEHANDED_PIERCE_DUAL_LEFT;
	text[5] = NAME_Value;
	count[5] = value;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_AssBlade_Right(C_Item)
{
	name = "Ruka Masyafu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_DAG;
	material = MAT_METAL;
	value = 555;
	damageTotal = 250;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	weight = 1;
	range = 110;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 250;
	visual = "ItMw_ArabicSword_01.3DS";
	on_equip = Equip_ItMw_1H_AssBlade_RIGHT;
	on_unequip = UnEquip_ItMw_1H_AssBlade_RIGHT;
	description = name;
	text[1] = NAME_Damage_Dual;
	count[1] = 125;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 300;
	text[4] = NAME_ONEHANDED_PIERCE_DUAL_RIGHT;
	text[5] = NAME_Value;
	count[5] = value;
	ownerGuild = 123;
	inv_animate = 1;
};

//---------------dlya NPC-------------------------

instance ItMw_1H_IlArahBlade_Left_Npc(C_Item)
{
	name = "Ruka Chaosu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_METAL;
	damageTotal = 12000;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_1H_IlArahBlade_Left.3DS";
	on_equip = Equip_ItMw_CHAOSDUAL_Left;
	on_unequip = UnEquip_ItMw_CHAOSDUAL_Left;
	description = name;
	text[4] = "Tuhle hůl obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ItMw_1H_IlArahBlade_Right_Npc(C_Item)
{
	name = "Ruka Chaosu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_DAG;
	material = MAT_METAL;
	damageTotal = 12000;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_1H_IlArahBlade.3DS";
	on_equip = Equip_ItMw_CHAOSDUAL_RIGHT;
	on_unequip = UnEquip_ItMw_CHAOSDUAL_RIGHT;
	description = name;
	text[4] = "Tuhle hůl obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ItMw_1H_ChelDrak_Left(C_Item)
{
	name = "Prokletá sekera Chel'Draka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_METAL;
	damageTotal = 10000;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_1H_ChelDrak_Left.3DS";
	on_equip = equip_2h_ChelDrak_Left;
	on_unequip = unequip_2h_ChelDrak_Left;
	description = name;
	text[4] = "Tuhle hůl obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ItMw_1H_ChelDrak_Right(C_Item)
{
	name = "Prokletá sekera Chel'Draka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_DAG;
	material = MAT_METAL;
	damageTotal = 10000;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_1H_ChelDrak_Right.3DS";
	on_equip = equip_2h_ChelDrak_Right;
	on_unequip = unequip_2h_ChelDrak_Right;
	description = name;
	text[4] = "Tuhle hůl obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ItMw_1H_AssBlade_Npc_Left(C_Item)
{
	name = "Čepel Masyafu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_METAL;
	value = 150;
	damageTotal = 3500;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 7654;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMw_1H_AssBlade_Left.3DS";
	on_equip = Equip_ItMw_1H_AssBlade_Left;
	on_unequip = UnEquip_ItMw_1H_AssBlade_Left;
	description = name;
	inv_animate = 1;
};

instance ItMw_1H_AssBlade_Npc_Right(C_Item)
{
	name = "Čepel Masyafu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_DAG;
	material = MAT_METAL;
	value = 150;
	damageTotal = 3500;
	damagetype = DAM_EDGE;
	weight = 1;
	range = 130;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 7654;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMw_ArabicSword_01.3DS";
	on_equip = Equip_ItMw_1H_AssBlade_RIGHT;
	on_unequip = UnEquip_ItMw_1H_AssBlade_RIGHT;
	description = name;
	inv_animate = 1;
};

func void Equip_ITMW_CHAOSDUAL_LEFT()
{
	if(self.id == 0)
	{
		if((RH_Ready_2X2 == TRUE) && (AIV_TwoHands == TRUE))
		{
			LH_Ready_2X2 = TRUE;
			MELEEWEAPONINDEX = 6;
			EquipedIndex_1H = FALSE;
			BONUSHW = 0;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_ApplyOverlayMds(hero,"WOUNDED_2X2.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_2x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = FALSE;
			BONUSHW = 0;

		 	if(AIV_TwoHands == TRUE)
			{
				AI_Print(PRINT_MISSING_DUALWEAPON);
				B_Say(hero,hero,"$DONTWORK");
			}
			else
			{
				AI_Print(PRINT_MISSING_SKILL);
				B_Say(hero,hero,"$DONTREADYFORTHIS");
			};

			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void UnEquip_ITMW_CHAOSDUAL_LEFT()
{
	if(self.id == 0)
	{
		if(RH_Ready_2X2 == TRUE)
		{
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = TRUE;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = FALSE;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
				};

				B_CheckAcroAni(hero);
			};
			
			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void Equip_ITMW_CHAOSDUAL_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = TRUE;
		MELEEWEAPONINDEX = 6;
		EquipedIndex_1H = TRUE;
		BONUSHW = 0;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
		Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

		if(LowHealth == FALSE)
		{
			Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
			B_CheckAcroAni(hero);
		}
		else
		{
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		};
	};
};

func void UnEquip_ITMW_CHAOSDUAL_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = FALSE;
		EquipedIndex_1H = FALSE;
		MELEEWEAPONINDEX = 0;
		BONUSHW = 0;

		if(LH_Ready_2X2 == TRUE)
		{
			UnEquip_ITMW_CHAOSDUAL_LEFT();
		};

		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
		B_CheckAcroAni(hero);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_1x2ST3.MDS");
	};
};

func void Equip_ITMW_CHELDRAK_LEFT()
{
	if(self.id == 0)
	{
		if((RH_Ready_2X2 == TRUE) && (AIV_TwoHands == TRUE))
		{
			LH_Ready_2X2 = TRUE;
			MELEEWEAPONINDEX = 5;
			EquipedIndex_1H = FALSE;
			BONUSHW = 0;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_ApplyOverlayMds(hero,"WOUNDED_2X2.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_2x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = FALSE;
			BONUSHW = 0;

		 	if(AIV_TwoHands == TRUE)
			{
				AI_Print(PRINT_MISSING_DUALWEAPON);
				B_Say(hero,hero,"$DONTWORK");
			}
			else
			{
				AI_Print(PRINT_MISSING_SKILL);
				B_Say(hero,hero,"$DONTREADYFORTHIS");
			};

			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void UnEquip_ITMW_CHELDRAK_LEFT()
{
	if(self.id == 0)
	{
		if(RH_Ready_2X2 == TRUE)
		{
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = TRUE;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = FALSE;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
				};

				B_CheckAcroAni(hero);
			};
			
			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void Equip_ITMW_CHELDRAK_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = TRUE;
		MELEEWEAPONINDEX = 5;
		EquipedIndex_1H = TRUE;
		BONUSHW = 0;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
		Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

		if(LowHealth == FALSE)
		{
			Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
			B_CheckAcroAni(hero);
		}
		else
		{
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		};
	};
};

func void UnEquip_ITMW_CHELDRAK_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = FALSE;
		EquipedIndex_1H = FALSE;
		MELEEWEAPONINDEX = 0;
		BONUSHW = 0;

		if(LH_Ready_2X2 == TRUE)
		{
			UnEquip_ITMW_CHELDRAK_LEFT();
		};

		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
		B_CheckAcroAni(hero);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_1x2ST3.MDS");
	};
};

func void Equip_ITMW_1H_MOONBLADE_LEFT()
{
	if(self.id == 0)
	{
		if((RH_Ready_2X2 == TRUE) && (AIV_TwoHands == TRUE))
		{
			LH_Ready_2X2 = TRUE;
			MELEEWEAPONINDEX = 4;
			EquipedIndex_1H = FALSE;
			BONUSHW = 0;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_ApplyOverlayMds(hero,"WOUNDED_2X2.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_2x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = FALSE;
			BONUSHW = 0;

		 	if(AIV_TwoHands == TRUE)
			{
				AI_Print(PRINT_MISSING_DUALWEAPON);
				B_Say(hero,hero,"$DONTWORK");
			}
			else
			{
				AI_Print(PRINT_MISSING_SKILL);
				B_Say(hero,hero,"$DONTREADYFORTHIS");
			};

			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void UnEquip_ITMW_1H_MOONBLADE_LEFT()
{
	if(self.id == 0)
	{
		if(RH_Ready_2X2 == TRUE)
		{
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = TRUE;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = FALSE;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
				};

				B_CheckAcroAni(hero);
			};
			
			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void Equip_ITMW_1H_MOONBLADE_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = TRUE;
		MELEEWEAPONINDEX = 4;
		EquipedIndex_1H = TRUE;
		BONUSHW = 0;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
		Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

		if(LowHealth == FALSE)
		{
			Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
			B_CheckAcroAni(hero);
		}
		else
		{
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		};
	};
};

func void UnEquip_ITMW_1H_MOONBLADE_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = FALSE;
		EquipedIndex_1H = FALSE;
		MELEEWEAPONINDEX = 0;
		BONUSHW = 0;

		if(LH_Ready_2X2 == TRUE)
		{
			UnEquip_ITMW_1H_MOONBLADE_LEFT();
		};

		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_1x2ST3.MDS");
	};
};

func void Equip_2h_ChelDrak_Left()
{
	if(self.id == 0)
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void UnEquip_2h_ChelDrak_Left()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void Equip_2h_ChelDrak_Right()
{
	if(self.id == 0)
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	};
};

func void UnEquip_2h_ChelDrak_Right()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_1x2ST3.MDS");
	};
};

func void Equip_ItMw_1H_AssBlade_Left()
{
	if(self.id == 0)
	{
		if((RH_Ready_2X2 == TRUE) && (AIV_TwoHands == TRUE))
		{
			LH_Ready_2X2 = TRUE;
			EquipedIndex_1H = FALSE;
			MELEEWEAPONINDEX = 3;
			BONUSHW = 0;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_ApplyOverlayMds(hero,"WOUNDED_2X2.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_2x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			EquipedIndex_1H = FALSE;
			MELEEWEAPONINDEX = 0;
			BONUSHW = 0;

		 	if(AIV_TwoHands == TRUE)
			{
				AI_Print(PRINT_MISSING_DUALWEAPON);
				B_Say(hero,hero,"$DONTWORK");
			}
			else
			{
				AI_Print(PRINT_MISSING_SKILL);
				B_Say(hero,hero,"$DONTREADYFORTHIS");
			};

			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void UnEquip_ItMw_1H_AssBlade_Left()
{
	if(self.id == 0)
	{
		if(RH_Ready_2X2 == TRUE)
		{
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = TRUE;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			EquipedIndex_1H = FALSE;
			MELEEWEAPONINDEX = 0;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
				};

				B_CheckAcroAni(hero);
			};
			
			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void Equip_ItMw_1H_AssBlade_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = TRUE;
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;
		BONUSHW = 0;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
		Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

		if(LowHealth == FALSE)
		{
			Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
			B_CheckAcroAni(hero);
		}
		else
		{
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		};
	};
};

func void UnEquip_ItMw_1H_AssBlade_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = FALSE;
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
		BONUSHW = 0;

		if(LH_Ready_2X2 == TRUE)
		{
			UnEquip_ItMw_1H_AssBlade_LEFT();
		};

		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_1x2ST3.MDS");
	};
};

func void Equip_ItMw_1H_Ancient_Left()
{
	if(self.id == 0)
	{
		if((RH_Ready_2X2 == TRUE) && (AIV_TwoHands == TRUE))
		{
			LH_Ready_2X2 = TRUE;
			EquipedIndex_1H = FALSE;
			MELEEWEAPONINDEX = 3;
			BONUSHW = 0;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START_2X2.MDS");
				Mdl_ApplyOverlayMds(hero,"WOUNDED_2X2.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_2x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			EquipedIndex_1H = FALSE;
			MELEEWEAPONINDEX = 0;
			BONUSHW = 0;

		 	if(AIV_TwoHands == TRUE)
			{
				AI_Print(PRINT_MISSING_DUALWEAPON);
				B_Say(hero,hero,"$DONTWORK");
			}
			else
			{
				AI_Print(PRINT_MISSING_SKILL);
				B_Say(hero,hero,"$DONTREADYFORTHIS");
			};

			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void UnEquip_ItMw_1H_Ancient_Left()
{
	if(self.id == 0)
	{
		if(RH_Ready_2X2 == TRUE)
		{
			LH_Ready_2X2 = FALSE;
			MELEEWEAPONINDEX = 0;
			EquipedIndex_1H = TRUE;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
				B_CheckAcroAni(hero);
			};
		}
		else
		{
			RH_Ready_2X2 = FALSE;
			LH_Ready_2X2 = FALSE;
			EquipedIndex_1H = FALSE;
			MELEEWEAPONINDEX = 0;
			BONUSHW = 0;

			Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

			if(LowHealth == TRUE)
			{
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if(hero.HitChance[NPC_TALENT_2H] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
				}
				else if(hero.HitChance[NPC_TALENT_2H] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
				};

				B_CheckAcroAni(hero);
			};
			
			AI_UnequipWeapons(hero);
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_2x2ST3.MDS");
	};
};

func void Equip_ItMw_1H_Ancient_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = TRUE;
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;
		BONUSHW = 0;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"PRE_START.MDS");
		Mdl_RemoveOverlayMds(hero,"PRE_START_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUM_2X2.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_2x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
		Mdl_RemoveOverlayMds(hero,"WOUNDED_2X2.MDS.MDS");

		if(LowHealth == FALSE)
		{
			Mdl_ApplyOverlayMds(hero,"Humans_1x2ST3.MDS");
			B_CheckAcroAni(hero);
		}
		else
		{
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		};
	};
};

func void UnEquip_ItMw_1H_Ancient_RIGHT()
{
	if(self.id == 0)
	{
		RH_Ready_2X2 = FALSE;
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
		BONUSHW = 0;

		if(LH_Ready_2X2 == TRUE)
		{
			UnEquip_ItMw_1H_Ancient_LEFT();
		};

		Mdl_RemoveOverlayMds(hero,"Humans_1x2ST3.MDS");
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_1x2ST3.MDS");
	};
};

//--------------------------imenooye oruzhiye--------------------------------------

instance ItMw_Schwert5(C_Item) //Skatti
{
	name = "Tesák baziliška";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = Range_Schwert5;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schwert5;
	//visual = "ItMw_058_1h_Sword_Bastard_02.3DS";
	visual = "ItMw_ShortSword3_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH_UNIQ;
	visual_change = NAME_ONEHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ItMw_HartSword(C_Item)
{
	name = "Hartův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = Range_Schwert3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "VBE_EDLESSCHWERT01.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Zweihaender3(C_Item) //Torus
{
	name = "Výkřik zuřivosti";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 125;
	//visual = "ItMw_060_2h_sword_01.3DS";
	visual = "ItMw_Zweihaender2_New.3DS";
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ItMw_Meisterdegen(C_Item) //Kassiya
{
	name = "Kord mistra zloděje";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 15;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = Range_Meisterdegen;
	on_equip = Equip_Meisterdegen;
	on_unequip = UnEquip_Meisterdegen;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Meisterdegen;
	//visual = "ItMw_065_1h_SwordCane_02.3ds";
	visual = "ITMW_SPAGE_05.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = 60;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE_UNIQ;
	visual_change = NAME_ONEHANDED_PIERCE_UNIQ;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Krummschwert(C_Item)  //Telokhranitel' Lemara
{
	name = "Jizva";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = Range_Scimitar;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Scimitar;
	visual = "ItMw_070_2h_sword_09.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_DIEGO_DEGEN(C_Item)
{
	name = "Diegova obratnost";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 15;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = Range_Meisterdegen;
	on_equip = equip_itmw_diego_degen;
	on_unequip = unequip_itmw_diego_degen;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = cond_value_itmw_diego_degen;
	visual = "ItMw_065_1h_SwordCane_02.3ds";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE_UNIQ;
	visual_change = NAME_ONEHANDED_PIERCE_UNIQ;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_GoldBrand_Greg(C_Item)
{
	name = "Ingreyn";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = Range_Orkschlaechter;
	on_equip = equip_itmw_sentenca_sword;
	on_unequip = unequip_itmw_sentenca_sword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = cond_value_itmw_sentenca_sword;
	visual = "ITMW_SPAGE_01.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH_UNIQ;
	visual_change = NAME_ONEHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_GORN_AXT(C_Item)
{
	name = "Gornova pomsta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = Range_Schlachtaxt;
	on_equip = equip_itmw_gorn_axt;
	on_unequip = unequip_itmw_gorn_axt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = cond_value_itmw_gorn_axt;
	visual = "G3_Weapon_Axe_BarbarianAxe_01.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_LEE_AXT(C_Item)
{
	name = "Leeův úder";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = Range_Streitaxt2;
	on_equip = equip_itmw_lee_axt;
	on_unequip = unequip_itmw_lee_axt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = cond_value_itmw_lee_axt;
	visual = "ItMw_Streitaxt3_New.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_KORD_AXT(C_Item)
{
	name = "Cordova síla";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = Range_Doppelaxt;
	on_equip = equip_itmw_kord_axt;
	on_unequip = unequip_itmw_kord_axt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = cond_value_itmw_kord_axt;
	//visual = "ItMw_040_1h_Axe_02.3DS";
	visual = "ItMw_Doppelaxt_New.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH_UNIQ;
	visual_change = NAME_ONEHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_LARES_AXT(C_Item)
{
	name = "Laresův přítel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = Range_Doppelaxt;
	on_equip = equip_itmw_lares_axt;
	on_unequip = unequip_itmw_lares_axt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = cond_value_itmw_lares_axt;
	//visual = "ItMw_040_1h_Axe_02.3DS";
	visual = "ItMw_Doppelaxt_New.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH_UNIQ;
	visual_change = NAME_ONEHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_TORLOF_AXT(C_Item)
{
	name = "Torlofova moc";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = Range_Berserkeraxt;
	on_equip = equip_itmw_torlof_axt;
	on_unequip = unequip_itmw_torlof_axt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = cond_value_itmw_torlof_axt;
	visual = "G3_Weapon_Axe_BerzerkAxe_01.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_SENTENCA_SWORD(C_Item)
{
	name = "Sentenzova namyšlenost";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = Range_Orkschlaechter;
	on_equip = equip_itmw_sentenca_sword;
	on_unequip = unequip_itmw_sentenca_sword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = cond_value_itmw_sentenca_sword;
	//visual = "ItMw_065_1h_sword_bastard_04.3DS";
	visual = "ItMw_Schwert3_New.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH_UNIQ;
	visual_change = NAME_ONEHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_JARVIS_WAFFER(C_Item)
{
	name = "Jarvisův lebkoštěp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 60;
	damagetype = DAM_BLUNT;
	range = Range_Streitkolben;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = cond_value_itmw_jarvis_waffer;
	//visual = "ItMw_050_1h_mace_war_03.3DS";
	visual = "ItMw_Nagelkeule_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH_UNIQ;
	inv_animate = 1;
};

instance ItMw_1H_Blessed_Venzel(C_Item)
{
	name = "Wenzelův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damagetype = DAM_EDGE | DAM_FIRE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = Damage_Blessed_1H_3;
	damage[DAM_INDEX_FIRE] = 50;
	damage[DAM_INDEX_MAGIC] = 20;
	range = Range_Blessed_1H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_1H_3;
	on_equip = equip_blessed_1h_venzel;
	on_unequip = unequip_blessed_1h;
	//visual = "G3_WEAPON_1H_SWORD_PALADIN_01.3DS";
	visual = "ItMw_1H_PALBLESSED_01.3ds";
	description = name;
	inv_animate = 1;
};

instance ITMW_ZWEIHAENDER_GORNAKOSH(C_Item)
{
	name = "Gor Na Koshův obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = Damage_Zweihaender2;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 650;
	//visual = "ItMw_032_2h_sword_light_01.3DS";
	visual = "ItMw_Zweihaender2_New.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_WOLF_WAFFER(C_Item)
{
	name = "Wolfova prohnanost";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 60;
	damagetype = DAM_BLUNT;
	range = Range_Streitkolben;
	on_equip = equip_itmw_wolf_waffer;
	on_unequip = unequip_itmw_wolf_waffer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = cond_value_itmw_wolf_waffer;
	//visual = "ItMw_050_1h_mace_war_03.3DS";
	visual = "ItMw_Morgenstern_New.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH_UNIQ;
	inv_animate = 1;
};

instance ITMW_LESTER_SWORD(C_Item)
{
	name = "Lesterův uklidňovač";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 60;
	damagetype = DAM_BLUNT;
	range = Range_Streitkolben;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = COND_VALUE_ITMW_JARVIS_WAFFER;
	//visual = "ItMw_050_1h_mace_war_03.3DS";
	visual = "ItMw_Streitkolben_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH_UNIQ;
	inv_animate = 1;
};

instance ITMW_KURGANSWORD(C_Item)
{
	name = "Kurganův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "RABEN.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_2H_MASTER_01(C_Item)
{
	name = "Falkův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ITMW_2H_MASTER_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH_UNIQ;
	visual_change = NAME_ONEHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_SCORPIONSPEC(C_Item)  //master ubiytsa
{
	name = "Žihadlo škorpiona";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 15;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = Range_Meisterdegen;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 120;
	visual = "ITMW_SPAGE_07.3DS";
	on_equip = equip_chiefweapon_scorpion;
	on_unequip = unequip_chiefweapon_scorpion;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 90;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE_UNIQ;
	visual_change = NAME_ONEHANDED_PIERCE_UNIQ;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ChiefRapier_Ramires(C_Item)
{
	name = "Raymes";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 15;
	damageTotal = 130;
	damagetype = DAM_EDGE;
	range = 100;
	on_equip = equip_chiefweapon_scorpion;
	on_unequip = unequip_chiefweapon_scorpion;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 200;
	visual = "ITMW_SPAGE_06.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = 130;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE_UNIQ;
	visual_change = NAME_ONEHANDED_PIERCE_UNIQ;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ChiefRapier_Loa(C_Item)
{
	name = "Ayri";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 15;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 150;
	visual = "ITMW_SPAGE_07.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = 75;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE_UNIQ;
	visual_change = NAME_ONEHANDED_PIERCE_UNIQ;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ITMW_ABIGEILSPAGE(C_Item)	//Abigal'
{
	name = "Zraňující jehla";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 15;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = Range_VLKSchwert;
	on_equip = equip_itmw_abigeilspage;
	on_unequip = unequip_itmw_abigeilspage;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 80;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = "Na jílci je vyryto jméno 'Abigail'...";
	text[4] = NAME_ONEHANDED_PIERCE_UNIQ;
	visual_change = NAME_ONEHANDED_PIERCE_UNIQ;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ITMW_2H_AXE_GESTATH(C_Item)
{
	name = "Gestathova sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 195;
	damagetype = DAM_EDGE;
	range = 95;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	visual = "ITMW_2H_G4_BARBARIANAXE_01.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ANGAR_SCHWERT(C_ITEM)		//Angar
{
	name = "Rudý vítr";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damagetotal = 80;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	//visual = "ITMW_EINFACHES_2H_SCHWERT.3DS";
	visual = "ItMw_Zweihaender4_New.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_DAMAGE;
	count[1] = damagetotal;
	text[2] = NAME_STR_NEEDED;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_2H_MASIAF_TIAMANT(C_Item)
{
	name = "Tiamantův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 125;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Masiaf.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_2H_MASIAF_HANIAR(C_Item)
{
	name = "Haniarův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 125;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Masiaf.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_2H_MASIAF_HANIAR_Demon(C_Item)
{
	name = "Prokletí Masyafu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 3000;
	damageTotal = 250;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	range = 125;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 250;
	visual = "ItMw_2H_Masiaf.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_2H_MASIAF_OSAIR(C_Item)
{
	name = "Osairův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 125;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Masiaf.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};

instance ITMW_2H_MASIAF_NROZAS(C_Item)
{
	name = "Nrozasův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 125;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Masiaf.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_UNIQ;
	visual_change = NAME_TWOHANDED_SLASH_UNIQ;
	inv_animate = 1;
};


//--------------------------oruzhiye orkov -----------------------------

instance ItMw_2H_OrcAxe_01(C_Item)
{
	name = "Krush Pach";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkaxt_01;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = Range_Orkaxt_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkaxt_01;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcAxe_02(C_Item)
{
	name = "Krush Urrok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkaxt_02;
	damageTotal = 120;
	damagetype = DAM_EDGE;
	range = Range_Orkaxt_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkaxt_02;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcAxe_03(C_Item)
{
	name = "Krush Agash";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkaxt_03;
	damageTotal = 180;
	damagetype = DAM_EDGE;
	range = Range_Orkaxt_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkaxt_03;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcAxe_04(C_Item)
{
	name = "Krush Brokdar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkaxt_04;
	damageTotal = 200;
	damagetype = DAM_EDGE;
	range = Range_Orkaxt_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkaxt_04;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcSword_01(C_Item)
{
	name = "Grakh Karrok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 240;
	damagetype = DAM_EDGE;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkschwert;
	visual = "ITMW_GREATORCAXE_01.3DS";
	on_equip = equip_2h_veryheavy_orc;
	on_unequip = unequip_2h_veryheavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcSword_02(C_Item)
{
	name = "Grakh Vakhur";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 260;
	damagetype = DAM_EDGE;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Orkschwert_01;
	visual = "ItMw_2H_OrcSword_02_1.3DS";
	on_equip = equip_2h_veryheavy_orc;
	on_unequip = unequip_2h_veryheavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_ORCSWORD_03(C_Item)
{
	name = "Grakh Khatag";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 280;
	damagetype = DAM_EDGE;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Drachenschneide;
	visual = "ItMw_2H_OrcSword_02_2.3DS";
	on_equip = equip_2h_veryheavy_orc;
	on_unequip = unequip_2h_veryheavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_ORCSWORD_04(C_Item)
{
	name = "Grakh Daggar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 300;
	damagetype = DAM_EDGE;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	visual = "ItMw_2H_OrcSword_03.3DS";
	on_equip = equip_2h_veryheavy_orc;
	on_unequip = unequip_2h_veryheavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_ORCSWORD_05(C_Item)
{
	name = "Ur Nag Dar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 350;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 500;
	visual = "ItMw_2H_OrcSword_05.3DS";
	on_equip = equip_2h_veryheavy_orc;
	on_unequip = unequip_2h_veryheavy_orc;
	description = name;
	text[4] = "Zbraň vůdce skřetů Ur-Thralla...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_ORCMACE_01(C_Item)
{
	name = "Khash Var";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 180;
	damagetype = DAM_BLUNT;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	visual = "ITMW_GREATORCAXE_02.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_ORCMACE_02(C_Item)
{
	name = "Dag Var";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 240;
	damagetype = DAM_BLUNT;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	visual = "ItMw_2H_OrcMace_03.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_DRACONSWORD_01(C_Item)
{
	name = "Dragotar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 350;
	damagetype = DAM_EDGE;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 245;
	visual = "ItMw_DraconianSword_New_01.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_DRACONSWORD_02(C_Item)
{
	name = "Tarotar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 450;
	damagetype = DAM_EDGE;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 400;
	visual = "ItMw_DraconianSword_New_01.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_ORCSTAFF(C_Item)
{
	name = "Nat Shakhar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_STONE;
	value = Value_Orkschwert;
	damageTotal = 30;
	damagetype = DAM_BLUNT;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2h_OrcStab_L.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_ORCSTAFF_ELITE(C_Item)
{
	name = "Ur Nat Shakhar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_STONE;
	value = Value_Orkschwert;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_2h_OrcStab_H.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_ORCSTAFF_UNDEAD(C_Item)
{
	name = "Utar Rat Shakhar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_STONE;
	value = Value_Orkschwert;
	damageTotal = 100;
	damagetype = DAM_BLUNT;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ITMW_ORCSTAFF_03.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_ADDON_KEULE_1H_03(C_Item)
{
	name = "Grakh Dar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Belegnagel;
	damageTotal = Damage_Sturmknecht;
	damagetype = DAM_BLUNT;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sturmknecht;
	visual = "ItMW_Club_2H_01.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	text[5] = NAME_Value;
	count[5] = 100;
	inv_animate = 1;
};

instance ItMw_2h_OrcStab(C_Item)
{
	name = "Bar Shakhar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_STONE;
	value = Value_Orkschwert;
	damageTotal = 120;
	damagetype = DAM_BLUNT;
	range = Range_Orkschwert_01;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 100;
	visual = "ItMw_2h_OrcStab_H.3DS";
	on_equip = equip_stab_orc_l;
	on_unequip = unequip_stab_orc_l;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Mana_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STABS_ORC_L;
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_ORCSTAFF_01(C_Item)
{
	name = "Ur Dar Shakhar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1500;
	damageTotal = 150;
	damagetype = DAM_BLUNT;
	range = Range_Stabkeule;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 250;
	visual = "ITMW_2H_ORCSTAFF_01.3DS";
	on_equip = equip_stab_orc_h;
	on_unequip = unequip_stab_orc_h;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Mana_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STABS_ORC_H;
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//-----------------------------shchity-----------------------------------------

instance ItAr_Shield_01(C_Item)
{
	name = "Dřevěný štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 1;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_01;
	on_unequip = UnEquip_ItAr_Shield_01;
	//visual = "ItAr_Shield_01.3ds";
	visual = "ITAR_NEWSHIELD_01.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[0] = NAME_Shield_Need;
	count[0] = cond_value[1];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Prot_Phis;
	count[2] = 20;
	text[3] = NAME_Prot_Point;
	count[3] = 40;
	text[5] = NAME_BONUS_BLOCK;
	count[5] = 20;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_01()
{
	if(self.id == 0)
	{
		AIV_Shield_01 = TRUE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_Shield = TRUE;

		Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");

		if((EquipedIndex_1H == TRUE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};

		CurShieldRes = 1;

		if(EquipedIndex_Chief == TRUE)
		{
			AIV_Shield_01 = FALSE;
			AIV_GiveShieldRes = FALSE;
			CurShieldRes = FALSE;
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST3.mds");
		Mdl_ApplyOverlayMds(self,"Shield_ST1.MDS");
	};
};

func void UnEquip_ItAr_Shield_01()
{
	if(self.id == 0)
	{
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;
		AIV_GiveShieldRes = FALSE;
		AIV_Shield = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");

			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
			};
		};

		CurShieldRes = 0;
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Shield.MDS");
		Mdl_RemoveOverlayMds(self,"Hum_Shield2.MDS");
		Mdl_RemoveOverlayMds(self,"Shield_ST1.MDS");

		if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
		};
	};
};

instance ItAr_Shield_01_Alrik(C_Item)
{
	name = "Alrikův štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 150;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_01_Alrik;
	on_unequip = UnEquip_ItAr_Shield_01_Alrik;
	visual = "ITAR_NEWSHIELD_01.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_01_Alrik()
{
	if(self.id != 0)
	{
		Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST3.mds");
		Mdl_ApplyOverlayMds(self,"Shield_ST1.MDS");
	};
};

func void UnEquip_ItAr_Shield_01_Alrik()
{
	if(self.id != 0)
	{
		Mdl_RemoveOverlayMds(self,"Shield.MDS");
		Mdl_RemoveOverlayMds(self,"Hum_Shield2.MDS");
		Mdl_RemoveOverlayMds(self,"Shield_ST1.MDS");

		if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
		};

	};
};

instance ItAr_Shield_02(C_Item)
{
	name = "Štít žoldáka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 15;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_02;
	on_unequip = UnEquip_ItAr_Shield_02;
	//visual = "ItAr_Shield_02.3ds";
	visual = "ITAR_NEWSHIELD_02.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[0] = NAME_Shield_Need;
	count[0] = cond_value[1];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Prot_Phis;
	count[2] = 30;
	text[3] = NAME_Prot_Point;
	count[3] = 50;
	text[5] = NAME_BONUS_BLOCK;
	count[5] = 30;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_02()
{
	if(self.id == 0)
	{
		AIV_Shield_02 = TRUE;
		AIV_Shield_01 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_Shield = TRUE;

		Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");

		if((EquipedIndex_1H == TRUE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};

		CurShieldRes = 2;

		if(EquipedIndex_Chief == TRUE)
		{
			AIV_Shield_02 = FALSE;
			AIV_GiveShieldRes = FALSE;
			CurShieldRes = FALSE;
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
		Mdl_ApplyOverlayMds(self,"Shield.MDS");
	};
};

func void UnEquip_ItAr_Shield_02()
{
	if(self.id == 0)
	{
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_GiveShieldRes = FALSE;
		AIV_Shield = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");

			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
			};
		};

		CurShieldRes = 0;
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Shield.MDS");
		Mdl_RemoveOverlayMds(self,"Hum_Shield2.MDS");
		Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
	};
};


instance ItAr_Shield_03(C_Item)
{
	name = "Nordmarský štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 30;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 150;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_03;
	on_unequip = UnEquip_ItAr_Shield_03;
	//visual = "ItAr_Shield_03.3ds";
	visual = "ITAR_NEWSHIELD_03.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[0] = NAME_Shield_Need;
	count[0] = cond_value[1];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Prot_Phis;
	count[2] = 40;
	text[3] = NAME_Prot_Point;
	count[3] = 60;
	text[5] = NAME_BONUS_BLOCK;
	count[5] = 40;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_03()
{
	if(self.id == 0)
	{
		AIV_Shield_03 = TRUE;
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_Shield = TRUE;

		Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");

		if((EquipedIndex_1H == TRUE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};

		CurShieldRes = 4;

		if(EquipedIndex_Chief == TRUE)
		{
			AIV_Shield_03 = FALSE;
			AIV_GiveShieldRes = FALSE;
			CurShieldRes = FALSE;
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		};
	};
};

func void UnEquip_ItAr_Shield_03()
{
	if(self.id == 0)
	{
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;
		AIV_GiveShieldRes = FALSE;
		AIV_Shield = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");

			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
			};
		};

		CurShieldRes = 0;
	};
};


instance ItAr_Shield_04(C_Item)
{
	name = "Štít berserkera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 45;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 350;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_04;
	on_unequip = UnEquip_ItAr_Shield_04;
	visual = "ITSH_SHIELD_A_WOLF.3DS";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[0] = NAME_Shield_Need;
	count[0] = cond_value[1];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Prot_Phis;
	count[2] = 50;
	text[3] = NAME_Prot_Point;
	count[3] = 70;
	text[4] = NAME_Prot_Fire_Magic;
	count[4] = 5;
	text[5] = NAME_BONUS_BLOCK;
	count[5] = 50;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_04()
{
	if(self.id == 0)
	{
		AIV_Shield_04 = TRUE;
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_Shield = TRUE;

		Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");

		if((EquipedIndex_1H == TRUE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};

		CurShieldRes = 6;

		if(EquipedIndex_Chief == TRUE)
		{
			AIV_Shield_04 = FALSE;
			AIV_GiveShieldRes = FALSE;
			CurShieldRes = FALSE;
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		};
	};
};

func void UnEquip_ItAr_Shield_04()
{
	if(self.id == 0)
	{
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_GiveShieldRes = FALSE;
		AIV_Shield = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");

			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
			};
		};

		CurShieldRes = 0;
	};
};


instance ItAr_Shield_05(C_Item)
{
	name = "Prastarý štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 450;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 95;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 1000;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_05;
	on_unequip = UnEquip_ItAr_Shield_05;
	visual = "ItAr_Shield_04_New.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[0] = NAME_Shield_Need;
	count[0] = cond_value[1];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Prot_Phis;
	count[2] = 100;
	text[3] = NAME_Prot_Point;
	count[3] = 120;
	text[4] = NAME_Prot_Fire_Magic;
	count[4] = 50;
	text[5] = NAME_BONUS_BLOCK;
	count[5] = 90;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_05()
{
	if(self.id == 0)
	{
		AIV_Shield_05 = TRUE;
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_Shield = TRUE;

		Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");

		if((EquipedIndex_1H == TRUE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};

		CurShieldRes = 10;

		if(EquipedIndex_Chief == TRUE)
		{
			AIV_Shield_05 = FALSE;
			AIV_GiveShieldRes = FALSE;
			CurShieldRes = FALSE;
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		};
	};
};

func void UnEquip_ItAr_Shield_05()
{
	if(self.id == 0)
	{
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_GiveShieldRes = FALSE;
		AIV_Shield = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");

			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
			};
		};

		CurShieldRes = 0;
	};
};


instance ItAr_Shield_06(C_Item)
{
	name = "Štít drakobijce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 80;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 750;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_06;
	on_unequip = UnEquip_ItAr_Shield_06;
	visual = "ITAR_SHIELD_GOD.3DS";
	//visual = "ItAr_Hem_Dragon_02.3DS";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[0] = NAME_Shield_Need;
	count[0] = cond_value[1];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Prot_Phis;
	count[2] = 80;
	text[3] = NAME_Prot_Point;
	count[3] = 100;
	text[4] = NAME_Prot_Fire_Magic;
	count[4] = 15;
	text[5] = NAME_BONUS_BLOCK;
	count[5] = 70;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_06()
{
	if(self.id == 0)
	{
		AIV_Shield_06 = TRUE;
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_Shield = TRUE;

		Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");

		if((EquipedIndex_1H == TRUE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};

		CurShieldRes = 8;

		if(EquipedIndex_Chief == TRUE)
		{
			AIV_Shield_06 = FALSE;
			AIV_GiveShieldRes = FALSE;
			CurShieldRes = FALSE;
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		};
	};
};

func void UnEquip_ItAr_Shield_06()
{
	if(self.id == 0)
	{
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_GiveShieldRes = FALSE;
		AIV_Shield = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");

			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
			};
		};

		CurShieldRes = 0;
	};
};

instance ItAr_Shield_Caracust(C_Item)
{
	name = "Štít z krunýře Karakusta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 65;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 500;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_Caracust;
	on_unequip = UnEquip_ItAr_Shield_Caracust;
	//visual = "ItAr_Shield_Caracust.3ds";
	visual = "ITAR_NEWSHIELD_04.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[0] = NAME_Shield_Need;
	count[0] = cond_value[1];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Prot_Phis;
	count[2] = 50;
	text[3] = NAME_Prot_Point;
	count[3] = 70;
	text[4] = NAME_Prot_Fire_Magic;
	count[4] = 40;
	text[5] = NAME_BONUS_BLOCK;
	count[5] = 60;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_Caracust()
{
	if(self.id == 0)
	{
		AIV_Shield_Caracust = TRUE;
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;

		AIV_Shield = TRUE;

		Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");

		if((EquipedIndex_1H == TRUE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};

		CurShieldRes = 5;

		if(EquipedIndex_Chief == TRUE)
		{
			AIV_Shield_Caracust = FALSE;
			AIV_GiveShieldRes = FALSE;
			CurShieldRes = FALSE;
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		};
	};
};

func void UnEquip_ItAr_Shield_Caracust()
{
	if(self.id == 0)
	{
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_GiveShieldRes = FALSE;
		AIV_Shield = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");

			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
			};
		};

		CurShieldRes = 0;
	};
};

instance ItAr_Shield_07(C_Item)
{
	name = "Štít paladina";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 250;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 60;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 600;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_07;
	on_unequip = UnEquip_ItAr_Shield_07;
	visual = "ItAr_Shield_07_02.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[0] = NAME_Shield_Need;
	count[0] = cond_value[1];
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Prot_Phis;
	count[2] = 70;
	text[3] = NAME_Prot_Point;
	count[3] = 90;
	text[4] = NAME_Prot_Fire_Magic;
	count[4] = 25;
	text[5] = NAME_BONUS_BLOCK;
	count[5] = 70;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_07()
{
	if(self.id == 0)
	{
		AIV_Shield_07 = TRUE;
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_Shield = TRUE;

		Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");

		if((EquipedIndex_1H == TRUE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};

		CurShieldRes = 6;

		if(EquipedIndex_Chief == TRUE)
		{
			AIV_Shield_07 = FALSE;
			AIV_GiveShieldRes = FALSE;
			CurShieldRes = FALSE;
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		};
	};
};

func void UnEquip_ItAr_Shield_07()
{
	if(self.id == 0)
	{
		AIV_Shield_01 = FALSE;
		AIV_Shield_02 = FALSE;
		AIV_Shield_03 = FALSE;
		AIV_Shield_04 = FALSE;
		AIV_Shield_05 = FALSE;
		AIV_Shield_06 = FALSE;
		AIV_Shield_07 = FALSE;
		AIV_Shield_Caracust = FALSE;

		AIV_GiveShieldRes = FALSE;
		AIV_Shield = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
			Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");

			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_1hST1.mds");
			};
		};

		CurShieldRes = 0;
	};
};

instance ItAr_Shield_07_Cedrik(C_Item)
{
	name = "Cedrikův štít";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 150;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_07_Cedrik;
	on_unequip = UnEquip_ItAr_Shield_07_Cedrik;
	visual = "ItAr_Shield_07_02.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_07_Cedrik()
{
	if(self.id != 0)
	{
		Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST3.mds");
		Mdl_ApplyOverlayMds(self,"Shield_ST3.MDS");
	};
};

func void UnEquip_ItAr_Shield_07_Cedrik()
{
	if(self.id != 0)
	{
		Mdl_RemoveOverlayMds(self,"Shield.MDS");
		Mdl_RemoveOverlayMds(self,"Hum_Shield2.MDS");
		Mdl_RemoveOverlayMds(self,"Shield_ST3.MDS");

		if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
		};

	};
};

instance ItAr_Shield_01_Damn(C_Item)
{
	name = "Štít prokletých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 150;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_01_Damn;
	on_unequip = UnEquip_ItAr_Shield_01_Damn;
	visual = "ItAr_Shield_07_Damn_01.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_01_Damn()
{
	if(self.id == 0)
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST3.mds");
		Mdl_ApplyOverlayMds(self,"Shield.MDS");
	};
};

func void UnEquip_ItAr_Shield_01_Damn()
{
	if(self.id != 0)
	{
		Mdl_RemoveOverlayMds(self,"Shield.MDS");
		Mdl_RemoveOverlayMds(self,"Hum_Shield2.MDS");

		if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
		};
	};
};


instance ItAr_Shield_02_Damn(C_Item)
{
	name = "Štít prokletých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 150;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_02_Damn;
	on_unequip = UnEquip_ItAr_Shield_02_Damn;
	visual = "ItAr_Shield_05_New.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_02_Damn()
{
	if(self.id == 0)
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST3.mds");
		Mdl_ApplyOverlayMds(self,"Shield.MDS");
	};
};

func void UnEquip_ItAr_Shield_02_Damn()
{
	if(self.id == 0)
	{
		Mdl_RemoveOverlayMds(self,"Shield_ST1.MDS");
		Mdl_RemoveOverlayMds(self,"Shield_ST2.MDS");
		Mdl_RemoveOverlayMds(self,"Shield_ST3.MDS");
		Mdl_RemoveOverlayMds(self,"Shield_ST4.MDS");
		Mdl_RemoveOverlayMds(self,"Shield.MDS");
		Mdl_RemoveOverlayMds(self,"Hum_Shield2.MDS");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
		};
	};
};

instance ItAr_Shield_03_Damn(C_Item)
{
	name = "Štít prokletých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SHIELD;
	value = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	cond_atr[1] = ATR_REGENERATEMANA;
	cond_value[1] = 150;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Shield_03_Damn;
	on_unequip = UnEquip_ItAr_Shield_03_Damn;
	visual = "ITAR_NEWSHIELD_01.3ds";
	visual_skin = 0;
	munition = ItRw_Ass_2x2;
	description = name;
	inv_animate = 1;
};

func void Equip_ItAr_Shield_03_Damn()
{
	if(self.id == 0)
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_1hST3.mds");
		Mdl_ApplyOverlayMds(self,"Shield.MDS");
	};
};

func void UnEquip_ItAr_Shield_03_Damn()
{
	if(self.id == 0)
	{
		Mdl_RemoveOverlayMds(self,"Shield_ST1.MDS");
		Mdl_RemoveOverlayMds(self,"Shield_ST2.MDS");
		Mdl_RemoveOverlayMds(self,"Shield_ST3.MDS");
		Mdl_RemoveOverlayMds(self,"Shield_ST4.MDS");
		Mdl_RemoveOverlayMds(self,"Shield.MDS");
		Mdl_RemoveOverlayMds(self,"Hum_Shield2.MDS");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
		};
	};
};

//--------------------------Oruzhiye inventar'-----------------------------

instance ITMW_MEATKNIFE(C_Item)
{
	name = "Řeznický nůž";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_VLKDolch;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 5;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	range = Range_VLKDolch;
	visual = "G3_Item_Tool_Butcher_Knife_01.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMi_CutKnife(C_Item)
{
	name = "Porcovací nůž";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Wolfsklinge;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 5;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	range = Range_Wolfsklinge;
	visual = "ITMW_1H_ON_107.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_SCYTHE(C_Item)
{
	name = "Kosa";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 150;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = Range_Stabkeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "G3_Weapon_Staff_Scythe_01_NEW.3DS";
	on_equip = equip_2h_light_axe;
	on_unequip = unequip_2h_light_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1H_Mace_L_01(C_Item)
{
	name = "Pohrabáč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Schuerhaken;
	damageTotal = 5;
	damagetype = DAM_BLUNT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	range = Range_Schuerhaken;
	visual = "ITMW_005_1H_POKER_01.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1h_Bau_Axe(C_Item)
{
	name = "Srp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_BauAxe;
	damageTotal = 5;
	damage[DAM_INDEX_FIRE] = 1;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	range = Range_BauAxe;
	visual = "ITMW_007_1H_SICKLE_01.3DS";
	//visual = "ItMw_1h_Bau_Axe_New.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1h_Vlk_Mace(C_Item)
{
	name = "Vycházková hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_VLKMace;
	damageTotal = 5;
	damagetype = DAM_BLUNT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	range = Range_VLKMace;
	visual = "Itmw_008_1h_pole_01.3ds";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_StoneHammer(C_Item)
{
	name = "Kamenické kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 15;
	damagetype = DAM_BLUNT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	range = Range_VLKMace;
	visual = "ItMw_StoneHammer.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1H_Mace_L_04(C_Item)
{
	name = "Kovářské kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Schmiedehammer;
	damageTotal = 15;
	damagetype = DAM_BLUNT;
	range = Range_Schmiedehammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "G3_Item_Tools_Hammer_Sledge_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_1H_G3_SMITHHAMMER_01(C_Item)
{
	name = "Těžké kovářské kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Schmiedehammer;
	damageTotal = 25;
	damagetype = DAM_BLUNT;
	range = Range_Schmiedehammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ITMW_1H_G3_SMITHHAMMER_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_1H_G4_AXESMALL_01(C_Item)
{
	name = "Tesařská sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_BauMace;
	damageTotal = 30;
	damagetype = DAM_EDGE;
	range = Range_BauMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ITMW_1H_G4_AXESMALL_01.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2h_Bau_Axe(C_Item)
{
	name = "Dřevorubecká sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Bau2hAxt;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = Range_Bau2hAxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ITMW_2H_LUMBERAXE_01.3DS";
	on_equip = equip_2h_medium_axe;
	on_unequip = unequip_2h_medium_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

//--------------------------Palki-----------------------------


instance ItMw_1h_Bau_Mace(C_Item)
{
	name = "Velký klacek";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_BauMace;
	damageTotal = 10;
	damagetype = DAM_BLUNT;
	range = Range_BauMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "ItMw_WoodStuck.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Simple_Spear(C_Item)
{
	name = "Ostrá větev";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = Range_Bau2hAxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "ITMW_2H_WOODSPEAR_01.3DS";
	on_equip = equip_2h_medium_speer;
	on_unequip = unequip_2h_medium_speer;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1H_Mace_L_03(C_Item)
{
	name = "Kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Belegnagel;
	damageTotal = 15;
	damagetype = DAM_BLUNT;
	range = Range_Belegnagel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "ItMw_010_1h_Club_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Nagelknueppel(C_Item)
{
	name = "Hřeby pobitá palice";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Nagelknueppel;
	damageTotal = 20;
	damagetype = DAM_BLUNT;
	range = Range_Nagelknueppel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "ItMw_Kriegskeule_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1h_Gobbo_Hammer(C_Item)	
{
	name = "Kamenný kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_BauMace;
	damageTotal = 25;
	damagetype = DAM_BLUNT;
	range = Range_BauMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ITMW_2H_G4_STONEHAMMER_01.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_OgreHummer(C_Item)	
{
	name = "Zlobří kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damageTotal = 80;
	damagetype = DAM_BLUNT;
	range = Range_BauMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	visual = "ItMw_OgreHummer.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Kriegskeule(C_Item)
{
	name = "Ostnatý kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Kriegskeule;
	damageTotal = 35;
	damagetype = DAM_BLUNT;
	range = Range_Kriegskeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	//visual = "ItMw_022_1h_mace_war_01.3DS";
	visual = "ItMw_Kriegskeule_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1H_GoblinTotem(C_Item)
{
	name = "Gobliní totem";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 100;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = Range_Belegnagel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ITMW_DS_GOBSHAMCLUB_1.3DS";
	on_equip = equip_2h_medium_axe;
	on_unequip = unequip_2h_medium_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1H_GoblinTotem_Epic(C_Item)
{
	name = "Khir Shar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 500;
	damageTotal = 80;
	damagetype = DAM_BLUNT;
	range = Range_Belegnagel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ITMW_DS_GOBSHAMCLUB_1.3DS";
	on_equip = equip_2h_medium_axe_epic;
	on_unequip = unequip_2h_medium_axe_epic;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Gobliní totem moci...";
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1h_Nov_Mace(C_Item)
{
	name = "Bojová hůl novice";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_NovMace;
	damageTotal = 30;
	damagetype = DAM_BLUNT;
	range = Range_NovMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_020_2h_Nov_Staff_01.3DS";
	//visual = "ItMw_RangerStaff_Addon_New.3DS";
	on_equip = equip_2h_light;
	on_unequip = unequip_2h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Richtstab(C_Item)
{
	name = "Hůl soudce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Richtstab;
	damageTotal = 35;
	damagetype = DAM_BLUNT;
	range = Range_Richtstab;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_025_2h_Staff_02.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Stabkeule(C_Item)
{
	name = "Hůl poutníka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Stabkeule;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = Range_Stabkeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_032_2h_staff_03.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_BATTLEMAGE_STAB_02(C_Item)
{
	name = "Bojová hůl mága";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_NovMace;
	damageTotal = 45;
	damagetype = DAM_BLUNT;
	range = Range_NovMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ITMW_BATTLEMAGE_STAB_02.3DS";
	on_equip = equip_2h_light;
	on_unequip = unequip_2h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMW_Addon_Keule_1h_01(C_Item)
{
	name = "Válečný kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 800;
	damageTotal = 70;
	damagetype = DAM_BLUNT;
	range = Range_Windknecht;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_Iron_Club.3DS";
	on_equip = equip_2h_medium_axe;
	on_unequip = unequip_2h_medium_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_RangerStaff_Addon(C_Item) 
{
	name = "Bojová hůl 'Kruhu Vody'";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_RangerStaff;
	damageTotal = 80;
	damagetype = DAM_BLUNT;
	range = Range_RangerStaff;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	//visual = "ItMw_020_2h_Nov_Staff_01.3DS";
	visual = "ItMw_RangerStaff_Addon_New2.3DS";
	on_equip = Equip_2H_04;
	on_unequip = UnEquip_2H_04;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_04;
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_G3_STAFFDRUID_01(C_Item)
{
	name = "Hůl tuláka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 500;
	damageTotal = 115;
	damagetype = DAM_BLUNT;
	range = Range_Stabkeule;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 75;
	visual = "ITMW_2H_G3_STAFFDRUID_01.3DS";
	on_equip = equip_stab_gur;
	on_unequip = unequip_stab_gur;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Mana_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STAB_GUR;
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_G3_STAFFFIRE_01(C_Item)
{
	name = "Hůl Ohně";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1000;
	damageTotal = 120;
	damagetype = DAM_BLUNT;
	range = Range_Stabkeule;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 100;
	visual = "ITMW_2H_G3_STAFFFIRE_01.3DS";
	on_equip = equip_stab_kdf;
	on_unequip = unequip_stab_kdf;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Mana_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STAB_KDF;
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_G3_STAFFWATER_01(C_Item)
{
	name = "Hůl Vody";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 800;
	damageTotal = 110;
	damagetype = DAM_BLUNT;
	range = Range_Stabkeule;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 100;
	visual = "ITMW_2H_G3_STAFFWATER_01.3DS";
	on_equip = equip_stab_kdw;
	on_unequip = unequip_stab_kdw;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Mana_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STAB_KDW;
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_KMR_BLACKSTAFF_01(C_Item)
{
	name = "Hůl mága Temnoty";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1200;
	damageTotal = 125;
	damagetype = DAM_BLUNT;
	range = Range_Stabkeule;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 120;
	visual = "ITMW_2H_KMR_BLACKSTAFF_01.3DS";
	on_equip = equip_stab_kdm;
	on_unequip = unequip_stab_kdm;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Mana_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STAB_KDM;
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMW_Addon_Stab01(C_Item)
{
	name = "Hůl vysokého mága Ohně";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Stab01;
	damagetype = DAM_FIRE;
	damageTotal = DAMAGE_STAB01MAGIC;
	damage[DAM_INDEX_FIRE] = DAMAGE_STAB01MAGIC;
	range = Range_Stab01;
	on_equip = equip_zauberstab_kdf;
	on_unequip = unequip_zauberstab_kdf;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab01;
	visual = "ItMW_Addon_Stab01_New.3ds";
	description = name;
	text[1] = NAME_Mana_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Dam_Fire;
	count[2] = damage[DAM_INDEX_FIRE];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STABS_KDF;
	text[4] = NAME_TWOHANDED_MAGIC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMW_Addon_Stab02(C_Item)
{
	name = "Hůl vysokého mága Vody";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Stab02;
	damagetype = DAM_MAGIC;
	damageTotal = DAMAGE_STAB02MAGIC;
	damage[DAM_INDEX_MAGIC] = DAMAGE_STAB02MAGIC;
	range = Range_Stab02;
	on_equip = equip_zauberstab_kdw;
	on_unequip = unequip_zauberstab_kdw;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab02;
	//visual = "ITMW_MAGESTAFF_WATER_01.3ds";
	visual = "ItMW_Addon_Stab04_New.3ds";
	description = name;
	text[1] = NAME_Mana_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STABS_KDW;
	text[4] = NAME_TWOHANDED_MAGIC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMW_Addon_Stab03(C_Item)
{
	name = "Hůl nekromanta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Stab03;
	damagetype = DAM_MAGIC;
	damageTotal = DAMAGE_STAB03MAGIC;
	damage[DAM_INDEX_MAGIC] = DAMAGE_STAB03MAGIC;
	range = Range_Stab03;
	on_equip = equip_zauberstab_kdm;
	on_unequip = unequip_zauberstab_kdm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab03;
	visual = "ItMW_Addon_Stab03_New.3ds";
	description = name;
	text[1] = NAME_Mana_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STABS_KDM;
	text[4] = NAME_TWOHANDED_MAGIC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMW_Addon_Stab04(C_Item)
{
	name = "Hůl Guru";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Stab04;
	damagetype = DAM_MAGIC;
	damageTotal = DAMAGE_STAB04MAGIC;
	damage[DAM_INDEX_MAGIC] = DAMAGE_STAB04MAGIC;
	range = Range_Stab04;
	on_equip = equip_zauberstab_gur;
	on_unequip = unequip_zauberstab_gur;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab04;
	visual = "ItMW_Addon_Stab_Guru.3ds";
	description = name;
	text[1] = NAME_Mana_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STABS_GUR;
	text[4] = NAME_TWOHANDED_MAGIC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_DRAGONSTAFF_01(C_Item)
{
	name = "Dračí hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 2000;
	damagetype = DAM_FIRE;
	damageTotal = DAMAGE_STABDRAGON;
	damage[DAM_INDEX_FIRE] = DAMAGE_STABDRAGON;
	range = Range_Stab03;
	on_equip = equip_zauberstab_dragon;
	on_unequip = unequip_zauberstab_dragon;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_StabDragon;
	visual = "ITMW_2H_DRAGONSTAFF_01.3DS";
	description = name;
	text[1] = NAME_Mana_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Dam_Fire;
	count[2] = damage[DAM_INDEX_FIRE];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STABS_DRAGON;
	text[4] = NAME_TWOHANDED_MAGIC_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_KMR_DAEMONSTAFF_01(C_Item)
{
	name = "Soumrak duší";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 3000;
	damagetype = DAM_MAGIC;
	damageTotal = DAMAGE_STABDEMON;
	damage[DAM_INDEX_MAGIC] = DAMAGE_STABDEMON;
	range = Range_Stab03;
	on_equip = equip_zauberstab_demon;
	on_unequip = unequip_zauberstab_demon;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_StabDemon;
	visual = "ITMW_2H_KMR_DAEMONSTAFF_01.3DS";
	description = name;
	text[1] = NAME_Mana_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Bonus_IntStaff;
	count[3] = BONUSMANA_STABS_DEMON;
	text[4] = NAME_TWOHANDED_MAGIC_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_STAFFDRUID(C_Item)
{
	name = "Hůl druida";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = Range_Stabkeule;
	visual = "ITMW_2H_G3_STAFFDRUID_01.3DS";
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab01;
	on_equip = equip_zauberstab_npc;
	on_unequip = unequip_zauberstab_npc;
	description = name;
	inv_animate = 1;
};

instance ItMW_Addon_Stab01_NPC(C_Item)
{
	name = "Hůl vysokého mága Ohně";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_FIRE;
	damageTotal = 60;
	damage[DAM_INDEX_FIRE] = DAMAGE_STAB01MAGIC;
	range = Range_Stab01;
	on_equip = equip_zauberstab_npc;
	on_unequip = unequip_zauberstab_npc;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab01;
	//visual = "ITMW_MAGESTAFF_FIRE_01.3ds";
	visual = "ItMW_Addon_Stab01_New.3ds";
	description = name;
	inv_animate = 1;
};

instance ItMW_Addon_Stab02_NPC(C_Item)
{
	name = "Hůl vysokého mága Vody";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_MAGIC;
	damageTotal = 60;
	damage[DAM_INDEX_MAGIC] = 60;
	range = Range_Stab02;
	on_equip = equip_zauberstab_npc;
	on_unequip = unequip_zauberstab_npc;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab02;
	//visual = "ITMW_MAGESTAFF_WATER_01.3ds";
	visual = "ItMW_Addon_Stab04_New.3ds";
	description = name;
	inv_animate = 1;
};

instance ItMW_Addon_Stab03_NPC(C_Item)
{
	name = "Hůl nekromanta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_MAGIC;
	damageTotal = 60;
	damage[DAM_INDEX_MAGIC] = 60;
	range = Range_Stab03;
	on_equip = equip_zauberstab_npc;
	on_unequip = unequip_zauberstab_npc;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab03;
	//visual = "ITMW_MAGESTAFF_DARK_01.3ds";
	visual = "ItMW_Addon_Stab03_New.3ds";
	description = name;
	inv_animate = 1;
};

instance ItMW_Addon_Stab04_NPC(C_Item)
{
	name = "Hůl Guru";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_FLY;
	damageTotal = 60;
	damage[DAM_INDEX_FLY] = 60;
	range = Range_Stab04;
	on_equip = equip_zauberstab_npc;
	on_unequip = unequip_zauberstab_npc;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = Condition_Stab04;
	//visual = "ITMW_MAGESTAFF_GURU_01.3ds";
	visual = "ItMW_Addon_Stab_Guru.3ds";
	description = name;
	inv_animate = 1;
};

instance ItMW_Xardas_Stab(C_Item)
{
	name = "Xardasova hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_MAGIC;
	damageTotal = 60;
	damage[DAM_INDEX_MAGIC] = 60;
	range = Range_Stab03;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 1000;
	on_equip = equip_zauberstab_npc;
	on_unequip = unequip_zauberstab_npc;
	visual = "ITMW_2H_KMR_XARDASSTAFF_01.3DS";
	description = name;
	inv_animate = 1;
};

//--------------------------Rzhavoye oruzhiye-----------------------------

instance ItMw_1h_MISC_Sword(C_Item)
{
	name = "Rezavý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = Range_MiscSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1h_MISC_Sword_Sum(C_Item)
{
	name = "Runový meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 200;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	range = Range_MiscSword;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	inv_animate = 1;
};

instance ITMW_2H_DRACONSWORD_DEAD_SUM(C_Item)
{
	name = "Runová sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 350;
	damagetype = DAM_BLUNT;
	range = Range_Drachenschneide;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	on_equip = equip_2h_heavydam;
	on_unequip = unequip_2h_heavydam;
	description = name;
	inv_animate = 1;
};

instance ItMw_1h_MISC_Sword_Str(C_Item)
{
	name = "Runový meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 300;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	range = Range_MiscSword;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	inv_animate = 1;
};

instance ItMw_1h_MISC_Sword_Mst(C_Item)
{
	name = "Runový meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 350;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	range = Range_MiscSword;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	inv_animate = 1;
};

instance ITMW_1H_MISC_GSWORD(C_Item)
{
	name = "Rezavý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = Range_MiscSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1h_Misc_Axe(C_Item)
{
	name = "Rezavá sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = Range_MiscAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_020_2h_Axe_Lumberjack_01.3ds";
	on_equip = equip_2h_medium_axe;
	on_unequip = unequip_2h_medium_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_2H_OldSword(C_Item)
{
	name = "Starý obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	value = 100;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = Range_Misc2hSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_025_2h_Sword_old_01.3DS";
	on_equip = equip_2h_light;
	on_unequip = unequip_2h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_2H_Sword_M_01(C_Item)
{
	name = "Rezavý obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = Range_Misc2hSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_025_2h_Sword_old_01.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

//------------------------------proklyatoye ouzhiye----------------

instance ITMW_2H_WELTENSPALTER(C_Item)
{
	name = "Azgalorovo prokletí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 600;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 500;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ITMW_2H_SPECIAL_04_SKY.3DS";
	on_equip = equip_1h_heavydam;
	on_unequip = unequip_1h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ItMw_2H_ShadowBlade_Xert(C_Item)
{
	name = "Prokleté Slunce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 600;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ITMW_2H_SPECIAL_04_SKY.3DS";
	on_equip = equip_1h_heavydam;
	on_unequip = unequip_1h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_SHADOWPRIEST_Elair(C_Item)
{
	name = "Prokletý Měsíc";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_BLUNT | DAM_MAGIC;
	damage[DAM_INDEX_BLUNT] = 600;
	damage[DAM_INDEX_MAGIC] = 250;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_2H_Staff_Undead_01.3DS";
	on_equip = equip_2h_lightdam_elitestaff;
	on_unequip = unequip_2h_lightdam_elitestaff;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_SHADOWPRIEST(C_Item)
{
	name = "Prokletá hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_BLUNT | DAM_MAGIC;
	damage[DAM_INDEX_BLUNT] = 600;
	damage[DAM_INDEX_MAGIC] = 150;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_2H_Staff_Undead_01.3DS";
	on_equip = equip_2h_lightdam_staff;
	on_unequip = unequip_2h_lightdam_staff;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_SHADOWPRIEST_Elite(C_Item)
{
	name = "Prokletá hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_BLUNT | DAM_MAGIC;
	damage[DAM_INDEX_BLUNT] = 600;
	damage[DAM_INDEX_MAGIC] = 250;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	//visual = "G3_Weapon_Staff_SceptreOfVarant_01.3DS";
	visual = "ItMw_2H_Staff_Undead_01.3DS";
	on_equip = equip_2h_lightdam_elitestaff;
	on_unequip = unequip_2h_lightdam_elitestaff;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_SHADOWPRIEST_Ober(C_Item)
{
	name = "Prokletá hůl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_BLUNT | DAM_MAGIC;
	damage[DAM_INDEX_BLUNT] = 600;
	damage[DAM_INDEX_MAGIC] = 450;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	//visual = "G3_Weapon_Staff_SceptreOfVarant_01.3DS";
	visual = "ItMw_2H_Staff_Undead_01.3DS";
	on_equip = equip_2h_lightdam_oberstaff;
	on_unequip = unequip_2h_lightdam_oberstaff;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ItMw_PlagueStaff(C_Item)
{
	name = "Hůl moru";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damageTotal = 600;
	damagetype = DAM_BLUNT;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_PlagueStaff.3DS";
	on_equip = equip_1h_heavydam;
	on_unequip = unequip_1h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ItMw_2H_IzgulScy(C_Item)
{
	name = "Krvavá sklizeň";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 600;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = 150;
	visual = "ItMw_2H_IzgulScy.3DS";
	on_equip = equip_1h_ghost;
	on_unequip = unequip_1h_ghost;
	description = name;
	inv_animate = 1;
};

instance ItMw_SoulKeeperStaff(C_Item)
{
	name = "Hůl duší";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 10;
	damagetype = DAM_BLUNT | DAM_MAGIC;
	damage[DAM_INDEX_BLUNT] = 600;
	damage[DAM_INDEX_MAGIC] = 450;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_SoulKeeperStaff.3DS";
	//visual = "ITMW_2H_KMR_DAEMONSTAFF_01.3DS";
	on_equip = equip_1h_ghost;
	on_unequip = unequip_1h_ghost;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ItMw_Doom_OldPiratensaebel(C_Item)
{
	name = "Prokletá pirátská šavle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 300;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = Range_Schwert;
	visual = "ItMw_PirCutlas.3DS";
	on_equip = equip_1h_heavydam;
	on_unequip = unequip_1h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_1H_DOOMSWORD(C_Item)
{
	name = "Meč prokletých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 300;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = Range_Schwert;
	//visual = "ItMw_020_1h_sword_old_01.3DS";
	visual = "ItMw_1H_DAMNSWORD.3DS";
	on_equip = equip_1h_heavydam;
	on_unequip = unequip_1h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_1H_GHOSTSWORD(C_Item)
{
	name = "Přízračný meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 400;
	damagetype = DAM_EDGE;
	range = Range_Schwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_GhostSword_01.3DS";
	on_equip = equip_1h_ghost;
	on_unequip = unequip_1h_ghost;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_1H_DoomSpeer(C_Item)
{
	name = "Prokleté kopí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 400;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = 150;
	visual = "ItMw_Speer_01.3DS";
	on_equip = equip_2h_lightdam_speer;
	on_unequip = unequip_2h_lightdam_speer;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_1H_DoomSpeer_Elite(C_Item)
{
	name = "Prokleté kopí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 600;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = 150;
	visual = "ItMw_Speer_Undead.3DS";
	on_equip = equip_2h_lightdam_elitespeer;
	on_unequip = unequip_2h_lightdam_elitespeer;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_2H_DRACONSWORD_DEAD(C_Item)
{
	name = "Prokletá sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 450;
	damagetype = DAM_BLUNT;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 260;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	on_equip = equip_2h_heavydam;
	on_unequip = unequip_2h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_1H_DOOMSWORD_Elite(C_Item)
{
	name = "Meč prokletých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 600;
	damagetype = DAM_EDGE;
	range = Range_Schwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_1H_DAMNSWORD.3DS";
	on_equip = equip_1h_heavydam_elite;
	on_unequip = unequip_1h_heavydam_elite;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_2H_DOOMSWORD(C_Item)
{
	name = "Obouruční meč prokletých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 600;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = 140;
	//visual = "ITMW_2H_SPECIAL_DAMN.3DS";
	visual = "ITMW_080_2H_SWORD_HEAVY_04.3DS";
	on_equip = equip_2h_heavydam;
	on_unequip = unequip_2h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_2H_DOOMSWORD_PreElite(C_Item)
{
	name = "Těžký obouruční meč prokletých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 700;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = 140;
	//visual = "ITMW_2H_SPECIAL_DAMN.3DS";
	visual = "ItMw_2H_DAMNSWORD.3DS";
	on_equip = equip_2h_heavydam;
	on_unequip = unequip_2h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_2H_DOOMSWORD_Elite(C_Item)
{
	name = "Dvousečný meč prokletých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 800;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = 150;
	visual = "ITMW_2H_SPECIAL_04_NEW.3DS";
	on_equip = equip_2h_heavydam;
	on_unequip = unequip_2h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_2H_DOOMAXE(C_Item)
{
	name = "Sekyra prokletých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 600;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = 140;
	visual = "ITMW_2H_DOOMAXE.3DS";
	on_equip = equip_2h_heavydam_axe;
	on_unequip = unequip_2h_heavydam_axe;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_2H_HAOSHAND(C_Item)
{
	name = "Ruka Chaosu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 700;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = 150;
	visual = "ItMw_1H_IlArahBlade.3DS";
	on_equip = equip_2h_heavydam;
	on_unequip = unequip_2h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_2H_RAVENELITE(C_Item)
{
	name = "Prokletý obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 500;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 666;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ITMW_2H_SPECIAL_04_NEW.3DS";
	on_equip = equip_2h_heavydam;
	on_unequip = unequip_2h_heavydam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

instance ITMW_2H_MASIAF_DAMN(C_Item)
{
	name = "Prokletý meč převora";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 450;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_2H_Masiaf.3DS";
	on_equip = equip_2h_lightdam;
	on_unequip = unequip_2h_lightdam;
	description = name;
	text[4] = "Tuhle zbraň obklopuje aura prokletí...";
	inv_animate = 1;
};

//--------------------sistemnyye!!!--------------------------------------

instance ItMw_DS_MonWeapon(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 10;
	damageTotal = 350;
	damagetype = DAM_EDGE;
	range = 200;
	visual = "ITMW_DARKSAGA_MWEAPON_1.3DS";
	description = "";
};


instance ItMw_DS_MonWeapon_Med(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 10;
	damageTotal = 450;
	damagetype = DAM_EDGE;
	range = 200;
	visual = "ITMW_DARKSAGA_MWEAPON_1.3DS";
	description = "";
};

instance ItMw_DS_MonWeapon_Elite(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 10;
	damageTotal = 500;
	damagetype = DAM_EDGE;
	range = 200;
	visual = "ITMW_DARKSAGA_MWEAPON_1.3DS";
	description = "";
};

instance ItMw_DS_MonWeapon_ExElite(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 10;
	damageTotal = 600;
	damagetype = DAM_EDGE;
	range = 200;
	visual = "ITMW_DARKSAGA_MWEAPON_1.3DS";
	description = "";
};

instance ItMw_DS_MonWeapon_SpElite(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 10;
	damageTotal = 1000;
	damagetype = DAM_EDGE;
	range = 200;
	visual = "ITMW_DARKSAGA_MWEAPON_1.3DS";
	description = "";
};

instance ItMi_GongDrum(C_Item)
{
	name = "Stará palice na gong";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 10;
	damageTotal = 10;
	damagetype = DAM_BLUNT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	range = Range_Spitzhacke;
	visual = "ItMi_GongDrum.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	inv_animate = 1;
};

instance ItMw_1h_Sld_Sword(C_Item)
{
	name = "Dřevěný kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_WOOD;
	value = Value_Sld1hSchwert;
	damageTotal = Damage_Sld1hSchwert;
	damagetype = DAM_EDGE;
	range = Range_Sld1hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Sld1hSchwert;
	visual = "ItMw_025_1h_sld_sword_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance Bdmn_vob(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	damageTotal = 250;
	damagetype = DAM_EDGE;
	range = 200;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "zvobbox.3ds";
	description = "";
};

//---------------------------Nozhi i kinzhaly--------------------------

instance ItMw_1h_Vlk_Dagger(C_Item)
{
	name = "Ocelová dýka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_VLKDolch;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1; 	
	damage[DAM_INDEX_MAGIC] = 1;	
	range = Range_VLKDolch;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	//visual = "Itmw_005_1h_dagger_01.3DS";
	visual = "ItMw_SteelDagger_01_New.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1H_Sword_L_03(C_Item)
{
	name = "Lovecký nůž";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Wolfsklinge;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "ITMW_1H_ON_107.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMW_Addon_Knife01(C_Item)
{
	name = "Vlčí nůž";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Wolfsmesser;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 45;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "ITMW_1H_ON_107.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMW_Rich_Sword(C_Item)
{
	name = "Zdobená dýka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 500;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = Range_Wolfsmesser;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "ITMW_1H_KNIFE_HUNT.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE;
	inv_animate = 1;
};

instance ItMw_FrancisDagger_Mis(C_Item)
{
	name = "Železná dýka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 5;
	damagetype = DAM_EDGE;
	range = Range_VLKDolch;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	//visual = "Itmw_005_1h_dagger_01.3DS";
	visual = "ItMw_IronDagger_01_New.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE;
	inv_animate = 1;
};

//-----------------------piratskoye oruzhiye-----------------------------

instance ItMw_OldPiratensaebel(C_Item)
{
	name = "Stará pirátská šavle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 30;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 45;
	damagetype = DAM_EDGE;
	range = Range_Piratensaebel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_PirCutlas.3DS";
	on_equip = equip_1h_medium_pir;
	on_unequip = unequip_1h_medium_pir;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Piratensaebel(C_Item)
{
	name = "Pirátská šavle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Piratensaebel;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = Range_Piratensaebel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ITMW_DRAKESAEBEL.3DS";
	on_equip = equip_1h_medium_pir;
	on_unequip = unequip_1h_medium_pir;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Sense(C_Item)
{
	name = "Malá kosa";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Sense;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = Range_Sense;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_012_1h_Scythe_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_BartokSword(C_Item)
{
	name = "Bartokův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_AltMachete;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = Range_AltMachete;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_BartokSword.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMW_Addon_Hacker_1h_02(C_Item)
{
	name = "Stará mačeta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_AltMachete;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = Range_AltMachete;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_1H_Machete_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMW_Addon_Hacker_1h_01(C_Item)
{
	name = "Mačeta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Machete;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = Range_Machete;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_1H_Machete_02.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMW_Addon_Hacker_2h_02(C_Item)
{
	name = "Stará obří mačeta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_AltHacker;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = Range_AltHacker;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Machete_01.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMW_Addon_Hacker_2h_01(C_Item)
{
	name = "Obří mačeta";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Hacker;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = Range_Hacker;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Machete_02.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Addon_PIR1hAxe(C_Item)
{
	name = "Pirátská sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_PIR1hAxe;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = Range_PIR1hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ITMW_1H_PIRAXE_01.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Addon_PIR1hSword(C_Item)
{
	name = "Pirátský meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_PIR1hSword;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = Range_PIR1hSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ITMW_1H_PIRSWORD_03.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Addon_PIR2hAxe(C_Item)
{
	name = "Pirátská sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_PIR2hAxe;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = Range_PIR2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ITMW_2H_PIRAXE_01.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Addon_PIR2hSword(C_Item)
{
	name = "Falchion";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_PIR2hSword;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = Range_PIR2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ITMW_1H_PIRSWORD_02.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Schiffsaxt(C_Item)
{
	name = "Pirátská loďařská sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Schiffsaxt;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 110;
	damagetype = DAM_EDGE;
	range = Range_Schiffsaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	visual = "ITMW_2H_AXE_BERSERK_107.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

//-------------shpagi i rapiry-------------------------------------------

instance ItMw_OldSpage(C_Item)
{
	name = "Rezavý kord";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 45;
	//damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damagetype = DAM_EDGE;
	damageTotal = 20;
	range = Range_VLKSchwert;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 10;
	//visual = "ItMw_018_1h_SwordCane_01.3ds";
	visual = "ITMW_SPAGE_OLD.3DS";
	on_equip = equip_1h_light_Dex;
	on_unequip = unequip_1h_light_dex;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 20;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1h_Vlk_Sword(C_Item)
{
	name = "Kord";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 85;
	//damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damagetype = DAM_EDGE;
	damageTotal = 30;
	range = Range_VLKSchwert;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 20;
	//visual = "ItMw_018_1h_SwordCane_01.3ds";
	visual = "ITMW_SPAGE_04.3DS";
	on_equip = equip_1h_light_Dex;
	on_unequip = unequip_1h_light_dex;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 30;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Addon_BanditTrader(C_Item)
{
	name = "Kord banditů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 185;
	//damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 30;
	damagetype = DAM_EDGE;
	range = Range_VLKSchwert;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 20;
	//visual = "ItMw_018_1h_SwordCane_01.3ds";
	visual = "ITMW_SPAGE_04.3DS";
	on_equip = equip_1h_light_dex;
	on_unequip = unequip_1h_light_dex;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 30;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = "Na jílci je vyryto písmeno 'F.'...";
	text[4] = NAME_ONEHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Rapier(C_Item)
{
	name = "Rapír";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 105;
	damageTotal = 35;
	damage[DAM_INDEX_MAGIC] = 1;
	//damage[DAM_INDEX_FIRE] = 1;
	damagetype = DAM_EDGE;
	range = Range_Rapier;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 20;
	//visual = "ItMw_050_1h_Sword_Rapier_01.3ds";
	visual = "ITMW_SPAGE_03.3DS";
	on_equip = equip_1h_light_Dex;
	on_unequip = unequip_1h_light_dex;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 35;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

//-----------lineyka shpag-----------------------

instance ItMw_ChiefRapier_01(C_Item)
{
	name = "Kord zloděje";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 705;
	damage[DAM_INDEX_MAGIC] = 1;
	//damage[DAM_INDEX_FIRE] = 1;
	damagetype = DAM_EDGE;
	damageTotal = 50;
	range = 60;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 30;
	//visual = "ItMw_ChiefRapier_01.3DS";
	visual = "ITMW_SPAGE_04.3DS";
	on_equip = equip_chiefweapon_01;
	on_unequip = unequip_chiefweapon_01;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 50;
	text[2] = NAME_WieldBonus;
	count[2] = Waffenbonus_02;
	text[3] = NAME_PierceArmor;
	count[3] = 5;
	text[4] = NAME_ONEHANDED_PIERCE_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_SMITH;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ChiefRapier_02(C_Item)
{
	name = "Rapír zloděje";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 815;
	damage[DAM_INDEX_MAGIC] = 1;
	//damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 60;
	//visual = "ItMw_ChiefRapier_02.3ds";
	visual = "ITMW_SPAGE_03.3DS";
	on_equip = equip_chiefweapon_01;
	on_unequip = unequip_chiefweapon_01;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 80;
	text[2] = NAME_WieldBonus;
	count[2] = Waffenbonus_02;
	text[3] = NAME_PierceArmor;
	count[3] = 10;
	text[4] = NAME_ONEHANDED_PIERCE_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_SMITH;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ChiefRapier_03(C_Item)
{
	name = "Kord mistra zloděje";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1895;
	damage[DAM_INDEX_MAGIC] = 1;
	//damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 110;
	damagetype = DAM_EDGE;
	range = 80;
	on_equip = equip_chiefweapon_02;
	on_unequip = unequip_chiefweapon_02;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 90;
	//visual = "ItMw_ChiefRapier_03.3DS";
	visual = "ITMW_SPAGE_05.3DS";
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 110;
	text[2] = NAME_WieldBonus;
	count[2] = Waffenbonus_03;
	text[3] = NAME_PierceArmor;
	count[3] = 15;
	text[4] = NAME_ONEHANDED_PIERCE_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_SMITH;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ChiefRapier_04(C_Item)
{
	name = "Tichá smrt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2675;
	damage[DAM_INDEX_MAGIC] = 1;
	//damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 90;
	on_equip = equip_chiefweapon_02;
	on_unequip = unequip_chiefweapon_02;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 110;
	//visual = "ItMw_ChiefRapier_04.3DS";
	visual = "ITMW_SPAGE_02.3DS";
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 140;
	text[2] = NAME_WieldBonus;
	count[2] = Waffenbonus_03;
	text[3] = NAME_PierceArmor;
	count[3] = 20;
	text[4] = NAME_ONEHANDED_PIERCE_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_SMITH;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ChiefRapier_05(C_Item)
{
	name = "Pronikavá ocel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 4125;
	damage[DAM_INDEX_MAGIC] = 1;
	//damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 170;
	damagetype = DAM_EDGE;
	range = 100;
	on_equip = equip_chiefweapon_03;
	on_unequip = unequip_chiefweapon_03;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 150;
	visual = "ITMW_SPAGE_06.3DS";
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 170;
	text[2] = NAME_WieldBonus;
	count[2] = Waffenbonus_04;
	text[3] = NAME_PierceArmor;
	count[3] = 25;
	text[4] = NAME_ONEHANDED_PIERCE_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_SMITH;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ChiefRapier_06(C_Item)
{
	name = "Žihadlo škorpiona";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 5215;
	damage[DAM_INDEX_MAGIC] = 1;
	//damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 200;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 190;
	visual = "";
	on_equip = equip_chiefweapon_03;
	on_unequip = unequip_chiefweapon_03;
	visual = "ITMW_SPAGE_07.3DS";
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 200;
	text[2] = NAME_WieldBonus;
	count[2] = Waffenbonus_04;
	text[3] = NAME_PierceArmor;
	count[3] = 30;
	text[4] = NAME_ONEHANDED_PIERCE_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_SMITH;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_SilverRapier(C_Item)
{
	name = "Stříbrný kord";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 3215;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 190;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 210;
	on_equip = equip_chiefweapon_03;
	on_unequip = unequip_chiefweapon_03;
	visual = "ITMW_1H_SWORDCANE_06.3DS";
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 190;
	text[2] = NAME_WieldBonus;
	count[2] = Waffenbonus_04;
	text[3] = NAME_PierceArmor;
	count[3] = 30;
	text[4] = NAME_ONEHANDED_PIERCE_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_SMITH;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ChiefRapier_07(C_Item)
{
	name = "Noční výkřik";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 7415;
	damage[DAM_INDEX_MAGIC] = 1;
	//damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 230;
	damagetype = DAM_EDGE;
	range = 115;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 210;
	visual = "ITMW_SPAGE_08.3DS";
	on_equip = equip_chiefweapon_04;
	on_unequip = unequip_chiefweapon_04;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 230;
	text[2] = NAME_WieldBonus;
	count[2] = Waffenbonus_04;
	text[3] = NAME_PierceArmor;
	count[3] = 35;
	text[4] = NAME_ONEHANDED_PIERCE_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_SMITH;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ChiefRapier_08(C_Item)
{
	name = "Zlatá jehla";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 9125;
	damageTotal = 260;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	range = 120;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 250;
	visual = "G3_Weapon_1H_Sword_Epee_01.3DS";
	on_equip = equip_chiefweapon_04;
	on_unequip = unequip_chiefweapon_04;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 260;
	text[2] = NAME_WieldBonus;
	count[2] = Waffenbonus_05;
	text[3] = NAME_PierceArmor;
	count[3] = 40;
	text[4] = NAME_ONEHANDED_PIERCE_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_LEGEND;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_GoldBrand(C_Item)
{
	name = "Upír";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 5315;
	damageTotal = 350;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	range = Range_Special_1H_4;
	on_equip = equip_chiefweapon_05;
	on_unequip = unequip_chiefweapon_05;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 350;
	visual = "ItMw_1H_BloodSpage.3DS";
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 300;
	text[2] = NAME_VampStrike;
	count[2] = 15;
	text[3] = NAME_PierceArmor;
	count[3] = 45;
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = 5000;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Avabul_Dagger(C_Item)
{
	name = "Dýka Beliarovy kněžky";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 7531;
	damageTotal = 600;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 600;
	range = Range_VLKDolch;
	visual = "ITMW_AVABUL_DAGGER_01.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = 600;
	text[2] = NAME_PierceArmor;
	count[2] = 50;
	text[4] = NAME_ONEHANDED_PIERCE_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_LEGEND;
	inv_animate = 1;
};

//---------------------mechi na lovkost'--------------------

instance ItMw_Addon_Betty(C_Item)
{
	name = "Betty";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 15;
	damageTotal = 120;
	damagetype = DAM_EDGE;
	range = Range_ElBastardo;
	on_equip = Equip_Betty;
	on_unequip = UnEquip_Betty;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 90;
	visual = "ITMW_BANE_1H.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = 120;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH_UNIQ;
	visual_change = NAME_ONEHANDED_SLASH_UNIQ;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Drakesaebel(C_Item)
{
	name = "Šavle kapitána Drakea";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1055;
	damageTotal = 150;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	range = Range_Piratensaebel;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 150;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 50;
	visual = "ITMW_1H_PIRSWORD_01.3DS";
	on_equip = equip_1h_medium_pir;
	on_unequip = unequip_1h_medium_pir;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 150;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_1H_AssBlade_Hero(C_Item)
{
	name = "Qama, meč stínů Masyafu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1015;
	weight = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 190;
	damagetype = DAM_EDGE;
	range = Range_Rapier;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 180;
	visual = "ItMw_ArabicSword_01.3DS";
	on_equip = equip_1h_light_AssBlade;
	on_unequip = unequip_1h_light_AssBlade;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 180;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[2] = NAME_PierceArmor;
	count[2] = 30;
	text[4] = NAME_ONEHANDED_PIERCE_POISON;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_POISON;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ITMW_1H_BLACKSWORD(C_Item)
{
	name = "Černé srdce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 3325;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 300;
	damage[DAM_INDEX_MAGIC] = 50;
	range = Range_Special_1H_4;
	on_equip = equip_1h_blackheart;
	on_unequip = unequip_1h_blackheart;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 300;
	protection[PROT_MAGIC] = 25;
	//visual = "DS_BLACKSWORD_1.3DS";
	visual = "ITMW_1H_BLACKSWORD.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_EDGE];
	text[1] = NAME_Dam_Magic;
	count[1] = damage[DAM_INDEX_MAGIC];
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = 3000;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	ownerGuild = 123;
	inv_animate = 1;
};

//----------------oruzhiye assasinov---------------------------

instance ITMW_2H_KATANA(C_Item)
{
	name = "Meč asasína";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 500;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 125;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Katana.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_KATANA_GIFT(C_Item)
{
	name = "Meč asasína";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 230;
	damagetype = DAM_EDGE;
	range = 125;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 180;
	visual = "ItMw_2H_Katana.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_KATANA_Gonsales(C_Item)
{
	name = "Meč asasína";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 125;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Katana.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Na jílci je vyryto jmeno 'Gonzales'...";
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1H_AssBlade(C_Item)
{
	name = "Čepel asasína";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 70;
	damagetype = DAM_POINT;
	range = Range_Rapier;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 150;
	visual = "ItMw_ArabicSword_01.3DS";
	on_equip = equip_1h_light_AssBlade;
	on_unequip = unequip_1h_light_AssBlade;
	description = name;
	text[3] = "Tuhle zbraň jsem sebral z těla jednoho z asasínů,";
	text[4] = "kteří zaútočili na tábor sběračů trávy z bažin...";
	inv_animate = 1;
};

instance ItMw_1H_AssBlade_View(C_Item)
{
	name = "Čepel asasína";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 5000;
	damagetype = DAM_EDGE;
	range = Range_Rapier;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMw_ArabicSword_01.3DS";
	description = name;
	inv_animate = 1;
};

instance ItMw_1H_AssBlade_Known(C_Item)
{
	name = "Qama Masyafu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1015;
	weight = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = Range_Rapier;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 50;
	visual = "ItMw_ArabicSword_01.3DS";
	on_equip = equip_1h_light_AssBlade;
	on_unequip = unequip_1h_light_AssBlade;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 95;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_PIERCE_POISON;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE_POISON;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ITMW_FAKESWORD_01(C_Item)
{
	name = "Meč";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	value = 10;
	munition = ItRw_Ass_2x2;
	damageTotal = 1;
	damagetype = DAM_EDGE;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	range = 125;
	visual = "ItMw_2H_Masiaf.3DS";
	description = name;
	text[4] = "Rituální meč stínů Masyafu...";
	inv_animate = 1;
};

//----------------obychnyye mechi------------------------

instance ItMw_1h_Vlk_Axe(C_Item)
{
	name = "Sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_VLKAxe;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	range = Range_VLKAxe;
	visual = "ITMW_1H_G4_AXESMALL_01.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_ShortSword1(C_Item)
{
	name = "Krátký meč domobránce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_ShortSword1;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 45;
	damagetype = DAM_EDGE;
	range = Range_ShortSword1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	//visual = "ItMw_010_1h_Sword_short_01.3DS";
	visual = "ItMw_ShortSword1_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_ShortSword2(C_Item)
{
	name = "Prostý krátký meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_ShortSword2;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = Range_ShortSword2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	//visual = "ItMw_012_1h_Sword_short_02.3DS";
	visual = "ItMw_ShortSword2_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_ShortSword3(C_Item)
{
	name = "Krátký meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_ShortSword3;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 30;
	damagetype = DAM_EDGE;
	range = Range_ShortSword3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	//visual = "ItMw_016_1h_Sword_short_03.3DS";
	visual = "ItMw_ShortSword3_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_ShortSword4(C_Item)
{
	name = "Vlčí zub";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_ShortSword4;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = Range_ShortSword4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	//visual = "ItMw_020_1h_Sword_short_04.3DS";
	visual = "ItMw_ShortSword2_New.3DS";
	on_equip = equip_1h_light;
	on_unequip = unequip_1h_light;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_ShortSword5(C_Item)
{
	name = "Kvalitní krátký meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_ShortSword5;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = Range_ShortSword5;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	//visual = "ItMw_025_1h_Sword_short_05.3DS";
	visual = "ItMw_ShortSword5_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Schwert(C_Item)
{
	name = "Meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Schwert;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = Range_Schwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	//visual = "ItMw_030_1h_sword_long_01.3DS";
	//visual = "ItMw_Schwert_New.3DS";
	visual = "ITMW_NEWSIMPLESWORD_01.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1h_Mil_Sword(C_Item)
{
	name = "Meč domobránce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_MilSchwert;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = Range_MilSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	//visual = "Itmw_025_1h_Mil_Sword_broad_01.3DS";
	//visual = "ItMw_1h_Mil_Sword_New.3DS";
	visual = "ItMw_Schwert_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1h_Sld_Sword_New(C_Item)
{
	name = "Prostý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_WOOD;
	value = 100;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ITMW_1HFINESWORD_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Schwert3(C_Item)
{
	name = "Palaš";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	value = Value_Schwert3;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = Range_Schwert3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	//visual = "ITMW_1HFINESWORD_01.3DS";
	visual = "ITMW_NEWSIMPLESWORD_02.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Schwert2(C_Item)
{
	name = "Dlouhý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Schwert2;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = Range_Schwert2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	//visual = "ItMw_037_1h_sword_long_02.3DS";
	visual = "ItMw_Schwert2_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1h_Pal_Sword(C_Item)
{
	name = "Paladinský meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_PalSchwert;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = Range_PalSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	//visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	visual = "ItMw_1h_Pal_Sword_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Zweihaender1(C_Item)
{
	name = "Lehký obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Zweihaender1;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	//visual = "ItMw_032_2h_sword_light_01.3DS";
	visual = "ItMw_Zweihaender1_New.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_2h_Sld_Sword(C_Item) 
{
	name = "Prostý obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	//visual = "ItMw_035_2h_sld_sword_01.3DS";
	visual = "ItMw_Zweihaender3_New.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Zweihaender2(C_Item)
{
	name = "Obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Zweihaender2;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	//visual = "ItMw_055_2h_sword_light_05.3DS";
	visual = "ItMw_Zweihaender2_New.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_2h_Pal_Sword(C_Item)
{
	name = "Paladinský obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_PalZweihaender;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 105;
	damagetype = DAM_EDGE;
	range = Range_PalZweihaender;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	//visual = "ItMw_040_2h_PAL_Sword_03.3DS";
	visual = "ItMw_2h_Pal_Sword_New.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Zweihaender4(C_Item)
{
	name = "Těžký obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Zweihaender4;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 115;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	//visual = "ItMw_068_2h_sword_02.3DS";
	visual = "ItMw_Zweihaender4_New.3DS";
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_2H_Claymore(C_Item)
{
	name = "Dvousečný meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 125;
	damagetype = DAM_EDGE;
	range = Range_Misc2hSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	visual = "ITMW_CLAYMORE_01.3DS";
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1h_Pal_Sword_Etlu(C_Item)
{
	name = "Posvěcený paladinský meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 100;
	damage[DAM_INDEX_FIRE] = 200;
	damagetype = DAM_FIRE;
	range = Range_PalSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PalSchwert;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	on_equip = equip_holypalsword;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_FIRE];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_2h_Pal_Sword_Etlu(C_Item)
{
	name = "Posvěcený paladinský obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 150;
	damage[DAM_INDEX_FIRE] = 300;
	damagetype = DAM_FIRE;
	range = Range_PalZweihaender;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PalZweihaender;
	visual = "ItMw_040_2h_PAL_Sword_03.3DS";
	on_equip = equip_holypalsword;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_FIRE];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

//--------------------------drobyashcheye-----------------------------

instance ItMw_Nagelkeule(C_Item)
{
	name = "Palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Nagelkeule;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = Range_Nagelkeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	//visual = "ItMw_018_1h_Mace_01.3DS";
	visual = "ItMw_Nagelkeule_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Nagelkeule2(C_Item)
{
	name = "Těžký palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Nagelkeule2;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = Range_Nagelkeule2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	//visual = "ItMw_018_1h_Mace_01.3DS";
	visual = "ItMw_Nagelkeule2_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Streitkolben(C_Item)
{
	name = "Válečný palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Streitkolben;
	damageTotal = 60;
	damagetype = DAM_BLUNT;
	range = Range_Streitkolben;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	//visual = "ItMw_050_1h_mace_war_03.3DS";
	visual = "ItMw_Streitkolben_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Steinbrecher(C_Item)
{
	name = "Kostilam";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Steinbrecher;
	damageTotal = 65;
	damagetype = DAM_BLUNT;
	range = Range_Steinbrecher;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	//visual = "ItMw_035_1h_mace_war_02.3DS";
	visual = "ItMw_Steinbrecher_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Spicker(C_Item)
{
	name = "Lebkoštěp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Spicker;
	damageTotal = 70;
	damagetype = DAM_BLUNT;
	range = Range_Spicker;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	//visual = "ItMw_035_1h_mace_03.3DS";
	visual = "ItMw_Spicker_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Kriegshammer1(C_Item)
{
	name = "Válečný mlat";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Kriegshammer1;
	damageTotal = 80;
	damagetype = DAM_BLUNT;
	range = Range_Kriegshammer1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	//visual = "ItMw_028_1h_warhammer_01.3DS";
	visual = "ITMW_1H_MAKEDHAMMER2_S_NORDIC.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Kriegshammer2(C_Item)
{
	name = "Válečné kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Kriegshammer2;
	damageTotal = 90;
	damagetype = DAM_BLUNT;
	range = Range_Kriegshammer2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	//visual = "ItMw_065_1h_warhammer_03.3DS";
	visual = "ItMw_Kriegshammer2_New.3DS";
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Morgenstern(C_Item)
{
	name = "Řemdih";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Morgenstern;
	damageTotal = 100;
	damagetype = DAM_BLUNT;
	range = Range_Morgenstern;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	//visual = "ItMW_045_1h_mace_04.3DS";
	visual = "ItMw_Morgenstern_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_1H_MACE_107(C_Item)
{
	name = "Ostnatý palcát";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 700;
	damageTotal = 110;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	//visual = "ITMW_1H_MACE_107.3DS";
	visual = "ITMW_1H_MOLAGBAR.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Inquisitor(C_Item)
{
	name = "Inkvizitor";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Inquisitor;
	damageTotal = 115;
	damagetype = DAM_BLUNT;
	range = Range_Inquisitor;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	//visual = "ItMw_060_1h_mace_war_04.3DS";
	visual = "ItMw_Inquisitor_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_Rabenschnabel(C_Item)
{
	name = "Noc havrana";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Rabenschnabel;
	damageTotal = 120;
	damagetype = DAM_BLUNT;
	range = Range_Rabenschnabel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	//visual = "ItMw_058_1h_warhammer_02.3DS";
	visual = "ItMw_Rabenschnabel_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_1H_MACE_BANDOS_107(C_Item)
{
	name = "Obouruční ostnatý kyj";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 300;
	damageTotal = 100;
	damagetype = DAM_BLUNT;
	range = Range_Kriegskeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_Iron_Club.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_Warhammer_Iron(C_Item)
{
	name = "Obouruční kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1000;
	damageTotal = 100;
	damagetype = DAM_BLUNT;
	range = Range_Zweihaender1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_WarHammer_Iron.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_Warhammer(C_Item)
{
	name = "Obouruční válečné kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1400;
	damageTotal = 120;
	damagetype = DAM_BLUNT;
	range = Range_Zweihaender1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMw_Steel_Warhammer.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_MACE_107(C_Item)
{
	name = "Drtič";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 145;
	damagetype = DAM_BLUNT;
	range = 105;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ITMW_2H_MACE_107.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_Warhammer_Steel(C_Item)
{
	name = "Runové kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 2500;
	damageTotal = 180;
	damagetype = DAM_BLUNT;
	range = Range_Zweihaender1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 160;
	visual = "ItMw_WarHammer_Iron.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_Volebir(C_Item)
{
	name = "Drtič kostí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 3000;
	damageTotal = 240;
	damagetype = DAM_BLUNT;
	range = Range_Kriegskeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	visual = "ItMw_2H_NewHammer_03.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_IceHammer(C_Item)
{
	name = "Kladivo ledu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 4500;
	damageTotal = 320;
	damagetype = DAM_BLUNT;
	range = Range_Kriegskeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 320;
	visual = "ItMw_2H_NewHammer_04.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_CRUSH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_NordmarWarHammer(C_Item)
{
	name = "Nordmarské válečné kladivo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 150;
	damagetype = DAM_BLUNT;
	range = Range_Kriegskeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 140;
	visual = "ItMw_2H_NewHammer_01.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1H_MolagBarMace(C_Item)
{
	name = "Godendar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 2000;
	damageTotal = 180;
	damagetype = DAM_BLUNT;
	range = Range_Schuerhaken;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 180;
	visual = "ItMw_1H_MolagBarMace.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_SharpTeeth(C_Item)	
{
	name = "Ostrotrn";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 3500;
	damageTotal = 220;
	damagetype = DAM_BLUNT;
	range = Range_Kriegskeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	visual = "ItMw_2H_SharpTeeth_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1H_AncientHammer(C_Item)	
{
	name = "Kladivo bouří";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 3500;
	damageTotal = 275;
	damagetype = DAM_BLUNT;
	range = Range_Kriegskeule;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 240;
	visual = "ITMW_1H_MAKEDHAMMER2_SM_NORDIC.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_CRUSH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//----------------------topory----------------------------

instance ItMw_1h_Sld_Axe(C_Item)
{
	name = "Prostá sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Sld1hAxt;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = Range_Sld1hAxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	//visual = "G3_Weapon_Axe_Rust_01.3DS";
	visual = "ItMw_1h_Sld_Axe_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Bartaxt(C_Item)
{
	name = "Sekera žoldáka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Bartaxt;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = Range_Bartaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	//visual = "ItMw_040_1h_axe_03.3DS";
	visual = "ItMw_Bartaxt_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Doppelaxt(C_Item)
{
	name = "Dvoubřitá sekera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Doppelaxt;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = Range_Doppelaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	//visual = "ItMw_040_1h_Axe_02.3DS";
	visual = "ItMw_Doppelaxt_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_2h_Sld_Axe(C_Item)
{
	name = "Prostá obouruční sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 60;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = Range_Sld2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	//visual = "ItMw_035_2h_sld_axe_01.3DS";
	visual = "ItMw_2h_Sld_Axe_New.3DS";
	on_equip = equip_2h_medium_axe;
	on_unequip = unequip_2h_medium_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Streitaxt1(C_Item)
{
	name = "Lehká válečná sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Streitaxt1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = Range_Streitaxt1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	//visual = "ItMw_035_2h_Axe_light_03.3DS";
	visual = "ItMw_Streitaxt1_New.3DS";
	on_equip = equip_2h_medium_axe;
	on_unequip = unequip_2h_medium_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Folteraxt(C_Item)		
{
	name = "Dlouhá sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Folteraxt;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 110;
	damagetype = DAM_EDGE;
	range = Range_Folteraxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	//visual = "ItMw_065_2h_greataxe_01.3DS";
	visual = "ItMw_Folteraxt_New.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_AXE_BERSERK_107(C_Item)
{
	name = "Stará válečná sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 120;
	damage[DAM_INDEX_FIRE] = 1;
	damagetype = DAM_EDGE;
	range = 95;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ITMW_2H_OLDAXE.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_G3A_ORCAXE_02(C_Item)
{
	name = "Válečný sekáč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 1800;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = Range_Schlachtaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ITMW_2H_G3A_ORCAXE_02.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Streitaxt2(C_Item)
{
	name = "Válečná sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Streitaxt2;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 150;
	damagetype = DAM_EDGE;
	range = Range_Streitaxt2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	//visual = "ItMw_070_2h_axe_heavy_03.3DS";
	visual = "ITMW_2H_G3A_DOUBLEAXE_01.3DS"; 
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Streitaxt3(C_Item)
{
	name = "Těžká válečná sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Schlachtaxt;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 170;
	damagetype = DAM_EDGE;
	range = Range_Schlachtaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 140;
	visual = "ItMw_Streitaxt3_New.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

//----------------------------Kovanoye oruzhiye----------------------------------------------

instance ItMw_1H_Common_01(C_Item)
{
	name = NAME_ItMw_1H_Common_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Common1;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = Range_Common1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	//visual = "ItMw_030_1h_Common_Sword_01.3DS";
	visual = "ItMw_1H_Common_01_New.3DS";
	on_equip = Equip_1H_02;
	on_unequip = UnEquip_1H_02;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_02;
	text[4] = NAME_ONEHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_1H_Common_01_Blade(C_Item)
{
	name = NAME_ItMw_1H_Common_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Common1_Blade;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = Range_Common1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_030_1h_Common_Sword_01.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Schwert1(C_Item)
{
	name = "Kvalitní meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Schwert1;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = Range_Schwert1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	//visual = "ItMw_035_1h_Sword_04.3DS";
	visual = "ItMw_Schwert1_New.3DS";
	on_equip = Equip_1H_02;
	on_unequip = UnEquip_1H_02;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_02;
	text[4] = NAME_ONEHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_Schwert4(C_Item)
{
	name = "Kvalitní dlouhý meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Schwert4;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = Range_Schwert4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	//visual = "ItMw_045_1h_Sword_long_04.3DS";
	visual = "ItMw_Schwert4_New.3DS";
	on_equip = Equip_1H_02;
	on_unequip = UnEquip_1H_02;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_02;
	text[4] = NAME_ONEHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_Rubinklinge(C_Item)
{
	name = "Rubínová čepel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Rubinklinge;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = Range_Rubinklinge;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	//visual = "ItMw_050_1h_sword_107.3DS";
	visual = "ItMw_RubinSword.3DS";
	on_equip = Equip_1H_02;
	on_unequip = UnEquip_1H_02;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_02;
	text[4] = NAME_ONEHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_ElBastardo(C_Item)
{
	name = "El Bastardo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_ElBastardo;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 110;
	damagetype = DAM_EDGE;
	range = Range_ElBastardo;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	//visual = "ItMw_065_1h_sword_bastard_03.3DS";
	visual = "ItMw_ElBastardo_New.3DS";
	on_equip = Equip_1H_02;
	on_unequip = UnEquip_1H_02;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_02;
	text[4] = NAME_ONEHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_1H_Special_01(C_Item)
{
	name = NAME_ItMw_1H_Special_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_1H_1;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Special_1H_1;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_1;
	cond_atr[2] = ATR_STRENGTH;
	protection[PROT_MAGIC] = 5;
	cond_value[2] = Condition_Special_1H_1;
	//visual = "ItMw_045_1h_Sword_smith_02.3DS";
	visual = "ITMW_1H_SPECIAL_01_SKY.3DS";
	on_equip = Equip_1H_04;
	on_unequip = UnEquip_1H_04;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_04;
	text[4] = NAME_ONEHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_1H_Special_02(C_Item)
{
	name = NAME_ItMw_1H_Special_02;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_1H_2;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Special_1H_2;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	protection[PROT_MAGIC] = 10;
	cond_value[2] = Condition_Special_1H_2;
	//visual = "ItMw_060_1h_Sword_smith_03.3DS";
	visual = "ITMW_1H_SPECIAL_02_SKY.3DS";
	on_equip = Equip_1H_04;
	on_unequip = UnEquip_1H_04;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_04;
	text[4] = NAME_ONEHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_1H_Special_03(C_Item)
{
	name = NAME_ItMw_1H_Special_03;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_1H_3;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Special_1H_3;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_3;
	cond_atr[2] = ATR_STRENGTH;
	protection[PROT_MAGIC] = 15;
	cond_value[2] = Condition_Special_1H_3;
	//visual = "ItMw_075_1h_sword_smith_04.3DS";
	visual = "ITMW_1H_SPECIAL_03_SKY.3DS";
	on_equip = Equip_1H_04;
	on_unequip = UnEquip_1H_04;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_04;
	text[4] = NAME_ONEHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_1H_Special_04(C_Item)
{
	name = "Rudný zabiják draků";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_1H_4;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Special_1H_4;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_4;
	cond_atr[2] = ATR_STRENGTH;
	protection[PROT_MAGIC] = 20;
	cond_value[2] = Condition_Special_1H_4;
	//visual = "ItMw_1H_DragonBane_01.3DS";
	visual = "ITMW_1H_SPECIAL_04_SKY.3DS";
	on_equip = Equip_1H_04;
	on_unequip = UnEquip_1H_04;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_04;
	text[4] = NAME_ONEHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_2H_Special_01(C_Item)
{
	name = NAME_ItMw_2H_Special_01;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_2H_1;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Special_2H_1;
	damagetype = DAM_EDGE;
	range = Range_Special_2H_1;
	cond_atr[2] = ATR_STRENGTH;
	protection[PROT_MAGIC] = 5;
	cond_value[2] = Condition_Special_2H_1;
	//visual = "ItMw_050_2h_Sword_smith_02.3DS";
	visual = "ITMW_2H_SPECIAL_01_SKY.3DS";
	on_equip = Equip_2H_04;
	on_unequip = UnEquip_2H_04;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_04;
	text[4] = NAME_TWOHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_SMITH;
	inv_animate = 1;
};


instance ItMw_2H_Special_02(C_Item)
{
	name = NAME_ItMw_2H_Special_02;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_2H_2;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Special_2H_2;
	damagetype = DAM_EDGE;
	range = Range_Special_2H_2;
	cond_atr[2] = ATR_STRENGTH;
	protection[PROT_MAGIC] = 10;
	cond_value[2] = Condition_Special_2H_2;
	visual = "ITMW_2H_SPECIAL_02_SKY.3DS";
	on_equip = Equip_2H_04;
	on_unequip = UnEquip_2H_04;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_04;
	text[4] = NAME_TWOHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_SMITH;
	inv_animate = 1;
};



instance ItMw_2H_Special_03(C_Item)
{
	name = NAME_ItMw_2H_Special_03;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_2H_3;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Special_2H_3;
	damagetype = DAM_EDGE;
	range = Range_Special_2H_3;
	cond_atr[2] = ATR_STRENGTH;
	protection[PROT_MAGIC] = 15;
	cond_value[2] = Condition_Special_2H_3;
	//visual = "ItMw_090_2h_sword_smith_04.3DS";
	visual = "ITMW_2H_SPECIAL_03_SKY.3DS";
	on_equip = Equip_2H_04;
	on_unequip = UnEquip_2H_04;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_04;
	text[4] = NAME_TWOHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_2H_Special_04(C_Item)
{
	name = "Velký rudný zabiják draků";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Special_2H_4;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Special_2H_4;
	damagetype = DAM_EDGE;
	range = Range_Special_2H_4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_2H_4;
	protection[PROT_MAGIC] = 20;
	//visual = "G3_Weapon_2H_Sword_Ore_01.3DS";
	visual = "ITMW_2H_SPECIAL_04_SKY.3DS";
	on_equip = Equip_2H_04;
	on_unequip = UnEquip_2H_04;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_WieldBonus;
	count[3] = Waffenbonus_04;
	text[4] = NAME_TWOHANDED_SLASH_SMITH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_SMITH;
	inv_animate = 1;
};

instance ItMw_1H_Blessed_01(C_Item)
{
	name = "Prostý rudný meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_1;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Blessed_1H_1;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_1H_1;
	protection[PROT_FIRE] = 5;
	//visual = "ITMW_1H_PALORESWORD.3ds";
	visual = "ItMw_1H_PALBLESSED_01_NEW.3ds";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1H_Blessed_02(C_Item)
{
	name = "Posvěcený rudný meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_2;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Blessed_1H_2;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	on_equip = equip_blessed_1h;
	on_unequip = unequip_blessed_1h;
	cond_value[2] = Condition_Blessed_1H_2;
	protection[PROT_FIRE] = 10;
	//visual = "ITMW_1H_PALORESWORD.3ds";
	visual = "ItMw_1H_PALBLESSED_01_NEW.3ds";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1H_Blessed_03(C_Item)
{
	name = "Innosův hněv";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_3;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = Damage_Blessed_1H_3;
	damage[DAM_INDEX_FIRE] = 100;
	range = Range_Blessed_1H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_1H_3;
	protection[PROT_FIRE] = 15;
	on_equip = equip_blessed_1h;
	on_unequip = unequip_blessed_1h;
	//visual = "G3_WEAPON_1H_SWORD_PALADIN_01.3DS";
	visual = "ItMw_1H_PALBLESSED_01_NEW.3ds";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_EDGE];
	text[1] = NAME_Dam_Fire;
	count[1] = damage[DAM_INDEX_FIRE];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_Blessed_01(C_Item)
{
	name = "Prostý rudný obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_2H_1;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Blessed_2H_1;
	damagetype = DAM_EDGE;
	range = Range_Blessed_2H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_2H_1;
	protection[PROT_FIRE] = 10;
	//visual = "ITMW_2H_PALORESWORD.3ds";
	visual = "ItMw_2H_PALBLESSED_01_NEW.3ds";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_2H_Blessed_02(C_Item)
{
	name = "Posvěcený rudný obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_2H_2;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = Damage_Blessed_2H_2;
	damagetype = DAM_EDGE;
	range = Range_Blessed_2H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_2H_2;
	protection[PROT_FIRE] = 15;
	on_equip = equip_blessed_2h;
	on_unequip = unequip_blessed_2h;
	//visual = "ITMW_2H_PALORESWORD.3ds";
	visual = "ItMw_2H_PALBLESSED_01_NEW.3ds";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_2H_Blessed_03(C_Item)
{
	name = "Svatý kat";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_2H_3;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = Damage_Blessed_2H_3;
	damage[DAM_INDEX_FIRE] = 150;
	range = Range_Blessed_2H_3;
	on_equip = equip_blessed_2h;
	on_unequip = unequip_blessed_2h;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_2H_3;
	protection[PROT_FIRE] = 20;
	//visual = "G3_Weapon_2H_Sword_InnosWrath_01.3DS";
	visual = "ItMw_2H_PALBLESSED_01_NEW.3ds";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_EDGE];
	text[1] = NAME_Dam_Fire;
	count[1] = damage[DAM_INDEX_FIRE];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_Blessed_03_Hagen(C_Item)
{
	name = "Svatý kat";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_2H_3;
	damageTotal = 150;
	damagetype = DAM_EDGE;
	range = Range_Blessed_2H_3;
	on_equip = equip_blessed_2h;
	on_unequip = unequip_blessed_2h;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_2H_3;
	protection[PROT_FIRE] = 20;
	visual = "ItMw_2H_PALBLESSED_01_NEW.3ds";
	description = name;
	inv_animate = 1;
};

instance ITMW_1H_SIMPLEBLACK(C_Item)
{
	name = "Meč z černé rudy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_1;
	damage[DAM_INDEX_MAGIC] = 10;
	damageTotal = 200;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FIRE] = 10;
	//visual = "itmw_030_1h_PAL_sword_bastard_BLK_01.3ds";
	visual = "ItMw_1H_GodBane_01.3ds";
	on_equip = equip_1h_simpleblack;
	on_unequip = unequip_1h_simpleblack;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Fire;
	count[2] = protection[PROT_FIRE];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_1H_SIMPLEBLACK_DEX(C_Item)
{
	name = "Meč z černé rudy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 105;
	damage[DAM_INDEX_MAGIC] = 10;
	damageTotal = 200;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_1;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 200;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FIRE] = 10;
	//visual = "itmw_030_1h_PAL_sword_bastard_BLK_01.3ds";
	visual = "ItMw_1H_GodBane_01.3ds";
	on_equip = equip_1h_simpleblack;
	on_unequip = unequip_1h_simpleblack;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Fire;
	count[2] = protection[PROT_FIRE];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ITMW_2H_SIMPLEBLACK(C_Item)
{
	name = "Obouruční meč z černé rudy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_2H_1;
	damage[DAM_INDEX_MAGIC] = 10;
	damageTotal = 230;
	damagetype = DAM_EDGE;
	range = Range_Blessed_2H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 250;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FIRE] = 20;
	//visual = "ItMw_040_2h_PAL_sword_heavy_BLK_01.3DS";
	visual = "ItMw_2H_GodBane_01.3ds";
	on_equip = equip_2h_simpleblack;
	on_unequip = unequip_2h_simpleblack;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Prot_Fire;
	count[2] = protection[PROT_FIRE];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

//--------------------------unikal'noye oruzhiye 1H-----------------------------

instance ITMW_1H_KMR_GREATLONG_01(C_Item)
{
	name = "Rytířský palaš";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ITMW_1H_DEATHBRINGER_NEW.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Runenschwert(C_Item)
{
	name = "Runový meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Runenschwert;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 120;
	damagetype = DAM_EDGE;
	range = Range_Runenschwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_Rune_01.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_1H_SWORD_ORCSLAYER_01(C_Item)
{
	name = "Skřetobij";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 105;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ITMW_1H_SWORD_ORCSLAYER_01.3DS";
	on_equip = equip_1h_heavy_slayer;
	on_unequip = unequip_1h_heavy_slayer;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Účinný proti skřetům...";
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_1H_CREST(C_Item)
{
	name = "Kříž osudu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1500;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 145;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 125;
	//visual = "DB_Itmw_1H_Sword_Long_Mission.3DS";
	visual = "ITMW_DOOMCREST.3DS";
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Orkschlaechter(C_Item)
{
	name = "Mírotvorce";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschlaechter;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 150;
	damagetype = DAM_EDGE;
	range = Range_Orkschlaechter;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	//visual = "ItMw_065_1h_sword_bastard_04.3DS";
	//visual = "ItMw_Orkschlaechter_New.3DS";
	visual = "ARC_SWORD1H.3DS";
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_FEARUND(C_Item)
{
	name = "Krotitel nemrtvých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 180;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 140;
	//visual = "G3_Weapon_1H_Sword_Bastard_01.3DS";
	visual = "ITMW_FATE_1H.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ItMw_Sturmbringer(C_Item)
{
	name = "Osudová ocel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Sturmbringer;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 170;
	damagetype = DAM_EDGE;
	range = Range_Sturmbringer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 160;
	visual = "ItMw_Sturmbringer_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Drachen_Sword_02(C_ITEM)
{
	name = "Bennetův meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damagetotal = 180;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	//visual = "ItMw_Drachen_Sword_02.3ds";
	visual = "ItMw_ElBastardo_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_DAMAGE;
	count[1] = damagetotal;
	text[2] = NAME_STR_NEEDED;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_VALUE;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_1H_KMR_SNAKESWORD_01(C_Item)
{
	name = "Zmije";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 200;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 170;
	visual = "ITMW_1H_KMR_SNAKESWORD_01.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_NORMARDSWORD(C_Item)
{
	name = "Stříbrný nordmarský meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 215;
	damage[DAM_INDEX_FIRE] = 1;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 190;
	//visual = "ITMW_NORDMARSWORD.3DS";
	visual = "ITMW_1H_SILVERSWORD.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Účinný proti přízrakům...";
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_1H_G3A_DAEMONBLADE_01(C_Item)
{
	name = "Přeborník duší";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 5000;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 240;
	damage[DAM_INDEX_MAGIC] = 30;
	range = Range_Special_1H_4;
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 250;
	protection[PROT_MAGIC] = 15;
	visual = "ITMW_1H_G3A_DAEMONBLADE_01.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_EDGE];
	text[1] = NAME_Dam_Magic;
	count[1] = damage[DAM_INDEX_MAGIC];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = 5000;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_1H_SWORD_LONG_05(C_Item)
{
	name = "Pokraj smrti";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 275;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 250;
	//visual = "ITMW_1H_SWORD_LONG_05.3DS";
	visual = "ItMw_ElBastardo_New.3DS";
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1H_GinnokSword(C_Item)
{
	name = "Meč Šíleného Křižáka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 5000;
	damageTotal = 280;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	range = Range_Schwert3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 260;
	visual = "ItMw_RuneSword.3DS";
	on_equip = equip_1h_heavy_ginnok;
	on_unequip = unequip_1h_heavy_ginnok;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_Damn;
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_1H_XARADRIM(C_Item)
{
	name = "Vládce elementů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 320;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	range = Range_Special_1H_4;
	on_equip = equip_1h_xaradrim;
	on_unequip = unequip_1h_xaradrim;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	protection[PROT_MAGIC] = 25;
	//visual = "GODDESS.3DS";
	visual = "ITMW_1H_XARADRIM_NEW.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_1H_LostSoul(C_Item)
{
	name = "Meč ztracených duší";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 8000;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 300;
	damage[DAM_INDEX_MAGIC] = 50;
	range = Range_Schwert3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 290;
	visual = "ITMW_1H_LostSoul.3DS";
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_1H_DEATHBRINGER(C_Item)
{
	name = "Smrtonoš";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = 340;
	damage[DAM_INDEX_FIRE] = 50;
	protection[PROT_FIRE] = 30;
	range = Range_Schwert3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 315;
	visual = "ItMw_1H_DeathJustice.3DS";
	on_equip = equip_1h_veryheavy;
	on_unequip = unequip_1h_veryheavy;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Fire;
	count[2] = damage[DAM_INDEX_FIRE];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_1H_BLESSEDBLACK_MAGIC(C_Item)
{
	name = "Hněv bohů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 750;
	damage[DAM_INDEX_MAGIC] = 250;
	range = Range_Blessed_1H_1;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 500;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FIRE] = 50;
	//visual = "itmw_030_1h_PAL_sword_bastard_BLK_01.3ds";
	visual = "ItMw_1H_GodBane_01.3ds";
	on_equip = equip_blessedblack_magic;
	on_unequip = unequip_blessedblack_magic;
	effect = "SPELLFX_STONESPHERE";
	description = name;
	text[0] = "Způsobuje nadpřirozené poškození...";
	text[1] = NAME_Prot_Fire;
	count[1] = protection[PROT_FIRE];
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_ONEHANDED_PIERCE_LEGEND;
	inv_animate = 1;
};

instance ITMW_1H_BLESSEDBLACK_MAGIC_DEX(C_Item)
{
	name = "Hněv bohů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 105;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 750;
	damage[DAM_INDEX_MAGIC] = 250;
	range = Range_Blessed_1H_1;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 500;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FIRE] = 50;
	//visual = "itmw_030_1h_PAL_sword_bastard_BLK_01.3ds";
	visual = "ItMw_1H_GodBane_01.3ds";
	on_equip = equip_blessedblack_magic;
	on_unequip = unequip_blessedblack_magic;
	effect = "SPELLFX_STONESPHERE";
	description = name;
	text[0] = "Způsobuje nadpřirozené poškození...";
	text[1] = NAME_Prot_Fire;
	count[1] = protection[PROT_FIRE];
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_ONEHANDED_PIERCE_LEGEND;
	ownerGuild = 123;
	inv_animate = 1;
};

//--------------------------unikal'noye oruzhiye 2H-----------------------------

instance ITMW_2H_AXE_KOLUN_107(C_Item)
{
	name = "Válečný kalač";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 110;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 125;
	visual = "ITMW_2H_AXE_KOLUN.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_G3A_ORCAXE_03(C_Item) //Khram voinov v Yarkendare
{
	name = "Prastará sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 180;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Schlachtaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 140;
	visual = "ITMW_2H_G3A_ORCAXE_03.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Drachenschneide(C_Item)			
{
	name = "Vykonavatel spravedlnosti";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Drachenschneide;
	damageTotal = 210;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Drachenschneide;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	visual = "ARC_SWORD2H.3DS";
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Schlachtaxt(C_Item)
{
	name = "Pěst barbara";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Schlachtaxt;
	damageTotal = 220;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Schlachtaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 180;
	//visual = "ItMw_070_2h_axe_heavy_03.3DS";
	visual = "ItMw_Schlachtaxt_New.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_KMR_AXE_H_02(C_Item)
{
	name = "Rudná sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 230;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Schlachtaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	visual = "ITMW_2H_KMR_AXE_H_02.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_KMR_WITCHCLAYMORE_01(C_Item)
{
	name = "Malbarův rudný dvousečný meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 250;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Blessed_2H_3;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 220;
	//visual = "ITMW_2H_KMR_WITCHCLAYMORE_01.3DS";
	visual = "ITMW_2H_KMR_WITCHCLAYMORE_01_NEW.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_ASGARDSWORD(C_Item)
{
	name = "Meč pravdy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 250;
	damageTotal = 260;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Blessed_2H_3;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 220;
	visual = "ITMW_2H_SPECIAL_04_NEW.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance Orc_Blade(C_ITEM)
{
	name = "Katur Dag";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damagetotal = 265;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 190;
	visual = "RAGE_GODDESS.3ds";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_DAMAGE;
	count[1] = damagetotal;
	text[2] = NAME_STR_NEEDED;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_KMR_SOULSWORD_01(C_Item)
{
	name = "Temná přísaha";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 270;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Blessed_2H_3;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 210;
	visual = "ITMW_2H_KMR_SOULSWORD_01.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_RuneAxeAncient(C_Item)
{
	name = "Sekyra Prastarých";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = 290;
	damagetype = DAM_EDGE;
	range = Range_Berserkeraxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 270;
	damage[DAM_INDEX_FIRE] = 1;
	visual = "ITMW_2H_HROMUNDCURSE.3DS";
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Phis;
	count[3] = protection[PROT_EDGE];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_2H_KMR_RHOBAR_01(C_Item)
{
	name = "Rhobarova vůle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 5000;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = 300;
	damage[DAM_INDEX_FIRE] = 25;
	range = Range_Blessed_2H_3;
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	protection[PROT_FIRE] = 30;
	visual = "ITMW_2H_BLESSED_01_NEW.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damage[DAM_INDEX_EDGE];
	text[1] = NAME_Dam_Fire;
	count[1] = damage[DAM_INDEX_FIRE];
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_DemonHand(C_Item)			
{
	name = "Ruka démonů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 5000;
	damageTotal = 320;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Schlachtaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 270;
	visual = "ITMW_2H_KMR_RUNEAXE_01.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_2H_KMR_GREATORCAXE_01(C_Item)
{
	name = "Mora Tanat";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 340;
	damagetype = DAM_EDGE;
	range = Range_Blessed_2H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	visual = "ITMW_2H_KMR_GREATORCAXE_01.3DS";
	on_equip = equip_2h_veryheavy_orc;
	on_unequip = unequip_2h_veryheavy_orc;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_DragonBone(C_Item)
{
	name = "Dračí sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = 355;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Berserkeraxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 310;
	visual = "ITMW_2H_MAKEDAXE8_SM_DRAGONBONE.3DS";
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Phis;
	count[3] = protection[PROT_EDGE];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_2H_URIZEL(C_Item)
{
	name = "Uriziel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 5000;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 340;
	damage[DAM_INDEX_MAGIC] = 150;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	visual = "ItMw_2H_Sword_Sleeper_02_New.3DS";
	on_equip = equip_2h_superheavy;
	on_unequip = unequip_2h_superheavy;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_PierceArmor;
	count[3] = 25;
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_URIZEL_NOMAGIC(C_Item)
{
	name = "Uriziel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 3000;
	damagetype = DAM_EDGE;
	damageTotal = 340;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	visual = "ITMW_2H_SWORD_SLEEPER_02_MATT_New.3DS";
	on_equip = equip_2h_superheavy;
	on_unequip = unequip_2h_superheavy;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_2H_XARADRIM(C_Item)
{
	name = "Čest Asgarda";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damageTotal = 360;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	on_equip = equip_2h_xaradrim;
	on_unequip = unequip_2h_xaradrim;
	range = Range_Special_2H_4;
	protection[PROT_MAGIC] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	//visual = "GODDESS_2H.3DS";
	visual = "ITMW_2H_XARADRIM_NEW.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ItMw_Berserkeraxt(C_Item)
{
	name = "Trýznitel masa";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = 30000;
	damageTotal = 400;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	range = Range_Berserkeraxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 400;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 100;
	//visual = "ItMw_Streitaxt2_New.3DS";
	visual = "ItMw_CutterBody_New_01.3DS";
	on_equip = equip_2h_veryheavy_axe;
	on_unequip = unequip_2h_veryheavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_2H_DRAGONMASTER(C_Item)
{
	name = "Irdorath";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 15000;
	damagetype = DAM_EDGE | DAM_FIRE;
	damage[DAM_INDEX_EDGE] = 400;
	damage[DAM_INDEX_FIRE] = 150;
	protection[PROT_FIRE] = 30;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 350;
	visual = "ItMw_DementorSword.3DS";
	on_equip = equip_2h_superheavy_drach;
	on_unequip = unequip_2h_superheavy;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Fire;
	count[2] = damage[DAM_INDEX_FIRE];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_DarkSoul(C_Item)
{
	name = "Prokletá duše";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 20000;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 420;
	damage[DAM_INDEX_MAGIC] = 250;
	protection[PROT_MAGIC] = 50;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 450;
	visual = "ItMw_2H_DarkSoul.3DS";
	on_equip = equip_2h_superheavy;
	on_unequip = unequip_2h_superheavy;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damage[DAM_INDEX_EDGE];
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_BLESSEDBLACK_MAGIC(C_Item)
{
	name = "Hněv Tvůrců";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 1000;
	damage[DAM_INDEX_MAGIC] = 500;
	range = Range_Blessed_2H_1;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 750;
	protection[PROT_MAGIC] = 100;
	protection[PROT_FIRE] = 100;
	//visual = "ItMw_040_2h_PAL_sword_heavy_BLK_01.3DS";
	visual = "ItMw_2H_GodBane_01.3ds";
	on_equip = equip_blessedblack_magic_2h;
	on_unequip = unequip_blessedblack_magic_2h;
	effect = "SPELLFX_STONESPHERE";
	description = name;
	text[0] = "Způsobuje nadpřirozené poškození...";
	text[1] = NAME_Prot_Fire;
	count[1] = protection[PROT_FIRE];
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

//----------------------lineyka oruzhiya orkov------------------------

instance ItMw_2H_OrcHumanAxe_01(C_Item)
{
	name = "Rudná skřetí sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = 270;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 270;
	visual = "G3_Weapon_Orc_Axe_01.3DS";
	on_equip = equip_2h_heavy_orc_b1;
	on_unequip = unequip_2h_heavy_orc_b1;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcHumanSword_01(C_Item)
{
	name = "Rudný meč válečníka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = 300;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	visual = "G3_Weapon_Orc_Sword_01.3DS";
	on_equip = equip_2h_heavy_orc_b2;
	on_unequip = unequip_2h_heavy_orc_b2;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcHumanGreatAxe(C_Item)
{
	name = "Rudná válečná sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = 330;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 330;
	visual = "G3_WEAPON_AXE_BERZERKRAGEAXE_01.3DS";
	on_equip = equip_2h_veryheavy_orc_b1;
	on_unequip = unequip_2h_veryheavy_orc_b1;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcHumanAxe_02(C_Item)
{
	name = "Rudný skřetí kalač";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = 370;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 370;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 50;
	visual = "G3_Weapon_Orc_Axe_02.3DS";
	on_equip = equip_2h_heavy_orc;
	on_unequip = unequip_2h_heavy_orc;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcHumanSword_02(C_Item)
{
	name = "Rudný meč stařešiny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = 400;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 400;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 150;
	visual = "G3_Weapon_Orc_Sword_02.3DS";
	on_equip = equip_2h_veryheavy_orc;
	on_unequip = unequip_2h_veryheavy_orc;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_OrcHumanDoppelAxe(C_Item)
{
	name = "Rudná útočná sekyra";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = 430;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 430;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 250;
	visual = "G3_Weapon_Axe_Waraxe_01.3DS";
	on_equip = equip_2h_veryheavy_orc;
	on_unequip = unequip_2h_veryheavy_orc;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_OrcHumanClaymore(C_Item)
{
	name = "Rudný dvousečný meč náčelníka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Orkschwert;
	damageTotal = 475;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 475;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 500;
	visual = "ItMw_2H_OrcSword_04.3DS";
	on_equip = equip_2h_veryheavy_orc_b2;
	on_unequip = unequip_2h_veryheavy_orc_b2;
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[1] = NAME_Str_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Bonus_HpMax;
	count[2] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH_ORC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//--------------------------oruzhiye strazha-------------------------------

instance ITMW_ZWEIHAENDER5(C_Item)
{
	name = "Obouruční meč stráže";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Zweihaender2;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = Range_Zweihaender2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	//visual = "ItMw_032_2h_sword_light_01.3DS";
	visual = "ItMw_Zweihaender2_New.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_ZWEIHAENDER6(C_Item)
{
	name = "Obouruční meč stráže";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 500;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 110;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	//visual = "ItMw_032_2h_sword_light_01.3DS";
	visual = "ItMw_Zweihaender2_New.3DS";
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_TAMPLIER_SPECIAL_2H_SWORD_1(C_Item)
{
	name = "Ruka templáře";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 140;
	damagetype = DAM_EDGE;
	range = 115;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 50;
	visual = "ITMW_TAMPLIER_SPECIAL_2H_SWORD_1.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_TAMPLIER_SPECIAL_2H_SWORD_2(C_Item)
{
	name = "Čepel rovnováhy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 4000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 180;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 75;
	visual = "ITMW_TAMPLIER_SPECIAL_2H_SWORD_2.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_TAMPLIER_SPECIAL_2H_SWORD_3(C_Item)
{
	name = "Strážce víry";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 6000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 230;
	damagetype = DAM_EDGE;
	range = 125;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 180;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 100;
	visual = "ITMW_TAMPLIER_SPECIAL_2H_SWORD_3.3DS";
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_TAMPLIER_SPECIAL_2H_SWORD_4(C_Item)
{
	name = "Horlivost fanatika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 8000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 260;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 220;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 150;
	visual = "ITMW_TAMPLIER_SPECIAL_2H_SWORD_4.3DS";
	on_equip = equip_2h_veryheavy;
	on_unequip = unequip_2h_veryheavy;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_TAMPLIER_SPECIAL_2H_SWORD_5(C_Item)
{
	name = "Tesák Spáče";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 5000;
	damageTotal = 325;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	range = 150;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 270;
	change_atr[2] = ATR_HITPOINTS_MAX;
	change_value[2] = 200;
	visual = "ITMW_TAMPLIER_SPECIAL_2H_SWORD_5.3DS";
	on_equip = equip_2h_superheavy;
	on_unequip = unequip_2h_superheavy;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Bonus_HpMax;
	count[2] = change_value[2];
	text[3] = "Legendární čepel prvního templáře Bratrstva Spáče...";
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

//---------------------------novyy tresh v prodazhu--------------------------

instance ItMw_Iron_Dagger(C_Item)
{
	name = "Železná dýka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 100;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 5;
	damagetype = DAM_EDGE;
	range = Range_Wolfsmesser;
	//visual = "ItMw_Iron_Dagger.3DS";
	visual = "ItMw_IronDagger_01_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Steel_Dagger(C_Item)
{
	name = "Ocelová dýka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 200;
	damage[DAM_INDEX_FIRE] = 1;
	damage[DAM_INDEX_MAGIC] = 1;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = Range_Wolfsmesser;
	//visual = "ItMw_Steel_Dagger.3DS";
	visual = "ItMw_SteelDagger_01_New.3DS";
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

//----------------kop'ya---------------------------------------


instance HEERSCHERSTAB(C_Item)
{
	name = "Falx";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_WOOD;
	value = 105;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 40;
	visual = "ItMw_2H_Falx.3DS";
	on_equip = equip_2h_medium_speer;
	on_unequip = unequip_2h_medium_speer;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 40;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Speer(C_Item)
{
	name = "Železné kopí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 325;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 110;
	damagetype = DAM_EDGE;
	range = 125;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 80;
	visual = "ItMw_Speer_01.3DS";
	on_equip = equip_2h_medium_speer;
	on_unequip = unequip_2h_medium_speer;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 110;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 150;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_SwordSpear(C_Item)
{
	name = "Kopí žoldáka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 525;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 130;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 110;
	visual = "ItMw_SwordSpear.3DS";
	on_equip = equip_2h_medium_speer;
	on_unequip = unequip_2h_medium_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 5;
	text[1] = NAME_Damage;
	count[1] = 130;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 200;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Speer_01(C_Item)
{
	name = "Ocelové kopí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 775;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 150;
	damagetype = DAM_EDGE;
	range = 135;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 130;
	visual = "ItMw_Speer_02.3DS";
	on_equip = equip_2h_medium_speer;
	on_unequip = unequip_2h_medium_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 5;
	text[1] = NAME_Damage;
	count[1] = 150;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 250;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Speer_02(C_Item)
{
	name = "Rhademesovo kopí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1255;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 175;
	damagetype = DAM_EDGE;
	range = 135;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 160;
	visual = "ITMW_2H_G3_LONGHALBERD_01.3DS";
	on_equip = equip_2h_medium_speer;
	on_unequip = unequip_2h_medium_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 10;
	text[1] = NAME_Damage;
	count[1] = 175;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 300;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Speer_Silver(C_Item)
{
	name = "Stříbrný měsíc";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1355;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 190;
	damagetype = DAM_EDGE;
	range = 135;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 180;
	visual = "ItMw_Speer_Silver.3DS";
	on_equip = equip_2h_medium_speer;
	on_unequip = unequip_2h_medium_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 15;
	text[1] = NAME_Damage;
	count[1] = 190;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 350;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_HeavySwordSpear(C_Item)
{
	name = "Runový tesák";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1455;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 220;
	damagetype = DAM_EDGE;
	range = 135;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 190;
	visual = "ItMw_HeavySwordSpear.3DS";
	on_equip = equip_2h_medium_speer;
	on_unequip = unequip_2h_medium_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 15;
	text[1] = NAME_Damage;
	count[1] = 210;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 350;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Speer_03(C_Item)
{
	name = "Prastaré kopí Stavitelů";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1895;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 240;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 220;
	visual = "ItMw_Speer_03.3DS";
	on_equip = equip_2h_heavy_speer;
	on_unequip = unequip_2h_heavy_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 20;
	text[1] = NAME_Damage;
	count[1] = 240;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 400;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Speer_GoblinDemon(C_Item)
{
	name = "Gazkulovo kopí";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2095;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 260;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 45;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 240;
	visual = "ItMw_Speer_GoblinDemon_01.3DS";
	on_equip = equip_2h_heavy_speer;
	on_unequip = unequip_2h_heavy_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 25;
	text[1] = NAME_Damage;
	count[1] = 260;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 450;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_ButcherSpeer(C_Item)
{
	name = "Itu'Sedova ruka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2205;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 280;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 260;
	visual = "ItMw_Speer_04.3DS";
	on_equip = equip_2h_heavy_speer;
	on_unequip = unequip_2h_heavy_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 30;
	text[1] = NAME_Damage;
	count[1] = 280;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 500;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Speer_04(C_Item)
{
	name = "Kopí templáře";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2505;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 320;
	damagetype = DAM_EDGE;
	range = 145;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 60;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 300;
	visual = "ItMw_Speer_Guardian_01.3DS";
	on_equip = equip_2h_heavy_speer;
	on_unequip = unequip_2h_heavy_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 35;
	text[1] = NAME_Damage;
	count[1] = 320;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 600;
	text[4] = NAME_TWOHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_DemonSpear(C_Item)
{
	name = "Dráp démona";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 5275;
	damageTotal = 375;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	range = 145;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 300;
	visual = "ItMw_DemonSpear.3DS";
	on_equip = equip_2h_heavy_speer;
	on_unequip = unequip_2h_heavy_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 40;
	text[1] = NAME_Damage;
	count[1] = 375;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 650;
	text[4] = NAME_TWOHANDED_PIERCE_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE_LEGEND;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Speer_05(C_Item)
{
	name = "Napichovač";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 7275;
	damageTotal = 420;
	damagetype = DAM_EDGE;
	damage[DAM_INDEX_MAGIC] = 1;
	range = 150;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 70;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 360;
	visual = "ItMw_Speer_05.3DS";
	on_equip = equip_2h_heavy_speer;
	on_unequip = unequip_2h_heavy_speer;
	description = name;
	text[0] = NAME_PierceArmor;
	count[0] = 50;
	text[1] = NAME_Damage;
	count[1] = 420;
	text[2] = NAME_Dex_needed;
	count[2] = cond_value[2];
	text[3] = NAME_Sta_needed;
	count[3] = 700;
	text[4] = NAME_TWOHANDED_PIERCE_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_PIERCE_LEGEND;
	ownerGuild = 123;
	inv_animate = 1;
};

//----------------------kop'ya----------------------------------------

instance ITMW_1H_WOLF(C_Item)
{
	name = "Stříbrný meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	value = 1000;
	damageTotal = 120;
	damagetype = DAM_EDGE;
	on_equip = equip_1h_medium;
	on_unequip = unequip_1h_medium;
	range = Range_Special_1H_4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMw_1H_SilverBane_01.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Účinný proti přízrakům...";
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_WOLF(C_Item)
{
	name = "Stříbrný obouruční meč";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	value = 1500;
	damageTotal = 160;
	damagetype = DAM_EDGE;
	on_equip = equip_2h_medium;
	on_unequip = unequip_2h_medium;
	range = Range_Special_2H_4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 140;
	visual = "ItMw_2H_SilverBane_01.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Účinný proti přízrakům...";
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_1H_SIGIL(C_Item)
{
	name = "Stříbrný runový sihill";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	value = 1000;
	damageTotal = 250;
	damagetype = DAM_EDGE;
	on_equip = equip_1h_heavy;
	on_unequip = unequip_1h_heavy;
	range = Range_Special_1H_4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 280;
	visual = "ItMw_1H_SilverSigil.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Účinný proti přízrakům a nehmotným bytostem...";
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_2H_SIGIL(C_Item)
{
	name = "Stříbrný runový sihill";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	value = 1500;
	damageTotal = 320;
	damagetype = DAM_EDGE;
	on_equip = equip_2h_heavy;
	on_unequip = unequip_2h_heavy;
	range = Range_Special_2H_4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 350;
	visual = "ItMw_2H_SilverSigil.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Účinný proti přízrakům a nehmotným bytostem...";
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ItSc_Scarband_01(C_Item)
{	
	name	= "Pochva";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItSc_Scarband.3DS";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};

instance ITMW_CHAOSSTAFF_01(C_Item)
{
	name = "Prokletá hůl Chaosu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 100;
	damageTotal = 800;
	damagetype = DAM_FLY;
	range = 150;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 1000;
	cond_atr[1] = ATR_MANA_MAX;
	cond_value[1] = 6666;
	visual = "ItMw_Speer_05.3DS";
	on_equip = equip_2h_heavy_speer_chaos;
	on_unequip = unequip_2h_heavy_speer_chaos;
	description = name;
	inv_animate = 1;
};

instance ItMw_Halleberde_Old(C_Item)
{
	name = "Lehká halapartna";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 500;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	visual = "ITAR_HALLEBERD_NOW.3DS";
	on_equip = equip_2h_medium_halleberde;
	on_unequip = unequip_2h_medium_halleberde;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 50;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[1];
	text[3] = NAME_Sta_needed;
	count[3] = 150;
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Hellebarde(C_Item)
{
	name = "Železná halapartna";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Hellebarde;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = Range_Hellebarde;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	//visual = "itmw_028_2h_halberd_01.3DS";
	visual = "ItMw_Hellebarde_New.3DS";
	on_equip = equip_2h_heavy_axe;
	on_unequip = unequip_2h_heavy_axe;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Halleberde_01(C_Item)
{
	name = "Ocelová halapartna";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 750;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 120;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 100;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	visual = "ITMW_2H_HALLEBERDE_02.3DS";
	on_equip = equip_2h_medium_halleberde;
	on_unequip = unequip_2h_medium_halleberde;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 120;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[1];
	text[3] = NAME_Sta_needed;
	count[3] = 200;
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Halleberde_02(C_Item)
{
	name = "Halapartna žoldáka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 180;
	damagetype = DAM_EDGE;
	range = 135;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 160;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	visual = "ITMW_2H_HALLEBERDE_01.3DS";
	on_equip = equip_2h_medium_halleberde;
	on_unequip = unequip_2h_medium_halleberde;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 180;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[1];
	text[3] = NAME_Sta_needed;
	count[3] = 400;
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Halleberde_Orc(C_Item)
{
	name = "Halapartna skřetího žoldáka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 230;
	damagetype = DAM_EDGE;
	range = 135;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 230;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	visual = "ITMW_2H_HALLEBERDE_ORC.3DS";
	on_equip = equip_2h_medium_halleberde;
	on_unequip = unequip_2h_medium_halleberde;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 230;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[1];
	text[3] = NAME_Sta_needed;
	count[3] = 500;
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_Halleberde_03(C_Item)
{
	name = "Trhající dráp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 2500;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 325;
	damagetype = DAM_EDGE;
	range = 145;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 300;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 60;
	visual = "ITMW_2H_HALLEBERDE_03.3DS";
	on_equip = equip_2h_heavy_halleberde;
	on_unequip = unequip_2h_heavy_halleberde;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 325;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[1];
	text[3] = NAME_Sta_needed;
	count[3] = 600;
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ItMw_Halleberde_04(C_Item)
{
	name = "Aleor";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 5000;
	damage[DAM_INDEX_MAGIC] = 1;
	damage[DAM_INDEX_FIRE] = 1;
	damageTotal = 450;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 400;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 80;
	visual = "ITMW_2H_HALLEBERDE_04.3DS";
	on_equip = equip_2h_heavy_halleberde;
	on_unequip = unequip_2h_heavy_halleberde;
	description = name;
	text[1] = NAME_Damage;
	count[1] = 450;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[1];
	text[3] = NAME_Sta_needed;
	count[3] = 800;
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};