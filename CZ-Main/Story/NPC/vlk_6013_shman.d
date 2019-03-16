
instance VLK_6013_SHMAN(Npc_Default)
{
	name[0] = "Lovec";
	guild = GIL_OUT;
	id = 6013;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_P_OldMan_Gravo,BodyTex_P,ItAr_ShValley_Armor);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6013;
};


func void rtn_start_6013()
{
	TA_Stand_Drinking(8,0,22,0,"SV_HUMAN_06");
	TA_Stand_ArmsCrossed(22,0,8,0,"SV_HUMAN_06");
};

