
prototype Mst_Default_Shadowbeast(C_Npc)
{
	name[0] = "Мракорис";
	guild = GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST;
	level = 17;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 145;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 8;
	aivar[AIV_MM_SleepEnd] = 20;
	aivar[AIV_MM_RoamStart] = 20;
	aivar[AIV_MM_RoamEnd] = 8;
};

func void B_SetVisuals_Shadowbeast()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Sha_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Shadowbeast_Night()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Sha_Bodz",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_shadowbeast_2()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Sha_Bods",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_shadowbeast_crait()
{
	Mdl_SetVisual(self,"SHADOWMOUNT.mds");
	Mdl_SetVisualBody(self,"Mou_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_Set_Muritan_Visuals()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Sha_Bodf",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_Set_SnowShadow_Visuals()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Sha_Boda",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_BulMogg_Visuals()
{
	Mdl_SetVisual(self,"BULMOGG.mds");
	Mdl_SetVisualBody(self,"BULMOGG_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_Crat_Visuals()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"LEDERSCHATTEN",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_Crait_Visuals()
{
	Mdl_SetVisual(self,"SHADOWMOUNT.mds");
	Mdl_SetVisualBody(self,"Mou_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance BulMogg(Mst_Default_Shadowbeast)
{
	name[0] = "Булмог";
	level = 50;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 280;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 180;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 180;
	Set_BulMogg_Visuals();
	Npc_SetToFistMode(self);
};

instance Muritan(Mst_Default_Shadowbeast)
{
	name[0] = "Муритан";
	level = 50;
	vars[1] = TRUE;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 280;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 180;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 180;
	B_Set_Muritan_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_BuritanTooth,1);
};

instance Muritan_North(Mst_Default_Shadowbeast)
{
	name[0] = "Муритан";
	level = 50;
	vars[1] = TRUE;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 280;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 180;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 180;
	B_Set_Muritan_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_BuritanTooth,1);
};

instance Muritan_South(Mst_Default_Shadowbeast)
{
	name[0] = "Муритан";
	level = 50;
	vars[1] = TRUE;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 280;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 180;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 180;
	B_Set_Muritan_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_BuritanTooth,1);
};

instance Muritan_PW(Mst_Default_Shadowbeast)
{
	name[0] = "Муритан";
	level = 50;
	vars[1] = TRUE;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5500;
	attribute[ATR_HITPOINTS] = 5500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 280;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 180;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 180;
	B_Set_Muritan_Visuals();
	CreateInvItems(self,ItAt_PW_MuritanTooth,2);
	Npc_SetToFistMode(self);
};

instance Muritan_PW_02(Mst_Default_Shadowbeast)
{
	name[0] = "Муритан";
	level = 50;
	vars[1] = TRUE;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5500;
	attribute[ATR_HITPOINTS] = 5500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 280;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 180;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 180;
	B_Set_Muritan_Visuals();
	CreateInvItems(self,ItAt_PW_MuritanTooth,2);
	Npc_SetToFistMode(self);
};

instance Shadowbeast(Mst_Default_Shadowbeast)
{
	name[0] = "Мракорис";
	aivar[AIV_Gender] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 145;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	b_setvisuals_shadowbeast_2();
	Npc_SetToFistMode(self);
};

instance Shadowbeast_Trf(Mst_Default_Shadowbeast)
{
	name[0] = "Мракорис";
	aivar[AIV_Gender] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	b_setvisuals_shadowbeast_2();
	Npc_SetToFistMode(self);
};

instance ShadowBeast_Ice(Mst_Default_Shadowbeast)
{
	name[0] = "Белый мракорис";
	aivar[AIV_Gender] = TRUE;
	level = 90;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 280;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 240;
	protection[PROT_FIRE] = 180;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 180;
	B_Set_SnowShadow_Visuals();
	Npc_SetToFistMode(self);
};

instance Shadowbeast_Rune(Mst_Default_Shadowbeast)
{
	name[0] = "Мракорис";
	aivar[AIV_Gender] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 195;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	b_setvisuals_shadowbeast_2();
	Npc_SetToFistMode(self);
};

instance Shadowbeast_Vatras(Mst_Default_Shadowbeast)
{
	name[0] = "Мракорис";
	aivar[AIV_Gender] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 145;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	b_setvisuals_shadowbeast_2();
	Npc_SetToFistMode(self);
};

instance NIGHTHUNTER(Mst_Default_Shadowbeast)
{
	name[0] = "Тракрас, призрачный мракорис";
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 650;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_HITPOINTS] = 8000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 400;
	protection[PROT_FIRE] = 120;
	protection[PROT_FLY] = 175;
	protection[PROT_MAGIC] = 140;
	B_SetVisuals_Shadowbeast_Night();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itat_nighthunterfur,1);
};

instance BeachShadowbeast1(Mst_Default_Shadowbeast)
{
	name[0] = "Мракорис";
	aivar[AIV_Gender] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 145;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	b_setvisuals_shadowbeast_2();
	Npc_SetToFistMode(self);
};

instance Shadowbeast_Loa_01(Mst_Default_Shadowbeast)
{
	name[0] = "Мракорис";
	aivar[AIV_Gender] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 145;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	b_setvisuals_shadowbeast_2();
	Npc_SetToFistMode(self);
};

instance Shadowbeast_Loa_02(Mst_Default_Shadowbeast)
{
	name[0] = "Мракорис";
	aivar[AIV_Gender] = TRUE;
	level = 17;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 145;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	b_setvisuals_shadowbeast_2();
	Npc_SetToFistMode(self);
};

instance FIRETESTMONSTER_03(Mst_Default_Shadowbeast)
{
	name[0] = "Дух Огня";
	level = 50;
	attribute[ATR_STRENGTH] = 280;
	attribute[ATR_DEXTERITY] = 280;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 160;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 25;
	b_setvisuals_shadowbeast_2();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
};

instance Werewolf(Mst_Default_Shadowbeast)
{
	name[0] = "Мракорис Игнаца";
	level = 1;
	guild = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 145;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	b_setvisuals_shadowbeast_2();
	Npc_SetToFistMode(self);
};

instance OrcCrait(Mst_Default_Shadowbeast)
{
	aivar[AIV_EnemyOverride] = TRUE;
	b_setvisuals_shadowbeast_crait();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Spider;
};

instance Crait(Mst_Default_Shadowbeast)
{
	name[0] = "Крайт";
	guild = GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	level = 1 + CraitLvl;
	attribute[ATR_STRENGTH] = 275 + (CraitLvl * 10);
	attribute[ATR_DEXTERITY] = 200 + (CraitLvl * 10);
	attribute[ATR_HITPOINTS_MAX] = 1000 + (CraitLvl * 50);
	attribute[ATR_HITPOINTS] = 1000 + (CraitLvl * 50);
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 145 + (CraitLvl * 5);
	protection[PROT_EDGE] = 120 + (CraitLvl * 5);
	protection[PROT_POINT] = 100 + (CraitLvl * 5);
	protection[PROT_FIRE] = 20 + (CraitLvl * 5);
	protection[PROT_FLY] = 50 + (CraitLvl * 5);
	protection[PROT_MAGIC] = 20 + (CraitLvl * 5);
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	Set_Crait_Visuals();
	Npc_SetToFistMode(self);
};
