
instance NOV_602_Ulf(Npc_Default)
{
	name[0] = "Ульф";
	guild = GIL_NOV;
	id = 602;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Nov_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak05,BodyTex_N,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_602;
};


func void Rtn_Start_602()
{
	TA_Stand_Drinking(8,0,20,0,"NW_CITY_BEER_04");
	TA_Stand_Drinking(20,0,8,0,"NW_CITY_BEER_04");
};

func void Rtn_Suche_602()
{
	TA_Stand_Guarding(8,0,20,0,"NW_TROLLAREA_PATH_42");
	TA_Stand_Guarding(20,0,8,0,"NW_TROLLAREA_PATH_42");
};

func void Rtn_Wait_602()
{
	TA_Stand_Guarding(8,0,20,0,"NW_TROLLAREA_PATH_22");
	TA_Stand_Guarding(20,0,8,0,"NW_TROLLAREA_PATH_22");
};

func void Rtn_Follow_602()
{
	TA_Follow_Player(8,0,20,0,"NW_TROLLAREA_PATH_13");
	TA_Follow_Player(20,0,8,0,"NW_TROLLAREA_PATH_13");
};

func void rtn_taverne_602()
{
	TA_Sit_Bench(8,0,23,0,"NW_TAVERNE_GREGSBENCH");
	TA_Sit_Bench(23,0,8,0,"NW_TAVERNE_GREGSBENCH");
};

func void rtn_tavernedrink_602()
{
	TA_Stand_Drinking(8,0,14,0,"NW_TAVERNE_RUKHAR");
	TA_Sit_Bench(14,0,16,0,"NW_TAVERNE_GREGSBENCH");
	TA_Stand_Drinking(14,0,23,0,"NW_TAVERNE_RUKHAR");
	TA_Sit_Bench(23,0,8,0,"NW_TAVERNE_GREGSBENCH");
};

func void rtn_guard_602()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_MILTEN");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_MILTEN");
};

