
instance PIR_13200_ADDON_GREG(Npc_Default)
{
	name[0] = "Грэг";
	guild = GIL_PAL;
	id = 13200;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[93] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_Greg,BodyTex_P,ItAr_PAL_M);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds(self,"humans_pirate.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_13200;
};


func void rtn_start_13200()
{
	TA_Stand_ArmsCrossed(9,0,20,0,"NW_BIGFARM_SOVET_GREG");
	TA_Stand_ArmsCrossed(20,0,9,0,"NW_BIGFARM_CAMPON_PIR_19");
};

func void rtn_inbattle_13200()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8741");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8741");
};

func void rtn_fleefrombattle_13200()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_ship_13200()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"SHIP_CREW_CAPTAIN");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

func void rtn_edngame_13200()
{
	ta_edngame(8,0,23,0,"SHIP_CREW_CAPTAIN");
	ta_edngame(23,0,8,0,"SHIP_CREW_CAPTAIN");
};

