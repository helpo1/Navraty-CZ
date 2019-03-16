
instance PAL_257_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 257;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow_NPC);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Swiney,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_257;
};


func void Rtn_Start_257()
{
	TA_Practice_Sword(8,0,19,0,"OC_TRAIN_03");
	TA_Sit_Campfire(19,0,8,0,"OC_CAMPFIRE_OUT_03");
};

func void Rtn_Marcos_257()
{
	TA_Stand_Guarding(8,0,19,0,"OW_STAND_GUARDS");
	TA_Stand_Guarding(19,0,8,0,"OW_STAND_GUARDS");
};

func void rtn_palout_257()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PALADIN_OUT_08");
	TA_Stand_Guarding(23,0,8,0,"OC_PALADIN_OUT_08");
};

func void rtn_follow_257()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_257()
{
	TA_Stand_Guarding(8,0,23,0,"OC_EBR_GUARDPASSAGE_02");
	TA_Stand_Guarding(23,0,8,0,"OC_EBR_GUARDPASSAGE_02");
};

func void rtn_palexit_257()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_17");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_17");
};

func void rtn_tot_257()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

