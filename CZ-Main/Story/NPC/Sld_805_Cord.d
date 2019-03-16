
instance Sld_805_Cord(Npc_Default)
{
	name[0] = "Cord";
	guild = GIL_SLD;
	id = 805;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NPCIsRanger] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_kord_axt);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Cord,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_805;
};

func void Rtn_Start_805()
{
	TA_Practice_Sword(8,40,12,0,"NW_BIGFARM_DANCE_LOA_05");
	TA_Sit_Bench(12,0,15,0,"NW_BIGFARM_RUDAR_2");
	TA_Practice_Sword(15,0,18,0,"NW_BIGFARM_DANCE_LOA_05");
	TA_Sit_Bench(18,0,22,40,"NW_BIGFARM_KITCHEN_09_B_HOK2");
	TA_Sleep(22,40,8,40,"NW_BIGFARM_HOUSE_15_CORD");
};

func void Rtn_PreRangerMeeting_805()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_04");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_04");
};

func void Rtn_RangerMeeting_805()
{
	TA_RangerMeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_RangerMeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void Rtn_Parking_805()
{
	TA_Stand_ArmsCrossed(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Stand_ArmsCrossed(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void rtn_inbattle_805()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8753");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8753");
};