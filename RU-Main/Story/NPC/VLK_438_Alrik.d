
instance VLK_438_Alrik(Npc_Default)
{
	name[0] = "Альрик";
	guild = GIL_NONE;
	id = 438;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_MM_FollowTime] = 1000;
	aivar[AIV_FightDistCancel] = 600;
	aivar[AIV_MaxDistToWp] = 300;
	aivar[AIV_OriginalFightTactic] = FAI_HUMAN_NORMAL;
	attribute[ATR_REGENERATEMANA] = 150;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	EquipItem(self,ItAr_Shield_01_Alrik);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Bloodwyn,BodyTex_N,ITAR_ADVENTURE);
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_438;
};

func void Rtn_Start_438()
{
	TA_Stand_Guarding(10,55,19,15,"NW_CITY_PATH_HABOUR_16_01");
	TA_Stand_Drinking(19,15,3,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sit_Bench(3,30,10,55,"NW_CITY_PATH_HABOUR_16_01");
};

func void rtn_walk_438()
{
	TA_Sit_Bench(8,0,12,10,"NW_CITY_PATH_HABOUR_16_01");
	TA_Stand_Eating(12,10,13,40,"NW_CITY_MERCHANT_TRADE_04");
	TA_Sit_Bench(13,40,15,30,"NW_CITY_PATH_HABOUR_16_01");
	TA_Sit_Bench(15,30,19,15,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Stand_Drinking(19,15,23,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sleep(23,30,8,0,"NW_CITY_HABOUR_POOR_AREA_HUT_06_BED_01");
};

func void rtn_walkone_438()
{
	TA_Sit_Bench(9,0,12,10,"NW_CITY_PATH_HABOUR_16_01");
	TA_Stand_Eating(12,10,13,40,"NW_CITY_MERCHANT_TRADE_04");
	TA_Sit_Bench(13,40,15,30,"NW_CITY_PATH_HABOUR_16_01");
	TA_Sit_Bench(15,30,19,15,"NW_CITY_HABOUR_POOR_AREA_HUT_03_B");
	TA_Stand_Drinking(19,15,3,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sleep(3,30,9,0,"NW_CITY_HABOUR_POOR_AREA_HUT_06_BED_02");
};

func void rtn_intower_438()
{
	TA_Practice_Sword(8,0,10,0,"X_MC");
	TA_Stand_Eating(10,0,12,0,"NW_CASTLEMINE_HUT_10");
	TA_Stand_Guarding(12,0,16,0,"NW_CASTLEMINE_TOWER_BEYOND");
	TA_Smith_Sharp(16,0,20,0,"NW_CASTLEMINE_TOWER_REP_HUT_SMITH_02");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_CASTLEMINE_HUT_10");
};