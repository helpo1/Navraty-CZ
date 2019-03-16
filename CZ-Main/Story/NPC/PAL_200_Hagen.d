
instance PAL_200_Hagen(Npc_Default)
{
	name[0] = "Lord Hagen";
	guild = GIL_PAL;
	id = 200;
	voice = 4;
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
	EquipItem(self,ItMw_2H_Blessed_03_Hagen);
	CreateInvItems(self,itke_hagen_secretkey,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Tough_Okyl,BodyTex_N,itar_pal_h_v2_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_200;
};


func void Rtn_Start_200()
{
	TA_Stand_ArmsCrossed(8,0,15,0,"NW_CITY_HAGEN");
	TA_Smalltalk(15,0,18,0,"NW_CITY_HAGEN");
	TA_Stand_ArmsCrossed(18,0,20,0,"NW_CITY_HAGEN");
	TA_Sit_Throne(20,0,8,0,"NW_CITYHALL_PRIVATE_THRONE");
};

func void Rtn_ShipFree_200()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_UPTOWNPARADE_HAGEN");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_UPTOWNPARADE_HAGEN");
};

func void rtn_tot_200()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_campon_200()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_SOVET_HAGEN");
	TA_Sit_Throne(23,0,9,0,"NW_BIGFARM_CAMPON_HAGEN");
};

func void rtn_inbattle_200()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HAGEN");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HAGEN");
};

func void rtn_fleefrombattle_200()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

