
instance VLK_498_Ignaz(Npc_Default)
{
	name[0] = "Ignaz";
	guild = GIL_VLK;
	id = 498;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Corristo,BodyTex_N,itar_alchemy);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_498;
};


func void Rtn_Start_498()
{
	TA_Potion_Alchemy(5,0,10,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Read_Bookstand(10,0,14,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Potion_Alchemy(14,0,19,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Read_Bookstand(19,0,23,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Sit_Chair(23,0,0,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	TA_Sleep(0,0,5,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_IN_BED");
};

