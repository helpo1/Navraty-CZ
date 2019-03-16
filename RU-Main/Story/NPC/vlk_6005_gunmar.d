
instance VLK_6005_GUNMAR(Npc_Default)
{
	name[0] = "Гунмар";
	guild = GIL_OUT;
	id = 6005;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	EquipItem(self,ItRw_Bow_H_01);
	CreateInvItems(self,ItRw_Arrow,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,ITAR_ABORIGEN_ARMOR);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_6005;
};


func void rtn_start_6005()
{
	TA_Stand_Drinking(8,0,22,0,"SV_HUMAN_09");
	TA_Stand_ArmsCrossed(22,0,8,0,"SV_HUMAN_09");
};

