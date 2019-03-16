
instance NOV_600_PEDRO_LI(Npc_Default)
{
	name[0] = "Pedro";
	guild = GIL_NONE;
	id = 8052;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_PSIONIC",Face_L_Normal_GorNaBar,BodyTex_L,ItAr_NOV_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	daily_routine = rtn_start_8052;
};


func void rtn_start_8052()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_DECK_05");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

