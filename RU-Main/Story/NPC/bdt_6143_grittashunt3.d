
instance BDT_6143_GRITTASHUNT3(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 6143;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_Schiffsaxt);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal02,BodyTex_P,ItAr_BDT_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_6143;
};


func void rtn_start_6143()
{
	TA_Stand_Eating(8,0,23,0,"NW_CITY_GRITTA_MISS_HUNT_04");
	TA_Stand_Eating(23,0,8,0,"NW_CITY_GRITTA_MISS_HUNT_04");
};

