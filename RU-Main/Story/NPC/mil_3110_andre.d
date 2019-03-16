
instance MIL_3110_ANDRE(Npc_Default)
{
	name[0] = "Лорд Андре";
	guild = GIL_PAL;
	id = 3110;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak12,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_3110;
};


func void rtn_start_3110()
{
	TA_Stand_ArmsCrossed(0,0,12,0,"FP_ANDRE");
	TA_Stand_ArmsCrossed(12,0,0,0,"FP_ANDRE");
};

func void rtn_tot_3110()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

