
instance BDT_1093_Addon_Franco(Npc_Default)
{
	name[0] = "Franco";
	guild = GIL_BDT;
	id = 1093;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_StoryBandit] = TRUE;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItAm_Addon_Franco,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough01,BodyTex_L,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1093;
};


func void Rtn_Start_1093()
{
	TA_Stand_Guarding(6,0,20,0,"ADW_PATH_TO_BL_02");
	TA_Stand_Guarding(20,0,0,0,"BANDIT_FIGHT");
	TA_Stand_Eating(0,0,3,0,"BANDIT_FIGHT");
	TA_Stand_Drinking(3,0,6,0,"BANDIT_FIGHT");
};

