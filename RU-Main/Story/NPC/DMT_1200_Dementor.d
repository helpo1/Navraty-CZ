
instance DMT_1200_Dementor(Npc_Default)
{
	name[0] = NAME_Dementor;
	guild = GIL_DMT;
	id = 1200;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ITAR_Dementor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1200;
};


func void Rtn_Start_1200()
{
	TA_Stand_Dementor(8,0,23,0,"NW_TROLLAREA_RUINS_02");
	TA_Stand_Dementor(23,0,8,0,"NW_TROLLAREA_RUINS_02");
};


instance DMT_Dementor_Test(Npc_Default)
{
	name[0] = NAME_Dementor;
	guild = GIL_DMT;
	id = 5000;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ITAR_Dementor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_5000;
};


func void Rtn_Start_5000()
{
	TA_Stand_Dementor(8,0,23,0,"BIGFARM");
	TA_Stand_Dementor(23,0,8,0,"BIGFARM");
};

instance DMT_1270_Dementor(Npc_Default)
{
	name[0] = NAME_DemMaster;
	guild = GIL_DMT;
	id = 1270;
	aivar[94] = NPC_LEGEND;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,7);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1270;
};

func void Rtn_Start_1270()
{
	TA_Circle(8,0,23,0,"NW_DARKMASTER_01");
	TA_Circle(23,0,8,0,"NW_DARKMASTER_01");
};

instance DMT_1271_Dementor(Npc_Default)
{
	name[0] = NAME_DemMaster;
	guild = GIL_DMT;
	id = 1271;
	aivar[94] = NPC_LEGEND;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,7);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1271;
};

func void Rtn_Start_1271()
{
	TA_Circle(8,0,23,0,"NW_DARKMASTER_02");
	TA_Circle(23,0,8,0,"NW_DARKMASTER_02");
};

instance DMT_1272_Dementor(Npc_Default)
{
	name[0] = NAME_DemMaster;
	guild = GIL_DMT;
	id = 1272;
	voice = 19;
	aivar[94] = NPC_LEGEND;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter(self,7);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_1272;
};

func void Rtn_Start_1272()
{
	TA_Circle(8,0,23,0,"NW_DARKMASTER_03");
	TA_Circle(23,0,8,0,"NW_DARKMASTER_03");
};