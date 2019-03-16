
instance BDT_6114_HANSBAND_02(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6114;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	attribute[ATR_REGENERATEMANA] = 1;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItAr_Shield_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_L_ToughBart_Quentin,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	daily_routine = rtn_start_6114;
};


func void rtn_start_6114()
{
	TA_Smalltalk(0,0,12,0,"NW_BDT_HANS_02_S");
	TA_Smalltalk(12,0,0,0,"NW_BDT_HANS_02_S");
};

