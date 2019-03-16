
instance PAL_2000_HAGEN(Npc_Default)
{
	name[0] = "Лорд Хаген";
	guild = GIL_PAL;
	id = 2000;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2H_Blessed_03_Hagen);
	CreateInvItems(self,itke_hagen_secretkey,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_Tough_Okyl,BodyTex_N,ITAR_PAL_H_V2_NPC);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_2000;
};


func void Rtn_Start_2000()
{
	TA_Sit_Throne(8,0,23,0,"LGR_RATSHAUS_13_97");
	TA_Sit_Throne(23,0,8,0,"LGR_RATSHAUS_13_97");
};

func void rtn_tot_2000()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

