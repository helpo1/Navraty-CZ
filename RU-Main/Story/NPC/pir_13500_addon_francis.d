
instance PIR_13500_ADDON_FRANCIS(Npc_Default)
{
	name[0] = "Фрэнсис";
	guild = GIL_PAL;
	id = 13500;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Cipher_neu,BodyTex_N,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_13500;
};


func void rtn_start_13500()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_17");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_17");
};

func void rtn_inbattle_13500()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8743");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8743");
};

func void rtn_ship_13500()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_05");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_05");
};

