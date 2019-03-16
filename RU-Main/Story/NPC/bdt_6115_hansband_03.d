
instance BDT_6115_HANSBAND_03(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6115;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Orik,BodyTex_B,ItAr_BDT_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = rtn_start_6115;
};


func void rtn_start_6115()
{
	TA_Smalltalk(0,0,12,0,"NW_BDT_HANS_03_S");
	TA_Smalltalk(12,0,0,0,"NW_BDT_HANS_03_S");
};

