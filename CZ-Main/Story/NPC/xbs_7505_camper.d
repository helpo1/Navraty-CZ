
instance XBS_7505_CAMPER(Npc_Default)
{
	name[0] = "Stráž";
	guild = GIL_OUT;
	id = 7505;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_XBSAMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Ricelord,BodyTex_P,itar_tpl_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_7505;
};


func void rtn_start_7505()
{
	TA_Stand_Eating(8,0,9,0,"WP_COAST_BASE_20");
	TA_Sit_Bench(9,0,11,15,"WP_COAST_BASE_02");
	TA_Smalltalk(11,15,12,5,"WP_COAST_BASE_21");
	TA_Sit_Chair(12,5,14,30,"WP_COAST_BASE_24");
	TA_Smalltalk(14,30,17,0,"WP_COAST_BASE_21");
	TA_Roast_Scavenger(17,0,23,20,"WP_COAST_BASE_BARBQ");
	TA_Sleep(23,20,8,0,"WP_COAST_BASE_15");
};

