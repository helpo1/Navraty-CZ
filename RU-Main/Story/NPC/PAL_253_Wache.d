
instance PAL_253_Wache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 253;
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
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Tough_Pacho,BodyTex_B,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_253;
};


func void Rtn_Start_253()
{
	TA_Stand_Guarding(4,0,21,0,"OC_GATE_GUARD_01");
	TA_WacheFackel(21,0,4,0,"OC_GATE_GUARD_01");
};

func void Rtn_Marcos_253()
{
	TA_Stand_Guarding(8,0,23,0,"OW_STAND_GUARDS");
	TA_Stand_Guarding(23,0,8,0,"OW_STAND_GUARDS");
};

func void rtn_palout_253()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PALADIN_OUT_07");
	TA_Stand_Guarding(23,0,8,0,"OC_PALADIN_OUT_07");
};

func void rtn_follow_253()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_253()
{
	TA_Stand_Guarding(8,0,23,0,"OC_EBR_GUARDPASSAGE_01");
	TA_Stand_Guarding(23,0,8,0,"OC_EBR_GUARDPASSAGE_01");
};

func void rtn_palexit_253()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_17");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_17");
};

func void rtn_tot_253()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

