func int B_CountStealMoney(var C_Npc pStealedNpc)
{
	var int CsMoney;

	if((pStealedNpc.guild == GIL_NONE) || (pStealedNpc.guild == GIL_OUT) || (pStealedNpc.guild == GIL_SEK) || (pStealedNpc.guild == GIL_NOV))
	{
		CsMoney = 5 + Hlp_Random(20);
	}
	else if((pStealedNpc.guild == GIL_BAU) || (pStealedNpc.guild == GIL_VLK))
	{
		CsMoney = 10 + Hlp_Random(20);
	}	
	else if((pStealedNpc.guild == GIL_SLD) || (pStealedNpc.guild == GIL_MIL) || (pStealedNpc.guild == GIL_PIR) || (pStealedNpc.guild == GIL_BDT))
	{
		CsMoney = 20 + Hlp_Random(20);
	}
	else if((pStealedNpc.guild == GIL_DJG) || (pStealedNpc.guild == GIL_TPL))
	{
		CsMoney = 30 + Hlp_Random(20);
	}
	else if(pStealedNpc.guild == GIL_PAL)
	{
		CsMoney = 50 + Hlp_Random(20);
	}
	else if((pStealedNpc.guild == GIL_KDF) || (pStealedNpc.guild == GIL_KDW) || (pStealedNpc.guild == GIL_GUR))
	{
		CsMoney = 80 + Hlp_Random(20);
	}
	else
	{
		CsMoney = 1 + Hlp_Random(5);
	};

	return CsMoney;
};

instance DIA_Addon_GivePotion(C_Info)
{
	nr = 777;
	condition = DIA_Addon_GivePotion_Condition;
	information = DIA_Addon_GivePotion_Info;
	permanent = TRUE;
	description = "(дать лечебное зелье)";
};

func int DIA_Addon_GivePotion_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.flags != NPC_FLAG_IMMORTAL))
	{
		if((Npc_HasItems(other,ItPo_Health_01) >= 1) || (Npc_HasItems(other,ItPo_Health_02) >= 1) || (Npc_HasItems(other,ItPo_Health_03) >= 1))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void DIA_Addon_GivePotion_Info()
{
	Info_ClearChoices(DIA_Addon_GivePotion);
	Info_AddChoice(DIA_Addon_GivePotion,Dialog_Back,DIA_Addon_GivePotion_BACK);

	if(Npc_HasItems(other,ItPo_Health_03) >= 1)
	{
		Info_AddChoice(DIA_Addon_GivePotion,"...дать эликсир лечения.",DIA_Addon_GivePotion_ItPo_Health_03);
	};
	if(Npc_HasItems(other,ItPo_Health_02) >= 1)
	{
		Info_AddChoice(DIA_Addon_GivePotion,"...дать экстракт лечения.",DIA_Addon_GivePotion_ItPo_Health_02);
	};
	if(Npc_HasItems(other,ItPo_Health_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_GivePotion,"...дать эссенцию лечения.",DIA_Addon_GivePotion_ItPo_Health_01);
	};
};

func void B_Addon_DrinkPotion()
{
	AI_Output(other,self,"DIA_Addon_Brandon_GivePotion_15_00");	//Вот, возьми это лечебное зелье.
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		if(Npc_HasItems(self,ItPo_Health_03) > 0)
		{
			B_UseItem(self,ItPo_Health_03);
		}
		else if(Npc_HasItems(self,ItPo_Health_02) > 0)
		{
			B_UseItem(self,ItPo_Health_02);
		}
		else if(Npc_HasItems(self,ItPo_Health_01) > 0)
		{
			B_UseItem(self,ItPo_Health_01);
		};
	};
	Info_ClearChoices(DIA_Addon_GivePotion);
};

func void DIA_Addon_GivePotion_BACK()
{
	Info_ClearChoices(DIA_Addon_GivePotion);
};

func void DIA_Addon_GivePotion_ItPo_Health_03()
{
	B_GiveInvItems(other,self,ItPo_Health_03,1);
	B_Addon_DrinkPotion();
};

func void DIA_Addon_GivePotion_ItPo_Health_02()
{
	B_GiveInvItems(other,self,ItPo_Health_02,1);
	B_Addon_DrinkPotion();
};

func void DIA_Addon_GivePotion_ItPo_Health_01()
{
	B_GiveInvItems(other,self,ItPo_Health_01,1);
	B_Addon_DrinkPotion();
};

func void B_Addon_GivePotion(var C_Npc slf)
{
	DIA_Addon_GivePotion.npc = Hlp_GetInstanceID(slf);
};

instance DIA_ADDON_GOWITHME(C_Info)
{
	nr = 776;
	condition = dia_addon_gowithme_condition;
	information = dia_addon_gowithme_info;
	permanent = TRUE;
	description = "Мы атакуем!";
};

func int dia_addon_gowithme_condition()
{
	if((self.aivar[96] == TRUE) && (self.aivar[97] == FALSE) && (PALADINATTACK == TRUE) && (CASTLEISFREE == FALSE))
	{
		if((self.guild == GIL_DJG) && (DGJJOINPALADIN == TRUE))
		{
			return TRUE;
		};
		if(self.guild == GIL_PAL)
		{
			return TRUE;
		};
	};
};

func void dia_addon_gowithme_info()
{
	AI_Output(other,self,"DIA_Addon_GoWithMe_01_00");	//Мы атакуем!
	AI_Output(self,other,"DIA_Addon_GoWithMe_01_01");	//Хорошо, как скажешь.
	AI_StopProcessInfos(self);
	self.aivar[97] = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"Follow");
};

func void b_addon_gowithme(var C_Npc slf)
{
	dia_addon_gowithme.npc = Hlp_GetInstanceID(slf);
};

instance DIA_Addon_Steal(C_Info)
{
	nr = 923;
	condition = DIA_Addon_Steal_Condition;
	information = DIA_Addon_Steal_Info;
	permanent = TRUE;
	description = "(Попытаться украсть кошелек)";
};

func int DIA_Addon_Steal_Condition()
{
	if((self.npcType == npctype_friend) || (self.flags == NPC_FLAG_XARADRIM) || (self.flags == NPC_FLAG_IMMORTAL) || (self.guild == GIL_KDM) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8147_Dagrag)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8148_Gunnok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8149_Turuk)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8150_UrTrok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8151_Umrak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8152_UrTak)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2153_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2154_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2155_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2156_Fighter)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_2157_Fighter)) || (self.guild == GIL_DMT) || (self.aivar[90] == TRUE) || (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON) || (other.aivar[AIV_MM_RestEnd] == TRUE))
	{
		return FALSE;
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (bNewSteal[0] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Steal_Info()
{
	var int sChance;
	var int sChanceProc;
	var string concatText;

	if(other.attribute[ATR_DEXTERITY] < self.attribute[ATR_DEXTERITY])
	{	
		sChance = self.attribute[ATR_DEXTERITY] - other.attribute[ATR_DEXTERITY];

		if(sChance >= 100)
		{
			sChanceProc = 0;
		}
		else
		{
			sChanceProc = 100 - sChance;
		};
	}
	else
	{
		sChanceProc = 100;
	};
	if((sChanceProc < 100) && (PickPocketBonusCount > 0))
	{
		sChanceProc = sChanceProc + (PickPocketBonusCount / 20);

		if(sChanceProc > 100)
		{
			sChanceProc = 100;
		};
	};

	concatText = ConcatStrings(DIALOG_PICKPOCKET_NEW,IntToString(sChanceProc));
	concatText = ConcatStrings(concatText,"%)");

	Info_ClearChoices(DIA_Addon_Steal);
	Info_AddChoice(DIA_Addon_Steal,Dialog_Back,DIA_Addon_Steal_Back);
	Info_AddChoice(DIA_Addon_Steal,concatText,DIA_Addon_Steal_DoIt);
};

func void DIA_Addon_Steal_Back()
{
	Info_ClearChoices(DIA_Addon_Steal);
};

func void DIA_Addon_Steal_DoIt()
{
	var int sMoney;
	var int sExp;
	var int sChance;
	var int sChanceProc;
	var int daynow;

	daynow = Wld_GetDay();

	if(other.attribute[ATR_DEXTERITY] < self.attribute[ATR_DEXTERITY])
	{	
		sChance = self.attribute[ATR_DEXTERITY] - other.attribute[ATR_DEXTERITY];

		if(sChance >= 100)
		{
			sChanceProc = 0;
		}
		else
		{
			sChanceProc = 100 - sChance;
		};
	}
	else
	{
		sChanceProc = 100;
	};
	if((sChanceProc < 100) && (PickPocketBonusCount > 0))
	{
		sChanceProc = sChanceProc + (PickPocketBonusCount / 20);
	};

	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if(sChanceProc >= (1 + Hlp_Random(99)))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};

		Snd_Play("Geldbeutel");
		sMoney = B_CountStealMoney(self);
		PickPocketBonusCount += 1;
		B_GiveInvItems(self,other,ItMi_Gold,sMoney);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;

		if(PickPocketBonusCount > 10)
		{
			sExp = (self.attribute[ATR_DEXTERITY] / 10) + (PickPocketBonusCount / 10);
		}
		else
		{
			sExp = self.attribute[ATR_DEXTERITY] / 10;
		};

		B_GivePlayerXP(sExp);

		if(OverallBonusThief < (10 * Kapitel))
		{
			CountThiefOverallBonus += 1;

			if(CountThiefOverallBonus >= 15)
			{
				B_RaiseAttribute_Bonus(hero,ATR_DEXTERITY,1);
				CountThiefOverallBonus = FALSE;
				OverallBonusThief += 1;
			};
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void B_Addon_Steal(var C_Npc slf)
{
	DIA_Addon_Steal.npc = Hlp_GetInstanceID(slf);
};