
instance PAL_6101_RITTER(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_BDT;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	id = 6101;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_PALMORA;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword_Etlu);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Tough_Okyl,BodyTex_N,ITAR_PAL_H_V1_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_6101;
};


func void rtn_start_6101()
{
	TA_Potion_Alchemy(8,0,16,0,"INSEL_BAUERNHAUS_194");
	TA_Sit_Throne(16,0,21,0,"INSEL_BAUERNHAUS_148");
	TA_Sleep(21,0,8,0,"INSEL_BAUERNHAUS_195");
};

