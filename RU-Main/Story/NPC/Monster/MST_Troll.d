
prototype Mst_Default_Troll(C_Npc)
{
	name[0] = "Тролль";
	guild = GIL_TROLL;
	aivar[AIV_MM_REAL_ID] = ID_TROLL;
	bodyStateInterruptableOverride = TRUE;
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 220;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 400;
	damage[DAM_INDEX_FLY] = 150;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Troll()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Troll_Uniq()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Bodz",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Troll_IceSmall()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Bodt",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance TROLL_YOUNG(Mst_Default_Troll)
{
	name[0] = "Молодой тролль";
	aivar[AIV_Gender] = TRUE;
	level = 25;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Troll();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Npc_SetToFistMode(self);
};

instance Troll(Mst_Default_Troll)
{
	name[0] = "Тролль";
	aivar[AIV_Gender] = TRUE;
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

instance Troll_Trf(Mst_Default_Troll)
{
	name[0] = "Тролль";
	aivar[AIV_Gender] = TRUE;
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

instance Troll_Rug(Mst_Default_Troll)
{
	name[0] = "Утрог";
	aivar[AIV_Gender] = TRUE;
	aivar[94] = NPC_LEGEND;
	level = 100;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_Troll_Uniq();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_EatGroundStart] = 6;
	aivar[AIV_MM_EatGroundEnd] = 22;
	CreateInvItems(self,ItMi_Mutagen_Str_Normal,1);
};

instance Troll_Trag(Mst_Default_Troll)
{
	name[0] = "Уздог";
	aivar[AIV_Gender] = TRUE;
	aivar[94] = NPC_LEGEND;
	level = 100;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_Troll_Uniq();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	aivar[AIV_MM_SleepStart] = 1;
	aivar[AIV_MM_SleepEnd] = 12;
	aivar[AIV_MM_RoamStart] = 12;
	aivar[AIV_MM_RoamEnd] = 1;
	CreateInvItems(self,ItMi_Mutagen_HP_Normal,1);
};

instance Troll_Brog(Mst_Default_Troll)
{
	name[0] = "Уброг";
	aivar[AIV_Gender] = TRUE;
	aivar[94] = NPC_LEGEND;
	level = 100;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_Troll_Uniq();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	aivar[AIV_MM_SleepStart] = 12;
	aivar[AIV_MM_SleepEnd] = 20;
	aivar[AIV_MM_RoamStart] = 20;
	aivar[AIV_MM_RoamEnd] = 12;
	CreateInvItems(self,ItMi_Mutagen_Dex_Normal,1);
};

instance Troll_Rune(Mst_Default_Troll)
{
	name[0] = "Тролль";
	aivar[AIV_Gender] = TRUE;
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

instance TROLL_CAVE(Mst_Default_Troll)
{
	name[0] = "Пещерный тролль";
	aivar[AIV_Gender] = TRUE;
	level = 60;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 7000;
	attribute[ATR_HITPOINTS] = 7000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

instance Valley_Troll(Mst_Default_Troll)
{
	name[0] = "Тролль";
	aivar[AIV_Gender] = TRUE;
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
	aivar[AIV_OriginalFightTactic] = FAI_TROLL;
};

instance Maya_Troll(Mst_Default_Troll)
{
	name[0] = "Тролль";
	aivar[AIV_Gender] = TRUE;
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
	aivar[AIV_OriginalFightTactic] = FAI_TROLL;
};

instance COAST_TROLL(Mst_Default_Troll)
{
	name[0] = "Тролль";
	aivar[AIV_Gender] = TRUE;
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	aivar[AIV_OriginalFightTactic] = FAI_TROLL;
	aivar[AIV_MM_Packhunter] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX * 2;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

instance Troll_DI(Mst_Default_Troll)
{
	name[0] = "Тролль";
	aivar[AIV_Gender] = TRUE;
	level = 50;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 420;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	aivar[AIV_OriginalFightTactic] = FAI_TROLL;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

instance TROLL_CAVE_UNIQ(Mst_Default_Troll)
{
	name[0] = "Утур";
	aivar[AIV_Gender] = TRUE;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 230;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_Troll_Uniq();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_GturTrollHorn,1);
	CreateInvItems(self,ItMi_Mutagen_Str_Low,1);
};

instance TrollIceSmall(Mst_Default_Troll)
{
	name[0] = "Скальный тролль";
	aivar[AIV_Gender] = TRUE;
	level = 80;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 230;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_Troll_IceSmall();
	Npc_SetToFistMode(self);
};

instance TROLL_YOUNG_PW(Mst_Default_Troll)
{
	name[0] = "Молодой тролль";
	aivar[AIV_Gender] = TRUE;
	level = 25;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Troll();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 0;
	aivar[AIV_MM_SleepEnd] = 0;
	aivar[AIV_MM_RoamStart] = 0;
	aivar[AIV_MM_RoamEnd] = 0;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

PROTOTYPE Mst_Default_Ogre(C_Npc)			
{
	name	= "Огр";
	guild	= GIL_DRACONIAN;
	aivar[AIV_MM_REAL_ID] = ID_OGRE;
	bodyStateInterruptableOverride = TRUE;
	level = 35;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	HitChance[NPC_TALENT_2H] = 59;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void B_SetVisuals_Ogre()
{
	Mdl_SetVisual(self,"Oger.mds");
	Mdl_SetVisualBody(self,"Ork_Body_Naked1",0,DEFAULT,"ORC_HEAD_BALD",DEFAULT,DEFAULT,-1);
};

instance Ogre(Mst_Default_Ogre)
{
	B_SetVisuals_Ogre();
	EquipItem(self,ItMw_OgreHummer);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Troll_FightOne(Mst_Default_Troll)
{
	name[0] = "Разъяренный тролль";
	aivar[AIV_Gender] = TRUE;
	guild = GIL_WOLF;
	level = 80;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

instance Troll_FightTwo(Mst_Default_Troll)
{
	name[0] = "Разъяренный тролль";
	aivar[AIV_Gender] = TRUE;
	guild = GIL_MOLERAT;
	level = 80;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 80;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};