
instance VLK_6037_BUERGER(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 6037;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_MM_RestStart] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal14,BodyTex_N,ITAR_Bau_M_Ext);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6037;
};


func void rtn_start_6037()
{
	TA_Stand_Guarding(8,0,20,0,"OCR_CROWD_10");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_10");
};

