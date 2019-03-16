
instance VLK_6002_BAGRUS(Npc_Default)
{
	name[0] = "Багрус";
	guild = GIL_OUT;
	id = 6002;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	EquipItem(self,ItRw_Bow_L_04);
	CreateInvItems(self,ItRw_Arrow,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Gilbert,BodyTex_P,ITAR_ABORIGEN_CLOTHES);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_6002;
};


func void rtn_start_6002()
{
	TA_Stand_Guarding(8,0,22,0,"SV_HUMAN_11");
	TA_Stand_Drinking(22,0,8,0,"SV_HUMAN_11");
};

