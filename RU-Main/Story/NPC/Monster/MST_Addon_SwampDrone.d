
prototype Mst_Default_SwampDrone(C_Npc)
{
	name[0] = "Ядовитая болотная муха";
	guild = GIL_BLOODFLY;
	vars[1] = TRUE;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPDRONE;
	level = 5;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_POINT;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void B_SetVisuals_SwampDrone()
{
	Mdl_SetVisual(self,"SwampDrone.mds");
	Mdl_SetVisualBody(self,"SwampDrone_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SwampDrone(Mst_Default_SwampDrone)
{
	name[0] = "Ядовитая болотная муха";
	aivar[AIV_Gender] = TRUE;
	level = 5;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_SwampDrone();
	Npc_SetToFistMode(self);
};

instance SUMMONED_SWAMPDRONE(Mst_Default_SwampDrone)
{
	name[0] = "Рунная болотная муха";
	level = 0;
	guild = GIL_BLOODFLY;
	effect = "SPELLFX_MOON_SMOKE";
	aivar[AIV_MM_REAL_ID] = id_summoned_swampdrone;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 2;
	attribute[ATR_MANA] = 2;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_SwampDrone();
	Npc_SetToFistMode(self);
};

instance SWAMPDRONE_UNIQ(Mst_Default_SwampDrone)
{
	name[0] = "Зестоблум";
	level = 30;
	vars[1] = TRUE;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 130;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 50;
	protection[PROT_MAGIC] = 20;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	B_SetVisuals_SwampDrone();
	Mdl_SetModelScale(self,1.05,1.05,1.05);
	Npc_SetToFistMode(self);
};