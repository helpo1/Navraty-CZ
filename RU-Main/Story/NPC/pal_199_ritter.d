
instance PAL_199_RITTER(Npc_Default)
{
	name[0] = NAME_Torwache;
	guild = GIL_PAL;
	id = 199;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_NewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak05,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	CreateInvItems(self,itke_fort,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_199;
};


func void rtn_start_199()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_FORESTFORT_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_FORESTFORT_01");
};

