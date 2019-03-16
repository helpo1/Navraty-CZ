
const string Name_PaladinScroll = "Магия Паладинов";

const int Value_Sc_PalLight = 100;
const int Value_Sc_PalLightHeal = 250;
const int Value_Sc_PalHolyBolt = 150;
const int Value_Sc_PalMediumHeal = 600;
const int Value_Sc_PalRepelEvil = 200;
const int Value_Sc_PalFullHeal = 1500;
const int Value_Sc_PalDestroyEvil = 350;
const int Value_Sc_Light = 70;
const int Value_Sc_Firebolt = 80;
const int Value_Sc_Charm = 200;
const int Value_Sc_Icebolt = 50;
const int Value_Sc_LightHeal = 125;
const int Value_Sc_SumGobSkel = 75;
const int Value_Sc_InstantFireball = 175;
const int Value_Sc_Zap = 30;
const int Value_Sc_SumWolf = 275;
const int Value_Sc_Windfist = 250;
const int Value_Sc_Sleep = 100;
const int Value_Sc_MediumHeal = 560;
const int Value_Sc_LightningFlash = 125;
const int Value_Sc_ChargeFireball = 280;
const int VALUE_SC_FIRELIGHT = 150;
const int Value_Sc_SumSkel = 175;
const int Value_Sc_Fear = 175;
const int Value_Sc_IceCube = 200;
const int Value_Sc_ThunderBall = 175;
const int Value_Sc_SumGol = 150;
const int Value_Sc_HarmUndead = 400;
const int Value_Sc_Pyrokinesis = 150;
const int Value_Sc_Firestorm = 500;
const int Value_Sc_Unlock = 250;
const int Value_Sc_IceWave = 200;
const int VALUE_SC_SUMSHOAL = 120;
const int Value_Sc_SumDemon = 200;
const int Value_Sc_FullHeal = 1200;
const int Value_Sc_Firerain = 1000;
const int Value_Sc_BreathOfDeath = 450;
const int Value_Sc_MassDeath = 650;
const int Value_Sc_ArmyOfDarkness = 350;
const int Value_Sc_Shrink = 350;
const int Value_Sc_TrfGiantBug = 500;
const int Value_Sc_TrfWaran = 75;
const int Value_Sc_TrfWolf = 100;
const int Value_Sc_TrfLurker = 125;
const int Value_Sc_TrfSnapper = 150;
const int Value_Sc_TrfScavenger = 175;
const int Value_Sc_TrfWarg = 200;
const int Value_Sc_TrfSheep = 200;
const int Value_Sc_TrfFireWaran = 300;
const int Value_Sc_TrfShadowbeast = 400;
const int Value_Sc_TrfDragonSnapper = 500;
const int VALUE_SC_TRFMEATBUG = 250;
const int VALUE_SC_TRFZOMBIE = 350;
const int Value_Sc_Water = 1;
const int Value_Sc_IceLance = 170;
const int Value_Sc_Whirlwind = 600;
const int VALUE_SC_CONTROL = 150;
const int VALUE_SC_TELEKINESIS = 100;
const int Value_Sc_Geyser = 600;
const int Value_Sc_Thunderstorm = 700;
const int Value_Sc_Waterfist = 300;
const int VALUE_SC_GREENTENTACLE = 100;
const int VALUE_SC_DEATHBOLT = 140;
const int VALUE_SC_ManaForLife = 450;
const int VALUE_SC_SUMZOMBIE = 120;
const int VALUE_SC_SWARM = 175;
const int VALUE_SC_ENERGYBALL = 200;
const int VALUE_SC_DEATHBALL = 250;
const int VALUE_SC_SKULL = 1000;

const int Value_Sc_RapidFirebolt = 160;
const int Value_Sc_RapidIcebolt = 250;
const int Value_Sc_Rage = 150;
const int Value_Sc_Quake = 1000;
const int Value_Sc_MagicCage = 200;
const int Value_Sc_Lacerate = 250;
const int Value_Sc_Extricate = 300;
const int Value_Sc_Explosion = 450;
const int Value_Sc_Elevate = 600;
const int Value_Sc_AdanosBall = 300;
const int Value_Sc_Acid = 500;

instance ItSc_PalLight(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_PalLight;
	visual = "ItSc_PalLight_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalLight;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_PalLight;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_PalLIGHT;
	text[4] = "Окружает святой защитной аурой...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Light(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Light;
	visual = "ItSc_Light_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Light;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_LIGHT;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Duration;
	count[2] = SPL_Duration_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_PalLightHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_PalLightHeal;
	visual = "ItSc_PalLightHeal_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalLightHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_PalLightHeal;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 100;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_PalHolyBolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_PalHolyBolt;
	visual = "ItSc_PalHolyBolt_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalHolyBolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_PalHolyBolt;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Spell_Paladin;
	count[2] = SPL_Damage_PalHolyBolt;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_PalMediumHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_PalMediumHeal;
	visual = "ItSc_PalLightHeal_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalMediumHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_PalMediumHeal;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll2;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 100;
	text[4] = "Снимает все ослабляющие эффекты...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_PalRepelEvil(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_PalRepelEvil;
	visual = "ItSc_PalHolyBolt_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalRepelEvil;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_PalRepelEvil;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll2;
	text[2] = NAME_Dam_Spell_Paladin;
	count[2] = SPL_Damage_PalRepelEvil;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_PalFullHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_PalFullHeal;
	visual = "ItSc_PalLightHeal_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalFullHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_PalFullHeal;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll3;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 100;
	text[3] = NAME_BONUS_STAPROC;
	count[3] = 100;
	text[4] = "Снимает все ослабляющие эффекты...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_PalDestroyEvil(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_PalDestroyEvil;
	visual = "ItSc_PalHolyBolt_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_PalDestroyEvil;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_PalDestroyEvil;
	text[0] = Name_PaladinScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll3;
	text[2] = NAME_Dam_Spell_Paladin;
	count[2] = SPL_Damage_PalDestroyEvil;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_LightHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_LightHeal;
	visual = "ItSc_LightHeal_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_LightHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_LightHeal;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_BONUS_HP_PROC;
	count[2] = 50;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_SumWolf(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_SumWolf;
	visual = "ItSc_SummonWolf_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonWolf;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SummonWolf;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll2;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_MediumHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_MediumHeal;
	visual = "ItSc_MediumHeal_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_MediumHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_MediumHeal;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL2;
	text[4] = "Снимает все ослабляющие эффекты...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_HarmUndead(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_HarmUndead;
	visual = "ItSc_DestroyUndead_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_DestroyUndead;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL4;
	wear = WEAR_EFFECT;
	description = NAME_SPL_DestroyUndead;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[2] = NAME_Dam_Spell_True;
	count[2] = SPL_Damage_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_FullHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_FullHeal;
	visual = "ItSc_FullHeal_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_FullHeal;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_FullHeal;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL3;
	text[2] = NAME_BONUS_STAPROC;
	count[2] = 100;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Shrink(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Shrink;
	visual = "ItSc_Shrink_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Shrink;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL4;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Shrink;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Firebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Firebolt;
	visual = "ItSc_Firebolt_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Firebolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Firebolt;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_Firebolt;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_InstantFireball(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_InstantFireball;
	visual = "ItSc_InstantFireball_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_InstantFireball;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_InstantFireball;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll2;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_DAMAGE_InstantFireball;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Firestorm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Firestorm;
	visual = "ItSc_Firestorm_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Firestorm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Firestorm;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL3;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_InstantFireStorm;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_ChargeFireBall(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_ChargeFireball;
	visual = "ItSc_ChargeFireBall_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_ChargeFireball;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_ChargeFireball;
	wear = WEAR_EFFECT;
	description = NAME_SPL_ChargeFireball;
	text[0] = NAME_MageScroll;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_ChargeFireball;
	text[2] = NAME_ManakostenMax;
	count[2] = SPL_COST_ChargeFireball;
	text[3] = NAME_Addon_Damage_Min_Fire;
	count[3] = SPL_Damage_ChargeFireball;
	text[4] = NAME_Damage_Max_Fire;
	count[4] = SPL_Damage_ChargeFireball * 4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Pyrokinesis(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Pyrokinesis;
	visual = "ItSc_Pyrokinesis_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Pyrokinesis;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_Firestorm;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Pyrokinesis;
	text[0] = NAME_MageScroll;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_Firestorm;
	text[2] = NAME_ManakostenMax;
	count[2] = STEP_Firestorm * 4;
	text[3] = NAME_Addon_Damage_Min_Fire;
	count[3] = SPL_Damage_Firestorm;
	text[4] = NAME_Damage_Max_Fire;
	count[4] = SPL_Damage_Firestorm * 4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Firerain(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Firerain;
	visual = "ItSc_Firerain_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Firerain;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll6;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Firerain;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL6;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_FireRain;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Zap(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Zap;
	visual = "ItSc_Zap_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Zap;
	wear = WEAR_EFFECT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	description = NAME_SPL_Zap;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_Damage_Zap;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Icelance(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_IceLance;
	visual = "ItSc_IceLance_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_IceLance;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_IceLance;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll2;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Icelance;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Icebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Icebolt;
	visual = "ItSc_Icebolt_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Icebolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Icebolt;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Icebolt;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_IceCube(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_IceCube;
	visual = "ItSc_IceCube_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_IceCube;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_IceCube;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Scroll3;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_ICECUBE;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_FREEZE;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_ThunderBall(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_ThunderBall;
	visual = "ItSc_ChargeZap_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_ChargeZap;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_ChargeZap;
	wear = WEAR_EFFECT;
	description = NAME_SPL_ChargeZap;
	text[0] = NAME_MageScroll;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_ChargeZap;
	text[2] = NAME_ManakostenMax;
	count[2] = SPL_COST_ChargeZap;
	text[3] = NAME_Addon_Damage_Min_Water;
	count[3] = SPL_Damage_ChargeZap;
	text[4] = NAME_Damage_Max_Water;
	count[4] = SPL_Damage_ChargeZap * 4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_SUMSHOAL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_SUMSHOAL;
	visual = "ItSc_SummonShoal_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONSHOAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SUMMONSHOAL;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL3;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Waterfist(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Waterfist;
	visual = "ItSc_Waterfist_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_WaterFist;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll5;
	wear = WEAR_EFFECT;
	description = NAME_SPL_WaterFist;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL5;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Waterfist;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_LightningFlash(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_LightningFlash;
	visual = "ItSc_LightningFlash_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_LightningFlash;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll4;
	wear = WEAR_EFFECT;
	description = NAME_SPL_LightningFlash;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_Damage_LightningFlash;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_IceWave(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_IceWave;
	visual = "ItSc_IceWave_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_IceWave;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll5;
	wear = WEAR_EFFECT;
	description = NAME_SPL_IceWave;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL5;
	text[2] = NAME_Damage;
	count[2] = 60;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_FREEZE;
	text[4] = NAME_DamagePerSec_Water;
	count[4] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Geyser(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Geyser;
	visual = "ItSc_Geyser_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Geyser;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll6;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Geyser;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL6;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Geyser;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Thunderstorm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Thunderstorm;
	visual = "ItSc_Thunderstorm_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Thunderstorm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll6;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Thunderstorm;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL6;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_Thunderstorm;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Sleep(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Sleep;
	visual = "ItSc_Sleep_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Sleep;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Sleep;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Sleep;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_BERZERK(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Firebolt;
	visual = "ItSc_SleeperBolt_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_BERZERK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_BERZERK;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_DAMAGE_BERZERK;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Windfist(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Windfist;
	visual = "ItSc_Windfist_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_WindFist;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_WindFist;
	wear = WEAR_EFFECT;
	description = NAME_SPL_WINDFIST;
	text[0] = NAME_MageScroll;
	text[1] = NAME_MinManakosten;
	count[1] = STEP_WindFist;
	text[2] = NAME_ManakostenMax;
	count[2] = SPL_Cost_WindFist;
	text[3] = NAME_Addon_Damage_Min_Sleeper;
	count[3] = SPL_Damage_Windfist;
	text[4] = NAME_Damage_Max_Sleeper;
	count[4] = SPL_Damage_Windfist * 4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Charm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Charm;
	visual = "ItSc_Charm_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Charm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Charm;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL2;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Fear(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Fear;
	visual = "ItSc_Fear_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Fear;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Fear;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL3;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Fear;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_GREENTENTACLE(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_GREENTENTACLE;
	visual = "ItSc_Roots_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_GreenTentacle;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_GreenTentacle;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL2;
	text[2] = NAME_Sec_Duration;
	count[2] = SPL_TIME_Greententacle;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_SEVEREFETIDITY(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_DEATHBALL;
	visual = "ItSc_AcidShield_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SEVEREFETIDITY;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL5;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SEVEREFETIDITY;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL5;
	text[2] = NAME_AcidPerHit;
	count[2] = 200;
	text[3] = NAME_DamageTime_Acid;
	count[3] = 30;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Whirlwind(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Whirlwind;
	visual = "ItSc_Whirlwind_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Whirlwind;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll6;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Whirlwind;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll6;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_Whirlwind_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_SumGobSkel(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_SumGobSkel;
	visual = "ItSc_SummonSkeleton_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonGoblinSkeleton;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SummonGoblinSkeleton;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_SumSkel(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_SumSkel;
	visual = "ItSc_SummonSkeletonWar_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonSkeleton;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SummonSkeleton;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL2;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_SumDemon(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_SumDemon;
	visual = "ItSc_SummonDemon_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonDemon;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll4;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SummonDemonScr;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_ArmyOfDarkness(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_ArmyOfDarkness;
	visual = "ItSc_ArmyOfDarkness_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_ArmyOfDarkness;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll5;
	wear = WEAR_EFFECT;
	description = NAME_SPL_ArmyOfDarkness;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL5;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Deathbolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_DEATHBOLT;
	visual = "ItSc_Deathbolt_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Deathbolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Deathbolt;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_Deathbolt;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_ManaForLife(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_ManaForLife;
	visual = "ItSc_ManaForLife_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_ManaForLife;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_ManaForLife;
	text[0] = NAME_MageScroll;
	text[2] = NAME_LossHealth;
	count[2] = 5;
	text[3] = NAME_CreateMana;
	count[3] = 1;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_SUMZOMBIE(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_SUMZOMBIE;
	visual = "ItSc_SummonZombie_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonZombie;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SummonZombie;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL3;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_SWARM(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_SWARM;
	visual = "ItSc_Swarm_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Swarm;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Swarm;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL3;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_Swarm_Damage;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_TIME_Swarm;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_ENERGYBALL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_ENERGYBALL;
	visual = "ItSc_BeliarsRage_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Energyball;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_BeliarsRage;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL3;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_Energyball;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_DEATHBALL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_DEATHBALL;
	visual = "ItSc_Deathball_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Deathball;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL4;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Deathball;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_Deathball;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_MassDeath(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_MassDeath;
	visual = "ItSc_MassDeath_New.3ds";
	material = MAT_LEATHER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL4;
	spell = SPL_MassDeath;
	wear = WEAR_EFFECT;
	description = NAME_SPL_MassDeath;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_Damage_MassDeath;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_SKULL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_SKULL;
	visual = "ItSc_Skull_New.3ds";
	material = MAT_LEATHER;
	spell = SPL_Skull;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL6;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Skull;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL6;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_Damage_Skull;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//------------трансформация---------------------

instance ItSc_TrfSheep(C_Item)		//Зомби
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfSheep;
	visual = "ItSc_TrfZombie_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfSheep;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfSheep;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfSheep;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfSheep;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfScavenger(C_Item)		//Шершень
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfScavenger;
	visual = "ItSc_TrfBloodFly_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfScavenger;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfScavenger;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfScavenger;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfScavenger;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfGiantBug(C_Item)		//Голем
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfGiantBug;
	visual = "ItSc_TrfGolem_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfGiantBug;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfGiantBug;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfGiantBug;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfGiantBug;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfWolf(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfWolf;
	visual = "ItSc_TrfWolf_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfWolf;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfWolf;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfWolf;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfWolf;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfWaran(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfWaran;
	visual = "ItSc_TrfWaran_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfWaran;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfWaran;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfWaran;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfWaran;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfSnapper(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfSnapper;
	visual = "ItSc_TrfSnapper_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfSnapper;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfSnapper;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfSnapper;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfSnapper;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfWarg(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfWarg;
	visual = "ItSc_TrfWolf_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfWarg;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfWarg;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfWarg;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfWarg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfFireWaran(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfFireWaran;
	visual = "ItSc_TrfFireWaran_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfFireWaran;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfFireWaran;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfFireWaran;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfFireWaran;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfLurker(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfLurker;
	visual = "ItSc_TrfLurker_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfLurker;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfLurker;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfLurker;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfLurker;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfShadowbeast(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfShadowbeast;
	visual = "ItSc_TrfShadowbeast_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfShadowbeast;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfShadowbeast;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfShadowbeast;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfShadowbeast;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfDragonSnapper(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_TrfDragonSnapper;
	visual = "ItSc_TrfDragonSnapper_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TrfDragonSnapper;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_TrfDragonSnapper;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TrfDragonSnapper;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_TrfDragonSnapper;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_TrfMeatBug(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_TRFMEATBUG;
	visual = "ItSc_TrfMeatBug_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFMEATBUG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_TRFMEATBUG;
	wear = WEAR_EFFECT;
	description = NAME_SPL_TRFMEATBUG;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_TRFMEATBUG;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_BreathOfDeath(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_BreathOfDeath;
	visual = "ItSc_BreathOfDeath_New.3ds";
	material = MAT_LEATHER;
	spell = SPL_BreathOfDeath;
	wear = WEAR_EFFECT;
	description = NAME_SPL_BreathOfDeath;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_Damage_BreathOfDeath;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_SumGol(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_SumGol;
	visual = "ItSc_SummonGolem_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SummonGolem;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll4;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SummonGolem;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_SUMFIREGOL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_SumGol;
	visual = "ItSc_SumFireGol_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONFIREGOLEM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll5;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SUMMONFIREGOLEM;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL5;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_SUMICEGOL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_SumGol;
	visual = "ItSc_SummonIceGolem_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONICEGOLEM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll5;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SUMMONICEGOLEM;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL5;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITSC_SUMSWPGOL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_SumGol;
	visual = "ItSc_TrfGolem_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONSWAMPGOLEM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll4;
	wear = WEAR_EFFECT;
	description = NAME_SPL_SUMMONSWAMPGOLEM;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Unlock(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Unlock;
	visual = "ItSc_UnlockChest_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_UnlockChest;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_UnlockChest;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL3;
	text[4] = "Открывает только запертые сундуки...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Ressurect(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = "Дыхание смерти";
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[4] = "Способно воскрешать мертвых созданий...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_RapidFirebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_RapidFirebolt;
	visual = "ItSc_RapidFirebolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_RapidFirebolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL2;
	wear = WEAR_EFFECT;
	description = NAME_SPL_RapidFirebolt;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL2;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_RapidFirebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_RapidIcebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_RapidIcebolt;
	visual = "ItSc_RapidIcebolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_RapidIcebolt;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL4;
	wear = WEAR_EFFECT;
	description = NAME_SPL_RapidIcebolt;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL4;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_RapidIcebolt;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_Rage(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Rage;
	visual = "ItSc_Rage_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Sleep;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL6;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Rage;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL6;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Quake(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Quake;
	visual = "ItSc_Quake_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Quake;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll6;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Quake;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL6;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_Damage_Quake;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_MagicCage(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_MagicCage;
	visual = "ItSc_MagicCage_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_MagicCage;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_MagicCage;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Manakosten;
	count[1] = SPL_COST_SCROLL3;
	text[2] = NAME_Damage;
	count[2] = SPL_Damage_MagicCage;
	text[3] = NAME_Sec_Duration;
	count[3] = SPL_Time_MagicCage;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Lacerate(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Lacerate;
	visual = "ItSc_Lacerate_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Lacerate;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll3;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Lacerate;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll3;
	text[2] = NAME_Dam_Spell_Dark;
	count[2] = SPL_DAMAGE_Lacerate;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Extricate(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Extricate;
	visual = "ItSc_Extricate_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Extricate;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll5;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Extricate;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL5;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_Damage_Extricate;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Explosion(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Explosion;
	visual = "ItSc_Explosion_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Explosion;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll6;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Explosion;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_COST_SCROLL6;
	text[2] = NAME_Dam_Spell_Fire;
	count[2] = SPL_Damage_Explosion;
	text[3] = "Эффект дополнительного урона от взрыва...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Elevate(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Elevate;
	visual = "ItSc_Elevate.3DS";
	material = MAT_LEATHER;
	spell = SPL_Elevate;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_TOTALCOST_Elevate;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Elevate;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_TOTALCOST_Elevate;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItSc_AdanosBall(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_AdanosBall;
	visual = "ItSc_IceWave_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_AdanosBall;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll4;
	wear = WEAR_EFFECT;
	description = NAME_SPL_AdanosBall;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll4;
	text[2] = NAME_Dam_Spell_Water;
	count[2] = SPL_DAMAGE_AdanosBall;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSc_Acid(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sc_Acid;
	visual = "ItSc_Acid_New.3DS";
	material = MAT_LEATHER;
	spell = SPL_Acid;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_Cost_Scroll5;
	wear = WEAR_EFFECT;
	description = NAME_SPL_Acid;
	text[0] = NAME_MageScroll;
	text[1] = NAME_Mana_needed;
	count[1] = SPL_Cost_Scroll5;
	text[2] = NAME_Dam_Spell_Sleeper;
	count[2] = SPL_DAMAGE_Acid;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};
