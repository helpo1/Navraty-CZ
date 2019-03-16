
instance BDT_9003_BANDIT(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_VLK;
	id = 9003;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal02,BodyTex_P,itar_bdt_f);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = rtn_start_9003;
};


func void rtn_start_9003()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_BENCHELBANDITS_05");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_BENCHELBANDITS_05");
};

