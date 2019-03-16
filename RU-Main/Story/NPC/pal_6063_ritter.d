
instance PAL_6063_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_BDT;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	id = 6063;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_PALMORA;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword_Etlu);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_Tough02,BodyTex_L,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_6063;
};


func void rtn_start_6063()
{
	TA_Rake_FP(7,20,18,40,"INSEL_DORF_135");
	TA_Roast_Scavenger(18,40,7,20,"INSEL_DORF_101");
};

