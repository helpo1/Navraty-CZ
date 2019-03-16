
instance VLK_6017_SHMAN(Npc_Default)
{
	name[0] = "Охотник";
	guild = GIL_OUT;
	id = 6017;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Bow_L_03);
	CreateInvItems(self,ItRw_Arrow,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal02,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6017;
};


func void rtn_start_6017()
{
	TA_Sit_Campfire(9,0,12,0,"SV_HUMAN_18");
	TA_Sit_Campfire(12,0,9,0,"SV_HUMAN_18");
};

