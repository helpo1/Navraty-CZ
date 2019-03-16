
func void B_SetAttributesToChapter(var C_Npc slf,var int kap)
{
	Npc_SetTalentSkill(slf,NPC_TALENT_MAGE,6);

	if(kap == 0)
	{
		slf.level = 1;
		slf.attribute[ATR_STRENGTH] = 10 + Hlp_Random(10);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 50 + Hlp_Random(10);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 150 + Hlp_Random(25);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
	};
	if(kap == 1)
	{
		slf.level = 5;
		slf.attribute[ATR_STRENGTH] = 50 + Hlp_Random(15);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 75 + Hlp_Random(15);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 300 + Hlp_Random(50);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
	};
	if(kap == 2)
	{
		slf.level = 10;
		slf.attribute[ATR_STRENGTH] = 100 + Hlp_Random(20);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 100 + Hlp_Random(20);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 450 + Hlp_Random(75);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
	};
	if(kap == 3)
	{
		slf.level = 15;
		slf.attribute[ATR_STRENGTH] = 200 + Hlp_Random(25);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 150 + Hlp_Random(25);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 600 + Hlp_Random(100);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
	};
	if(kap == 4)
	{
		slf.level = 20;
		slf.attribute[ATR_STRENGTH] = 250 + Hlp_Random(30);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 200 + Hlp_Random(30);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 900 + Hlp_Random(150);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
	};
	if(kap == 5)
	{
		slf.level = 25;
		slf.attribute[ATR_STRENGTH] = 300 + Hlp_Random(35);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 250 + Hlp_Random(35);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 1200 + Hlp_Random(200);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
	};
	if(kap == 6)
	{
		slf.level = 30;
		slf.attribute[ATR_STRENGTH] = 350 + Hlp_Random(40);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 300 + Hlp_Random(40);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 1500 + Hlp_Random(250);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
	};
	if(kap == 7)
	{
		slf.level = 100;
		slf.attribute[ATR_STRENGTH] = 500 + Hlp_Random(45);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 350 + Hlp_Random(45);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 2500;
		slf.aivar[REAL_MANA_MAX] = 2500;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 5000 + Hlp_Random(1000);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
	};
	if(kap == 8)
	{
		slf.level = 500;
		slf.attribute[ATR_STRENGTH] = 500;
		slf.aivar[REAL_STRENGTH] = 500;
		slf.attribute[ATR_DEXTERITY] = 1000;
		slf.aivar[REAL_DEXTERITY] = 1000;
		slf.attribute[ATR_MANA_MAX] = 5000;
		slf.aivar[REAL_MANA_MAX] = 5000;
		slf.attribute[ATR_MANA] = 5000;
		slf.attribute[ATR_HITPOINTS_MAX] = 15000;
		slf.attribute[ATR_HITPOINTS] = 15000;
		slf.protection[PROT_POINT] = 1000;
	};
	if(kap == 9)
	{
		slf.level = 500;
		slf.attribute[ATR_STRENGTH] = 500;
		slf.aivar[REAL_STRENGTH] = 500;
		slf.attribute[ATR_DEXTERITY] = 1000;
		slf.aivar[REAL_DEXTERITY] = 1000;
		slf.attribute[ATR_MANA_MAX] = 5000;
		slf.aivar[REAL_MANA_MAX] = 5000;
		slf.attribute[ATR_MANA] = 5000;
		slf.attribute[ATR_HITPOINTS_MAX] = 15000;
		slf.attribute[ATR_HITPOINTS] = 15000;
		slf.protection[PROT_POINT] = 1000;
	};
	if(kap == 10)
	{
		slf.level = 15;
		slf.attribute[ATR_STRENGTH] = 200;
		slf.aivar[REAL_STRENGTH] = 200;
		slf.attribute[ATR_DEXTERITY] = 200;
		slf.aivar[REAL_DEXTERITY] = 200;
		slf.attribute[ATR_MANA_MAX] = 2500;
		slf.aivar[REAL_MANA_MAX] = 2500;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 1200;
		slf.attribute[ATR_HITPOINTS] = 1200;
		slf.protection[PROT_BLUNT] = 180;
		slf.protection[PROT_EDGE] = 180;
		slf.protection[PROT_POINT] = 180;
		slf.protection[PROT_FIRE] = 50;
		slf.protection[PROT_FLY] = 50;
		slf.protection[PROT_MAGIC] = 25;
	};
	if(kap == 11)
	{
		slf.level = 20;
		slf.attribute[ATR_STRENGTH] = 250;
		slf.aivar[REAL_STRENGTH] = 250;
		slf.attribute[ATR_DEXTERITY] = 250;
		slf.aivar[REAL_DEXTERITY] = 250;
		slf.attribute[ATR_MANA_MAX] = 2500;
		slf.aivar[REAL_MANA_MAX] = 2500;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 1500;
		slf.attribute[ATR_HITPOINTS] = 1500;
		slf.protection[PROT_BLUNT] = 200;
		slf.protection[PROT_EDGE] = 200;
		slf.protection[PROT_POINT] = 180;
		slf.protection[PROT_FIRE] = 50;
		slf.protection[PROT_FLY] = 50;
		slf.protection[PROT_MAGIC] = 25;
	};
	if(kap == 12)
	{
		slf.level = 30;
		slf.attribute[ATR_STRENGTH] = 300;
		slf.aivar[REAL_STRENGTH] = 300;
		slf.attribute[ATR_DEXTERITY] = 450;
		slf.aivar[REAL_DEXTERITY] = 450;
		slf.attribute[ATR_MANA_MAX] = 2500;
		slf.aivar[REAL_MANA_MAX] = 2500;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 1800;
		slf.attribute[ATR_HITPOINTS] = 1800;
		slf.protection[PROT_BLUNT] = 230;
		slf.protection[PROT_EDGE] = 230;
		slf.protection[PROT_POINT] = 180;
		slf.protection[PROT_FIRE] = 50;
		slf.protection[PROT_FLY] = 50;
		slf.protection[PROT_MAGIC] = 25;
	};
	if(kap == 13)
	{
		slf.level = 40;
		slf.attribute[ATR_STRENGTH] = 400;
		slf.aivar[REAL_STRENGTH] = 400;
		slf.attribute[ATR_DEXTERITY] = 450;
		slf.aivar[REAL_DEXTERITY] = 450;
		slf.attribute[ATR_MANA_MAX] = 2500;
		slf.aivar[REAL_MANA_MAX] = 2500;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 2200;
		slf.attribute[ATR_HITPOINTS] = 2200;
		slf.protection[PROT_BLUNT] = 250;
		slf.protection[PROT_EDGE] = 250;
		slf.protection[PROT_POINT] = 180;
		slf.protection[PROT_FIRE] = 50;
		slf.protection[PROT_FLY] = 50;
		slf.protection[PROT_MAGIC] = 25;
	};
	if(kap == 14)
	{
		slf.level = 50;
		slf.attribute[ATR_STRENGTH] = 450;
		slf.aivar[REAL_STRENGTH] = 450;
		slf.attribute[ATR_DEXTERITY] = 450;
		slf.aivar[REAL_DEXTERITY] = 450;
		slf.attribute[ATR_MANA_MAX] = 2500;
		slf.aivar[REAL_MANA_MAX] = 2500;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 3000;
		slf.attribute[ATR_HITPOINTS] = 3000;
		slf.protection[PROT_BLUNT] = 300;
		slf.protection[PROT_EDGE] = 300;
		slf.protection[PROT_POINT] = 180;
		slf.protection[PROT_FIRE] = 50;
		slf.protection[PROT_FLY] = 50;
		slf.protection[PROT_MAGIC] = 25;
	};
	if(kap == 55)
	{
		slf.level = 100;
		slf.attribute[ATR_STRENGTH] = 300;
		slf.aivar[REAL_STRENGTH] = 300;
		slf.attribute[ATR_DEXTERITY] = 450;
		slf.aivar[REAL_DEXTERITY] = 450;
		slf.attribute[ATR_MANA_MAX] = 2500;
		slf.aivar[REAL_MANA_MAX] = 2500;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 2500;
		slf.attribute[ATR_HITPOINTS] = 2500;
		slf.protection[PROT_FIRE] = 10;
		slf.protection[PROT_MAGIC] = 15;
	};
	if(kap == 56)
	{
		slf.level = 1000;
		slf.attribute[ATR_STRENGTH] = 500;
		slf.aivar[REAL_STRENGTH] = 500;
		slf.attribute[ATR_DEXTERITY] = 450;
		slf.aivar[REAL_DEXTERITY] = 450;
		slf.attribute[ATR_MANA_MAX] = 25000;
		slf.aivar[REAL_MANA_MAX] = 25000;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 25000;
		slf.attribute[ATR_HITPOINTS] = 25000;
		slf.protection[PROT_FIRE] = 10;
		slf.protection[PROT_MAGIC] = 15;
	};
	if(kap == 57)
	{
		slf.level = 1000;
		slf.attribute[ATR_STRENGTH] = 1000;
		slf.aivar[REAL_STRENGTH] = 1000;
		slf.attribute[ATR_DEXTERITY] = 450;
		slf.aivar[REAL_DEXTERITY] = 450;
		slf.attribute[ATR_MANA_MAX] = 5000;
		slf.aivar[REAL_MANA_MAX] = 5000;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 75000;
		slf.attribute[ATR_HITPOINTS] = 75000;
		slf.protection[PROT_BLUNT] = 400;
		slf.protection[PROT_EDGE] = 400;
		slf.protection[PROT_POINT] = 1000;
		slf.protection[PROT_FIRE] = 450;
		slf.protection[PROT_FLY] = 450;
		slf.protection[PROT_MAGIC] = 425;
	};
	if(kap == 58)
	{
		slf.level = 100;
		slf.attribute[ATR_STRENGTH] = 500;
		slf.aivar[REAL_STRENGTH] = 500;
		slf.attribute[ATR_DEXTERITY] = 250;
		slf.aivar[REAL_DEXTERITY] = 250;
		slf.attribute[ATR_MANA_MAX] = 6666;
		slf.aivar[REAL_MANA_MAX] = 6666;
		slf.attribute[ATR_MANA] = 6666;
		slf.attribute[ATR_HITPOINTS_MAX] = 5000;
		slf.attribute[ATR_HITPOINTS] = 5000;
	};
	if(kap == 333)
	{
		slf.level = 200;
		slf.attribute[ATR_STRENGTH] = 1000;
		slf.aivar[REAL_STRENGTH] = 1000;
		slf.attribute[ATR_DEXTERITY] = 1250;
		slf.aivar[REAL_DEXTERITY] = 1250;
		slf.attribute[ATR_MANA_MAX] = 6666;
		slf.aivar[REAL_MANA_MAX] = 6666;
		slf.attribute[ATR_MANA] = 6666;
		slf.attribute[ATR_HITPOINTS_MAX] = 25000;
		slf.attribute[ATR_HITPOINTS] = 25000;
	};
	if(kap == 555)
	{
		slf.level = 30;
		slf.attribute[ATR_STRENGTH] = 950 + Hlp_Random(40);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 950 + Hlp_Random(40);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 7654;
		slf.aivar[REAL_MANA_MAX] = 7654;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 3500 + Hlp_Random(250);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
		slf.protection[PROT_BLUNT] = 200;
		slf.protection[PROT_EDGE] = 200;
		slf.protection[PROT_POINT] = 180;
		slf.protection[PROT_FIRE] = 50;
		slf.protection[PROT_FLY] = 50;
		slf.protection[PROT_MAGIC] = 25;
	};
	if(kap == 556)
	{
		slf.level = 50;
		slf.attribute[ATR_STRENGTH] = 950;
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 950;
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_MANA_MAX] = 7654;
		slf.aivar[REAL_MANA_MAX] = 7654;
		slf.attribute[ATR_MANA] = 2500;
		slf.attribute[ATR_HITPOINTS_MAX] = 5000;
		slf.attribute[ATR_HITPOINTS] = 5000;
		slf.protection[PROT_BLUNT] = 300;
		slf.protection[PROT_EDGE] = 300;
		slf.protection[PROT_POINT] = 180;
		slf.protection[PROT_FIRE] = 50;
		slf.protection[PROT_FLY] = 50;
		slf.protection[PROT_MAGIC] = 25;
	};
	if(kap == 557)
	{
		slf.level = 50;
		slf.attribute[ATR_STRENGTH] = 10000;
		slf.aivar[REAL_STRENGTH] = 10000;
		slf.attribute[ATR_DEXTERITY] = 1000;
		slf.aivar[REAL_DEXTERITY] = 1000;
		slf.attribute[ATR_MANA_MAX] = 7654;
		slf.aivar[REAL_MANA_MAX] = 7654;
		slf.attribute[ATR_MANA] = 15000;
		slf.attribute[ATR_HITPOINTS_MAX] = 10000;
		slf.attribute[ATR_HITPOINTS] = 10000;
		slf.protection[PROT_BLUNT] = 400;
		slf.protection[PROT_EDGE] = 400;
		slf.protection[PROT_POINT] = 1000;
		slf.protection[PROT_FIRE] = 450;
		slf.protection[PROT_FLY] = 450;
		slf.protection[PROT_MAGIC] = 425;
	};
	if(kap == 666)
	{
		slf.level = 100;
		slf.attribute[ATR_STRENGTH] = 1000;
		slf.aivar[REAL_STRENGTH] = 1000;
		slf.attribute[ATR_DEXTERITY] = 1250;
		slf.aivar[REAL_DEXTERITY] = 1250;
		slf.attribute[ATR_MANA_MAX] = 6666;
		slf.aivar[REAL_MANA_MAX] = 6666;
		slf.attribute[ATR_MANA] = 6666;
		slf.attribute[ATR_HITPOINTS_MAX] = 50000;
		slf.attribute[ATR_HITPOINTS] = 50000;
	};
	if(kap == 777)
	{
		slf.level = 300;
		slf.attribute[ATR_STRENGTH] = 1500;
		slf.aivar[REAL_STRENGTH] = 1500;
		slf.attribute[ATR_DEXTERITY] = 800;
		slf.aivar[REAL_DEXTERITY] = 800;
		slf.attribute[ATR_MANA_MAX] = 6666;
		slf.aivar[REAL_MANA_MAX] = 6666;
		slf.attribute[ATR_MANA] = 6666;
		slf.attribute[ATR_HITPOINTS_MAX] = 75000;
		slf.attribute[ATR_HITPOINTS] = 75000;
	};
	if(kap == 100)
	{
		slf.level = 1000;
		slf.attribute[ATR_STRENGTH] = 2000;
		slf.aivar[REAL_STRENGTH] = 2000;
		slf.attribute[ATR_DEXTERITY] = 1000;
		slf.aivar[REAL_DEXTERITY] = 1000;
		slf.attribute[ATR_MANA_MAX] = 6666;
		slf.aivar[REAL_MANA_MAX] = 6666;
		slf.attribute[ATR_MANA] = 6666;
		slf.attribute[ATR_HITPOINTS_MAX] = 100000;
		slf.attribute[ATR_HITPOINTS] = 100000;
	};
	if(kap == 888)
	{
		slf.level = 0;
		slf.attribute[ATR_STRENGTH] = 1000;
		slf.aivar[REAL_STRENGTH] = 1000;
		slf.attribute[ATR_DEXTERITY] = 1250;
		slf.aivar[REAL_DEXTERITY] = 1250;
		slf.attribute[ATR_MANA_MAX] = 6666;
		slf.aivar[REAL_MANA_MAX] = 6666;
		slf.attribute[ATR_MANA] = 6666;
		slf.attribute[ATR_HITPOINTS_MAX] = 50000;
		slf.attribute[ATR_HITPOINTS] = 50000;
	};
	if((slf.guild == GIL_PAL) || (slf.guild == GIL_KDF))
	{
		slf.protection[PROT_FIRE] = 200;
	};

	slf.exp = 500 * ((slf.level + 1) / 2) * (slf.level + 1);
	slf.exp_next = 500 * ((slf.level + 2) / 2) * (slf.level + 1);

	slf.attribute[ATR_REGENERATEHP] = 100;
	slf.mission[0] = 100;
	slf.mission[1] = 100;
	slf.mission[2] = 100;
	slf.mission[3] = 100;

	if((slf.npcType == NPCTYPE_FRIEND) || (slf.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		Npc_SetAttitude(slf,ATT_FRIENDLY);
		Npc_SetTempAttitude(slf,ATT_FRIENDLY);
		slf.mission[4] = 3;
	}
	else
	{
		Npc_SetAttitude(slf,ATT_NEUTRAL);
		Npc_SetTempAttitude(slf,ATT_NEUTRAL);
		slf.mission[4] = 2;
	};
	if(slf.npcType == NPCTYPE_PALMORA)
	{
		slf.attribute[ATR_STRENGTH] = 500 + Hlp_Random(40);
		slf.aivar[REAL_STRENGTH] = slf.attribute[ATR_STRENGTH];
		slf.attribute[ATR_DEXTERITY] = 500 + Hlp_Random(40);
		slf.aivar[REAL_DEXTERITY] = slf.attribute[ATR_DEXTERITY];
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 2500 + Hlp_Random(500);
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
	};
};