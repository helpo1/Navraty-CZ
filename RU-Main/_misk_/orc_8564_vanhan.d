
instance ORC_8564_VANHAN(C_Npc)
{
	name[0] = "Призрак орка-шамана";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	voice = 18;
	id = 8564;
	level = 150;
	flags = ORCTEMPLENPCFLAGS;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 3000;
	attribute[ATR_HITPOINTS] = 3000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 100;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	EquipItem(self,itmw_orcstaff);
	CreateInvItems(self,itke_orcshaman_shv,1);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS_MINE;
	start_aistate = ZS_MM_AllScheduler;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShamEl",DEFAULT,DEFAULT,"Orc_HeadShaman",1,DEFAULT,-1);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
};


func void rtn_tot_8564()
{
	TA_Stand_WP(8,0,22,0,"TOT");
	TA_Stand_WP(22,0,8,0,"TOT");
};

