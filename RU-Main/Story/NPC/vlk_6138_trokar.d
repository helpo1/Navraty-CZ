
instance VLK_6138_TROKAR(Npc_Default)
{
	name[0] = "Трокар";
	guild = GIL_NONE;
	id = 6138;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Sword_L_03);
	EquipItem(self,ItRw_Bow_L_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,ITAR_Leather_NPC);
	CreateInvItems(self,ItRw_Arrow,1);
	CreateInvItems(self,ITAR_Leather_L,1);
	CreateInvItems(self,itri_trokarring,1);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = rtn_start_6138;
};

func void rtn_start_6138()
{
	TA_Stand_Guarding(8,0,22,0,"NW_FOREST_PATH_04_16_MONSTER2");
	TA_Stand_Guarding(22,0,8,0,"NW_FOREST_PATH_04_16_MONSTER2");
};

