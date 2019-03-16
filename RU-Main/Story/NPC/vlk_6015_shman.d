
instance VLK_6015_SHMAN(Npc_Default)
{
	name[0] = "Охотник";
	guild = GIL_OUT;
	id = 6015;
	voice = 19;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Mace_L_03);
	EquipItem(self,ItRw_Bow_L_03);
	CreateInvItems(self,ItRw_Arrow,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_L_NormalBart02,BodyTex_L,ITAR_Leather_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6015;
};


func void rtn_start_6015()
{
	TA_Sit_Campfire(9,0,12,0,"SV_HUMAN_17");
	TA_Sit_Campfire(12,0,9,0,"SV_HUMAN_17");
};

