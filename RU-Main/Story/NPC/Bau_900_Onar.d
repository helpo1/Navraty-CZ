
instance Bau_900_Onar(Npc_Default)
{
	name[0] = "Онар";
	guild = GIL_BAU;
	id = 900;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	level = 1;
	aivar[93] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,ITAR_Vlk_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_900;
};


func void Rtn_Start_900()
{
	TA_Sit_Throne(9,0,21,0,"NW_BIGFARM_HOUSE_ONAR_SIT");
	TA_Sleep(21,0,9,0,"NW_BIGFARM_HOUSE_UP1_04");
};

func void rtn_startpass_900()
{
	TA_Sit_Throne(9,0,11,45,"NW_BIGFARM_HOUSE_ONAR_SIT");
	TA_Stand_Guarding(11,45,13,0,"NW_CRYPT_02");
	TA_Stand_Guarding(13,0,13,30,"NW_CRYPT_03");
	TA_Stand_Guarding(13,30,14,0,"NW_CRYPT_05");
	TA_Sit_Throne(14,0,21,0,"NW_BIGFARM_HOUSE_ONAR_SIT");
	TA_Sleep(21,0,9,0,"NW_BIGFARM_HOUSE_UP1_04");
};

func void rtn_comedeath_900()
{
	TA_Stand_Guarding(9,0,21,0,"NW_BIGFARM_PATH_04");
	TA_Stand_Guarding(21,0,9,0,"NW_BIGFARM_PATH_04");
};

