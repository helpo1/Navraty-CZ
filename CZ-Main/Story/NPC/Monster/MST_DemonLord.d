
prototype Mst_Default_DemonLord(C_Npc)
{
	name[0] = CZ_NAME_Monster_DemonLord;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 60;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 450;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_DemonLord()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	self.effect = "SPELLFX_FIRE_SMOKE";
};

func void b_setvisuals_demonlord_elite()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",1,1,"",DEFAULT,DEFAULT,-1);
	self.effect = "SPELLFX_FIRE_SMOKE_FULL";
};

func void b_setvisuals_demonlord_elite_main()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",2,2,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_demonlord_elite_extra()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",3,3,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_demonlord_elite_chaos()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",4,4,"",DEFAULT,DEFAULT,-1);
};

instance DemonLord(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord;
	level = 60;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 450;
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

instance Demon_Lord_Milten(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord;
	level = 1;
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 10;
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

instance DEMONLORD_NONEEXP(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord;
	level = 1;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 450;
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

instance DEMONLORD_AM(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord;
	level = 60;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 450;
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

instance DEMONLORD_HR(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord;
	level = 60;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 450;
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

instance DEMON_SENDSENYAK(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_SenyakMinion;
	level = 1;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 450;
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
	aivar[AIV_EnemyOverride] = TRUE;
	start_aistate = ZS_MM_Rtn_DragonRest;
};

instance LUZIAN_DEMON(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Lyutsian;
	level = 100;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 375;
	protection[PROT_FLY] = 275;
	protection[PROT_MAGIC] = 450;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LUZIAN;
	CreateInvItems(self,ItMi_Mutagen_Mana_Low,1);
	CreateInvItems(self,itat_luzianheart,1);
	CreateInvItems(self,ItPo_ElixirSHadow,1);
	b_setvisuals_demonlord_elite();
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	start_aistate = ZS_MM_Rtn_DragonRest;
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItPo_ElixirSHadow,1);
	CreateInvItems(self,ItMi_SMD_Mutagen,1);
	CreateInvItems(self,ItMi_Statue_Demon_01,1);
};

instance SHEMRON_DEMON(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Shemron;
	level = 200;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 450;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_DragonRest;
	CreateInvItems(self,ItMi_Mutagen_Mana_Normal,1);
	CreateInvItems(self,ItMi_SMAD_Mutagen,1);
};

instance ELIGOR_DEMON(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligor;
	guild = GIL_SUMMONED_DEMON;
	level = 500;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 800;
	attribute[ATR_DEXTERITY] = 800;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 1000;
	protection[PROT_EDGE] = 1000;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 1000;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 1000;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	b_setvisuals_demonlord_elite_main();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_DragonRest;
};

instance ELIGOR_DEMON_OW(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligor;
	guild = GIL_SUMMONED_DEMON;
	level = 500;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 800;
	attribute[ATR_DEXTERITY] = 800;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 1000;
	protection[PROT_EDGE] = 1000;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 1000;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 1000;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	b_setvisuals_demonlord_elite_main();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_DragonRest;
};

instance SENYAK_DEMON(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Senyak;
	level = 500;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 750;
	attribute[ATR_HITPOINTS_MAX] = 45000;
	attribute[ATR_HITPOINTS] = 45000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 400;
	protection[PROT_EDGE] = 400;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	effect = "SPELLFX_REDFLAME_SMOKE_FULL";
	b_setvisuals_demonlord_elite_extra();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_DragonRest;
	CreateInvItems(self,ItMi_Mutagen_HP_Normal,1);
	CreateInvItems(self,ItMi_MAD_Mutagen,1);
};

instance GHOST_SENYAK_DEMON(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_SenyakSoul;
	guild = GIL_SKELETON;
	flags = NPC_FLAG_GHOST;
	aivar[AIV_MM_REAL_ID] = ID_DEADMAGE;
	level = 50;
	aivar[90] = TRUE;
	aivar[89] = TRUE;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	b_setvisuals_demonlord_elite_extra();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_DragonRest;
};

instance SUMMONED_ELIGORDEMON_01(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors01;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	level = 0;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_ELIGORDEMON_02(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors02;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	aivar[94] = NPC_LEGEND;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_ELIGORDEMON_03(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors03;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	aivar[94] = NPC_LEGEND;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_ELIGORDEMON_04(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors04;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	aivar[94] = NPC_LEGEND;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_ELIGORDEMON_05(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors05;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	aivar[94] = NPC_LEGEND;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_ELIGORDEMON_06(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors06;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	aivar[94] = NPC_LEGEND;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_ELIGORDEMON_07(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors07;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	aivar[94] = NPC_LEGEND;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_ELIGORDEMON_08(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors08;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	aivar[94] = NPC_LEGEND;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_ELIGORDEMON_09(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors09;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	aivar[94] = NPC_LEGEND;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_ELIGORDEMON_10(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Eligors10;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	aivar[94] = NPC_LEGEND;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 6000;
	attribute[ATR_HITPOINTS] = 6000;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	effect = "SPELLFX_FIRE_SMOKE";
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_DEMONLORD(Mst_Default_Demon)
{
	name[0] = CZ_NAME_Monster_Demon_SummonedYoungLord;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	level = 0;
	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 4500;
	attribute[ATR_HITPOINTS] = 4500;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 200;
	aivar[AIV_PARTYMEMBER] = TRUE;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetAttitude(self,ATT_FRIENDLY);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_DEMONLORD_Up_01(Mst_Default_Demon)
{
	name[0] = CZ_NAME_Monster_Demon_SummonedOldLord;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	level = 0;
	attribute[ATR_STRENGTH] = 400;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 25;
	attribute[ATR_MANA] = 25;
	protection[PROT_BLUNT] = 225;
	protection[PROT_EDGE] = 225;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 225;
	protection[PROT_FLY] = 225;
	protection[PROT_MAGIC] = 225;
	aivar[AIV_PARTYMEMBER] = TRUE;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetAttitude(self,ATT_FRIENDLY);
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance SUMMONED_DEMONLORD_Up_02(Mst_Default_Demon)
{
	name[0] = CZ_NAME_Monster_Demon_SummonedHighLord;
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DEMON;
	level = 0;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 5500;
	attribute[ATR_HITPOINTS] = 5500;
	attribute[ATR_MANA_MAX] = 30;
	attribute[ATR_MANA] = 30;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 250;
	protection[PROT_MAGIC] = 250;
	aivar[AIV_PARTYMEMBER] = TRUE;
	effect = "SPELLFX_MOON_SMOKE";
	B_SetAttitude(self,ATT_FRIENDLY);
	b_setvisuals_demonlord_elite_extra();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance DEMONLORD_LI_1(Mst_Default_Demon)
{
	name[0] = CZ_NAME_Monster_Demon_Ghost;
	level = 60;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 8500;
	attribute[ATR_HITPOINTS] = 8500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 320;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 450;
	b_setvisuals_demonlord_elite();
	start_aistate = ZS_MM_Rtn_DragonRest;
	Npc_SetToFistMode(self);
};

instance DEMONLORD_LI_2(Mst_Default_Demon)
{
	name[0] = CZ_NAME_Monster_Demon_Ghost;
	level = 60;
	flags = NPC_FLAG_GHOST;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 8500;
	attribute[ATR_HITPOINTS] = 8500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 320;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 450;
	b_setvisuals_demonlord_elite();
	start_aistate = ZS_MM_Rtn_DragonRest;
	Npc_SetToFistMode(self);
};

instance DEMONDAGOT_01(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guardians;
	level = 50;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 450;
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
};

instance DEMONDAGOT_02(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guardians;
	level = 50;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 450;
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
};

instance DEMONDAGOT_03(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guardians;
	level = 50;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 450;
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
};

instance DEMONDAGOT_04(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guardians;
	level = 50;
	attribute[ATR_STRENGTH] = 550;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 400;
	protection[PROT_FLY] = 400;
	protection[PROT_MAGIC] = 450;
	flags = NPC_FLAG_IMMORTAL;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
};

instance Demon_PW_01(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Masyaf;
	flags = NPC_FLAG_IMMORTAL;
	level = 30;
	guild = GIL_MEATBUG;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_DemonLord();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};


instance Demon_PW_02(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Masyaf;
	level = 30;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_MEATBUG;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_DemonLord();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance Demon_PW_03(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Masyaf;
	level = 30;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_MEATBUG;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_DemonLord();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance Demon_PW_04(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Masyaf;
	level = 30;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_MEATBUG;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 200;
	B_SetVisuals_DemonLord();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance Demon_PW_BOSS_GUARD_WAY(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Nebiros;
	level = 300;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_demonlord_elite();
	effect = "SPELLFX_REDFLAME_SMOKE_FULL";
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItMi_Mutagen_Mana_Normal,1);
	CreateInvItems(self,ItMi_SMAD_Mutagen,1);
};

instance Demon_PW_BOSS_GUARD_01(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guard;
	level = 60;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_demonlord_elite_main();
	aivar[AIV_MaxDistToWp] = 100;
	Npc_SetToFistMode(self);
};

instance Demon_PW_BOSS_GUARD_02(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guard;
	level = 60;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_demonlord_elite_main();
	aivar[AIV_MaxDistToWp] = 100;
	Npc_SetToFistMode(self);
};

instance Demon_PW_BOSS_GUARD_03(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guard;
	level = 60;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_demonlord_elite_main();
	aivar[AIV_MaxDistToWp] = 100;
	Npc_SetToFistMode(self);
};

instance Demon_OT_BOSS_GUARD_01(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guard;
	level = 60;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_demonlord_elite_main();
	Npc_SetToFistMode(self);
};

instance Demon_OT_BOSS_GUARD_02(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guard;
	level = 60;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_demonlord_elite_main();
	Npc_SetToFistMode(self);
};

instance Demon_OT_BOSS_GUARD_03(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guard;
	level = 60;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_demonlord_elite_main();
	Npc_SetToFistMode(self);
};

instance Demon_OT_BOSS_GUARD_04(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guard;
	level = 60;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_demonlord_elite_main();
	Npc_SetToFistMode(self);
};

instance Demon_OT_BOSS_GUARD_05(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Guard;
	level = 60;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	b_setvisuals_demonlord_elite_main();
	Npc_SetToFistMode(self);
};

instance Haniar_Demon_01(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Haniar;
	level = 60;
	attribute[ATR_STRENGTH] = 5000;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

instance Haniar_Demon_02(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Haniar;
	level = 60;
	attribute[ATR_STRENGTH] = 5000;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

instance Haniar_Demon_03(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Haniar;
	level = 60;
	attribute[ATR_STRENGTH] = 5000;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 350;
	protection[PROT_FLY] = 350;
	protection[PROT_MAGIC] = 350;
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

//----------------------------Demony khraniteli--------------------------------------------


instance WATERRITUALDEMON(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_BarTrok_Title;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	level = 400;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 700;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 500;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	effect = "SPELLFX_REDFLAME_SMOKE_FULL";
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItems(self,ItMi_Mutagen_HP_Strong,1);
	CreateInvItems(self,ItMi_LMAD_Mutagen,1);
	start_aistate = zs_mm_rtn_uniqrest;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance HaosDemon_Orcmine(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_IrkhTar_Title;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 400;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 500;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	effect = "SPELLFX_REDFLAME_SMOKE_FULL";
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	start_aistate = zs_mm_rtn_uniqrest;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_Mutagen_Str_Strong,1);
	CreateInvItems(self,ItMi_LMAD_Mutagen,1);
};

instance HaosDemon_Psicamp(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_MorBar_Title;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 300;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 650;
	attribute[ATR_DEXTERITY] = 550;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 500;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ITWR_UBERIONBOOK,1);
	effect = "SPELLFX_REDFLAME_SMOKE_FULL";
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	start_aistate = zs_mm_rtn_uniqrest;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_Mutagen_Dex_Strong,1);
	CreateInvItems(self,ItMi_LMAD_Mutagen,1);
};

instance GuardChamber_Demon(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_ChaosHand;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 250;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 650;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	effect = "SPELLFX_REDFLAME_SMOKE_FULL";
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	start_aistate = zs_mm_rtn_uniqrest;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance GuardChamber_Demon_Portal(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_ChaosPortalGuardian;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 250;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 650;
	attribute[ATR_HITPOINTS_MAX] = 30000;
	attribute[ATR_HITPOINTS] = 30000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItWr_Stonnos_07,1);
	effect = "SPELLFX_REDFLAME_SMOKE_FULL";
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	start_aistate = zs_mm_rtn_uniqrest;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Demon_SleeperIns(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_Harbinger;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 250;
	flags = 0;
	attribute[ATR_STRENGTH] = 750;
	attribute[ATR_DEXTERITY] = 650;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	effect = "SPELLFX_REDFLAME_SMOKE_FULL";
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	start_aistate = zs_mm_rtn_uniqrest;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance DEMON_CHAOS(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_KraTuk_Title;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_HAOSAVATAR;
	level = 500;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 1500;
	attribute[ATR_DEXTERITY] = 800;
	attribute[ATR_HITPOINTS_MAX] = 100000;
	attribute[ATR_HITPOINTS] = 100000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 550;
	protection[PROT_FLY] = 550;
	protection[PROT_MAGIC] = 550;
	fight_tactic = FAI_NAILED;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FollowInWater] = FALSE;
	effect = "spellfx_undead_dragon";
	b_setvisuals_demonlord_elite_chaos();
	Npc_SetToFistMode(self);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Mdl_SetModelScale(self,1.2,1.2,1.2);
	start_aistate = zs_mm_rtn_uniqrest;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Skeleton_Demon_Chaos(Mst_Default_DemonLord)
{
	name[0] = CZ_NAME_Monster_DemonLord_ChaosMinion;
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 150;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 650;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 2000;
	attribute[ATR_MANA] = 2000;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 1000;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	b_setvisuals_demonlord_elite();
	Npc_SetToFistMode(self);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	start_aistate = zs_mm_rtn_uniqrest;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};