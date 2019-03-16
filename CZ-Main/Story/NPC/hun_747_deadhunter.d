
instance HUN_747_DEADHUNTER(Npc_Default)
{
	name[0] = "Mrtvý lovec";
	guild = GIL_OUT;
	id = 747;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,3);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,itar_leather_unick);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = rtn_start_747;
};


func void rtn_start_747()
{
	TA_Stand_WP(8,0,23,0,"NW_TROLLAREA_DEADHUNTER_02");
	TA_Stand_WP(23,0,8,0,"NW_TROLLAREA_DEADHUNTER_02");
};

