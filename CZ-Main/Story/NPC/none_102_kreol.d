
instance NONE_102_KREOL(Npc_Default)
{
	name[0] = "Creol";
	guild = GIL_NONE;
	level = 500;
	id = 102;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	bodyStateInterruptableOverride = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetAttributesToChapter(self,8);
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_KREOL,BodyTex_N,ItAr_KDM_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	EquipItem(self,ItMW_Addon_Stab03_NPC);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_102;
};

func void rtn_start_102()
{
	TA_Read_Bookstand(4,0,23,0,"OW_FOGDUNGEON_10_COOK");
	TA_Read_Bookstand(23,0,4,0,"OW_FOGDUNGEON_10_COOK");
};

func void rtn_kreolroutine_102()
{
	TA_Read_Bookstand(8,0,20,0,"OW_FOGDUNGEON_10_COOK");
	TA_Sit_Throne(20,0,23,0,"OW_FOGDUNGEON_08");
	TA_Sleep(23,0,8,0,"OW_FOGDUNGEON_SKELETT_SPAWN");
};

func void rtn_runaway_102()
{
	TA_FleeToWp(4,0,23,0,"OW_FOGDUNGEON_10_COOK");
	TA_FleeToWp(23,0,4,0,"OW_FOGDUNGEON_10_COOK");
};

func void rtn_tot_102()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};