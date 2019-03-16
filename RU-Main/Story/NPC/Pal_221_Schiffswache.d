
instance Pal_221_Schiffswache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 221;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart06,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_221;
};


func void Rtn_Start_221()
{
	TA_Stand_Plaz(7,0,9,0,"PLAZ_08");
	TA_Stand_Guarding(9,0,18,0,"SHIP");
	TA_Stand_Plaz(18,0,20,0,"PLAZ_08");
	TA_Stand_Guarding(20,0,7,0,"SHIP");
};

func void Rtn_ShipFree_221()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_02");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_02");
};

func void rtn_tot_221()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

