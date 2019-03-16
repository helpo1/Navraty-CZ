
instance SLD_802_Buster(Npc_Default)
{
	name[0] = "Buster";
	guild = GIL_SLD;
	id = 802;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Drax,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_802;
};


func void Rtn_Start_802()
{
	TA_Smalltalk(7,0,21,0,"NW_BIGFARM_HUT_01");
	TA_Sit_Bench(21,0,7,0,"NW_BIGFARM_HUT_BENCH_02");
};

func void rtn_orcatcbegan_802()
{
	TA_Stand_Guarding(6,55,20,30,"NW_BIGFARM_KITCHEN_BUSTER");
	TA_Stand_Guarding(20,30,6,55,"NW_BIGFARM_KITCHEN_BUSTER");
};

func void rtn_inbattle_802()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8663");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8663");
};

