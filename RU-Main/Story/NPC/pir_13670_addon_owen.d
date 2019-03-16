
instance PIR_13670_ADDON_OWEN(Npc_Default)
{
	name[0] = "Оуэн";
	guild = GIL_PAL;
	id = 13670;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Piratensaebel);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1.1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = rtn_start_13670;
};


func void rtn_start_13670()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_04");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_04");
};

func void rtn_inbattle_13670()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8704");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8704");
};

func void rtn_ship_13670()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_28");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_28");
};

