
instance PC_Levelinspektor(Npc_Default)
{
	name[0] = "Фу...читер!!! ";
	npcType = npctype_main;
	flags = NPC_FLAG_GHOST;
	guild = GIL_NONE;
	level = 30;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 400;
	attribute[ATR_MANA] = 400;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_Player,0,"Hum_Head_Pony",Face_N_Player,0,ItAr_PAl_H);
	B_SetFightSkills(self,100);
	EquipItem(self,ItMw_ShortSword3);
	EquipItem(self,ItRw_Bow_L_01);
};

