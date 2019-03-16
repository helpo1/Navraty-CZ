
instance TPL_8007_GORNAVID(Npc_Default)
{
	name[0] = "Гор На Вид";
	guild = GIL_TPL;
	id = 8007;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_zweihaender5);
	CreateInvItems(self,ItPo_Health_03,6);
	CreateInvItems(self,ItMi_OldCoin,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_GORNAVID,BodyTex_N,itar_tpl_m);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_8007;
};


func void rtn_start_8007()
{
	TA_Smalltalk(7,0,22,30,"NW_PSICAMP_GORNAVID");
	TA_Sleep(22,30,7,0,"NW_PSICAMP_SLEEP_07");
};

func void rtn_campon_8007()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_07");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_07");
};

func void rtn_inbattle_8007()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8643");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8643");
};

