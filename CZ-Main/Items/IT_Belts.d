
const int Value_ItBE_Addon_Leather_01 = 150;
const int Value_ItBE_Addon_SLD_01 = 250;
const int Value_ItBE_Addon_SLD_02 = 500;
const int Value_ItBE_Addon_SLD_03 = 1000;
const int Value_ItBE_Addon_DJG_01 = 4000;
const int Value_ItBE_Addon_NOV_01 = 150;
const int Value_ItBE_Addon_MIL_01 = 200;
const int Value_ItBE_Addon_MIL_02 = 400;
const int Value_ItBE_Addon_KDF_01 = 500;
const int Value_ItBE_Addon_KDF_02 = 1500;
const int Value_ItBE_Addon_KDF_03 = 3000;
const int Value_ItBE_Addon_SEK_01 = 1000;
const int Value_ItBE_Addon_TPL_01 = 1500;
const int Value_ItBE_Addon_GUR_01 = 2000;
const int Value_ItBE_Addon_THF_01 = 1000;
const int Value_ItBE_Addon_THF_02 = 1500;
const int Value_ItBE_Addon_THF_03 = 2500;
const int Value_ItBE_Addon_MC = 500;
const int Value_ItBE_Addon_STR_5 = 500;
const int Value_ItBE_Addon_STR_10 = 1000;
const int Value_ItBE_Addon_DEX_5 = 750;
const int Value_ItBE_Addon_DEX_10 = 1500;
const int Value_ItBE_Addon_Prot_Edge = 100;
const int Value_ItBE_Addon_Prot_Point = 100;
const int Value_ItBE_Addon_Prot_Magic = 400;
const int Value_ItBE_Addon_Prot_Fire = 400;
const int Value_ItBE_Addon_Prot_EdgPoi = 500;
const int Value_ItBE_Addon_Prot_Total = 5000;

const int BA_Bonus01 = 5;
const int BA_Bonus02 = 10;
const int BA_Bonus03 = 15;
const int BA_Bonus04 = 20;

const int Belt_Prot_01 = 5;
const int Belt_Prot_02 = 10;
const int Belt_Prot_03 = 15;
const int Belt_Prot_04 = 20;

const int BeltBonus_STR01 = 5;
const int BeltBonus_STR02 = 10;
const int BeltBonus_STR03 = 15;
const int BeltBonus_DEX01 = 5;
const int BeltBonus_DEX02 = 10;
const int BeltBonus_DEX03 = 15;

const int BeltBonus_DEX_THF_01 = 15;
const int BeltBonus_DEX_THF_02 = 20;
const int BeltBonus_DEX_THF_03 = 25;

const int BeltBonus_ProtEdge = 10;
const int BeltBonus_ProtPoint = 10;
const int BeltBonus_ProtMagic = 10;
const int BeltBonus_ProtFire = 10;
const int BeltBonus_ProtEdgPoi = 10;
const int BeltBonus_ProtTotal = 10;

const int Belt_Nordmar_00 = 40;
const int Belt_Nordmar_01 = 25;
const int Belt_Nordmar_02 = 20;
const int Belt_Nordmar_03 = 10;
const int Belt_Nordmar_04 = 5;

const int Belt_BT_01 = 40;
const int Belt_BT_02 = 35;
const int Belt_BT_03 = 15;

const int BA_Hunt01 = 15;
const int BA_Hunt02 = 20;
const int BA_Hunt03 = 25;
const int BA_Hunt04 = 30;

const int DrgBonus_01 = 15;
const int DrgBonus_02 = 50;
const int DrgBonus_03 = 40;
const int DrgBonus_04 = 25;

const int BA_Bonus_Int_01 = 5;
const int BA_Bonus_Int_02 = 10;
const int BA_Bonus_Int_03 = 15;
const int BA_Bonus_Int_04 = 20;

const int BA_Bonus_Fly = 10;
const int BA_Bonus_Fly_Clr = 1;

const int BT_Bonus_Fly = 20;
const int BT_Bonus_Fly_Clr = 2;

instance ItBE_Addon_Leather_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_Leather_01;
	visual = "ItBe_Leather_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_Leather_01;
	on_unequip = UnEquip_ItBE_Addon_Leather_01;
	description = "Kožený opasek";
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArLeather;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBE_Addon_Leather_01()
{
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;

	if(Npc_IsPlayer(self))
	{
		Leather01_Equipped = TRUE;

		if(LeatherArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
		};
	};
};

func void UnEquip_ItBE_Addon_Leather_01()
{
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;

	if(Npc_IsPlayer(self))
	{
		Leather01_Equipped = FALSE;

		if(LeatherArmor_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
		};
	};
};

instance ItBE_Addon_MIL_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_MIL_01;
	visual = "ItBe_Leather_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	on_equip = Equip_ItBE_Addon_MIL_01;
	on_unequip = UnEquip_ItBE_Addon_MIL_01;
	description = "Opasek domobránce";
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArMIL;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_MIL_01()
{
	MIL01_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;

	if(MILArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus01;
		self.protection[PROT_BLUNT] += BA_Bonus01;
		self.protection[PROT_POINT] += BA_Bonus01;
	};
};

func void UnEquip_ItBE_Addon_MIL_01()
{
	MIL01_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;

	if(MILArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus01;
		self.protection[PROT_BLUNT] -= BA_Bonus01;
		self.protection[PROT_POINT] -= BA_Bonus01;
	};
};

instance ItBE_Addon_MIL_02(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_MIL_02;
	visual = "ItBe_Mil_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	on_equip = Equip_ItBE_Addon_MIL_02;
	on_unequip = UnEquip_ItBE_Addon_MIL_02;
	description = "Těžký opasek domobránce";
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_02;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_02;
	text[3] = NAME_Addon_BeArHeavyMIL;
	count[3] = BA_Bonus02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_MIL_02()
{
	MIL02_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_02;
	self.protection[PROT_BLUNT] += Belt_Prot_02;
	self.protection[PROT_POINT] += Belt_Prot_02;

	if(MILHeavyArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus02;
		self.protection[PROT_BLUNT] += BA_Bonus02;
		self.protection[PROT_POINT] += BA_Bonus02;
	};
};

func void UnEquip_ItBE_Addon_MIL_02()
{
	MIL02_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_02;
	self.protection[PROT_BLUNT] -= Belt_Prot_02;
	self.protection[PROT_POINT] -= Belt_Prot_02;

	if(MILHeavyArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus02;
		self.protection[PROT_BLUNT] -= BA_Bonus02;
		self.protection[PROT_POINT] -= BA_Bonus02;
	};
};

instance ItBE_Addon_SLD_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_SLD_01;
	visual = "ItBe_Sld_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	on_equip = Equip_ItBE_Addon_SLD_01;
	on_unequip = UnEquip_ItBE_Addon_SLD_01;
	description = "Lehký opasek žoldáka";
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArSLD;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_SLD_01()
{
	SLD01_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_POINT] += Belt_Prot_01;

	if(SLDArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus01;
		self.protection[PROT_BLUNT] += BA_Bonus01;
		self.protection[PROT_POINT] += BA_Bonus01;
	};
};

func void UnEquip_ItBE_Addon_SLD_01()
{
	SLD01_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_POINT] -= Belt_Prot_01;

	if(SLDArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus01;
		self.protection[PROT_BLUNT] -= BA_Bonus01;
		self.protection[PROT_POINT] -= BA_Bonus01;
	};
};

instance ItBE_Addon_SLD_02(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_SLD_02;
	visual = "ItBe_Sld_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	on_equip = Equip_ItBE_Addon_SLD_02;
	on_unequip = UnEquip_ItBE_Addon_SLD_02;
	description = "Opasek žoldáka";
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_02;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_02;
	text[3] = NAME_Addon_BeArMediumSLD;
	count[3] = BA_Bonus02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_SLD_02()
{
	SLD02_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_02;
	self.protection[PROT_BLUNT] += Belt_Prot_02;
	self.protection[PROT_POINT] += Belt_Prot_02;

	if(SLDMediumArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus02;
		self.protection[PROT_BLUNT] += BA_Bonus02;
		self.protection[PROT_POINT] += BA_Bonus02;
	};
};

func void UnEquip_ItBE_Addon_SLD_02()
{
	SLD02_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_02;
	self.protection[PROT_BLUNT] -= Belt_Prot_02;
	self.protection[PROT_POINT] -= Belt_Prot_02;

	if(SLDMediumArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus02;
		self.protection[PROT_BLUNT] -= BA_Bonus02;
		self.protection[PROT_POINT] -= BA_Bonus02;
	};
};

instance ItBE_Addon_SLD_03(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_SLD_03;
	visual = "ItBe_Mil_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	on_equip = Equip_ItBE_Addon_SLD_03;
	on_unequip = UnEquip_ItBE_Addon_SLD_03;
	description = "Těžký opasek žoldáka";
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_03;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_03;
	text[3] = NAME_Addon_BeArHeavySLD;
	count[3] = BA_Bonus03;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_SLD_03()
{
	SLD03_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_03;
	self.protection[PROT_BLUNT] += Belt_Prot_03;
	self.protection[PROT_POINT] += Belt_Prot_03;

	if(SLDHeavyArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus03;
		self.protection[PROT_BLUNT] += BA_Bonus03;
		self.protection[PROT_POINT] += BA_Bonus03;
	};
};

func void UnEquip_ItBE_Addon_SLD_03()
{
	SLD03_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_03;
	self.protection[PROT_BLUNT] -= Belt_Prot_03;
	self.protection[PROT_POINT] -= Belt_Prot_03;

	if(SLDHeavyArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus03;
		self.protection[PROT_BLUNT] -= BA_Bonus03;
		self.protection[PROT_POINT] -= BA_Bonus03;
	};
};

instance ItBE_Addon_MC(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_MC;
	visual = "ItBe_Crw_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBE_Addon_MC;
	on_unequip = UnEquip_ItBE_Addon_MC;
	description = "Opasek z krunýřů důlního červa";
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_02;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_02;
	text[3] = NAME_Addon_BeArMC;
	count[3] = BA_Bonus02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_MC()
{
	MC_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_02;
	self.protection[PROT_BLUNT] += Belt_Prot_02;
	self.protection[PROT_POINT] += Belt_Prot_02;

	if(MCArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus02;
		self.protection[PROT_BLUNT] += BA_Bonus02;
		self.protection[PROT_POINT] += BA_Bonus02;
	};
};

func void UnEquip_ItBE_Addon_MC()
{
	MC_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_02;
	self.protection[PROT_BLUNT] -= Belt_Prot_02;
	self.protection[PROT_POINT] -= Belt_Prot_02;

	if(MCArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus02;
		self.protection[PROT_BLUNT] -= BA_Bonus02;
		self.protection[PROT_POINT] -= BA_Bonus02;
	};
};

instance ItBE_Addon_NOV_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_NOV_01;
	visual = "ItBe_NovMage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 30;
	on_equip = Equip_ItBE_Addon_NOV_01;
	on_unequip = UnEquip_ItBE_Addon_NOV_01;
	description = "Šerpa novice";
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Fire;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Magic;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArNOV;
	count[3] = BA_Bonus01;
	text[4] = NAME_Bonus_IntStaff;
	count[4] = BA_Bonus_Int_01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_NOV_01()
{
	NOV01_Equipped = TRUE;
	self.protection[PROT_MAGIC] += Belt_Prot_01;
	self.protection[PROT_FIRE] += Belt_Prot_01;

	if(NOVArmor_Equipped == TRUE)
	{
		self.protection[PROT_MAGIC] += BA_Bonus01;
		self.protection[PROT_FIRE] += BA_Bonus01;
	};

	ATR_INTELLECT += BA_Bonus_Int_01;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

func void UnEquip_ItBE_Addon_NOV_01()
{
	NOV01_Equipped = FALSE;
	self.protection[PROT_MAGIC] -= Belt_Prot_01;
	self.protection[PROT_FIRE] -= Belt_Prot_01;

	if(NOVArmor_Equipped == TRUE)
	{
		self.protection[PROT_MAGIC] -= BA_Bonus01;
		self.protection[PROT_FIRE] -= BA_Bonus01;
	};

	ATR_INTELLECT -= BA_Bonus_Int_01;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

instance ItBE_Addon_KDF_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_KDF_01;
	visual = "ItBe_Mage_01.3DS";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 250;
	on_equip = Equip_ItBE_Addon_KDF_01;
	on_unequip = UnEquip_ItBE_Addon_KDF_01;
	description = "Šerpa mága";
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Fire;
	count[1] = Belt_Prot_02;
	text[2] = NAME_Prot_Magic;
	count[2] = Belt_Prot_02;
	text[3] = NAME_Addon_BeArKDF;
	count[3] = BA_Bonus02;
	text[4] = NAME_Bonus_IntStaff;
	count[4] = BA_Bonus_Int_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_KDF_01()
{
	KDF01_Equipped = TRUE;
	self.protection[PROT_MAGIC] += Belt_Prot_02;
	self.protection[PROT_FIRE] += Belt_Prot_02;

	if(KDFArmor_Equipped == TRUE)
	{
		self.protection[PROT_MAGIC] += BA_Bonus02;
		self.protection[PROT_FIRE] += BA_Bonus02;
	};

	ATR_INTELLECT += BA_Bonus_Int_02;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

func void UnEquip_ItBE_Addon_KDF_01()
{
	KDF01_Equipped = FALSE;
	self.protection[PROT_MAGIC] -= Belt_Prot_02;
	self.protection[PROT_FIRE] -= Belt_Prot_02;

	if(KDFArmor_Equipped == TRUE)
	{
		self.protection[PROT_MAGIC] -= BA_Bonus02;
		self.protection[PROT_FIRE] -= BA_Bonus02;
	};

	ATR_INTELLECT -= BA_Bonus_Int_02;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

instance ItBE_Addon_KDF_02(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_KDF_02;
	visual = "ItBe_Mage_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 500;
	on_equip = Equip_ItBE_Addon_KDF_02;
	on_unequip = UnEquip_ItBE_Addon_KDF_02;
	description = "Šerpa vysokého mága";
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Fire;
	count[1] = Belt_Prot_03;
	text[2] = NAME_Prot_Magic;
	count[2] = Belt_Prot_03;
	text[3] = NAME_Addon_BeArHeavyKDF;
	count[3] = BA_Bonus03;
	text[4] = NAME_Bonus_IntStaff;
	count[4] = BA_Bonus_Int_03;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_KDF_02()
{
	KDF02_Equipped = TRUE;
	self.protection[PROT_MAGIC] += Belt_Prot_03;
	self.protection[PROT_FIRE] += Belt_Prot_03;

	if(KDFHeavyArmor_Equipped == TRUE)
	{
		self.protection[PROT_MAGIC] += BA_Bonus03;
		self.protection[PROT_FIRE] += BA_Bonus03;
	};

	ATR_INTELLECT += BA_Bonus_Int_03;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

func void UnEquip_ItBE_Addon_KDF_02()
{
	KDF02_Equipped = FALSE;
	self.protection[PROT_MAGIC] -= Belt_Prot_03;
	self.protection[PROT_FIRE] -= Belt_Prot_03;

	if(KDFHeavyArmor_Equipped == TRUE)
	{
		self.protection[PROT_MAGIC] -= BA_Bonus03;
		self.protection[PROT_FIRE] -= BA_Bonus03;
	};

	ATR_INTELLECT -= BA_Bonus_Int_03;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

instance ItBE_Addon_KDF_03(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_KDF_03;
	visual = "ItBe_Mage_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 750;
	on_equip = Equip_ItBE_Addon_KDF_03;
	on_unequip = UnEquip_ItBE_Addon_KDF_03;
	description = "Šerpa arcimága";
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Fire;
	count[1] = Belt_Prot_04;
	text[2] = NAME_Prot_Magic;
	count[2] = Belt_Prot_04;
	text[3] = NAME_Addon_BeArArchKDF;
	count[3] = BA_Bonus04;
	text[4] = NAME_Bonus_IntStaff;
	count[4] = BA_Bonus_Int_04;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_KDF_03()
{
	KDF03_Equipped = TRUE;
	self.protection[PROT_MAGIC] += Belt_Prot_04;
	self.protection[PROT_FIRE] += Belt_Prot_04;

	if(KDFArchArmor_Equipped == TRUE)
	{
		self.protection[PROT_MAGIC] += BA_Bonus04;
		self.protection[PROT_FIRE] += BA_Bonus04;
	};

	ATR_INTELLECT += BA_Bonus_Int_04;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

func void UnEquip_ItBE_Addon_KDF_03()
{
	KDF03_Equipped = FALSE;
	self.protection[PROT_MAGIC] -= Belt_Prot_04;
	self.protection[PROT_FIRE] -= Belt_Prot_04;

	if(KDFArchArmor_Equipped == TRUE)
	{
		self.protection[PROT_MAGIC] -= BA_Bonus04;
		self.protection[PROT_FIRE] -= BA_Bonus04;
	};

	ATR_INTELLECT -= BA_Bonus_Int_04;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

instance ItBE_Addon_DJG_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_DJG_01;
	visual = "ItBe_Mage_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	on_equip = Equip_ItBE_Addon_DJG_01;
	on_unequip = UnEquip_ItBE_Addon_DJG_01;
	description = "Opasek drakobijce";
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_04;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Prot_04;
	text[3] = NAME_Addon_BeArDJG;
	count[3] = BA_Bonus04;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_DJG_01()
{
	DJG01_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_04;
	self.protection[PROT_BLUNT] += Belt_Prot_04;
	self.protection[PROT_POINT] += Belt_Prot_04;

	if(DJGArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus04;
		self.protection[PROT_BLUNT] += BA_Bonus04;
		self.protection[PROT_POINT] += BA_Bonus04;
	};
};

func void UnEquip_ItBE_Addon_DJG_01()
{
	DJG01_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_04;
	self.protection[PROT_BLUNT] -= Belt_Prot_04;
	self.protection[PROT_POINT] -= Belt_Prot_04;

	if(DJGArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus04;
		self.protection[PROT_BLUNT] -= BA_Bonus04;
		self.protection[PROT_POINT] -= BA_Bonus04;
	};
};

instance ItBE_Addon_SEK_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_SEK_01;
	visual = "ItBe_SecNov_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	on_equip = Equip_ItBE_Addon_SEK_01;
	on_unequip = UnEquip_ItBE_Addon_SEK_01;
	description = "Šerpa novice Bratrstva";
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_01;
	text[2] = NAME_Prot_Magic;
	count[2] = Belt_Prot_01;
	text[3] = NAME_Addon_BeArSEK;
	count[3] = BA_Bonus01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBE_Addon_SEK_01()
{
	SEK01_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_01;
	self.protection[PROT_BLUNT] += Belt_Prot_01;
	self.protection[PROT_MAGIC] += Belt_Prot_01;

	if(SEKArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus01;
		self.protection[PROT_BLUNT] += BA_Bonus01;
		self.protection[PROT_MAGIC] += BA_Bonus01;
	};
};

func void UnEquip_ItBE_Addon_SEK_01()
{
	SEK01_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_01;
	self.protection[PROT_BLUNT] -= Belt_Prot_01;
	self.protection[PROT_MAGIC] -= Belt_Prot_01;

	if(SEKArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus01;
		self.protection[PROT_BLUNT] -= BA_Bonus01;
		self.protection[PROT_MAGIC] -= BA_Bonus01;
	};
};

instance ItBE_Addon_TPL_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_TPL_01;
	visual = "ItBe_TPL_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	on_equip = Equip_ItBE_Addon_TPL_01;
	on_unequip = UnEquip_ItBE_Addon_TPL_01;
	description = "Opasek templáře";
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_02;
	text[2] = NAME_Prot_Magic;
	count[2] = Belt_Prot_02;
	text[3] = NAME_Addon_BeArTPL;
	count[3] = BA_Bonus02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBE_Addon_TPL_01()
{
	TPL01_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_02;
	self.protection[PROT_BLUNT] += Belt_Prot_02;
	self.protection[PROT_MAGIC] += Belt_Prot_02;

	if(TPLArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus02;
		self.protection[PROT_BLUNT] += BA_Bonus02;
		self.protection[PROT_MAGIC] += BA_Bonus02;
	};
};

func void UnEquip_ItBE_Addon_TPL_01()
{
	TPL01_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_02;
	self.protection[PROT_BLUNT] -= Belt_Prot_02;
	self.protection[PROT_MAGIC] -= Belt_Prot_02;

	if(TPLArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus02;
		self.protection[PROT_BLUNT] -= BA_Bonus02;
		self.protection[PROT_MAGIC] -= BA_Bonus02;
	};
};

instance ItBE_Addon_GUR_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_GUR_01;
	visual = "ItBe_Gur_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 200;
	on_equip = Equip_ItBE_Addon_GUR_01;
	on_unequip = UnEquip_ItBE_Addon_GUR_01;
	description = "Šerpa Guru Bratrstva";
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Prot_03;
	text[2] = NAME_Prot_Magic;
	count[2] = Belt_Prot_03;
	text[3] = NAME_Addon_BeArGUR;
	count[3] = BA_Bonus03;
	text[4] = NAME_Bonus_IntStaff;
	count[4] = BA_Bonus_Int_04;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBE_Addon_GUR_01()
{
	GUR01_Equipped = TRUE;
	self.protection[PROT_EDGE] += Belt_Prot_03;
	self.protection[PROT_BLUNT] += Belt_Prot_03;
	self.protection[PROT_MAGIC] += Belt_Prot_03;

	if(GURArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] += BA_Bonus03;
		self.protection[PROT_BLUNT] += BA_Bonus03;
		self.protection[PROT_MAGIC] += BA_Bonus03;
	};

	ATR_INTELLECT += BA_Bonus_Int_04;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};

func void UnEquip_ItBE_Addon_GUR_01()
{
	GUR01_Equipped = FALSE;
	self.protection[PROT_EDGE] -= Belt_Prot_03;
	self.protection[PROT_BLUNT] -= Belt_Prot_03;
	self.protection[PROT_MAGIC] -= Belt_Prot_03;

	if(GURArmor_Equipped == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_Bonus03;
		self.protection[PROT_BLUNT] -= BA_Bonus03;
		self.protection[PROT_MAGIC] -= BA_Bonus03;
	};

	ATR_INTELLECT -= BA_Bonus_Int_04;

	if(ATR_INTELLECT < 1)
	{
		ATR_INTELLECT = 1;
	};

	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
};


//------------------------------Vory----------------------------------

instance ItBe_Addon_Thief_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_THF_01;
	visual = "ItBe_Sld_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Thief_01;
	on_unequip = UnEquip_ItBe_Addon_Thief_01;
	description = "Opasek šejdíře";
	text[1] = NAME_Bonus_Dex;
	count[1] = BeltBonus_DEX01;
	text[2] = NAME_Addon_BeArTHF;
	count[2] = BeltBonus_DEX_THF_01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBe_Addon_Thief_01()
{
	THF_Equipped_01 = TRUE;
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX01);
	Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX01;

	if(IS_LOVCACH_ARMOR == TRUE)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_01);
		Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_01;
	};
};

func void UnEquip_ItBe_Addon_Thief_01()
{
	THF_Equipped_01 = FALSE;
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX01);
	Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX01;

	if(IS_LOVCACH_ARMOR == TRUE)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_01);
		Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_01;
	};
	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItBe_Addon_Thief_02(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_THF_02;
	visual = "ItBe_Sld_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Thief_02;
	on_unequip = UnEquip_ItBe_Addon_Thief_02;
	description = "Opasek stínu";
	text[1] = NAME_Bonus_Dex;
	count[1] = BeltBonus_DEX02;
	text[2] = NAME_Addon_BeArTHF;
	count[2] = BeltBonus_DEX_THF_02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_Thief_02()
{
	THF_Equipped_02 = TRUE;
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX02);
	Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX02;

	if(IS_LOVCACH_ARMOR == TRUE)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_02);
		Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_02;
	};
};

func void UnEquip_ItBe_Addon_Thief_02()
{
	THF_Equipped_02 = FALSE;
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX02);
	Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX02;

	if(IS_LOVCACH_ARMOR == TRUE)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_02);
		Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_02;
	};

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItBe_Addon_Thief_03(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_THF_03;
	visual = "ItBe_Mil_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Thief_03;
	on_unequip = UnEquip_ItBe_Addon_Thief_03;
	description = "Opasek mistra zloděje";
	text[1] = NAME_Bonus_Dex;
	count[1] = BeltBonus_DEX03;
	text[2] = NAME_Addon_BeArTHF;
	count[2] = BeltBonus_DEX_THF_03;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_Thief_03()
{
	THF_Equipped_03 = TRUE;
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX03);
	Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX03;

	if(IS_LOVCACH_ARMOR == TRUE)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX_THF_03);
		Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX_THF_03;
	};
};

func void UnEquip_ItBe_Addon_Thief_03()
{
	THF_Equipped_03 = FALSE;
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX03);
	Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX03;

	if(IS_LOVCACH_ARMOR == TRUE)
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX_THF_03);
		Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX_THF_03;
	};

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

//------------------------------Vory----------------------------------

instance ItBe_Addon_STR_5(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_STR_5;
	visual = "ItBe_Leather_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_STR_5;
	on_unequip = UnEquip_ItBe_Addon_STR_5;
	description = "Opasek hrubé síly";
	text[1] = NAME_Bonus_Str;
	count[1] = BeltBonus_STR01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_STR_5()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,BeltBonus_STR01);
	Delta_Bonus_Str = Delta_Bonus_Str + BeltBonus_STR01;
};

func void UnEquip_ItBe_Addon_STR_5()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-BeltBonus_STR01);
	Delta_Bonus_Str = Delta_Bonus_Str - BeltBonus_STR01;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ItBe_Addon_STR_10(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_STR_10;
	visual = "ItBe_Leather_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_STR_10;
	on_unequip = UnEquip_ItBe_Addon_STR_10;
	description = "Opasek síly";
	text[1] = NAME_Bonus_Str;
	count[1] = BeltBonus_STR02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBe_Addon_STR_10()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,BeltBonus_STR02);
	Delta_Bonus_Str = Delta_Bonus_Str + BeltBonus_STR02;
};

func void UnEquip_ItBe_Addon_STR_10()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-BeltBonus_STR02);
	Delta_Bonus_Str = Delta_Bonus_Str - BeltBonus_STR02;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ItBe_Addon_DEX_5(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_DEX_5;
	visual = "ItBe_Sld_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_DEX_5;
	on_unequip = UnEquip_ItBe_Addon_DEX_5;
	description = "Opasek zručnosti";
	text[1] = NAME_Bonus_Dex;
	count[1] = BeltBonus_DEX01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBe_Addon_DEX_5()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX01);
	Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX01;
};

func void UnEquip_ItBe_Addon_DEX_5()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX01);
	Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX01;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItBe_Addon_DEX_10(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_DEX_10;
	visual = "ItBe_Sld_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_DEX_10;
	on_unequip = UnEquip_ItBe_Addon_DEX_10;
	description = "Opasek obratnosti";
	text[1] = NAME_Bonus_Dex;
	count[1] = BeltBonus_DEX02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_DEX_10()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BeltBonus_DEX02);
	Delta_Bonus_Dex = Delta_Bonus_Dex + BeltBonus_DEX02;
};

func void UnEquip_ItBe_Addon_DEX_10()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BeltBonus_DEX02);
	Delta_Bonus_Dex = Delta_Bonus_Dex - BeltBonus_DEX02;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};

instance ItBe_Addon_Prot_EDGE(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_Prot_Edge;
	visual = "ItBe_Sld_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_EDGE;
	on_unequip = UnEquip_ItBe_Addon_Prot_EDGE;
	description = "Opasek gladiátora";
	text[1] = NAME_Prot_Phis;
	count[1] = BeltBonus_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_Prot_EDGE()
{
	self.protection[PROT_EDGE] += BeltBonus_ProtEdge;
	self.protection[PROT_BLUNT] += BeltBonus_ProtEdge;
};

func void UnEquip_ItBe_Addon_Prot_EDGE()
{
	self.protection[PROT_EDGE] -= BeltBonus_ProtEdge;
	self.protection[PROT_BLUNT] -= BeltBonus_ProtEdge;
};

instance ItBe_Addon_Prot_Point(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_Prot_Point;
	visual = "ItBe_Sld_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_Point;
	on_unequip = UnEquip_ItBe_Addon_Prot_Point;
	description = "Opasek dubové kůže";
	text[1] = NAME_Prot_Point;
	count[1] = BeltBonus_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBe_Addon_Prot_Point()
{
	self.protection[PROT_POINT] += BeltBonus_ProtPoint;
};

func void UnEquip_ItBe_Addon_Prot_Point()
{
	self.protection[PROT_POINT] -= BeltBonus_ProtPoint;
};


instance ItBe_Addon_Prot_MAGIC(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_Prot_Magic;
	visual = "ItBe_NovMage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_MAGIC;
	on_unequip = UnEquip_ItBe_Addon_Prot_MAGIC;
	description = "Šerpa magické ochrany";
	text[1] = NAME_Prot_Magic;
	count[1] = BeltBonus_ProtMagic;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBe_Addon_Prot_MAGIC()
{
	self.protection[PROT_MAGIC] += BeltBonus_ProtMagic;
};

func void UnEquip_ItBe_Addon_Prot_MAGIC()
{
	self.protection[PROT_MAGIC] -= BeltBonus_ProtMagic;
};


instance ItBe_Addon_Prot_FIRE(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_Prot_Fire;
	visual = "ItBe_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_FIRE;
	on_unequip = UnEquip_ItBe_Addon_Prot_FIRE;
	description = "Opasek žhavé lávy";
	text[1] = NAME_Prot_Fire;
	count[1] = BeltBonus_ProtFire;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_Prot_FIRE()
{
	self.protection[PROT_FIRE] += BeltBonus_ProtFire;
};

func void UnEquip_ItBe_Addon_Prot_FIRE()
{
	self.protection[PROT_FIRE] -= BeltBonus_ProtFire;
};


instance ItBe_Addon_Prot_EdgPoi(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION | ITEM_MULTI;
	value = Value_ItBE_Addon_Prot_EdgPoi;
	visual = "ItBe_Leather_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_EdgPoi;
	on_unequip = UnEquip_ItBe_Addon_Prot_EdgPoi;
	description = "Opasek ochrany";
	text[1] = NAME_Prot_Phis;
	count[1] = 15;
	text[3] = NAME_Prot_Point;
	count[3] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBe_Addon_Prot_EdgPoi()
{
	self.protection[PROT_EDGE] += 15;
	self.protection[PROT_BLUNT] += 15;
	self.protection[PROT_POINT] += 10;
};

func void UnEquip_ItBe_Addon_Prot_EdgPoi()
{
	self.protection[PROT_EDGE] -= 15;
	self.protection[PROT_BLUNT] -= 15;
	self.protection[PROT_POINT] -= 10;
};


instance ItBe_Addon_Prot_TOTAL(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = Value_ItBE_Addon_Prot_Total;
	visual = "ItBe_Leather_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Prot_TOTAL;
	on_unequip = UnEquip_ItBe_Addon_Prot_TOTAL;
	description = "Opasek nezranitelnosti";
	text[1] = NAME_Prot_Phis;
	count[1] = BeltBonus_ProtTotal;
	text[2] = NAME_Prot_Point;
	count[2] = BeltBonus_ProtTotal;
	text[3] = NAME_Prot_Magic;
	count[3] = BeltBonus_ProtTotal;
	text[4] = NAME_Prot_Fire;
	count[4] = BeltBonus_ProtTotal;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};


func void Equip_ItBe_Addon_Prot_TOTAL()
{
	self.protection[PROT_EDGE] += BeltBonus_ProtTotal;
	self.protection[PROT_BLUNT] += BeltBonus_ProtTotal;
	self.protection[PROT_POINT] += BeltBonus_ProtTotal;
	self.protection[PROT_MAGIC] += BeltBonus_ProtTotal;
	self.protection[PROT_FIRE] += BeltBonus_ProtTotal;
};

func void UnEquip_ItBe_Addon_Prot_TOTAL()
{
	self.protection[PROT_EDGE] -= BeltBonus_ProtTotal;
	self.protection[PROT_BLUNT] -= BeltBonus_ProtTotal;
	self.protection[PROT_POINT] -= BeltBonus_ProtTotal;
	self.protection[PROT_MAGIC] -= BeltBonus_ProtTotal;
	self.protection[PROT_FIRE] -= BeltBonus_ProtTotal;
};


//------------------------------------------------------------------------------------

instance ItBe_Addon_Custom_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 500;
	visual = "ItBe_Sld_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Custom_01;
	on_unequip = UnEquip_ItBe_Addon_Custom_01;
	description = "Opasek z plazí kůže";
	text[1] = NAME_Prot_Phis;
	count[1] = BA_Hunt01;
	text[2] = NAME_Prot_Point;
	count[2] = BA_Hunt01;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_Custom_01()
{
	self.protection[PROT_EDGE] += BA_Hunt01;
	self.protection[PROT_BLUNT] += BA_Hunt01;
	self.protection[PROT_POINT] += BA_Hunt01;
};

func void UnEquip_ItBe_Addon_Custom_01()
{
	self.protection[PROT_EDGE] -= BA_Hunt01;
	self.protection[PROT_BLUNT] -= BA_Hunt01;
	self.protection[PROT_POINT] -= BA_Hunt01;
};

instance ItBe_Addon_Custom_02(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 1000;
	visual = "ItBe_Leather_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Custom_02;
	on_unequip = UnEquip_ItBe_Addon_Custom_02;
	description = "Opasek z vlčí kůže";
	text[1] = NAME_Prot_Phis;
	count[1] = BA_Hunt02;
	text[2] = NAME_Prot_Point;
	count[2] = BA_Hunt02;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_Custom_02()
{
	self.protection[PROT_EDGE] += BA_Hunt02;
	self.protection[PROT_BLUNT] += BA_Hunt02;
	self.protection[PROT_POINT] += BA_Hunt02;
};

func void UnEquip_ItBe_Addon_Custom_02()
{
	self.protection[PROT_EDGE] -= BA_Hunt02;
	self.protection[PROT_BLUNT] -= BA_Hunt02;
	self.protection[PROT_POINT] -= BA_Hunt02;
};

instance ItBe_Addon_Custom_03(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 1500;
	visual = "ItBe_Sld_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Custom_03;
	on_unequip = UnEquip_ItBe_Addon_Custom_03;
	description = "Opasek z kůže warga";
	text[1] = NAME_Prot_Phis;
	count[1] = BA_Hunt03;
	text[2] = NAME_Prot_Point;
	count[2] = BA_Hunt03;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_Custom_03()
{
	self.protection[PROT_EDGE] += BA_Hunt03;
	self.protection[PROT_BLUNT] += BA_Hunt03;
	self.protection[PROT_POINT] += BA_Hunt03;
};

func void UnEquip_ItBe_Addon_Custom_03()
{
	self.protection[PROT_EDGE] -= BA_Hunt03;
	self.protection[PROT_BLUNT] -= BA_Hunt03;
	self.protection[PROT_POINT] -= BA_Hunt03;
};

instance ItBe_Addon_Custom_04(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 2000;
	visual = "ItBe_Mil_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_Custom_04;
	on_unequip = UnEquip_ItBe_Addon_Custom_04;
	description = "Opasek z trolí kůže";
	text[1] = NAME_Prot_Phis;
	count[1] = BA_Hunt04;
	text[2] = NAME_Prot_Point;
	count[2] = BA_Hunt04;
	text[3] = NAME_Bonus_Fly;
	count[3] = BA_Bonus_Fly_Clr;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_Custom_04()
{
	self.protection[PROT_EDGE] += BA_Hunt04;
	self.protection[PROT_BLUNT] += BA_Hunt04;
	self.protection[PROT_POINT] += BA_Hunt04;
	self.protection[PROT_FLY] += BA_Bonus_Fly;
};

func void UnEquip_ItBe_Addon_Custom_04()
{
	self.protection[PROT_EDGE] -= BA_Hunt04;
	self.protection[PROT_BLUNT] -= BA_Hunt04;
	self.protection[PROT_POINT] -= BA_Hunt04;
	self.protection[PROT_FLY] -= BA_Bonus_Fly;
};

instance ItBe_Addon_BT_01(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 3000;
	visual = "ItBe_Mage_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_Addon_BT_01;
	on_unequip = UnEquip_ItBe_Addon_BT_01;
	description = "Opasek z kůže černého trola";
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_BT_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_BT_02;
	text[3] = NAME_Bonus_Fly;
	count[3] = BT_Bonus_Fly_Clr;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_Addon_BT_01()
{
	self.protection[PROT_EDGE] += Belt_BT_01;
	self.protection[PROT_BLUNT] += Belt_BT_01;
	self.protection[PROT_POINT] += Belt_BT_02;
	self.protection[PROT_FLY] += BT_Bonus_Fly;
};

func void UnEquip_ItBe_Addon_BT_01()
{
	self.protection[PROT_EDGE] -= Belt_BT_01;
	self.protection[PROT_BLUNT] -= Belt_BT_01;
	self.protection[PROT_POINT] -= Belt_BT_02;
	self.protection[PROT_FLY] -= BT_Bonus_Fly;
};

instance ItBe_NordmarBelt(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = 3500;
	visual = "ItBe_Mage_02.3ds";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 300;
	material = MAT_METAL;
	on_equip = Equip_ItBe_NordmarBelt;
	on_unequip = UnEquip_ItBe_NordmarBelt;
	description = "Opasek Nordmařana";
	text[0] = NAME_Bonus_Str;
	count[0] = Belt_Nordmar_00;
	text[1] = NAME_Prot_Phis;
	count[1] = Belt_Nordmar_01;
	text[2] = NAME_Prot_Point;
	count[2] = Belt_Nordmar_02;
	text[3] = NAME_Prot_Fire;
	count[3] = Belt_Nordmar_03;
	text[4] = NAME_Prot_Magic;
	count[4] = Belt_Nordmar_04;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_NordmarBelt()
{
	self.protection[PROT_EDGE] += Belt_Nordmar_01;
	self.protection[PROT_BLUNT] += Belt_Nordmar_01;
	self.protection[PROT_POINT] += Belt_Nordmar_02;
	self.protection[PROT_FIRE] += Belt_Nordmar_03;
	self.protection[PROT_MAGIC] += Belt_Nordmar_04;

	Npc_ChangeAttribute(self,ATR_STRENGTH,Belt_Nordmar_00);
	Delta_Bonus_Str = Delta_Bonus_Str + Belt_Nordmar_00;
};

func void UnEquip_ItBe_NordmarBelt()
{
	self.protection[PROT_EDGE] -= Belt_Nordmar_01;
	self.protection[PROT_BLUNT] -= Belt_Nordmar_01;
	self.protection[PROT_POINT] -= Belt_Nordmar_02;
	self.protection[PROT_FIRE] -= Belt_Nordmar_03;
	self.protection[PROT_MAGIC] -= Belt_Nordmar_04;

	Npc_ChangeAttribute(self,ATR_STRENGTH,-Belt_Nordmar_00);
	Delta_Bonus_Str = Delta_Bonus_Str - Belt_Nordmar_00;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ItBe_DragonBelt(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI | ITEM_MISSION;
	value = 5000;
	visual = "ItBe_Mage_02.3ds";
	visual_skin = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 450;
	material = MAT_METAL;
	on_equip = Equip_ItBe_DragonBelt;
	on_unequip = UnEquip_ItBe_DragonBelt;
	description = "Opasek z dračích šupin";
	text[0] = NAME_Bonus_Str;
	count[0] = DrgBonus_01;
	text[1] = NAME_Bonus_Dex;
	count[1] = DrgBonus_01;
	text[2] = NAME_Prot_Phis;
	count[2] = DrgBonus_02;
	text[3] = NAME_Prot_Point;
	count[3] = DrgBonus_03;
	text[4] = NAME_Prot_Fire;
	count[4] = DrgBonus_04;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 0;
};

func void Equip_ItBe_DragonBelt()
{
	self.protection[PROT_EDGE] += DrgBonus_02;
	self.protection[PROT_BLUNT] += DrgBonus_02;
	self.protection[PROT_POINT] += DrgBonus_03;
	self.protection[PROT_FIRE] += DrgBonus_04;

	Npc_ChangeAttribute(self,ATR_STRENGTH,DrgBonus_01);
	Delta_Bonus_Str = Delta_Bonus_Str + DrgBonus_01;

	Npc_ChangeAttribute(self,ATR_DEXTERITY,DrgBonus_01);
	Delta_Bonus_Dex = Delta_Bonus_Dex + DrgBonus_01;
};

func void UnEquip_ItBe_DragonBelt()
{
	self.protection[PROT_EDGE] -= DrgBonus_02;
	self.protection[PROT_BLUNT] -= DrgBonus_02;
	self.protection[PROT_POINT] -= DrgBonus_03;
	self.protection[PROT_FIRE] -= DrgBonus_04;

	Npc_ChangeAttribute(self,ATR_STRENGTH,-DrgBonus_01);
	Delta_Bonus_Str = Delta_Bonus_Str - DrgBonus_01;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};

	Npc_ChangeAttribute(self,ATR_DEXTERITY,-DrgBonus_01);
	Delta_Bonus_Dex = Delta_Bonus_Dex - DrgBonus_01;

	if(Delta_Bonus_Dex < 0)
	{
		Delta_Bonus_Dex = 0;
	};
};