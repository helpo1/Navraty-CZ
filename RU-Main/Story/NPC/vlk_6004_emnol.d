
instance VLK_6004_EMNOL(Npc_Default)
{
	name[0] = "Эмнол";
	guild = GIL_OUT;
	id = 6004;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal02,BodyTex_N,ITAR_ABORIGEN_CLOTHES);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = rtn_start_6004;
};


func void rtn_start_6004()
{
	TA_Stand_Guarding(8,0,22,0,"SV_HUMAN_05");
	TA_Stand_Guarding(22,0,8,0,"SV_HUMAN_05");
};

