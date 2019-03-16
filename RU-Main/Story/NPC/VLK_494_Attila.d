
instance VLK_494_Attila(Npc_Default)
{
	name[0] = "Аттила";
	guild = GIL_OUT;
	id = 494;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword4);
	CreateInvItem(self,ItKe_ZhiefGuildKey_MIS);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough_Santino,BodyTex_L,ITAR_Atilla);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_494;
};


func void Rtn_Start_494()
{
	TA_Stand_Guarding(4,0,22,0,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
	TA_Stand_Guarding(22,0,4,0,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
};

func void Rtn_After_494()
{
	TA_Stand_Guarding(4,0,22,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	TA_Stand_Guarding(22,0,4,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
};

func void Rtn_ChiefLair_494()
{
	TA_Practice_Sword(7,0,12,0,"NW_CITY_KANAL_23");
	TA_Smoke_Joint(12,0,20,0,"NW_CITY_KANAL_23");
	TA_Stand_ArmsCrossed(20,0,7,0,"NW_CITY_KANAL_22");
};

func void rtn_tot_494()
{
	TA_Stand_Guarding(4,0,22,0,"TOT");
	TA_Stand_Guarding(22,0,4,0,"TOT");
};

