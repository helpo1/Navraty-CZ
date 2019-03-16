
instance PAL_6104_RITTER(Npc_Default)
{
	name[0] = "Lord Urtus, vůdce paladinů";
	guild = GIL_BDT;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	id = 6104;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_PALMORA;
	aivar[AIV_DropDeadAndKill] = TRUE;
	B_SetAttributesToChapter(self,14);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword_Etlu);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_P_NormalBart_Nefarius,BodyTex_P,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_prestart_6104;
};


func void rtn_prestart_6104()
{
	TA_Read_Bookstand(8,0,22,0,"INSEL_BAUERNHAUS_154");
	TA_Sleep(22,0,8,0,"INSEL_BAUERNHAUS_157");
};

