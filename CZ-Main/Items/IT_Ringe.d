/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

instance ITRI_GUARDIANS_01 - upraveny výpisy
instance ITRI_GUARDIANS_02 - upraveny výpisy
instance ITRI_NARUS - upraveny výpisy
instance ITRI_UDARGIFT - upraveny výpisy

*/




const int Value_Ri_ProtFire = 250;
const int Ri_ProtFire = 5;
const int Value_Ri_ProtEdge = 250;
const int Ri_ProtEdge = 5;
const int Value_Ri_ProtMage = 250;
const int Ri_ProtMage = 5;
const int Value_Ri_ProtPoint = 250;
const int Ri_ProtPoint = 5;
const int Value_Ri_ProtFire02 = 500;
const int Ri_ProtFire02 = 10;
const int Value_Ri_ProtFire03 = 1000;
const int Ri_ProtFire03 = 15;
const int Value_Ri_ProtEdge02 = 500;
const int Ri_ProtEdge02 = 10;
const int Value_Ri_ProtMage02 = 500;
const int Ri_ProtMage02 = 10;
const int Value_Ri_ProtPoint02 = 500;
const int Ri_ProtPoint02 = 10;
const int Value_Ri_ProtTotal = 600;
const int Ri_TProtFire = 5;
const int Ri_TProtEdge = 5;
const int Ri_TProtMage = 5;
const int Ri_TProtPoint = 5;
const int Value_Ri_ProtTotal02 = 1000;
const int Ri_TProtFire02 = 10;
const int Ri_TProtEdge02 = 10;
const int Ri_TProtMage02 = 10;
const int Ri_TProtPoint02 = 10;
const int Value_Ri_Dex = 300;
const int Ri_Dex = 2;
const int Value_Ri_Dex02 = 500;
const int Ri_Dex02 = 4;
const int VALUE_RI_DEX03 = 1000;
const int RI_DEX03 = 6;
const int VALUE_RI_DEX04 = 2000;
const int RI_DEX04 = 8;
const int VALUE_RI_STR04 = 1500;
const int RI_STR04 = 8;
const int Value_Ri_Mana = 500;
const int Ri_Mana = 5;
const int Value_Ri_Mana02 = 1000;
const int Ri_Mana02 = 10;
const int Value_Ri_Strg = 300;
const int Ri_Strg = 2;
const int Value_Ri_Strg02 = 500;
const int Ri_Strg02 = 4;
const int Value_Ri_Hp = 200;
const int Ri_Hp = 10;
const int Value_Ri_Hp02 = 400;
const int Ri_Hp02 = 20;
const int Value_Ri_HpMana = 1300;
const int Ri_HpMana_Hp = 20;
const int Ri_HpMana_Mana = 10;
const int Value_Ri_DexStrg = 800;
const int Ri_DexStrg_Dex = 3;
const int Ri_DexStrg_Strg = 3;
const int RI_TPROTVEPR = 10;
const int RI_TPROTINNOSJUDGE = 10;
const int RI_TPROTINNOSJUDGETWO = 15;
const int RI_PROTMAGE_GUARD_01 = 15;
const int RI_PROTMAGE_GUARD_02 = 30;
const int RI_MANA_NARUS = 30;
const int RI_DEXSTRG_STRG_UDAR = 20;
const int RI_FELLANGOR = 15;
const int RI_FELLANGOR_MAGIC = 30;
const int Ri_OreBarons = 3;

const int Ri_Dex_Steel = 10;
const int Ri_Str_Steel = 10;
const int Ri_Mana_Steel = 15;
const int Ri_Int_Steel = 5;
const int Ri_HP_Steel = 25;
const int Ri_Stamina_Steel = 5;
const int Ri_Prot_Steel = 5;
const int Ri_ProtAll_Steel = 10;

const int Ri_Dex_Gold = 15;
const int Ri_Str_Gold = 15;
const int Ri_Mana_Gold = 30;
const int Ri_Int_Gold = 10;
const int Ri_HP_Gold = 50;
const int Ri_Stamina_Gold = 10;
const int Ri_Prot_Gold = 10;
const int Ri_ProtAll_Gold = 20;

const int Ri_Dex_Ore = 20;
const int Ri_Str_Ore = 20;
const int Ri_Mana_Ore = 45;
const int Ri_Int_Ore = 15;
const int Ri_HP_Ore = 100;
const int Ri_Stamina_Ore = 15;
const int Ri_Prot_Ore = 15;
const int Ri_ProtAll_Ore = 30;

const int Am_Dex_Ore = 25;
const int Am_Str_Ore = 25;
const int Am_Mana_Ore = 60;
const int Am_Int_Ore = 20;
const int Am_HP_Ore = 150;
const int Am_Stamina_Ore = 20;
const int Am_Prot_Ore = 20;
const int Am_ProtAll_Ore = 40;

const int Am_Str_Imarah = 10;
const int Am_Prot_Imarah_Mag = 5;
const int Am_Prot_Imarah_Edge = 10;
const int Am_Int_Imarah = 5;
const int Am_HP_Imarah = 50;

const int Ri_Fly_Steel = 20;
const int Ri_Fly_Steel_Clr = 2;
const int Ri_Fly_Gold = 30;
const int Ri_Fly_Gold_Clr = 3;
const int Ri_Fly_Ore = 40;
const int Ri_Fly_Ore_Clr = 4;
const int Am_Fly_Ore = 60;
const int Am_Fly_Ore_Clr = 6;

var string wp_vatras;
var int is_wp_vatras;
var string wp;

const int Value_ItAm_Addon_Franco = 300;
const int Value_ItRi_Addon_Health_01 = 250;
const int Value_ItAm_Addon_Health = 250;
const int Value_ItRi_Addon_Mana_01 = 600;
const int Value_ItAm_Addon_Mana = 600;
const int Value_ItRi_Addon_STR_01 = 200;
const int Value_ItAm_Addon_STR = 200;

const int HP_ItAm_Addon_Franco = 10;
const int STR_Franco = 3;
const int DEX_Franco = 3;

const int HP_Ring_Solo_Bonus = 5;
const int HP_Ring_Double_Bonus = 15;
const int HP_Amulett_Solo_Bonus = 10;
const int HP_Amulett_EinRing_Bonus = 20;
const int HP_Amulett_Artefakt_Bonus = 40;
const int MA_Ring_Solo_Bonus = 5;
const int MA_Ring_Double_Bonus = 15;
const int MA_Amulett_Solo_Bonus = 10;
const int MA_Amulett_EinRing_Bonus = 20;
const int MA_Amulett_Artefakt_Bonus = 40;
const int STR_Ring_Solo_Bonus = 5;
const int STR_Ring_Double_Bonus = 15;
const int STR_Amulett_Solo_Bonus = 10;
const int STR_Amulett_EinRing_Bonus = 20;
const int STR_Amulett_Artefakt_Bonus = 40;
const int Value_Am_ProtFire = 600;
const int Am_ProtFire = 5;
const int AMORC_PROTFIRE = 10;
const int Value_Am_ProtEdge = 800;
const int Am_ProtEdge = 5;
const int Value_Am_ProtMage = 700;
const int Am_ProtMage = 5;
const int Value_Am_ProtPoint = 500;
const int Am_ProtPoint = 5;
const int Value_Am_ProtTotal = 1000;
const int Am_TProtFire = 5;
const int AM_TProtEdge = 5;
const int Am_TProtMage = 5;
const int Am_TProtPoint = 5;
const int Value_Am_Dex = 1000;
const int Am_Dex = 3;
const int Value_Am_Mana = 1000;
const int Am_Mana = 5;
const int Value_Am_Strg = 1000;
const int Am_Strg = 3;
const int Value_Am_Hp = 400;
const int Am_Hp = 10;
const int Value_Am_HpMana = 1300;
const int Am_HpMana_Hp = 10;
const int Am_HpMana_Mana = 15;
const int Value_Am_DexStrg = 1600;
const int Am_DexStrg_Dex = 5;
const int Am_DexStrg_Strg = 5;
const int AM_BENKENOB_01 = 10;
const int AM_BENKENOB_02 = 10;
const int AM_IRDORAT = 75;

//-----------------Kol'tsa brat'yev----------------------

const int Ri_Mana_Ihiyal = 30;
const int Ri_HP_Ihiyal = 15;
const int Ri_Mana_Izulg= 15;
const int Ri_HP_Izulg = 30;


instance ITAM_ORCAMULET(C_Item)
{
	name = "Skřetí talisman";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 700;
	visual = "ItMi_Amulet_Ulumulu_01.3DS";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_orcamulet;
	on_unequip = unequip_itam_orcamulet;
	wear = WEAR_EFFECT;
	description = "Skřetí talisman";
	text[2] = NAME_Prot_Fire;
	count[2] = AMORC_PROTFIRE;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void equip_itam_orcamulet()
{
	self.protection[PROT_FIRE] += AMORC_PROTFIRE;
};

func void unequip_itam_orcamulet()
{
	self.protection[PROT_FIRE] -= AMORC_PROTFIRE;
};

instance ItAm_Prot_Fire_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_ProtFire;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Fire_01;
	on_unequip = UnEquip_ItAm_Prot_Fire_01;
	wear = WEAR_EFFECT;
	description = "Amulet ohně";
	text[2] = NAME_Prot_Fire;
	count[2] = Am_ProtFire;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Prot_Fire_01()
{
	self.protection[PROT_FIRE] += Am_ProtFire;
};

func void UnEquip_ItAm_Prot_Fire_01()
{
	self.protection[PROT_FIRE] -= Am_ProtFire;
};

instance ItAm_Prot_Edge_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_ProtEdge;
	visual = "ItAm_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Edge_01;
	on_unequip = UnEquip_ItAm_Prot_Edge_01;
	wear = WEAR_EFFECT;
	description = "Amulet zbroje";
	text[2] = NAME_Prot_Edge;
	count[2] = Am_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Prot_Edge_01()
{
	self.protection[PROT_EDGE] += Am_ProtEdge;
};

func void UnEquip_ItAm_Prot_Edge_01()
{
	self.protection[PROT_EDGE] -= Am_ProtEdge;
};

instance ItAm_Prot_Point_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_ProtPoint;
	visual = "ItAm_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Point_01;
	on_unequip = UnEquip_ItAm_Prot_Point_01;
	wear = WEAR_EFFECT;
	description = "Amulet dřevěné kůže";
	text[2] = NAME_Prot_Blunt;
	count[2] = Am_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Prot_Point_01()
{
	self.protection[PROT_BLUNT] += Am_ProtEdge;
};

func void UnEquip_ItAm_Prot_Point_01()
{
	self.protection[PROT_BLUNT] -= Am_ProtEdge;
};

instance ItAm_Prot_Mage_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_ProtMage;
	visual = "ItAm_Prot_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Mage_01;
	on_unequip = UnEquip_ItAm_Prot_Mage_01;
	wear = WEAR_EFFECT;
	description = "Amulet duchovní síly";
	text[2] = NAME_Prot_Magic;
	count[2] = Am_ProtMage;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] += Am_ProtMage;
};

func void UnEquip_ItAm_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] -= Am_ProtMage;
};

instance ItAm_Prot_Total_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_ProtTotal;
	visual = "ItAm_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Value_Am_ProtTotal;
	on_unequip = UnEquip_Value_Am_ProtTotal;
	wear = WEAR_EFFECT;
	description = "Amulet rudné kůže";
	text[1] = NAME_Prot_Edge;
	count[1] = AM_TProtEdge;
	text[2] = NAME_Prot_Blunt;
	count[2] = AM_TProtEdge;
	text[3] = NAME_Prot_Point;
	count[3] = Am_TProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_Value_Am_ProtTotal()
{
	self.protection[PROT_EDGE] += AM_TProtEdge;
	self.protection[PROT_BLUNT] += AM_TProtEdge;
	self.protection[PROT_POINT] += Am_TProtPoint;
};

func void UnEquip_Value_Am_ProtTotal()
{
	self.protection[PROT_EDGE] -= AM_TProtEdge;
	self.protection[PROT_BLUNT] -= AM_TProtEdge;
	self.protection[PROT_POINT] -= Am_TProtPoint;
};

instance ItAm_Dex_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_Dex;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Dex_01;
	on_unequip = UnEquip_ItAm_Dex_01;
	wear = WEAR_EFFECT;
	description = "Amulet obratnosti";
	text[2] = NAME_Bonus_Dex;
	count[2] = Am_Dex;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Am_Dex);
	Delta_Bonus_Dex = Delta_Bonus_Dex + Am_Dex;
};

func void UnEquip_ItAm_Dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Am_Dex);
	Delta_Bonus_Dex = Delta_Bonus_Dex - Am_Dex;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};


instance ItAm_Strg_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_Strg;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Strg_01;
	on_unequip = UnEquip_ItAm_Strg_01;
	wear = WEAR_EFFECT;
	description = "Amulet síly";
	text[2] = NAME_Bonus_Str;
	count[2] = Am_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Am_Strg);
	Delta_Bonus_Str = Delta_Bonus_Str + Am_Strg;
};

func void UnEquip_ItAm_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Am_Strg);
	Delta_Bonus_Str = Delta_Bonus_Str - Am_Strg;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};


instance ItAm_Hp_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_Hp;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Hp_01;
	on_unequip = UnEquip_ItAm_Hp_01;
	wear = WEAR_EFFECT;
	description = "Amulet života";
	text[2] = NAME_Bonus_HpMax;
	count[2] = Am_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Am_Hp;
};

func void UnEquip_ItAm_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Am_Hp;
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ItAm_Mana_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_Mana;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Mana_01;
	on_unequip = UnEquip_ItAm_Mana_01;
	wear = WEAR_EFFECT;
	description = "Amulet magie";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = Am_Mana;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Am_Mana;
};

func void UnEquip_ItAm_Mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Am_Mana;
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ItAm_Dex_Strg_01(C_Item)
{
	name = "Amulet moci";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_DexStrg;
	visual = "ItAm_Dex_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Dex_Strg_01;
	on_unequip = UnEquip_ItAm_Dex_Strg_01;
	wear = WEAR_EFFECT;
	description = "Amulet moci";
	text[2] = NAME_Bonus_Dex;
	count[2] = Am_DexStrg_Dex;
	text[3] = NAME_Bonus_Str;
	count[3] = Am_DexStrg_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Am_DexStrg_Dex);
	Npc_ChangeAttribute(self,ATR_STRENGTH,Am_DexStrg_Strg);
	Delta_Bonus_Str = Delta_Bonus_Str + Am_DexStrg_Strg;
	Delta_Bonus_Dex = Delta_Bonus_Dex + Am_DexStrg_Dex;
};

func void UnEquip_ItAm_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Am_DexStrg_Dex);
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Am_DexStrg_Strg);
	Delta_Bonus_Str = Delta_Bonus_Str - Am_DexStrg_Strg;
	Delta_Bonus_Dex = Delta_Bonus_Dex - Am_DexStrg_Dex;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItAm_Hp_Mana_01(C_Item)
{
	name = "Amulet osvícení";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 2000;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Hp_Mana_01;
	on_unequip = UnEquip_ItAm_Hp_Mana_01;
	wear = WEAR_EFFECT;
	description = "Amulet osvícení";
	text[2] = NAME_Bonus_HpMax;
	count[2] = Am_HpMana_Hp;
	text[3] = NAME_Bonus_ManaMax;
	count[3] = Am_HpMana_Mana;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Hp_Mana_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Am_HpMana_Hp;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Am_HpMana_Mana;
};

func void UnEquip_ItAm_Hp_Mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Am_HpMana_Mana;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Am_HpMana_Hp;
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

instance ITAM_IRDORAT(C_Item)
{
	name = "Amulet z Irdorathu";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION | ITEM_AMULET;
	value = 10000;
	visual = "ITAM_IRDORAT_SKY.3ds";
	material = MAT_STONE;
	on_equip = equip_itam_irdorat;
	on_unequip = unequip_itam_irdorat;
	wear = WEAR_EFFECT;
	description = name;
	text[1] = NAME_Prot_Magic;
	count[1] = AM_IRDORAT;
	text[4] = "Na amuletu jsou vyryté prastaré runy...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void equip_itam_irdorat()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	hero.protection[PROT_MAGIC] += AM_IRDORAT;
};

func void unequip_itam_irdorat()
{
	hero.protection[PROT_MAGIC] -= AM_IRDORAT;
};

instance ITAM_BENKENOB(C_Item)
{
	name = "Amulet lovce";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 2000;
	visual = "ITAM_BENKENOB_SKY.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_benkenob;
	on_unequip = unequip_itam_benkenob;
	wear = WEAR_EFFECT;
	description = "Amulet lovce";
	text[2] = NAME_ADDON_BONUS_BOW;
	count[2] = AM_BENKENOB_02;
	text[4] = "Na rubu jsou napsaná slova 'BEN KENOB'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void equip_itam_benkenob()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(hero,NPC_TALENT_BOW,AM_BENKENOB_02);
	};
};

func void unequip_itam_benkenob()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(hero,NPC_TALENT_BOW,-AM_BENKENOB_02);
	};
};

instance ITAM_ZIGOSMAGIC(C_Item)
{
	name = "Magický amulet";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 10;
	visual = "ITAM_ZIGOSMAGIC_SKY.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_zigosmagic;
	on_unequip = unequip_itam_zigosmagic;
	wear = WEAR_EFFECT;
	description = "Zigosův amulet";
	text[4] = "Prastarý artefakt Beliarova vyslance...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void equip_itam_zigosmagic()
{
	ZIGOSMAGICISON = TRUE;
};

func void unequip_itam_zigosmagic()
{
	ZIGOSMAGICISON = FALSE;
};

instance ItAm_Addon_Franco(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_ItAm_Addon_Franco;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Addon_Franco;
	on_unequip = UnEquip_ItAm_Addon_Franco;
	wear = WEAR_EFFECT;
	description = "Francův amulet";
	text[2] = NAME_Bonus_Str;
	count[2] = STR_Franco;
	text[3] = NAME_Bonus_Dex;
	count[3] = DEX_Franco;
	text[4] = NAME_Bonus_HpMax;
	count[4] = HP_ItAm_Addon_Franco;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Addon_Franco()
{
	self.attribute[ATR_STRENGTH] += STR_Franco;
	self.attribute[ATR_DEXTERITY] += DEX_Franco;
	self.attribute[ATR_HITPOINTS_MAX] += HP_ItAm_Addon_Franco;
	Delta_Bonus_Str = Delta_Bonus_Str + STR_Franco;
	Delta_Bonus_Dex = Delta_Bonus_Dex + DEX_Franco;
};

func void UnEquip_ItAm_Addon_Franco()
{
	self.attribute[ATR_STRENGTH] -= STR_Franco;
	self.attribute[ATR_DEXTERITY] -= DEX_Franco;
	self.attribute[ATR_HITPOINTS_MAX] -= HP_ItAm_Addon_Franco;
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};

	Delta_Bonus_Str = Delta_Bonus_Str - STR_Franco;
	Delta_Bonus_Dex = Delta_Bonus_Dex - DEX_Franco;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};


instance ItAm_Addon_Health(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_ItAm_Addon_Health;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Addon_Health;
	on_unequip = UnEquip_ItAm_Addon_Health;
	wear = WEAR_EFFECT;
	description = "Prastarý amulet léčitelů";
	text[2] = NAME_Bonus_HpMax;
	count[2] = HP_Amulett_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Addon_Health()
{
	var int OldValue;
	var int NewValue;

	OldValue = C_HP_ArtefaktValue();
	HP_Amulett_Equipped = TRUE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

func void UnEquip_ItAm_Addon_Health()
{
	var int OldValue;
	var int NewValue;

	OldValue = C_HP_ArtefaktValue();
	HP_Amulett_Equipped = FALSE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ItRi_Addon_Health_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_ItRi_Addon_Health_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_Health_01;
	on_unequip = UnEquip_ItRi_Addon_Health_01;
	wear = WEAR_EFFECT;
	description = "Prastarý prsten léčitelů";
	text[2] = NAME_Bonus_HpMax;
	count[2] = HP_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Addon_Health_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Ring_1_Equipped = TRUE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

func void UnEquip_ItRi_Addon_Health_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Ring_1_Equipped = FALSE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ItRi_Addon_Health_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_ItRi_Addon_Health_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_Health_02;
	on_unequip = UnEquip_ItRi_Addon_Health_02;
	wear = WEAR_EFFECT;
	description = "Prastarý prsten léčitelů";
	text[2] = NAME_Bonus_HpMax;
	count[2] = HP_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Addon_Health_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Ring_2_Equipped = TRUE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

func void UnEquip_ItRi_Addon_Health_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_HP_ArtefaktValue();
	HP_Ring_2_Equipped = FALSE;
	NewValue = C_HP_ArtefaktValue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ItAm_Addon_MANA(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_ItAm_Addon_Mana;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Addon_MANA;
	on_unequip = UnEquip_ItAm_Addon_MANA;
	wear = WEAR_EFFECT;
	description = "Prastarý amulet kněží";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = MA_Amulett_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Addon_MANA()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Amulett_Equipped = TRUE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

func void UnEquip_ItAm_Addon_MANA()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Amulett_Equipped = FALSE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ItRi_Addon_MANA_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_ItRi_Addon_Mana_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_MANA_01;
	on_unequip = UnEquip_ItRi_Addon_MANA_01;
	wear = WEAR_EFFECT;
	description = "Prastarý prsten kněží";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = MA_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Addon_MANA_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Ring_1_Equipped = TRUE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

func void UnEquip_ItRi_Addon_MANA_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Ring_1_Equipped = FALSE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ItRi_Addon_MANA_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_ItRi_Addon_Mana_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_MANA_02;
	on_unequip = UnEquip_ItRi_Addon_MANA_02;
	wear = WEAR_EFFECT;
	description = "Prastarý prsten kněží";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = MA_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Addon_MANA_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Ring_2_Equipped = TRUE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

func void UnEquip_ItRi_Addon_MANA_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_MA_ArtefaktValue();
	MA_Ring_2_Equipped = FALSE;
	NewValue = C_MA_ArtefaktValue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ItAm_Addon_STR(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_ItAm_Addon_STR;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Addon_STR;
	on_unequip = UnEquip_ItAm_Addon_STR;
	wear = WEAR_EFFECT;
	description = "Prastarý amulet válečníků";
	text[2] = NAME_Prot_Phis;
	count[2] = STR_Amulett_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_Addon_STR()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Amulett_Equipped = TRUE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};

func void UnEquip_ItAm_Addon_STR()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Amulett_Equipped = FALSE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};


instance ItRi_Addon_STR_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_ItRi_Addon_STR_01;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_STR_01;
	on_unequip = UnEquip_ItRi_Addon_STR_01;
	wear = WEAR_EFFECT;
	description = "Prastarý prsten válečníků";
	text[2] = NAME_Prot_Phis;
	count[2] = STR_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Addon_STR_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Ring_1_Equipped = TRUE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};

func void UnEquip_ItRi_Addon_STR_01()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Ring_1_Equipped = FALSE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};


instance ItRi_Addon_STR_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_ItRi_Addon_STR_01;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Addon_STR_02;
	on_unequip = UnEquip_ItRi_Addon_STR_02;
	wear = WEAR_EFFECT;
	description = "Prastarý prsten válečníků";
	text[2] = NAME_Prot_Phis;
	count[2] = STR_Ring_Solo_Bonus;
	text[3] = PRINT_Addon_KUMU_01;
	text[4] = PRINT_Addon_KUMU_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Addon_STR_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Ring_2_Equipped = TRUE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};

func void UnEquip_ItRi_Addon_STR_02()
{
	var int OldValue;
	var int NewValue;
	OldValue = C_STR_ArtefaktValue();
	STR_Ring_2_Equipped = FALSE;
	NewValue = C_STR_ArtefaktValue();
	self.protection[PROT_EDGE] += NewValue - OldValue;
	self.protection[PROT_BLUNT] += NewValue - OldValue;
};

instance ItAm_MasiafKey(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ITAM_MASIAF_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_MasiafKey;
	on_unequip = UnEquip_MasiafKey;
	wear = WEAR_EFFECT;
	description = "Amulet stína";
	text[3] = "Tenhle podivný amulet jsem našel u jednoho z vrahů,";
	text[4] = "kteří zaútočili na tábor sběračů trávy z bažin...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ItKe_Masiaf_Open(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ITAM_MASIAF_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_MasiafKey;
	on_unequip = UnEquip_MasiafKey;
	wear = WEAR_EFFECT;
	description = "Amulet stína";
	text[3] = "Tenhle podivný amulet jsem našel u jednoho z vrahů,";
	text[4] = "kteří zaútočili na tábor sběračů trávy z bažin...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_MasiafKey()
{
	Wld_PlayEffect("SPELLFX_LIGHTSTAR_GREEN",self,self,0,0,0,FALSE);
};

func void UnEquip_MasiafKey()
{

};

instance ItKe_AniTest(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ITAM_MASIAF_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItKe_AniTest;
	on_unequip = UnEquip_ItKe_AniTest;
	wear = WEAR_EFFECT;
	description = "Amulet stína";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItKe_AniTest()
{
	if(Npc_IsPlayer(self))
	{
	};
};

func void UnEquip_ItKe_AniTest()
{

};

//-----------------------novyye amulety----------------------------


instance ItAm_Diamond(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItAm_Diamond.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItAm_Diamond;
	on_unequip = unequip_ItAm_Diamond;
	wear = WEAR_EFFECT;
	description = "Amulet s diamantem";
	text[1] = NAME_Prot_Phis;
	count[1] = Am_ProtAll_Ore;
	text[2] = NAME_Prot_Point;
	count[2] = Am_ProtAll_Ore;
	text[3] = NAME_Prot_Fire;
	count[3] = Am_ProtAll_Ore;
	text[4] = NAME_Prot_Magic;
	count[4] = Am_ProtAll_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Diamond()
{
	self.protection[PROT_EDGE] += Am_ProtAll_Ore;
	self.protection[PROT_BLUNT] += Am_ProtAll_Ore;
	self.protection[PROT_POINT] += Am_ProtAll_Ore;
	self.protection[PROT_FIRE] += Am_ProtAll_Ore;
	self.protection[PROT_MAGIC] += Am_ProtAll_Ore;
};

func void UnEquip_ItAm_Diamond()
{
	self.protection[PROT_EDGE] -= Am_ProtAll_Ore;
	self.protection[PROT_BLUNT] -= Am_ProtAll_Ore;
	self.protection[PROT_POINT] -= Am_ProtAll_Ore;
	self.protection[PROT_FIRE] -= Am_ProtAll_Ore;
	self.protection[PROT_MAGIC] -= Am_ProtAll_Ore;
};

instance ItAm_Ruby(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItAm_Ruby.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItAm_Ruby;
	on_unequip = unequip_ItAm_Ruby;
	wear = WEAR_EFFECT;
	description = "Amulet s rubínem";
	text[2] = NAME_Bonus_Str;
	count[2] = Am_Str_Ore;
	text[3] = NAME_Prot_Phis;
	count[3] = Am_Prot_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Ruby()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Am_Str_Ore);
	Delta_Bonus_Str = Delta_Bonus_Str + Am_Str_Ore;

	self.protection[PROT_EDGE] += Am_Prot_Ore;
	self.protection[PROT_BLUNT] += Am_Prot_Ore;
};

func void UnEquip_ItAm_Ruby()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Am_Str_Ore);
	Delta_Bonus_Str = Delta_Bonus_Str - Am_Str_Ore;

	self.protection[PROT_EDGE] -= Am_Prot_Ore;
	self.protection[PROT_BLUNT] -= Am_Prot_Ore;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ItAm_Emerald(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItAm_Emerald.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItAm_Emerald;
	on_unequip = unequip_ItAm_Emerald;
	wear = WEAR_EFFECT;
	description = "Amulet se smaragdem";
	text[2] = NAME_Bonus_Dex;
	count[2] = Am_Dex_Ore;
	text[3] = NAME_Prot_Point;
	count[3] = Am_Prot_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Emerald()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Am_Dex_Ore);
	Delta_Bonus_Dex = Delta_Bonus_Dex + Am_Dex_Ore;

	self.protection[PROT_POINT] += Am_Prot_Ore;
};

func void UnEquip_ItAm_Emerald()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Am_Dex_Ore);
	Delta_Bonus_Dex = Delta_Bonus_Dex - Am_Dex_Ore;

	self.protection[PROT_POINT] -= Am_Prot_Ore;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItAm_Sapphire(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItAm_Sapphire.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItAm_Sapphire;
	on_unequip = unequip_ItAm_Sapphire;
	wear = WEAR_EFFECT;
	description = "Amulet se safírem";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = Am_Mana_Ore;
	text[3] = NAME_Bonus_IntStaff;
	count[3] = Am_Int_Ore;
	text[4] = NAME_Prot_Magic;
	count[4] = Am_Prot_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Sapphire()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Am_Mana_Ore;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Am_Mana_Ore;
	self.protection[PROT_MAGIC] += Am_Prot_Ore;
	ATR_INTELLECT += Am_Int_Ore;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

func void UnEquip_ItAm_Sapphire()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Am_Mana_Ore;
	self.protection[PROT_MAGIC] -= Am_Prot_Ore;

	if(self.attribute[ATR_MANA] >= Am_Mana_Ore)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Am_Mana_Ore;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};

	ATR_INTELLECT -= Am_Int_Ore;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

instance ItAm_Opal(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItAm_Opal.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItAm_Opal;
	on_unequip = unequip_ItAm_Opal;
	wear = WEAR_EFFECT;
	description = "Amulet s opálem";
	text[2] = NAME_Bonus_HpMax;
	count[2] = Am_HP_Ore;
	text[3] = NAME_Prot_Fire;
	count[3] = Am_Prot_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Opal()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Am_HP_Ore;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Am_HP_Ore;
	self.protection[PROT_FIRE] += Am_Prot_Ore;
};

func void UnEquip_ItAm_Opal()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Am_HP_Ore;
	self.protection[PROT_FIRE] -= Am_Prot_Ore;

	if(self.attribute[ATR_HITPOINTS] >= Am_HP_Ore)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Am_HP_Ore;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

instance ItAm_Topaz(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItAm_Topaz.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItAm_Topaz;
	on_unequip = unequip_ItAm_Topaz;
	wear = WEAR_EFFECT;
	description = "Amulet s topazem";
	text[2] = NAME_Bonus_Stam;
	count[2] = Am_Stamina_Ore;
	text[3] = NAME_Bonus_Fly;
	count[3] = Am_Fly_Ore_Clr;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Topaz()
{
	var int tmpStam;
	var int tmpStamOPBonus;

	self.protection[PROT_FLY] += Am_Fly_Ore;

	tmpStam = ATR_STAMINA_MAX[0] + Am_Stamina_Ore;

	if(tmpStam > 100)
	{
		tmpStamOPBonus = tmpStam - 100;
		tmpStamSaveOreAmulet = Am_Stamina_Ore - tmpStamOPBonus;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + tmpStamSaveOreAmulet;
		ATR_STAMINA[0] = ATR_STAMINA[0] + (tmpStamSaveOreAmulet * 10);
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	}
	else
	{
		tmpStamSaveOreAmulet = Am_Stamina_Ore;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + tmpStamSaveOreAmulet;
		ATR_STAMINA[0] = ATR_STAMINA[0] + (tmpStamSaveOreAmulet * 10);
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	};
};

func void UnEquip_ItAm_Topaz()
{
	self.protection[PROT_FLY] -= Am_Fly_Ore;
	ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] - tmpStamSaveOreAmulet;
	Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);

	if(ATR_STAMINA[0] >= (tmpStamSaveOreAmulet * 10))
	{
		ATR_STAMINA[0] = ATR_STAMINA[0] - (tmpStamSaveOreAmulet * 10);
	}
	else
	{
		ATR_STAMINA[0] = 0;
	};
};

instance ITMI_DEADORCITEM(C_Item)
{
	name = "Prastarý skřetí totem";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 100;
	visual = "ItMi_OrcMainTotem.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	on_equip = equip_ITMI_DEADORCITEM;
	on_unequip = unequip_ITMI_DEADORCITEM;
	wear = WEAR_EFFECT;
	description = "Prastarý skřetí totem";
	text[4] = "Totem mrtvého skřeta z chrámu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ITMI_DEADORCITEM()
{
	ProtectHashGorAoe = TRUE;
};

func void UnEquip_ITMI_DEADORCITEM()
{
	ProtectHashGorAoe = FALSE;
};

instance ItAm_HashGor(C_Item)
{
	name = "Hash-Gorův amulet";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 100;
	visual = "ITAM_HASHGOR_SKY.3DS";
	visual_skin = 0;
	material = MAT_STONE;
	on_equip = equip_ItAm_HashGor;
	on_unequip = unequip_ItAm_HashGor;
	wear = WEAR_EFFECT;
	description = "Prastarý skřetí totem";
	text[0] = NAME_Bonus_HpMax;
	count[0] = 50;
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 25;
	text[2] = NAME_Prot_Fire;
	count[2] = 15;
	text[3] = NAME_Prot_Magic;
	count[3] = 10;
	text[4] = "Tenhle amulet patřil skřetímu šamanovi Hash-Gorovi...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_HashGor()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 50;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 50;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 25;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 25;
	self.protection[PROT_FIRE] += 15;
	self.protection[PROT_MAGIC] += 10;
};

func void UnEquip_ItAm_HashGor()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 50;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 25;
	self.protection[PROT_FIRE] -= 15;
	self.protection[PROT_MAGIC] -= 10;

	if(self.attribute[ATR_HITPOINTS] >= 50)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 50;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};
	if(self.attribute[ATR_MANA] >= 25)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 25;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

instance ItRi_Prot_Fire_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtFire;
	visual = "ItRi_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Fire_01;
	on_unequip = UnEquip_ItRi_Prot_Fire_01;
	wear = WEAR_EFFECT;
	description = "Prsten ochrany před ohněm";
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_ProtFire;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Fire_01()
{
	self.protection[PROT_FIRE] += Ri_ProtFire;
};

func void UnEquip_ItRi_Prot_Fire_01()
{
	self.protection[PROT_FIRE] -= Ri_ProtFire;
};


instance ITRI_LANZRING(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Fire_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = "Glantzův prsten";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITRI_TROKARRING(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 100;
	visual = "ItRi_Prot_Fire_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = "Trokarův prsten";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItRi_Prot_Fire_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtFire02;
	visual = "ItRi_Prot_Fire_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Fire_02;
	on_unequip = UnEquip_ItRi_Prot_Fire_02;
	wear = WEAR_EFFECT;
	description = "Prsten ohně";
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_ProtFire02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Fire_02()
{
	self.protection[PROT_FIRE] += Ri_ProtFire02;
};

func void UnEquip_ItRi_Prot_Fire_02()
{
	self.protection[PROT_FIRE] -= Ri_ProtFire02;
};

instance ItRi_Prot_Fire_03(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtFire03;
	visual = "ItRi_Prot_Fire_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Fire_03;
	on_unequip = UnEquip_ItRi_Prot_Fire_03;
	wear = WEAR_EFFECT;
	description = "Feomatharův prsten";
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_ProtFire03;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Prot_Fire_03()
{
	self.protection[PROT_FIRE] += Ri_ProtFire03;
};

func void UnEquip_ItRi_Prot_Fire_03()
{
	self.protection[PROT_FIRE] -= Ri_ProtFire03;
};

instance ItRi_Prot_Point_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01;
	on_unequip = UnEquip_ItRi_Prot_Point_01;
	wear = WEAR_EFFECT;
	description = "Prsten dřevěné kůže";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Point_01()
{
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01()
{
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItRi_Prot_Point_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint02;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_02;
	on_unequip = UnEquip_ItRi_Prot_Point_02;
	wear = WEAR_EFFECT;
	description = "Prsten kamenné kůže";
	text[2] = NAME_Prot_Blunt;
	count[2] = Ri_ProtPoint02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Point_02()
{
	self.protection[PROT_BLUNT] += Ri_ProtPoint02;
};

func void UnEquip_ItRi_Prot_Point_02()
{
	self.protection[PROT_BLUNT] -= Ri_ProtPoint02;
};

instance ItRi_Rod(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 200;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Rod;
	on_unequip = UnEquip_ItRi_Rod;
	wear = WEAR_EFFECT;
	description = "Rodův prsten";
	text[2] = NAME_BONUS_TWOHANDS;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Rod()
{
	B_AddFightSkill(self,NPC_TALENT_2H,5);
};

func void UnEquip_ItRi_Rod()
{
	B_AddFightSkill(self,NPC_TALENT_2H,-5);
};

instance ItRi_Prot_Edge_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Edge_01;
	on_unequip = UnEquip_ItRi_Prot_Edge_01;
	wear = WEAR_EFFECT;
	description = "Prsten železné kůže";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Edge_01()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge;
};

func void UnEquip_ItRi_Prot_Edge_01()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge;
};


instance ItRi_Prot_Edge_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtEdge02;
	visual = "ItRi_Prot_Edge_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Edge_02;
	on_unequip = UnEquip_ItRi_Prot_Edge_02;
	wear = WEAR_EFFECT;
	description = "Prsten rudné kůže";
	text[1] = NAME_Prot_Edge;
	count[1] = Ri_ProtEdge02;
	text[2] = NAME_Prot_Blunt;
	count[2] = Ri_ProtEdge02;
	text[3] = NAME_Prot_Point;
	count[3] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Edge_02()
{
	self.protection[PROT_EDGE] += Ri_ProtEdge02;
	self.protection[PROT_BLUNT] += Ri_ProtEdge02;
	self.protection[PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Edge_02()
{
	self.protection[PROT_EDGE] -= Ri_ProtEdge02;
	self.protection[PROT_BLUNT] -= Ri_ProtEdge02;
	self.protection[PROT_POINT] -= Ri_ProtPoint;
};


instance ItRi_Prot_Mage_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtMage;
	visual = "ItRi_Prot_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Mage_01;
	on_unequip = UnEquip_ItRi_Prot_Mage_01;
	wear = WEAR_EFFECT;
	description = "Prsten duchovní síly";
	text[2] = NAME_Prot_Magic;
	count[2] = Ri_ProtMage;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] += Ri_ProtMage;
};

func void UnEquip_ItRi_Prot_Mage_01()
{
	self.protection[PROT_MAGIC] -= Ri_ProtMage;
};


instance ItRi_Prot_Mage_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtMage02;
	visual = "ItRi_Prot_Mage_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Mage_02;
	on_unequip = UnEquip_ItRi_Prot_Mage_02;
	wear = WEAR_EFFECT;
	description = "Prsten obrany";
	text[2] = NAME_Prot_Magic;
	count[2] = Ri_ProtMage02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Mage_02()
{
	self.protection[PROT_MAGIC] += Ri_ProtMage02;
};

func void UnEquip_ItRi_Prot_Mage_02()
{
	self.protection[PROT_MAGIC] -= Ri_ProtMage02;
};


instance ItRi_Prot_Total_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtTotal;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Total_01;
	on_unequip = UnEquip_ItRi_Prot_Total_01;
	wear = WEAR_EFFECT;
	description = "Prsten neporazitelnosti";
	text[1] = NAME_Prot_Phis;
	count[1] = Ri_TProtEdge;
	text[2] = NAME_Prot_Point;
	count[2] = Ri_TProtPoint;
	text[3] = NAME_Prot_Fire;
	count[3] = Ri_TProtFire;
	text[4] = NAME_Prot_Magic;
	count[4] = Ri_TProtMage;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Total_01()
{
	self.protection[PROT_EDGE] += Ri_TProtEdge;
	self.protection[PROT_BLUNT] += Ri_TProtEdge;
	self.protection[PROT_POINT] += Ri_TProtPoint;
	self.protection[PROT_FIRE] += Ri_TProtFire;
	self.protection[PROT_MAGIC] += Ri_TProtMage;
};

func void UnEquip_ItRi_Prot_Total_01()
{
	self.protection[PROT_EDGE] -= Ri_TProtEdge;
	self.protection[PROT_BLUNT] -= Ri_TProtEdge;
	self.protection[PROT_POINT] -= Ri_TProtPoint;
	self.protection[PROT_FIRE] -= Ri_TProtFire;
	self.protection[PROT_MAGIC] -= Ri_TProtMage;
};


instance ItRi_Prot_Total_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtTotal02;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Total_02;
	on_unequip = UnEquip_ItRi_Prot_Total_02;
	wear = WEAR_EFFECT;
	description = "Prsten nepřemožitelnosti";
	text[1] = NAME_Prot_Phis;
	count[1] = RI_DEX04;
	text[2] = NAME_Prot_Point;
	count[2] = RI_DEX04;
	text[3] = NAME_Prot_Fire;
	count[3] = RI_DEX04;
	text[4] = NAME_Prot_Magic;
	count[4] = RI_DEX04;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Prot_Total_02()
{
	self.protection[PROT_EDGE] += RI_DEX04;
	self.protection[PROT_BLUNT] += RI_DEX04;
	self.protection[PROT_POINT] += RI_DEX04;
	self.protection[PROT_FIRE] += RI_DEX04;
	self.protection[PROT_MAGIC] += RI_DEX04;
};

func void UnEquip_ItRi_Prot_Total_02()
{
	self.protection[PROT_EDGE] -= RI_DEX04;
	self.protection[PROT_BLUNT] -= RI_DEX04;
	self.protection[PROT_POINT] -= RI_DEX04;
	self.protection[PROT_FIRE] -= RI_DEX04;
	self.protection[PROT_MAGIC] -= RI_DEX04;
};

instance ItRi_Dex_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Dex;
	visual = "ItRi_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Dex_01;
	on_unequip = UnEquip_ItRi_Dex_01;
	wear = WEAR_EFFECT;
	description = "Prsten dovednosti";
	text[2] = NAME_Bonus_Dex;
	count[2] = Ri_Dex;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_Dex);
	Delta_Bonus_Dex = Delta_Bonus_Dex + Ri_Dex;
};

func void UnEquip_ItRi_Dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_Dex);
	Delta_Bonus_Dex = Delta_Bonus_Dex - Ri_Dex;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItRi_Dex_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Dex02;
	visual = "ItRi_Dex_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Dex_02;
	on_unequip = UnEquip_ItRi_Dex_02;
	wear = WEAR_EFFECT;
	description = "Prsten obratnosti";
	text[2] = NAME_Bonus_Dex;
	count[2] = Ri_Dex02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Dex_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_Dex02);
	Delta_Bonus_Dex = Delta_Bonus_Dex + Ri_Dex02;
};

func void UnEquip_ItRi_Dex_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_Dex02);
	Delta_Bonus_Dex = Delta_Bonus_Dex - Ri_Dex02;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItRi_HP_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Hp;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Hp_01;
	on_unequip = UnEquip_ItRi_Hp_01;
	wear = WEAR_EFFECT;
	description = "Prsten života";
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
};

func void UnEquip_ItRi_Hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ItRi_Hp_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Hp02;
	visual = "ItRi_Hp_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Hp_02;
	on_unequip = UnEquip_ItRi_Hp_02;
	wear = WEAR_EFFECT;
	description = "Prsten čilosti";
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_Hp02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Hp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp02;
};

func void UnEquip_ItRi_Hp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp02;
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ItRi_Str_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Strg;
	visual = "ItRi_Str_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Str_01;
	on_unequip = UnEquip_ItRi_Str_01;
	wear = WEAR_EFFECT;
	description = "Prsten hrubé síly";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Str_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_Strg);
	Delta_Bonus_Str = Delta_Bonus_Str + Ri_Strg;
};

func void UnEquip_ItRi_Str_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Strg);
	Delta_Bonus_Str = Delta_Bonus_Str - Ri_Strg;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};


instance ItRi_Str_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Strg02;
	visual = "ItRi_Str_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Str_02;
	on_unequip = UnEquip_ItRi_Str_02;
	wear = WEAR_EFFECT;
	description = "Prsten síly";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Strg02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Str_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_Strg02);
	Delta_Bonus_Str = Delta_Bonus_Str + Ri_Strg02;
};

func void UnEquip_ItRi_Str_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Strg02);
	Delta_Bonus_Str = Delta_Bonus_Str - Ri_Strg02;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};


instance ItRi_Mana_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Mana;
	visual = "ItRi_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Mana_01;
	on_unequip = UnEquip_ItRi_Mana_01;
	wear = WEAR_EFFECT;
	description = "Prsten magie";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = Ri_Mana;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana;
};

func void UnEquip_ItRi_Mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana;

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ItRi_Mana_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Mana02;
	visual = "ItRi_Mana_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Mana_02;
	on_unequip = UnEquip_ItRi_Mana_02;
	wear = WEAR_EFFECT;
	description = "Prsten astrální moci";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = Ri_Mana02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Mana_02()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana02;
};

func void UnEquip_ItRi_Mana_02()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana02;

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ItRi_Hp_Mana_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Hp_Mana_01;
	on_unequip = UnEquip_ItRi_Hp_Mana_01;
	wear = WEAR_EFFECT;
	description = "Prsten osvícení";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = Ri_HpMana_Mana;
	text[3] = NAME_Bonus_HpMax;
	count[3] = Ri_HpMana_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Hp_Mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_HpMana_Mana;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HpMana_Hp;
};

func void UnEquip_ItRi_Hp_Mana_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HpMana_Hp;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_HpMana_Mana;

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ItRi_Dex_Strg_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_DexStrg;
	visual = "ItRi_Dex_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Dex_Strg_01;
	on_unequip = UnEquip_ItRi_Dex_Strg_01;
	wear = WEAR_EFFECT;
	description = "Prsten moci";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_DexStrg_Strg;
	text[3] = NAME_Bonus_Dex;
	count[3] = Ri_DexStrg_Dex;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_DexStrg_Strg);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_DexStrg_Dex);

	Delta_Bonus_Str = Delta_Bonus_Str + Ri_DexStrg_Strg;
	Delta_Bonus_Dex = Delta_Bonus_Dex + Ri_DexStrg_Dex;
};

func void UnEquip_ItRi_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_DexStrg_Strg);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_DexStrg_Dex);

	Delta_Bonus_Str = Delta_Bonus_Str - Ri_DexStrg_Strg;
	Delta_Bonus_Dex = Delta_Bonus_Dex - Ri_DexStrg_Dex;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};


instance ITRI_RITUALPLACE(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 2000;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_ritualplace;
	wear = WEAR_EFFECT;
	description = "Prsten kruhu Slunce";
	text[4] = "Prsten teleportace k rituálnímu místu mágů Ohně...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_itri_ritualplace()
{
	if(NEWWORLD_ZEN == CurrentLevel)
	{
		AI_Teleport(hero,"NW_TROLLAREA_RITUAL_02");
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	}
	else
	{
		AI_Print(PRINT_TeleportTooFarAway);
	};
};

instance ITRI_XARDASPLACE(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 10;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ITRI_XARDASPLACE;
	wear = WEAR_EFFECT;
	description = "Xardasův prsten";
	text[4] = "Prsten teleportace ke Xardasově věži...";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_ITRI_XARDASPLACE()
{
	if(NEWWORLD_ZEN == CurrentLevel)
	{
		AI_Teleport(hero,"XARDAS");
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	}
	else
	{
		AI_Print(PRINT_TeleportTooFarAway);
	};
};

instance ITRI_KREOLPLACE(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 10;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ITRI_KREOLPLACE;
	wear = WEAR_EFFECT;
	description = "Creolův prsten";
	text[4] = "Prsten teleportace k Zamlžené věži...";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_ITRI_KREOLPLACE()
{
	if(OLDWORLD_ZEN == CurrentLevel)
	{
		AI_Teleport(hero,"SAVE_SPOT_03");
		AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	}
	else
	{
		AI_Print(PRINT_TeleportTooFarAway);
	};
};

instance ITRI_GUARDIANS_01(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 10;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_guardians_01;
	on_unequip = unequip_itri_guardians_01;
	wear = WEAR_EFFECT;
	description = "Prsten Temnoty";
	text[2] = NAME_Prot_Magic;
	count[2] = RI_PROTMAGE_GUARD_01;
	text[3] = "Tenhle prsten mi dal Strážce Dagoth...";
	text[4] = "Na prstenu jsou vyryté prastaré runy...";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void equip_itri_guardians_01()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	GUARDIAN_RING = TRUE;
	AI_Print(PRINT_GUARDIANRING);
	self.protection[PROT_MAGIC] += RI_PROTMAGE_GUARD_01;
};

func void unequip_itri_guardians_01()
{
	GUARDIAN_RING = FALSE;
	self.protection[PROT_MAGIC] -= RI_PROTMAGE_GUARD_01;
};


instance ITRI_GUARDIANS_02(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 10;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_guardians_01;
	on_unequip = unequip_itri_guardians_01;
	wear = WEAR_EFFECT;
	description = "Prsten elementů";
	text[2] = NAME_Prot_Magic;
	count[2] = RI_PROTMAGE_GUARD_02;
	text[3] = "Prsten učedníka posvátného kruhu Strážců...";
	text[4] = "Na prstenu jsou vyryté prastaré runy...";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void equip_itri_guardians_02()
{
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	GUARDIAN_RING_ADEPT = TRUE;
	AI_Print(PRINT_GUARDIANRING);
	self.protection[PROT_MAGIC] += RI_PROTMAGE_GUARD_02;
};

func void unequip_itri_guardians_02()
{
	GUARDIAN_RING_ADEPT = FALSE;
	self.protection[PROT_MAGIC] -= RI_PROTMAGE_GUARD_02;
};


instance ITRI_SARAFAMILYRING(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 300;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Rodinný prsten obchodnice Sarah...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITRI_HAKONMISSRING(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 300;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = "Prsten";
	text[4] = "Na vnitřní straně prstenu je vyryto jméno Hakon...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITRI_PILLIGRIMRING(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 300;
	visual = "ItRi_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_pilligrimring;
	on_unequip = unequip_itri_pilligrimring;
	wear = WEAR_EFFECT;
	description = "Prsten poutníka";
	text[3] = NAME_TRADEMASTERRING;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void equip_itri_pilligrimring()
{
	if(TRADEMASTERBEGAN == TRUE)
	{
		MASTERTRADEGUILD = TRUE;
	};
};

func void unequip_itri_pilligrimring()
{
	if(TRADEMASTERBEGAN == TRUE)
	{
		MASTERTRADEGUILD = FALSE;
	};
};


instance ITRI_GRITTASRING(C_Item)
{
	name = "Grittin zásnubní prsten";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_GoldRing;
	visual = "ItMi_Ring_Gold_New_Raven.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITRI_VEPR(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_vepr;
	on_unequip = unequip_itri_vepr;
	wear = WEAR_EFFECT;
	description = "Kančí prsten";
	text[2] = NAME_Prot_Phis;
	count[2] = RI_TPROTVEPR;
	text[3] = NAME_Prot_Point;
	count[3] = RI_TPROTVEPR;
	text[4] = "Tenhle prsten mi dal lovec Barem...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void equip_itri_vepr()
{
	self.protection[PROT_EDGE] += RI_TPROTVEPR;
	self.protection[PROT_BLUNT] += RI_TPROTVEPR;
	self.protection[PROT_POINT] += RI_TPROTVEPR;
};

func void unequip_itri_vepr()
{
	self.protection[PROT_EDGE] -= RI_TPROTVEPR;
	self.protection[PROT_BLUNT] -= RI_TPROTVEPR;
	self.protection[PROT_POINT] -= RI_TPROTVEPR;
};


instance ITRI_INNOSJUDGE(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 5000;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_innosjudge;
	on_unequip = unequip_itri_innosjudge;
	wear = WEAR_EFFECT;
	description = "Innosova udatnost";
	text[1] = NAME_Prot_Phis;
	count[1] = RI_TPROTINNOSJUDGE;
	text[2] = NAME_Prot_Point;
	count[2] = RI_TPROTINNOSJUDGE;
	text[3] = NAME_Prot_Fire;
	count[3] = RI_TPROTINNOSJUDGETWO;
	text[4] = NAME_Prot_Magic;
	count[4] = RI_TPROTINNOSJUDGETWO;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void equip_itri_innosjudge()
{
	self.protection[PROT_EDGE] += RI_TPROTINNOSJUDGE;
	self.protection[PROT_BLUNT] += RI_TPROTINNOSJUDGE;
	self.protection[PROT_POINT] += RI_TPROTINNOSJUDGE;
	self.protection[PROT_FIRE] += RI_TPROTINNOSJUDGETWO;
	self.protection[PROT_MAGIC] += RI_TPROTINNOSJUDGETWO;
};

func void unequip_itri_innosjudge()
{
	self.protection[PROT_EDGE] -= RI_TPROTINNOSJUDGE;
	self.protection[PROT_BLUNT] -= RI_TPROTINNOSJUDGE;
	self.protection[PROT_POINT] -= RI_TPROTINNOSJUDGE;
	self.protection[PROT_FIRE] -= RI_TPROTINNOSJUDGETWO;
	self.protection[PROT_MAGIC] -= RI_TPROTINNOSJUDGETWO;
};


instance ITRI_NARUS(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 2000;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_narus;
	on_unequip = unequip_itri_narus;
	wear = WEAR_EFFECT;
	description = "Prsten Vody";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = RI_MANA_NARUS;
	text[3] = "Tenhle prsten patří Strážci Narusovi...";
	text[4] = "Na prstenu jsou vyryté prastaré runy...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void equip_itri_narus()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + RI_MANA_NARUS;
	GUARDIAN_RING_NARUS = TRUE;
};

func void unequip_itri_narus()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - RI_MANA_NARUS;
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
	GUARDIAN_RING_NARUS = FALSE;
};


instance ITRI_UDARGIFT(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_udargift;
	on_unequip = unequip_itri_udargift;
	wear = WEAR_EFFECT;
	description = "Slovo síly";
	text[2] = NAME_Bonus_Str;
	count[2] = RI_DEXSTRG_STRG_UDAR;
	text[4] = "Na prstenu je vyrytý symbol meče...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void equip_itri_udargift()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,RI_DEXSTRG_STRG_UDAR);
	Delta_Bonus_Str = Delta_Bonus_Str + RI_DEXSTRG_STRG_UDAR;
};

func void unequip_itri_udargift()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-RI_DEXSTRG_STRG_UDAR);
	Delta_Bonus_Str = Delta_Bonus_Str - RI_DEXSTRG_STRG_UDAR;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ITRI_DEX_03(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_DEX03;
	visual = "ItRi_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_dex_03;
	on_unequip = unequip_itri_dex_03;
	wear = WEAR_EFFECT;
	description = "Prsten šejdíře";
	text[2] = NAME_Bonus_Dex;
	count[2] = RI_DEX03;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void equip_itri_dex_03()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,RI_DEX03);
	Delta_Bonus_Dex = Delta_Bonus_Dex + RI_DEX03;
};

func void unequip_itri_dex_03()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-RI_DEX03);
	Delta_Bonus_Dex = Delta_Bonus_Dex - RI_DEX03;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ITRI_FELLANGOR(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Strg;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_fellangor;
	on_unequip = unequip_itri_fellangor;
	wear = WEAR_EFFECT;
	description = "Fellangorův prsten";
	text[2] = NAME_Bonus_Str;
	count[2] = RI_FELLANGOR;
	text[3] = NAME_Bonus_Dex;
	count[3] = RI_FELLANGOR;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_itri_fellangor()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,RI_FELLANGOR);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,RI_FELLANGOR);
	Delta_Bonus_Str = Delta_Bonus_Str + RI_FELLANGOR;
	Delta_Bonus_Dex = Delta_Bonus_Dex + RI_FELLANGOR;
};

func void unequip_itri_fellangor()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-RI_FELLANGOR);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-RI_FELLANGOR);
	Delta_Bonus_Str = Delta_Bonus_Str - RI_FELLANGOR;
	Delta_Bonus_Dex = Delta_Bonus_Dex - RI_FELLANGOR;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ITRI_FELLANGOR_MAGIC(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_Strg;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_fellangor_magic;
	on_unequip = unequip_itri_fellangor_magic;
	wear = WEAR_EFFECT;
	description = "Fellangorův prsten";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = RI_FELLANGOR_MAGIC;
	text[3] = NAME_Bonus_HpMax;
	count[3] = RI_FELLANGOR_MAGIC;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_itri_fellangor_magic()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + RI_FELLANGOR_MAGIC;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + RI_FELLANGOR_MAGIC;
};

func void unequip_itri_fellangor_magic()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - RI_FELLANGOR_MAGIC;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - RI_FELLANGOR_MAGIC;
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ItRi_UnknownRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_UnknownRing;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Podivný prsten, po stranách zdobený magickými runami...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_UnknownRing()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if((MIS_DARON_RING_TEST == LOG_Running) && (DaronRingTest == FALSE))
		{
			B_GivePlayerXP(500);
			DaronRingTest = TRUE;
			B_LogEntry(TOPIC_DARON_RING_TEST,"Prsten mě přenesl ke kruhu Slunce. Zcela očividně se jedná o prsten teleportace...");
		};

		AI_Teleport(hero,"NW_TROLLAREA_RITUAL_02");
	}
	else
	{
		AI_Print(PRINT_TeleportTooFarAway);
		B_Say(hero,hero,"$DONTWORK");
	};
};

instance ItRi_Teleport_Ring(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Teleport_Ring;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Prsten teleportace ke kruhu Slunce...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Teleport_Ring()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport(hero,"NW_TROLLAREA_RITUAL_02");
	}
	else
	{
		AI_Print(PRINT_TeleportTooFarAway);
		B_Say(hero,hero,"$DONTWORK");
	};
};

instance ITRI_TELEPORT_RING_ADANOS(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ITRI_TELEPORT_RING_ADANOS;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Prsten teleportace do Adanova chrámu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_ITRI_TELEPORT_RING_ADANOS()
{
	if(CurrentLevel == ADDONWORLD_ZEN)
	{
		AI_Teleport(hero,"RAVENPRAY");
	}
	else
	{
		AI_Print(PRINT_TeleportTooFarAway);
		B_Say(hero,hero,"$DONTWORK");
	};
};

instance ITRI_TELEPORT_NW_RUINS(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ITRI_TELEPORT_NW_RUINS;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Prsten teleportace k pyramidě Stavitelů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_ITRI_TELEPORT_NW_RUINS()
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport(hero,"NW_FROM_FC");
	}
	else
	{
		AI_Print(PRINT_TeleportTooFarAway);
		B_Say(hero,hero,"$DONTWORK");
	};
};

instance ITRI_RING_SLOW(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 10000;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_ring_slow;
	wear = WEAR_EFFECT;
	description = "Prsten Strážce";
	text[4] = "Tenhle prsten ohýbá prostor a zpomaluje čas...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_itri_ring_slow()
{
	Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
	Wld_StopEffect("SLOW_MOTION");
	Wld_PlayEffect("SLOW_MOTION",hero,hero,0,0,0,FALSE);
};

instance ItRi_DragonStaff(C_Item)
{
	name = "Žezlo vládce draků";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	material = MAT_METAL;
	cond_atr[2] = ATR_MANA;
	cond_value[2] = 350;
	visual = "ARTEFAKT.3DS";
	on_equip = equip_ItRi_DragonStaff;
	on_unequip = unequip_ItRi_DragonStaff;
	wear = WEAR_EFFECT;
	description = name;
	text[2] = NAME_Mana_needed;
	count[2] = 350;
	text[4] = "Legendární artefakt umožňující vyvolat draka...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void equip_ItRi_DragonStaff()
{
	Wld_SpawnNpcRange(hero,Summoned_Dragon,1,500);
	Wld_PlayEffect("spellFX_RingRitual2",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
	Snd_Play("DRG_AMBIENT");

	if(HeroDragonLook == FALSE)
	{
		//Wld_PlayEffect("DRAGONLOOK_FX",hero,hero,0,0,0,FALSE);
		HeroDragonLook = TRUE;
	};

	HeroDragonLook = TRUE;

	if(hero.attribute[ATR_MANA] > 350)
	{
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 350;
	}
	else
	{
		hero.attribute[ATR_MANA] = 1;
	};
};

func void unequip_ItRi_DragonStaff()
{
	B_KillNpc(Summoned_Dragon);

	if(HeroDragonLook == TRUE)
	{
		Wld_StopEffect("DRAGONLOOK_FX");	
		HeroDragonLook = FALSE;
	};
};

instance ItRi_OreBarons(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Ring_Gold_New_Raven.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_All;
	on_unequip = UnEquip_ItRi_Prot_All;
	wear = WEAR_EFFECT;
	description = "Prsten rudobaronů";
	text[1] = NAME_Prot_Phis;
	count[1] = Ri_OreBarons;
	text[2] = NAME_Prot_Point;
	count[2] = Ri_OreBarons;
	text[3] = NAME_Prot_Fire;
	count[3] = Ri_OreBarons;
	text[4] = NAME_Prot_Magic;
	count[4] = Ri_OreBarons;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Prot_All()
{
	self.protection[PROT_EDGE] += Ri_OreBarons;
	self.protection[PROT_BLUNT] += Ri_OreBarons;
	self.protection[PROT_POINT] += Ri_OreBarons;
	self.protection[PROT_FIRE] += Ri_OreBarons;
	self.protection[PROT_MAGIC] += Ri_OreBarons;
};

func void UnEquip_ItRi_Prot_All()
{
	self.protection[PROT_EDGE] -= Ri_OreBarons;
	self.protection[PROT_BLUNT] -= Ri_OreBarons;
	self.protection[PROT_POINT] -= Ri_OreBarons;
	self.protection[PROT_FIRE] -= Ri_OreBarons;
	self.protection[PROT_MAGIC] -= Ri_OreBarons;
};

instance ItRi_HuntRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_DEX04;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_HuntRing;
	on_unequip = unequip_ItRi_HuntRing;
	wear = WEAR_EFFECT;
	description = "Prsten mistra lovce";
	text[2] = NAME_Bonus_Dex;
	count[2] = RI_DEX04;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_ItRi_HuntRing()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,RI_DEX04);
	Delta_Bonus_Dex = Delta_Bonus_Dex + RI_DEX04;
};

func void unequip_ItRi_HuntRing()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-RI_DEX04);
	Delta_Bonus_Dex = Delta_Bonus_Dex - RI_DEX04;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItRi_FerrosRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_STR04;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_FerrosRing;
	on_unequip = unequip_ItRi_FerrosRing;
	wear = WEAR_EFFECT;
	description = "Ferrosův rodinný prsten";
	text[2] = NAME_Bonus_Str;
	count[2] = RI_STR04;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_ItRi_FerrosRing()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,RI_STR04);
	Delta_Bonus_Str = Delta_Bonus_Str + RI_STR04;
};

func void unequip_ItRi_FerrosRing()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-RI_STR04);
	Delta_Bonus_Str = Delta_Bonus_Str - RI_STR04;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ItRi_DarkCurse(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_DarkCurse;
	on_unequip = unequip_ItRi_DarkCurse;
	wear = WEAR_EFFECT;
	description = "Prsten temných rituálů";
	text[4] = "Ukrývá v sobě prokletí ohromné síly...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void equip_ItRi_DarkCurse()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	SC_IsObsessed = TRUE;
	AI_Print(PRINT_SCIsObsessed);
};

func void unequip_ItRi_DarkCurse()
{
	Wld_StopEffect("DEMENTOR_FX");
};

instance ItRi_Ferd(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SilverRing;
	visual = "ItMi_Ring_Silver_New_Named.3DS";
	material = MAT_METAL;
	description = "Ferdův stříbrný prsten";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


//-----------------------novyye kol'tsa stal'----------------------------

instance ItRi_Steel_Diam(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Steel_Diam.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Steel_Diam;
	on_unequip = unequip_ItRi_Steel_Diam;
	wear = WEAR_EFFECT;
	description = "Ocelový prsten s diamantem";
	text[1] = NAME_Prot_Phis;
	count[1] = Ri_ProtAll_Steel;
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtAll_Steel;
	text[3] = NAME_Prot_Fire;
	count[3] = Ri_ProtAll_Steel;
	text[4] = NAME_Prot_Magic;
	count[4] = Ri_ProtAll_Steel;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Steel_Diam()
{
	self.protection[PROT_EDGE] += Ri_ProtAll_Steel;
	self.protection[PROT_BLUNT] += Ri_ProtAll_Steel;
	self.protection[PROT_POINT] += Ri_ProtAll_Steel;
	self.protection[PROT_FIRE] += Ri_ProtAll_Steel;
	self.protection[PROT_MAGIC] += Ri_ProtAll_Steel;
};

func void UnEquip_ItRi_Steel_Diam()
{
	self.protection[PROT_EDGE] -= Ri_ProtAll_Steel;
	self.protection[PROT_BLUNT] -= Ri_ProtAll_Steel;
	self.protection[PROT_POINT] -= Ri_ProtAll_Steel;
	self.protection[PROT_FIRE] -= Ri_ProtAll_Steel;
	self.protection[PROT_MAGIC] -= Ri_ProtAll_Steel;
};

instance ItRi_Steel_Ruby(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Steel_Ruby.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Steel_Ruby;
	on_unequip = unequip_ItRi_Steel_Ruby;
	wear = WEAR_EFFECT;
	description = "Ocelový prsten s rubínem";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Str_Steel;
	text[3] = NAME_Prot_Phis;
	count[3] = Ri_Prot_Steel;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Steel_Ruby()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_Str_Steel);
	Delta_Bonus_Str = Delta_Bonus_Str + Ri_Str_Steel;

	self.protection[PROT_EDGE] += Ri_Prot_Steel;
	self.protection[PROT_BLUNT] += Ri_Prot_Steel;
};

func void UnEquip_ItRi_Steel_Ruby()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Str_Steel);
	Delta_Bonus_Str = Delta_Bonus_Str - Ri_Str_Steel;

	self.protection[PROT_EDGE] -= Ri_Prot_Steel;
	self.protection[PROT_BLUNT] -= Ri_Prot_Steel;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ItRi_Steel_Emer(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Steel_Emer.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Steel_Emer;
	on_unequip = unequip_ItRi_Steel_Emer;
	wear = WEAR_EFFECT;
	description = "Ocelový prsten se smaragdem";
	text[2] = NAME_Bonus_Dex;
	count[2] = Ri_Dex_Steel;
	text[3] = NAME_Prot_Point;
	count[3] = Ri_Prot_Steel;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Steel_Emer()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_Dex_Steel);
	Delta_Bonus_Dex = Delta_Bonus_Dex + Ri_Dex_Steel;

	self.protection[PROT_POINT] += Ri_Prot_Steel;
};

func void UnEquip_ItRi_Steel_Emer()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_Dex_Steel);
	Delta_Bonus_Dex = Delta_Bonus_Dex - Ri_Dex_Steel;

	self.protection[PROT_POINT] -= Ri_Prot_Steel;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItRi_Steel_Sapp(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Steel_Sapp.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Steel_Sapp;
	on_unequip = unequip_ItRi_Steel_Sapp;
	wear = WEAR_EFFECT;
	description = "Ocelový prsten se safírem";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = Ri_Mana_Steel;
	text[3] = NAME_Bonus_IntStaff;
	count[3] = Ri_Int_Steel;
	text[4] = NAME_Prot_Magic;
	count[4] = Ri_Prot_Steel;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Steel_Sapp()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana_Steel;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana_Steel;
	self.protection[PROT_MAGIC] += Ri_Prot_Steel;
	ATR_INTELLECT += Ri_Int_Steel;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

func void UnEquip_ItRi_Steel_Sapp()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana_Steel;
	self.protection[PROT_MAGIC] -= Ri_Prot_Steel;

	if(self.attribute[ATR_MANA] >= Ri_Mana_Steel)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana_Steel;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};

	ATR_INTELLECT -= Ri_Int_Steel;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

instance ItRi_Steel_Opal(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Steel_Opal.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Steel_Opal;
	on_unequip = unequip_ItRi_Steel_Opal;
	wear = WEAR_EFFECT;
	description = "Ocelový prsten s opálem";
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_HP_Steel;
	text[3] = NAME_Prot_Fire;
	count[3] = Ri_Prot_Steel;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Steel_Opal()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HP_Steel;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_HP_Steel;
	self.protection[PROT_FIRE] += Ri_Prot_Steel;
};

func void UnEquip_ItRi_Steel_Opal()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HP_Steel;
	self.protection[PROT_FIRE] -= Ri_Prot_Steel;

	if(self.attribute[ATR_HITPOINTS] >= Ri_HP_Steel)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_HP_Steel;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

instance ItRi_Steel_Topa(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Steel_Topa.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Steel_Topa;
	on_unequip = unequip_ItRi_Steel_Topa;
	wear = WEAR_EFFECT;
	description = "Ocelový prsten s topazem";
	text[2] = NAME_Bonus_Stam;
	count[2] = Ri_Stamina_Steel;
	text[3] = NAME_Bonus_Fly;
	count[3] = Ri_Fly_Steel_Clr;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Steel_Topa()
{
	var int tmpStam;
	var int tmpStamOPBonus;

	self.protection[PROT_FLY] += Ri_Fly_Steel;

	tmpStam = ATR_STAMINA_MAX[0] + Ri_Stamina_Steel;

	if(tmpStam > 100)
	{
		tmpStamOPBonus = tmpStam - 100;
		tmpStamSaveSteel = Ri_Stamina_Steel - tmpStamOPBonus;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + tmpStamSaveSteel;
		ATR_STAMINA[0] = ATR_STAMINA[0] + (tmpStamSaveSteel * 10);
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	}
	else
	{
		tmpStamSaveSteel = Ri_Stamina_Steel;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + tmpStamSaveSteel;
		ATR_STAMINA[0] = ATR_STAMINA[0] + (tmpStamSaveSteel * 10);
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	};
};

func void UnEquip_ItRi_Steel_Topa()
{
	self.protection[PROT_FLY] -= Ri_Fly_Steel;

	ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] - tmpStamSaveSteel;

	if(ATR_STAMINA[0] >= (tmpStamSaveSteel * 10))
	{
		ATR_STAMINA[0] = ATR_STAMINA[0] - (tmpStamSaveSteel * 10);
	}
	else
	{
		ATR_STAMINA[0] = 0;
	};
	
	Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
};

//-----------------------novyye kol'tsa zoloto----------------------------


instance ItRi_Gold_Diam(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 750;
	visual = "ItRi_Gold_Diam.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Gold_Diam;
	on_unequip = unequip_ItRi_Gold_Diam;
	wear = WEAR_EFFECT;
	description = "Zlatý prsten s diamantem";
	text[1] = NAME_Prot_Phis;
	count[1] = Ri_ProtAll_Gold;
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtAll_Gold;
	text[3] = NAME_Prot_Fire;
	count[3] = Ri_ProtAll_Gold;
	text[4] = NAME_Prot_Magic;
	count[4] = Ri_ProtAll_Gold;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Gold_Diam()
{
	self.protection[PROT_EDGE] += Ri_ProtAll_Gold;
	self.protection[PROT_BLUNT] += Ri_ProtAll_Gold;
	self.protection[PROT_POINT] += Ri_ProtAll_Gold;
	self.protection[PROT_FIRE] += Ri_ProtAll_Gold;
	self.protection[PROT_MAGIC] += Ri_ProtAll_Gold;
};

func void UnEquip_ItRi_Gold_Diam()
{
	self.protection[PROT_EDGE] -= Ri_ProtAll_Gold;
	self.protection[PROT_BLUNT] -= Ri_ProtAll_Gold;
	self.protection[PROT_POINT] -= Ri_ProtAll_Gold;
	self.protection[PROT_FIRE] -= Ri_ProtAll_Gold;
	self.protection[PROT_MAGIC] -= Ri_ProtAll_Gold;
};

instance ItRi_Gold_Ruby(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 750;
	visual = "ItRi_Gold_Ruby.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Gold_Ruby;
	on_unequip = unequip_ItRi_Gold_Ruby;
	wear = WEAR_EFFECT;
	description = "Zlatý prsten s rubínem";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Str_Gold;
	text[3] = NAME_Prot_Phis;
	count[3] = Ri_Prot_Gold;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Gold_Ruby()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_Str_Gold);
	Delta_Bonus_Str = Delta_Bonus_Str + Ri_Str_Gold;

	self.protection[PROT_EDGE] += Ri_Prot_Gold;
	self.protection[PROT_BLUNT] += Ri_Prot_Gold;
};

func void UnEquip_ItRi_Gold_Ruby()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Str_Gold);
	Delta_Bonus_Str = Delta_Bonus_Str - Ri_Str_Gold;

	self.protection[PROT_EDGE] -= Ri_Prot_Gold;
	self.protection[PROT_BLUNT] -= Ri_Prot_Gold;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ItRi_Gold_Emer(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 750;
	visual = "ItRi_Gold_Emer.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Gold_Emer;
	on_unequip = unequip_ItRi_Gold_Emer;
	wear = WEAR_EFFECT;
	description = "Zlatý prsten se smaragdem";
	text[2] = NAME_Bonus_Dex;
	count[2] = Ri_Dex_Gold;
	text[3] = NAME_Prot_Point;
	count[3] = Ri_Prot_Gold;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Gold_Emer()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_Dex_Gold);
	Delta_Bonus_Dex = Delta_Bonus_Dex + Ri_Dex_Gold;

	self.protection[PROT_POINT] += Ri_Prot_Gold;
};

func void UnEquip_ItRi_Gold_Emer()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_Dex_Gold);
	Delta_Bonus_Dex = Delta_Bonus_Dex - Ri_Dex_Gold;

	self.protection[PROT_POINT] -= Ri_Prot_Gold;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItRi_Gold_Sapp(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 750;
	visual = "ItRi_Gold_Sapp.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Gold_Sapp;
	on_unequip = unequip_ItRi_Gold_Sapp;
	wear = WEAR_EFFECT;
	description = "Zlatý prsten se safírem";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = Ri_Mana_Gold;
	text[3] = NAME_Bonus_IntStaff;
	count[3] = Ri_Int_Gold;
	text[4] = NAME_Prot_Magic;
	count[4] = Ri_Prot_Gold;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Gold_Sapp()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana_Gold;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana_Gold;
	self.protection[PROT_MAGIC] += Ri_Prot_Gold;
	ATR_INTELLECT += Ri_Int_Gold;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

func void UnEquip_ItRi_Gold_Sapp()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana_Gold;
	self.protection[PROT_MAGIC] -= Ri_Prot_Gold;

	if(self.attribute[ATR_MANA] >= Ri_Mana_Gold)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana_Gold;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};

	ATR_INTELLECT -= Ri_Int_Gold;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

instance ItRi_Gold_Opal(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 750;
	visual = "ItRi_Gold_Opal.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Gold_Opal;
	on_unequip = unequip_ItRi_Gold_Opal;
	wear = WEAR_EFFECT;
	description = "Zlatý prsten s opálem";
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_HP_Gold;
	text[3] = NAME_Prot_Fire;
	count[3] = Ri_Prot_Gold;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Gold_Opal()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HP_Gold;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_HP_Gold;
	self.protection[PROT_FIRE] += Ri_Prot_Gold;
};

func void UnEquip_ItRi_Gold_Opal()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HP_Gold;
	self.protection[PROT_FIRE] -= Ri_Prot_Gold;

	if(self.attribute[ATR_HITPOINTS] >= Ri_HP_Gold)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_HP_Gold;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

instance ItRi_Gold_Topa(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 750;
	visual = "ItRi_Gold_Topa.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Gold_Topa;
	on_unequip = unequip_ItRi_Gold_Topa;
	wear = WEAR_EFFECT;
	description = "Zlatý prsten s topazem";
	text[2] = NAME_Bonus_Stam;
	count[2] = Ri_Stamina_Gold;
	text[3] = NAME_Bonus_Fly;
	count[3] = Ri_Fly_Gold_Clr;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Gold_Topa()
{
	var int tmpStam;
	var int tmpStamOPBonus;

	self.protection[PROT_FLY] += Ri_Fly_Gold;

	tmpStam = ATR_STAMINA_MAX[0] + Ri_Stamina_Gold;

	if(tmpStam > 100)
	{
		tmpStamOPBonus = tmpStam - 100;
		tmpStamSaveGold = Ri_Stamina_Gold - tmpStamOPBonus;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + tmpStamSaveGold;
		ATR_STAMINA[0] = ATR_STAMINA[0] + (tmpStamSaveGold * 10);
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	}
	else
	{
		tmpStamSaveGold = Ri_Stamina_Gold;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + tmpStamSaveGold;
		ATR_STAMINA[0] = ATR_STAMINA[0] + (tmpStamSaveGold * 10);
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	};
};

func void UnEquip_ItRi_Gold_Topa()
{
	self.protection[PROT_FLY] -= Ri_Fly_Gold;
	ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] - tmpStamSaveGold;

	if(ATR_STAMINA[0] >= (tmpStamSaveGold * 10))
	{
		ATR_STAMINA[0] = ATR_STAMINA[0] - (tmpStamSaveGold * 10);
	}
	else
	{
		ATR_STAMINA[0] = 0;
	};
	
	Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
};

//-----------------------novyye kol'tsa ruda----------------------------


instance ItRi_Ore_Diam(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Ore_Diam.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Ore_Diam;
	on_unequip = unequip_ItRi_Ore_Diam;
	wear = WEAR_EFFECT;
	description = "Rudný prsten s diamantem";
	text[1] = NAME_Prot_Phis;
	count[1] = Ri_ProtAll_Ore;
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtAll_Ore;
	text[3] = NAME_Prot_Fire;
	count[3] = Ri_ProtAll_Ore;
	text[4] = NAME_Prot_Magic;
	count[4] = Ri_ProtAll_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ore_Diam()
{
	self.protection[PROT_EDGE] += Ri_ProtAll_Ore;
	self.protection[PROT_BLUNT] += Ri_ProtAll_Ore;
	self.protection[PROT_POINT] += Ri_ProtAll_Ore;
	self.protection[PROT_FIRE] += Ri_ProtAll_Ore;
	self.protection[PROT_MAGIC] += Ri_ProtAll_Ore;
};

func void UnEquip_ItRi_Ore_Diam()
{
	self.protection[PROT_EDGE] -= Ri_ProtAll_Ore;
	self.protection[PROT_BLUNT] -= Ri_ProtAll_Ore;
	self.protection[PROT_POINT] -= Ri_ProtAll_Ore;
	self.protection[PROT_FIRE] -= Ri_ProtAll_Ore;
	self.protection[PROT_MAGIC] -= Ri_ProtAll_Ore;
};

instance ItRi_Ore_Ruby(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Ore_Ruby.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Ore_Ruby;
	on_unequip = unequip_ItRi_Ore_Ruby;
	wear = WEAR_EFFECT;
	description = "Rudný prsten s rubínem";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Str_Ore;
	text[3] = NAME_Prot_Phis;
	count[3] = Ri_Prot_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ore_Ruby()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_Str_Ore);
	Delta_Bonus_Str = Delta_Bonus_Str + Ri_Str_Ore;

	self.protection[PROT_EDGE] += Ri_Prot_Ore;
	self.protection[PROT_BLUNT] += Ri_Prot_Ore;
};

func void UnEquip_ItRi_Ore_Ruby()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Str_Ore);
	Delta_Bonus_Str = Delta_Bonus_Str - Ri_Str_Ore;

	self.protection[PROT_EDGE] -= Ri_Prot_Ore;
	self.protection[PROT_BLUNT] -= Ri_Prot_Ore;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ItRi_Ore_Emer(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Ore_Emer.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Ore_Emer;
	on_unequip = unequip_ItRi_Ore_Emer;
	wear = WEAR_EFFECT;
	description = "Rudný prsten se smaragdem";
	text[2] = NAME_Bonus_Dex;
	count[2] = Ri_Dex_Ore;
	text[3] = NAME_Prot_Point;
	count[3] = Ri_Prot_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ore_Emer()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_Dex_Ore);
	Delta_Bonus_Dex = Delta_Bonus_Dex + Ri_Dex_Ore;

	self.protection[PROT_POINT] += Ri_Prot_Ore;
};

func void UnEquip_ItRi_Ore_Emer()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_Dex_Ore);
	Delta_Bonus_Dex = Delta_Bonus_Dex - Ri_Dex_Ore;

	self.protection[PROT_POINT] -= Ri_Prot_Ore;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItRi_Ore_Sapp(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Ore_Sapp.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Ore_Sapp;
	on_unequip = unequip_ItRi_Ore_Sapp;
	wear = WEAR_EFFECT;
	description = "Rudný prsten se safírem";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = Ri_Mana_Ore;
	text[3] = NAME_Bonus_IntStaff;
	count[3] = Ri_Int_Ore;
	text[4] = NAME_Prot_Magic;
	count[4] = Ri_Prot_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ore_Sapp()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana_Ore;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana_Ore;
	self.protection[PROT_MAGIC] += Ri_Prot_Ore;
	ATR_INTELLECT += Ri_Int_Ore;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

func void UnEquip_ItRi_Ore_Sapp()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana_Ore;
	self.protection[PROT_MAGIC] -= Ri_Prot_Ore;

	if(self.attribute[ATR_MANA] >= Ri_Mana_Ore)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana_Ore;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};

	ATR_INTELLECT -= Ri_Int_Ore;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

instance ItRi_Ore_Opal(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Ore_Opal.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Ore_Opal;
	on_unequip = unequip_ItRi_Ore_Opal;
	wear = WEAR_EFFECT;
	description = "Rudný prsten s opálem";
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_HP_Ore;
	text[3] = NAME_Prot_Fire;
	count[3] = Ri_Prot_Ore;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ore_Opal()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HP_Ore;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_HP_Ore;
	self.protection[PROT_FIRE] += Ri_Prot_Ore;
};

func void UnEquip_ItRi_Ore_Opal()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HP_Ore;
	self.protection[PROT_FIRE] -= Ri_Prot_Ore;

	if(self.attribute[ATR_HITPOINTS] >= Ri_HP_Ore)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_HP_Ore;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

instance ItRi_Ore_Topa(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Ore_Topa.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ItRi_Ore_Topa;
	on_unequip = unequip_ItRi_Ore_Topa;
	wear = WEAR_EFFECT;
	description = "Rudný prsten s topazem";
	text[2] = NAME_Bonus_Stam;
	count[2] = Ri_Stamina_Ore;
	text[3] = NAME_Bonus_Fly;
	count[3] = Ri_Fly_Ore_Clr;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_ADVANCE;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ore_Topa()
{
	var int tmpStam;
	var int tmpStamOPBonus;

	self.protection[PROT_FLY] += Ri_Fly_Ore;

	tmpStam = ATR_STAMINA_MAX[0] + Ri_Stamina_Ore;

	if(tmpStam > 100)
	{
		tmpStamOPBonus = tmpStam - 100;
		tmpStamSaveOre = Ri_Stamina_Ore - tmpStamOPBonus;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + tmpStamSaveOre;
		ATR_STAMINA[0] = ATR_STAMINA[0] + (tmpStamSaveOre * 10);
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	}
	else
	{
		tmpStamSaveOre = Ri_Stamina_Ore;
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + tmpStamSaveOre;
		ATR_STAMINA[0] = ATR_STAMINA[0] + (tmpStamSaveOre * 10);
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	};
};

func void UnEquip_ItRi_Ore_Topa()
{
	self.protection[PROT_FLY] -= Ri_Fly_Ore;
	ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] - tmpStamSaveOre;

	if(ATR_STAMINA[0] >= (tmpStamSaveOre * 10))
	{
		ATR_STAMINA[0] = ATR_STAMINA[0] - (tmpStamSaveOre * 10);
	}
	else
	{
		ATR_STAMINA[0] = 0;
	};
	
	Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
};

instance ItRi_Loa(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Loa;
	on_unequip = UnEquip_ItRi_Loa;
	wear = WEAR_EFFECT;
	description = "Loin prsten";
	text[2] = NAME_Bonus_HpMax;
	count[2] = 100;
	text[4] = "Tenhle prsten mi dala Loa...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Loa()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 100;
};

func void UnEquip_ItRi_Loa()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 100;

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

instance ItRi_Ihiyal(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ihiyal;
	on_unequip = UnEquip_ItRi_Ihiyal;
	wear = WEAR_EFFECT;
	description = "Ihiyalův prsten";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = Ri_Mana_Ihiyal;
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_HP_Ihiyal;
	text[3] = "Podivný prsten, po stranách zdobený magickými runami...";
	text[4] = "'... tvoje bolest je mojí bolestí, bratře...' - Izulg";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_Ihiyal()
{
	IhiyalRingUp = TRUE;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HP_Ihiyal;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_HP_Ihiyal;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana_Ihiyal;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana_Ihiyal;

	if((IhiyalRingUp == TRUE) && (IzulgRingUp == TRUE))
	{
		ATR_INTELLECT += 25;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	};
};

func void UnEquip_ItRi_Ihiyal()
{
	IhiyalRingUp = FALSE;

	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HP_Ihiyal;

	if(self.attribute[ATR_HITPOINTS] >= Ri_HP_Ihiyal)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_HP_Ihiyal;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana_Ihiyal;

	if(self.attribute[ATR_MANA] >= Ri_Mana_Ihiyal)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana_Ihiyal;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
	if(IzulgRingUp == TRUE)
	{
		ATR_INTELLECT -= 25;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	};
};

instance ItRi_Izulg(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Izulg;
	on_unequip = UnEquip_ItRi_Izulg;
	wear = WEAR_EFFECT;
	description = "Izulgův prsten";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = Ri_Mana_Izulg;
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_HP_Izulg;
	text[3] = "Podivný prsten, po stranách zdobený magickými runami...";
	text[4] = "'... tvoje bolest je mojí bolestí, bratře...' - Ihiyal";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Izulg()
{
	IzulgRingUp = TRUE;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HP_Izulg;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_HP_Izulg;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana_Izulg;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana_Izulg;

	if((IhiyalRingUp == TRUE) && (IzulgRingUp == TRUE))
	{
		ATR_INTELLECT += 25;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	};
};

func void UnEquip_ItRi_Izulg()
{
	IzulgRingUp = FALSE;

	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HP_Izulg;

	if(self.attribute[ATR_HITPOINTS] >= Ri_HP_Izulg)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_HP_Izulg;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};

	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana_Izulg;

	if(self.attribute[ATR_MANA] >= Ri_Mana_Izulg)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana_Izulg;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
	if(IhiyalRingUp == TRUE)
	{
		ATR_INTELLECT -= 25;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	};
};

instance ItAm_Imarah(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 2000;
	visual = "ItAm_Imarah_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Imarah;
	on_unequip = UnEquip_ItAm_Imarah;
	wear = WEAR_EFFECT;
	description = "Amulet hvězd";
	text[0] = NAME_Bonus_Str;
	count[0] = Am_Str_Imarah;
	text[1] = NAME_Prot_Edge;
	count[1] = Am_Prot_Imarah_Edge;
	text[2] = NAME_Prot_Magic;
	count[2] = Am_Prot_Imarah_Mag;
	text[3] = NAME_Bonus_IntStaff;
	count[3] = Am_Int_Imarah;
	text[4] = NAME_Bonus_HpMax;
	count[4] = Am_HP_Imarah;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItAm_Imarah()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Am_Str_Imarah);
	Delta_Bonus_Str = Delta_Bonus_Str + Am_Str_Imarah;
	self.protection[PROT_EDGE] += Am_Prot_Imarah_Edge;
	self.protection[PROT_MAGIC] += Am_Prot_Imarah_Mag;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Am_HP_Imarah;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Am_HP_Imarah;
	ATR_INTELLECT += Am_Int_Imarah;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);

};

func void UnEquip_ItAm_Imarah()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Am_Str_Imarah);
	Delta_Bonus_Str = Delta_Bonus_Str - Am_Str_Imarah;
	self.protection[PROT_EDGE] -= Am_Prot_Imarah_Edge;
	self.protection[PROT_MAGIC] -= Am_Prot_Imarah_Mag;

	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Am_HP_Imarah;

	if(self.attribute[ATR_HITPOINTS] >= Am_HP_Imarah)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Am_HP_Imarah;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 0;
	};
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_INTELLECT -= Am_Int_Imarah;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ItRi_GoblinRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_HpMana;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_GoblinRing;
	on_unequip = UnEquip_ItRi_GoblinRing;
	wear = WEAR_EFFECT;
	description = "Prsten Adanova kněze";
	text[2] = NAME_Bonus_HpMax;
	count[2] = 300;
	text[4] = "Na prstenu jsou nastíněné prastaré runy...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

func void Equip_ItRi_GoblinRing()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 300;
};

func void UnEquip_ItRi_GoblinRing()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 300;

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};