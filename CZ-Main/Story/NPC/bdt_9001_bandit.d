
instance BDT_9001_BANDIT(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_VLK;
	id = 9001;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough02,BodyTex_L,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_9001;
};


func void rtn_start_9001()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_BENCHELBANDITS_03");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_BENCHELBANDITS_03");
};

