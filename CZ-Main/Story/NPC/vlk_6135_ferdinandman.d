
instance VLK_6135_FERDINANDMAN(Npc_Default)
{
	name[0] = "Kurýr";
	guild = GIL_VLK;
	id = 6135;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,itfo_specwine,2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak12,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6135;
};


func void rtn_start_6135()
{
	TA_Study_WP(8,0,20,0,"NW_FARM1_PATH_CITY_05_B");
	TA_Study_WP(20,0,8,0,"NW_FARM1_PATH_CITY_05_B");
};

