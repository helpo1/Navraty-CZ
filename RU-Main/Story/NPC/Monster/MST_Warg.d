
prototype Mst_Default_Warg(C_Npc)
{
	name[0] = "Варг";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WARG;
	level = 12;
	attribute[ATR_STRENGTH] = 180;
	attribute[ATR_DEXTERITY] = 180;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
};

func void B_SetVisuals_WARG()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Warg_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_BLACKWOLF()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Warg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_orcdog()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Dog_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Warg_Trf(Mst_Default_Warg)
{
	name[0] = "Варг";
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_WARG();
	Npc_SetToFistMode(self);
};

instance Warg_Rune(Mst_Default_Warg)
{
	name[0] = "Варг";
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 15;
	B_SetVisuals_WARG();
	Npc_SetToFistMode(self);
};


instance Warg(Mst_Default_Warg)
{
	name[0] = "Варг";
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_WARG();
	Npc_SetToFistMode(self);
};

instance ORCDOG(Mst_Default_Warg)
{
	name[0] = "Орочья гончая";
	aivar[AIV_Gender] = TRUE;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1100;
	attribute[ATR_HITPOINTS] = 1100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 15;
	b_setvisuals_orcdog();
	Npc_SetToFistMode(self);
};

instance BlackWolf(Mst_Default_Warg)
{
	name[0] = "Черный волк";
	aivar[AIV_Gender] = TRUE;
	level = 20;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1250;
	attribute[ATR_HITPOINTS] = 1250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 175;
	protection[PROT_EDGE] = 175;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 15;
	B_SetVisuals_BLACKWOLF();
	Npc_SetToFistMode(self);
};

instance WARG7(Mst_Default_Warg)
{
	name[0] = "Варг-призрак";
	level = 50;
	guild = GIL_ORC;
	flags = ORCTEMPLENPCFLAGS;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 25;
	B_SetVisuals_WARG();
	Npc_SetToFistMode(self);
};

instance BLACKWOLF_UNIQ(Mst_Default_Warg)
{
	name[0] = "Тенеклык";
	level = 45;
	attribute[ATR_STRENGTH] = 390;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 20;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	B_SetVisuals_BLACKWOLF();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_DlackTeeth,1);
};

instance WARG_UNIQ(Mst_Default_Warg)
{
	name[0] = "Церебус";
	level = 50;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 280;
	protection[PROT_EDGE] = 220;
	protection[PROT_POINT] = 135;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 50;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	B_SetVisuals_WARG();
	Npc_SetToFistMode(self);
};

instance Summoned_Warg(Mst_Default_Warg)
{
	name[0] = "Рунный варг";
	guild = gil_summoned_wolf;
	aivar[AIV_MM_REAL_ID] = id_summoned_wolf;
	level = 0;
	attribute[ATR_STRENGTH] = 130;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 2;
	attribute[ATR_MANA] = 2;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 10;
	aivar[AIV_PARTYMEMBER] = TRUE;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_WARG();
	Npc_SetToFistMode(self);
};