
instance VLK_6031_BUERGERIN(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 6031;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",FaceBabe_N_VlkBlonde,BodyTex_N,ITAR_VlkBabe_M);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = rtn_start_6031;
};


func void rtn_start_6031()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"OCR_CROWD_04");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_04");
};

func void rtn_tot_6031()
{
	TA_Sit_Bench(8,0,20,0,"NW_CITY_MERCHANT_CONCERTPUB_04");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_04");
};

