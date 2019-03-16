
instance ORC_8509_SHAMAN(C_Npc)
{
	name[0] = CZ_NAME_Orc_Shaman_V1;
	guild = GIL_ORC;
	id = 8509;
	voice = 18;
	level = 15;
	flags = ORCTEMPLENPCFLAGS;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	npcType = NPCTYPE_AMBIENT;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 350;
	attribute[ATR_HITPOINTS] = 350;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 65;
	HitChance[NPC_TALENT_1H] = 60;
	HitChance[NPC_TALENT_2H] = 60;
	HitChance[NPC_TALENT_BOW] = 60;
	HitChance[NPC_TALENT_CROSSBOW] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShamCm",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

