
instance BAU_980_Sagitta(Npc_Default)
{
	name[0] = "Сагитта";
	guild = GIL_BAU;
	id = 980;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,3);
	aivar[AIV_Gender] = FEMALE;
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"SRN_GLM.MDS"); 
	Mdl_SetVisualBody(self,"SRNGLM_BODY_NAKED0",5,0,"SRN_HEAD_HAIR9",8,0,ITAR_BauBabe_L_New); //прототип Sagitta
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_980;
};

func void Rtn_Start_980()
{
	TA_Potion_Alchemy(8,0,23,0,"NW_SAGITTA_CAVE_IN_03");
	TA_Sit_Throne(23,0,8,0,"NW_SAGITTA_CAVE_IN_02");
};

func void rtn_intower_980()
{
	TA_Potion_Alchemy(10,0,13,0,"NW_CASTLEMINE_HUT_10_BX");
	TA_Pick_FP(13,0,16,0,"NW_CASTLEMINE_HUT_01_MONSTER");
	TA_Sit_Throne(16,0,20,0,"NW_CASTLEMINE_HUT_10");
	TA_Read_Bookstand(20,0,23,0,"NW_CASTLEMINE_HUT_03_READBOOK");
	TA_Sleep(23,0,10,0,"NW_CASTLEMINE_HUT_08");
};
