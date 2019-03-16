
instance Pal_222_Schiffswache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 222;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart09,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_222;
};


func void Rtn_Start_222()
{
	TA_Stand_Plaz(7,0,9,0,"PLAZ_05");
	TA_Stand_Guarding(9,0,18,0,"SHIP_DECK_26");
	TA_Stand_Plaz(18,0,20,0,"PLAZ_05");
	TA_Sleep(20,0,7,0,"SHIP_IN_04");
};

func void Rtn_ShipFree_222()
{
	TA_Stand_WP(8,0,23,0,"NW_CITY_UPTOWNPARADE_03");
	TA_Stand_WP(23,0,8,0,"NW_CITY_UPTOWNPARADE_03");
};

func void rtn_tot_222()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

