
instance PAL_9158_VARUS(Npc_Default)
{
	name[0] = "Лорд Варус";
	guild = GIL_PAL;
	id = 9158;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_MM_RestEnd] = TRUE;
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
	daily_routine = rtn_start_9158;
};


func void rtn_start_9158()
{
	TA_Sit_Trone(8,0,23,0,"LGR_RATSHAUS_13_97");
	TA_Sit_Trone(23,0,8,0,"LGR_RATSHAUS_13_97");
};

func void rtn_hagen_9158()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"FP_NEARHAGEN");
	TA_Stand_ArmsCrossed(20,0,8,0,"FP_NEARHAGEN");
};

func void rtn_tot_9158()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

