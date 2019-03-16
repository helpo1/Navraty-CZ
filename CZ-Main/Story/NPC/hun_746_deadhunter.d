
instance HUN_746_DEADHUNTER(Npc_Default)
{
	name[0] = "Mrtvý lovec";
	guild = GIL_OUT;
	id = 746;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_L_01);
	CreateInvItems(self,ItRw_Bolt,4);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Richter,BodyTex_N,ITAR_Leather_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = rtn_start_746;
};


func void rtn_start_746()
{
	TA_Stand_WP(8,0,23,0,"NW_TROLLAREA_DEADHUNTER_01");
	TA_Stand_WP(23,0,8,0,"NW_TROLLAREA_DEADHUNTER_01");
};

