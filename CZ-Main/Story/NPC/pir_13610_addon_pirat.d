
instance PIR_13610_ADDON_PIRAT(Npc_Default)
{
	name[0] = NAME_Addon_Pirat;
	guild = GIL_PAL;
	id = 13610;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Addon_PIR2hAxe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_ToughBart01,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_13610;
};


func void rtn_start_13610()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_10");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_10");
};

func void rtn_inbattle_13610()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8710");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8710");
};

func void rtn_ship_13610()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_CREW_01");
	TA_Stand_Guarding(23,0,8,0,"SHIP_CREW_01");
};

