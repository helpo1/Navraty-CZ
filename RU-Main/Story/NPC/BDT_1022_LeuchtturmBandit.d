
instance BDT_1022_LeuchtturmBandit(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1022;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	attribute[ATR_REGENERATEMANA] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItAr_Shield_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_NormalBart04,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	start_aistate = ZS_Bandit;
};

