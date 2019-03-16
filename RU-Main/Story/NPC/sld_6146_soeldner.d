
instance SLD_6146_SOELDNER(Npc_Default)
{
	name[0] = "Телохранитель Онара";
	guild = GIL_SLD;
	id = 6146;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Tough_Drago,BodyTex_P,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_6146;
};


func void rtn_start_6146()
{
	TA_Stand_ArmsCrossed(9,2,21,5,"NW_BIGFARM_HOUSE_ONARGUARD_01");
	TA_Stand_Guarding(21,5,9,2,"NW_BIGFARM_HOUSE_ONARGUARD_03");
};

func void rtn_comedeath_6146()
{
	TA_Stand_Guarding(9,0,21,0,"NW_BIGFARM_PATH_04");
	TA_Stand_Guarding(21,0,9,0,"NW_BIGFARM_PATH_04");
};

