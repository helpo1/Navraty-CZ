
instance VLK_6006_KARDOR(Npc_Default)
{
	name[0] = "Kardor";
	guild = GIL_OUT;
	id = 6006;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	EquipItem(self,ItRw_Bow_M_01);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_ImportantGrey,BodyTex_N,ITAR_ABORIGEN_CLOTHES);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_6006;
};


func void rtn_start_6006()
{
	TA_Practice_Sword(8,0,22,0,"WP_HUMAN_21");
	TA_Stand_ArmsCrossed(22,0,8,0,"WP_HUMAN_21");
};

