
instance BDT_9002_BANDIT(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_VLK;
	id = 9002;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Homer,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_9002;
};


func void rtn_start_9002()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_BENCHELBANDITS_04");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_BENCHELBANDITS_04");
};

