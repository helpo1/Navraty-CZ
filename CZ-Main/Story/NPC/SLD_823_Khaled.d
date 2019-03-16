
instance SLD_823_Khaled(Npc_Default)
{
	name[0] = "Khaled";
	guild = GIL_SLD;
	id = 823;
	voice = 11;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Thorus,BodyTex_B,ItAr_Sld_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_823;
};

func void Rtn_PreStart_823()
{
	TA_Stand_Guarding(7,55,18,0,"NW_BIGFARM_HOUSE_12");
	TA_Stand_ArmsCrossed(18,0,21,0,"NW_BIGFARM_KITCHEN_OUT_04");
	TA_Stand_Eating(21,0,23,55,"NW_BIGFARM_HOUSE_UP2_07");
	TA_Sleep(23,55,7,55,"NW_BIGFARM_HOUSE_UP2_02_KHALED");
};

func void Rtn_Start_823()
{
	TA_Stand_Guarding(7,55,18,0,"NW_BIGFARM_HOUSE_12");
	TA_Stand_Guarding(18,0,21,0,"NW_BIGFARM_HOUSE_12");
	TA_Stand_Eating(21,0,23,55,"NW_BIGFARM_HOUSE_UP2_07");
	TA_Sleep(23,55,7,55,"NW_BIGFARM_HOUSE_UP2_02_KHALED");
};

func void rtn_inbattle_823()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8650");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8650");
};

