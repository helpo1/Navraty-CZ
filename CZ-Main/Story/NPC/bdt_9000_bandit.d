
instance BDT_9000_BANDIT(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_VLK;
	id = 9000;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Cipher_neu,BodyTex_N,ItAr_BDT_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_9000;
};


func void rtn_start_9000()
{
	TA_Smalltalk(8,0,23,0,"NW_BENCHELBANDITS_02");
	TA_Smalltalk(23,0,8,0,"NW_BENCHELBANDITS_02");
};

