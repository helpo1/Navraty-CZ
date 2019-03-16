
prototype Mst_Default_Minecrawler(C_Npc)
{
	name[0] = "Ползун";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_MINECRAWLER;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_POINT;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Minecrawler()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Crw_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Spider_Drv_0()
{
	Mdl_SetVisual(self,"SPDR.MDS");
	Mdl_SetVisualBody(self,"SPDR_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Spider_Drv_1()
{
	Mdl_SetVisual(self,"SPDR.MDS");
	Mdl_SetVisualBody(self,"SPDX_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Spider_Drv_2()
{
	Mdl_SetVisual(self,"SPDR.MDS");
	Mdl_SetVisualBody(self,"SPDY_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Spider_Drv_3()
{
	Mdl_SetVisual(self,"SPDR.MDS");
	Mdl_SetVisualBody(self,"SPDZ_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Spider_Drv_4()
{
	Mdl_SetVisual(self,"SPDR.MDS");
	Mdl_SetVisualBody(self,"SPDS_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Spider_Boss()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"PIRANHA_SPIDER_02",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Minecrawler(Mst_Default_Minecrawler)
{
	name[0] = "Ползун";
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Minecrawler();
	Npc_SetToFistMode(self);
};

instance Minecrawler_Mini(Mst_Default_Minecrawler)
{
	name[0] = "Вылупившийся ползун";
	aivar[AIV_Gender] = TRUE;
	level = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	aivar[AIV_MM_ThreatenBeforeAttack] = FALSE;
	protection[PROT_BLUNT] = 1;
	protection[PROT_EDGE] = 1;
	protection[PROT_POINT] = 1;
	protection[PROT_FIRE] = 1;
	protection[PROT_FLY] = 1;
	protection[PROT_MAGIC] = 1;
	B_SetVisuals_Minecrawler();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.3,0.3,0.3);
};

instance Minecrawler_Priest(Mst_Default_Minecrawler)
{
	name[0] = "Ползун";
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Minecrawler();
	Npc_SetToFistMode(self);
};

instance GoldMinecrawler(Mst_Default_Minecrawler)
{
	name[0] = "Ползун";
	aivar[AIV_Gender] = TRUE;
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_Minecrawler();
	Npc_SetToFistMode(self);
};

instance MINECRAWLER_UNIQ(Mst_Default_Minecrawler)
{
	name[0] = "Ядовитый ползун";
	level = 35;
	attribute[ATR_STRENGTH] = 280;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 240;
	protection[PROT_POINT] = 280;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = 160;
	protection[PROT_MAGIC] = 120;
	aivar[90] = TRUE;
	B_SetVisuals_Minecrawler();
	Npc_SetToFistMode(self);
};

instance Spider_Tara(Mst_Default_Minecrawler)
{
	name[0] = "Паук";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SPIDER;
	level = 0;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 30;
	B_SetVisuals_Spider_Drv_0();
	start_aistate = zs_mm_rtn_spider;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
};

instance Spider(Mst_Default_Minecrawler)
{
	name[0] = "Гигантский паук";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SPIDER;
	level = 10;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 30;
	B_SetVisuals_Spider_Drv_0();
	start_aistate = zs_mm_rtn_spider;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
};

instance Spider_Mine(Mst_Default_Minecrawler)
{
	name[0] = "Горный паук";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SPIDER;
	level = 25;
	aivar[AIV_Gender] = TRUE;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 30;
	B_SetVisuals_Spider_Drv_1();
	start_aistate = zs_mm_rtn_spider;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
};

instance Spider_Uniq(Mst_Default_Minecrawler)
{
	name[0] = "Агелидас";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SPIDER;
	level = 60;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 190;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 90;
	B_SetVisuals_Spider_Drv_1();
	start_aistate = zs_mm_rtn_spider;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
};

instance Garantula(Mst_Default_Minecrawler)
{
	name[0] = "Гарантула";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SPIDER;
	level = 80;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 230;
	attribute[ATR_DEXTERITY] = 590;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 230;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 100;
	B_SetVisuals_Spider_Drv_0();
	start_aistate = zs_mm_rtn_spider;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_SpiderEgg,1);
};

instance Shivana(Mst_Default_Minecrawler)
{
	name[0] = "Шивана";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SPIDER;
	level = 80;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	attribute[ATR_STRENGTH] = 320;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 220;
	protection[PROT_POINT] = 190;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 90;
	B_SetVisuals_Spider_Drv_1();
	start_aistate = zs_mm_rtn_spider;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
};

instance Shelob(Mst_Default_Minecrawler)
{
	name[0] = "Шалия";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SPIDER;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 390;
	attribute[ATR_HITPOINTS_MAX] = 9000;
	attribute[ATR_HITPOINTS] = 9000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 290;
	protection[PROT_EDGE] = 290;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 280;
	B_SetVisuals_Spider_Boss();
	start_aistate = zs_mm_rtn_spider;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	CreateInvItems(self,ItAt_SpiderEgg,2);
};

instance Kuta(Mst_Default_Minecrawler)
{
	name[0] = "Кута";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SPIDER;
	level = 120;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 420;
	attribute[ATR_DEXTERITY] = 590;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_HITPOINTS] = 8000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 220;
	protection[PROT_POINT] = 190;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 90;
	B_SetVisuals_Spider_Drv_2();
	start_aistate = zs_mm_rtn_spider;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_SpiderEgg,2);
	CreateInvItems(self,ItMi_Mutagen_Stamina_Strong,1);
};

instance Tararantul(Mst_Default_Minecrawler)
{
	name[0] = "Тарарантул";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SPIDER;
	level = 150;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 390;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 350;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 260;
	protection[PROT_MAGIC] = 250;
	B_SetVisuals_Spider_Drv_4();
	start_aistate = zs_mm_rtn_spider;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Mutagen_Dex_Normal,1);
};