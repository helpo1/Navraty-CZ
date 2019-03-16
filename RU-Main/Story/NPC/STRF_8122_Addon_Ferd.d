
instance STRF_8122_Addon_Ferd(Npc_Default)
{
	name[0] = "Ферд";
	guild = GIL_STRF;
	id = 8122;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	EquipItem(self,ItMw_StoneHammer);
	fight_tactic = FAI_HUMAN_COWARD;
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_B_Normal01,BodyTex_B,ItAr_OrcMine_Slave);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_8122;
};

func void Rtn_Start_8122()
{
	TA_Pick_Iron(8,0,23,0,"RT_MINE_8122");
	TA_Pick_Iron(23,0,8,0,"RT_MINE_8122");
};

func void Rtn_Tot_8122()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};