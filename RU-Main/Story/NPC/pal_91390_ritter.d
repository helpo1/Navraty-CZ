
instance PAL_91390_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 91390;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_Crossbow_M_02);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Tough_Torrez,BodyTex_P,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_91390;
};


func void rtn_start_91390()
{
	TA_Stand_Guarding(9,0,23,0,"NW_BIGFARM_CAMPON_39");
	TA_Stand_Guarding(23,0,9,0,"NW_BIGFARM_CAMPON_39");
};

func void rtn_inbattle_91390()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8635");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8635");
};

