
instance VLK_447_Cassia(Npc_Default)
{
	name[0] = "Кассия";
	guild = GIL_OUT;
	id = 447;
	voice = 16;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_Gender] = FEMALE;
	B_SetAttributesToChapter(self,5);
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 20;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Meisterdegen);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_XhiefGuildKey_Hotel_MIS,1);
	CreateInvItems(self,ItKe_ThiefTreasure,1);
	Mdl_SetVisual(self,"SRN_GLM.MDS"); 
	Mdl_SetVisualBody(self,"SRNGLM_BODY_NAKED0",5,0,"SRN_HEAD_HAIR2",1,0,ITAR_CASSIA_ARMOR);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	Mdl_SetModelFatness(self,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_447;
};

func void Rtn_Start_447()
{
	TA_Sit_Throne(7,0,23,0,"NW_CITY_KANAL_ROOM_CASSIA");
	TA_Sit_Throne(23,0,7,0,"NW_CITY_KANAL_ROOM_CASSIA");
};

