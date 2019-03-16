
instance VLK_421_Valentino(Npc_Default)
{
	name[0] = "Valentino";
	guild = GIL_NONE;
	id = 421;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Mace);
	CreateInvItems(self,ItMi_Gold,200);
	CreateInvItems(self,ItKe_Valentino,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald.",Face_N_Normal03,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_421;
};

func void Rtn_Start_421()
{
	TA_Stand_ArmsCrossed(10,0,20,0,"NW_CITY_MERCHANT_PATH_16");
	TA_Sit_Chair(20,0,4,0,"NW_CITY_MERCHANT_TAVERN01_BACKROOM");
	TA_Sleep(4,0,10,0,"NW_CITY_REICH03_BED_01");
};

func void rtn_follow_421()
{
	TA_Follow_Player(8,0,22,0,"NW_PSICAMP_PARVEZ");
	TA_Follow_Player(22,0,8,0,"NW_PSICAMP_PARVEZ");
};

func void rtn_joinpsicamp_421()
{
	TA_Smoke_Waterpipe(8,0,19,0,"NW_CITY_RAUCH_05");
	TA_Cook_Stove(19,0,21,0,"NW_CITY_REICH03_COOK");
	TA_Sleep(21,0,8,0,"NW_CITY_REICH03_BED_01");
};

func void Rtn_VatrasAway_421()
{
	TA_Smalltalk(10,0,20,0,"NW_CITY_MERCHANT_TAVERN01_01");
	TA_Sit_Chair(20,0,4,0,"NW_CITY_MERCHANT_TAVERN01_BACKROOM");
	TA_Sleep(4,0,10,0,"NW_CITY_REICH03_BED_01");
};

func void rtn_PsiCamp_421()
{
	TA_Smalltalk(10,0,20,0,"NW_PSICAMP_18");
	TA_Smoke_Joint(20,0,10,0,"NW_PSICAMP_18");
};