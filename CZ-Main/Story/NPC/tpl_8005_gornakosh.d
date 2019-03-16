
instance TPL_8005_GORNAKOSH(Npc_Default)
{
	name[0] = "Gor Na Kosh";
	guild = GIL_TPL;
	id = 8005;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_STRENGTH] = 650;
	aivar[REAL_STRENGTH] = 650;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_ZWEIHAENDER_GORNAKOSH);
	CreateInvItems(self,ItPo_Health_03,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",FACE_N_GORNAKOSH,BodyTex_N,ITAR_CorAngar);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_8005;
};


func void rtn_start_8005()
{
	TA_Stand_ArmsCrossed(8,0,21,30,"NW_PSICAMP_GORNAKOSH");
	TA_Sleep(21,30,8,0,"NW_PSICAMP_SLEEP_04");
};

func void rtn_campon_8005()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_09");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_09");
};

func void rtn_inbattle_8005()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8646");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8646");
};

func void rtn_fleefrombattle_8005()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

