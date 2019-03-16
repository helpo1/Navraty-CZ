
instance PAL_212_Schiffswache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 212;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_NAILED;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_Scatty,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_212;
};


func void Rtn_Start_212()
{
	TA_Guard_Passage(4,0,21,0,"NW_CITY_SHIP_GUARD_02");
	TA_WacheFackel(21,0,4,0,"NW_CITY_SHIP_GUARD_02");
};

func void Rtn_ShipFree_212()
{
	TA_Smalltalk(8,0,23,0,"NW_CITY_PALCAMP_01");
	TA_Smalltalk(23,0,8,0,"NW_CITY_PALCAMP_01");
};

func void rtn_tot_212()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

