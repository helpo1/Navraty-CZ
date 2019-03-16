
instance PAL_2500_GAROND(Npc_Default)
{
	name[0] = "Лорд Гаронд";
	guild = GIL_PAL;
	id = 2500;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Raven,BodyTex_N,ITAR_PAL_H_V2_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_prestart_2500;
};


func void rtn_prestart_2500()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_01");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_01");
};

func void rtn_start_2500()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERPALFORT");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERPALFORT");
};

func void rtn_tot_2500()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_campon_2500()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_SOVET_GAROND");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_62");
};

func void rtn_inbattle_2500()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8732");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8732");
};

func void rtn_fleefrombattle_2500()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

