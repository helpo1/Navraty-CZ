
instance NOV_11113_JADEN(Npc_Default)
{
	name[0] = "Jaden";
	guild = GIL_NOV;
	id = 11113;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal01,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_11113;
};


func void rtn_start_11113()
{
	TA_Stand_Sweeping(8,0,12,0,"NW_MONASTERY_CELLAR_08");
	TA_Stand_Sweeping(12,0,16,0,"NW_MONASTERY_CELLAR_03");
	TA_Stand_Sweeping(16,0,20,0,"NW_MONASTERY_CELLAR_06");
	TA_Sit_Bench(20,0,8,0,"NW_MONASTERY_CHURCH_JER");
};

func void rtn_orcatcbegan_11113()
{
	TA_Stand_Guarding(6,55,20,30,"NW_MONASTERY_CELLAR_10");
	TA_Stand_Guarding(20,30,6,55,"NW_MONASTERY_CELLAR_10");
};

