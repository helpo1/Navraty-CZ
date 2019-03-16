
instance PAL_6061_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_BDT;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	id = 6061;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_PALMORA;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_NewsOverride] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword_Etlu);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak05,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_6061;
};


func void rtn_start_6061()
{
	TA_Rake_FP(6,0,22,0,"INSEL_DORF_138");
	TA_Sit_Campfire(22,0,6,0,"INSEL_DORF_102");
};

