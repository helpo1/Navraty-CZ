
instance VLK_6007_RUEN(Npc_Default)
{
	name[0] = "Ruen";
	guild = GIL_OUT;
	id = 6007;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMW_Addon_Hacker_1h_01);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,ITAR_ABORIGEN_ARMOR);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_6007;
};


func void rtn_start_6007()
{
	TA_Stand_Guarding(8,0,22,0,"SV_HUMAN_02");
	TA_Stand_Eating(22,0,8,0,"SV_HUMAN_02");
};

