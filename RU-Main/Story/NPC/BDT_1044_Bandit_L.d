
instance BDT_1044_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1044;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	attribute[ATR_REGENERATEMANA] = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItAr_Shield_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	daily_routine = Rtn_Start_1044;
};


func void Rtn_Start_1044()
{
	TA_Smalltalk(0,0,12,0,"NW_CASTLEMINE_TOWER_STAND_02");
	TA_Smalltalk(12,0,0,0,"NW_CASTLEMINE_TOWER_STAND_02");
};

