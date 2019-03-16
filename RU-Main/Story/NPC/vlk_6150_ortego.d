
instance VLK_6150_ORTEGO(Npc_Default)
{
	name[0] = "Ортего";
	guild = GIL_OUT;
	id = 6150;
	voice = 13;
	flags = FALSE;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_Piratensaebel);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,itar_dht_m);
	Mdl_SetModelFatness(self,1.1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	CreateInvItems(self,itwr_ortegoletter,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_6150;
};


func void rtn_start_6150()
{
	TA_Sit_Campfire(7,0,22,0,"NW_CITY_SMFOREST_BANDIT_02");
	TA_Sit_Campfire(22,0,7,0,"NW_CITY_SMFOREST_BANDIT_02");
};

