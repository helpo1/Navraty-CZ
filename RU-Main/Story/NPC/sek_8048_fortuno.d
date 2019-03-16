
instance SEK_8048_FORTUNO(Npc_Default)
{
	name[0] = "Фортуно";
	guild = GIL_SEK;
	id = 8048;
	voice = 13;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	CreateInvItems(self,ItMi_Joint,5);
	CreateInvItems(self,ItPl_SwampHerb,3);
	CreateInvItems(self,ItPl_Mushroom_01,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Fortuno,BodyTex_T,itar_sekbed);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,75);
	daily_routine = rtn_start_8048;
};


func void rtn_start_8048()
{
	TA_Sit_Bench(7,0,22,30,"NW_PSICAMP_12");
	TA_Smoke_Joint(22,30,7,0,"NW_PSICAMP_FORTUNO");
};

func void rtn_campon_8048()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_19");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_19");
};

func void rtn_inbattle_8048()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8656");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8656");
};

