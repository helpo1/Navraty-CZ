
prototype Mst_Default_MinecrawlerWarrior(C_Npc)
{
	name[0] = CZ_NAME_Monster_MinecrawlerWarrior;
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_MINECRAWLERWARRIOR;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1750;
	attribute[ATR_HITPOINTS] = 1750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 430;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
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

func void B_SetVisuals_MinecrawlerWarrior()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Cr2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_MinecrawlerWarrior_Desert()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Cr2_Bodz",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance MinecrawlerWarrior(Mst_Default_MinecrawlerWarrior)
{
	name[0] = CZ_NAME_Monster_MinecrawlerWarrior;
	aivar[AIV_Gender] = TRUE;
	level = 15;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1750;
	attribute[ATR_HITPOINTS] = 1750;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 430;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	B_SetVisuals_MinecrawlerWarrior();
	Npc_SetToFistMode(self);
};

instance Minecrawler_Hram(Mst_Default_MinecrawlerWarrior)
{
	name[0] = CZ_NAME_Monster_MinecrawlerWarrior_Temple;
	aivar[AIV_Gender] = TRUE;
	level = 20;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 460;
	protection[PROT_EDGE] = 220;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 70;
	protection[PROT_MAGIC] = 40;
	B_SetVisuals_MinecrawlerWarrior();
	Npc_SetToFistMode(self);
};

instance Caracust(Mst_Default_MinecrawlerWarrior)
{
	name[0] = CZ_NAME_Monster_MinecrawlerWarrior_Karakust;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 10000;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 45000;
	attribute[ATR_HITPOINTS] = 45000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	B_SetVisuals_MinecrawlerWarrior_Desert();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,2.5,2.5,2.5);
	CreateInvItems(self,ItAt_ZaracustPlate,1);
	CreateInvItems(self,ItMi_Mutagen_Str_Strong,1);
	start_aistate = zs_mm_rtn_uniqrest;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance MinecrawlerWarrior_Desert(Mst_Default_MinecrawlerWarrior)
{
	name[0] = CZ_NAME_Monster_MinecrawlerWarrior_Desert;
	aivar[AIV_Gender] = TRUE;
	level = 20;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 2300;
	attribute[ATR_HITPOINTS] = 2300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 30;
	B_SetVisuals_MinecrawlerWarrior_Desert();
	Npc_SetToFistMode(self);
};

prototype Mst_Default_Seeker(C_Npc)
{
	name[0] = CZ_NAME_Monster_Seeker;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DARKGUARD;
	level = 100;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 550;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 380;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 350;
	damagetype = DAM_POINT;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void b_setvisuals_Seeker()
{
	Mdl_SetVisual(self,"sleepkeeper.mds");
	Mdl_SetVisualBody(self,"sleepkeeper_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Seeker(Mst_Default_Seeker)
{
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};

instance GuardiansSphere_Fire(Mst_Default_Seeker)
{
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};

instance GuardiansSphere_Water(Mst_Default_Seeker)
{
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};

instance GuardiansSphere_Dark(Mst_Default_Seeker)
{
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};

instance GuardiansSphere_Stone(Mst_Default_Seeker)
{
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};

instance Anti_Hero(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_Meliaks;
	guild = GIL_DEMON;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 650;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 350;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 450;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
	CreateInvItems(self,ItMi_Mutagen_Mana_Normal,1);
};

prototype Mst_Default_HramGuard(C_Npc)
{
	name[0] = CZ_NAME_Monster_HramGuard;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DARKGUARD;
	level = 50;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 8000;
	attribute[ATR_HITPOINTS] = 8000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 400;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 300;
	damagetype = DAM_POINT;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void b_setvisuals_HramGuard()
{
	Mdl_SetVisual(self,"sleepkeeper.mds");
	Mdl_SetVisualBody(self,"hram_guards_body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance OrcMineDemon(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_MinecrawlerDemon;
	aivar[94] = FALSE;
	protection[PROT_BLUNT] = 270;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 400;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance HramGuard(Mst_Default_Seeker)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};

instance HramGuard_Oazis_01(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_SakShar_Title;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	protection[PROT_BLUNT] = 270;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 400;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 300;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	CreateInvItems(self,ItKe_Oazis_01,1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};

instance HramGuard_Oazis_04(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_IsharArkh_Title;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	protection[PROT_BLUNT] = 270;
	protection[PROT_EDGE] = 270;
	protection[PROT_POINT] = 400;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 300;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	CreateInvItems(self,ItKe_Oazis_04,1);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};

instance Raven_Seeker_01(Mst_Default_HramGuard)
{
	name[0] = CZ_NAME_Monster_HramGuard_GuardMinion;
	guild = GIL_DEMON;
	level = 50;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance Raven_Seeker_02(Mst_Default_HramGuard)
{
	name[0] = CZ_NAME_Monster_HramGuard_GuardMinion;
	guild = GIL_DEMON;
	level = 50;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance Raven_Seeker_03(Mst_Default_HramGuard)
{
	name[0] = CZ_NAME_Monster_HramGuard_GuardMinion;
	guild = GIL_DEMON;
	level = 50;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance Raven_Seeker_04(Mst_Default_HramGuard)
{
	name[0] = CZ_NAME_Monster_HramGuard_GuardMinion;
	guild = GIL_DEMON;
	level = 50;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance AmasSah(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_AmulSakh;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DARKGUARD;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 2000;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon_Med);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	CreateInvItems(self,ItMi_GuneAdanos_02,1);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItMi_Mutagen_Str_Low,1);
};

instance AmasRaf(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_AmulRaf;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DARKGUARD;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_HramGuard();
	EquipItem(self,ItMw_DS_MonWeapon);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	CreateInvItems(self,ItMi_Mutagen_Stamina_Low,1);
};

prototype Mst_Default_DesertSeeker(C_Npc)
{
	name[0] = CZ_NAME_Monster_DesertSeeker;
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_DARKGUARD;
	level = 30;
	attribute[ATR_STRENGTH] = 275;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 220;
	protection[PROT_EDGE] = 220;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 190;
	protection[PROT_FLY] = 190;
	protection[PROT_MAGIC] = 190;
	damagetype = DAM_POINT;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void b_setvisuals_DesertSeeker()
{
	Mdl_SetVisual(self,"sleepkeeper.mds");
	Mdl_SetVisualBody(self,"desert_hunt_body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance DesertSeeker(Mst_Default_DesertSeeker)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_DesertSeeker();
	EquipItem(self,ItMw_DS_MonWeapon);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

prototype Mst_Default_OreBug(C_Npc)
{
	name[0] = CZ_NAME_Monster_OreBug;
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_OREBUG;
	level = 20;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 800;
	attribute[ATR_HITPOINTS] = 800;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 280;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 140;
	damagetype = DAM_POINT;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void b_setvisuals_OreBug()
{
	Mdl_SetVisual(self,"Gnore.mds");
	Mdl_SetVisualBody(self,"Gnore_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_OreWarriorBug()
{
	Mdl_SetVisual(self,"Gnore.mds");
	Mdl_SetVisualBody(self,"GnoreWarior_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance OreBug(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};

instance OreWarriorBug(Mst_Default_OreBug)
{
	name[0] = CZ_NAME_Monster_OreBug_Warrior;
	guild = GIL_MINECRAWLER;
	aivar[AIV_Gender] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_OREBUG;
	level = 30;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 280;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 140;
	b_setvisuals_OreWarriorBug();
	Npc_SetToFistMode(self);
};

instance OreWarriorBug_Uinq(Mst_Default_OreBug)
{
	name[0] = CZ_NAME_Monster_OreBug_Nimrata;
	guild = GIL_MINECRAWLER;
	aivar[AIV_Gender] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_OREBUG;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 380;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 340;
	b_setvisuals_OreWarriorBug();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Mutagen_Stamina_Normal,1);
};

instance OreBug_Tiamant_01(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
};

instance OreBug_Tiamant_02(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
};

instance OreBug_Tiamant_03(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
};

instance OreBug_Tiamant_04(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
};

instance OreBug_Tiamant_05(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
};

instance OreBug_Tiamant_06(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
};

instance OreBug_Tiamant_07(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
};

instance OreBug_Tiamant_08(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
};

instance OreBug_Tiamant_09(Mst_Default_OreBug)
{
	aivar[AIV_Gender] = TRUE;
	b_setvisuals_OreBug();
	Npc_SetToFistMode(self);
};

instance Skeleton_Chaos_Lord(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_ChaosMinion;
	guild = GIL_DEMON;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance IlArah_Chaos_Lord_01(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_ChaosMinion;
	guild = GIL_DEMON;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon_ExElite);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance IlArah_Chaos_Lord_02(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_ChaosMinion;
	guild = GIL_DEMON;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon_ExElite);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance IlArah_Chaos_Lord_03(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_ChaosMinion;
	guild = GIL_DEMON;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon_ExElite);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

instance IlArah_Chaos_Lord_04(Mst_Default_Seeker)
{
	name[0] = CZ_NAME_Monster_Seeker_ChaosMinion;
	guild = GIL_DEMON;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	b_setvisuals_Seeker();
	EquipItem(self,ItMw_DS_MonWeapon_ExElite);
	CreateInvItems(self,ITMI_SeekerSoul,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

//----------------epicheskiye bossy danzha----------------------


func void B_SetVisuals_PaleCrawler()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Cr2_Bodx",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance PaleCrawler(Mst_Default_MinecrawlerWarrior)
{
	name[0] = CZ_NAME_Monster_MinecrawlerWarrior_PaleCrawler;
	aivar[AIV_Gender] = TRUE;
	level = 150;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 750;
	protection[PROT_EDGE] = 750;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 120;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_FOREEVER;
	B_SetVisuals_PaleCrawler();
	Npc_SetToFistMode(self);
};

instance PaleCrawler_Minion(Mst_Default_MinecrawlerWarrior)
{
	name[0] = CZ_NAME_EMPTY;
	aivar[AIV_Gender] = TRUE;
	level = 0;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 1;
	protection[PROT_EDGE] = 1;
	protection[PROT_POINT] = 1;
	protection[PROT_FIRE] = 1;
	protection[PROT_FLY] = 1;
	protection[PROT_MAGIC] = 1;
	B_SetVisuals_PaleCrawler();
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_FOREEVER;
	aivar[AIV_MM_ThreatenBeforeAttack] = FALSE;
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.2,0.2,0.2);
};
