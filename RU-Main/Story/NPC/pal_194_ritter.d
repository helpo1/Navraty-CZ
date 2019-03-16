
instance PAL_194_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 194;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_ToughBald01,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_194;
};


func void rtn_start_194()
{
	TA_Stand_Guarding(8,0,8,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(8,30,9,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(9,0,9,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(9,30,10,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(10,0,10,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(10,30,11,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(11,0,11,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(11,30,12,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(12,0,12,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(12,30,13,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(13,0,13,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(13,30,14,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(14,0,14,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(14,30,15,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(15,0,15,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(15,30,16,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(16,0,16,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(16,30,17,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(17,0,17,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(17,30,18,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(18,0,18,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(18,30,19,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(19,0,19,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(19,30,20,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(20,0,20,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(20,30,21,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(21,0,21,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(21,30,22,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(22,0,22,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(22,30,23,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(23,0,23,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(23,30,0,30,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(0,30,1,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(1,30,2,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(2,0,2,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(2,30,3,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(3,0,3,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(3,30,4,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(4,0,4,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(4,30,5,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(5,0,5,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(5,30,6,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(6,0,6,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(6,30,7,0,"NW_FORESTFORT_08_01");
	TA_Stand_Guarding(7,0,7,30,"NW_FORESTFORT_06");
	TA_Stand_Guarding(7,30,8,0,"NW_FORESTFORT_08_01");
};

