
instance BDT_10019_Addon_Wache(Npc_Default)
{
	name[0] = NAME_Addon_Guard;
	guild = GIL_BDT;
	id = 10019;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Schwert3);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Normal01,BodyTex_N,ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_Start_10019;
};


func void Rtn_Start_10019()
{
	TA_Stand_WP(0,0,12,0,"BL_UP_PLACE_04 ");
	TA_Stand_WP(12,0,0,0,"BL_UP_PLACE_04");
};

