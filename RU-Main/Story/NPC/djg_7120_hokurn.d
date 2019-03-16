
instance DJG_7120_HOKURN(Npc_Default)
{
	name[0] = "Хокурн";
	guild = GIL_OUT;
	id = 7120;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal_Sharky,BodyTex_B,itar_djg_m_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_prestart_7120;
};


func void rtn_prestart_7120()
{
	TA_Stand_Guarding(8,0,21,0,"NW_ENTERVALLEY_DJG_04");
	TA_Stand_Guarding(21,0,8,0,"NW_ENTERVALLEY_DJG_04");
};

func void rtn_start_7120()
{
	TA_Stand_Eating(8,0,21,0,"NW_BIGFARM_HOKURN");
	TA_Stand_ArmsCrossed(21,0,8,0,"NW_BIGFARM_HOKURN");
};

func void rtn_tot_7120()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void rtn_inbattle_7120()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8757");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8757");
};

