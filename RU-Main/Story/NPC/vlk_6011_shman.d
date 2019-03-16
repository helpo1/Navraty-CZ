
instance VLK_6011_SHMAN(Npc_Default)
{
	name[0] = "Охотник";
	guild = GIL_OUT;
	id = 6011;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Mace_L_03);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	EquipItem(self,ItRw_Bow_L_03);
	CreateInvItems(self,ItRw_Arrow,10);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_L_Tough02,BodyTex_L,ITAR_Prisoner);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_6011;
};


func void rtn_start_6011()
{
	TA_Sit_Campfire(9,0,12,0,"SV_HUMAN_14");
	TA_Sit_Campfire(12,0,9,0,"SV_HUMAN_14");
};

