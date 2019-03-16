
instance VLK_6008_DUGO(Npc_Default)
{
	name[0] = "Дюго";
	guild = GIL_OUT;
	id = 6008;
	voice = 8;
	flags = 0;
	aivar[93] = TRUE;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Bow_L_03);
	CreateInvItems(self,ItRw_Arrow,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart06,BodyTex_N,ITAR_ABORIGEN_CLOTHES);
	Mdl_SetModelFatness(self,1.2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,85);
	daily_routine = rtn_start_6008;
};


func void rtn_start_6008()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"WP_HUMAN_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"WP_HUMAN_01");
};

