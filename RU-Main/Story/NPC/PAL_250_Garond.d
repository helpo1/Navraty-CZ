
instance PAL_250_Garond(Npc_Default)
{
	name[0] = "Лорд Гаронд";
	guild = GIL_PAL;
	id = 250;
	voice = 10;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	aivar[93] = TRUE;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Raven,BodyTex_N,ITAR_PAL_H_V2_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_PreStart_250;
};


func void Rtn_PreStart_250()
{
	TA_Sit_Baron(8,0,21,0,"OC_EBR_HALL_THRONE");
	TA_Sit_Baron(21,0,8,0,"OC_EBR_HALL_THRONE");
};

func void Rtn_Start_250()
{
	TA_Sit_Baron(8,0,21,0,"OC_EBR_HALL_THRONE");
	TA_Sit_Baron(21,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_cage_250()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PRISON_CELL_04");
	TA_Stand_Guarding(23,0,8,0,"OC_PRISON_CELL_04");
};

func void rtn_cagefree_250()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PRISON_IN_01");
	TA_Stand_Guarding(23,0,8,0,"OC_PRISON_IN_01");
};

func void rtn_follow_250()
{
	TA_Follow_Player(8,0,22,0,"OW_PATH_1_17");
	TA_Follow_Player(22,0,8,0,"OW_PATH_1_17");
};

func void rtn_palexit_250()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_16");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_16");
};

func void rtn_tot_250()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

