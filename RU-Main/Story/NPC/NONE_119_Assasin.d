
instance NONE_119_Assasin(Npc_Default)
{
	name[0] = "Гонсалес";
	guild = GIL_NONE;
	id = 119;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,55);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Zweihaender1);
	EquipItem(self,ITRW_G3_SILENTDEATH_BOW_01_NPC);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Assasin,BodyTex_Assasin,ITAR_GONSALES);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_119;
};

func void Rtn_Start_119()
{
	TA_Stand_Guarding(8,0,20,0,"NW_CITY_HABOUR_TAVERN01_STAND_02");
	TA_Smoke_Waterpipe(20,0,8,0,"NW_CITY_PUFF_THRONE");
};

func void Rtn_FollowMasiafLair_119()
{
	TA_Follow_Player(8,0,20,0,"NW_ASSASINS_ENTRANCE_01");
	TA_Follow_Player(20,0,8,0,"NW_ASSASINS_ENTRANCE_01");
};

func void Rtn_TOT_119()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance NONE_1191_Assasin(Npc_Default)
{
	name[0] = "Гонсалес";
	guild = GIL_NONE;
	id = 1191;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,55);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_KATANA);
	EquipItem(self,ITRW_G3_SILENTDEATH_BOW_01_NPC);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_Assasin,BodyTex_Assasin,ITAR_GONSALES);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1191;
};

func void Rtn_Start_1191()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_FROM_PW_GONSA");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_FROM_PW_GONSA");
};

func void Rtn_City_1191()
{
	TA_Stand_Guarding(8,0,20,0,"NW_CITY_HABOUR_TAVERN01_STAND_02");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_HABOUR_06_C");
};

func void Rtn_Kloster_1191()
{
	TA_Pray_Innos(20,0,8,0,"NW_MONASTERY_CHAPELL_02");
	TA_Stand_Sweeping(8,0,15,0,"NW_MONASTERY_CORRIDOR_10");
	TA_Pray_Innos_FP(15,0,16,0,"NW_MONASTERY_CHURCH_03");
	TA_Stand_Sweeping(16,0,20,30,"NW_MONASTERY_CORRIDOR_10");
};

func void Rtn_TOT_1191()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};