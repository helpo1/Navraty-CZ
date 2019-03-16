
instance TPL_8006_GORNATOT(Npc_Default)
{
	name[0] = "Gor Na Toth";
	guild = GIL_TPL;
	id = 8006;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_zweihaender5);
	CreateInvItems(self,ItPo_Health_03,6);
	CreateInvItems(self,ItMi_OldCoin,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_GORNATOT,BodyTex_N,itar_tpl_m);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_8006;
};


func void rtn_start_8006()
{
	TA_Stand_Guarding(6,0,23,0,"NW_PSICAMP_GORNATOT");
	TA_Sleep(23,0,6,0,"NW_PSICAMP_SLEEP_06");
};

func void rtn_campon_8006()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_08");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_08");
};

func void rtn_inbattle_8006()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8644");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8644");
};

