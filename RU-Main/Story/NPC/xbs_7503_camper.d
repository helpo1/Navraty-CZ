
instance XBS_7503_CAMPER(Npc_Default)
{
	name[0] = "Страж";
	guild = GIL_OUT;
	id = 7503;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_XBSAMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Zweihaender2);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Joint,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal14,BodyTex_N,itar_tpl_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_7503;
};


func void rtn_start_7503()
{
	TA_Sleep(4,0,12,0,"WP_COAST_BASE_14");
	TA_Stand_Eating(12,0,13,0,"WP_COAST_BASE_20");
	TA_Stand_Guarding(13,0,21,0,"WP_COAST_BASE_18");
	TA_Sit_Campfire(21,0,23,0,"WP_COAST_BASE_20");
	TA_Smoke_Joint(23,0,4,0,"WP_COAST_BASE_10");
};

