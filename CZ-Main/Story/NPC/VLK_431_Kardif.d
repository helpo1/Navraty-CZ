
instance VLK_431_Kardif(Npc_Default)
{
	name[0] = "Kardif";
	guild = GIL_VLK;
	id = 431;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_meatknife);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart04,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_431;
};


func void Rtn_Start_431()
{
	TA_Stand_Sweeping(8,0,11,0,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
	TA_Stand_ArmsCrossed(11,0,13,0,"NW_CITY_KARDIF");
	TA_Cook_Stove(13,0,16,0,"NW_CITY_HABOUR_TAVERN01_09_COOK");
	TA_Stand_Sweeping(16,0,20,0,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_CITY_KARDIF");
};

