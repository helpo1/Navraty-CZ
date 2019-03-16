
instance VLK_6019_SHMAN(Npc_Default)
{
	name[0] = "Охотник";
	guild = GIL_OUT;
	id = 6019;
	voice = 18;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Mace_L_03);
	EquipItem(self,ItRw_Bow_L_03);
	CreateInvItems(self,ItRw_Arrow,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal01,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6019;
};


func void rtn_start_6019()
{
	TA_Stand_Drinking(8,0,22,0,"SV_HUMAN_12");
	TA_Stand_ArmsCrossed(22,0,8,0,"SV_HUMAN_12");
};

