
instance Sld_810_Dar(Npc_Default)
{
	name[0] = "Дар";
	guild = GIL_SLD;
	id = 810;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,4);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItMi_Joint,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal01,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_PreStart_810;
};

func void Rtn_PreStart_810()
{
	TA_Sit_Chair(8,0,10,0,"NW_BIGFARM_HOUSE_12");
	TA_Smoke_Joint(10,0,18,0,"NW_BIGFARM_KITCHEN_DAR");
	TA_Sit_Bench(18,0,20,0,"NW_BIGFARM_PATH_03");
	TA_Stand_Eating(20,0,23,0,"NW_BIGFARM_KITCHEN_09_B_HOK");
	TA_Smoke_Joint(23,0,8,0,"NW_BIGFARM_CAMPON_PSI_00");
};

func void Rtn_Start_810()
{
	TA_Sit_Chair(8,0,10,0,"NW_BIGFARM_HOUSE_12");
	TA_Smoke_Joint(10,0,18,0,"NW_BIGFARM_KITCHEN_DAR");
	TA_Sit_Bench(18,0,20,0,"NW_BIGFARM_PATH_03");
	TA_Stand_Eating(20,0,23,0,"NW_BIGFARM_KITCHEN_09_B_HOK");
	TA_Smoke_Joint(23,0,8,0,"NW_BIGFARM_CAMPON_PSI_00");
};

