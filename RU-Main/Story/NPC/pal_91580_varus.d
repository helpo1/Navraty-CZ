
instance PAL_91580_VARUS(Npc_Default)
{
	name[0] = "Лорд Варус";
	guild = GIL_PAL;
	id = 91580;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	aivar[93] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_Normal01,BodyTex_P,itar_pal_h_v2_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_91580;
};


func void rtn_start_91580()
{
	TA_Stand_ArmsCrossed(9,0,20,0,"NW_BIGFARM_SOVET_VARUS");
	TA_Sit_Throne(20,0,9,0,"NW_BIGFARM_CAMPON_48");
};

func void rtn_inbattle_91580()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8715");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8715");
};

