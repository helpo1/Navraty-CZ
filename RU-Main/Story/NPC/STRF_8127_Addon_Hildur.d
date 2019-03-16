
instance STRF_8127_Addon_Hildur(Npc_Default)
{
	name[0] = "Хильдур";
	guild = GIL_STRF;
	id = 8127;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Gilbert,BodyTex_N,ITAR_Smith);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_8127;
};

func void Rtn_Start_8127()
{
	TA_Smith_Fire(7,0,22,0,"RT_MINE_8127");
	TA_Sleep(22,0,7,0,"OM_LEVEL_02_PRAD_SLEEP");
};

func void Rtn_Tot_8127()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};