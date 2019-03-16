
instance VLK_6130_BENCHEL(Npc_Default)
{
	name[0] = "Бенчел";
	guild = GIL_VLK;
	id = 6130;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,itmi_blackbrendi,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Normal01,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = rtn_start_6130;
};


func void rtn_start_6130()
{
	TA_Smalltalk(8,0,23,0,"NW_BENCHELBANDITS_01");
	TA_Smalltalk(23,0,8,0,"NW_BENCHELBANDITS_01");
};

func void rtn_restafterfight_6130()
{
	TA_Stand_Drinking(8,0,22,0,"NW_BENCHELBANDITS_02");
	TA_Stand_Drinking(22,0,8,0,"NW_BENCHELBANDITS_02");
};

func void rtn_follow_6130()
{
	TA_Follow_Player(8,0,22,0,"NW_BENCHELBANDITS_01");
	TA_Follow_Player(22,0,8,0,"NW_BENCHELBANDITS_01");
};

func void rtn_RestInTavern_6130()
{
	TA_Stand_Drinking(8,0,22,0,"NW_BENCHELREST_02");
	TA_Sit_Bench(22,0,8,0,"NW_BENCHELREST_01");
};