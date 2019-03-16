
instance GUR_8003_TYON(Npc_Default)
{
	name[0] = "Идол Тион";
	guild = GIL_GUR;
	id = 8003;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	level = 1;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_IDOLTYON,BodyTex_N,ITAR_GUR_H);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_8003;
};


func void rtn_start_8003()
{
	TA_Potion_Alchemy(9,0,20,0,"NW_PSICAMP_TION");
	TA_Sleep(20,0,9,0,"NW_PSICAMP_SLEEP_10");
};

func void rtn_campon_8003()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_GURU_02");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_GURU_02");
};

func void rtn_inbattle_8003()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8685");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8685");
};

