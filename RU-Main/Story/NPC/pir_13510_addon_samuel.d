
instance PIR_13510_ADDON_SAMUEL(Npc_Default)
{
	name[0] = "Сэмюэль";
	guild = GIL_PAL;
	id = 13510;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Piratensaebel);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBAld",Face_B_Saturas,BodyTex_B,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_13510;
};


func void rtn_start_13510()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_16");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_16");
};

func void rtn_inbattle_13510()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8744");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8744");
};

func void rtn_ship_13510()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP");
	TA_Stand_Guarding(23,0,8,0,"SHIP");
};

