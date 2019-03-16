
instance VLK_6018_SHMAN(Npc_Default)
{
	name[0] = "Охотник";
	guild = GIL_OUT;
	id = 6018;
	voice = 20;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Erpresser,BodyTex_N,ItAr_ShValley_Armor);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6018;
};


func void rtn_start_6018()
{
	TA_Stand_Drinking(8,0,22,0,"SV_HUMAN_04");
	TA_Stand_ArmsCrossed(22,0,8,0,"SV_HUMAN_04");
};

