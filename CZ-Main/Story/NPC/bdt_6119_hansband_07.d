
instance BDT_6119_HANSBAND_07(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6119;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Schwert2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Normal01,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,85);
	daily_routine = rtn_start_6119;
};


func void rtn_start_6119()
{
	TA_Stand_Drinking(0,0,12,0,"NW_BDT_HANS_07_S");
	TA_Stand_Drinking(12,0,0,0,"NW_BDT_HANS_07_S");
};

