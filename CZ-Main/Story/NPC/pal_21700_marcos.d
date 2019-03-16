
instance PAL_21700_MARCOS(Npc_Default)
{
	name[0] = "Marcos";
	guild = GIL_PAL;
	id = 21700;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_02);
	EquipItem(self,ItRw_PAL_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	CreateInvItems(self,ItPo_Health_03,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Tough_Rodriguez,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = rtn_start_21700;
};


func void rtn_start_21700()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"PLFT_MARCOS");
	TA_Stand_ArmsCrossed(21,0,8,0,"PLFT_MARCOS");
};

func void rtn_tot_21700()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

