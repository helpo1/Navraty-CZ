
const string Name_PaladinSpell = "Paladinské kouzlo";
const string NAME_TPLSPELL = "Templářské kouzlo";

const int Value_Ru_PalLight = 50;
const int Value_Ru_PalLightHeal = 5;
const int Value_Ru_PalHolyBolt = 5;
const int Value_Ru_PalMediumHeal = 20;
const int Value_Ru_PalRepelEvil = 20;
const int Value_Ru_PalFullHeal = 30;
const int Value_Ru_PalDestroyEvil = 30;
const int Value_Ru_Light = 50;
const int Value_Ru_Firebolt = 5;
const int Value_Ru_Zap = 5;
const int Value_Ru_LightHeal = 5;
const int Value_Ru_SumGobSkel = 5;
const int Value_Ru_InstantFireball = 10;
const int Value_Ru_Icebolt = 10;
const int Value_Ru_SumWolf = 10;
const int Value_Ru_Windfist = 10;
const int Value_Ru_Sleep = 10;
const int Value_Ru_MediumHeal = 15;
const int Value_Ru_SumSkel = 15;
const int Value_Ru_Fear = 15;
const int VALUE_RU_CHARM = 15;
const int Value_Ru_IceCube = 15;
const int Value_Ru_ThunderBall = 15;
const int Value_Ru_Firestorm = 15;
const int VALUE_RU_SEVEREFETIDITY = 15;
const int Value_Ru_SumGol = 20;
const int VALUE_RU_SUMSHOAL = 20;
const int Value_Ru_HarmUndead = 20;
const int Value_Ru_LightningFlash = 20;
const int Value_Ru_ChargeFireball = 20;
const int Value_Ru_IceWave = 25;
const int Value_Ru_SumDemon = 25;
const int Value_Ru_FullHeal = 25;
const int Value_Ru_Pyrokinesis = 25;
const int Value_Ru_Firerain = 50;
const int Value_Ru_BreathOfDeath = 30;
const int Value_Ru_MassDeath = 30;
const int Value_Ru_MasterOfDisaster = 30;
const int Value_Ru_ArmyOfDarkness = 30;
const int Value_Ru_PalTeleportSecret = 500;
const int Value_Ru_TeleportSeaport = 500;
const int Value_Ru_TeleportMonastery = 500;
const int Value_Ru_TeleportFarm = 500;
const int Value_Ru_TeleportXardas = 500;
const int Value_Ru_TeleportPassNW = 500;
const int VALUE_RU_TELEPORTHIDDENPASSNW = 1500;
const int VALUE_RU_TELEPORTDAGOT = 5000;
const int Value_Ru_TeleportPassOW = 500;
const int Value_Ru_TeleportOC = 500;
const int Value_Ru_TeleportOWDemonTower = 500;
const int VALUE_RU_TELEPORTOWCOASTBASE = 500;
const int Value_Ru_TeleportTaverne = 500;
const int VALUE_RU_TELEPORTPSICAMP = 500;
const int Value_Ru_Teleport_3 = 500;
const int Value_Ru_Icelance = 10;
const int Value_Ru_Whirlwind = 10;
const int Value_Ru_Thunderstorm = 15;
const int Value_Ru_Geyser = 15;
const int Value_Ru_Waterfist = 20;
const int Value_Ru_Greententacle = 25;
const int Value_Ru_Swarm = 15;
const int Value_Ru_Energyball = 35;
const int Value_Ru_ManaForLife = 35;
const int VALUE_RU_TELEKINESIS = 30;
const int Value_Ru_Skull = 50;
const int Value_Ru_SummonGuardian = 200;
const int Value_Ru_SummonZombie = 20;
const int Value_Ru_Beliar = 10;
const int Value_Ru_Water = 20;
const int VALUE_RU_FIRELIGHT = 20;
const int VALUE_RU_CHAINLIGHTNING = 10;
const int VALUE_RU_BERZERK = 5;
const int VALUE_RU_CONTROL = 50;
const int VALUE_RU_SUMMONELIGOR = 1000;
const int VALUE_RU_TPLLIGHTHEAL = 5;
const int VALUE_RU_TPLMEDIUMHEAL = 10;
const int VALUE_RU_TPLHEAVYHEAL = 20;
const int VALUE_RU_TPLSUPERHEAL = 30;
const int VALUE_RU_TPLLIGHTSTRIKE = 5;
const int VALUE_RU_TPLMEDIUMSTRIKE = 10;
const int VALUE_RU_TPLHEAVYSTRIKE = 20;
const int VALUE_RU_TPLSUPERSTRIKE = 30;
const int VALUE_RU_CRESTELEMENTS = 20000;
const int VALUE_RU_MORAULARTU = 1000;
const int VALUE_RU_BELIARSSUPERRUNE = 5000;

const int ReduceFire_Low = 10;
const int ReduceFire_Medium = 20;
const int ReduceFire_High = 30;
const int ReduceFire_Ultra = 50;

const int ReduceCold_Low = 10;
const int ReduceCold_Medium = 20;

const int ReducePhys_Low = 10;
const int ReducePhys_Medium = 20;
const int ReducePhys_High = 50;

const int TimeStab_01 = 3;
const int TimeStab_02 = 5;

const int RestoreHP_01 = 5;
const int RestoreHP_02 = 10;
const int RestoreHP_03 = 15;
const int RestoreMP_01 = 5;
const int RestoreMP_02 = 10;
const int RestoreMP_03 = 15;

instance ITRU_TELEPORTDAGOT(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water14.3DS";
	material = MAT_STONE;
	spell = SPL_TELEPORTDAGOT;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_TELEPORTDAGOT;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ITRU_ORCTELEPORT(C_Item)
{
	name = NAME_Rune_Orc;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_ShadowMount.3DS";
	spell = SPL_TELEPORTORC;
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	description = NAME_SPL_ORCTELEPORT;
	text[0] = "Skřetí teleportační runa...";
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[4] = "Teleportuje v závislosti na současné poloze...";
	inv_animate = 1;
};

instance ItRu_PalTeleportSecret(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_PalTeleportSecret.3DS";
	material = MAT_STONE;
	spell = SPL_PalTeleportSecret;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_PalTeleportSecret;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ItRu_PalLight(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_PalLight.3ds";
	material = MAT_STONE;
	spell = SPL_PalLight;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_PalLight;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalLight;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_PalLIGHT;
	text[4] = "Obklopí sesílatele posvátnou ochrannou aurou...";
	inv_animate = 1;
};

instance ItRu_PalLightHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_PalLightHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PalLightHeal;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_PalLightHeal;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalLightHeal;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 100;
	inv_animate = 1;
};

instance ItRu_PalMediumHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_PalMediumHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PalMediumHeal;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_PalMediumHeal;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalMediumHeal;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 100;
	text[4] = "Odstraní veškeré oslabující účinky...";
	inv_animate = 1;
};

instance ItRu_PalFullHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_PalFullHeal.3ds";
	material = MAT_STONE;
	spell = SPL_PalFullHeal;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_PalFullHeal;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalFullHeal;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 100;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 100;
	text[4] = "Odstraní veškeré oslabující účinky...";
	inv_animate = 1;
};

instance ItRu_PalHolyBolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_PalHolyBolt.3DS";
	material = MAT_STONE;
	spell = SPL_PalHolyBolt;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_PalHolyBolt;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalHolyBolt;
	text[2] = NAME_Dam_Spell_Paladin;
	count[2] = SPL_Damage_PalHolyBolt;
	inv_animate = 1;
};

instance ItRu_PalRepelEvil(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_PalRepelEvil.3DS";
	material = MAT_STONE;
	spell = SPL_PalRepelEvil;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_PalRepelEvil;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalRepelEvil;
	text[2] = NAME_Dam_Spell_Paladin;
	count[2] = SPL_Damage_PalRepelEvil;
	inv_animate = 1;
};

instance ItRu_PalDestroyEvil(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_PalDestroyEvil.3DS";
	material = MAT_STONE;
	spell = SPL_PalDestroyEvil;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_PalDestroyEvil;
	text[0] = Name_PaladinSpell;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_PalDestroyEvil;
	text[2] = NAME_Dam_Spell_Paladin;
	count[2] = SPL_Damage_PalDestroyEvil;
	inv_animate = 1;
};

//Runy 1 kruga-------------------------------------------------------------


instance ItRu_Light(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Light.3ds";
	material = MAT_STONE;
	spell = SPL_Light;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_LIGHT;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LIGHT;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_LIGHT;
	inv_animate = 1;
};

instance ItRu_Light_Pyr(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Light.3ds";
	material = MAT_STONE;
	spell = SPL_Light;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_LIGHT;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LIGHT;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_LIGHT;
	inv_animate = 1;
};

instance ItRu_LightHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_LightHeal.3ds";
	material = MAT_STONE;
	spell = SPL_LightHeal;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_LightHeal;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LightHeal;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 50;
	inv_animate = 1;
};

instance ItRu_FireBolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_FireBolt.3DS";
	material = MAT_STONE;
	spell = SPL_Firebolt;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_Firebolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Firebolt;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_Firebolt;
	text[4] = NAME_ReduceFireRes;
	count[4] = ReduceFire_Low;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ItRu_Zap(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Zap.3DS";
	material = MAT_STONE;
	mag_circle = 1;
	spell = SPL_Zap;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_Zap;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Zap;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_Damage_Zap;
	text[4] = NAME_ReduceColdRes;
	count[4] = ReduceCold_Low;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ItRu_Icebolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Icebolt.3ds";
	material = MAT_STONE;
	spell = SPL_Icebolt;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_Icebolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Icebolt;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Icebolt;
	text[4] = NAME_FreezeChance;
	count[4] = TimeStab_01;
	inv_animate = 1;
};

instance ItRu_Sleep(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Sleep.3ds";
	material = MAT_STONE;
	spell = SPL_Sleep;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Sleep;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Sleep;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Sleep;
	inv_animate = 1;
};

instance ITRU_BERZERK(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_02.3DS";
	material = MAT_STONE;
	spell = SPL_BERZERK;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_BERZERK;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_BERZERK;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_DAMAGE_BERZERK;
	text[4] = NAME_StabChance;
	count[4] = TimeStab_02;
	inv_animate = 1;
};

instance ItRu_Deathbolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Beliar08.3DS";
	material = MAT_STONE;
	spell = SPL_Deathbolt;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_Deathbolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Deathbolt;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_Deathbolt;
	text[4] = NAME_ReducePhysRes;
	count[4] = ReducePhys_Low;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ItRu_SumGobSkel(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumGobSkel.3DS";
	material = MAT_STONE;
	spell = SPL_SummonGoblinSkeleton;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonGoblinSkeleton;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonGoblinSkeleton;
	inv_animate = 1;
};

//Runy 2 kruga-------------------------------------------------------------

instance ItRu_SumWolf(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumWolf.3DS";
	material = MAT_STONE;
	spell = SPL_SummonWolf;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_SummonWolf;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonWolf;
	inv_animate = 1;
};

instance ItRu_MediumHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_MediumHeal.3ds";
	material = MAT_STONE;
	spell = SPL_MediumHeal;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_MediumHeal;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_MediumHeal;
	text[4] = "Odstraní veškeré oslabující účinky...";
	inv_animate = 1;
};

instance ItRu_HarmUndead(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_HarmUndead.3DS";
	material = MAT_STONE;
	spell = SPL_DestroyUndead;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_DestroyUndead;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_DESTROYUNDEAD;
	text[2] = NAME_Dam_Spell_True;
	count[2] = SPL_Damage_DESTROYUNDEAD;
	inv_animate = 1;
};

instance ItRu_InstantFireball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_InstantFireball.3DS";
	material = MAT_STONE;
	mag_circle = 2;
	spell = SPL_InstantFireball;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_InstantFireball;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_InstantFireball;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_DAMAGE_InstantFireball;
	text[4] = NAME_ReduceFireRes;
	count[4] = ReduceFire_Medium;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ItRu_Icelance(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water04.3DS";
	material = MAT_STONE;
	spell = SPL_IceLance;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_IceLance;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Icelance;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Icelance;
	text[4] = NAME_ChanceRestoreMP;
	count[4] = 15;
	text[5] = NAME_ChanceRestoreMP_01;
	inv_animate = 1;
};

instance ITRU_SUMSHOAL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water12.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONSHOAL;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_SUMMONSHOAL;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_SUMMONSHOAL;
	inv_animate = 1;
};

instance ItRu_Windfist(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Windfist.3ds";
	material = MAT_STONE;
	spell = SPL_WindFist;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_WINDFIST;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_WindFist;
	text[2] = NAME_ManakostenMax;
	count[2] = STEP_WindFist * 4;
	text[3] = NAME_Addon_Damage_Min_Sleeper;
	count[3] = SPL_Damage_Windfist;
	text[4] = NAME_Damage_Max_Sleeper;
	count[4] = SPL_Damage_Windfist * 4;
	inv_animate = 1;
};

instance ITRU_TELEKINESIS(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_03.3DS";
	material = MAT_STONE;
	spell = SPL_TELEKINESIS;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_TELEKINESIS;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_TELEKINESIS;
	text[2] = NAME_ManaPerSec;
	count[2] = SPL_TELEKINESIS_DAMAGE_PER_SEC;
	inv_animate = 1;
};

instance ItRu_GreenTentacle(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water13.3DS";
	material = MAT_STONE;
	spell = SPL_GreenTentacle;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_GreenTentacle;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Greententacle;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Greententacle;
	inv_animate = 1;
};

instance ItRu_ManaForLife(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_ManaForLife.3DS";
	material = MAT_STONE;
	spell = SPL_ManaForLife;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_ManaForLife;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[2] = NAME_LossHealth;
	count[2] = 5;
	text[3] = NAME_CreateMana;
	count[3] = 1;
	inv_animate = 1;
};

instance ItRu_SummonZombie(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Beliar07.3DS";
	material = MAT_STONE;
	spell = SPL_SummonZombie;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonZombie;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonZombie;
	inv_animate = 1;
};


//Runy 3 kruga-------------------------------------------------------------

instance ItRu_FullHeal(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_FullHeal.3ds";
	material = MAT_STONE;
	spell = SPL_FullHeal;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_FullHeal;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_FullHeal;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 100;
	inv_animate = 1;
};

instance ItRu_Firestorm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Firestorm.3ds";
	material = MAT_STONE;
	spell = SPL_Firestorm;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_Firestorm;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_InstantFireStorm;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_InstantFireStorm;
	text[4] = NAME_ReduceFireRes;
	count[4] = ReduceFire_High;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ItRu_IceCube(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_IceCube.3ds";
	material = MAT_STONE;
	spell = SPL_IceCube;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_IceCube;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_IceCube;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_ICECUBE;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_FREEZE;
	inv_animate = 1;
};

instance ItRu_ThunderBall(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_ThunderBall.3ds";
	material = MAT_STONE;
	spell = SPL_ChargeZap;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_ChargeZap;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_ChargeZap;
	text[2] = NAME_ManakostenMax;
	count[2] = STEP_ChargeZap * 4;
	text[3] = NAME_Addon_Damage_Min_Water;
	count[3] = SPL_Damage_ChargeZap;
	text[4] = NAME_Damage_Max_Water;
	count[4] = SPL_Damage_ChargeZap * 4;
	inv_animate = 1;
};

instance ItRu_Fear(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Fear.3DS";
	material = MAT_STONE;
	mag_circle = 3;
	spell = SPL_Fear;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Fear;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Fear;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Fear;
	inv_animate = 1;
};

instance ITRU_CHARM(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water15.3DS";
	material = MAT_STONE;
	mag_circle = 3;
	spell = SPL_Charm;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Charm;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Charm;
	inv_animate = 1;
};

instance ItRu_Swarm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Beliar02.3DS";
	material = MAT_STONE;
	spell = SPL_Swarm;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_Swarm;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Swarm;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_Swarm_Damage;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_Swarm;
	text[4] = NAME_RestoreHPPer;
	count[4] = SPL_Swarm_Damage;
	inv_animate = 1;
};

instance ItRu_SumSkel(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumSkel.3DS";
	material = MAT_STONE;
	spell = SPL_SummonSkeleton;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonSkeleton;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonSkeleton;
	inv_animate = 1;
};

instance ItRu_BeliarsRage(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Beliar04.3DS";
	material = MAT_STONE;
	spell = SPL_Energyball;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_BeliarsRage;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Energyball;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_Energyball;
	inv_animate = 1;
};

instance ItRu_SummonGuardian(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Beliar06.3DS";
	material = MAT_STONE;
	spell = SPL_SummonGuardian;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_SummonGuardian;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonGuardian;
	inv_animate = 1;
};

instance ItRu_SumGol(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_20.3DS";
	material = MAT_STONE;
	spell = SPL_SummonGolem;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_SummonGolem;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonGolem;
	inv_animate = 1;
};

instance ITRU_SUMFIREGOL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_19.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONFIREGOLEM;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_SUMMONFIREGOLEM;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonGolem;
	inv_animate = 1;
};

//Runy 4 kruga-------------------------------------------------------------


instance ItRu_Acid(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Acid.3DS";
	material = MAT_STONE;
	spell = SPL_Acid;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Acid;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Acid;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_DAMAGE_Acid;
	inv_animate = 1;
};


instance ITRU_SUMSWPGOL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumGol.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONSWAMPGOLEM;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_SUMMONSWAMPGOLEM;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonGolem;
	inv_animate = 1;
};

instance ItRu_ChargeFireball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_ChargeFireball.3DS";
	material = MAT_STONE;
	mag_circle = 4;
	spell = SPL_ChargeFireball;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_ChargeFireball;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_ChargeFireball;
	text[2] = NAME_ManakostenMax;
	count[2] = SPL_COST_ChargeFireball;
	text[3] = NAME_Addon_Damage_Min_Fire;
	count[3] = SPL_Damage_ChargeFireball;
	text[4] = NAME_Damage_Max_Fire;
	count[4] = SPL_Damage_ChargeFireball * 4;
	inv_animate = 1;
};

instance ITRU_FIRELIGHT(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_01.3ds";
	material = MAT_STONE;
	spell = SPL_FIRELIGHT;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_FIRELIGHT;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_FIRELIGHT;
	text[2] = NAME_DamagePerSec_Fire;
	count[2] = SPL_Damage_FireLight;
	text[3] = NAME_DamageRadius_Fire;
	count[3] = SPL_Radius_FireLight;
	text[4] = NAME_DamageTime_Fire;
	count[4] = SPL_Time_FireLight;
	inv_animate = 1;
};

instance ItRu_LightningFlash(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_LightningFlash.3DS";
	material = MAT_STONE;
	mag_circle = 4;
	spell = SPL_LightningFlash;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_LightningFlash;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_LightningFlash;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_Damage_LightningFlash;
	text[4] = NAME_ReduceColdRes;
	count[4] = ReduceCold_Medium;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ITRU_SUMICEGOL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_18.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONICEGOLEM;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_SUMMONICEGOLEM;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonGolem;
	inv_animate = 1;
};

instance ItRu_SumDemon(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SummonDemon;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonDemon;
	text[4] = "Umožňuje vyvolat nižší démony...";
	inv_animate = 1;
};

instance ItRu_SumDemon_01(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SummonDemon;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonDemon;
	text[3] = NAME_Mag_Circle_Dem;
	count[3] = 1;
	text[4] = "Umožňuje vyvolat mladší démony...";
	inv_animate = 1;
};

instance ItRu_SumDemon_02(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SummonDemon;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonDemon;
	text[3] = NAME_Mag_Circle_Dem;
	count[3] = 2;
	text[4] = "Umožňuje vyvolat starší démony...";
	inv_animate = 1;
};

instance ItRu_SumDemon_03(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SummonDemon;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonDemon;
	text[3] = NAME_Mag_Circle_Dem;
	count[3] = 3;
	text[4] = "Umožňuje vyvolat vyšší démony...";
	inv_animate = 1;
};

instance ItRu_SumDemon_04(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SummonDemon;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonDemon;
	text[3] = NAME_Mag_Circle_Dem;
	count[3] = 4;
	text[4] = "Umožňuje vyvolat mladší arcidémony...";
	inv_animate = 1;
};

instance ItRu_SumDemon_05(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SummonDemon;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonDemon;
	text[3] = NAME_Mag_Circle_Dem;
	count[3] = 5;
	text[4] = "Umožňuje vyvolat starší arcidémony...";
	inv_animate = 1;
};

instance ItRu_SumDemon_06(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	spell = SPL_SummonDemon;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_SummonDemon;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_SummonDemon;
	text[3] = NAME_Mag_Circle_Dem;
	count[3] = 6;
	text[4] = "Umožňuje vyvolat vyšší arcidémony...";
	inv_animate = 1;
};

instance ItRu_Deathball(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Beliar09.3DS";
	material = MAT_STONE;
	spell = SPL_Deathball;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_Deathball;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Deathball;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_Deathball;
	text[4] = NAME_ReducePhysRes;
	count[4] = ReducePhys_Medium;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ItRu_BreathOfDeath(C_Item)
{
	name = "Vlna smrti Urizielu";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_MassDeath.3ds";
	material = MAT_STONE;
	spell = SPL_BreathOfDeath;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_BreathOfDeath;
	text[0] = "Tahle mocná magická runa v sobě ukrývá";
	text[1] = "sílu prastaré čepele nazývané Uriziel...";
	text[2] = NAME_Mag_Circle;
	count[2] = mag_circle;
	text[3] = NAME_Manakosten;
	count[3] = SPL_Cost_BreathOfDeath;
	text[4] = NAME_Dam_Spell_Dark;
	count[4] = SPL_Damage_BreathOfDeath;
	inv_animate = 1;
};

instance ItRu_EligorDemons(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_05.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONELIGOR;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_SUMMONELIGOR;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = SPL_COST_SUMMONELIGOR;
	inv_animate = 1;
};

instance ItRu_BeliarSuperRune(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_16.3DS";
	material = MAT_STONE;
	spell = SPL_BELIARRUNE;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_BELIARSSUPERRUNE;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_BELIARSRUNE_SUPER;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_SUPERBELIARSRUNE;
	text[3] = "Tahle runa v sobě ukrývá duši arcidémona Senyaka...";
	text[4] = "Symbol uprostřed runy svítí temnou září...";
	inv_animate = 1;
};

instance ItRu_OrcFireball(C_Item)
{
	name = NAME_Rune_Orc;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_ShadowMount.3DS";
	material = MAT_STONE;
	mag_circle = 4;
	spell = SPL_OrcFireball;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_OrcFireball;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_OrcFireball;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_DAMAGE_OrcFireball;
	text[4] = "Skřetí kouzlo...";
	inv_animate = 1;
};


//Runy 5 kruga-------------------------------------------------------------

instance ItRu_Pyrokinesis(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Pyrokinesis.3ds";
	material = MAT_STONE;
	spell = SPL_Pyrokinesis;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_Pyrokinesis;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_Firestorm;
	text[2] = NAME_ManakostenMax;
	count[2] = SPL_COST_Firestorm;
	text[3] = NAME_Addon_Damage_Min_Fire;
	count[3] = SPL_Damage_Firestorm;
	text[4] = NAME_Damage_Max_Fire;
	count[4] = SPL_Damage_Firestorm * 4;
	inv_animate = 1;
};

instance ItRu_Waterfist(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water03.3DS";
	material = MAT_STONE;
	spell = SPL_WaterFist;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_WaterFist;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Waterfist;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Waterfist;
	text[4] = NAME_ChanceRestoreHP;
	count[4] = 20;
	text[5] = NAME_ChanceRestoreHP_01;
	inv_animate = 1;
};

instance ItRu_IceWave(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_IceWave.3ds";
	material = MAT_STONE;
	spell = SPL_IceWave;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_IceWave;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_IceWave;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_ICEWAVE;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_FREEZE;
	inv_animate = 1;
};

instance ITRU_CONTROL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_04.3DS";
	material = MAT_STONE;
	spell = SPL_CONTROL;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_CONTROL;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = SPL_COST_CONTROL;
	text[2] = NAME_DamagePerSec_Sleeper;
	count[2] = SPL_CONTROL_DAMAGE_PER_SEC;
	inv_animate = 1;
};

instance ItRu_ArmyOfDarkness(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_ArmyOfDarkness.3DS";
	material = MAT_STONE;
	spell = SPL_ArmyOfDarkness;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_ArmyOfDarkness;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_ArmyOfDarkness;
	inv_animate = 1;
};

instance ITRU_SEVEREFETIDITY(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water11.3DS";
	material = MAT_STONE;
	spell = SPL_SEVEREFETIDITY;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_SEVEREFETIDITY;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_SEVEREFETIDITY;
	text[2] = NAME_AcidPerHit;
	count[2] = 200;
	text[3] = NAME_DamageTime_Acid;
	count[3] = 30;
	inv_animate = 1;
};

instance ItRu_Whirlwind(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water02.3DS";
	material = MAT_STONE;
	spell = SPL_Whirlwind;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Whirlwind;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Whirlwind;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_Whirlwind_DAMAGE;
	text[3] = NAME_ChanceRestoreMP;
	count[3] = 30;
	text[4] = NAME_ChanceRestoreMP_03;
	inv_animate = 1;
};


//Runy 6 kruga-------------------------------------------------------------

instance ItRu_Firerain(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Firerain.3ds";
	material = MAT_STONE;
	spell = SPL_Firerain;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_Firerain;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Firerain;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_FireRain;
	text[4] = NAME_ReduceFireRes;
	count[4] = ReduceFire_Ultra;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ItRu_FireMeteor(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Firerain.3ds";
	material = MAT_STONE;
	spell = SPL_FireMeteor;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_FIREBOW";
	description = NAME_SPL_FireMeteor;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_FireMeteor;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_FireMeteor;
	text[4] = NAME_StabChance;
	count[4] = TimeStab_01;
	inv_animate = 1;
};

instance ItRu_Geyser(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water01.3DS";
	material = MAT_STONE;
	spell = SPL_Geyser;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_Geyser;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Geyser;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Geyser;
	text[4] = NAME_ChanceRestoreMP;
	count[4] = 25;
	text[5] = NAME_ChanceRestoreMP_01;
	inv_animate = 1;
};

instance ItRu_Thunderstorm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water05.3DS";
	material = MAT_STONE;
	spell = SPL_Thunderstorm;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_Thunderstorm;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Thunderstorm;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Thunderstorm;
	text[4] = NAME_FreezeChance;
	count[4] = TimeStab_01;
	inv_animate = 1;
};

instance ItRu_MassDeath(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_BreathOfDeath.3ds";
	material = MAT_STONE;
	spell = SPL_MassDeath;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_MassDeath;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_MassDeath;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_Damage_MassDeath;
	text[4] = NAME_ChanceRestoreHP;
	count[4] = 30;
	text[5] = NAME_ChanceRestoreHP_02;
	inv_animate = 1;
};

instance ItRu_Skull(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Beliar05.3DS";
	material = MAT_STONE;
	spell = SPL_Skull;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_DARKLLIGHT";
	description = NAME_SPL_Skull;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_MinManakosten;
	count[1] = SPL_Cost_Skull;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_Damage_Skull;
	text[4] = NAME_ReducePhysRes;
	count[4] = ReducePhys_High;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ItRu_GuruWrath(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_13.3DS";
	material = MAT_STONE;
	spell = SPL_GuruWrath;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_GuruWrath;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_GuruWrath;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_DAMAGE_GuruWrath;
	inv_animate = 1;
};

instance ItRu_MasterOfDisaster(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_MasterOfDesaster.3DS";
	material = MAT_STONE;
	spell = SPL_MasterOfDisaster;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_MasterOfDisaster;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_MasterOfDisaster;
	text[2] = NAME_Dam_Spell_True;
	count[2] = SPL_DAMAGE_MasterOfDisaster;
	inv_animate = 1;
};

instance ItRu_Concussionbolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Beliar10.3DS";
	material = MAT_STONE;
	spell = SPL_ConcussionBolt;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_ConcussionBolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Concussionbolt;
	text[2] = NAME_Dam_Spell_True;
	count[2] = SPL_DAMAGE_Concussionbolt;
	inv_animate = 1;
};

//Runy strazhey-------------------------------------------------------------

instance ItRu_TplHeal_00(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_06.3DS";
	material = MAT_STONE;
	spell = SPL_TPLLIGHTHEAL;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TPLLIGHTHEAL;
	text[0] = NAME_TPLSPELL;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_TPLLIGHTHEAL;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 25;
	inv_animate = 1;
};

instance ItRu_TplHeal_01(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_07.3DS";
	material = MAT_STONE;
	spell = SPL_TPLMEDIUMHEAL;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TPLMEDIUMHEAL;
	text[0] = NAME_TPLSPELL;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_TPLMEDIUMHEAL;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 50;
	text[4] = "Odstraní veškeré oslabující účinky...";
	inv_animate = 1;
};

instance ItRu_TplHeal_02(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_08.3DS";
	material = MAT_STONE;
	spell = SPL_TPLHEAVYHEAL;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TPLHEAVYHEAL;
	text[0] = NAME_TPLSPELL;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_TPLHEAVYHEAL;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 75;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 100;
	text[4] = "Odstraní veškeré oslabující účinky...";
	inv_animate = 1;
};

instance ItRu_TplHeal_03(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_09.3DS";
	material = MAT_STONE;
	spell = SPL_TPLSUPERHEAL;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TPLSUPERHEAL;
	text[0] = NAME_TPLSPELL;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_TPLSUPERHEAL;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 100;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 100;
	text[4] = "Odstraní veškeré oslabující účinky...";
	text[5] = "Poskytuje dočasnou ochranu vůči účinkům ovládnutí...";
	inv_animate = 1;
};

instance ItRu_TplStrike_00(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_10.3DS";
	material = MAT_STONE;
	spell = SPL_TPLLIGHTSTRIKE;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TPLLIGHTSTRIKE;
	text[0] = NAME_TPLSPELL;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_TPLLIGHTSTRIKE;
	text[2] = NAME_Dam_Spell_Templer;
	count[2] = SPL_DAMAGE_TPLLIGHTSTRIKE;
	inv_animate = 1;
};

instance ItRu_TplStrike_01(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_11.3DS";
	material = MAT_STONE;
	spell = SPL_TPLMEDIUMSTRIKE;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TPLMEDIUMSTRIKE;
	text[0] = NAME_TPLSPELL;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_TPLMEDIUMSTRIKE;
	text[2] = NAME_Dam_Spell_Templer;
	count[2] = SPL_DAMAGE_TPLMEDIUMSTRIKE;
	inv_animate = 1;
};

instance ItRu_TplStrike_02(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_12.3DS";
	material = MAT_STONE;
	spell = SPL_TPLHEAVYSTRIKE;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TPLHEAVYSTRIKE;
	text[0] = NAME_TPLSPELL;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_TPLHEAVYSTRIKE;
	text[2] = NAME_Dam_Spell_Templer;
	count[2] = SPL_DAMAGE_TPLHEAVYSTRIKE;
	inv_animate = 1;
};

instance ItRu_TplStrike_03(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_13.3DS";
	material = MAT_STONE;
	spell = SPL_TPLSUPERSTRIKE;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TPLSUPERSTRIKE;
	text[0] = NAME_TPLSPELL;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_TPLSUPERSTRIKE;
	text[2] = NAME_Dam_Spell_Templer;
	count[2] = SPL_DAMAGE_TPLSUPERSTRIKE;
	inv_animate = 1;
};

//Runa Kogtya-------------------------------------------------------------

instance ItRu_BeliarsRune01(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water10.3DS";
	material = MAT_STONE;
	spell = SPL_BELIARRUNE;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_BELIARSRUNE_01;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_BELIARSRUNE_01;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_BELIARSRUNE_01;
	inv_animate = 1;
};

instance ItRu_BeliarsRune02(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water10.3DS";
	material = MAT_STONE;
	spell = SPL_BELIARRUNE;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_BELIARSRUNE_02;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_BELIARSRUNE_02;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_BELIARSRUNE_02;
	inv_animate = 1;
};

instance ItRu_BeliarsRune03(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water10.3DS";
	material = MAT_STONE;
	spell = SPL_BELIARRUNE;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_BELIARSRUNE_03;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_BELIARSRUNE_03;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_BELIARSRUNE_03;
	inv_animate = 1;
};

instance ItRu_BeliarsRune04(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water10.3DS";
	material = MAT_STONE;
	spell = SPL_BELIARRUNE;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_BELIARSRUNE_04;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_BELIARSRUNE_04;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_BELIARSRUNE_04;
	inv_animate = 1;
};

instance ItRu_BeliarsRune05(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water10.3DS";
	material = MAT_STONE;
	spell = SPL_BELIARRUNE;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_BELIARSRUNE_05;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_BELIARSRUNE_05;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_BELIARSRUNE_05;
	inv_animate = 1;
};

instance ItRu_BeliarsRune06(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water10.3DS";
	material = MAT_STONE;
	spell = SPL_BELIARRUNE;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_BELIARSRUNE_06;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_BELIARSRUNE_06;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_BELIARSRUNE_06;
	inv_animate = 1;
};

//Runy prochiye-------------------------------------------------------------

instance ItRu_MoraUlartu(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_14.3DS";
	material = MAT_STONE;
	spell = SPL_Waterwall;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_EVILLIGHT";
	description = NAME_SPL_MORAULARTU;
	text[3] = "Propůjčuje schopnost zotročit duše mrtvých nepřátel...";
	text[4] = NAME_Manakosten;
	count[4] = 50;
	inv_animate = 1;
};

instance ItRu_CrestElements(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_15.3DS";
	material = MAT_STONE;
	spell = SPL_Inflate;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_CRESTELEMENTS;
	text[1] = "Prastaré kouzlo, které vstřebalo sílu všech elementů...";
	text[2] = "Dokáže zničit jakékoli stvoření, včetně těch nesmrtelných...";
	text[4] = NAME_Dam_Spell_True;
	count[4] = SPL_DAMAGE_CRESTELEMENTS;
	inv_animate = 1;
};

instance ItRu_PyroRune(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_RuneBlank_New.3DS";
	material = MAT_STONE;
	spell = SPL_Inflate;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = "Pyrokarův runový kámen";
	text[4] = "Runový kámen překypuje magickou energií...";
	inv_animate = 1;
};

instance ItRu_DestroyGuardians(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItAr_Rune_30.3DS";
	material = MAT_STONE;
	spell = SPL_DESTROYGUARDIANS;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_STONESPHERE";
	description = NAME_SPL_DESTROYGUARDIANS;
	text[1] = "Jenom ti, kteří jsou obdařeni mocí bohů";
	text[2] = "dokážou použít tuhle runu...";
	text[4] = NAME_Manakosten;
	count[4] = SPL_COST_DESTROYGUARDIANS;
	inv_animate = 1;
};

instance ItRu_SumTreant(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ITRU_TREANT.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONTREANT;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = "Druidský magický kámen";
	text[4] = "S jeho pomocí možno vyvolat strážce lesa...";
	inv_animate = 1;
};

instance ItRu_EligorSummon(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_SumDemon.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	//effect = "SPELLFX_DARKLLIGHT";
	description = "Runa přivolání";
	text[4] = "S její pomocí možno přivolat vládce démonů Eligora...";
	on_state[0] = Use_ItRu_EligorSummon;
	inv_animate = 1;
};

func void Use_ItRu_EligorSummon()
{
	if(EligorSpawn == FALSE)
	{
		if((MIS_SleeperBack == LOG_Running) && (Npc_GetDistToWP(self,"DT_E2_06") <= 250) && (ReadyToSumEligor == TRUE))
		{
			EligorSpawn = TRUE;
			Wld_InsertNpc(ELIGOR_DEMON_OW,"DT_E2_06");
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		}
		else
		{
			AI_Print("Nic se nestalo...");
			CreateInvItems(hero,ItRu_EligorSummon,1);
			Snd_Play("MFX_MASSDEATH_CAST");
		};
	}
	else
	{
		AI_Print("Nic se nestalo...");
		Snd_Play("MFX_MASSDEATH_CAST");
	};
};


//Kamni prevrashcheniya----------------------

instance ItRu_TrfBloodFly(C_Item)
{
	name = NAME_Rune_Druid;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Druid_01.3DS";
	material = MAT_STONE;
	spell = SPL_TrfScavenger;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TrfScavenger;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_TrfRuneBloodFly;
	inv_animate = 1;
};

instance ItRu_TrfFireWaran(C_Item)
{
	name = NAME_Rune_Druid;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Druid_02.3DS";
	material = MAT_STONE;
	spell = SPL_TrfFireWaran;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TrfFireWaran;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_TrfRuneWaran;
	inv_animate = 1;
};

instance ItRu_TrfWarg(C_Item)
{
	name = NAME_Rune_Druid;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Druid_03.3DS";
	material = MAT_STONE;
	spell = SPL_TrfWarg;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TrfWarg;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_TrfRuneWarg;
	inv_animate = 1;
};

instance ItRu_TrfShadowbeast(C_Item)
{
	name = NAME_Rune_Druid;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Druid_04.3DS";
	material = MAT_STONE;
	spell = SPL_TrfShadowbeast;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TrfShadowbeast;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_TrfRuneShadowbeast;
	inv_animate = 1;
};

instance ItRu_TrfDragonSnapper(C_Item)
{
	name = NAME_Rune_Druid;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Druid_05.3DS";
	material = MAT_STONE;
	spell = SPL_TrfDragonSnapper;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TrfDragonSnapper;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_TrfRuneDragonSnapper;
	inv_animate = 1;
};

instance ItRu_TrfTroll(C_Item)
{
	name = NAME_Rune_Druid;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Druid_06.3DS";
	material = MAT_STONE;
	spell = SPL_TrfTroll;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TrfTroll;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_TrfRuneTroll;
	inv_animate = 1;
};

instance ItRu_ShadowMount(C_Item)
{
	name = NAME_Rune_Orc;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_ShadowMount.3DS";
	material = MAT_STONE;
	spell = SPL_SummonCrait;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_SummonCrait;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_TrfRune;
	text[4] = "Vyvolání bojové krajty";
	inv_animate = 1;
};

//----------------runy teleportatsii--------------------------

instance ItRu_GlobalTeleport(C_Item)
{
	name = "Runový kámen teleportace";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_TeleportPassNW.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportXardas;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = name;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[4] = "Používán k teleportaci...";
	inv_animate = 1;
};

//-------staryye runy------------------------------------

instance ItRu_TeleportMonastery(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_TeleportMonastery.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportMonastery;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TeleportMonastery;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ItRu_TeleportFarm(C_Item)	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_TeleportFarm.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportFarm;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TeleportFarm;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ItRu_TeleportXardas(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_TeleportXardas.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportXardas;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TeleportXardas;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ItRu_TeleportPassNW(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_TeleportPassNW.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportPassNW;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TeleportPassNW;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ITRU_TELEPORTHIDDENPASSNW(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Teleport_2.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportPassNW;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TeleportPassNW;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ItRu_TeleportTaverne(C_Item)		//!!!!!!!!!!!!!!!!!!!!
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Teleport_2.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportTaverne;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TeleportTaverne;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ITRU_TELEPORTPSICAMP(C_Item)		//!!!!!!!!!!!!!!!!!!!!!
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Water09.3DS";
	material = MAT_STONE;
	spell = SPL_TELEPORTPSICAMP;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TELEPORTPSICAMP;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ItRu_TeleportPassOW(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_TeleportPassOW.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportPassOW;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TeleportPassOW;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ItRu_TeleportOC(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_TeleportOC.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportOC;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TeleportOC;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

instance ItRu_TeleportOWDemonTower(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Teleport_2.3ds";
	material = MAT_STONE;
	spell = SPL_TeleportOWDemonTower;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_TPLLLIGHT";
	description = NAME_SPL_TeleportOWDemonTower;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	inv_animate = 1;
};

//--------------------------novyye runy------------------------

instance ItRu_Unlock(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Unlock.3ds";
	material = MAT_STONE;
	spell = SPL_UnlockChest;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	description = NAME_SPL_UnlockChest;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Unlock;
	text[4] = "Odemkne pouze zamčené truhly...";
	inv_animate = 1;
};

//------------------ogon'----------------------------

instance ItRu_RapidFirebolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_RapidFirebolt.3DS";
	material = MAT_STONE;
	spell = SPL_RapidFirebolt;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_RapidFirebolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_RapidFirebolt;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_RapidFirebolt;
	text[4] = NAME_ReduceFireRes;
	count[4] = ReduceFire_Low;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

instance ItRu_MagicCage(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_MagicCage.3DS";
	material = MAT_STONE;
	spell = SPL_MagicCage;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_MagicCage;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_MagicCage;
	text[2] = NAME_Damage;
	count[2] = SPL_Damage_MagicCage;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_Time_MagicCage;
	inv_animate = 1;
};

instance ItRu_Explosion(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Explosion.3DS";
	material = MAT_STONE;
	spell = SPL_Explosion;
	mag_circle = 5;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Explosion;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Explosion;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_Explosion;
	text[3] = "Výbuch způsobí dodatečné poškození...";
	count[2] = SPL_Damage_Explosion;
	text[4] = NAME_ReduceFireRes;
	count[4] = ReduceFire_High;
	text[5] = NAME_ReduceSummRes;
	inv_animate = 1;
};

//--------------------voda----------------------------

instance ItRu_RapidIcebolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_RapidIcebolt.3DS";
	material = MAT_STONE;
	spell = SPL_RapidIcebolt;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_RapidIcebolt;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_RapidIcebolt;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_Damage_RapidIcebolt;
	text[4] = NAME_FreezeChance;
	count[4] = TimeStab_01;
	inv_animate = 1;
};

//--------------------t'ma----------------------------

instance ItRu_Rage(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Rage.3DS";
	material = MAT_STONE;
	spell = SPL_Rage;
	mag_circle = 1;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Rage;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Rage;
	inv_animate = 1;
};

instance ItRu_Lacerate(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Lacerate.3DS";
	material = MAT_STONE;
	spell = SPL_Lacerate;
	mag_circle = 2;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Lacerate;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Lacerate;
	text[2] = NAME_Dam_Spell_Dark;
	text[4] = NAME_ReducePhysRes;
	count[4] = ReducePhys_Low;
	count[2] = SPL_DAMAGE_Lacerate;
	inv_animate = 1;
};

//--------------------guru----------------------------

instance ItRu_Extricate(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Extricate.3DS";
	material = MAT_STONE;
	spell = SPL_Extricate;
	mag_circle = 3;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Extricate;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Extricate;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_Damage_Extricate;
	inv_animate = 1;
};

instance ItRu_Elevate(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Elevate.3DS";
	material = MAT_STONE;
	spell = SPL_Elevate;
	mag_circle = 4;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Elevate;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_TOTALCOST_Elevate;
	text[5] = NAME_Spell_Invest;
	inv_animate = 1;
};

instance ItRu_Quake(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_Quake.3DS";
	material = MAT_STONE;
	spell = SPL_Quake;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_GURUSTAFF";
	description = NAME_SPL_Quake;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_Quake;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_Damage_Quake;
	inv_animate = 1;
};

//----------------runa nagrada-------------------------

instance ItRu_AdanosBall(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItRu_AdanosBall.3DS";
	material = MAT_STONE;
	spell = SPL_AdanosBall;
	mag_circle = 6;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_WATERSPHERE";
	description = NAME_SPL_AdanosBall;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_AdanosBall;
	text[2] = NAME_Dam_Spell_Haos;
	count[2] = SPL_DAMAGE_AdanosBall;
	inv_animate = 1;
};