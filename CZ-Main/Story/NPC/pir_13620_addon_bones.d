
instance PIR_13620_ADDON_BONES(Npc_Default)
{
	name[0] = "Bones";
	guild = GIL_PAL;
	id = 13620;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Addon_PIR2hAxe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart10,BodyTex_N,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1.3);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_13620;
};


func void rtn_start_13620()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_09");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_09");
};

func void rtn_inbattle_13620()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8709");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8709");
};

func void rtn_ship_13620()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_17");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_17");
};

