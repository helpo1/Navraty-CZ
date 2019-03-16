
instance GUR_8002_ORUN(Npc_Default)
{
	name[0] = "Идол Оран";
	guild = GIL_GUR;
	id = 8002;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",FACE_N_IDOLORUN,BodyTex_N,itar_gur_oran);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	bodyStateInterruptableOverride = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_8002;
};

func void rtn_start_8002()
{
	TA_Read_Bookstand(8,0,23,0,"NW_PSICAMP_ORAN");
	TA_Sleep(23,0,8,0,"NW_PSICAMP_SLEEP_09");
};

func void rtn_campon_8002()
{
	TA_Smalltalk(9,0,23,0,"NW_BIGFARM_CAMPON_PSI_GURU_01");
	TA_Smalltalk(23,0,9,0,"NW_BIGFARM_CAMPON_PSI_GURU_01");
};

func void rtn_inbattle_8002()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8686");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8686");
};

func void rtn_fleefrombattle_8002()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

