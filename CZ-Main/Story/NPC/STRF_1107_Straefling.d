
instance STRF_1107_Straefling(Npc_Default)
{
	name[0] = "Cliff";
	guild = GIL_STRF;
	id = 1107;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_OCMAIN;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart04,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,0);
	EquipItem(self,ItMw_StoneHammer);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1107;
};

func void Rtn_Start_1107()
{
	TA_Cook_Cauldron(8,0,23,0,"OC_EBR_KITCHEN_COOK");
	TA_Cook_Cauldron(23,0,8,0,"OC_EBR_KITCHEN_COOK");
};

func void rtn_goforestbase_1107()
{
	TA_Follow_Player(8,0,22,0,"OC_EBR_KITCHEN_COOK");
	TA_Follow_Player(22,0,8,0,"OC_EBR_KITCHEN_COOK");
};

func void rtn_stayincamp_1107()
{
	TA_Roast_Scavenger(8,0,10,0,"WP_COAST_BASE_BARBQ");
	TA_Stand_Eating(10,0,11,0,"WP_COAST_BASE_20");
	TA_Stand_Drinking(11,0,11,20,"WP_COAST_BASE_20");
	TA_Sit_Bench(11,20,17,0,"WP_COAST_BASE_02");
	TA_Sit_Campfire(17,0,8,0,"WP_COAST_BASE_20");
};

func void Rtn_DracarBoard_1107()
{
	TA_Cook_Cauldron(8,0,23,0,"DRAKAR_SHIP_04");
	TA_Stand_Eating(23,0,8,0,"DRAKAR_SHIP_04");
};