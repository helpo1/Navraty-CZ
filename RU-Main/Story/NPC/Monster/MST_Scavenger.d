
prototype Mst_Default_Scavenger(C_Npc)
{
	name[0] = "Падальщик";
	guild = GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID] = ID_SCAVENGER;
	level = 2;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 35;
	protection[PROT_EDGE] = 35;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 35;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_EatGroundStart] = 6;
	aivar[AIV_MM_EatGroundEnd] = 22;
};

func void B_SetVisuals_Scavenger()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_SetVisualBody(self,"Sca_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_scavenger_sprint()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_SetVisualBody(self,"Spint_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_scavenger_old()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_SetVisualBody(self,"Sca_Body",1,1,"",DEFAULT,DEFAULT,-1);
};


instance Scavenger(Mst_Default_Scavenger)
{
	name[0] = "Падальщик";
	level = 2;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 35;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Scavenger();
	Npc_SetToFistMode(self);
};

instance SCAVENGER_SPRINT(Mst_Default_Scavenger)
{
	name[0] = "Слокерс";
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 35;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_scavenger_sprint();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itat_slokersfur,1);
};

instance SCAVENGER_OLD(Mst_Default_Scavenger)
{
	name[0] = "Старый падальщик";
	level = 4;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 45;
	protection[PROT_EDGE] = 45;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 35;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_scavenger_old();
	Npc_SetToFistMode(self);
};

instance Scavenger_PW_01(Mst_Default_Scavenger)
{
	name[0] = "Падальщик";
	level = 2;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 35;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Scavenger();
	Npc_SetToFistMode(self);
};

instance Scavenger_PW_02(Mst_Default_Scavenger)
{
	name[0] = "Падальщик";
	level = 2;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 35;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Scavenger();
	Npc_SetToFistMode(self);
};

instance Scavenger_PW_03(Mst_Default_Scavenger)
{
	name[0] = "Падальщик";
	level = 2;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 35;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Scavenger();
	Npc_SetToFistMode(self);
};

func void b_setvisuals_scavenger_g3()
{
	Mdl_SetVisual(self,"Flybird.mds");
	Mdl_SetVisualBody(self,"FLB_Body",1,1,"",DEFAULT,DEFAULT,-1);
};

instance Scavenger_Mount(Mst_Default_Scavenger)
{
	name[0] = "Горный падальщик";
	level = 10;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 15;
	b_setvisuals_scavenger_g3();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw_Mount,1);
	Mdl_SetModelScale(self,0.8,0.8,0.8);
};