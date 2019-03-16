
instance Mil_327_Miliz(Npc_Default)
{
	name[0] = NAME_Miliz;
	guild = GIL_MIL;
	id = 327;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal20,BodyTex_N,ITAR_TOWNGUARD);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_327;
};


func void Rtn_Start_327()
{
	TA_Smalltalk(21,0,23,59,"NW_CITY_BARRACK02_SMALLTALK_01");
	TA_Sleep(23,59,6,30,"NW_CITY_BARRACK01_BED_02");
	TA_Stand_Guarding(6,30,7,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding(7,30,8,30,"NW_CITY_HABOUR_KASERN_12");
	TA_Stand_Guarding(8,30,9,30,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_Guarding(9,30,10,30,"NW_CITY_HABOUR_KASERN_08");
	TA_Stand_Guarding(10,30,11,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding(11,30,12,30,"NW_CITY_HABOUR_KASERN_12");
	TA_Stand_Guarding(12,30,13,30,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_Guarding(13,30,14,30,"NW_CITY_HABOUR_KASERN_08");
	TA_Stand_Guarding(14,30,15,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding(15,30,16,30,"NW_CITY_HABOUR_KASERN_12");
	TA_Stand_Guarding(16,30,17,30,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_Guarding(17,30,18,30,"NW_CITY_HABOUR_KASERN_08");
	TA_Stand_Guarding(18,30,19,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding(19,30,21,0,"NW_CITY_HABOUR_KASERN_12");
};

instance Mil_360_Miliz(Npc_Default)
{
	name[0] = "Stráž tábora";
	guild = GIL_NONE;
	id = 360;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal20,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_360;
};


func void Rtn_Start_360()
{
	TA_Stand_Guarding(4,0,21,0,"NW_CASTLEMINE_PATH_02");
	TA_WacheFackel(21,0,4,0,"NW_CASTLEMINE_PATH_02");
};

func void Rtn_Guard_360()
{
	TA_Stand_Guarding(6,30,18,30,"NW_CASTLEMINE_PATH_02");
	TA_Sleep(18,30,6,30,"NW_CASTLEMINE_PATH_HUT_IN_BED");
};

instance Mil_361_Miliz(Npc_Default)
{
	name[0] = "Stráž tábora";
	guild = GIL_NONE;
	id = 361;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart10,BodyTex_N,ITAR_Bau_M_Ext);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_361;
};

func void Rtn_Start_361()
{
	TA_Sleep(6,30,18,30,"NW_CASTLEMINE_PATH_HUT_IN_BED");
	TA_Sleep(18,30,6,30,"NW_CASTLEMINE_PATH_HUT_IN_BED");

};

func void Rtn_Guard_361()
{
	TA_Sleep(6,30,18,30,"NW_CASTLEMINE_PATH_HUT_IN_BED");
	TA_Stand_Guarding(18,30,21,0,"NW_CASTLEMINE_PATH_02");
	TA_WacheFackel(21,0,4,0,"NW_CASTLEMINE_PATH_02");
	TA_Stand_Guarding(4,0,6,30,"NW_CASTLEMINE_PATH_02");
};

instance Mil_362_Miliz(Npc_Default)
{
	name[0] = "John";
	guild = GIL_MIL;
	id = 362;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Nagelknueppel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Weak_Ulbert,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_362;
};

func void Rtn_Start_362()
{
	TA_Smalltalk(7,0,21,1,"NW_CITY_HABOUR_KASERN_JOHN_01");
	TA_Smalltalk(21,1,0,0,"NW_CITY_HABOUR_KASERN_JOHN_01");
};

func void Rtn_TOT_362()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance Mil_363_Miliz(Npc_Default)
{
	name[0] = "Johnny";
	guild = GIL_MIL;
	id = 363;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Normal_Blade,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_363;
};

func void Rtn_Start_363()
{
	TA_Smalltalk(7,0,21,1,"NW_CITY_HABOUR_KASERN_JONNI_01");
	TA_Smalltalk(21,1,0,0,"NW_CITY_HABOUR_KASERN_JONNI_01");
};

func void Rtn_TOT_363()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

