
instance SLD_6147_SOELDNER(Npc_Default)
{
	name[0] = "Onarův osobní strážce";
	guild = GIL_SLD;
	id = 6147;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Tough_Silas,BodyTex_B,ItAr_Sld_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_6147;
};


func void rtn_start_6147()
{
	TA_Stand_Guarding(9,3,21,5,"NW_BIGFARM_HOUSE_ONARGUARD_02");
	TA_Stand_ArmsCrossed(21,5,9,3,"NW_BIGFARM_HOUSE_ONARGUARD_04");
};

func void rtn_comedeath_6147()
{
	TA_Stand_Guarding(9,0,21,0,"NW_BIGFARM_PATH_04");
	TA_Stand_Guarding(21,0,9,0,"NW_BIGFARM_PATH_04");
};

