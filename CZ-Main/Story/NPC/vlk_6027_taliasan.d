
instance VLK_6027_TALIASAN(Npc_Default)
{
	name[0] = "Gallahad";
	guild = GIL_VLK;
	id = 6027;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,5);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Raven,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_6027;
};


func void rtn_start_6027()
{
	TA_Read_Bookstand(7,0,13,0,"NW_CITY_TALIASAN");
	TA_Read_Bookstand(13,0,7,0,"NW_CITY_TALIASAN");
};

func void rtn_goignaz_6027()
{
	TA_Sit_Chair(10,0,20,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Sit_Chair(20,0,10,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
};

func void rtn_gointownhall_6027()
{
	TA_Read_Bookstand(8,0,14,0,"NW_CITYHALL_OFFICE_02");
	TA_Sit_Bench(14,0,16,0,"NW_CITY_CITYHALL_LARIUS_SIT");
	TA_Read_Bookstand(16,0,19,0,"NW_CITYHALL_OFFICE_02");
	TA_Sit_Chair(19,0,8,0,"NW_CITY_LARIUS");
};


