
instance MIL_311_Andre(Npc_Default)
{
	name[0] = "Lord Andre";
	guild = GIL_PAL;
	id = 311;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak12,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_311;
};


func void Rtn_PreStart_311()
{
	TA_Stand_Guarding(0,0,12,0,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
	TA_Stand_Guarding(12,0,0,0,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
};

func void Rtn_Start_311()
{
	TA_Read_WriteBookstand(10,0,19,10,"NW_CITY_ANDRE");
	TA_Smalltalk(19,0,21,0,"NW_CITY_ANDRE_SMALLTALK");
	TA_Sit_Throne(21,0,10,0,"NW_CITYHALL_PRIVATE_THRONE");
};

func void rtn_tot_311()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_campon_311()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_SOVET_ANDRE");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_68");
};

func void rtn_inbattle_311()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8739");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8739");
};

func void rtn_fleefrombattle_311()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};