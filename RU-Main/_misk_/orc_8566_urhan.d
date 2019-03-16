
instance ORC_8566_URHAN(C_Npc)
{
	name[0] = "Хаг-Тар";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCELITE;
	voice = 18;
	id = 8566;
	level = 75;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 300;
	protection[PROT_POINT] = 300;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 50;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 100;
	HitChance[NPC_TALENT_CROSSBOW] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ELITEORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	EquipItem(self,itmw_2h_orcsword_04);
	start_aistate = ZS_MM_AllScheduler;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyElit4",DEFAULT,DEFAULT,"Orc_HeadWarrior",3,DEFAULT,-1);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	CreateInvItems(self,ItKe_PrisonKey_MIS,1);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};


func void rtn_urhangobattle_8566()
{
	ta_orc_stand_drinking(8,0,22,0,"URHAN_CHALANGE");
	ta_orc_stand_drinking(22,0,8,0,"URHAN_CHALANGE");
};

func void rtn_urhangoback_8566()
{
	ta_orc_stand_drinking(8,0,22,0,"OC_EBR_STAND_THRONE_HAGTAR");
	ta_orc_stand_drinking(22,0,8,0,"OC_EBR_STAND_THRONE_HAGTAR");
};

