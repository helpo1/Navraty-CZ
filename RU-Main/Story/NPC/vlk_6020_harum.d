
instance VLK_6020_HARUM(Npc_Default)
{
	name[0] = "Эльваис";
	guild = GIL_OUT;
	id = 6020;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Raven,BodyTex_N,ItAr_Wizard_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = rtn_start_6020;
};


func void rtn_start_6020()
{
	TA_Read_Bookstand(8,0,21,0,"SV_HUMAN_20");
	TA_Read_Bookstand(21,0,8,0,"SV_HUMAN_20");
};

