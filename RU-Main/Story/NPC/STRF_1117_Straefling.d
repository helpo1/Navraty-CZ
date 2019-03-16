
instance STRF_1117_Straefling(Npc_Default)
{
	name[0] = NAME_Straefling;
	guild = GIL_STRF;
	id = 1117;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal17,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_1117;
};


func void Rtn_Start_1117()
{
	TA_Sit_Campfire(2,5,5,30,"OW_PAL_WESTMINE_SIT");
	TA_Pick_Ore(5,30,23,0,"OW_MINE2_STRF");
	TA_Pick_Ore(23,0,2,50,"OW_MINE2_STRF");
};

func void rtn_followme_1117()
{
	TA_Follow_Player(5,0,20,0,"OW_PAL_WESTMINE_SIT");
	TA_Follow_Player(20,0,5,0,"OW_PAL_WESTMINE_SIT");
};

func void rtn_nearpassow_1117()
{
	TA_Stand_WP(5,0,20,0,"OW_PATH_1_17");
	TA_Stand_WP(20,0,5,0,"OW_PATH_1_17");
};

func void rtn_tot_1117()
{
	TA_Sleep(8,0,20,0,"TOT");
	TA_Sleep(20,0,8,0,"TOT");
};