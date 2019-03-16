
instance VLK_988_GRAVO(Npc_Default)
{
	name[0] = "Gravo";
	guild = GIL_NONE;
	id = 988;
	voice = 13;
	flags = 0;
	aivar[93] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ITMW_1H_G4_AXESMALL_01);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_OldMan_Gravo,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_988;
};

func void rtn_start_988()
{
	TA_Sit_Chair(8,0,12,0,"NW_GRAVO_BF");
	TA_Stand_Drinking(12,0,16,0,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sit_Bench(16,0,20,0,"NW_MONASTERY_SHRINE_05");
	TA_Stand_Eating(20,0,8,0,"NW_TAVERNE_IN_GRAVO");
};

func void rtn_orcatcbegan_988()
{
	TA_Sit_Chair(8,0,22,0,"NW_BIGFARM_KITCHEN_BULLCO");
	TA_Sit_Chair(22,0,8,0,"NW_BIGFARM_KITCHEN_BULLCO");
};

