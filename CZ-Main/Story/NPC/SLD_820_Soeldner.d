
instance SLD_820_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 820;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Normal01,BodyTex_P,itar_sld_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_820;
};


func void Rtn_Start_820()
{
	TA_Stand_Guarding(4,0,21,0,"NW_BIGFARM_HOUSE_OUT_03");
	TA_WacheFackel(21,0,4,0,"NW_BIGFARM_HOUSE_OUT_03");
};

func void rtn_inbattle_820()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8654");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8654");
};

