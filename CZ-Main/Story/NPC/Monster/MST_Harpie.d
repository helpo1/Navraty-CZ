
prototype Mst_Default_Harpie(C_Npc)
{
	name[0] = CZ_NAME_Monster_Harpie;
	guild = GIL_HARPY;
	aivar[AIV_MM_REAL_ID] = ID_HARPY;
	level = 12;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 300;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HARPY;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_HarpyFeder,3);
};

func void B_SetVisuals_Harpie()
{
	Mdl_SetVisual(self,"Harpie.mds");
	Mdl_SetVisualBody(self,"Har_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Harpie(Mst_Default_Harpie)
{
	name[0] = CZ_NAME_Monster_Harpie;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 40;
	B_SetVisuals_Harpie();
	Npc_SetToFistMode(self);
};

instance HARPIE_UNIQ(Mst_Default_Harpie)
{
	name[0] = CZ_NAME_Monster_Harpie_Rukvayya;
	level = 35;
	attribute[ATR_STRENGTH] = 190;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 190;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 75;
	aivar[90] = TRUE;
	aivar[94] = NPC_UNCOMMON;
	B_SetVisuals_Harpie();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
	CreateInvItems(self,ITAT_GARPIISERDCE,1);
	CreateInvItems(self,ItMi_Mutagen_Mana_Low,1);
};