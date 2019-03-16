//------------------эпический шмот для данжа-------------------

instance ItMw_Axe_Blood(C_Item)
{
	name = "Ар'Дашар";
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
	name = "Ар'Ихаир";
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
	name = "Ар'Урат";
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
	name = "Ар'Крах";
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
	name = "Лук Крови";
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

//--------------квестовое оружие-------------------------------

instance ITMW_2H_ORCPRESTIGE(C_Item)
{
	name = "Улу Мулу";
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
	text[3] = "Знак силы и уважения среди орков...";
	text[4] = NAME_TWOHANDED_CRUSH_ORC;
	inv_animate = 1;
};

instance ITMW_ADANOSMOLOT(C_Item)
{
	name = "Бич стражей";
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
	text[3] = "Эффективен против каменных стражей...";
	text[4] = NAME_TWOHANDED_CRUSH_LEGEND;
	inv_animate = 1;
};

instance ITMI_TARACOTHAMMER(C_Item)
{
	name = "Молот Таракота";
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
	name = "Кинжал Сотха";
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
	description = "Жертвенный кинжал Сотха";
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = "Этот кинжал использовался орками для жертвоприношений...";
	text[4] = "На острие лезвия видны капли запекшейся крови...";
	inv_animate = 1;
};


//------------------------------парное------------------------------

instance ItMw_1H_IlArahBlade_Left(C_Item)
{
	name = "Длань Хаоса";
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
	name = "Длань Хаоса";
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
	name = "Топор древнего стража";
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
	name = "Топор древнего стража";
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
	name = "Лунный клинок";
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
	name = "Лунный клинок";
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
	name = "Амул Сах";
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
	name = "Амул Раф";
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
	name = "Длань Масиафа";
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
	name = "Длань Масиафа";
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

//---------------для NPC-------------------------

instance ItMw_1H_IlArahBlade_Left_Npc(C_Item)
{
	name = "Длань Хаоса";
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
	text[4] = "Аура проклятия окружает этот посох...";
	inv_animate = 1;
};

instance ItMw_1H_IlArahBlade_Right_Npc(C_Item)
{
	name = "Длань Хаоса";
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
	text[4] = "Аура проклятия окружает этот посох...";
	inv_animate = 1;
};

instance ItMw_1H_ChelDrak_Left(C_Item)
{
	name = "Проклятый топор Чел'Драка";
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
	text[4] = "Аура проклятия окружает этот посох...";
	inv_animate = 1;
};

instance ItMw_1H_ChelDrak_Right(C_Item)
{
	name = "Проклятый топор Чел'Драка";
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
	text[4] = "Аура проклятия окружает этот посох...";
	inv_animate = 1;
};

instance ItMw_1H_AssBlade_Npc_Left(C_Item)
{
	name = "Клинок Масиаф";
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
	name = "Клинок Масиаф";
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

//--------------------------именоое оружие--------------------------------------

instance ItMw_Schwert5(C_Item) //Скатти
{
	name = "Клык василиска";
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
	name = "Меч Харта";
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

instance ItMw_Zweihaender3(C_Item) //Торус
{
	name = "Клич ярости";
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

instance ItMw_Meisterdegen(C_Item) //Кассия
{
	name = "Шпага мастера-вора";
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

instance ItMw_Krummschwert(C_Item)  //Телохранитель Лемара
{
	name = "Шрам";
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
	name = "Ловкость Диего";
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
	name = "Ингрейн";
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
	name = "Месть Горна";
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
	name = "Удар Ли";
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
	name = "Сила Корда";
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
	name = "Друг Ларса";
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
	name = "Власть Торлофа";
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
	name = "Надменность Сентензы";
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
	name = "Крушитель черепов Джарвиса";
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
	name = "Меч Венцеля";
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
	name = "Двуручник Гор На Коша";
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
	name = "Хитрость Волка";
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
	name = "Уравниватель Лестера";
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
	name = "Меч Кургана";
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
	name = "Меч Фалька";
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

instance ITMW_SCORPIONSPEC(C_Item)  //мастер убийца
{
	name = "Жало скорпиона";
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
	name = "Раймес";
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
	name = "Айри";
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

instance ITMW_ABIGEILSPAGE(C_Item)	//Абигаль
{
	name = "Ранящая игла";
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
	text[3] = "На эфесе выгравированно имя - Абигаль...";
	text[4] = NAME_ONEHANDED_PIERCE_UNIQ;
	visual_change = NAME_ONEHANDED_PIERCE_UNIQ;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ITMW_2H_AXE_GESTATH(C_Item)
{
	name = "Топор Гештата";
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

instance ANGAR_SCHWERT(C_ITEM)		//Ангар
{
	name = "Красный ветер";
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
	name = "Меч Тиаманта";
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
	name = "Меч Ханиара";
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
	name = "Проклятье Масиаф";
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
	name = "Меч Осаира";
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
	name = "Меч Нрозаса";
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


//--------------------------оружие орков -----------------------------

instance ItMw_2H_OrcAxe_01(C_Item)
{
	name = "Краш Панч";
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
	name = "Краш Уррок";
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
	name = "Краш Агаш";
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
	name = "Краш Брокдар";
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
	name = "Грах Каррок";
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
	name = "Грах Вахур";
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
	name = "Грах Хатаг";
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
	name = "Грах Даггар";
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
	name = "Ур Наг Дар";
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
	text[4] = "Оружие орочьего вождя Ур-Тралла...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMW_2H_ORCMACE_01(C_Item)
{
	name = "Хаш Вар";
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
	name = "Даг Вар";
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
	name = "Драготар";
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
	name = "Таротар";
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
	name = "Нат Шахар";
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
	name = "Ур Нат Шахар";
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
	name = "Утар Рат Шахар";
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
	name = "Грах Дар";
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
	name = "Бар Шахар";
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
	name = "Ур Дар Шахар";
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

//-----------------------------щиты-----------------------------------------

instance ItAr_Shield_01(C_Item)
{
	name = "Деревянный щит";
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
	name = "Щит Альрика";
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
	name = "Щит наемника";
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
	name = "Нордмарский щит";
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
	name = "Щит берсерка";
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
	name = "Древний щит";
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
	name = "Щит драконоборца";
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
	name = "Щит из панциря Каракуста";
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
	name = "Щит паладина";
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
	name = "Щит Седрика";
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
	name = "Щит проклятых";
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
	name = "Щит проклятых";
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
	name = "Щит проклятых";
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

//--------------------------Оружие инвентарь-----------------------------

instance ITMW_MEATKNIFE(C_Item)
{
	name = "Тесак мясника";
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
	name = "Разделочный нож";
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
	name = "Коса";
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
	name = "Кочерга";
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
	name = "Серп";
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
	name = "Трость";
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
	name = "Молот каменотеса";
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
	name = "Кузнечный молот";
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
	name = "Тяжелый кузнечный молот";
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
	name = "Плотницкий топор";
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
	name = "Топор лесоруба";
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

//--------------------------Палки-----------------------------


instance ItMw_1h_Bau_Mace(C_Item)
{
	name = "Деревянная палка";
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
	name = "Острая палка";
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
	name = "Дубина";
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
	name = "Палка с шипами";
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
	name = "Каменная дубина";
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
	name = "Дубина огра";
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
	name = "Шипастая дубина";
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
	name = "Гоблинский тотем";
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
	name = "Хир Шар";
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
	text[3] = "Гоблинский тотем власти...";
	text[4] = NAME_TWOHANDED_CRUSH;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1h_Nov_Mace(C_Item)
{
	name = "Боевой посох послушника";
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
	name = "Посох судьи";
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
	name = "Посох пилигрима";
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
	name = "Боевой посох мага";
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
	name = "Боевая дубина";
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
	name = "Боевой посох 'Кольца Воды'";
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
	name = "Посох странника";
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
	name = "Посох Огня";
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
	name = "Посох Воды";
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
	name = "Посох темного мага";
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
	name = "Посох верховного мага Огня";
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
	name = "Посох верховного мага Воды";
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
	name = "Посох некроманта";
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
	name = "Посох Гуру";
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
	name = "Драконий посох";
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
	name = "Гаситель душ";
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
	name = "Посох друида";
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
	name = "Посох верховного мага Огня";
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
	name = "Посох верховного мага Воды";
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
	name = "Посох некроманта";
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
	name = "Посох Гуру";
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
	name = "Посох Ксардаса";
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

//--------------------------Ржавое оружие-----------------------------

instance ItMw_1h_MISC_Sword(C_Item)
{
	name = "Ржавый меч";
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
	name = "Рунный меч";
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
	name = "Рунное рубило";
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
	name = "Рунный меч";
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
	name = "Рунный меч";
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
	name = "Ржавый меч";
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
	name = "Ржавый топор";
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
	name = "Старый двуручник";
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
	name = "Ржавый двуручник";
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

//------------------------------проклятое оужие----------------

instance ITMW_2H_WELTENSPALTER(C_Item)
{
	name = "Проклятие Азгалора";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ItMw_2H_ShadowBlade_Xert(C_Item)
{
	name = "Проклятое Солнце";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_SHADOWPRIEST_Elair(C_Item)
{
	name = "Проклятая Луна";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_SHADOWPRIEST(C_Item)
{
	name = "Проклятый посох";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_SHADOWPRIEST_Elite(C_Item)
{
	name = "Проклятый посох";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_SHADOWPRIEST_Ober(C_Item)
{
	name = "Проклятый посох";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ItMw_PlagueStaff(C_Item)
{
	name = "Посох чумы";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ItMw_2H_IzgulScy(C_Item)
{
	name = "Кровавая жатва";
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
	name = "Посох душ";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ItMw_Doom_OldPiratensaebel(C_Item)
{
	name = "Проклятая пиратская сабля";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_1H_DOOMSWORD(C_Item)
{
	name = "Меч проклятых";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_1H_GHOSTSWORD(C_Item)
{
	name = "Призрачный меч";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_1H_DoomSpeer(C_Item)
{
	name = "Проклятое копье";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_1H_DoomSpeer_Elite(C_Item)
{
	name = "Проклятое копье";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_2H_DRACONSWORD_DEAD(C_Item)
{
	name = "Проклятое рубило";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_1H_DOOMSWORD_Elite(C_Item)
{
	name = "Меч проклятых";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_2H_DOOMSWORD(C_Item)
{
	name = "Двуручник проклятых";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_2H_DOOMSWORD_PreElite(C_Item)
{
	name = "Тяжелый двуручник проклятых";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_2H_DOOMSWORD_Elite(C_Item)
{
	name = "Клеймора проклятых";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_2H_DOOMAXE(C_Item)
{
	name = "Секира проклятых";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_2H_HAOSHAND(C_Item)
{
	name = "Длань Хаоса";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_2H_RAVENELITE(C_Item)
{
	name = "Проклятый двуручник";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

instance ITMW_2H_MASIAF_DAMN(C_Item)
{
	name = "Проклятый меч приора";
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
	text[4] = "Аура проклятия окружает это оружие...";
	inv_animate = 1;
};

//--------------------системные!!!--------------------------------------

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
	name = "Старая колотушка";
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
	name = "Деревянная дубина";
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

//---------------------------Ножи и кинжалы--------------------------

instance ItMw_1h_Vlk_Dagger(C_Item)
{
	name = "Стальной кинжал";
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
	name = "Охотничий нож";
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
	name = "Волчий зуб";
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
	name = "Изысканный кинжал";
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
	name = "Железный кинжал";
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

//-----------------------пиратское оружие-----------------------------

instance ItMw_OldPiratensaebel(C_Item)
{
	name = "Старая пиратская сабля";
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
	name = "Пиратская сабля";
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
	name = "Катэр";
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
	name = "Меч Бартока";
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
	name = "Старое мачете";
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
	name = "Мачете";
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
	name = "Старое огромное мачете";
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
	name = "Огромное мачете";
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
	name = "Пиратский топор";
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
	name = "Пиратский меч";
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
	name = "Пиратский топор";
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
	name = "Фальчион";
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
	name = "Корабельный пиратский топор";
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

//-------------шпаги и рапиры-------------------------------------------

instance ItMw_OldSpage(C_Item)
{
	name = "Ржавая шпага";
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
	name = "Шпага";
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
	name = "Шпага бандита";
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
	text[3] = "На эфесе выгравирована буква 'Ф.'...";
	text[4] = NAME_ONEHANDED_PIERCE;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_PIERCE;
	ownerGuild = 123;
	inv_animate = 1;
};

instance ItMw_Rapier(C_Item)
{
	name = "Рапира";
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

//-----------линейка шпаг-----------------------

instance ItMw_ChiefRapier_01(C_Item)
{
	name = "Шпага вора";
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
	name = "Воровская рапира";
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
	name = "Шпага мастера-вора";
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
	name = "Тихая смерть";
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
	name = "Пронзающая сталь";
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
	name = "Жало скорпиона";
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
	name = "Серебрянная шпага";
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
	name = "Крик в ночи";
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
	name = "Золотая игла";
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
	name = "Кровопийца";
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
	name = "Кинжал жрицы Белиара";
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

//---------------------мечи на ловкость--------------------

instance ItMw_Addon_Betty(C_Item)
{
	name = "Бэтти";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
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
	name = "Сабля капитана Дрейка";
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
	name = "Кама, меч тени Масиафа";
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
	name = "Черное сердце";
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

//----------------оружие ассасинов---------------------------

instance ITMW_2H_KATANA(C_Item)
{
	name = "Меч ассасина";
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
	name = "Меч ассасина";
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
	name = "Меч ассасина";
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
	text[3] = "На рукоятке клинка выбито имя 'Гонсалес'...";
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ItMw_1H_AssBlade(C_Item)
{
	name = "Клинок убийцы";
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
	text[3] = "Это оружие я снял с трупа одного из убийц,";
	text[4] = "напавших на лагерь сборщиков болотника...";
	inv_animate = 1;
};

instance ItMw_1H_AssBlade_View(C_Item)
{
	name = "Клинок убийцы";
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
	name = "Кама Масиафа";
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
	name = "Меч";
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
	text[4] = "Ритуальный меч теней Масиафа...";
	inv_animate = 1;
};

//----------------обычные мечи------------------------

instance ItMw_1h_Vlk_Axe(C_Item)
{
	name = "Топор";
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
	name = "Короткий меч ополченца";
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
	name = "Грубый короткий меч";
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
	name = "Короткий меч";
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
	name = "Волчий зуб";
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
	name = "Благородный короткий меч";
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
	name = "Меч";
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
	name = "Меч ополченца";
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
	name = "Грубый меч";
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
	name = "Палаш";
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
	name = "Длинный меч";
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
	name = "Клинок рыцаря";
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
	name = "Легкий двуручник";
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
	name = "Грубый двуручник";
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
	name = "Двуручник";
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
	name = "Двуручник рыцаря";
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
	name = "Тяжелый двуручник";
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
	name = "Клеймора";
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
	name = "Освященный клинок рыцаря";
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
	name = "Освященный двуручник рыцаря";
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

//--------------------------дробящее-----------------------------

instance ItMw_Nagelkeule(C_Item)
{
	name = "Булава";
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
	name = "Тяжелая булава";
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
	name = "Боевая булава";
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
	name = "Костелом";
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
	name = "Череполом";
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
	name = "Боевой клив";
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
	name = "Боевой молот";
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
	name = "Утренняя звезда";
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
	name = "Жалящая булава";
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
	name = "Инквизитор";
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
	name = "Ночь ворона";
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
	name = "Шипастая двуручная дубина";
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
	name = "Двуручный молот";
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
	name = "Двуручный боевой молот";
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
	name = "Крушитель";
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
	name = "Рунический молот";
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
	name = "Дробильщик костей";
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
	name = "Ледяной молот";
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
	name = "Нордмарский боевой молот";
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
	name = "Годендар";
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
	name = "Острошип";
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
	name = "Молот бурь";
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

//----------------------топоры----------------------------

instance ItMw_1h_Sld_Axe(C_Item)
{
	name = "Грубый топор";
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
	name = "Топор наемника";
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
	name = "Двойной топор";
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
	name = "Грубый двуручный топор";
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
	name = "Легкий боевой топор";
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
	name = "Длинная секира";
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
	name = "Старый боевой топор";
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
	name = "Боевой секач";
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
	name = "Боевой топор";
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
	name = "Тяжелый боевой топор";
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

//----------------------------Кованое оружие----------------------------------------------

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
	name = "Благородный меч";
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
	name = "Благородный длинный меч";
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
	name = "Рубиновый клинок";
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
	name = "Эль'Бастардо";
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
	name = "Убийца драконов";
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
	name = "Убийца драконов";
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
	name = "Простой рудный меч";
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
	name = "Освященный рудный меч";
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
	name = "Ярость Инноса";
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
	name = "Простой рудный двуручник";
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
	name = "Освященный рудный двуручник";
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
	name = "Святой Исполнитель";
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
	name = "Святой Исполнитель";
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
	name = "Черный рудный меч";
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
	name = "Черный рудный меч";
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
	name = "Черный рудный двуручник";
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

//--------------------------уникальное оружие 1H-----------------------------

instance ITMW_1H_KMR_GREATLONG_01(C_Item)
{
	name = "Рыцарский палаш";
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
	name = "Рунический меч";
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
	name = "Убийца орков";
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
	text[3] = "Эффективен против орков...";
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_1H_СREST(C_Item)
{
	name = "Крест Судьбы";
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
	name = "Миротворец";
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
	name = "Укротитель нежити";
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
	name = "Судьбаносная сталь";
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
	name = "Меч Беннета";
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
	name = "Змеевик";
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
	name = "Серебряный нордмарский меч";
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
	text[3] = "Эффективен против призраков...";
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_1H_G3A_DAEMONBLADE_01(C_Item)
{
	name = "Поборник душ";
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
	name = "Смерторуб";
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
	name = "Меч Безумного Крестоносца";
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
	name = "Повелитель Стихий";
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
	name = "Меч потерянных душ";
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
	name = "Несущий смерть";
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
	name = "Гнев Богов";
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
	text[0] = "Наносит божественный урон...";
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
	name = "Гнев Богов";
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
	text[0] = "Наносит божественный урон...";
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

//--------------------------уникальное оружие 2H-----------------------------

instance ITMW_2H_AXE_KOLUN_107(C_Item)
{
	name = "Боевой колун";
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

instance ITMW_2H_G3A_ORCAXE_03(C_Item) //Храм воинов в Яркендаре
{
	name = "Древний топор";
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
	name = "Вершитель правосудия";
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
	name = "Кулак варвара";
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
	name = "Рудный топор";
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
	name = "Рудная клеймора Мальбара";
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
	name = "Меч Истины";
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
	name = "Катур Даг";
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
	name = "Темный обет";
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
	name = "Секира Древних";
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
	name = "Воля Робара";
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
	name = "Длань демонов";
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
	name = "Мора Танат";
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
	name = "Драконий топор";
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
	name = "Уризель";
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
	name = "Уризель";
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
	name = "Честь Асгарда";
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
	name = "Рассекатель плоти";
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
	name = "Ирдорат";
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
	name = "Проклятая душа";
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
	name = "Гнев Создателей";
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
	text[0] = "Наносит божественный урон...";
	text[1] = NAME_Prot_Fire;
	count[1] = protection[PROT_FIRE];
	text[2] = NAME_Prot_Magic;
	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Bonus_HpMax;
	count[3] = change_value[2];
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

//----------------------линейка оружия орков------------------------

instance ItMw_2H_OrcHumanAxe_01(C_Item)
{
	name = "Рудный орочий топор";
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
	name = "Рудный меч воина";
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
	name = "Рудный боевой топор";
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
	name = "Рудный орочий колун";
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
	name = "Рудный меч старейшины";
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
	name = "Рудная штурмовая секира";
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
	name = "Рудная клеймора вождя";
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

//--------------------------оружие стража-------------------------------

instance ITMW_ZWEIHAENDER5(C_Item)
{
	name = "Двуручник cтража";
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
	name = "Двуручник cтража";
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
	name = "Длань Стража";
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
	name = "Клинок равновесия";
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
	name = "Хранитель веры";
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
	name = "Рвение фанатика";
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
	name = "Клык Спящего";
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
	text[3] = "Легендарный клинок первого стража Братства Спящего...";
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

//----------------------------новый треш в продажу--------------------------

instance ItMw_Iron_Dagger(C_Item)
{
	name = "Железный кинжал";
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
	name = "Стальной кинжал";
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

//----------------копья---------------------------------------


instance HEERSCHERSTAB(C_Item)
{
	name = "Фалкс";
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
	name = "Железное копье";
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
	name = "Копье наемника";
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
	name = "Стальное копье";
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
	name = "Копье Радемеса";
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
	name = "Серебряная луна";
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
	name = "Рунный клык";
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
	name = "Древнее копье Зодчих";
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
	name = "Копье Газкула";
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
	name = "Длань Иту'Седа";
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
	name = "Копье Стража";
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
	name = "Коготь демона";
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
	name = "Пронзатель";
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

//----------------------копья----------------------------------------

instance ITMW_1H_WOLF(C_Item)
{
	name = "Серебряный меч";
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
	text[3] = "Эффективен против призраков...";
	text[4] = NAME_ONEHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_2H_WOLF(C_Item)
{
	name = "Серебряный двуручник";
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
	text[3] = "Эффективен против призраков...";
	text[4] = NAME_TWOHANDED_SLASH;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH;
	inv_animate = 1;
};

instance ITMW_1H_SIGIL(C_Item)
{
	name = "Серебряный рунный сигиль";
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
	text[3] = "Эффективен против призраков и бестелесных созданий...";
	text[4] = NAME_ONEHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_ONEHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ITMW_2H_SIGIL(C_Item)
{
	name = "Серебряный рунный сигиль";
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
	text[3] = "Эффективен против призраков и бестелесных созданий...";
	text[4] = NAME_TWOHANDED_SLASH_LEGEND;
	text[5] = NAME_Value;
	count[5] = value;
	visual_change = NAME_TWOHANDED_SLASH_LEGEND;
	inv_animate = 1;
};

instance ItSc_Scarband_01(C_Item)
{	
	name	= "Ножны";
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
	name = "Проклятый посох Хаоса";
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
	name = "Легкая алебарда";
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
	name = "Железная алебарда";
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
	name = "Стальная алебарда";
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
	name = "Алебарда наемника";
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
	name = "Алебарда наемника орков";
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
	name = "Раздирающий коготь";
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
	name = "Алеор";
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