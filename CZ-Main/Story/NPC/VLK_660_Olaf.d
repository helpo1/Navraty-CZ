instance VLK_660_Olaf(Npc_Default)
{
	name[0] = "Kurt";
	guild = GIL_NONE;
	id = 660;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_MM_RestStart] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	attribute[ATR_STRENGTH] = 250;
	aivar[REAL_STRENGTH] = 250;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	level = 10;
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Lefty,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,1.2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_660;
};

func void Rtn_Start_660()
{
	TA_Sit_Chair(6,0,21,0,"NW_CITY_OLAF_01");
	TA_Sit_Chair(21,0,6,0,"NW_CITY_OLAF_01");
};

func void Rtn_GotoFight_660()
{
	TA_Stand_WP_Fight(6,0,21,0,"NW_TAVERNE_FIGHTSPOT_01");
	TA_Stand_WP_Fight(21,0,6,0,"NW_TAVERNE_FIGHTSPOT_01");
};

func void Rtn_GotoFightWatch_660()
{
	TA_Stand_WatchFight(6,0,21,0,"NW_TAVERNE_FIGHTWATCH_01");
	TA_Stand_WatchFight(21,0,6,0,"NW_TAVERNE_FIGHTWATCH_01");
};

instance VLK_661_Graden(Npc_Default)
{
	name[0] = "Graden";
	guild = GIL_NONE;
	id = 661;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_MM_RestStart] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,4);
	attribute[ATR_STRENGTH] = 300;
	aivar[REAL_STRENGTH] = 300;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	level = 15;
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Asghan,BodyTex_N,ITAR_Bau_L_02);
	Mdl_SetModelFatness(self,1.4);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_661;
};

func void Rtn_Start_661()
{
	TA_Smalltalk(6,0,21,0,"NW_CITY_GRADEN_01");
	TA_Smalltalk(21,0,6,0,"NW_CITY_GRADEN_01");
};

func void Rtn_GotoFight_661()
{
	TA_Stand_WP_Fight(6,0,21,0,"NW_TAVERNE_FIGHTSPOT_01");
	TA_Stand_WP_Fight(21,0,6,0,"NW_TAVERNE_FIGHTSPOT_01");
};

func void Rtn_GotoFightWatch_661()
{
	TA_Stand_WatchFight(6,0,21,0,"NW_TAVERNE_FIGHTWATCH_02");
	TA_Stand_WatchFight(21,0,6,0,"NW_TAVERNE_FIGHTWATCH_02");
};

instance VLK_662_Bram(Npc_Default)
{
	name[0] = "Bram";
	guild = GIL_NONE;
	id = 662;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_MM_RestStart] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,5);
	attribute[ATR_STRENGTH] = 350;
	aivar[REAL_STRENGTH] = 350;
	attribute[ATR_HITPOINTS_MAX] = 750;
	attribute[ATR_HITPOINTS] = 750;
	level = 20;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart22,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1.6);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_662;
};

func void Rtn_Start_662()
{
	TA_Smalltalk(6,0,21,0,"NW_CITY_BRAM_01");
	TA_Smalltalk(21,0,6,0,"NW_CITY_BRAM_01");
};

func void Rtn_GotoFight_662()
{
	TA_Stand_WP_Fight(6,0,21,0,"NW_TAVERNE_FIGHTSPOT_01");
	TA_Stand_WP_Fight(21,0,6,0,"NW_TAVERNE_FIGHTSPOT_01");
};

func void Rtn_GotoFightWatch_662()
{
	TA_Stand_WatchFight(6,0,21,0,"NW_TAVERNE_FIGHTWATCH_03");
	TA_Stand_WatchFight(21,0,6,0,"NW_TAVERNE_FIGHTWATCH_03");
};

instance VLK_663_Valgard(Npc_Default)
{
	name[0] = "Valgard";
	guild = GIL_NONE;
	id = 663;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_MM_RestStart] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	attribute[ATR_STRENGTH] = 400;
	aivar[REAL_STRENGTH] = 400;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	level = 25;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart16,BodyTex_N,ITAR_JAX);
	Mdl_SetModelFatness(self,1.8);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_663;
};

func void Rtn_Start_663()
{
	TA_Stand_Eating(6,0,21,0,"NW_CITY_VALGARD_01");
	TA_Stand_Eating(21,0,6,0,"NW_CITY_VALGARD_01");
};

func void Rtn_GotoFight_663()
{
	TA_Stand_WP_Fight(6,0,21,0,"NW_TAVERNE_FIGHTSPOT_01");
	TA_Stand_WP_Fight(21,0,6,0,"NW_TAVERNE_FIGHTSPOT_01");
};

func void Rtn_GotoFightWatch_663()
{
	TA_Stand_WatchFight(6,0,21,0,"NW_TAVERNE_FIGHTWATCH_04");
	TA_Stand_WatchFight(21,0,6,0,"NW_TAVERNE_FIGHTWATCH_04");
};

instance VLK_664_Masbo(Npc_Default)
{
	name[0] = "Mastbo";
	guild = GIL_BAU;
	id = 664;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_MAIN;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_NormalBart06,BodyTex_N,ITAR_Her_N);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_664;
};

func void Rtn_Start_664()
{
	TA_Study_WP(6,0,21,0,"NW_CITY_MASTBO_01");
	TA_Study_WP(21,0,6,0,"NW_CITY_MASTBO_01");
};