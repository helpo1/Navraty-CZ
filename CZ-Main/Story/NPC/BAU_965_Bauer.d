
instance BAU_965_Bauer(Npc_Default)
{
	name[0] = NAME_Bauer;
	guild = GIL_BAU;
	id = 965;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_MM_RestStart] = TRUE;
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough_Santino,BodyTex_L,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_965;
};


func void Rtn_Start_965()
{
	TA_Smalltalk(8,0,22,0,"NW_FARM3_STABLE_OUT_03");
	TA_Sit_Campfire(22,0,8,0,"NW_FARM3_HOUSE_REST_01");
};

func void Rtn_FleeFromPass_965()
{
	TA_Sit_Campfire(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_05");
	TA_Sit_Campfire(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_05");
};

