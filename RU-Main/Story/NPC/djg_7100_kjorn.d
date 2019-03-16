
instance DJG_7100_KJORN(Npc_Default)
{
	name[0] = "Кйорн";
	guild = GIL_OUT;
	id = 7100;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal02,BodyTex_N,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_prestart_7100;
};


func void rtn_prestart_7100()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_DJG_02");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_DJG_02");
};

func void rtn_start_7100()
{
	TA_Practice_Sword(8,0,21,0,"NW_BIGFARM_KJORN");
	TA_Stand_ArmsCrossed(21,0,8,0,"NW_BIGFARM_KJORN");
};

func void rtn_tot_7100()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_inbattle_7100()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8759");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8759");
};

