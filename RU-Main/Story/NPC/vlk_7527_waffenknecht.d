
instance VLK_7527_WAFFENKNECHT(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_OUT;
	id = 7527;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Mil_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal19,BodyTex_N,ITAR_PAL_L_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = rtn_start_7527;
};

func void rtn_start_7527()
{
	TA_Pray_Innos(5,40,6,0,"OW_PAL_WESTMINE_03");
	TA_Stand_Guarding(6,0,7,0,"OW_PATH_148_A");
	TA_Stand_Guarding(7,0,8,0,"OW_PATH_264");
	TA_Stand_Guarding(8,0,23,0,"OW_PAL_WESTMINE_06");
	TA_Stand_ArmsCrossed(23,0,5,40,"OW_MINE2_STAND_JERGAN");
};

func void rtn_grimesesc_7527()
{
	TA_Stand_Guarding(23,0,8,0,"OW_PAL_WESTMINE_06");
	TA_Stand_Guarding(8,0,23,0,"OW_PAL_WESTMINE_06");
};
