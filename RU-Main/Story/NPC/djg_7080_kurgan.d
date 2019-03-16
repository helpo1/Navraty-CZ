
instance DJG_7080_KURGAN(Npc_Default)
{
	name[0] = "Курган";
	guild = GIL_OUT;
	id = 7080;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_kurgansword);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_ImportantGrey,BodyTex_N,itar_djg_h_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_prestart_7080;
};


func void rtn_prestart_7080()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_DJG_01");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_DJG_01");
};

func void rtn_start_7080()
{
	TA_Stand_Guarding(8,0,21,0,"NW_BIGFARM_KURGAN");
	TA_Stand_Guarding(21,0,8,0,"NW_BIGFARM_KURGAN");
};

func void rtn_tot_7080()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_inbattle_7080()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8760");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8760");
};

