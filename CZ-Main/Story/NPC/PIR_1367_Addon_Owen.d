
instance PIR_1367_Addon_Owen(Npc_Default)
{
	name[0] = "Owen";
	guild = GIL_PIR;
	id = 1367;
	voice = 13;
	flags = FALSE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Piratensaebel);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1.1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_PostStart_1367;
};


func void Rtn_PreStart_1367()
{
	TA_Saw(6,0,10,0,"ADW_PIRATECAMP_WAY_15");
	TA_Sit_Campfire(10,0,14,0,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Saw(14,0,18,0,"ADW_PIRATECAMP_WAY_15");
	TA_Sit_Campfire(18,0,22,0,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Sit_Campfire(22,0,2,0,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Sit_Campfire(2,0,6,0,"ADW_PIRATECAMP_LUMBER_SIT");
};

func void Rtn_Start_1367()
{
	TA_Cook_Campfire(7,0,22,0,"ADW_PIRATECAMP_LUMBERCAMP_04");
	TA_Sit_Campfire(22,0,7,0,"ADW_PIRATECAMP_LUMBERCAMP_04");
};

func void Rtn_PostStart_1367()
{
	TA_Stand_Drinking(7,0,22,0,"ADW_PIRATECAMP_BEACH_25");
	TA_Stand_Drinking(22,0,7,0,"ADW_PIRATECAMP_BEACH_25");
};

func void rtn_tot_1367()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

