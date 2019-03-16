
instance BDT_6122_NIGELBAND_02(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6122;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Nagelkeule2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ToughBart01,BodyTex_N,ItAr_BDT_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_6122;
};


func void rtn_start_6122()
{
	TA_Sit_Campfire(0,0,12,0,"NW_CITY_TO_FOREST_04_09");
	TA_Sit_Campfire(12,0,0,0,"NW_CITY_TO_FOREST_04_09");
};

