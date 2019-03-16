
instance VLK_418_Gritta(Npc_Default)
{
	name[0] = "Gritta";
	guild = GIL_VLK;
	id = 418;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,ItMi_Gold,100);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe0",FaceBabe_N_YoungBlonde,BodyTex_N,ITAR_VlkBabe_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_418;
};


func void Rtn_Start_418()
{
	TA_Stand_Sweeping(8,0,12,0,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Cook_Stove(12,0,14,0,"NW_CITY_BED_BOSPER_B");
	TA_Stand_Sweeping(14,0,18,0,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Cook_Stove(18,0,20,0,"NW_CITY_BED_BOSPER_B");
	TA_Read_Bookstand(20,0,23,0,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Sleep(23,0,8,0,"NW_CITY_BED_BOSPER_B");
};

func void rtn_tot_418()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_missgr_418()
{
	TA_Sit_Campfire(8,0,20,0,"NW_CITY_GRITTA_MISS_01");
	TA_Sit_Campfire(20,0,8,0,"NW_CITY_GRITTA_MISS_01");
};

func void rtn_follow_418()
{
	TA_Follow_Player(8,0,20,0,"NW_CITY_GRITTA_MISS_01");
	TA_Follow_Player(20,0,8,0,"NW_CITY_GRITTA_MISS_01");
};

func void rtn_gomarry_418()
{
	TA_Smalltalk(8,0,18,0,"NW_CITY_GRITTA_GOMARRY_01");
	TA_Smalltalk(18,0,8,0,"NW_CITY_GRITTA_GOMARRY_01");
};

