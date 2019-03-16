
instance VLK_433_Bromor(Npc_Default)
{
	name[0] = "Bromor";
	guild = GIL_VLK;
	id = 433;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_Bromor,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Fingers,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,45);
	daily_routine = Rtn_Start_433;
};


func void Rtn_Start_433()
{
	TA_Stand_Sweeping(8,0,13,0,"NW_PUFF_DANCE");
	TA_Stand_Drinking(13,0,16,0,"NW_CITY_TAVERN_IN_02");
	TA_Sit_Bench(16,0,20,0,"NW_CITY_HABOUR_PUFF_ENTRANCE");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_CITY_PUFF_COUNTER");
};

