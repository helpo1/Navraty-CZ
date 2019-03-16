
instance PAL_217_Marcos(Npc_Default)
{
	name[0] = "Marcos";
	guild = GIL_PAL;
	id = 217;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	aivar[96] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ItPo_Health_03,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_217;
};


func void Rtn_Start_217()
{
	TA_Stand_Guarding(8,0,23,0,"OW_SAWHUT_MOLERAT_SPAWN01");
	TA_Stand_Guarding(23,0,8,0,"OW_SAWHUT_MOLERAT_SPAWN01");
};

func void rtn_palout_217()
{
	TA_Stand_Guarding(8,0,23,0,"OC_PALADIN_OUT_06");
	TA_Stand_Guarding(23,0,8,0,"OC_PALADIN_OUT_06");
};

func void rtn_follow_217()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_HALL_THRONE");
	TA_Follow_Player(22,0,8,0,"OC_EBR_HALL_THRONE");
};

func void rtn_castle_217()
{
	TA_Stand_Guarding(8,0,23,0,"OC_CENTER_05_B");
	TA_Stand_Guarding(23,0,8,0,"OC_CENTER_05_B");
};

func void rtn_palexit_217()
{
	TA_Stand_Guarding(8,0,23,0,"OW_PATH_1_15");
	TA_Stand_Guarding(23,0,8,0,"OW_PATH_1_15");
};

func void rtn_tot_217()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

