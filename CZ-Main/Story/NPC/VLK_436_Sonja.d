
instance VLK_436_Sonja(Npc_Default)
{
	name[0] = "Sonja";
	guild = GIL_VLK;
	id = 436;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_MM_RestStart] = TRUE;
	aivar[AIV_Gender] = FEMALE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"SRN_GLM.MDS"); 
	Mdl_SetVisualBody(self,"SRNGLM_BODY_NAKED0",5,0,"SRN_HEAD_HAIR5",4,0,armr_G1_v5);
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_436;
};

func void Rtn_Start_436()
{
	TA_Sit_Throne(8,0,23,0,"NW_CITY_PUFF_THRONE");
	TA_Sit_Throne(23,0,8,0,"NW_CITY_PUFF_THRONE");
};

func void Rtn_DanceSkip_436()
{
	ta_charlotte_dance(8,0,23,0,"NW_CITY_PIRATESCAMP_04");
	ta_charlotte_dance(23,0,8,0,"NW_CITY_PIRATESCAMP_04");
};

func void Rtn_FollowPlayer_436()
{
	TA_Follow_Player(8,0,23,0,"NW_CITY_PUFF_THRONE");
	TA_Follow_Player(23,0,8,0,"NW_CITY_PUFF_THRONE");
};

func void Rtn_FollowPlayerBack_436()
{
	TA_Follow_Player(8,0,23,0,"NW_CITY_PIRATESCAMP_04");
	TA_Follow_Player(23,0,8,0,"NW_CITY_PIRATESCAMP_04");
};