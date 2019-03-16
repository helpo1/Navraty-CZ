
instance PIR_1351_Addon_Samuel(Npc_Default)
{
	name[0] = "Samuel";
	guild = GIL_PIR;
	id = 1351;
	voice = 14;
	flags = FALSE;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Piratensaebel);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBAld",Face_B_Saturas,BodyTex_B,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_1351;
};


func void Rtn_Start_1351()
{
	TA_Potion_Alchemy(6,0,8,0,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking(8,0,10,0,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy(10,0,12,0,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking(12,0,14,0,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy(14,0,16,0,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking(16,0,18,0,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy(18,0,20,0,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking(20,0,22,0,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy(22,0,6,0,"ADW_PIRATECAMP_CAVE1_04");
};

func void rtn_tot_1351()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

