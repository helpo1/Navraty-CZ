
instance PAL_9108_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9108;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart_Grim,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9108;
};


func void rtn_start_9108()
{
	TA_Stand_ArmsCrossed(8,0,14,0,"LGR_KREUZUNG_01");
	TA_Stand_ArmsCrossed(14,0,20,0,"LGR_HAUS01_01");
	TA_Stand_ArmsCrossed(20,0,2,0,"LGR_EINGANG_04");
	TA_Stand_ArmsCrossed(2,0,8,0,"LGR_ZUFLUCHT_02");
};

func void rtn_tot_9108()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

