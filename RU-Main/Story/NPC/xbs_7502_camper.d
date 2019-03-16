
instance XBS_7502_CAMPER(Npc_Default)
{
	name[0] = "Страж";
	guild = GIL_OUT;
	id = 7502;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_XBSAMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Zweihaender2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal01,BodyTex_P,itar_tpl_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_7502;
};


func void rtn_start_7502()
{
	TA_Stand_ArmsCrossed(4,55,5,0,"WP_COAST_FOREST_59");
	TA_Stand_Guarding(5,0,13,0,"WP_COAST_BASE_18");
	TA_Stand_Eating(13,0,14,0,"WP_COAST_BASE_20");
	TA_Stand_Guarding(14,0,19,0,"WP_COAST_BASE_10");
	TA_Play_Lute(19,0,21,0,"WP_COAST_BASE_20");
	TA_Sleep(21,0,4,55,"WP_COAST_BASE_14");
};

