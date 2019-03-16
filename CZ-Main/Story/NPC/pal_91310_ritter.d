
instance PAL_91310_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 91310;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	EquipItem(self,ItRw_Crossbow_M_02);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Ratford,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_91310;
};


func void rtn_start_91310()
{
	TA_Sit_Campfire(9,0,23,0,"NW_BIGFARM_CAMPON_31");
	TA_Sit_Campfire(23,0,9,0,"NW_BIGFARM_CAMPON_31");
};

func void rtn_inbattle_91310()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8629");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8629");
};

