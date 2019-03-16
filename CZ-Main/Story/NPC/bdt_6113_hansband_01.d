
instance BDT_6113_HANSBAND_01(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6113;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_N_NormalBart12,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_6113;
};


func void rtn_start_6113()
{
	TA_Sit_Bench(0,0,12,0,"NW_BDT_HANS_01_S");
	TA_Sit_Bench(12,0,0,0,"NW_BDT_HANS_01_S");
};

