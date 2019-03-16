
instance VLK_6035_BUERGER(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 6035;
	id = 464;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Huno,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6035;
};


func void rtn_start_6035()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"OCR_CROWD_08");
	TA_Sit_Chair(20,0,8,0,"NW_CITY_TAVERN_IN_07");
};

