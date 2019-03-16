
instance PAL_203_Lothar(Npc_Default)
{
	name[0] = "Lothar";
	guild = GIL_PAL;
	id = 203;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_NormalBart_Nefarius,BodyTex_P,ITAR_PAL_H_V1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_preStart_203;
};


func void Rtn_preStart_203()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_MAINSTREET_01_BV");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_MAINSTREET_01_BV");
};

func void Rtn_Start_203()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_LOTHAR");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_LOTHAR");
};

func void Rtn_Tot_203()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

