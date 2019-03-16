
instance TPL_8102_TEMPLER(Npc_Default)
{
	name[0] = NAME_TPL;
	guild = GIL_TPL;
	id = 8102;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_zweihaender5);
	CreateInvItems(self,ItPo_Health_03,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_TEMPLER_4,BodyTex_N,itar_tpl_l);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_8102;
};


func void rtn_start_8102()
{
	TA_Sit_Campfire(8,0,14,0,"NW_PSICAMP_GUARDCAMP_02_03");
	TA_Stand_ArmsCrossed(14,0,22,0,"NW_PSICAMP_GUARDCAMP_02_01");
	TA_Stand_Eating(22,0,8,0,"NW_PSICAMP_GUARDCAMP_02_02");
};

func void Rtn_Train_8102()
{
	TA_Practice_Sword(16,0,20,0,"NW_PSICAMP_GUARDCAMP_00_00");
	TA_Stand_ArmsCrossed(20,0,0,0,"NW_PSICAMP_GUARDCAMP_02_01");
	TA_Stand_Eating(0,0,4,0,"NW_PSICAMP_GUARDCAMP_02_02");
	TA_Sit_Campfire(4,0,16,0,"NW_PSICAMP_GUARDCAMP_02_03");
};


