
instance VLK_989_REINAR(Npc_Default)
{
	name[0] = "Reinar";
	guild = GIL_VLK;
	id = 989;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_Ratford,BodyTex_L,ITAR_Vlk_SH);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_989;
};


func void rtn_start_989()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_CITY_REINAR");
	TA_Sit_Chair(22,0,8,0,"NW_CITYHALL_UPSTAIRS_02");
};

