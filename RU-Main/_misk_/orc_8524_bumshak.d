
instance ORC_8524_BUMSHAK(C_Npc)
{
	name[0] = "Таррок";
	guild = GIL_FRIENDLY_ORC;
	id = 8524;
	voice = 18;
	level = 10;
	flags = NPC_FLAG_IMMORTAL;
	aivar[AIV_MM_REAL_ID] = ID_ORCWARRIOR;
	npcType = npctype_main;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 20;
	HitChance[NPC_TALENT_1H] = 60;
	HitChance[NPC_TALENT_2H] = 60;
	HitChance[NPC_TALENT_BOW] = 60;
	HitChance[NPC_TALENT_CROSSBOW] = 60;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaBdt",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
	EquipItem(self,ItMw_2H_OrcAxe_03);
	CreateInvItems(self,ItPl_Health_Herb_01,2);
	CreateInvItems(self,ItPo_Health_02,5);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

