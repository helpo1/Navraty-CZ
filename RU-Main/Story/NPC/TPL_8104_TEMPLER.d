
instance TPL_8104_TEMPLER(Npc_Default)
{
	name[0] = "Тиракс";
	guild = GIL_TPL;
	id = 8104;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_zweihaender5);
	CreateInvItems(self,ItPo_Health_03,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_TEMPLER_1,BodyTex_N,itar_tpl_l);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_8104;
};

func void rtn_start_8104()
{
	TA_Stand_ArmsCrossed(8,0,0,0,"NW_PSICAMP_GUARDCAMP_04_01");
	TA_Sit_Campfire(0,0,8,0,"NW_PSICAMP_GUARDCAMP_04_02");
};
