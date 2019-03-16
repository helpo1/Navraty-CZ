
instance VLK_6120_LEMARGUARD(Npc_Default)
{
	name[0] = "Lehmarův osobní strážce";
	guild = GIL_VLK;
	id = 6120;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Krummschwert);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",1,0,ITAR_SLD_U);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_6120;
};


func void rtn_start_6120()
{
	TA_Stand_Guarding(6,30,20,30,"NW_CITY_LEMAR_KILL_GUARD");
	TA_Stand_Guarding(20,30,0,30,"NW_CITY_LEMAR_KILL_GUARD_2");
	TA_Stand_Drinking(0,30,6,30,"NW_CITY_LEMAR_KILL_GUARD");
};

func void rtn_TOT_6120()
{
	TA_Stand_WP(6,0,23,0,"TOT");
	TA_Stand_WP(23,0,6,0,"TOT");
};