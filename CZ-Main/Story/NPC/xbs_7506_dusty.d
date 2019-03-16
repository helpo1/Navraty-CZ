
instance XBS_7506_DUSTY(Npc_Default)
{
	name[0] = "Dusty";
	guild = GIL_OUT;
	id = 7506;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_XBSMAIN;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_ShortSword5);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Dusty,BodyTex_P,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = rtn_start_7506;
};


func void rtn_start_7506()
{
	TA_Sit_Campfire(8,0,10,0,"WP_COAST_BASE_20");
	TA_Stand_ArmsCrossed(10,0,14,30,"WP_COAST_BASE_04");
	TA_Smalltalk(14,30,17,0,"WP_COAST_BASE_21");
	TA_Sit_Campfire(17,0,8,0,"WP_COAST_BASE_20");
};

