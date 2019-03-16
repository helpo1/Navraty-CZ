
instance VLK_6003_NOFELD(Npc_Default)
{
	name[0] = "Nofeld";
	guild = GIL_OUT;
	id = 408;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_P_NormalBart01,BodyTex_P,ITAR_ABORIGEN_CLOTHES);
	Mdl_SetModelFatness(self,1.2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_6003;
};


func void rtn_start_6003()
{
	TA_Play_Lute(8,0,22,0,"SV_HUMAN_16");
	TA_Stand_Eating(22,0,8,0,"SV_HUMAN_16");
};

