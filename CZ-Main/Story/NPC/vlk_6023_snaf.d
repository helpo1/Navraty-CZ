
instance VLK_6023_SNAF(Npc_Default)
{
	name[0] = "Snaf";
	guild = GIL_VLK;
	id = 6023;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItFo_Addon_LousHammer,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Snaf,BodyTex_N,ITAR_Barkeeper);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = rtn_start_6023;
};


func void rtn_start_6023()
{
	TA_Stand_ArmsCrossed(8,0,11,0,"NW_CITY_KARDIF");
	TA_Stand_Sweeping(11,0,13,0,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
	TA_Stand_ArmsCrossed(13,0,16,0,"NW_CITY_KARDIF");
	TA_Stand_Sweeping(16,0,8,0,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
};

