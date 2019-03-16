
instance BDT_1097_Addon_Fisk(Npc_Default)
{
	name[0] = "Фиск";
	guild = GIL_BDT;
	id = 1097;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Cavalorn,BodyTex_B,ITAR_Diego);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_PreStart_1097;
};


func void Rtn_PreStart_1097()
{
	TA_Stand_WP(8,0,20,0,"BL_MID_05");
	TA_Stand_WP(20,0,8,0,"BL_MID_05");
};

func void Rtn_Start_1097()
{
	TA_Stand_Guarding(8,0,20,0,"BL_MERCHANT_01");
	TA_Stand_Guarding(20,0,8,0,"BL_MERCHANT_01");
};

func void Rtn_Meeting_1097()
{
	TA_Stand_Guarding(8,0,20,0,"BL_INN_UP_06");
	TA_Stand_Guarding(20,0,8,0,"BL_INN_UP_06");
};

func void Rtn_Ambush_1097()
{
	TA_Stand_WP(8,0,20,0,"BL_INN_07");
	TA_Stand_WP(20,0,8,0,"BL_INN_07");
};

func void rtn_orcinvasion_1097()
{
	TA_Stand_WP(8,25,21,35,"ADW_PIRATECAMP_CAVE3_91");
	TA_Stand_Eating(21,35,8,25,"ADW_PIRATECAMP_CAVE3_91");
};

func void rtn_tot_1097()
{
	TA_Sleep(8,0,20,0,"TOT");
	TA_Sleep(20,0,8,0,"TOT");
};

instance NONE_1801_Fingers(Npc_Default)
{
	name[0] = "Фингерс";
	guild = GIL_NONE;
	id = 1801;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_ChiefRapier_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Fingers,BodyTex_N,ITAR_Diego);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_PreStart_1801;
};

func void Rtn_PreStart_1801()
{
	TA_Cook_Campfire(8,0,23,0,"WIL_STRAND_03");
	TA_Sit_Campfire(23,0,8,0,"WIL_STRAND_03");
};

func void Rtn_Fort_1801()
{
	TA_Sit_Bench(8,25,21,35,"FT_FINGERS_01");
	TA_Stand_Eating(21,35,8,25,"FT_FINGERS_02");
};