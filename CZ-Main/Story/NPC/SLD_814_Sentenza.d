
instance SLD_814_Sentenza(Npc_Default)
{
	name[0] = "Sentenza";
	guild = GIL_SLD;
	id = 814;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_FollowTime] = 60;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_sentenca_sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Tough_Okyl,BodyTex_N,ITAR_SLD_U);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_814;
};

func void Rtn_Start_814()
{
	TA_Stand_Eating(8,0,10,0,"NW_BIGFARM_ALLEE_01");
	TA_Stand_Guarding(10,0,12,0,"NW_BIGFARM_ALLEE_01");
	TA_Smoke_Joint(12,0,14,0,"NW_BIGFARM_ALLEE_01");
	TA_Stand_Drinking(14,0,18,0,"NW_BIGFARM_ALLEE_01");
	TA_Stand_ArmsCrossed(18,2,22,5,"NW_BIGFARM_ALLEE_01");
	TA_Sit_Campfire(22,0,8,0,"NW_BIGFARM_VORPOSTEN1_01");
};

func void Rtn_Follow_814()
{
	TA_Follow_Player(8,0,22,0,"NW_BIGFARM_VORPOSTEN1_02");
	TA_Follow_Player(22,0,8,0,"NW_BIGFARM_VORPOSTEN1_02");
};

func void rtn_inbattle_814()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_HUM_03");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_HUM_03");
};

