
instance GUR_8036_NAMIB(Npc_Default)
{
	name[0] = "Идол Намиб";
	guild = GIL_GUR;
	id = 8036;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	level = 1;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	Mdl_SetVisual(self,"HUMANS.MDS");
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_IDOLNAMIB,BodyTex_N,ITAR_GUR_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_8036;
};


func void rtn_start_8036()
{
	ta_preach_parvez(10,0,18,0,"NW_PSICAMP_NAMIB");
	TA_Sit_Bench(18,0,21,0,"NW_PSICAMP_08_SIT");
	TA_Sleep(21,0,10,0,"NW_PSICAMP_SLEEP_08");
};

func void rtn_campon_8036()
{
	TA_Stand_ArmsCrossed(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_GURU_04");
	TA_Stand_ArmsCrossed(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_GURU_04");
};

func void rtn_inbattle_8036()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8683");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8683");
};

