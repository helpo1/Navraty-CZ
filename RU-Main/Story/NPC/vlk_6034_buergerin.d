
instance VLK_6034_BUERGERIN(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 6034;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",FaceBabe_N_HairAndCloth,BodyTex_N,ITAR_BauBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6034;
};


func void rtn_start_6034()
{
	TA_Smoke_Joint(8,0,20,0,"OCR_CROWD_07");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_07");
};

func void rtn_tot_6034()
{
	TA_Sit_Bench(8,0,20,0,"NW_CITY_MERCHANT_CONCERTPUB_07");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_07");
};

