
instance VLK_6001_GILLIMOR(Npc_Default)
{
	name[0] = "Гиллимор";
	guild = GIL_OUT;
	id = 6001;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Mil_Sword);
	EquipItem(self,ItRw_Bow_L_02);
	CreateInvItems(self,ItRw_Arrow,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Normal01,BodyTex_B,ITAR_ABORIGEN_ARMOR);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_6001;
};


func void rtn_start_6001()
{
	TA_Stand_Eating(8,0,22,0,"SV_HUMAN_13");
	TA_Stand_Drinking(22,0,8,0,"SV_HUMAN_13");
};

