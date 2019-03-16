
instance BDT_6140_GRITTASHUNT0(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6140;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Cipher_neu,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_6140;
};


func void rtn_start_6140()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_FARM1_CITYWALL_FOREST_15");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_FARM1_CITYWALL_FOREST_15");
};

