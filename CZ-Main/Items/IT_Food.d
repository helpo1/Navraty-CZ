const int HP_Apple = 1;
const int HP_Honey = 2;
const int HP_Cheese = 3;
const int HP_Bread = 4;
const int HP_Bacon = 5;
const int HP_Meat = 5;
const int HP_Sausage = 5;
const int HP_BeetSoup = 7;
const int HP_FishSoup = 10;
const int HP_Stew = 15;
const int HP_SCHILDKROETESOUP = 20;

const int HP_Booze = 1;
const int HP_Beer = 2;
const int HP_Water = 2;
const int HP_Milk = 3;
const int HP_Wine = 3;

const int Value_Apple = 8;
const int Value_Cheese = 30;
const int Value_Bacon = 50;
const int Value_Bread = 20;
const int Value_Fish = 15;
const int Value_Rawmeat = 3;
const int VALUE_RAWMEATSCHILDKROETE = 5;
const int VALUE_SCHILDKROETESOUP = 25;
const int Value_Meat = 6;
const int Value_Stew = 40;
const int Value_FishSoup = 20;
const int Value_Sausage = 30;
const int Value_Honey = 30;
const int Value_Water = 10;
const int Value_Beer = 15;
const int Value_Booze = 10;
const int Value_Wine = 20;
const int Value_Milk = 15;
const int Mana_Milk = 1;
const int Value_Rawmeat_Mount = 5;

const int Mana_Beer = 1;
const int Mana_Booze = 2;
const int Mana_Wine = 3;
const int Mana_Alcohol = 4;

var int ch_bonus;
var int ba_bonus;
var int br_bonus;
var int sa_bonus;
var int be_bonus;
var int bo_bonus;
var int mi_bonus;
var int wi_bonus;
var int MeetBonus;
var int FishBonus;

const int HP_Grog = 1;
const int HP_Shellflesh = 2;

const int Mana_Rum = 5;
const int Mana_LousHammer = 1;

const int Value_Rum = 15;
const int Value_Grog = 10;
const int Value_SchnellerHering = 30;
const int Value_LousHammer = 15;
const int Value_SchlafHammer = 50;
const int Value_FireStew = 80;
const int Value_Shellflesh = 30;

const int STR_FireStew = 1;
const int STR_MeatSoup = 1;

instance ItFo_Addon_Shellflesh(C_Item)
{
	name = "Ústřice";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Shellflesh;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Shellflesh;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Shellflesh;
	text[4] = "Uvnitř je jemné a šťavnaté maso...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_Shellflesh()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Shellflesh);

	if(Npc_IsPlayer(self) && (RealMode[2] == FALSE))
	{
		Shellflesh_Bonus = Shellflesh_Bonus + 1;

		if(Shellflesh_Bonus == 20)
		{
			if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
			}
			else
			{
				B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,1);
				Snd_Play("LevelUP");
			};
		};

		Hero_Hunger = Hero_Hunger + 1;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Addon_Rum(C_Item)
{
	name = "Rum";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rum;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseRum;
	scemeName = "POTIONFAST";
	description = "Bílý rum";
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Rum;
	text[4] = "Bílý aromatický rum, sen každého námořníka...";
	text[5] = NAME_Value;
	count[5] = Value_Rum;
	inv_animate = 1;
};


func void UseRum()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		Npc_ChangeAttribute(self,ATR_MANA,Mana_Rum);

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};

instance ItFo_Addon_Rum_Skip(C_Item)
{
	name = "Skipův rum";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rum;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseRum_Skip;
	scemeName = "POTIONFAST";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Rum;
	text[2] = NAME_Bonus_Str;
	count[2] = 1;
	text[3] = NAME_Bonus_Dex;
	count[3] = 1;
	text[4] = "Bílý aromatický rum, sen každého námořníka...";
	text[5] = NAME_Value;
	count[5] = Value_Rum;
	inv_animate = 1;
};

func void UseRum_Skip()
{
	var string concatText;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		Npc_ChangeAttribute(self,ATR_MANA,Mana_Rum);
		B_RaiseAttribute_Bonus_Many(self,ATR_STRENGTH,1);
		B_RaiseAttribute_Bonus_Many(self,ATR_DEXTERITY,1);

		if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		};

		concatText = "Síla + 1, obratnost + 1";
		AI_Print(concatText);

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};
	};
};

instance ITFO_ADDON_ORCRUM(C_Item)
{
	name = "Skřetí pití";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_Rum_04.3ds";
	material = MAT_GLAS;
	on_state[0] = useorcrum;
	scemeName = "POTIONFAST";
	description = "Skřetí pití";
	text[3] = "Podivně vypadající skřetí pití...";
	text[4] = "Účinky neznámé...";
	text[5] = NAME_Value;
	count[5] = Value;
	inv_animate = 1;
};

func void useorcrum()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-100);
	};
};

instance ITFO_ADDON_ORCRUMSAL(C_Item)
{
	name = "Lektvar ze skřetího pití";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItMi_Rum_03.3ds";
	material = MAT_GLAS;
	on_state[0] = useorcrumsal;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	inv_animate = TRUE;
	description = "Lektvar ze skřetího pití";
	text[3] = "Magický lektvar uvařený ze skřetího pití...";
	text[4] = "Účinky neznámé...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useorcrumsal()
{
	var string concatText;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};
	if(self.attribute[ATR_STRENGTH] < self.attribute[ATR_DEXTERITY])
	{
		B_RaiseAttribute_Bonus_Many(self,ATR_DEXTERITY,2);
		concatText = "Obratnost + 2, mana - 5";
		AI_Print(concatText);

		if(self.attribute[ATR_MANA_MAX] >= 5)
		{
			B_RaiseAttribute_Bonus_Many(self,ATR_MANA_MAX,-5);
		}
		else
		{
			self.attribute[ATR_MANA_MAX] = 1;
		};
	}
	else
	{
		B_RaiseAttribute_Bonus_Many(self,ATR_STRENGTH,2);
		concatText = "Síla + 2, mana - 10";
		AI_Print(concatText);

		if(self.attribute[ATR_MANA_MAX] >= 10)
		{
			B_RaiseAttribute_Bonus_Many(self,ATR_MANA_MAX,-10);
		}
		else
		{
			self.attribute[ATR_MANA_MAX] = 1;
		};
	};

	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ITFO_ADDON_ORCRUMSALBETA(C_Item)
{
	name = "Elixír ze skřetího pití";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 600;
	visual = "ItMi_Rum_03.3ds";
	material = MAT_GLAS;
	on_state[0] = useorcrumsalbeta;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Elixír ze skřetího pití";
	text[3] = "Magický elixír uvařený ze skřetího pití...";
	text[4] = "Účinky neznámé...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useorcrumsalbeta()
{
	var string concatText;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};
	if(self.attribute[ATR_STRENGTH] < self.attribute[ATR_DEXTERITY])
	{
		B_RaiseAttribute_Bonus_Many(self,ATR_DEXTERITY,3);
		concatText = "Obratnost + 3";
		AI_Print(concatText);
	}
	else
	{
		B_RaiseAttribute_Bonus_Many(self,ATR_STRENGTH,3);
		concatText = "Síla + 3";
		AI_Print(concatText);
	};
};

instance ItFo_Addon_Grog(C_Item)
{
	name = "Grog";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Grog;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseGrog;
	scemeName = "POTIONFAST";
	description = "Grog";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Grog;
	text[2] = NAME_Bonus_Mana;
	count[2] = HP_Grog;
	text[4] = "Horký nápoj připravený z rumu...";
	text[5] = NAME_Value;
	count[5] = Value_Grog;
	inv_animate = 1;
};

func void UseGrog()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Grog);
		Npc_ChangeAttribute(self,ATR_MANA,HP_Grog);

		Hero_Thirst = Hero_Thirst + 1;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};

var int Hammer_Once;

instance ItFo_Addon_LousHammer(C_Item)
{
	name = "Louovo kladivo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_LousHammer;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseLouHammer;
	scemeName = "POTIONFAST";
	description = "Louovo kladivo";
	text[3] = "Velice silný alkoholický nápoj, uvařený podle speciálního receptu...";
	text[4] = "Účinky neznámé...";
	text[5] = NAME_Value;
	count[5] = Value_LousHammer;
	inv_animate = 1;
};

func void UseLouHammer()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(Hammer_Once == FALSE)
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,Mana_LousHammer);
			Hammer_Once = TRUE;
		};

		Hero_Thirst = Hero_Thirst + 1;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};


var int schlafhammer_once;

instance ItFo_Addon_SchlafHammer(C_Item)
{
	name = "Dvojité Louovo kladivo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SchlafHammer;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseSchlafHammer;
	scemeName = "POTIONFAST";
	description = "Dvojité Louovo kladivo";
	text[3] = "Velice silný alkoholický nápoj, který dokáže složit kohokoli...";
	text[4] = "Účinky neznámé...";
	text[5] = NAME_Value;
	count[5] = Value_SchlafHammer;
	inv_animate = 1;
};

func void UseSchlafHammer()
{
	if(self.attribute[ATR_HITPOINTS] > 2)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] / 2;
	};
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(SCHLAFHAMMER_ONCE == FALSE)
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,5);
			SCHLAFHAMMER_ONCE = TRUE;
		};

		Hero_Thirst = Hero_Thirst + 1;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};

instance ItFo_Addon_SchnellerHering(C_Item)
{
	name = "Rychlý sleď";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SchnellerHering;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseSchnellerHering;
	scemeName = "POTIONFAST";
	description = name;
	text[2] = "Velice silná kořalka připravovaná piráty...";
	text[3] = "Dočasně zvyšuje rychlost pohybu...";
	text[4] = NAME_Sec_Duration;
	count[4] = 60;
	text[5] = NAME_Value;
	count[5] = Value_SchnellerHering;
	inv_animate = 1;
};

func void UseSchnellerHering()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		Mdl_ApplyOverlayMdsTimed(self,"Humans_MageSprint.MDS",60000);

		Hero_Thirst = Hero_Thirst + 1;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		Player_KnowsSchnellerHering = TRUE;

		if(bSprintTime == FALSE)
		{
			bSprintTime = 3420;
		};
	};
};


instance ItFo_Addon_SchnellerHering_Ext(C_Item)
{
	name = "Skipův Rychlý sleď";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SchnellerHering;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseSchnellerHering_Ext;
	scemeName = "POTIONFAST";
	description = name;
	text[2] = "Velice silná kořalka připravovaná piráty...";
	text[3] = "Dočasně zvyšuje rychlost pohybu...";
	text[4] = NAME_Sec_Duration;
	count[4] = 60;
	text[5] = NAME_Value;
	count[5] = Value_SchnellerHering;
	inv_animate = 1;
};

func void UseSchnellerHering_Ext()
{
	if(self.id == 0)
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,5);
		Snd_Play3d(hero,"BOTTLE_OPEN");
		Mdl_ApplyOverlayMdsTimed(self,"Humans_MageSprint.MDS",60000);

		Hero_Thirst = Hero_Thirst + 1;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};
	
		Player_KnowsSchnellerHering = TRUE;

		if(bSprintTime == FALSE)
		{
			bSprintTime = 3420;
		};
	};
};

instance ItFo_Addon_Pfeffer_01(C_Item)
{
	name = "Červený pepř";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Pocket_Small.3ds";
	material = MAT_LEATHER;
	description = "Červený pepř";
	text[3] = "Červený pepř pěstovaný na Jižních ostrovech...";
	text[4] = "Pozor! Velice ostré...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItFo_Addon_FireStew(C_Item)
{
	name = "Pálivé nudličky";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FireStew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_FireStew;
	description = "Pálivé nudličky s Louovým kladivem";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_FireStew;
	text[3] = "Pálivé nudličky dochucené Louovým kladivem...";
	text[4] = "Pozor! Velice ostré...";
	text[5] = NAME_Value;
	count[5] = Value_FireStew;
};

func void Use_FireStew()
{
	if(Npc_IsPlayer(self))
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_FireStew);

		Hero_Hunger = Hero_Hunger + 5;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_BeetSoup(C_Item)
{
	name = "Tuřínová polévka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItFo_Soup_New_02.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_BeetSoup;
	description = "Tuřínová polévka";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_BeetSoup;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 5;
	text[4] = "Lahodná horká polévka, uvařená z tuřínů...";
	text[5] = NAME_Value;
	count[5] = 10;
};

func void Use_BeetSoup()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BeetSoup);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 5) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 4;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_Addon_Meatsoup(C_Item)
{
	name = "Masová polévka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FishSoup;
	visual = "ItFo_FishSoup.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_MeatSoup;
	description = "Masová polévka";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_MeatSoup;
	text[4] = "Lahodná horká polévka, uvařená z masa...";
	text[5] = NAME_Value;
	count[5] = Value_FishSoup;
};

func void Use_MeatSoup()
{
	if(Npc_IsPlayer(self))
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_MeatSoup);

		Hero_Hunger = Hero_Hunger + 7;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ITFO_ADDON_SHNAPS_ORKS(C_Item)
{
	name = "Skřetí kořalka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 200;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_ITFO_ADDON_SHNAPS_ORKS;
	scemeName = "POTIONShnapsOrks";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Grog;
	text[2] = NAME_Bonus_Mana;
	count[2] = HP_Grog;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Grog;
	inv_animate = 1;
};


func void Use_ITFO_ADDON_SHNAPS_ORKS()
{
	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(self.attribute[ATR_HITPOINTS] > 100)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 100;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 1;
		};

		Npc_ChangeAttribute(self,ATR_MANA,ATR_MANA_MAX);
		Npc_ChangeAttribute(self,ATR_STAMINA[0],100);

		Hero_Thirst = Hero_Thirst + 1;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};

instance ItFo_Apple(C_Item)
{
	name = "Jablko";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Apple;
	visual = "ItFo_Apple_New.3DS";
	//visual = "G3_Item_Food_Apple_01.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Apple;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Apple;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 5;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Apple;
	inv_animate = 1;
};


func void Use_Apple()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Apple);

	if(Npc_IsPlayer(self))
	{
		Apple_Bonus = Apple_Bonus + 1;

		if((Apple_Bonus == 50) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,1);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 5) / 100);
		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 1;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_GoatCheese(C_Item)
{
	name = "Kozí sýr";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ZIEGENKAESE.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_GoatCheese;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 25;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 5;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Cheese;
	inv_animate = 1;
};


func void Use_GoatCheese()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,25);

	if(Npc_IsPlayer(self))
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,1);
		Snd_Play("LevelUp");
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 5) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Cheese(C_Item)
{
	name = "Sýr";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Cheese;
	visual = "ItFo_Cheese_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Cheese;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Cheese;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 5;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Cheese;
	inv_animate = 1;
};


func void Use_Cheese()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Cheese);
	if(Npc_IsPlayer(self))
	{
		CH_BONUS += 1;

		if((CH_BONUS == 50) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,2);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,2);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 5) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Bacon(C_Item)
{
	name = "Šunka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Bacon;
	visual = "ITFO_BACON.3ds";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Bacon;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Bacon;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Bacon;
	inv_animate = 1;
};


func void Use_Bacon()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bacon);
	if(Npc_IsPlayer(self))
	{
		BA_BONUS += 1;

		if((BA_BONUS == 25) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,3);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,3);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 5;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Bread(C_Item)
{
	name = "Chléb";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Bread;
	visual = "ItFo_Bread_New.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Bread;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Bread;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 5;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Bread;
};


func void Use_Bread()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bread);
	if(Npc_IsPlayer(self))
	{
		BR_BONUS += 1;

		if((BR_BONUS == 50) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,1);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 5) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 3;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Fish(C_Item)
{
	name = "Ryba";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Fish;
	visual = "ItFo_Fish_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Fish;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Fish;
	inv_animate = 1;
};

func void Use_Fish()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		B_Say(self,self,"$COUGH");
	};
};

instance ITFOSCHILDKROETERAW(C_Item)
{
	name = "Želví maso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_RAWMEATSCHILDKROETE;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = use_rawmeatschildkroete;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = VALUE_RAWMEATSCHILDKROETE;
	inv_animate = 1;
};


func void use_rawmeatschildkroete()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		B_Say(self,self,"$COUGH");
	};
};


instance ITFO_SCHILDKROETESOUP(C_Item)
{
	name = "Želví polévka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SCHILDKROETESOUP;
	visual = "ItFo_Soup_New_01.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = use_schildkroetesoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_SCHILDKROETESOUP;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 20;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = VALUE_SCHILDKROETESOUP;
};


func void use_schildkroetesoup()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SCHILDKROETESOUP);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 20) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};
		SCHILDKROETE_BONUS = SCHILDKROETE_BONUS + 1;

		if((SCHILDKROETE_BONUS == 5) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute_Bonus(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
		};

		Hero_Hunger = Hero_Hunger + 7;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_MeetSoup(C_Item)
{
	name = "Masová polévka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SCHILDKROETESOUP;
	visual = "ITFO_TURTLESOUP.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_ItFo_MeetSoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 15;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};

func void Use_ItFo_MeetSoup()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 15) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		MeetSoup_BONUS = MeetSoup_BONUS + 1;

		if((MeetSoup_BONUS == 25) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute_Bonus(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
		};

		Hero_Hunger = Hero_Hunger + 7;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFoMuttonRaw(C_Item)
{
	name = "Syrové maso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_RawMeat;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
	inv_animate = 1;
};

func void Use_RawMeat()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		B_Say(self,self,"$COUGH");
	};
};

instance ItFoMutton(C_Item)
{
	name = "Opečené maso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Meat;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_Meat;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Meat;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 15;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Meat;
	inv_animate = 1;
};


func void Use_Meat()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Meat);

	if(Npc_IsPlayer(self))
	{
		AllMeet_Bonus = AllMeet_Bonus + 1;

		if((AllMeet_Bonus == 50) && (MeetBonus == FALSE) && (RealMode[2] == FALSE))
		{
			MeetBonus = TRUE;
			B_RaiseAttribute_Bonus(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 15) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 4;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItMi_BretMeet(C_Item)
{
	name = "Opečené maso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Meat;
	visual = "ItFoMutton_New.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_ItMi_BretMeet;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Meat;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 15;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Meat;
	inv_animate = 1;
};

func void Use_ItMi_BretMeet()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Meat);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 15) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 4;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ITFOMUTTON_NICLAS(C_Item)
{
	name = "Opečené maso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Meat;
	visual = "ITFO_MUTTONCOOK_SKY.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = use_itfomutton_niclas;
	description = name;
	text[1] = NAME_Bonus_Str;
	count[1] = 1;
	text[2] = NAME_Bonus_HP;
	count[2] = HP_Meat;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 15;
	text[4] = "Tohle maso bylo připraveno podle speciálního receptu...";
	text[5] = NAME_Value;
	count[5] = Value_Meat;
	inv_animate = 1;
};


func void use_itfomutton_niclas()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Meat);

	if(Npc_IsPlayer(self))
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,1);
		Snd_Play("LevelUp");
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 15) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 4;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Stew(C_Item)
{
	name = "Vývar";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Stew;
	visual = "ItFo_Stew_Sky.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_Stew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 20;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};


func void Use_Stew()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 20) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 7;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_XPStew(C_Item)
{
	name = "Theklin vývar";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Stew;
	visual = "ItFo_Stew_Sky.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_XPStew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[2] = NAME_Bonus_Str;
	count[2] = 1;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 20;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};


func void Use_XPStew()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);

	if(Npc_IsPlayer(self))
	{
		Snd_Play("LevelUp");
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,1);
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 20) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 7;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ITFO_NASHSOUP(C_Item)
{
	name = "Nashova polévka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Stew;
	visual = "ITFO_SPECSTEW.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = use_nashsoupstew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[4] = "";
};


func void use_nashsoupstew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);

	if(Npc_IsPlayer(self))
	{
		NASHSOUP_BONUS = NASHSOUP_BONUS + 1;

		if((NASHSOUP_BONUS == 5) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute_Bonus(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
		};

		Hero_Hunger = Hero_Hunger + 6;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_CoragonsBeer(C_Item)
{
	name = "Pivo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Beer;
	visual = "ItFo_Beer.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_CoragonsBeerBeer;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Beer;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Beer;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 5;
	text[4] = "Coragonovo speciální pivo...";
	text[5] = NAME_Value;
	count[5] = Value_Beer;
	inv_animate = 1;
};


func void Use_CoragonsBeerBeer()
{
	var int staminamax;
	var string concatText;
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Beer);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Beer);

	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_MANA_MAX,Mana_Beer);
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_Beer);
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(HP_Beer));
		concatText = ConcatStrings(concatText,", ");
		concatText = ConcatStrings(concatText,PRINT_LearnMANA_MAX);
		concatText = ConcatStrings(concatText,IntToString(Mana_Beer));
		AI_Print(concatText);
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 5) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 3;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};
	};
};


instance ItFo_FishSoup(C_Item)
{
	name = "Rybí polévka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FishSoup;
	visual = "ItFo_FishSoup_Sky.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_FishSoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_FishSoup;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 15;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_FishSoup;
};


func void Use_FishSoup()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FishSoup);

	if(Npc_IsPlayer(self))
	{
		FishSoup_BONUS = FishSoup_BONUS + 1;

		if((FishSoup_BONUS == 40) && (FishBonus == FALSE) && (RealMode[2] == FALSE))
		{
			FishBonus = TRUE;
			B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,1);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 15) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 6;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Sausage(C_Item)
{
	name = "Klobása";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Sausage;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
	inv_animate = 1;
};


func void Use_Sausage()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);
	if(Npc_IsPlayer(self))
	{
		SA_BONUS += 1;

		if((SA_BONUS == 25) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,2);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,2);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 3;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Honey(C_Item)
{
	name = "Med";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Honey;
	visual = "ItFo_Honey_Sky.3DS";
	material = MAT_STONE;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Honey;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Honey;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Honey;
};


func void Use_Honey()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Honey);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Water(C_Item)
{
	name = "Voda";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Water;
	//visual = "ItFo_Water_New.3ds";
	visual = "ItFo_Water.3ds";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_Water;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Water;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 5;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Water;
	inv_animate = 1;
};


func void Use_Water()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Water);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 5) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 4;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};
	};
};

instance ItFo_Beer(C_Item)
{
	name = "Pivo";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Beer;
	visual = "ItFo_Beer.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_Beer;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Beer;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Beer;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 5;
	text[4] = "Pivo 'Temný paladin', uvařeno podle speciálního receptu...";
	text[5] = NAME_Value;
	count[5] = Value_Beer;
	inv_animate = 1;
};


func void Use_Beer()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Beer);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Beer);

	if(Npc_IsPlayer(self))
	{
		BE_BONUS += 1;

		if((BE_BONUS == 50) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,2);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,2);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 5) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 3;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};		

		B_Drunk();
	};
};


instance ItFo_Booze(C_Item)
{
	name = "Kořalka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Booze;
	visual = "ItFo_Booze_New_01.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_Booze;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Booze;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Booze;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 5;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Booze;
	inv_animate = 1;
};


func void Use_Booze()
{
	var int staminamax;
	var int rand;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Booze);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Booze);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 5) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 1;

		if(Hero_Thirst > 1)
		{
			Hero_Thirst = 1;
		};

		B_Drunk();
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

instance ITFO_BOOZE_EXT(C_Item)
{
	name = "Gin";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Booze * 10;
	visual = "ItFo_Booze_New_01.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = use_booze_ext;
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = 10;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 50;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Booze * 10;
	inv_animate = 1;
};

func void use_booze_ext()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Npc_ChangeAttribute(self,ATR_MANA,10);

	if(Npc_IsPlayer(self))
	{
		if(BO_BONUS == FALSE)
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,3);
			Npc_ChangeAttribute(self,ATR_MANA,3);
			Snd_Play("LevelUp");
			BO_BONUS = TRUE;
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 50) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 1;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};


instance ITFO_WINEBERRYS(C_Item)
{
	name = "Hrozen";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItFo_Wineberrys_New_01.3ds";
	on_state[0] = usewineberrys;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 15;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 15;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void usewineberrys()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,15);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 15) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 1;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ItFo_Wine(C_Item)
{
	name = "Víno";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Wine;
	visual = "ItFo_Wine_New_01.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_Wine;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Wine;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Wine;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};


func void Use_Wine()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Wine);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Wine);

	if(Npc_IsPlayer(self))
	{
		WI_BONUS += 1;

		if((WI_BONUS == 50) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,1);
			Npc_ChangeAttribute(self,ATR_MANA,1);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};

instance ItMi_LoaWine(C_Item)
{
	name = "Everluce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItFo_Wine.3DS";
	material = MAT_GLAS;
	description = name;
	text[4] = "Velice drahý druh vína...";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};

instance ItFo_Wine_Loa(C_Item)
{
	name = "Víno";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Wine;
	visual = "ItFo_Wine_New_03.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_ItFo_Wine_Loa;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 2;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Wine;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 10;
	text[4] = "Tohle víno mi dala Loa...";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};

func void Use_ItFo_Wine_Loa()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,2);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Wine);

	if(Npc_IsPlayer(self))
	{
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};
	};
};

instance ItFo_Milk(C_Item)
{
	name = "Mléko";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Milk;
	visual = "ItFo_Milk_New_01.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_Milk;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Milk;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Milk;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Milk;
	inv_animate = 1;
};


func void Use_Milk()
{
	var int staminamax;
	var string concatText;
	var int staminabonus;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Milk);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Milk);
	if(Npc_IsPlayer(self))
	{
		MI_BONUS += 1;

		if((MI_BONUS == 50) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,1);

			if(ATR_STAMINA_MAX[0] < 100)
			{
				staminabonus = 1;
				ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + staminabonus;
				ATR_STAMINA[0] = ATR_STAMINA[0] + 10;
				Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
				concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminabonus));
				concatText = ConcatStrings(concatText," (Celkem: ");
				concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
				concatText = ConcatStrings(concatText,")");
				AI_Print(concatText);
				Snd_Play("LevelUP");
			}
			else
			{
				AI_Print(PRINT_NOMORESTAMINA);
			};
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItPo_AssasinsRareWine(C_Item)
{
	name = "Víno 'Zlatá réva'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItFo_Wine_New_03.3DS";
	material = MAT_GLAS;
	description = name;
	text[4] = "Mimořádně vzácné a velice drahé víno...";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};

instance ItPo_AssasinsRareWine_Use(C_Item)
{
	name = "Víno 'Zlatá réva'";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2000;
	visual = "ItFo_Wine_New_03.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_AssasinsRareWine;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 10;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 30;
	text[4] = "Mimořádně vzácné a velice drahé víno...";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};

func void Use_AssasinsRareWine()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,10);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 30) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};

instance ITFO_SPECWINE(C_Item)
{
	name = "Víno 'Slzy štěstí'";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItFo_Wine_New_03.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = use_specwine;
	description = name;
	text[1] = NAME_BONUS_STAPROC;
	count[1] = 50;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};


func void use_specwine()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");

		if(MIS_FERDSPECWINE == LOG_Running)
		{
			MIS_FERDSPECWINE = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_FERDSPECWINE);
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 50) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};


instance ITFO_SPECWINE_HP(C_Item)
{
	name = "Víno 'Slzy štěstí'";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItFo_Wine_New_03.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = use_specwine_HP;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 5;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 50;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};


func void use_specwine_HP()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,5);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,5);
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 50) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};


instance ITFO_EALBALZAM(C_Item)
{
	name = "Víno 'Balzám prozřetelnosti'";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2000;
	visual = "ItFo_Wine_New_02.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = use_itfo_ealbalzam;
	description = name;
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 3;
	text[2] = NAME_BONUS_MANA_PROC;
	count[2] = 20;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};

func void use_itfo_ealbalzam()
{
	var int staminamax;
	var int manares;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,3);
		manares = (self.attribute[ATR_MANA_MAX] * 20) / 100;
		Npc_ChangeAttribute(self,ATR_MANA,manares);

		if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		};

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};


instance ITFO_EALBALZAMTWO(C_Item)
{
	name = "Víno 'Zapomnění'";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 3000;
	visual = "ItFo_Wine_New_02.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = use_itfo_ealbalzamtwo;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 15;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 50;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};


func void use_itfo_ealbalzamtwo()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,15);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,15);
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 50) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};


instance ITFO_POTTAGE_MUSHROOM(C_Item)
{
	name = "Vývar z otrokových chlebů";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 125;
	visual = "ItFo_Stew_Mushroom.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = use_pottage_mushroom;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 100;
	text[2] = NAME_Bonus_Mana;
	count[2] = 20;
	text[3] = NAME_Prot_Magic;
	count[3] = 1;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_pottage_mushroom()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,100);
		Npc_ChangeAttribute(self,ATR_MANA,20);
		self.protection[PROT_MAGIC] += 1;
		REALPROTMAGIC += 1;
		AI_Print("Ochrana proti magii + 1");
		Snd_Play("LevelUp");

		Hero_Hunger = Hero_Hunger + 7;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ITFO_POTTAGE_MUSHROOM_BLACK(C_Item)
{
	name = "Vývar z tmavých hub";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 180;
	visual = "ITFO_FISHSOUP_SKY.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = use_pottage_mushroom_black;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 50;
	text[2] = NAME_Bonus_Mana;
	count[2] = 15;
	text[3] = NAME_Bonus_ManaMax;
	count[3] = 1;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_pottage_mushroom_black()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,50);
		Npc_ChangeAttribute(self,ATR_MANA,15);
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,1);
		Snd_Play("LevelUp");

		Hero_Hunger = Hero_Hunger + 6;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ITFO_COMPOTE_00(C_Item)
{
	name = "Kompot z lesních bobulí";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 80;
	visual = "ItMi_Rum_Compote.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = use_compote_00;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 10;
	text[2] = NAME_Bonus_HP;
	count[2] = 60;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = 550;
	inv_animate = 1;
};

func void use_compote_00()
{
	if(Npc_IsPlayer(self))
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,10);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,60);
		Snd_Play("LevelUp");

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ITFO_COMPOTE_01(C_Item)
{
	name = "Kompot z lučních bobulí";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Rum_Compote.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = use_compote_01;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 10;
	text[2] = NAME_Bonus_HP;
	count[2] = 60;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = 300;
	inv_animate = 1;
};


func void use_compote_01()
{
	if(Npc_IsPlayer(self))
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,10);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,60);
		Snd_Play("LevelUp");

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_RiceStew(C_Item)
{
	name = "Dušená rýže";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Stew;
	visual = "ItFo_Rice_New.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_RiceStew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[2] = NAME_Bonus_STAProc;
	count[2] = 20;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};

func void Use_RiceStew()
{
	var int StaminaMax;

	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);

	if(Npc_IsPlayer(self))
	{
		StaminaMax = ATR_STAMINA_MAX[0] * 10;

		ATR_STAMINA[0] = ATR_STAMINA[0] + ((StaminaMax * 20) / 100);
		
		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 5;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_Meatbugragout(C_Item)
{
	name = "Ragú ze žravých štěnic";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Stew;
	visual = "ItFo_Stew_Sky.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_Meatbugragout;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[2] = NAME_Bonus_STAProc;
	count[2] = 10;
	text[4] = "Ragú ze žravých štěnic a la Snaf s houbami a rýží...";
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};

func void Use_Meatbugragout()
{
	var int StaminaMax;

	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);

	if(Npc_IsPlayer(self))
	{
		Meatbugragout_Bonus = Meatbugragout_Bonus + 1;

		if((Meatbugragout_Bonus == 15) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute_Bonus(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 8;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ITFO_SCHILDKROETESOUP_SBORKA(C_Item)
{
	name = "Speciální rybí polévka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_SCHILDKROETESOUP;
	visual = "ItFo_FishSoup_Sky.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = use_schildkroetesoup_sborka;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 1;
	text[5] = NAME_Value;
	count[5] = VALUE_SCHILDKROETESOUP;
};

func void use_schildkroetesoup_sborka()
{
	if(self.id == 0)
	{
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);
		Snd_Play("LevelUp");

		if(MIS_FARIM_QUEST == LOG_Running)
		{
			MIS_FARIM_QUEST = LOG_Failed;
			B_LogEntry_Failed(TOPIC_ADDON_FARIMFISH);
		};

		Hero_Hunger = Hero_Hunger + 7;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFoMuttonRaw_Mount(C_Item)
{
	name = "Maso z horského mrchožrouta";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_RawMeat_Mount;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat_Mount;
	inv_animate = 1;
};

func void Use_RawMeat_Mount()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		B_Say(self,self,"$COUGH");
	};
};

instance ItFo_BeliarTear(C_Item)
{
	name = "Víno 'Beliarova slza'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 3000;
	visual = "ItFo_Wine_New_03.3DS";
	material = MAT_GLAS;
	description = name;
	text[4] = "Velice vzácné a drahé varantské víno...";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};

instance ItFo_BeliarTear_Haniar(C_Item)
{
	name = "Víno 'Beliarova slza'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 3000;
	visual = "ItFo_Wine_New_03.3DS";
	material = MAT_GLAS;
	description = name;
	text[4] = "Velice vzácné a drahé varantské víno...";
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};

instance ItFo_Cake_Apple(C_Item)
{
	name = "Jablečný koláč";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 30;
	visual = "ITFO_PIE_NEW.3ds";
	material = MAT_WOOD;
	scemeName = "FOODHUGE";
	on_state[0] = Use_ItFo_Cake_Apple;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 25;
	text[2] = NAME_Bonus_HpMax;
	count[2] = 15;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 20;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value;
};

func void Use_ItFo_Cake_Apple()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,25);

	if(Npc_IsPlayer(self))
	{
		Snd_Play("LevelUp");
		B_RaiseAttribute(self,ATR_HITPOINTS_MAX,15);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,15);
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 20) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 4;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_Cake_Meat(C_Item)
{
	name = "Masový koláč";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 40;
	visual = "ITFO_PIE_NEW.3ds";
	material = MAT_WOOD;
	scemeName = "FOODHUGE";
	on_state[0] = Use_ItFo_Cake_Meat;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 30;
	text[2] = NAME_Bonus_Str;
	count[2] = 1;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 20;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value;
};

func void Use_ItFo_Cake_Meat()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,30);

	if(Npc_IsPlayer(self))
	{
		Snd_Play("LevelUp");
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,1);
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 20) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 5;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_Cake_Mushroom(C_Item)
{
	name = "Houbový koláč";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 60;
	visual = "ITFO_PIE_NEW.3ds";
	material = MAT_WOOD;
	scemeName = "FOODHUGE";
	on_state[0] = Use_ItFo_Cake_Mushroom;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 50;
	text[2] = NAME_Bonus_ManaMax;
	count[2] = 2;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value;
};

func void Use_ItFo_Cake_Mushroom()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,50);

	if(Npc_IsPlayer(self))
	{
		Snd_Play("LevelUp");
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,2);
		Npc_ChangeAttribute(self,ATR_MANA,2);
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 3;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_Cake_Fish(C_Item)
{
	name = "Rybí koláč";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 80;
	visual = "ITFO_PIE_NEW.3ds";
	material = MAT_WOOD;
	scemeName = "FOODHUGE";
	on_state[0] = Use_ItFo_Cake_Fish;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 40;
	text[2] = NAME_Bonus_Dex;
	count[2] = 1;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 10;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value;
};

func void Use_ItFo_Cake_Fish()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,40);

	if(Npc_IsPlayer(self))
	{
		Snd_Play("LevelUp");
		B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,1);
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 4;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_Cake_Honey(C_Item)
{
	name = "Medový koláč";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 80;
	visual = "ITFO_PIE_NEW.3ds";
	material = MAT_WOOD;
	scemeName = "FOODHUGE";
	on_state[0] = Use_ItFo_Cake_Honey;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 75;
	text[2] = NAME_Bonus_Int;
	count[2] = 2;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 15;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value;
};

func void Use_ItFo_Cake_Honey()
{
	var int staminamax;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,75);

	if(Npc_IsPlayer(self))
	{
		Snd_Play("LevelUp");
		ATR_INTELLECT += 2;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 2");
		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 15) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_HildaStew(C_Item)
{
	name = "Hildina masová polévka";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FireStew;
	visual = "ITFO_TURTLESOUP.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_ItFo_HildaStew;
	description = "Masová polévka";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_FireStew;
	text[4] = "Tuhle polévku pro mne připravila Hilda...";
	text[5] = NAME_Value;
	count[5] = Value_FireStew;
};

func void Use_ItFo_HildaStew()
{
	if(Npc_IsPlayer(self))
	{
		B_RaiseAttribute_Bonus(self,ATR_STRENGTH,STR_FireStew);

		Hero_Hunger = Hero_Hunger + 5;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ItFo_Wine_Gritta(C_Item)
{
	name = "Grittino víno";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Wine;
	visual = "ItFo_Wine_New_01.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_ItFo_Wine_Gritta;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Wine;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Wine;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 10;
	text[4] = NAME_Bonus_Dex;
	count[4] = 1;
	text[5] = NAME_Value;
	count[5] = Value_Wine;
	inv_animate = 1;
};

func void Use_ItFo_Wine_Gritta()
{
	var int staminamax;

	if(Npc_IsPlayer(self))
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};

	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Wine);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Wine);
	B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,1);

	if(Npc_IsPlayer(self))
	{
		WI_BONUS += 1;

		if((WI_BONUS == 50) && (RealMode[2] == FALSE))
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,1);
			Npc_ChangeAttribute(self,ATR_MANA,1);
			Snd_Play("LevelUp");
		};

		staminamax = ATR_STAMINA_MAX[0] * 10;
		ATR_STAMINA[0] = ATR_STAMINA[0] + ((staminamax * 10) / 100);

		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 2;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};

		B_Drunk();
	};
};