
instance Mil_304_Torwache(Npc_Default)
{
	name[0] = NAME_Torwache;
	guild = GIL_MIL;
	id = 304;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,ItAr_MIL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_304;
};


func void Rtn_Start_304()
{
	TA_Stand_ArmsCrossed(3,0,21,0,"NW_CITY_UPTOWN_GUARD_01_80");
	TA_WacheFackel(21,0,3,0,"NW_CITY_UPTOWN_GUARD_01_80");
};

