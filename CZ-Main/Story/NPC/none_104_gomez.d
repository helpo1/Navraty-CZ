
instance NONE_104_GOMEZ(Npc_Default)
{
	name[0] = "Duch Gomeze";
	guild = GIL_NONE;
	id = 104;
	voice = 11;
	flags = NPC_FLAG_GHOST | NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_NoFightParker] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Gomez,BodyTex_N,itar_gomez_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_SetModelScale(self,1.1,1,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_104;
};


func void rtn_start_104()
{
	TA_Ghost(8,0,23,0,"OC_EBR_DARK_ROOM_IN");
	TA_Ghost(23,0,8,0,"OC_EBR_DARK_ROOM_IN");
};

func void rtn_tot_104()
{
	TA_Ghost(8,0,23,0,"TOT");
	TA_Ghost(23,0,8,0,"TOT");
};

