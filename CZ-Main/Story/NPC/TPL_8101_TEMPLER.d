
instance TPL_8101_TEMPLER(Npc_Default)
{
	name[0] = NAME_TPL;
	guild = GIL_TPL;
	id = 8101;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_zweihaender5);
	CreateInvItems(self,ItPo_Health_03,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_TEMPLER_3,BodyTex_N,itar_tpl_l);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_8101;
};


func void rtn_start_8101()
{
	TA_Stand_ArmsCrossed(8,0,14,0,"NW_PSICAMP_GUARDCAMP_01_01");
	TA_Stand_Eating(14,0,22,0,"NW_PSICAMP_GUARDCAMP_01_02");
	TA_Sit_Campfire(22,0,8,0,"NW_PSICAMP_GUARDCAMP_01_03");
};


func void Rtn_Train_8101()
{
	TA_Practice_Sword(12,0,16,0,"NW_PSICAMP_GUARDCAMP_00_00");
	TA_Stand_ArmsCrossed(16,0,20,0,"NW_PSICAMP_GUARDCAMP_01_01");
	TA_Stand_Eating(20,0,0,0,"NW_PSICAMP_GUARDCAMP_01_02");
	TA_Sit_Campfire(0,0,12,0,"NW_PSICAMP_GUARDCAMP_01_03");
};