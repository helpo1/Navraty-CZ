
instance SLD_806_Sylvio(Npc_Default)
{
	name[0] = "Sylvio";
	guild = GIL_SLD;
	id = 806;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Scar,BodyTex_N,ITAR_SLD_U);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_806;
};

func void Rtn_Start_806()
{
	TA_Sit_Chair(9,0,12,0,"NW_BIGFARM_KITCHEN_BULLCO");
	TA_Stand_ArmsCrossed(12,0,16,0,"NW_BIGFARM_SOVET_HAGEN");
	TA_Stand_Eating(16,0,20,0,"NW_BRET");
	TA_Sleep(20,0,9,0,"NW_BIGFARM_HOUSE_UP2_05_SYLVIO");
};

func void Rtn_Tot_806()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

