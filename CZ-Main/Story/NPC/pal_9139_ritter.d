
instance PAL_9139_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9139;
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
	daily_routine = rtn_start_9139;
};


func void rtn_start_9139()
{
	TA_Smalltalk(8,0,21,0,"LGR_VERSAMMLUNGSHALLE_09");
	TA_Smalltalk(8,0,21,0,"LGR_VERSAMMLUNGSHALLE_09");
};

func void rtn_hunt_9139()
{
	TA_Stand_ArmsCrossed(8,0,21,0,"LGR_HUNTPALADIN_01");
	TA_Smalltalk(8,0,21,0,"LGR_VERSAMMLUNGSHALLE_09");
};

func void rtn_tot_9139()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

