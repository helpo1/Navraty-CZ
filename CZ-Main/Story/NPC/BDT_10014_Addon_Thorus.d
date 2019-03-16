
instance BDT_10014_Addon_Thorus(Npc_Default)
{
	name[0] = "Thorus";
	guild = GIL_BDT;
	id = 10014;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_MM_RestEnd] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Zweihaender3);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ITKE_Addon_Thorus,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Thorus,BodyTex_B,itar_thorus_addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_PReStart_10014;
};

func void Rtn_PReStart_10014()
{
	TA_Stand_Guarding(0,0,12,0,"BL_STAIRS_03");
	TA_Stand_Guarding(12,0,0,0,"BL_STAIRS_03");
};

func void Rtn_Start_10014()
{
	TA_Read_Bookstand(0,0,12,0,"BL_BLOODWYN_BOOK");
	TA_Stand_Guarding(12,0,20,0,"BL_BLOODWYN_04");
	TA_Stand_Guarding(20,0,0,0,"BL_STAIRS_03");
};

func void Rtn_TALK_10014()
{
	TA_Stand_WP(0,0,12,0,"BL_UP_PLACE_03");
	TA_Stand_WP(12,0,0,0,"BL_UP_PLACE_03");
};

func void rtn_orcinvasion_10014()
{
	TA_Practice_Sword(8,25,21,35,"ADW_PIRATECAMP_CAVE3_01");
	TA_Stand_Guarding(21,35,8,25,"ADW_PIRATECAMP_CAVE3_01");
};

func void rtn_tot_10014()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

