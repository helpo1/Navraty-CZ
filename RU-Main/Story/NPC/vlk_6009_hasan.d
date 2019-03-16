
instance VLK_6009_HASAN(Npc_Default)
{
	name[0] = "Хасан";
	guild = GIL_OUT;
	id = 6009;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Zweihaender2);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart20,BodyTex_N,ITAR_ABORIGEN_CLOTHES);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_6009;
};


func void rtn_start_6009()
{
	TA_Stand_Guarding(8,0,20,0,"SV_HUMAN_08");
	TA_Stand_Eating(20,0,8,0,"SV_HUMAN_03");
};

