
instance VLK_6033_BUERGER(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 6033;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	aivar[AIV_MM_RestStart] = TRUE;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_NormalBart06,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6033;
};


func void rtn_start_6033()
{
	TA_Smoke_Joint(8,0,20,0,"OCR_CROWD_05");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_06");
};

func void rtn_tot_6033()
{
	TA_Sit_Bench(8,0,20,0,"NW_CITY_MERCHANT_CONCERTPUB_06");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_06");
};

