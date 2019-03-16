
instance VLK_6012_SHMAN(Npc_Default)
{
	name[0] = "Охотник";
	guild = GIL_OUT;
	id = 6012;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Thief",Face_L_NormalBart01,BodyTexBabe_N,ItAr_ShValley_Armor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6012;
};


func void rtn_start_6012()
{
	TA_Sit_Campfire(9,0,12,0,"SV_HUMAN_19");
	TA_Sit_Campfire(12,0,9,0,"SV_HUMAN_19");
};

