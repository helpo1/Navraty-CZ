
instance VLK_420_Coragon(Npc_Default)
{
	name[0] = "Coragon";
	guild = GIL_VLK;
	id = 420;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetFightSkills(self,40);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_meatknife);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald.",Face_N_Normal_Blade,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_SetAttributesToChapter(self,3);
	B_GiveNpcTalents(self);
	daily_routine = Rtn_Start_420;
};

func void Rtn_Start_420()
{
	TA_Stand_Sweeping(5,0,9,0,"NW_CITY_MERCHANT_TAVERN01_IN");
	TA_Cook_Stove(9,0,12,0,"TAVERN02");
	TA_Sit_Bench(12,0,18,0,"NW_CITY_MERCHANT_CONCERTPUB_04");
	TA_Stand_ArmsCrossed(18,0,5,0,"NW_CITY_TAVERN_IN_03");
};

