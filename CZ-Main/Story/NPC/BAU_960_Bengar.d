
instance BAU_960_Bengar(Npc_Default)
{
	name[0] = "Bengar";
	guild = GIL_BAU;
	id = 960;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Olli_Kahn,BodyTex_N,ITAR_Bau_M_Ext);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_Start_960;
};

func void Rtn_Start_960()
{
	TA_Stand_Guarding(8,0,11,0,"NW_FARM3_BENGAR");
	TA_Study_WP(11,0,14,0,"NW_FARM3_BENGAR_TEMP_01");
	TA_Stand_ArmsCrossed(14,0,16,0,"NW_FARM3_BENGAR_TEMP_02");
	TA_Stand_Eating(16,0,20,0,"NW_FARM3_BENGAR");
	TA_Sleep(20,0,8,0,"NW_FARM3_HOUSE_IN_BED");
};

func void Rtn_MilComing_960()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_BENGAR");
	TA_Smalltalk(22,0,8,0,"NW_FARM3_BENGAR");
};

