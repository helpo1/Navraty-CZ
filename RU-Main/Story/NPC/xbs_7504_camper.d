
instance XBS_7504_CAMPER(Npc_Default)
{
	name[0] = "Страж";
	guild = GIL_OUT;
	id = 7504;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_XBSAMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Zweihaender2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Gilbert,BodyTex_P,itar_tpl_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_7504;
};


func void rtn_start_7504()
{
	TA_Stand_Eating(3,0,3,40,"WP_COAST_BASE_18");
	TA_Stand_Drinking(3,40,4,0,"WP_COAST_BASE_18");
	TA_Stand_Guarding(4,0,4,33,"WP_COAST_BASE_18");
	TA_Pee(4,33,4,43,"WP_COAST_BASE_26");
	TA_Stand_Guarding(4,43,5,0,"WP_COAST_BASE_18");
	TA_Roast_Scavenger(5,0,6,0,"WP_COAST_BASE_BARBQ");
	TA_Stand_Guarding(6,0,11,0,"WP_COAST_BASE_10");
	TA_Smalltalk(11,0,12,5,"WP_COAST_BASE_21");
	TA_Sleep(12,5,20,5,"WP_COAST_BASE_14");
	TA_Sit_Campfire(20,5,21,0,"WP_COAST_BASE_20");
	TA_Stand_Guarding(21,0,3,0,"WP_COAST_BASE_18");
};

