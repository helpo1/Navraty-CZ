
instance DJG_7110_GODAR(Npc_Default)
{
	name[0] = "Godar";
	guild = GIL_OUT;
	id = 7110;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal14,BodyTex_N,itar_djg_m_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_prestart_7110;
};


func void rtn_prestart_7110()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_DJG_03");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_DJG_03");
};

func void rtn_start_7110()
{
	TA_Stand_Drinking(8,0,21,0,"NW_BIGFARM_GODAR");
	TA_Smoke_Joint(21,0,8,0,"NW_BIGFARM_GODAR");
};

func void rtn_tot_7110()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_inbattle_7110()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8758");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8758");
};

