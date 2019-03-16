
instance PAL_299_Sergio(Npc_Default)
{
	name[0] = "Серджио";
	guild = GIL_PAL;
	id = 299;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	B_SetAttributesToChapter(self,5);
	aivar[93] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_Innos_MIS,1);
	CreateInvItems(self,ItPo_Health_02,4);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Normal_Erpresser,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_299;
};


func void Rtn_Start_299()
{
	TA_Pray_Innos(8,0,23,0,"NW_MONASTERY_CHAPELL_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_MONASTERY_CORRIDOR_03");
};

func void rtn_awaymonastery_299()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_MAGECAVE_RUNE");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_MAGECAVE_RUNE");
};

func void Rtn_WaitForPlayer_299()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_PLACE_09");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_PLACE_09");
};

func void Rtn_TOT_299()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

func void Rtn_Train_299()
{
	TA_Pray_Innos(7,0,23,0,"NW_MONASTERY_CHAPELL_02");
	TA_Pray_Innos(23,0,5,0,"NW_MONASTERY_CHAPELL_02");
	TA_Practice_Sword(5,0,7,0,"NW_MONASTERY_TRAIN_01");
};

func void Rtn_Wait_299()
{
	TA_Stand_Guarding(8,0,23,0,"NW_MONASTERY_CHAPELL_03");
	TA_Stand_Guarding(23,0,8,0,"NW_MONASTERY_CHAPELL_03");
};

func void Rtn_Guide_299()
{
	TA_Guide_Player(8,0,23,0,"NW_TO_PASS_01");
	TA_Guide_Player(23,0,8,0,"NW_TO_PASS_01");
};

func void rtn_guardpass_299()
{
	TA_Pray_Innos(7,0,23,0,"NW_MONASTERY_CHAPELL_02");
	TA_Pray_Innos(23,0,5,0,"NW_MONASTERY_CHAPELL_02");
	TA_Practice_Sword(5,0,7,0,"NW_MONASTERY_TRAIN_01");
};

func void rtn_monastery_299()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_MONASTERY_PLACE_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_MONASTERY_PLACE_01");
};

func void rtn_campon_299()
{
	TA_Stand_Guarding(9,0,20,0,"NW_BIGFARM_CAMPON_58");
	TA_Stand_Guarding(20,0,9,0,"NW_BIGFARM_CAMPON_58");
};

func void rtn_inbattle_299()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8728");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8728");
};

func void rtn_fleefrombattle_299()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

