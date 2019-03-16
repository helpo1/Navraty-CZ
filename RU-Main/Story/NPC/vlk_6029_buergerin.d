
instance VLK_6029_BUERGERIN(Npc_Default)
{
	name[0] = NAME_Buergerin;
	guild = GIL_VLK;
	id = 6029;
	voice = 17;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",FaceBabe_N_Anne,BodyTex_N,ITAR_VlkBabe_L);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6029;
};


func void rtn_start_6029()
{
	TA_Stand_Eating(8,0,20,0,"OCR_CROWD_02");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_02");
};

func void rtn_tot_6029()
{
	TA_Sit_Bench(8,0,20,0,"NW_CITY_MERCHANT_CONCERTPUB_02");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_02");
};

