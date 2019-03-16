
instance XBS_7511_CAMPER(Npc_Default)
{
	name[0] = "Novic";
	guild = GIL_OUT;
	id = 7511;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_XBSAMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart12,BodyTex_N,ITAR_Lester);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_7511;
};


func void rtn_start_7511()
{
	TA_Cook_Cauldron(4,20,10,0,"WP_COAST_BASE_30");
	TA_Roast_Scavenger(10,0,11,0,"WP_COAST_BASE_BARBQ");
	TA_Cook_Cauldron(11,0,14,0,"WP_COAST_BASE_30");
	TA_Roast_Scavenger(14,0,15,0,"WP_COAST_BASE_BARBQ");
	TA_Stand_ArmsCrossed(15,0,17,20,"WP_COAST_BASE_04");
	TA_Cook_Cauldron(17,20,18,20,"WP_COAST_BASE_30");
	TA_Sit_Campfire(18,20,19,55,"WP_COAST_BASE_20");
	TA_Smalltalk(19,55,4,20,"WP_COAST_BASE_21");
};

