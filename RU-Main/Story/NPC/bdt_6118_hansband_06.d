
instance BDT_6118_HANSBAND_06(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6118;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	attribute[ATR_REGENERATEMANA] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItAr_Shield_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal20,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	daily_routine = rtn_start_6118;
};


func void rtn_start_6118()
{
	TA_Stand_Drinking(0,0,12,0,"NW_BDT_HANS_06_S");
	TA_Stand_Drinking(12,0,0,0,"NW_BDT_HANS_06_S");
};

