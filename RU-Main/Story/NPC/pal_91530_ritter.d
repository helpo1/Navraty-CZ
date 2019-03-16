
instance PAL_91530_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 91530;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_91530;
};


func void rtn_start_91530()
{
	TA_Stand_ArmsCrossed(9,0,20,0,"NW_BIGFARM_CAMPON_69");
	TA_Stand_ArmsCrossed(20,0,9,0,"NW_BIGFARM_CAMPON_69");
};

func void rtn_inbattle_91530()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8740");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8740");
};

