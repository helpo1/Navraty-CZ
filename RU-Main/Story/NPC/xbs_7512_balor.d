
instance XBS_7512_BALOR(Npc_Default)
{
	name[0] = "Послушник";
	guild = GIL_OUT;
	id = 7512;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_XBSAMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Cipher_neu,BodyTex_P,ITAR_Lester);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_7512;
};


func void rtn_start_7512()
{
	TA_Stand_Eating(10,0,10,8,"WP_COAST_FOREST_45");
	TA_Stand_Drinking(10,8,10,15,"WP_COAST_FOREST_42");
	TA_Stand_Eating(10,15,11,27,"WP_COAST_FOREST_52");
	TA_Stand_Drinking(10,27,10,38,"WP_COAST_FOREST_56");
	TA_Sit_Bench(10,38,11,30,"WP_COAST_BASE_40");
	TA_Roast_Scavenger(11,30,13,30,"WP_COAST_BASE_BARBQ");
	TA_Potion_Alchemy(13,30,16,20,"WP_COAST_BASE_37");
	TA_Sit_Bench(16,20,19,52,"WP_COAST_BASE_40");
	TA_Smalltalk(19,52,21,0,"WP_COAST_BASE_21");
	TA_Sit_Bench(21,0,22,22,"WP_COAST_BASE_40");
	TA_Stand_Eating(22,22,22,33,"WP_COAST_FOREST_56");
	TA_Stand_Drinking(22,33,22,45,"WP_COAST_FOREST_52");
	TA_Stand_Eating(22,45,22,52,"WP_COAST_FOREST_42");
	TA_Stand_Drinking(22,52,23,0,"WP_COAST_FOREST_45");
	TA_Smalltalk(23,0,10,0,"WP_COAST_CAMP_02");
};

