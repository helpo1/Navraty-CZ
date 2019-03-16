
instance PIR_6145_BRENDIK(Npc_Default)
{
	name[0] = "Brendik";
	guild = GIL_PIR;
	id = 6145;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	level = 12;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Asghan,BodyTex_N,ITAR_PIR_M_Addon);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = rtn_start_6145;
};


func void rtn_start_6145()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"ADW_BRENDIK_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"ADW_BRENDIK_01");
};

func void rtn_gocamp_6145()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"ADW_PIRATECAMP_BEACH_BRENDIK");
	TA_Smoke_Joint(23,0,8,0,"ADW_PIRATECAMP_BEACH_03");
};

func void rtn_tot_6145()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};

