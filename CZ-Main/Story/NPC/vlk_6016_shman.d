
instance VLK_6016_SHMAN(Npc_Default)
{
	name[0] = "Lovec";
	guild = GIL_OUT;
	id = 6016;
	voice = 20;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Important_Arto,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6016;
};


func void rtn_start_6016()
{
	TA_Sit_Campfire(9,0,12,0,"SV_HUMAN_15");
	TA_Sit_Campfire(12,0,9,0,"SV_HUMAN_15");
};

