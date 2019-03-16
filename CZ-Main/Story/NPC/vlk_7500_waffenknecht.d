
instance VLK_7500_WAFFENKNECHT(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 7500;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart09,BodyTex_N,ITAR_PAL_L_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_7500;
};


func void rtn_start_7500()
{
	TA_Stand_Guarding(0,0,1,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(1,0,2,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(2,0,3,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(3,0,4,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(4,0,5,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(5,0,6,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(6,0,7,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Eating(7,0,8,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(8,0,9,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(9,0,10,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(10,0,11,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(11,0,12,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(12,0,13,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Eating(13,0,14,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(14,0,15,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(15,0,16,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(16,0,17,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(17,0,18,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(18,0,19,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(19,0,20,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Eating(20,0,21,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(21,0,22,0,"OC_GUARD_WATCHTOWER_01");
	TA_Stand_Guarding(22,0,23,0,"OC_GUARD_WATCHTOWER_02");
	TA_Stand_Guarding(23,0,0,0,"OC_GUARD_WATCHTOWER_01");
};

