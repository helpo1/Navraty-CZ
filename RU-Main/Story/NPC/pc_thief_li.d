
instance PC_THIEF_LI(Npc_Default)
{
	name[0] = "Диего";
	guild = GIL_NONE;
	id = 8057;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	level = 1;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_diego_degen);
	EquipItem(self,itrw_diego_bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_8057;
};


func void rtn_start_8057()
{
	TA_Sit_Campfire(6,0,17,0,"LI_MAN_01");
	TA_Sit_Campfire(17,0,6,0,"LI_MAN_01");
};

func void rtn_runaway_8057()
{
	TA_Sit_Bench(8,0,23,0,"SHIP_CREW_04");
	TA_Sit_Bench(23,0,8,0,"SHIP_CREW_04");
};

