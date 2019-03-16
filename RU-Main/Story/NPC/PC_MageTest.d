
instance PC_MageTest(Npc_Default)
{
	name[0] = "Magiefuzzi";
	npcType = npctype_main;
	guild = GIL_NONE;
	level = 30;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 400;
	attribute[ATR_MANA] = 400;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	exp = 500 * ((level + 1) / 2) * (level + 1);
	exp_next = 500 * ((level + 2) / 2) * (level + 1);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_Player,0,"Hum_Head_Pony",Face_N_Player,0,ItAr_PAl_H);
	B_SetFightSkills(self,30);
	EquipItem(self,ItMw_2h_Pal_Sword);
};

