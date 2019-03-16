instance ItAr_BloodArmor(C_Item)
{
	name = "Доспехи Крови";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 270;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 190;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 120;
	protection[PROT_FLY] = 90;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 500;
	weight = 8;
	on_equip = Equip_BloodArmor;
	on_unequip = UnEquip_BloodArmor;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "DEADRICARMOR.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 500 | Требуется выносливости: 900";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_Ilesil(C_Item)
{
	name = "Доспехи Иле'Силя";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 270;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 190;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 120;
	protection[PROT_FLY] = 90;
	on_equip = equip_otherarmor;
	wear = WEAR_TORSO;
	visual = "ITAR_DHT_END_4.3ds";
	visual_change = "DEADRICARMOZ.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	inv_animate = 0;
};

instance ItAr_BloodRobe(C_Item)
{
	name = "Покров Крови";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 160;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 170;
	protection[PROT_MAGIC] = 190;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 1200;
	value = protection[PROT_MAGIC];
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "PIRANHA_BELIARROBE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_DarkMessian;
	on_unequip = UnEquip_DarkMessian;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_BauBabe_L_New(C_Item)
{
	name = "Легкий наряд крестьянки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_BauBabe_L;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "SRN_ARMOR_G2_v1.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_VlkBabe_L_New(C_Item)
{
	name = "Легкий наряд горожанки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_VlkBabe_L;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "SRN_ARMOR_G2_v2.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_BauBabe_M_New(C_Item)
{
	name = "Наряд крестьянки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_BauBabe_M;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "SRN_ARMOR_G2_v4.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_VlkBabe_M_New(C_Item)
{
	name = "Наряд горожанки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_VlkBabe_M;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "SRN_ARMOR_G2_v5.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_VlkBabe_H_New(C_Item)
{
	name = "Роскошный наряд горожанки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_VlkBabe_H;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "SRN_ARMOR_G2_v3.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_CASSIA_ARMOR(C_Item)
{
	name = "Доспехи Кассии";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	wear = WEAR_TORSO;
	//value = 500;
	visual = "ItAr_Uniform_L.3ds";
	on_equip = equip_otherarmor;
	visual_change = "SRN_ARMOR_G9_v9.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	inv_animate = 0;
};

instance ITAR_AVABUL_ARMOR(C_Item)
{
	name = "Доспехи Авабюл";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	//value = 100;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3ds";
	on_equip = equip_otherarmor;
	visual_change = "AML_NECRO.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_BauBabe_L(C_Item)
{
	name = "Легкий наряд крестьянки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	//value = VALUE_ITAR_BauBabe_L;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_BauBabe_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_VlkBabe_L(C_Item)
{
	name = "Легкий наряд горожанки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	//value = VALUE_ITAR_VlkBabe_L;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_VlkBabe_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_BauBabe_M(C_Item)
{
	name = "Наряд крестьянки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_BauBabe_M;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_BauBabe_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_VlkBabe_M(C_Item)
{
	name = "Наряд горожанки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_VlkBabe_M;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_VlkBabe_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_VlkBabe_H(C_Item)
{
	name = "Роскошный наряд горожанки";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_VlkBabe_H;
	visual = "ItAr_VLKBabe.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_VlkBabe_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_Fake_RANGER(C_Item)
{
	name = "Доспехи 'Кольца Воды'";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Ranger_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_HUNH_V0_ARMOR.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};


instance ITAR_PRISONEL(C_Item)
{
	name = "Простые штаны рудокопа";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 1;
	protection[PROT_BLUNT] = 1;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = value_itar_prisonel;
	visual = "ItAr_Prisonel.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Prisonel.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	inv_animate = 0;
};

instance ITAR_Prisoner(C_Item)
{
	name = "Штаны рудокопа";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 3;
	protection[PROT_BLUNT] = 3;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Prisoner;
	visual = "ItAr_Prisoner.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Prisoner.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	inv_animate = 0;
};

instance ITAR_Bau_L(C_Item)
{
	name = "Легкая одежда крестьянина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	//value = VALUE_ITAR_Bau_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_L.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Bau_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_Bau_L_01(C_Item)
{
	name = "Легкая одежда крестьянина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Bau_L;
	visual = "ARMOR_BAU_L_KANION.3DS";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_BAU_L_KANION.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_Bau_L_02(C_Item)
{
	name = "Легкая одежда крестьянина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Bau_L;
	visual = "ARMOR_BAU_L_KANION2.3DS";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_BAU_L_KANION2.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_BAU_L_TRANS(C_Item)
{
	name = "Легкая одежда крестьянина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Bau_L;
	visual = "ItAr_Bau_L.3DS";
	on_equip = equip_itar_bau_l_trans;
	on_unequip = unequip_itar_bau_l_trans;
	visual_change = "Armor_Bau_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_Vlk_L(C_Item)
{
	name = "Легкая одежда горожанина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Vlk_L;
	visual = "ItAr_VLK_L.3DS";
	on_equip = equip_otherarmor_pablo;
	on_unequip = unequip_otherarmor_pablo;
	visual_change = "Armor_Vlk_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_Bau_M(C_Item)
{
	name = "Одежда крестьянина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Bau_M;
	visual = "ItAr_Bau_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Bau_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_Bau_M_Ext(C_Item)
{
	name = "Одежда крестьянина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Bau_M;
	visual = "ARMOR_BAU_M_KANION.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_BAU_M_KANION.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ItAr_ShValley_Armor(C_Item)
{
	name = "Одежда";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	//value = 10;
	wear = WEAR_TORSO;
	visual = "ARMOR_BAU_M_KANION.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ItAr_ShValley_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	inv_animate = 0;
};

instance ITAR_Vlk_M(C_Item)
{
	name = "Одежда горожанина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Vlk_M;
	visual = "ItAr_VLK_M.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Vlk_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_Vlk_Matteo(C_Item)
{
	name = "Одежда горожанина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Vlk_M;
	visual = "ItAr_VLK_M.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Vlk_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_Vlk_H(C_Item)
{
	name = "Роскошная одежда горожанина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Vlk_H;
	visual = "ItAr_VLK_H.3DS";
	on_equip = equip_otherarmor;
	//visual_change = "Armor_Vlk_H.asc";
	visual_change = "ItAr_TopTrader_02.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_Vlk_SH(C_Item)
{
	name = "Роскошная одежда горожанина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Vlk_H;
	visual = "ItAr_VLK_H.3DS";
	on_equip = equip_otherarmor;
	visual_change = "ItAr_TopTrader_02.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_Vlk_H_01(C_Item)
{
	name = "Одежда богатого торговца";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	//value = VALUE_ITAR_Vlk_H;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_H.3DS";
	on_equip = equip_otherarmor;
	//visual_change = "Armor_Vlk_H.asc";
	visual_change = "ItAr_TopTrader_01.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_Vlk_H_02(C_Item)
{
	name = "Одежда богатого торговца";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Vlk_H;
	visual = "ItAr_VLK_H.3DS";
	on_equip = equip_otherarmor;
	//visual_change = "Armor_Vlk_H.asc";
	visual_change = "ItAr_TopTrader_03.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_Barkeeper(C_Item)
{
	name = "Одежда трактирщика";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Barkeeper;
	visual = "ItAr_Wirt.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Barkeeper.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	inv_animate = 0;
};

instance ITAR_Smith(C_Item)
{
	name = "Одежда c фартуком";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Smith;
	visual = "ItAr_Smith.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Smith.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_HeavySmith(C_Item)
{
	name = "Одежда кузнеца";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Smith;
	visual = "ItAr_Smith.3DS";
	on_equip = equip_otherarmor;
	visual_change = "HUM_BODY_COOKSMITH.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_ALCHEMY(C_Item)
{
	name = "Одежда алхимика";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 5;
	weight = 0;
	wear = WEAR_TORSO;
	//value = value_itar_alchemy;
	visual = "ItAr_Alch.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Alchemist.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_Judge(C_Item)
{
	name = "Мантия судьи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Judge;
	visual = "ItAr_Governor.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Judge.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_MAGE(C_Item)
{
	name = "Мантия мага";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_MAGIC];
	weight = 0;
	wear = WEAR_TORSO;
	visual = "ItAr_Governor.3DS";
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	visual_change = "PIRANHA_INNOSROBE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_Governor(C_Item)
{
	name = "Накидка городского советника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	wear = WEAR_TORSO;
	//value = VALUE_ITAR_Governor;
	visual = "ItAr_Governor.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Governor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_SEKBED(C_Item)
{
	name = "Набедренная повязка Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MULTI | ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = value_itar_sekbed;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItAr_Sekbed.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_NOVL_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

instance ITAR_SEKBED_V1(C_Item)
{
	name = "Набедренный кушак Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MULTI | ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	wear = WEAR_TORSO;
	//value = value_itar_sekbed_v1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "ItAr_Sekbed_V1.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_NOVL_Armor.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_animate = 0;
};

prototype ITAR_SMITH_NOV_A(C_Item)
{
	name = "Одежда кузнеца-подмастерья";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	wear = WEAR_TORSO;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	weight = 1;
	visual = "ItAr_Smith.3DS";
	on_equip = equip_otherarmor;
	visual_change = "HUM_BODY_COOKSMITH.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_SMITH_NOV(ITAR_SMITH_NOV_A)
{
	name = "Одежда кузнеца-подмастерья";
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	cond_value[2] = 10;
	weight = 1;
	//value = value_itar_smith_nov;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_SMITH_NOV_01(ITAR_SMITH_NOV_A)
{
	name = "Одежда кузнеца-подмастерья";
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	cond_value[2] = 15;
	weight = 1;
	//value = VALUE_ITAR_SMITH_NOV + 100;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_SMITH_NOV_02(ITAR_SMITH_NOV_A)
{
	name = "Одежда кузнеца-подмастерья";
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	cond_value[2] = 20;
	weight = 1;
	//value = VALUE_ITAR_SMITH_NOV + 200;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_SMITH_NOV_03(ITAR_SMITH_NOV_A)
{
	name = "Одежда кузнеца-подмастерья";
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	cond_value[2] = 25;
	//value = VALUE_ITAR_SMITH_NOV + 300;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_SMITH_NOV_04(ITAR_SMITH_NOV_A)
{
	name = "Одежда кузнеца-подмастерья";
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	cond_value[2] = 30;
	//value = VALUE_ITAR_SMITH_NOV + 400;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_SMITH_NOV_05(ITAR_SMITH_NOV_A)
{
	name = "Одежда кузнеца-подмастерья";
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	cond_value[2] = 35;
	//value = VALUE_ITAR_SMITH_NOV + 500;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_Leather_L(C_Item)
{
	name = "Кожаный доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_Leather_L;
	cond_atr[2] = ATR_DEXTERITY;
	weight = 1;
	cond_value[2] = 25;
	wear = WEAR_TORSO;
	visual = "RoWoo_armor.3ds";
	visual_change = "Hum_RoWoo_armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_Leather_L;
	on_unequip = UnEquip_ITAR_Leather_L;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_Leather_NPC(C_Item)
{
	name = "Кожаный доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	//value = VALUE_ITAR_Leather_L;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 25;
	wear = WEAR_TORSO;
	visual = "RoWoo_armor.3ds";
	visual_change = "Hum_RoWoo_armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_Leather_L;
	on_unequip = UnEquip_ITAR_Leather_L;
	description = name;
	inv_animate = 0;
};

instance ITAR_Leather_M(C_Item)
{
	name = "Тяжелый кожаный доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	//value = 500;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 30;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "ARMOR_LEATHER_L_GRD5.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_Leather_L;
	on_unequip = UnEquip_ITAR_Leather_L;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_LEATHER_UNICK(C_Item)
{
	name = "Кожаный доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	//value = VALUE_ITAR_Leather_L;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 25;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "ARMOR_LEATHER_L_GRD1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_Leather_L;
	on_unequip = UnEquip_ITAR_Leather_L;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_ALCHEMY_NOV(C_Item)
{
	name = "Одежда алхимика-подмастерья";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 5;
	weight = 0;
	//value = VALUE_ITAR_ALCHEMY;
	wear = WEAR_TORSO;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItAr_Alch.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Alchemist.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_KIL_L(C_Item)
{
	name = "Доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = value_itar_kil_l;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ITAR_BM_L.3DS";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_BM_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_KIL_SL(C_Item)
{
	name = "Доспех убийцы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	wear = WEAR_TORSO;
	weight = 2;
	value = protection[PROT_MAGIC];
	visual = "ITAR_BM_L.3DS";
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	visual_change = "ARMOR_WMA_ASSN.asc";
	visual_skin = 0;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 90;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_KIL_SLS(C_Item)
{
	name = "Доспех мастера-убийцы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	weight = 3;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 100;
	visual = "ITAR_BM_L.3DS";
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	visual_change = "ARMOR_BM_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ASMAL(C_Item)
{
	name = "Доспех Асмала";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 20;
	wear = WEAR_TORSO;
	visual = "ITAR_BM_L.3DS";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_BM_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

prototype ITAR_MIL_L_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	wear = WEAR_TORSO;
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_MIL_L;
	on_unequip = UnEquip_ITAR_MIL_L;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_TOWNGUARD(ITAR_MIL_L_A)
{
	name = "Легкие доспехи ополчения";
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	//value = 400;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItAr_MIL_L.3DS";
	visual_change = "Spaeher.asc";
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_Mil_L(ITAR_MIL_L_A)
{
	name = "Доспехи ополчения";
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 1;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItAr_MIL_L.3DS";
	visual_change = "Armor_Mil_L.asc";
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_MIL_L_V1(ITAR_MIL_L_A)
{
	name = "Кованые доспехи ополчения";
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_value[2] = 45;
	weight = 1;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	//value = value_itar_mil_l_v1;
	visual = "ItAr_MIL_L_V1.3DS";
	visual_change = "Armor_Mil_S.asc";
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_MIL_L_V12(ITAR_MIL_L_A)
{
	name = "Кованые доспехи ополчения";
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 60;
	weight = 2;
	//value = VALUE_ITAR_MIL_L_V1 + 150;
	visual = "ItAr_MIL_L_V1.3DS";
	visual_change = "Armor_Mil_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 60 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_MIL_L_V13(ITAR_MIL_L_A)
{
	name = "Кованые доспехи ополчения";
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 65;
	weight = 2;
	//value = VALUE_ITAR_MIL_L_V1 + 300;
	visual = "ItAr_MIL_L_V1.3DS";
	visual_change = "Armor_Mil_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 65 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_MIL_L_V14(ITAR_MIL_L_A)
{
	name = "Кованые доспехи ополчения";
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 70;
	weight = 2;
	//value = VALUE_ITAR_MIL_L_V1 + 450;
	visual = "ItAr_MIL_L_V1.3DS";
	visual_change = "Armor_Mil_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 70 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_MIL_L_V15(ITAR_MIL_L_A)
{
	name = "Кованые доспехи ополчения";
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_value[2] = 75;
	weight = 3;
	//value = VALUE_ITAR_MIL_L_V1 + 600;
	visual = "ItAr_MIL_L_V1.3DS";
	visual_change = "Armor_Mil_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 75 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

prototype ITAR_SLD_L_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	wear = WEAR_TORSO;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_SLD_L;
	on_unequip = UnEquip_ITAR_SLD_L;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	inv_animate = 0;
};

instance ItAr_Sld_L(ITAR_SLD_L_A)
{
	name = "Легкие доспехи наемника";
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	weight = 1;
	//value = value_itar_sld_l;
	visual = "ItAr_Sld_L.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 0;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_SLD_L_V1(ITAR_SLD_L_A)
{
	name = "Легкие кованые доспехи наемника";
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_value[2] = 50;
	weight = 1;
	//value = value_itar_sld_l_v1;
	visual = "ItAr_Sld_L_V1.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 1;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_SLD_L_V2(ITAR_SLD_L_A)
{
	name = "Легкие кованые доспехи наемника";
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 55;
	weight = 2;
	//value = VALUE_ITAR_SLD_L_V1 + 100;
	visual = "ItAr_Sld_L_V1.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 1;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 55 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_SLD_L_V3(ITAR_SLD_L_A)
{
	name = "Легкие кованые доспехи наемника";
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 60;
	weight = 2;
	//value = VALUE_ITAR_SLD_L_V1 + 200;
	visual = "ItAr_Sld_L_V1.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 1;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 60 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_SLD_L_V4(ITAR_SLD_L_A)
{
	name = "Легкие кованые доспехи наемника";
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 65;
	weight = 2;
	//value = VALUE_ITAR_SLD_L_V1 + 300;
	visual = "ItAr_Sld_L_V1.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 1;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 65 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_SLD_L_V5(ITAR_SLD_L_A)
{
	name = "Легкие кованые доспехи наемника";
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_value[2] = 70;
	weight = 2;
	//value = VALUE_ITAR_SLD_L_V1 + 400;
	visual = "ItAr_Sld_L_V1.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 1;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 70 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

prototype ITAR_SLD_M_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	wear = WEAR_TORSO;
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_SLD_M;
	on_unequip = UnEquip_ITAR_SLD_M;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_SLD_M(ITAR_SLD_M_A)
{
	name = "Доспехи наемника";
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	weight = 2;
	//value = value_itar_sld_m;
	visual = "ItAr_Sld_M.3ds";
	visual_change = "Armor_Sld_M.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 60 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_SLD_M_Rod(ITAR_SLD_M_A)
{
	name = "Доспехи наемника";
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 2;
	//value = value_itar_sld_m;
	visual = "ItAr_Sld_M.3ds";
	visual_change = "Armor_Sld_M.asc";
	description = name;
	inv_animate = 0;
};

instance ITAR_SLD_M_V1(ITAR_SLD_M_A)
{
	name = "Кованые доспехи наемника";
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 65;
	weight = 2;
	//value = value_itar_sld_m_v1;
	visual = "ItAr_Sld_M_V1.3ds";
	visual_change = "Armor_Sld_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 65 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_SLD_M_V2(ITAR_SLD_M_A)
{
	name = "Кованые доспехи наемника";
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_value[2] = 70;
	weight = 3;
	//value = VALUE_ITAR_SLD_M_V1 + 250;
	visual = "ItAr_Sld_M_V1.3ds";
	visual_change = "Armor_Sld_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 70 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_SLD_M_V3(ITAR_SLD_M_A)
{
	name = "Кованые доспехи наемника";
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_value[2] = 80;
	weight = 3;
	//value = VALUE_ITAR_SLD_M_V1 + 500;
	visual = "ItAr_Sld_M_V1.3ds";
	visual_change = "Armor_Sld_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 80 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_SLD_M_V4(ITAR_SLD_M_A)
{
	name = "Кованые доспехи наемника";
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_value[2] = 90;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Sld_M_V1.3ds";
	visual_change = "Armor_Sld_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 90 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SLD_M_V5(ITAR_SLD_M_A)
{
	name = "Кованые доспехи наемника";
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	cond_value[2] = 100;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Sld_M_V1.3ds";
	visual_change = "Armor_Sld_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 100 | Требуется выносливости: 250";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SLP_UL(C_Item)
{
	name = "Доспехи послушника Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_MAGIC];
	weight = 1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	wear = WEAR_TORSO;
	visual = "NOVM.3ds";
	on_equip = Equip_ITAR_SEK_L;
	on_unequip = UnEquip_ITAR_SEK_L;
	visual_change = "HUM_NOVM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SLP_L(C_Item)
{
	name = "Тяжелые доспехи послушника Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	weight = 2;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ItAr_Lester.3ds";
	on_equip = Equip_ITAR_SEK_L;
	on_unequip = UnEquip_ITAR_SEK_L;
	visual_change = "Armor_Lester.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_NOV_L(C_Item)
{
	name = "Роба послушника Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_MAGIC];
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Nov_L.3ds";
	visual_change = "Armor_Nov_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_NOV_L;
	on_unequip = UnEquip_ITAR_NOV_L;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_NDW_L(C_Item)
{
	name = "Роба послушника Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 20;
	value = protection[PROT_MAGIC];
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_NDW_L.3ds";
	visual_change = "Armor_NDW_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_NOV_L;
	on_unequip = UnEquip_ITAR_NOV_L;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_NDM_L(C_Item)
{
	name = "Роба темного послушника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_MAGIC];
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_NDM_L.3ds";
	on_equip = Equip_ITAR_NOV_L;
	on_unequip = UnEquip_ITAR_NOV_L;
	visual_change = "Armor_NDM_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_KDF_L(C_Item)
{
	name = "Роба младшего мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 50;
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "Armor_Kdf_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_KDF_M(C_Item)
{
	name = "Роба мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 20;
	weight = 1;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 100;
	visual = "kdfs.3ds";
	//visual_change = "HUM_KDFS_Armor.asc";
	visual_change = "FIREMAGE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_KDF_M_NPC(C_Item)
{
	name = "Роба мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 20;
	weight = 1;
	//value = value_itar_kdf_m;
	wear = WEAR_TORSO;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 100;
	visual = "kdfs.3ds";
	//visual_change = "HUM_KDFS_Armor.asc";
	visual_change = "FIREMAGE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	description = name;
	inv_animate = 0;
};

instance ITAR_KDF_M_NEW(C_Item)
{
	name = "Роба мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 15;
	weight = 1;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 75;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "Armor_Kdf_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_KDW_L_Addon(C_Item)
{
	name = "Роба мага Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 50;
	weight = 2;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 100;
	wear = WEAR_TORSO;
	visual = "ItAr_KDW_L_ADDON.3ds";
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	visual_change = "WATERMAGE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DMT_L(C_Item)
{
	name = "Роба темного мага";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 40;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 100;
	wear = WEAR_TORSO;
	weight = 2;
	visual = "ItAr_DMT_L.3ds";
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	visual_change = "DARKEMAGE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_GUR_L(C_Item)
{
	name = "Роба гуру Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 60;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 100;
	weight = 2;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ItAr_GUR_L.3ds";
	on_equip = Equip_ITAR_GUR_L;
	on_unequip = UnEquip_ITAR_GUR_L;
	visual_change = "HUM_GURM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_MAYA_PRIEST(C_Item)
{
	name = "Роба древних жрецов";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 70;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 250;
	weight = 2;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ItAr_GUR_M.3ds";
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	visual_change = "HUM_GURM_ARMOR.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

prototype ITAR_RANGER_ADDON_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	//value = VALUE_ITAR_RANGER_Addon;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	wear = WEAR_TORSO;
	visual = "ItAr_Ranger_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_HUNH_V0_ARMOR.ASC";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_RANGER_Addon(ITAR_RANGER_ADDON_A)
{
	name = "Доспех 'Кольца Воды'";
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_value[2] = 20;
	weight = 1;
	visual_change = "HUM_HUNH_V0_ARMOR.ASC";
	value = protection[PROT_MAGIC];
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_RANGER_ADDON_V1(ITAR_RANGER_ADDON_A)
{
	name = "Кованый доспех 'Кольца Воды'";
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_value[2] = 25;
	weight = 2;
	value = protection[PROT_MAGIC];
	visual_change = "HUM_HUNH_V1_ARMOR.ASC";
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_RANGER_ADDON_V2(ITAR_RANGER_ADDON_A)
{
	name = "Кованый доспех 'Кольца Воды'";
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 35;
	weight = 2;
	value = protection[PROT_MAGIC];
	visual_change = "HUM_HUNH_V1_ARMOR.ASC";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 35 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_RANGER_ADDON_V3(ITAR_RANGER_ADDON_A)
{
	name = "Кованый доспех 'Кольца Воды'";
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 45;
	weight = 2;
	value = protection[PROT_MAGIC];
	visual_change = "HUM_HUNH_V2_ARMOR.ASC";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 45 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_RANGER_ADDON_V4(ITAR_RANGER_ADDON_A)
{
	name = "Кованый доспех 'Кольца Воды'";
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_value[2] = 55;
	weight = 2;
	value = protection[PROT_MAGIC];
	visual_change = "HUM_HUNH_V2_ARMOR.ASC";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 55 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_RANGER_ADDON_V5(ITAR_RANGER_ADDON_A)
{
	name = "Кованый доспех 'Кольца Воды'";
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_value[2] = 70;
	weight = 2;
	value = protection[PROT_MAGIC];
	visual_change = "HUM_HUNH_V3_ARMOR.ASC";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 70 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PIR_L_Addon(C_Item)
{
	name = "Легкие доспехи пирата";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_PIR_L_Addon;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_L_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Pir_L_Addon.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_PIR_M_Addon(C_Item)
{
	name = "Доспехи пирата";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	//value = VALUE_ITAR_PIR_M_Addon;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_M_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_PIR_M_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 60 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_PIR_H_Addon(C_Item)
{
	name = "Тяжелые доспехи пирата";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_PIR_H_Addon;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_H_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_PIR_H_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 100 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_PIR_N_Addon(C_Item)
{
	name = "Тяжелые доспехи пирата";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	//value = VALUE_ITAR_PIR_H_Addon;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_H_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_PIR_N_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 100 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ItAr_BDT_M(C_Item)
{
	name = "Легкие доспехи бандита";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = value_itar_bdt_m;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Reb_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "GUILDS_BANDIT.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ItAr_BDT_H(C_Item)
{
	name = "Доспехи бандита";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = value_itar_bdt_h;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Reb_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_RANGERIST.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 80 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_BDT_F(C_Item)
{
	name = "Тяжелые доспехи бандита";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = value_itar_bdt_f;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Reb_M.3ds";
	on_equip = equip_otherarmor;
	//visual_change = "NRDWARIOR.asc";
	visual_change = "ItAr_Reb_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 90 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_BDT_FS(C_Item)
{
	name = "Тяжелые доспехи бандита";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = value_itar_bdt_f;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Reb_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "NRDWARIOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 30 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_BDT_W(C_Item)
{
	name = "Доспехи главаря бандитов";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Reb_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "BUNTOWNIK.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 100 | Требуется выносливости: 250";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_BDT_V(C_Item)
{
	name = "Тяжелые доспехи главаря бандитов";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_Reb_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "BUNTOWNIK.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 120 | Требуется выносливости: 300";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_BDT_V_DEX(C_Item)
{
	name = "Доспехи Декстера";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 15;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_Reb_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "BUNTOWNIK.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 90 | Требуется выносливости: 350";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_GRD_L(C_Item)
{
	name = "Лeгкие доспехи стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 1800;
	wear = WEAR_TORSO;
	weight = 2;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "grdl.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Hum_GRDL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 70 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_GRD_L_V1(C_Item)
{
	name = "Легкие кованые доспехи стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 2000;
	wear = WEAR_TORSO;
	visual = "grdl.3ds";
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	weight = 2;
	on_equip = equip_otherarmor;
	visual_change = "Hum_GRDL_ARMOR.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 75 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_Bloodwyn_Addon(C_Item)
{
	name = "Доспехи стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_Bloodwyn_Addon;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	wear = WEAR_TORSO;
	weight = 2;
	visual = "ItAr_Bloodwyn_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Bloodwyn_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 80 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_BLOODWYN_ADDON_V1(C_Item)
{
	name = "Кованые доспехи стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = value_itar_bloodwyn_addon_v1;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Bloodwyn_ADDO1.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Bloodwyn_ADDO1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 85 | Требуется выносливости: 250";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_Thorus_Addon(C_Item)
{
	name = "Тяжелые доспехи стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FLY] = 10;
	//value = VALUE_ITAR_Thorus_Addon;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 105;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_Thorus_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Thorus_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 105 | Требуется выносливости: 300";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_Bloodwyn_Armor(C_Item)
{
	name = "Доспехи Бладвина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 115;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	wear = WEAR_TORSO;
	weight = 3;
	visual = "ItAr_Thorus_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Thorus_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 75 | Требуется выносливости: 300";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_THORUS_ADDON_V1(C_Item)
{
	name = "Тяжелые кованые доспехи стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FLY] = 20;
	//value = value_itar_thorus_addon_v1;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_Thorus_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Thorus_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 110 | Требуется выносливости: 350";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ITAR_OreBaron_Addon(C_Item)
{
	name = "Доспехи рудного барона";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 105;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 20;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_CHAOS_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_CHAOS_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 130 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_GOMEZ_ADDON(C_Item)
{
	name = "Доспехи Гомеза";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ITAR_CHAOS_ADDO1.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_CHAOS_ADDO1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 110 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_GOMEZ_ADDOZ(C_Item)
{
	name = "Доспехи рудного барона";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ITAR_CHAOS_ADDOZ.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_CHAOS_ADDOZ.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 110 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_MALBAR(C_Item)
{
	name = "Доспехи рудного барона";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ITAR_CHAOS_ADDOZ.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_CHAOS_ADDOZ.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_DJG_Crawler(C_Item)
{
	name = "Доспехи из панцирей ползунов";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_Crawler.3ds";
	visual_change = "Armor_Djg_Crawler.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_DJG_Crawler;
	on_unequip = UnEquip_ITAR_DJG_Crawler;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 75 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

prototype ITAR_MIL_M_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	wear = WEAR_TORSO;
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_MIL_M;
	on_unequip = UnEquip_ITAR_MIL_M;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ItAr_MIL_M(ITAR_MIL_M_A)
{
	name = "Тяжелые доспехи ополчения";
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	weight = 2;
	value = protection[PROT_MAGIC];
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd1.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 80 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_MIL_M_V1(ITAR_MIL_M_A)
{
	name = "Тяжелые кованые доспехи ополчения";
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	weight = 2;
	cond_value[2] = 90;
	value = protection[PROT_MAGIC];
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd2.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 90 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_MIL_M_V12(ITAR_MIL_M_A)
{
	name = "Тяжелые кованые доспехи ополчения";
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	weight = 3;
	cond_value[2] = 100;
	value = protection[PROT_MAGIC];
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd3.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 100 | Требуется выносливости: 250";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_MIL_M_V13(ITAR_MIL_M_A)
{
	name = "Тяжелые кованые доспехи ополчения";
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	cond_value[2] = 110;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd4.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 110 | Требуется выносливости: 250";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_MIL_M_V14(ITAR_MIL_M_A)
{
	name = "Тяжелые кованые доспехи ополчения";
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	cond_value[2] = 120;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd5.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 120 | Требуется выносливости: 250";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_MIL_M_V15(ITAR_MIL_M_A)
{
	name = "Тяжелые кованые доспехи ополчения";
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 115;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	cond_value[2] = 130;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd6.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 130 | Требуется выносливости: 300";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_MIL_WULFGAR(ITAR_MIL_M_A)
{
	name = "Доспехи капитана ополчения";
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_value[2] = 130;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd7.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 130 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_L_NPC(C_Item)
{
	name = "Доспех оруженосца";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	value = protection[PROT_MAGIC];
	weight = 4;
	wear = WEAR_TORSO;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 110;
	visual = "ItAr_Pal_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "czerwonakurtamax.ASC";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 110 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_L(C_Item)
{
	name = "Доспех оруженосца";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 20;
	value = protection[PROT_MAGIC];
	weight = 4;
	wear = WEAR_TORSO;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	visual = "ItAr_Pal_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "czerwonakurtamaz.ASC";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 130 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

prototype ITAR_SLD_H_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	wear = WEAR_TORSO;
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_SLD_H;
	on_unequip = UnEquip_ITAR_SLD_H;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ItAr_Sld_H(ITAR_SLD_H_A)
{
	name = "Тяжелые доспехи наемника";
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Sld_H.3ds";
	visual_change = "Armor_Sld_H.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 100 | Требуется выносливости: 300";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SLD_H_V1(ITAR_SLD_H_A)
{
	name = "Тяжелые кованые доспехи наемника";
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 30;
	cond_value[2] = 105;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Sld_H_V1.3ds";
	visual_change = "Armor_Sld_D.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 105 | Требуется выносливости: 300";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SLD_H_V2(ITAR_SLD_H_A)
{
	name = "Тяжелые кованые доспехи наемника";
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 105;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_value[2] = 115;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Sld_H_V1.3ds";
	visual_change = "Armor_Sld_D.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 115 | Требуется выносливости: 350";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SLD_H_V3(ITAR_SLD_H_A)
{
	name = "Тяжелые кованые доспехи наемника";
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_value[2] = 120;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Sld_H_V1.3ds";
	visual_change = "Armor_Sld_D.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 120 | Требуется выносливости: 350";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SLD_H_V4(ITAR_SLD_H_A)
{
	name = "Тяжелые кованые доспехи наемника";
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_value[2] = 130;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Sld_H_V1.3ds";
	visual_change = "Armor_Sld_D.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 130 | Требуется выносливости: 350";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SLD_H_V5(ITAR_SLD_H_A)
{
	name = "Тяжелые кованые доспехи наемника";
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 125;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_value[2] = 140;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Sld_H_V1.3ds";
	visual_change = "ARMOR_LHBO_ADDON.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 140 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SLD_H_LEE(ITAR_SLD_H_A)
{
	name = "Тяжелые кованые доспехи наемника";
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 45;
	cond_value[2] = 135;
	weight = 3;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Sld_H_V1.3ds";
	visual_change = "ARMOR_LHBO_ADDON.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 135 | Требуется выносливости: 450";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};


prototype ITAR_PAL_M_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	wear = WEAR_TORSO;
	on_equip = equip_otherarmor;
	visual_skin = 0;
	material = MAT_METAL;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ItAr_PAL_M(ITAR_PAL_M_A)
{
	name = "Доспехи рыцаря";
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 125;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_M.3ds";
	visual_change = "Armor_Pal_V.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 150 | Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_PAL_M_NPC(ITAR_PAL_M_A)
{
	name = "Доспехи рыцаря";
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 125;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	weight = 4;
	//value = value_itar_pal_m;
	visual = "ItAr_Pal_M.3ds";
	visual_change = "Armor_Pal_M.asc";
	description = name;
	inv_animate = 0;
};

instance ITAR_PAL_M_V1(ITAR_PAL_M_A)
{
	name = "Кованые доспехи рыцаря";
	protection[PROT_EDGE] = 125;
	protection[PROT_BLUNT] = 135;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_value[2] = 155;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_M_V1.3ds";
	visual_change = "Armor_Pal_1.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 155 | Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_M_V1_NPC(ITAR_PAL_M_A)
{
	name = "Кованые доспехи рыцаря";
	protection[PROT_EDGE] = 125;
	protection[PROT_BLUNT] = 135;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_value[2] = 160;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_M_V1.3ds";
	visual_change = "Armor_Pal_A.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 160 | Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_M_V12(ITAR_PAL_M_A)
{
	name = "Кованые доспехи рыцаря";
	protection[PROT_EDGE] = 130;
	protection[PROT_BLUNT] = 140;
	protection[PROT_POINT] = 135;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 55;
	cond_value[2] = 170;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_M_V1.3ds";
	visual_change = "Armor_Pal_1.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 170 | Требуется выносливости: 550";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_M_V13(ITAR_PAL_M_A)
{
	name = "Кованые доспехи рыцаря";
	protection[PROT_EDGE] = 135;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 25;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 55;
	cond_value[2] = 180;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_M_V1.3ds";
	visual_change = "Armor_Pal_1.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 180 | Требуется выносливости: 550";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_M_V14(ITAR_PAL_M_A)
{
	name = "Кованые доспехи рыцаря";
	protection[PROT_EDGE] = 140;
	protection[PROT_BLUNT] = 155;
	protection[PROT_POINT] = 145;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 25;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 55;
	cond_value[2] = 190;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_M_V1.3ds";
	visual_change = "Armor_Pal_1.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 190 | Требуется выносливости: 550";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_M_V15(ITAR_PAL_M_A)
{
	name = "Рудные доспехи рыцаря";
	protection[PROT_EDGE] = 145;
	protection[PROT_BLUNT] = 160;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 60;
	cond_value[2] = 200;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_M_V1.3ds";
	visual_change = "Armor_Pal_1.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 200 | Требуется выносливости: 600";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_M_V2(C_Item)
{
	name = "Освященные рудные доспехи рыцаря";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 170;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 40;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	on_equip = equip_itar_pal_m_v2;
	on_unequip = unequip_itar_pal_m_v2;
	wear = WEAR_TORSO;
	weight = 5;
	visual = "ItAr_Pal_M_V2.3ds";
	visual_change = "Armor_Pal_2.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 200 | Требуется выносливости: 600";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};


prototype ITAR_PAL_H_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 210;
	wear = WEAR_TORSO;
	on_equip = equip_otherarmor;
	visual_skin = 0;
	material = MAT_METAL;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ItAr_PAl_H(ITAR_PAL_H_A)
{
	name = "Доспехи паладина";
	protection[PROT_EDGE] = 160;
	protection[PROT_BLUNT] = 180;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	weight = 5;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_H.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 210 | Требуется выносливости: 650";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_PAl_H_NPC(ITAR_PAL_H_A)
{
	name = "Доспехи паладина";
	protection[PROT_EDGE] = 160;
	protection[PROT_BLUNT] = 180;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 160;
	weight = 5;
	//value = value_itar_pal_h;
	visual = "ItAr_Pal_H.3ds";
	//visual_change = "Armor_Pal_N.asc";
	visual_change = "Armor_Pal_H.asc";
	description = name;
	inv_animate = 0;
};

instance ITAR_PAL_H_V1(ITAR_PAL_H_A)
{
	name = "Кованые доспехи паладина";
	protection[PROT_EDGE] = 165;
	protection[PROT_BLUNT] = 185;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	cond_value[2] = 220;
	weight = 5;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_H_V1.3ds";
	visual_change = "Armor_Pal_T.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 220 | Требуется выносливости: 650";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_H_V1_NPC(ITAR_PAL_H_A)
{
	name = "Доспехи паладина";
	protection[PROT_EDGE] = 165;
	protection[PROT_BLUNT] = 185;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	weight = 5;
	cond_value[2] = 170;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_H_V1.3ds";
	//visual_change = "Armor_Pal_R.asc";
	visual_change = "Armor_Pal_T.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 170 | Требуется выносливости: 650";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_H_V12(ITAR_PAL_H_A)
{
	name = "Кованые доспехи паладина";
	protection[PROT_EDGE] = 170;
	protection[PROT_BLUNT] = 195;
	protection[PROT_POINT] = 185;
	protection[PROT_FIRE] = 55;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 70;
	cond_value[2] = 230;
	weight = 5;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_H_V1.3ds";
	visual_change = "Armor_Pal_T.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 230 | Требуется выносливости: 700";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_H_V13(ITAR_PAL_H_A)
{
	name = "Кованые доспехи паладина";
	protection[PROT_EDGE] = 175;
	protection[PROT_BLUNT] = 200;
	protection[PROT_POINT] = 190;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 45;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 70;
	cond_value[2] = 240;
	weight = 6;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_H_V1.3ds";
	visual_change = "Armor_Pal_T.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 240 | Требуется выносливости: 700";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_H_V14(ITAR_PAL_H_A)
{
	name = "Кованые доспехи паладина";
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 205;
	protection[PROT_POINT] = 195;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 70;
	cond_value[2] = 250;
	weight = 6;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_H_V1.3ds";
	visual_change = "Armor_Pal_T.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 250 | Требуется выносливости: 700";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_H_V15(ITAR_PAL_H_A)
{
	name = "Рудные доспехи паладина";
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 210;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 75;
	cond_value[2] = 270;
	weight = 6;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Pal_H_V1.3ds";
	visual_change = "Armor_Pal_T.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 270 | Требуется выносливости: 750";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_H_V2(C_Item)
{
	name = "Освященные рудные доспехи паладина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 210;
	protection[PROT_BLUNT] = 230;
	protection[PROT_POINT] = 215;
	protection[PROT_FIRE] = 80;
	protection[PROT_MAGIC] = 60;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 75;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 280;
	weight = 6;
	on_equip = equip_itar_pal_h_v2;
	on_unequip = unequip_itar_pal_h_v2;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H_V2.3ds";
	visual_change = "Armor_Pal_Q.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 280 | Требуется выносливости: 750";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_H_V2_NPC(C_Item)
{
	name = "Освященные рудные доспехи паладина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 210;
	protection[PROT_BLUNT] = 230;
	protection[PROT_POINT] = 215;
	protection[PROT_FIRE] = 80;
	protection[PROT_MAGIC] = 60;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 75;
	weight = 6;
	//value = value_itar_pal_h_v2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 160;
	on_equip = equip_itar_pal_h_v2;
	on_unequip = unequip_itar_pal_h_v2;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H_V2.3ds";
	//visual_change = "Armor_Pal_E.asc";
	visual_change = "Armor_Pal_Q.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_PAL_H_V2_VENZEL(C_Item)
{
	name = "Доспехи паладина Венцеля";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 80;
	protection[PROT_MAGIC] = 60;
	protection[PROT_FLY] = 60;
	weight = 6;
	//value = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 160;
	on_equip = equip_itar_pal_venzel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H_V2.3ds";
	//visual_change = "Armor_Pal_E.asc";
	visual_change = "Armor_Pal_Q.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

prototype ITAR_DJG_L_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 130;
	wear = WEAR_TORSO;
	on_equip = Equip_ITAR_DJG_L;
	on_unequip = UnEquip_ITAR_DJG_L;
	visual_skin = 0;
	material = MAT_LEATHER;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_DJG_L(ITAR_DJG_L_A)
{
	name = "Легкие доспехи драконоборца";
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 45;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_S.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 130 | Требуется выносливости: 450";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_L_V1(ITAR_DJG_L_A)
{
	name = "Легкие кованые доспехи драконоборца";
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 135;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 45;
	cond_value[2] = 140;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_L.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 140 | Требуется выносливости: 450";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_L_V2(ITAR_DJG_L_A)
{
	name = "Легкие кованые доспехи драконоборца";
	protection[PROT_EDGE] = 125;
	protection[PROT_BLUNT] = 140;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_value[2] = 150;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_L.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 150 | Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_L_V3(ITAR_DJG_L_A)
{
	name = "Легкие кованые доспехи драконоборца";
	protection[PROT_EDGE] = 130;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_value[2] = 160;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_L.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 160 | Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_L_V4(ITAR_DJG_L_A)
{
	name = "Легкие кованые доспехи драконоборца";
	protection[PROT_EDGE] = 135;
	protection[PROT_BLUNT] = 155;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_value[2] = 170;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_L.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 170 | Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_L_V5(ITAR_DJG_L_A)
{
	name = "Легкие кованые доспехи драконоборца";
	protection[PROT_EDGE] = 140;
	protection[PROT_BLUNT] = 160;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 55;
	cond_value[2] = 180;
	weight = 4;
	value = protection[PROT_MAGIC];
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_L.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 180 | Требуется выносливости: 550";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};


prototype ITAR_DJG_M_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 170;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_M.3ds";
	on_equip = Equip_ITAR_DJG_L;
	on_unequip = UnEquip_ITAR_DJG_L;
	visual_skin = 0;
	material = MAT_LEATHER;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_DJG_M(ITAR_DJG_M_A)
{
	name = "Доспехи драконоборца";
	protection[PROT_EDGE] = 145;
	protection[PROT_BLUNT] = 165;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 60;
	weight = 5;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_M.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 170 | Требуется выносливости: 600";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_M_NPC(ITAR_DJG_M_A)
{
	name = "Доспехи драконоборца";
	protection[PROT_EDGE] = 145;
	protection[PROT_BLUNT] = 165;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 60;
	cond_value[2] = 130;
	weight = 5;
	//value = value_itar_djg_m;
	visual_change = "Armor_Djg_N.asc";
	description = name;
	inv_animate = 0;
};

instance ITAR_DJG_M_V1(ITAR_DJG_M_A)
{
	name = "Кованые доспехи драконоборца";
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 170;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 60;
	cond_value[2] = 190;
	weight = 5;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_D.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 190 | Требуется выносливости: 600";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_M_V2(ITAR_DJG_M_A)
{
	name = "Кованые доспехи драконоборца";
	protection[PROT_EDGE] = 155;
	protection[PROT_BLUNT] = 175;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 25;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	cond_value[2] = 200;
	weight = 5;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_D.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 200 | Требуется выносливости: 650";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_M_V3(ITAR_DJG_M_A)
{
	name = "Кованые доспехи драконоборца";
	protection[PROT_EDGE] = 160;
	protection[PROT_BLUNT] = 180;
	protection[PROT_POINT] = 125;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 25;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	cond_value[2] = 210;
	weight = 5;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_D.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 210 | Требуется выносливости: 650";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_M_V4(ITAR_DJG_M_A)
{
	name = "Кованые доспехи драконоборца";
	protection[PROT_EDGE] = 165;
	protection[PROT_BLUNT] = 185;
	protection[PROT_POINT] = 125;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 30;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	cond_value[2] = 215;
	weight = 5;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_D.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 215 | Требуется выносливости: 650";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_M_V5(ITAR_DJG_M_A)
{
	name = "Кованые доспехи драконоборца";
	protection[PROT_EDGE] = 170;
	protection[PROT_BLUNT] = 190;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 30;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 70;
	cond_value[2] = 225;
	weight = 6;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_D.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 225 | Требуется выносливости: 700";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_Dargonscale(C_Item)
{
	name = "Доспех из драконьей чешуи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 200;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 75;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 250;
	value = protection[PROT_MAGIC];
	weight = 5;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3ds";
	visual_change = "ARMOR_SCALEDRAGON_01.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_DJG_L;
	on_unequip = UnEquip_ITAR_DJG_L;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 250 | Требуется выносливости: 750";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

prototype ITAR_DJG_H_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 240;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_H.3ds";
	on_equip = Equip_ITAR_DJG_L;
	on_unequip = UnEquip_ITAR_DJG_L;
	visual_skin = 0;
	material = MAT_LEATHER;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_DJG_H(ITAR_DJG_H_A)
{
	name = "Тяжелые доспехи драконоборца";
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 210;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 80;
	weight = 6;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_H.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 240 | Требуется выносливости: 800";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_H_NPC(ITAR_DJG_H_A)
{
	name = "Тяжелые доспехи драконоборца";
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 210;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 80;
	cond_value[2] = 180;
	weight = 6;
	//value = value_itar_djg_h;
	visual_change = "Armor_Djg_I.asc";
	description = name;
	inv_animate = 0;
};

instance ITAR_DJG_H_V1(ITAR_DJG_H_A)
{
	name = "Тяжелые кованые доспехи драконоборца";
	protection[PROT_EDGE] = 195;
	protection[PROT_BLUNT] = 215;
	protection[PROT_POINT] = 145;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 45;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 80;
	cond_value[2] = 250;
	weight = 6;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_F.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 250 | Требуется выносливости: 800";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_H_V2(ITAR_DJG_H_A)
{
	name = "Тяжелые кованые доспехи драконоборца";
	protection[PROT_EDGE] = 200;
	protection[PROT_BLUNT] = 220;
	protection[PROT_POINT] = 155;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 45;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 85;
	cond_value[2] = 270;
	weight = 6;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_F.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 270 | Требуется выносливости: 850";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_H_V3(ITAR_DJG_H_A)
{
	name = "Тяжелые кованые доспехи драконоборца";
	protection[PROT_EDGE] = 210;
	protection[PROT_BLUNT] = 225;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 45;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 85;
	cond_value[2] = 280;
	weight = 6;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_F.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 280 | Требуется выносливости: 850";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_H_V4(ITAR_DJG_H_A)
{
	name = "Тяжелые кованые доспехи драконоборца";
	protection[PROT_EDGE] = 220;
	protection[PROT_BLUNT] = 240;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 85;
	cond_value[2] = 290;
	weight = 6;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_F.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 290 | Требуется выносливости: 850";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DJG_H_V5(ITAR_DJG_H_A)
{
	name = "Тяжелые кованые доспехи драконоборца";
	protection[PROT_EDGE] = 230;
	protection[PROT_BLUNT] = 245;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 90;
	cond_value[2] = 300;
	weight = 7;
	value = protection[PROT_MAGIC];
	visual_change = "Armor_Djg_F.asc";
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 300 | Требуется выносливости: 900";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_SHVWarrior(C_Item)
{
	name = "Доспехи Вершителя";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 210;
	protection[PROT_BLUNT] = 190;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 80;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 80;
	value = protection[PROT_MAGIC];
	weight = 8;
	wear = WEAR_TORSO;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 400;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "SKYRIMNORDPLYTOWA.asc";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_otherarmor;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 400 | Требуется выносливости: 800";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_DragonKiller(C_Item)
{
	name = "Доспехи убийцы драконов";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 265;
	protection[PROT_POINT] = 210;
	protection[PROT_FIRE] = 90;
	protection[PROT_MAGIC] = 60;
	protection[PROT_FLY] = 70;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 95;
	value = protection[PROT_MAGIC];
	weight = 8;
	wear = WEAR_TORSO;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 500;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "DRAGONBONEARMOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_otherarmor;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 500 | Требуется выносливости: 950";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

prototype ITAR_TPL_L_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	wear = WEAR_TORSO;
	visual = "ItAr_TPL_M.3ds";
	on_equip = Equip_ITAR_TPL_L;
	on_unequip = UnEquip_ITAR_TPL_L;
	visual_change = "HUM_TPLM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_TPL_LST(ITAR_TPL_L_A)
{
	name = "Боевой кильт Стража Братства";
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	weight = 2;
	visual = "ItAr_TPL_L.3ds";
	on_equip = Equip_ITAR_TPL_L;
	on_unequip = UnEquip_ITAR_TPL_L;
	visual_change = "HUM_TPLL_ARMOR.asc";
	value = protection[PROT_MAGIC];
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_L(ITAR_TPL_L_A)
{
	name = "Легкие доспехи Стража Братства";
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	weight = 2;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 45 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_L_V1(ITAR_TPL_L_A)
{
	name = "Легкие кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	weight = 3;
	cond_value[2] = 50;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 50 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_L_V2(ITAR_TPL_L_A)
{
	name = "Легкие кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	weight = 3;
	cond_value[2] = 55;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 55 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_L_V3(ITAR_TPL_L_A)
{
	name = "Легкие кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_value[2] = 60;
	weight = 3;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 60 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_L_V4(ITAR_TPL_L_A)
{
	name = "Легкие кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_value[2] = 65;
	weight = 3;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 65 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_L_V5(ITAR_TPL_L_A)
{
	name = "Легкие кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	cond_value[2] = 75;
	weight = 3;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 75 | Требуется выносливости: 250";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};


prototype ITAR_TPL_M_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 45;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	wear = WEAR_TORSO;
	visual = "ItAr_TPL_S.3ds";
	on_equip = Equip_ITAR_TPL_L;
	on_unequip = UnEquip_ITAR_TPL_L;
	visual_change = "HUM_TPLS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_TPL_M(ITAR_TPL_M_A)
{
	name = "Доспехи Стража Братства";
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 30;
	protection[PROT_FLY] = 30;
	weight = 4;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_value[2] = 120;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 120 | Требуется выносливости: 350";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_M_V1(ITAR_TPL_M_A)
{
	name = "Кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 115;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 30;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	weight = 4;
	cond_value[2] = 130;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 130 | Требуется выносливости: 350";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_M_V2(ITAR_TPL_M_A)
{
	name = "Кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 30;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_value[2] = 140;
	weight = 4;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 140 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_M_V3(ITAR_TPL_M_A)
{
	name = "Кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 125;
	protection[PROT_BLUNT] = 105;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 35;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_value[2] = 150;
	weight = 4;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 150 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_M_V4(ITAR_TPL_M_A)
{
	name = "Кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 130;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 55;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_value[2] = 160;
	weight = 4;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 160 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_M_V5(ITAR_TPL_M_A)
{
	name = "Кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 140;
	protection[PROT_BLUNT] = 115;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 45;
	cond_value[2] = 180;
	weight = 4;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 180 | Требуется выносливости: 450";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

prototype ITAR_TPL_S_A(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 160;
	wear = WEAR_TORSO;
	visual = "ItAr_CorAngar.3ds";
	on_equip = Equip_ITAR_TPL_L;
	on_unequip = UnEquip_ITAR_TPL_L;
	visual_change = "Armor_CorAngar_1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	//text[0] = NAME_Str_needed;
	//count[0] = cond_value[2];
	inv_animate = 0;
};

instance ITAR_TPL_S(ITAR_TPL_S_A)
{
	name = "Тяжелые доспехи Стража Братства";
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 140;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	value = protection[PROT_MAGIC];
	weight = 5;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 160 | Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_S_V1(ITAR_TPL_S_A)
{
	name = "Тяжелые кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 160;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_value[2] = 170;
	weight = 5;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 170 | Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_S_V2(ITAR_TPL_S_A)
{
	name = "Тяжелые кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 170;
	protection[PROT_BLUNT] = 160;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 65;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 55;
	cond_value[2] = 180;
	weight = 5;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 180 | Требуется выносливости: 550";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_S_V3(ITAR_TPL_S_A)
{
	name = "Тяжелые кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 170;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 60;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 55;
	cond_value[2] = 190;
	weight = 6;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 190 | Требуется выносливости: 550";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_S_V4(ITAR_TPL_S_A)
{
	name = "Тяжелые кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 180;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 65;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 55;
	cond_value[2] = 200;
	weight = 6;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 200 | Требуется выносливости: 550";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TPL_S_V5(ITAR_TPL_S_A)
{
	name = "Тяжелые кованые доспехи Стража Братства";
	protection[PROT_EDGE] = 200;
	protection[PROT_BLUNT] = 190;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 70;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 60;
	cond_value[2] = 210;
	weight = 6;
	value = protection[PROT_MAGIC];
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 210 | Требуется выносливости: 600";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_TPL_MASTER(C_Item)
{
	name = "Тяжелые доспехи Стража Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 200;
	protection[PROT_BLUNT] = 190;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 70;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	value = protection[PROT_MAGIC];
	weight = 4;
	wear = WEAR_TORSO;
	visual = "ItAr_CorAngar.3ds";
	on_equip = Equip_ITAR_TPL_L;
	on_unequip = UnEquip_ITAR_TPL_L;
	visual_change = "Armor_CorAngar_1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Требуется силы: 225 | Требуется выносливости: 750";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_KDF_H(C_Item)
{
	name = "Роба высшего мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 120;
	protection[PROT_MAGIC] = 60;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 500;
	weight = 2;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_H.3ds";
	visual_change = "Armor_Kdf_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_H;
	on_unequip = UnEquip_ITAR_KDF_H;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_KDF_H_NPC(C_Item)
{
	name = "Роба архимага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 190;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 170;
	protection[PROT_MAGIC] = 130;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 300;
	weight = 3;
	//value = 25000;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_H.3ds";
	visual_change = "Armor_Kdf_Q.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_SH;
	on_unequip = UnEquip_ITAR_KDF_SH;
	description = name;
	inv_animate = 0;
};

instance ITAR_KDF_H_BLESSED(C_Item)
{
	name = "Освященная роба высшего мага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 140;
	protection[PROT_MAGIC] = 90;
	value = protection[PROT_MAGIC];
	weight = 2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 650;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_H.3ds";
	visual_change = "Armor_Kdf_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_H;
	on_unequip = UnEquip_ITAR_KDF_H;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_KDF_SH(C_Item)
{
	name = "Роба архимага Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 170;
	protection[PROT_MAGIC] = 130;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 800;
	value = protection[PROT_MAGIC];
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_H.3ds";
	visual_change = "Armor_Kdf_Q.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_SH;
	on_unequip = UnEquip_ITAR_KDF_SH;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_KDW_H(C_Item)
{
	name = "Роба высшего мага Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 90;
	protection[PROT_MAGIC] = 120;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 500;
	wear = WEAR_TORSO;
	weight = 2;
	visual = "ItAr_KdW_H.3ds";
	on_equip = Equip_ITAR_KDF_H;
	on_unequip = UnEquip_ITAR_KDF_H;
	visual_change = "Armor_KdW_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_KDW_H_NPC(C_Item)
{
	name = "Роба архимага Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 180;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 130;
	protection[PROT_MAGIC] = 160;
	protection[PROT_FLY] = 150;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 300;
	//value = 20000;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_KdW_H.3ds";
	visual_change = "Armor_Kdw_Q.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_otherarmor;
	description = name;
	inv_animate = 0;
};

instance ItAr_KDW_SH(C_Item)
{
	name = "Роба архимага Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 130;
	protection[PROT_MAGIC] = 160;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 800;
	value = protection[PROT_MAGIC];
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_KdW_H.3ds";
	visual_change = "Armor_Kdw_Q.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_SH;
	on_unequip = UnEquip_ITAR_KDF_SH;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_KDW_ADANOS(C_Item)
{
	name = "Роба жреца Аданоса";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 115;
	protection[PROT_MAGIC] = 145;
	value = protection[PROT_MAGIC];
	weight = 3;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 750;
	wear = WEAR_TORSO;
	visual = "ItAr_KdW_H.3ds";
	on_equip = Equip_WaterRobe;
	on_unequip = UnEquip_WaterRobe;
	//visual_change = "Armor_FEU_L.asc";
	visual_change = "PIRANHA_ADANOSROBE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DMT_H(C_Item)
{
	name = "Роба высшего темного мага";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 90;
	protection[PROT_MAGIC] = 100;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	weight = 2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 500;
	on_equip = Equip_ITAR_KDF_H;
	on_unequip = UnEquip_ITAR_KDF_H;
	visual = "ItAr_Xardas.3ds";
	visual_change = "ARMOR_DS_DARKMAG_03.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DMT_H_BELIAR_1(C_Item)
{
	name = "Оскверненная роба высшего темного мага";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 110;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	weight = 2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 650;
	on_equip = Equip_ITAR_KDF_H;
	on_unequip = UnEquip_ITAR_KDF_H;
	visual = "ItAr_Xardas.3ds";
	visual_change = "ARMOR_DS_DARKMAG_02.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DMT_H_NPC(C_Item)
{
	name = "Роба вестника Тьмы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 190;
	protection[PROT_POINT] = 190;
	protection[PROT_FIRE] = 150;
	protection[PROT_MAGIC] = 150;
	protection[PROT_FLY] = 150;
	//value = VALUE_ITAR_DMT_H;
	wear = WEAR_TORSO;
	weight = 3;
	on_equip = equip_otherarmor;
	visual = "ItAr_Xardas.3ds";
	visual_change = "ARMOR_DS_DARKMAG_02.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_DMT_H_BELIAR_3(C_Item)
{
	name = "Роба вестника Тьмы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 120;
	protection[PROT_MAGIC] = 140;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	weight = 2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 750;
	on_equip = Equip_BeliarChosen;
	on_unequip = UnEquip_BeliarChosen;
	visual = "ItAr_Xardas.3ds";
	visual_change = "ARMOR_DS_DARKMAG_02.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_KDM_H_NPC(C_Item)
{
	name = "Роба архимага Тьмы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 120;
	protection[PROT_MAGIC] = 180;
	protection[PROT_FLY] = 150;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 300;
	weight = 3;
	//value = 30000;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Kdm_Q.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_otherarmor;
	description = name;
	inv_animate = 0;
};

instance ItAr_Arahar(C_Item)
{
	name = "Роба Арах'Ара";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 120;
	protection[PROT_MAGIC] = 180;
	protection[PROT_FLY] = 150;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "ARMOR_KDM_MASTER.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_otherarmor;
	description = name;
	inv_animate = 0;
};

instance ItAr_KDM_SH(C_Item)
{
	name = "Роба архимага Тьмы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 115;
	protection[PROT_POINT] = 105;
	protection[PROT_FIRE] = 140;
	protection[PROT_MAGIC] = 150;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 800;
	value = protection[PROT_MAGIC];
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Kdm_Q.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_SH;
	on_unequip = UnEquip_ITAR_KDF_SH;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_GUR_H(C_Item)
{
	name = "Роба высшего гуру Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 120;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 500;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_GUR_H.3ds";
	on_equip = Equip_ITAR_GUR_L;
	on_unequip = UnEquip_ITAR_GUR_L;
	visual_change = "HUM_GURS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ASSASINS_DEMONMAGE(C_Item)
{
	name = "Доспехи гуру-демона";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 120;
	protection[PROT_MAGIC] = 170;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 750;
	weight = 3;
	value = protection[PROT_MAGIC];
	mag_circle = 5;
	wear = WEAR_TORSO;
	visual = "ItAr_GUR_Z.3ds";
	on_equip = Equip_ITAR_GUR_L;
	on_unequip = UnEquip_ITAR_GUR_L;
	visual_change = "HUM_GURZ_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_GUR_TOP(C_Item)
{
	name = "Роба верховного гуру Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 105;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 140;
	protection[PROT_MAGIC] = 200;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 800;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_GUR_H.3ds";
	on_equip = Equip_ITAR_GUR_L;
	on_unequip = UnEquip_ITAR_GUR_L;
	visual_change = "HUM_GURS_ARMOR.asc";
	visual_skin = 2;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_GUR_ORAN(C_Item)
{
	name = "Роба верховного гуру Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 105;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 140;
	protection[PROT_MAGIC] = 200;
	value = protection[PROT_MAGIC];
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_GUR_H.3ds";
	on_equip = Equip_ITAR_GUR_L;
	on_unequip = UnEquip_ITAR_GUR_L;
	visual_change = "HUM_GURS_ARMOR.asc";
	visual_skin = 2;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_GRD_I(C_Item)
{
	name = "Доспехи королевского пристава";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	weight = 2;
	wear = WEAR_TORSO;
	on_equip = equip_otherarmor;
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 70 | Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_Ancient(C_Item)
{
	name = "Доспехи древних";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	weight = 4;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Ranger_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_ARMOR_AW_01.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_DHT_M(C_Item)
{
	name = "Доспехи Темного Стража";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 40;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 20;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_M.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_GRDI_ARMOR.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 90 | Требуется выносливости: 200";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_PAL_SKEL_D(C_Item)
{
	name = "Доспехи рыцаря Смерти";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 200;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 120;
	protection[PROT_MAGIC] = 95;
	protection[PROT_FLY] = 100;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M_V4.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Pal_D.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_PAL_SKEL_U(C_Item)
{
	name = "Доспехи Лорда Смерти";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 170;
	protection[PROT_MAGIC] = 135;
	protection[PROT_FLY] = 150;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H_V8.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Pal_U.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_PAL_SKEL_VH(C_Item)
{
	name = "Доспехи Лорда Теней";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 250;
	protection[PROT_MAGIC] = 250;
	protection[PROT_FLY] = 250;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H_V8.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Pal_SkelLord.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_Raven_Demon(C_Item)
{
	name = "Доспехи Ворона";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 180;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	//value = VALUE_ITAR_NONE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	on_equip = equip_itar_guardian;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "Armor_MayaZombie_Raven.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_Dementor(C_Item)
{
	name = "Роба Ищущего";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 250;
	protection[PROT_MAGIC] = 250;
	protection[PROT_FLY] = 150;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Dementor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_OBERDEMENTOR(C_Item)
{
	name = "Роба Дементора";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 350;
	protection[PROT_FIRE] = 299;
	protection[PROT_MAGIC] = 299;
	protection[PROT_FLY] = 299;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ITAR_DEMENTOR_MASTER.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_HARADRIMMAGE(C_Item)
{
	name = "Роба адепта Хранителей";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 90;
	value = protection[PROT_MAGIC];
	weight = 2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 350;
	wear = WEAR_TORSO;
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	visual = "ITAR_KDMS.3ds";
	visual_change = "HUM_KDMS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_Xardas(C_Item)
{
	name = "Роба Архимага";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 160;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 190;
	protection[PROT_MAGIC] = 180;
	protection[PROT_FLY] = 299;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	weight = 3;
	visual = "ItAr_Xardas.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_DS_DARKMAG_02.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_NOV_PEDRO(C_Item)
{
	name = "Роба послушника Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 5;
	//value = VALUE_ITAR_NOV_L;
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Nov_L.3ds";
	visual_change = "Armor_Nov_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_NOV_L;
	on_unequip = UnEquip_ITAR_NOV_L;
	description = name;
	inv_animate = 0;
};

instance ITAR_CorAngar(C_Item)
{
	name = "Доспехи Кор-Ангара";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 190;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 80;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FLY] = 50;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	weight = 6;
	visual = "ItAr_CorAngar.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_CorAngar_1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_Lester(C_Item)
{
	name = "Роба Лестера";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 105;
	protection[PROT_BLUNT] = 105;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 50;
	weight = 3;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Lester.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Lester.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_Diego(C_Item)
{
	name = "Кольчуга призрака";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 25;
	//value = VALUE_ITAR_NONE;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Diego.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Diego.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_RAVENARMOR_ADDON(C_Item)
{
	name = "Доспехи Ворона";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 140;
	protection[PROT_BLUNT] = 140;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 60;
	protection[PROT_FLY] = 150;
	weight = 4;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Raven_ADDO2.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_MayaZombie_Addos.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_GREG(C_Item)
{
	name = "Доспехи Грэга";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FLY] = 20;
	weight = 4;
	//value = VALUE_ITAR_NONE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_H_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_PIR_N_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_GUARDIAN(C_Item)
{
	name = "Роба хранителя Тьмы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 220;
	protection[PROT_FIRE] = 80;
	protection[PROT_MAGIC] = 150;
	protection[PROT_FLY] = 150;
	weight = 4;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Guard_05.3ds";
	on_equip = equip_itar_guardian;
	visual_change = "ARMOR_KDM_MASTER.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_FIREGUARDIAN(C_Item)
{
	name = "Роба хранителя Огня";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 150;
	protection[PROT_MAGIC] = 80;
	protection[PROT_FLY] = 150;
	weight = 4;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Guard_02.3ds";
	on_equip = equip_itar_fireguardian;
	visual_change = "ARMOR_KDF_MASTER.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_WATERGUARDIAN(C_Item)
{
	name = "Роба хранителя Воды";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 120;
	protection[PROT_MAGIC] = 120;
	protection[PROT_FLY] = 150;
	weight = 4;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Guard_03.3ds";
	on_equip = equip_itar_waterguardian;
	visual_change = "ARMOR_KDW_MASTER.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_STONEGUARDIAN(C_Item)
{
	name = "Роба хранителя Скалы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 300;
	protection[PROT_BLUNT] = 300;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 90;
	protection[PROT_MAGIC] = 90;
	protection[PROT_FLY] = 150;
	weight = 4;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Guard_04.3ds";
	on_equip = equip_itar_stoneguardian;
	visual_change = "ARMOR_STN_MASTER.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ItAr_OldOreArmor(C_Item)
{
	name = "Рудные доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	//value = 100;
	wear = WEAR_TORSO;
	visual = "magie.3ds";
	visual_change = "HUM_MAGIE_ARMOR.asc";
	visual_skin = 0;
	on_unequip = Unequip_ItAr_OldOreArmor;
	material = MAT_WOOD;
	description = name;
	inv_animate = 0;
};

instance ITAR_OREARMOR(C_Item)
{
	name = "Рудные доспехи Света";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 100;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 85;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 500;
	weight = 8;
	on_equip = equip_itar_stoneguardian;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ARMOR_WARRIOR_LIGHT.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 500 | Требуется выносливости: 850";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ILARAH(C_Item)
{
	name = "Доспехи Хаоса";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 450;
	protection[PROT_BLUNT] = 450;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 400;
	value = protection[PROT_MAGIC];
	weight = 8;
	on_equip = equip_itar_stoneguardian;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "Armor_Ilarah.ASC";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_Raven_Addon(C_Item)
{
	name = "Рудные доспехи Тьмы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 180;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FLY] = 50;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 60;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 500;
	weight = 6;
	on_equip = equip_itar_guardian_dex;
	on_unequip = unequip_itar_guardian_dex;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ARMOR_WARRIOR_DARK.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется ловкости: 500| Требуется выносливости: 600";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_OREARMOR_NPC(C_Item)
{
	name = "Рудные доспехи Света";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 230;
	protection[PROT_BLUNT] = 230;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	//value = VALUE_ITAR_NONE;
	weight = 8;
	on_equip = equip_itar_stoneguardian;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ARMOR_WARRIOR_LIGHT.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	inv_animate = 0;
};

instance ITAR_Raven_Addon_NPC(C_Item)
{
	name = "Рудные доспехи Тьмы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 90;
	//value = VALUE_ITAR_NONE;
	weight = 8;
	on_equip = equip_itar_guardian;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ARMOR_WARRIOR_DARK.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_Raven_Addon_NPC_NE(C_Item)
{
	name = "Рудные доспехи Тьмы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 90;
	//value = VALUE_ITAR_NONE;
	weight = 8;
	on_equip = equip_itar_guardian;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ARMOR_WARRIOR_DARK.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_Raven_Addon_TAR(C_Item)
{
	name = "Рудные доспехи Тьмы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 90;
	//value = VALUE_ITAR_NONE;
	weight = 5;
	on_equip = equip_itar_guardian;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ARMOR_WARRIOR_DARK.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_Egezart(C_Item)
{
	name = "Доспех Эгезарт";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 90;
	//value = VALUE_ITAR_NONE;
	on_equip = equip_itar_guardian;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ARMOR_WARRIOR_DARK.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_PAL_SKEL(C_Item)
{
	name = "Доспехи призрачного война";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 130;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 170;
	protection[PROT_MAGIC] = 170;
	protection[PROT_FLY] = 200;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H_V5.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	on_equip = equip_otherarmor;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_PAL_SKEL_K(C_Item)
{
	name = "Доспехи обращенного рыцаря";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 180;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 180;
	protection[PROT_MAGIC] = 180;
	protection[PROT_FLY] = 200;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M_V3.3ds";
	visual_change = "Armor_Pal_K.asc";
	visual_skin = 0;
	on_equip = equip_otherarmor;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_MayaZombie_Addon(C_Item)
{
	name = "Древние доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 140;
	protection[PROT_MAGIC] = 140;
	protection[PROT_FLY] = 100;
	weight = 5;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Raven_ADDO2.3ds";
	visual_change = "Armor_MayaZombie_Addon.asc";
	visual_skin = 0;
	on_equip = equip_otherarmor;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_PAL_SKEL_P(C_Item)
{
	name = "Доспехи обращенного паладина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 245;
	protection[PROT_MAGIC] = 250;
	protection[PROT_FLY] = 250;
	weight = 5;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H_V7.3ds";
	visual_change = "Armor_Pal_P.asc";
	visual_skin = 0;
	on_equip = equip_otherarmor;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_SKEL_WAR(C_Item)
{
	name = "Доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	//value = VALUE_ITAR_NONE;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FLY] = 50;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ITAR_SKEL_WAR.asc";
	visual_skin = 0;
	on_equip = equip_otherarmor;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_SKEL_DAR(C_Item)
{
	name = "Демонические доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	//value = VALUE_ITAR_NONE;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 100;
	protection[PROT_FLY] = 100;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ITAR_SKEL_DAR.asc";
	visual_skin = 0;
	on_equip = equip_otherarmor;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_WEMON_ADDON(C_Item)
{
	name = "Доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 150;
	protection[PROT_MAGIC] = 150;
	protection[PROT_FLY] = 150;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "Armor_Skel_Wark.asc";
	visual_skin = 0;
	on_equip = equip_otherarmor;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_DEMON_ADDON(C_Item)
{
	name = "Демонические доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 250;
	protection[PROT_BLUNT] = 250;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 250;
	protection[PROT_MAGIC] = 250;
	protection[PROT_FLY] = 250;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "Armor_Skel_Dark.asc";
	visual_skin = 0;
	on_equip = equip_otherarmor;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_ASSASINS_01(C_Item)
{
	name = "Тяжелые доспехи тени Масиаф";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 50;
	value = protection[PROT_MAGIC];
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "DB_Adept_Ar.3ds";
	on_equip = equip_otherarmor_ass;
	on_unequip = UnEquip_otherarmor_ass;
	visual_change = "DB_Pri_Armor_M.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 150 | Требуется выносливости: 400";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ASSASINS_02(C_Item)
{
	name = "Доспехи приора Масиаф";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 165;
	protection[PROT_BLUNT] = 145;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 45;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 170;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "DB_Prior_Armor.3ds";
	on_equip = equip_otherarmor_ass;
	on_unequip = UnEquip_otherarmor_ass;
	visual_change = "ARMOR_PRIOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 170 | Требуется выносливости: 450";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ASSASINS_02_NPC(C_Item)
{
	name = "Доспехи приора Масиаф";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 180;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 230;
	protection[PROT_MAGIC] = 230;
	protection[PROT_FLY] = 250;
	weight = 3;
	//value = 5000;
	wear = WEAR_TORSO;
	visual = "DB_Prior_Armor.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_PRIOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_ASSASINS_DEAD(C_Item)
{
	name = "Доспехи приора Масиаф";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 170;
	protection[PROT_BLUNT] = 170;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 170;
	protection[PROT_MAGIC] = 170;
	protection[PROT_FLY] = 230;
	//value = 100;
	wear = WEAR_TORSO;
	visual = "DB_Prior_Armor.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_PDEAD.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_ASSASINS_03(C_Item)
{
	name = "Доспехи послушника Масиаф";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	//value = 1000;
	weight = 1;
	wear = WEAR_TORSO;
	visual = "DB_Adept_Ar.3ds";
	on_equip = equip_otherarmor_ass;
	on_unequip = UnEquip_otherarmor_ass;
	visual_change = "DB_Ako_Armor_M.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_animate = 0;
};

instance ITAR_ASSASINS_04(C_Item)
{
	name = "Доспехи тени Масиаф";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 30;
	value = protection[PROT_MAGIC];
	weight = 2;
	wear = WEAR_TORSO;
	visual = "DB_Adept_Ar.3ds";
	on_equip = equip_otherarmor_ass;
	on_unequip = UnEquip_otherarmor_ass;
	visual_change = "DB_Pri_Armor_L.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_GONSALES(C_Item)
{
	name = "Доспех Гонсалеса";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 140;
	protection[PROT_BLUNT] = 140;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 50;
	//value = 7500;
	weight = 4;
	wear = WEAR_TORSO;
	visual = "ITAR_ASS_M.3ds";
	visual_change = "HUM_ASSB_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_otherarmor;
	description = name;
	inv_animate = 0;
};

instance ITAR_ASSASINS_CORGALOM(C_Item)
{
	name = "Доспехи гуру-демона";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 150;
	protection[PROT_MAGIC] = 150;
	protection[PROT_FLY] = 150;
	weight = 3;
	//value = 100;
	wear = WEAR_TORSO;
	visual = "ItAr_GUR_Z.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_GURZ_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ItAr_Hun_H(ITAR_SLD_H_A)
{
	name = "Тяжелые доспехи охотника";
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_MAGIC];
	weight = 1;
	visual = "ItAr_Hun_H.3ds";
	visual_change = "Armor_Hun_H.asc";
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DHT_END(C_Item)
{
	name = "Доспехи ловкача";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 50;
	weight = 0;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3DS";
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	visual_change = "Armor_Her_N.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_SklavenFessel(C_Item)
{
	name = "Ошейник раба";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 10;
	wear = WEAR_Head;
	visual = "Sklavenfessel.3ds";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ItAr_OrcMine_Slave(C_Item)
{
	name = "Одежда раба орков";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 1;
	protection[PROT_BLUNT] = 1;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 10;
	wear = WEAR_TORSO;
	visual = "ItAr_Prisoner.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_DARKSAGA_PRISONER_01.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ItAr_Sekbed_Slave(C_Item)
{
	name = "Набедренная повязка раба";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 10;
	wear = WEAR_TORSO;
	visual = "ItAr_Sekbed.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_NOVL_Armor.asc";
	visual_skin = 2;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};


//-------------доспехи зомби-----------------------------------

instance ITAR_STT_Z(C_Item)
{
	name = "Доспехи зомби-призрака";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 150;
	//value = 1000;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	wear = WEAR_TORSO;
	visual = "sttm.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Hum_STTM_ARMOZ.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_STT_Z1(C_Item)
{
	name = "Кольчуга зомби-призрака";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 150;
	//value = 1500;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	wear = WEAR_TORSO;
	visual = "stts.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_STTS_ARMOZ.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_GRD_Z(C_Item)
{
	name = "Лeгкие доспехи зомби-стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FLY] = 150;
	//value = 1800;
	wear = WEAR_TORSO;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "grdl.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Hum_GRDL_ARMOZ.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_Bloodwyn_AddoZ(C_Item)
{
	name = "Доспехи зомби-стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FLY] = 150;
	//value = VALUE_ITAR_Bloodwyn_Addon;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	wear = WEAR_TORSO;
	visual = "ItAr_Bloodwyn_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Bloodwyn_ADDOZ.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_Thorus_AddoZ(C_Item)
{
	name = "Тяжелые доспехи зомби-стражника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FLY] = 150;
	//value = VALUE_ITAR_Thorus_Addon;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	wear = WEAR_TORSO;
	visual = "ItAr_Thorus_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Thorus_ADDOZ.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_TPL_Z(C_Item)
{
	name = "Доспехи зомби-стража Братства";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 40;
	protection[PROT_FLY] = 150;
	//value = VALUE_ITAR_Thorus_Addon;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	wear = WEAR_TORSO;
	visual = "ItAr_Thorus_ADDON.3ds";
	on_equip = equip_otherarmor;
	visual_change = "HUM_TPLM_ARMOZ.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ItAr_DEAD_PRIEST(C_Item)
{
	name = "Роба проклятого верховного жреца";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 150;
	protection[PROT_MAGIC] = 100;
	protection[PROT_FLY] = 150;
	//value = 100;
	weight = 4;
	wear = WEAR_TORSO;
	visual = "ItAr_Shp_H.3ds";
	visual_change = "Armor_Shp_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor;
	description = name;
	inv_animate = 0;
};

instance ItAr_HuntArmor_01(C_Item)
{
	name = "Доспехи охотника-следопыта";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	value = protection[PROT_MAGIC];
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Hun_L.3ds";
	visual_change = "FER_L_ARMOR_01.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_hunt;
	on_unequip = UnEquip_otherarmor_hunt;
	description = name;
	//text[0] = NAME_NoHelmEquip;
	text[0] = "Требуется выносливости:";
	count[0] = 150;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_HuntArmor_NPC(C_Item)
{
	name = "Доспехи охотника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 30;
	//value = 1500;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Hun_L.3ds";
	visual_change = "FER_L_ARMOR_01.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor;
	description = name;
	inv_animate = 0;
};

instance ItAr_HuntArmor_02(C_Item)
{
	name = "Доспехи охотника-зверобоя";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 20;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	value = protection[PROT_MAGIC];
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Hun_M.3ds";
	visual_change = "FER_M_BLACK_ARMOR_01.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_hunt;
	on_unequip = UnEquip_otherarmor_hunt;
	description = name;
	//text[0] = NAME_NoHelmEquip;
	text[0] = "Требуется выносливости:";
	count[0] = 250;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};


instance ItAr_HuntArmor_M_NPC(C_Item)
{
	name = "Доспехи охотника-зверобоя";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	//value = 2000;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Hun_M.3ds";
	visual_change = "FER_M_BLACK_ARMOR_01.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_hunt;
	on_unequip = UnEquip_otherarmor_hunt;
	description = name;
	inv_animate = 0;
};

instance ItAr_HuntArmor_03(C_Item)
{
	name = "Доспехи охотника-троллебойца";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 40;
	value = protection[PROT_MAGIC];
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_Hun_H.3ds";
	visual_change = "FER_TROLL_ARMOR_01.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_hunt;
	on_unequip = UnEquip_otherarmor_hunt;
	description = name;
	//text[0] = NAME_NoHelmEquip;
	text[0] = "Требуется выносливости:";
	count[0] = 400;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_HuntArmor_H_NPC(C_Item)
{
	name = "Доспехи охотника-троллебойца";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	//value = 1500;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_Hun_H.3ds";
	visual_change = "FER_TROLL_ARMOR_01.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor;
	description = name;
	inv_animate = 0;
};

instance ItAr_HuntArmor_04(C_Item)
{
	name = "Доспехи мастера-охотника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 30;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 55;
	value = protection[PROT_MAGIC];
	weight = 4;
	wear = WEAR_TORSO;
	visual = "ItAr_Hun_X.3ds";
	visual_change = "FER_BLACKTROLL_ARMOR_H01.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_hunt;
	on_unequip = UnEquip_otherarmor_hunt;
	description = name;
	//text[0] = NAME_NoHelmEquip;
	text[0] = "Требуется выносливости:";
	count[0] = 550;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ORC_L(C_Item)
{
	name = "Доспех крестьянина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	weight = 4;
	//value = 3000;
	weight = 40;
	wear = WEAR_TORSO;
	visual = "ARMOR_BAU_M_KANION.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_BAU_M_KANION.asc";
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_orcs;
	on_unequip = UnEquip_otherarmor_orcs;
	description = name;
	inv_animate = 0;
};

instance ITAR_ORC_L_HART(C_Item)
{
	name = "Орочий доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 190;
	protection[PROT_POINT] = 190;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 50;
	weight = 6;
	//value = 3000;
	wear = WEAR_TORSO;
	visual = "ITAR_ORCS.3ds";
	visual_change = "ARMOR_VAR.asc";
	visual_skin = 1;
	on_equip = Equip_otherarmor_orcs;
	on_unequip = UnEquip_otherarmor_orcs;
	description = name;
	inv_animate = 0;
};

instance ITAR_SLD_U(C_Item)
{
	name = "Тяжелый доспех наемника";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 160;
	protection[PROT_BLUNT] = 160;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	//value = 8000;
	weight = 6;
	wear = WEAR_TORSO;
	visual = "ORC_NAJEMNIK_H.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ORC_NAJEMNIK_H.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_orcs;
	on_unequip = UnEquip_otherarmor_orcs;
	description = name;
	inv_animate = 0;
};

instance ITAR_ORCARMOR(C_Item)
{
	name = "Орочий доспех воина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 170;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 50;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	weight = 7;
	wear = WEAR_TORSO;
	visual = "ITAR_ORCS.3ds";
	visual_change = "SKYRIMORK.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_orcs_nopoint;
	on_unequip = UnEquip_otherarmor_orcs_nopoint;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 300 | Требуется выносливости: 650";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ORCARMOR_DEX(C_Item)
{
	name = "Орочий доспех следопыта";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 140;
	protection[PROT_BLUNT] = 125;
	protection[PROT_POINT] = 115;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 25;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 45;
	value = protection[PROT_MAGIC];
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 300;
	weight = 5;
	wear = WEAR_TORSO;
	visual = "ITAR_ORCS.3ds";
	visual_change = "ARMOR_VAR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_orcs_nopoint;
	on_unequip = UnEquip_otherarmor_orcs_nopoint;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется ловкости: 300 | Требуется выносливости: 450";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SHAMANROBE(C_Item)
{
	name = "Орочья роба шамана";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 110;
	protection[PROT_MAGIC] = 50;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 600;
	value = protection[PROT_MAGIC];
	weight = 4;
	wear = WEAR_TORSO;
	visual = "ITAR_ORCS.3ds";
	visual_change = "ARMOR_DS_FER_MAGE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor_orcs_nopoint;
	on_unequip = UnEquip_otherarmor_orcs_nopoint;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_SANCUARY_GUARD(C_Item)
{
	name = "Доспехи стража святилища";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 180;
	protection[PROT_BLUNT] = 180;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 75;
	protection[PROT_MAGIC] = 75;
	protection[PROT_FLY] = 100;
	weight = 6;
	//value = 100;
	wear = WEAR_TORSO;
	visual = "DB_Adept_Ar.3ds";
	on_equip = equip_otherarmor;
	visual_change = "DB_Pri_Armor_M.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_SANCUARY_KEEPER(C_Item)
{
	name = "Доспехи хранителя святилища";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 260;
	protection[PROT_BLUNT] = 260;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 155;
	protection[PROT_MAGIC] = 155;
	protection[PROT_FLY] = 100;
	weight = 7;
	//value = 100;
	wear = WEAR_TORSO;
	visual = "DB_Prior_Armor.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_PRIOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ITAR_Her_M(C_Item)
{
	name = "Рваные обноски";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 1;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3DS";
	on_equip = equip_otherarmor;
	visual_change = "MATROSENKLEIDUNG.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_POOR(C_Item)
{
	name = "Рваные обноски";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 1;
	protection[PROT_BLUNT] = 1;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	weight = 0;
	//value = VALUE_ITAR_NONE;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3DS";
	on_equip = equip_otherarmor;
	visual_change = "MATROSENKLEIDUNZ.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_Her_N(C_Item)
{
	name = "Одежда вора";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	weight = 0;
	//value = 100;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3DS";
	on_equip = equip_otherarmor;
	visual_change = "Armor_Her_N.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor;
	description = name;
	inv_animate = 0;
};

//-----------------------воровская линейка----------------------------------------------

 
instance ITAR_DHT_END_1(C_Item)
{
	name = "Доспехи вора";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 80;
	value = protection[PROT_MAGIC];
	weight = 0;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3DS";
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	visual_change = "HUM_DHT1_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DHT_END_2(C_Item)
{
	name = "Доспехи призрака";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 120;
	value = protection[PROT_MAGIC];
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3DS";
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	visual_change = "HUM_DHT3_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_Atilla(C_Item)
{
	name = "Доспехи Атиллы";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ITAR_DHT_END_4.3ds";
	visual_change = "HUM_DHT3_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_DHT_END_3(C_Item)
{
	name = "Доспехи ночной тени";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 15;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 150;
	weight = 2;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_M.3DS";
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	visual_change = "ARMOR_DHT_3_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Dex_needed;
	text[0] = "Требуется ловкости: 150| Требуется выносливости: 150";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_Jesper(C_Item)
{
	name = "Доспехи Джеспера";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ITAR_DHT_END_4.3ds";
	visual_change = "ARMOR_DHT_3_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_DHT_END_4(C_Item)
{
	name = "Доспехи мастера-вора";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 15;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 180;
	value = protection[PROT_MAGIC];
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_M.3DS";
	on_equip = equip_chiefarmor_with_cap;
	on_unequip = unequip_chiefarmor_with_cap;
	//visual_change = "ARMOR_DHT_4.asc";
	visual_change = "PIRANHA_THIEVES_LINWE'S.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Dex_needed;
	text[0] = "Требуется ловкости: 180| Требуется выносливости: 250";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_RAMIREZ(C_Item)
{
	name = "Доспехи Рамиреза";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ITAR_DHT_END_4.3ds";
	visual_change = "PIRANHA_THIEVES_LINWE'S.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_DHT_END_5(C_Item)
{
	name = "Доспехи главаря воров";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 140;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 20;
	protection[PROT_FLY] = 20;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 230;
	value = protection[PROT_MAGIC];
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	visual_change = "FER_H_ARMOR_01.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Dex_needed;
	text[0] = "Требуется ловкости: 230| Требуется выносливости: 350";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_DHT_END_6(C_Item)
{
	name = "Доспехи короля воров";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 170;
	protection[PROT_BLUNT] = 160;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 25;
	protection[PROT_FLY] = 30;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 350;
	value = protection[PROT_MAGIC];
	weight = 5;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3DS";
	visual_change = "ItAr_GodArmor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	description = name;
	//text[0] = NAME_Dex_needed;
	text[0] = "Требуется ловкости: 350| Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ASS(C_Item)
{
	name = "Доспех ассасина";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 80;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 20;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 35;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 300;
	value = protection[PROT_MAGIC];
	weight = 4;
	wear = WEAR_TORSO;
	visual = "ITAR_ASS_M.3ds";
	visual_change = "HUM_ASSA_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	description = name;
	//text[0] = NAME_Dex_needed;
	text[0] = "Требуется ловкости: 300| Требуется выносливости: 350";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_TOPTHIEF(C_Item)
{
	name = "Доспех Эр'Хазира";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 160;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 70;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 45;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 300;
	value = protection[PROT_MAGIC];
	weight = 4;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3ds";
	visual_change = "SZKLANKA1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_chiefarmor;
	on_unequip = unequip_chiefarmor;
	description = name;
	//text[0] = NAME_Dex_needed;
	text[0] = "Требуется ловкости: 300| Требуется выносливости: 450";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ASGARD(C_Item)
{
	name = "Доспех призрачной тени";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 210;
	protection[PROT_BLUNT] = 200;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 60;
	protection[PROT_FLY] = 60;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 65;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 500;
	value = protection[PROT_MAGIC];
	weight = 5;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_H.3ds";
	visual_change = "PIRANHA_SOWL.asc";
	on_equip = equip_chiefarmor_elite;
	on_unequip = unequip_chiefarmor_elite;
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_chiefarmor_elite;
	on_unequip = unequip_chiefarmor_elite;
	description = name;
	//text[0] = NAME_Dex_needed;
	text[0] = "Требуется ловкости: 500| Требуется выносливости: 650";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ITAR_ADVENTURE(C_Item)
{
	name = "Доспехи авантюриста";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 500;
	weight = 1;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 50;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ARMOR_GERALT_ADDON_GRD1.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_ADVENTURE_HERO(C_Item)
{
	name = "Доспехи авантюриста";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 500;
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3ds";
	on_equip = equip_otherarmor_pablo;
	on_unequip = unequip_otherarmor_pablo;
	visual_change = "ARMOR_GERALT_ADDON_GRD1.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_animate = 0;
};

instance ItAr_Mage_AV(C_Item)
{
	name = "Роба жреца Аданоса";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 150;
	protection[PROT_MAGIC] = 100;
	protection[PROT_FLY] = 100;
	//value = 100;
	weight = 2;
	wear = WEAR_TORSO;
	visual = "ItAr_Shp_H.3ds";
	visual_change = "ARMOR_KDF_L_SKE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_otherarmor;
	description = name;
	inv_animate = 0;
};

instance ItAr_GodArmor(C_Item)
{
	name = "Доспехи Избранного";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 350;
	protection[PROT_BLUNT] = 350;
	protection[PROT_POINT] = 350;
	protection[PROT_FIRE] = 200;
	protection[PROT_MAGIC] = 200;
	protection[PROT_FLY] = 450;
	weight = 1;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H_V5.3ds";
	visual_change = "EBONOWAZBROJA13.asc";
	visual_skin = 0;
	on_equip = equip_otherarmor_god;
	on_unequip = unequip_otherarmor_god;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Эти доспехи ковали сами Боги...";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

func void Equip_Otherarmor_God()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_FIRE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		Snd_Play("OPEN_PORTAL");
		MageRobeIsUp = TRUE;
	};
};

func void UnEquip_Otherarmor_God()
{
	if(Npc_IsPlayer(self))
	{
		MageRobeIsUp = FALSE;
	};
};

instance ITAR_ABORIGEN_CLOTHES(C_Item)
{
	name = "Доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 500;
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3ds";
	on_equip = equip_otherarmor;
	visual_change = "ABORIGEN_CLOTHES.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_ABORIGEN_ARMOR(C_Item)
{
	name = "Доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 500;
	weight = 1;
	wear = WEAR_TORSO;
	visual = "ItAr_Uniform_L.3ds";
	on_equip = equip_otherarmor;
	//visual_change = "RBL_ARMOR_L.asc";
	visual_change = "PIRANHA_BICH.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ItAr_OldSteelArmor_NPC(C_Item)
{
	name = "Стальной самокованный доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 100;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M_V3.3ds";
	on_equip = equip_otherarmor;
	visual_change = "PIRANHA_PALADIUM.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ItAr_OldSteelArmor(C_Item)
{
	name = "Стальной самокованный доспех";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 40;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 50;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	weight = 3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 250;
	visual = "ItAr_Pal_M_V3.3ds";
	on_equip = equip_otherarmor;
	visual_change = "PIRANHA_PALADIUM.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	//text[0] = NAME_Str_needed;
	text[0] = "Требуется силы: 250 | Требуется выносливости: 500";
	//count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_animate = 0;
};

instance ItAr_Wizard_NPC(C_Item)
{
	name = "Роба мага";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 190;
	protection[PROT_BLUNT] = 190;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 170;
	protection[PROT_MAGIC] = 130;
	protection[PROT_FLY] = 100;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 300;
	weight = 3;
	wear = WEAR_TORSO;
	visual = "ITAR_KDMS.3ds";
	visual_change = "HUM_KDMS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = Equip_ITAR_KDF_SH;
	on_unequip = UnEquip_ITAR_KDF_SH;
	description = name;
	inv_animate = 0;
};

//---------------------------пояса----------------------------------------

func void Equip_ITAR_Leather_L()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");

		LeatherArmor_Equipped = TRUE;

		if(Leather01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
		};

		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_ITAR_Leather_L()
{
	if(Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = FALSE;

		if(Leather01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
		};
	};
};

func void Equip_ITAR_MIL_L()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		MILArmor_Equipped = TRUE;

		if(MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_MIL_L()
{
	if(Npc_IsPlayer(self))
	{
		MILArmor_Equipped = FALSE;

		if(MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
		};
	};
};

func void Equip_ITAR_MIL_M()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		MILHeavyArmor_Equipped = TRUE;

		if(MIL02_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus02;
			self.protection[PROT_BLUNT] += BA_Bonus02;
			self.protection[PROT_POINT] += BA_Bonus02;
		};

		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_ITAR_MIL_M()
{
	if(Npc_IsPlayer(self))
	{
		MILHeavyArmor_Equipped = FALSE;

		if(MIL02_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus02;
			self.protection[PROT_BLUNT] -= BA_Bonus02;
			self.protection[PROT_POINT] -= BA_Bonus02;
		};
	};
};

func void Equip_ITAR_SLD_L()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		SLDArmor_Equipped = TRUE;

		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
		};

		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_ITAR_SLD_L()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;

		if(SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
		};
	};
};

func void Equip_ITAR_SLD_M()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		SLDMediumArmor_Equipped = TRUE;

		if(SLD02_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus02;
			self.protection[PROT_BLUNT] += BA_Bonus02;
			self.protection[PROT_POINT] += BA_Bonus02;
		};

		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_ITAR_SLD_M()
{
	if(Npc_IsPlayer(self))
	{
		SLDMediumArmor_Equipped = FALSE;

		if(SLD02_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus02;
			self.protection[PROT_BLUNT] -= BA_Bonus02;
			self.protection[PROT_POINT] -= BA_Bonus02;
		};
	};
};

func void Equip_ITAR_SLD_H()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		SLDHeavyArmor_Equipped = TRUE;

		if(SLD03_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus03;
			self.protection[PROT_BLUNT] += BA_Bonus03;
			self.protection[PROT_POINT] += BA_Bonus03;
		};

		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_ITAR_SLD_H()
{
	if(Npc_IsPlayer(self))
	{
		SLDHeavyArmor_Equipped = FALSE;

		if(SLD03_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus03;
			self.protection[PROT_BLUNT] -= BA_Bonus03;
			self.protection[PROT_POINT] -= BA_Bonus03;
		};
	};
};

func void Equip_ITAR_DJG_Crawler()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		MCArmor_Equipped = TRUE;

		if(MC_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus02;
			self.protection[PROT_BLUNT] += BA_Bonus02;
			self.protection[PROT_POINT] += BA_Bonus02;
		};

		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_ITAR_DJG_Crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCArmor_Equipped = FALSE;

		if(MC_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus02;
			self.protection[PROT_BLUNT] -= BA_Bonus02;
			self.protection[PROT_POINT] -= BA_Bonus02;
		};
	};
};

func void Equip_ITAR_NOV_L()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		NOVArmor_Equipped = TRUE;

		if(NOV01_Equipped == TRUE)
		{
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};

		ChechWeightArmor = TRUE;
		MageRobeIsUp = TRUE;
	};
};

func void UnEquip_ITAR_NOV_L()
{
	if(Npc_IsPlayer(self))
	{
		NOVArmor_Equipped = FALSE;

		if(NOV01_Equipped == TRUE)
		{
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};

		MageRobeIsUp = FALSE;
	};
};

func void Equip_ITAR_KDF_L()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		KDFArmor_Equipped = TRUE;

		if(KDF01_Equipped == TRUE)
		{
			self.protection[PROT_MAGIC] += BA_Bonus02;
			self.protection[PROT_FIRE] += BA_Bonus02;
		};

		ChechWeightArmor = TRUE;
		MageRobeIsUp = TRUE;
	};
};

func void UnEquip_ITAR_KDF_L()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = FALSE;

		if(KDF01_Equipped == TRUE)
		{
			self.protection[PROT_MAGIC] -= BA_Bonus02;
			self.protection[PROT_FIRE] -= BA_Bonus02;
		};

		MageRobeIsUp = FALSE;
	};
};

func void Equip_ITAR_KDF_H()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		KDFHeavyArmor_Equipped = TRUE;

		if(KDF02_Equipped == TRUE)
		{
			self.protection[PROT_MAGIC] += BA_Bonus03;
			self.protection[PROT_FIRE] += BA_Bonus03;
		};

		ChechWeightArmor = TRUE;
		MageRobeIsUp = TRUE;
	};
};

func void UnEquip_ITAR_KDF_H()
{
	if(Npc_IsPlayer(self))
	{
		KDFHeavyArmor_Equipped = FALSE;

		if(KDF02_Equipped == TRUE)
		{
			self.protection[PROT_MAGIC] -= BA_Bonus03;
			self.protection[PROT_FIRE] -= BA_Bonus03;
		};

		MageRobeIsUp = FALSE;
	};
};

func void Equip_ITAR_KDF_SH()
{
	var C_Item CurItem;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		KDFArchArmor_Equipped = TRUE;

		if(KDF03_Equipped == TRUE)
		{
			self.protection[PROT_MAGIC] += BA_Bonus04;
			self.protection[PROT_FIRE] += BA_Bonus04;
		};
		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			};
		};

		ChechWeightArmor = TRUE;

		CurItem = Hlp_GetSlotItem(self,"ZS_HELMET");

		if((Hlp_IsValidItem(CurItem) == TRUE) && (Hlp_IsItem(CurItem,G3_ARMOR_HELMET_CRONE) == FALSE) && (Hlp_IsItem(CurItem,ItAr_ShrecHelm) == FALSE) && (Hlp_IsItem(CurItem,ItAr_Helm_G3_06) == FALSE))
		{
			Npc_UnEquipItem(self,CurItem);
		};

		MageArmorWithCapisUp = TRUE;
		MageRobeIsUp = TRUE;
	};
};

func void UnEquip_ITAR_KDF_SH()
{
	if(Npc_IsPlayer(self))
	{
		KDFArchArmor_Equipped = FALSE;

		if(KDF03_Equipped == TRUE)
		{
			self.protection[PROT_MAGIC] -= BA_Bonus04;
			self.protection[PROT_FIRE] -= BA_Bonus04;
		};
		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			};
		};

		MageArmorWithCapisUp = FALSE;
		MageRobeIsUp = FALSE;
	};
};

func void Equip_ITAR_DJG_L()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		DJGArmor_Equipped = TRUE;

		if(DJG01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus04;
			self.protection[PROT_BLUNT] += BA_Bonus04;
			self.protection[PROT_POINT] += BA_Bonus04;
		};

		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_ITAR_DJG_L()
{
	if(Npc_IsPlayer(self))
	{
		DJGArmor_Equipped = FALSE;

		if(DJG01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus04;
			self.protection[PROT_BLUNT] -= BA_Bonus04;
			self.protection[PROT_POINT] -= BA_Bonus04;
		};
	};
};

func void Equip_ITAR_SEK_L()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		SEKArmor_Equipped = TRUE;

		if(SEK01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
		};

		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_ITAR_SEK_L()
{
	if(Npc_IsPlayer(self))
	{
		SEKArmor_Equipped = FALSE;

		if(SEK01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
		};
	};
};

func void Equip_ITAR_TPL_L()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		TPLArmor_Equipped = TRUE;

		if(TPL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus02;
			self.protection[PROT_BLUNT] += BA_Bonus02;
			self.protection[PROT_MAGIC] += BA_Bonus02;
		};

		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_ITAR_TPL_L()
{
	if(Npc_IsPlayer(self))
	{
		TPLArmor_Equipped = FALSE;

		if(TPL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus02;
			self.protection[PROT_BLUNT] -= BA_Bonus02;
			self.protection[PROT_MAGIC] -= BA_Bonus02;
		};
	};
};

func void Equip_ITAR_GUR_L()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		GURArmor_Equipped = TRUE;

		if(GUR01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus03;
			self.protection[PROT_BLUNT] += BA_Bonus03;
			self.protection[PROT_MAGIC] += BA_Bonus03;
		};

		ChechWeightArmor = TRUE;
		MageRobeIsUp = TRUE;
	};
};

func void UnEquip_ITAR_GUR_L()
{
	if(Npc_IsPlayer(self))
	{
		GURArmor_Equipped = FALSE;

		if(GUR01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus03;
			self.protection[PROT_BLUNT] -= BA_Bonus03;
			self.protection[PROT_MAGIC] -= BA_Bonus03;
		};

		MageRobeIsUp = FALSE;
	};
};

//----------------------------------------------------------------------------------

func void equip_itar_guardian()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		ChechWeightArmor = TRUE;
	};
};

func void equip_itar_fireguardian()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		ChechWeightArmor = TRUE;
	};
};

func void equip_itar_waterguardian()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
		ChechWeightArmor = TRUE;
	};
};

func void equip_itar_stoneguardian()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
		ChechWeightArmor = TRUE;
	};
};

func void equip_itar_pal_m_v2()
{
	if(Npc_IsPlayer(self))
	{
		if(hero.guild == GIL_PAL)
		{
			Snd_Play3d(hero,"EQUIP_ARMOR_01");
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
			AI_Wait(self,3);
			Npc_StopAni(hero,"T_MAGRUN_2_HEASHOOT");
			Snd_Play("SFX_INNOSEYE");
			ChechWeightArmor = TRUE;
		}
		else
		{
			AI_Wait(self,3);
			AI_PlayAni(self,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			B_Say(self,self,"$Dead");
			AI_StopFX(self,"VOB_MAGICBURN");
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(self,"S_FIRE_VICTIM");
		};
	};
};

func void equip_itar_pal_h_v2()
{
	if(Npc_IsPlayer(self))
	{
		if(hero.guild == GIL_PAL)
		{
			Snd_Play3d(hero,"EQUIP_ARMOR_01");
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
			AI_Wait(self,3);
			Npc_StopAni(hero,"T_MAGRUN_2_HEASHOOT");
			Snd_Play("SFX_INNOSEYE");
			ChechWeightArmor = TRUE;
		}
		else
		{
			AI_Wait(self,3);
			AI_PlayAni(self,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			B_Say(self,self,"$Dead");
			AI_StopFX(self,"VOB_MAGICBURN");
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(self,"S_FIRE_VICTIM");
		};
	};
};

func void unequip_itar_pal_m_v2()
{
};

func void unequip_itar_pal_h_v2()
{
};

func void equip_otherarmor()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		ChechWeightArmor = TRUE;
	};
};

func void equip_chiefarmor()
{
	if(Npc_IsPlayer(self))
	{
		if(IS_LOVCACH_ARMOR == FALSE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_01;
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_02;
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_03;
			};
	
			IS_LOVCACH_ARMOR = TRUE;
			ChechWeightArmor = TRUE;
		};
	};
};

func void unequip_chiefarmor()
{
	if(Npc_IsPlayer(self))
	{
		if(IS_LOVCACH_ARMOR == TRUE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_01;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_02;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_03;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			};

			IS_LOVCACH_ARMOR = FALSE;
		};
	};
};

func void equip_itar_guardian_dex()
{
	if(Npc_IsPlayer(self))
	{
		if(IS_LOVCACH_ARMOR == FALSE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_01;
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_02;
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_03;
			};

			IS_LOVCACH_ARMOR = TRUE;
		};

		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		ChechWeightArmor = TRUE;
	};
};

func void equip_chiefarmor_elite()
{
	var C_Item CurItem;

	if(Npc_IsPlayer(self))
	{
		if(IS_LOVCACH_ARMOR == FALSE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_01;
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_02;
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_03;
			};

			IS_LOVCACH_ARMOR = TRUE;
			ChechWeightArmor = TRUE;
		};
	};
	if(Npc_IsPlayer(self))
	{
		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			};
		};

		CurItem = Hlp_GetSlotItem(self,"ZS_HELMET");

		if((Hlp_IsValidItem(CurItem) == TRUE) && (Hlp_IsItem(CurItem,G3_ARMOR_HELMET_CRONE) == FALSE) && (Hlp_IsItem(CurItem,ItAr_Helm_G3_06) == FALSE))
		{
			Npc_UnEquipItem(self,CurItem);
		};

		ArmorWithCapisUp = TRUE;
	};
};

func void unequip_itar_guardian_dex()
{
	if(Npc_IsPlayer(self))
	{
		if(IS_LOVCACH_ARMOR == TRUE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_01;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_02;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_03;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			};

			IS_LOVCACH_ARMOR = FALSE;
		};
	};
};

func void unequip_chiefarmor_elite()
{
	if(Npc_IsPlayer(self))
	{
		if(IS_LOVCACH_ARMOR == TRUE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_01;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_02;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_03;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			};
	
			IS_LOVCACH_ARMOR = FALSE;
		};
	};
	if(Npc_IsPlayer(self))
	{
		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			};
		};

		ArmorWithCapisUp = FALSE;
	};
};

func void equip_chiefarmor_with_cap()
{
	var C_Item CurItem;

	if(Npc_IsPlayer(self))
	{
		if(IS_LOVCACH_ARMOR == FALSE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_01;
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_02;
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_03;
			};

			IS_LOVCACH_ARMOR = TRUE;
			ChechWeightArmor = TRUE;
		};
	};
	if(Npc_IsPlayer(self))
	{
		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			};
		};

		CurItem = Hlp_GetSlotItem(self,"ZS_HELMET");

		if((Hlp_IsValidItem(CurItem) == TRUE) && (Hlp_IsItem(CurItem,G3_ARMOR_HELMET_CRONE) == FALSE) && (Hlp_IsItem(CurItem,ItAr_Helm_G3_06) == FALSE))
		{
			Npc_UnEquipItem(self,CurItem);
		};

		ArmorWithCapisUp = TRUE;
	};
};

func void unequip_chiefarmor_with_cap()
{
	if(Npc_IsPlayer(self))
	{
		if(IS_LOVCACH_ARMOR == TRUE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_01;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_02;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_03;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			};

			IS_LOVCACH_ARMOR = FALSE;
		};
	};
	if(Npc_IsPlayer(self))
	{
		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			};
		};

		ArmorWithCapisUp = FALSE;
	};
};

func void Unequip_ItAr_OldOreArmor()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play("Hero_Ressurect");
		Snd_Play("SFX_CIRCLE");
	};
};

func void unequip_itar_adept()
{
	if(Npc_IsPlayer(self))
	{
		EQITAR_ADEPT = 0;
		MageArmorWithCapisUp = FALSE;
		MageRobeIsUp = FALSE;
	};
};

func void equip_itar_bau_l_trans()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		TRANSFERARMORISEQUIPED = TRUE;
	};
};

func void unequip_itar_bau_l_trans()
{
	if(Npc_IsPlayer(self))
	{
		b_transferback(self);
		TRANSFERARMORISEQUIPED = FALSE;
	};
};

func void Equip_otherarmor_hunt()
{
	var C_Item CurItem;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");

		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			};
		};

		ChechWeightArmor = TRUE;

		CurItem = Hlp_GetSlotItem(self,"ZS_HELMET");

		if((Hlp_IsValidItem(CurItem) == TRUE) && (Hlp_IsItem(CurItem,G3_ARMOR_HELMET_CRONE) == FALSE) && (Hlp_IsItem(CurItem,ItAr_Helm_G3_06) == FALSE))
		{
			Npc_UnEquipItem(self,CurItem);
		};

		ArmorWithCapisUp = TRUE;
	};
};

func void UnEquip_otherarmor_hunt()
{
	if(Npc_IsPlayer(self))
	{
		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			};
		};

		ArmorWithCapisUp = FALSE;
	};
};

func void Equip_otherarmor_ass()
{
	var C_Item CurItem;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");

		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_N_Player,0,NO_ARMOR);
			};
		};

		ChechWeightArmor = TRUE;
		CurItem = Hlp_GetSlotItem(self,"ZS_HELMET");

		if((Hlp_IsValidItem(CurItem) == TRUE) && (Hlp_IsItem(CurItem,G3_ARMOR_HELMET_CRONE) == FALSE) && (Hlp_IsItem(CurItem,ItAr_Helm_G3_06) == FALSE))
		{
			Npc_UnEquipItem(self,CurItem);
		};

		ArmorWithCapisUp = TRUE;
	};
};

func void UnEquip_otherarmor_ass()
{
	if(Npc_IsPlayer(self))
	{
		if(HeroBoldHead == TRUE)
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
			};
		}
		else
		{
			if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_NG_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			}
			else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
			};
		};

		ArmorWithCapisUp = FALSE;
	};
};

func void Equip_otherarmor_orcs()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		ChechWeightArmor = TRUE;
	};
};

func void UnEquip_otherarmor_orcs()
{
};

func void Equip_otherarmor_orcs_nopoint()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		ChechWeightArmor = TRUE;
		HeroIsOrcArmor = TRUE;
	};
};

func void UnEquip_otherarmor_orcs_nopoint()
{
	if(Npc_IsPlayer(self))
	{
		HeroIsOrcArmor = FALSE;
	};
};

func void Equip_itar_pal_venzel()
{
	if(Npc_IsPlayer(self))
	{
		AI_Wait(self,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

func void equip_otherarmor_pablo()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		VlkL_ArmorUp = TRUE;

		if(Hanna_LeatherBought == FALSE)
		{
			Hanna_LeatherBought = TRUE;
		};
	};
};

func void unequip_otherarmor_pablo()
{
	if(Npc_IsPlayer(self))
	{
		VlkL_ArmorUp = FALSE;
	};
};

func void Equip_DarkMessian()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		DarkMessianArmorEquipped = TRUE;
		Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
		ChechWeightArmor = TRUE;
		MageRobeIsUp = TRUE;
		AI_Print("Вам дарована особенная способность - 'Пожиратель плоти'!");
	};
};

func void UnEquip_DarkMessian()
{
   if(Npc_IsPlayer(self))
   {
      DarkMessianArmorEquipped = FALSE;
      MageRobeIsUp = FALSE;
   };
};

func void Equip_BeliarChosen()
{
	if(Npc_IsPlayer(self))
	{
		if(self.guild == GIL_KDM)
		{
			BeliarChosenEquipped = TRUE;
			Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
			AI_Print("Вам дарована особенная способность - 'Зов Тьмы'!");
		};

		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		ChechWeightArmor = TRUE;
		MageRobeIsUp = TRUE;
		CountBelChos = FALSE;
	};
};

func void UnEquip_BeliarChosen()
{
	if(Npc_IsPlayer(self))
	{
		BeliarChosenEquipped = FALSE;
		MageRobeIsUp = FALSE;
		CountBelChos = FALSE;
	};
};

//-------------------------------------------------

instance armr_G1_v1(C_Item) 
{ 
	name = "Одежда"; 
	mainflag = ITEM_KAT_ARMOR; 
	flags = ITEM_MISSION; 
  	protection[PROT_EDGE] = 10; 
  	protection[PROT_BLUNT] = 0; 
  	protection[PROT_POINT] = 0; 
  	protection[PROT_FIRE] = 0; 
  	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_NONE; 
	wear = WEAR_TORSO; 
	visual = "ItAr_VLKBabe.3DS"; 
	visual_change = "SRN_ARMOR_G1_v1.ASC"; 
	visual_skin = 0; 
	material = MAT_LEATHER; 
	description = name; 
	inv_animate = 0;
}; 
 
instance armr_G1_v2(C_Item) 
{ 
	name = "Одежда"; 
	mainflag = ITEM_KAT_ARMOR; 
	flags = ITEM_MISSION; 
  	protection[PROT_EDGE] = 10; 
  	protection[PROT_BLUNT] = 0; 
  	protection[PROT_POINT] = 0; 
  	protection[PROT_FIRE] = 0; 
  	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_NONE; 
	wear = WEAR_TORSO; 
	visual = "ItAr_VLKBabe.3DS"; 
	visual_change = "SRN_ARMOR_G1_v2.ASC"; 
	visual_skin = 0; 
	material = MAT_LEATHER; 
	description = name; 
	inv_animate = 0;
}; 
 
instance armr_G1_v3(C_Item) 
{ 
	name = "Одежда"; 
	mainflag = ITEM_KAT_ARMOR; 
	flags = ITEM_MISSION; 
  	protection[PROT_EDGE] = 10; 
  	protection[PROT_BLUNT] = 0; 
  	protection[PROT_POINT] = 0; 
  	protection[PROT_FIRE] = 0; 
  	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_NONE; 
	wear = WEAR_TORSO; 
	visual = "ItAr_VLKBabe.3DS"; 
	visual_change = "SRN_ARMOR_G1_v3.ASC"; 
	visual_skin = 0; 
	material = MAT_LEATHER; 
	description = name; 
	inv_animate = 0;
}; 
 
instance armr_G1_v4(C_Item) 
{ 
	name = "Одежда"; 
	mainflag = ITEM_KAT_ARMOR; 
	flags = ITEM_MISSION; 
  	protection[PROT_EDGE] = 10; 
  	protection[PROT_BLUNT] = 0; 
  	protection[PROT_POINT] = 0; 
  	protection[PROT_FIRE] = 0; 
  	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_NONE; 
	wear = WEAR_TORSO; 
	visual = "ItAr_VLKBabe.3DS"; 
	visual_change = "SRN_ARMOR_G1_v4.ASC"; 
	visual_skin = 0; 
	material = MAT_LEATHER; 
	description = name; 
	inv_animate = 0;
}; 
 
instance armr_G1_v5(C_Item) 
{ 
	name = "Одежда";  
	mainflag = ITEM_KAT_ARMOR; 
	flags = ITEM_MISSION; 
  	protection[PROT_EDGE] = 10; 
  	protection[PROT_BLUNT] = 0; 
  	protection[PROT_POINT] = 0; 
  	protection[PROT_FIRE] = 0; 
  	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_NONE; 
	wear = WEAR_TORSO; 
	visual = "ItAr_VLKBabe.3DS"; 
  	visual_change = "SRN_ARMOR_G1_v5.ASC"; 
	visual_skin = 0; 
	material = MAT_LEATHER; 
	description = name; 
	inv_animate = 0;
}; 
 
instance armr_G1_v6(C_Item) 
{ 
	name = "Одежда"; 
	mainflag = ITEM_KAT_ARMOR; 
	flags = ITEM_MISSION; 
  	protection[PROT_EDGE] = 10; 
  	protection[PROT_BLUNT] = 0; 
  	protection[PROT_POINT] = 0; 
  	protection[PROT_FIRE] = 0; 
  	protection[PROT_MAGIC] = 0;
	//value = VALUE_ITAR_NONE; 
	wear = WEAR_TORSO; 
	visual = "ItAr_VLKBabe.3DS"; 
	visual_change = "SRN_ARMOR_G1_v6.ASC"; 
	visual_skin = 0; 
	material = MAT_LEATHER; 
	description = name; 
	inv_animate = 0;
}; 
 
instance ItAr_Abigal(C_Item) 
{ 
	name = "Доспехи Абигаль"; 
	mainflag = ITEM_KAT_ARMOR; 
	flags = ITEM_MISSION; 
  	protection[PROT_EDGE] = 80; 
  	protection[PROT_BLUNT] = 80; 
  	protection[PROT_POINT] = 50; 
  	protection[PROT_FIRE] = 20; 
  	protection[PROT_MAGIC] = 20;
	//value = VALUE_ITAR_NONE; 
	wear = WEAR_TORSO; 
	visual = "ItAr_VLKBabe.3DS"; 
	visual_change = "ARMOR_W2_VES.ASC"; 
	visual_skin = 0; 
	material = MAT_LEATHER; 
	description = name; 
	inv_animate = 0;
}; 
 
instance armr_G1_v7(C_Item) 
{ 
	name = ""; 
	mainflag = ITEM_KAT_ARMOR; 
	flags = ITEM_MISSION; 
	protection[PROT_EDGE] = 0; 
	protection[PROT_BLUNT] = 0; 
	protection[PROT_POINT] = 0; 
	protection[PROT_FIRE] = 0; 
	protection[PROT_MAGIC] = 0; 
	//value = 100; 
	wear = WEAR_TORSO; 
	visual = "ItAr_VLKBabe.3DS"; 
	visual_change = "SRN_ARMOR_V0.ASC"; 
	visual_skin = 0; 
	material = MAT_LEATHER; 
	description = name; 
	inv_animate = 0;
}; 

instance ITAR_NADJA_ADDON(C_Item)
{
	name = "Корсет";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	//value = 10;
	wear = WEAR_TORSO;
	visual = "ItAr_CHAOS_ADDON.3ds";
	visual_change = "HUM_BODY_NADJA.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_BARON_BABE_ADDON(C_Item)
{
	name = "Женское белье";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	//value = 10;
	wear = WEAR_TORSO;
	visual = "ItAr_CHAOS_ADDON.3ds";
	visual_change = "HUM_BARON_BABE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ItAr_Priscilla(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 10;
	//value = 10;
	wear = WEAR_TORSO;
	visual = "ItAr_CHAOS_ADDON.3ds";
	visual_change = "HUM_BODY_LUCIA.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

instance ITAR_W2_VES(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	//value = 100;
	wear = WEAR_TORSO;
	visual = "ItAr_CHAOS_ADDON.3ds";
	visual_change = "ARMOR_W2_VES.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_otherarmor;
	description = name;
	inv_animate = 0;
};

instance ItAr_Jax(C_Item)
{
	name = "Тело бойца";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 12;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_MAGIC];
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_L.3DS";
	on_equip = equip_otherarmor;
	visual_change = "PIRANHA_JAX_WARRIOR.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	inv_animate = 0;
};

func void Equip_BloodArmor()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		ChechWeightArmor = TRUE;
		BloodArmorBonus = TRUE;
		AI_Print("Вам дарована особенная способность - 'Высасывание сил'!");
		Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	};
};

func void UnEquip_BloodArmor()
{
	if(Npc_IsPlayer(self))
	{
		BloodArmorBonus = FALSE;
	};
};

func void Equip_WaterRobe()
{
	if(Npc_IsPlayer(self))
	{
		if(self.guild == GIL_KDW)
		{
			WaterRobeBonus = TRUE;
			AI_Print("Вам дарована особенная способность - 'Духовное восстановление'!");
			Wld_PlayEffect("SPELLFX_HEALSHRINE",self,self,0,0,0,FALSE);
		};

		Snd_Play3d(hero,"EQUIP_ARMOR_01");
		ChechWeightArmor = TRUE;
		MageRobeIsUp = TRUE;
	};
};

func void UnEquip_WaterRobe()
{
	if(Npc_IsPlayer(self))
	{
		WaterRobeBonus = FALSE;
		MageRobeIsUp = FALSE;
	};
};

instance ITAR_STTP_01(C_Item)
{
	name = "Тяжелая кольчуга призрака";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 115;
	protection[PROT_BLUNT] = 105;
	protection[PROT_POINT] = 90;
	protection[PROT_FLY] = 10;
	cond_atr[0] = SKL_STAMINA;
	cond_value[0] = 25;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 175;
	weight = 2;
	value = Waffenbonus_10;
	wear = WEAR_TORSO;
	visual = "ItAr_Diego.3ds";
	on_equip = equip_chiefarmor_g1;
	on_unequip = unequip_chiefarmor_g1;
	visual_change = "Armor_Diego.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Требуется ловкости: 175| Требуется выносливости: 250";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_WieldBonus1H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_WieldBowBonus;
	count[5] = Waffenbonus_10;
	inv_animate = 0;
};

func void equip_chiefarmor_g1()
{
	if(Npc_IsPlayer(self))
	{
		if(FingersBonus == FALSE)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_10);
			B_AddFightSkill(self,NPC_TALENT_BOW,Waffenbonus_10);
			FingersBonus = TRUE;
		};
		if(IS_LOVCACH_ARMOR == FALSE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_01;
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_02;
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_03;
			};
	
			IS_LOVCACH_ARMOR = TRUE;
			ChechWeightArmor = TRUE;
			FingersBonus = TRUE;
		};
	};
};

func void unequip_chiefarmor_g1()
{
	if(Npc_IsPlayer(self))
	{
		if(FingersBonus == TRUE)
		{
			B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_10);
			B_AddFightSkill(self,NPC_TALENT_BOW,-Waffenbonus_10);
			FingersBonus = FALSE;
		};
		if(IS_LOVCACH_ARMOR == TRUE)
		{
			if(THF_Equipped_01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_01);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_01;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_02);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_02;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			}
			else if(THF_Equipped_03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_03);
				Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_03;

				if(Delta_Bonus_Dex < 0)
				{
					Delta_Bonus_Dex = 0;
				};
			};

			IS_LOVCACH_ARMOR = FALSE;
		};
	};
};
