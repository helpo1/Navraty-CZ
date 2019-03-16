
instance STRF_8125_Addon_Nuts(Npc_Default)
{
	name[0] = "Nuts";
	guild = GIL_STRF;
	id = 8125;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_NoFightParker] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Herek,BodyTex_N,ItAr_OrcMine_Slave);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_8125;
};

func void Rtn_Start_8125()
{
	TA_Pick_Iron(8,0,23,0,"RT_MINE_8125");
	TA_Pick_Iron(23,0,8,0,"RT_MINE_8125");
};

func void Rtn_Rest_8125()
{
	TA_Sit_Campfire(8,0,23,0,"RT_MINE_8125");
	TA_Sit_Campfire(23,0,8,0,"RT_MINE_8125");
};

func void Rtn_Tot_8125()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};