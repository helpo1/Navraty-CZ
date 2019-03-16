
instance VLK_6133_MAXI(Npc_Default)
{
	name[0] = "Maxi";
	guild = GIL_VLK;
	id = 6133;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Gold,35);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Drax,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_6133;
};


func void rtn_start_6133()
{
	TA_Stand_Eating(8,0,20,0,"NW_LUTEROHELPER_02");
	TA_Smoke_Joint(20,0,8,0,"NW_CITY_RAUCH_01");
};

func void rtn_follow_6133()
{
	TA_Follow_Player(8,0,22,0,"NW_CITY_LUTERO");
	TA_Follow_Player(22,0,8,0,"NW_CITY_LUTERO");
};

func void rtn_workagain_6133()
{
	TA_Read_Bookstand(8,0,20,0,"NW_VALERAN_01");
	TA_Sit_Bench(20,0,8,0,"NW_VALERAN_02");
};

