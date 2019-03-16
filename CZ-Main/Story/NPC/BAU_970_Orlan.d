
instance BAU_970_Orlan(Npc_Default)
{
	name[0] = "Orlan";
	guild = GIL_NONE;
	id = 970;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NPCIsRanger] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,5);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_B_Normal_Sharky,BodyTex_B,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_970;
};

func void Rtn_Start_970()
{
	TA_Stand_Sweeping(8,0,11,0,"NW_TAVERNE_IN_05_ORL_02");
	TA_Wood_Choop(11,0,14,0,"NW_TAVERNE_CHOOP_05");
	TA_Cook_Stove(14,0,18,0,"NW_TAVERNE_IN_05_ORL_01");
	TA_Saw(18,0,20,0,"NW_TAVERNE_IN_05_ORL_03");
	TA_Stand_WP(20,0,8,0,"NW_TAVERNE_IN_04");
};

func void Rtn_Wettkampf_970()
{
	TA_Stand_WP(8,0,22,0,"NW_TAVERNE");
	TA_Stand_WP(22,0,8,0,"NW_TAVERNE");
};

func void Rtn_RangerMeeting_970()
{
	TA_RangerMeeting(8,0,22,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_RangerMeeting(22,0,8,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Parking_970()
{
	TA_Stand_Guarding(8,0,22,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Stand_Guarding(22,0,8,0,"NW_TAVERNE_IN_RANGERMEETING");
};

