
instance PIR_13540_ADDON_HENRY(Npc_Default)
{
	name[0] = "Henry";
	guild = GIL_PAL;
	id = 13540;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal01,BodyTex_P,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_13540;
};


func void rtn_start_13540()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_PIR_03");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_PIR_03");
};

func void rtn_inbattle_13540()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8703");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8703");
};

func void rtn_ship_13540()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_DECK_31");
	TA_Stand_Guarding(23,0,8,0,"SHIP_DECK_31");
};

