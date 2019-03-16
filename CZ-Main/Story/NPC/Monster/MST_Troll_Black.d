
prototype Mst_Default_Troll_Black(C_Npc)
{
	name[0] = CZ_NAME_Monster_TrollBlack;
	guild = GIL_TROLL;
	aivar[AIV_MM_REAL_ID] = ID_TROLL_BLACK;
	bodyStateInterruptableOverride = TRUE;
	level = 80;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_HITPOINTS] = 8000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 299;
	protection[PROT_MAGIC] = 240;
	damagetype = DAM_BLUNT | DAM_FLY;
	damage[DAM_INDEX_BLUNT] = 650;
	damage[DAM_INDEX_FLY] = 175;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RestStart] = 6;
	aivar[AIV_MM_RestStart] = 22;
};

func void B_SetVisuals_Troll_Black()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Troll_Black_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Troll_Black_Cave()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Troll_Black_Body",1,1,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Troll_Black_Orc()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Troll_Blacz_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Troll_Ice()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Troll_Blact_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Troll_Black(Mst_Default_Troll_Black)
{
	name[0] = CZ_NAME_Monster_TrollBlack;
	level = 80;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_HITPOINTS] = 8000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 299;
	protection[PROT_MAGIC] = 240;
	B_SetVisuals_Troll_Black();
	Npc_SetToFistMode(self);
};

instance Troll_Black_OW(Mst_Default_Troll_Black)
{
	name[0] = CZ_NAME_Monster_TrollBlack;
	level = 80;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_HITPOINTS] = 8000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 299;
	protection[PROT_MAGIC] = 240;
	B_SetVisuals_Troll_Black();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Troll_Black_War(Mst_Default_Troll_Black)
{
	name[0] = CZ_NAME_Monster_TrollBlack_War;
	level = 100;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 9000;
	attribute[ATR_HITPOINTS] = 9000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 340;
	B_SetVisuals_Troll_Black_Orc();
	Npc_SetToFistMode(self);
};

instance TROLL_BLACK_EXT(Mst_Default_Troll_Black)
{
	name[0] = CZ_NAME_Monster_TrollBlack;
	level = 70;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 299;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_Troll_Black();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_SleepStart] = 1;
	aivar[AIV_MM_SleepEnd] = 23;
	aivar[AIV_MM_RestStart] = 23;
	aivar[AIV_MM_RestStart] = 1;
};

instance TROLL_BLACK_AGE(Mst_Default_Troll_Black)
{
	name[0] = CZ_NAME_Monster_TrollBlack_Cave;
	level = 150;
	aivar[AIV_MM_REAL_ID] = ID_TROLL_BLACK_CAVE;
	attribute[ATR_STRENGTH] = 800;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 12000;
	attribute[ATR_HITPOINTS] = 12000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 260;
	protection[PROT_FLY] = 299;
	protection[PROT_MAGIC] = 250;
	B_SetVisuals_Troll_Black_Cave();
	Npc_SetToFistMode(self);
};

instance TROLL_BLACK_AGE_PW(Mst_Default_Troll_Black)
{
	name[0] = CZ_NAME_Monster_TrollBlack_YoungCave;
	level = 100;
	aivar[AIV_MM_REAL_ID] = ID_TROLL_BLACK_CAVE;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 400;
	protection[PROT_FIRE] = 260;
	protection[PROT_FLY] = 299;
	protection[PROT_MAGIC] = 250;
	B_SetVisuals_Troll_Black_Cave();
	CreateInvItems(self,ItAt_CaveBlackFurTroll,1);
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance Troll_Black_AV(Mst_Default_Troll_Black)
{
	name[0] = CZ_NAME_Monster_TrollBlack_Nurog_Title;
	level = 250;
	guild = GIL_DEMON;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	aivar[AIV_MM_REAL_ID] = ID_TROLL_BLACK_CAVE;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	effect = "SPELLFX_MAGIC_SMOKE";
	B_SetVisuals_Troll_Black_Cave();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Mutagen_Str_Normal,1);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 0;
	aivar[AIV_MM_SleepEnd] = 0;
	aivar[AIV_MM_RoamStart] = 0;
	aivar[AIV_MM_RoamEnd] = 0;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance Troll_Ice(Mst_Default_Troll_Black)
{
	name[0] = CZ_NAME_Monster_TrollBlack_MountainIce;
	level = 200;
	aivar[AIV_MM_REAL_ID] = ID_TROLL_BLACK_ICE;
	attribute[ATR_STRENGTH] = 900;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 500;
	B_SetVisuals_Troll_Ice();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_SkullWhiteTroll,1);
	CreateInvItems(self,ItMi_Mutagen_HP_Normal,1);
};