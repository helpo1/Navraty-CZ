
var int AntiPaladinTalkcount;

func void B_AssignORC_AntiPaladinTalk(var C_Npc Antipaladin)
{
	if(hero.guild == GIL_PAL)
	{
		if(AntiPaladinTalkcount == 0)
		{
			AI_Output(self,other,"DIA_ORC_AntiPaladin_18_01");	//KHROKGNAR! Pán říkal, že velký paladin přijde! Pán mít pravdu! Pán mít vždy pravdu!
			AI_Output(self,other,"DIA_ORC_AntiPaladin_18_02");	//My vůdci hrdých skřetích armád přicházet zničit paladiny!
			AI_Output(self,other,"DIA_ORC_AntiPaladin_18_03");	//My zabít Hagen a jeho paladiny! Ani ty nepomoci jim!
			B_GivePlayerXP(XP_Ambient);
		}
		else if(AntiPaladinTalkcount == 1)
		{
			AI_Output(self,other,"DIA_ORC_AntiPaladin_18_04");	//Pán říká my přinést mu hlavu velký paladin. Nyní ty zemřít. KHROKGNAR!
		}
		else if(AntiPaladinTalkcount == 2)
		{
			AI_Output(self,other,"DIA_ORC_AntiPaladin_18_05");	//Vůdci jdou zabít tě, válečník.
		}
		else
		{
			AI_Output(self,other,"DIA_ORC_AntiPaladin_18_06");	//KHROKGNAR! My zabít tě velký paladin.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_PreHello_01_03");	//DABAP KAHAR ROG GAK KHA BAK.
	};

	AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
	TalkedTo_AntiPaladin = TRUE;
	Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
	AI_StopProcessInfos(Antipaladin);
	Npc_SetRefuseTalk(Antipaladin,20);
};

