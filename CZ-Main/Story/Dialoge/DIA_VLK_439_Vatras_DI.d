/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(6x) CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)

*/



instance DIA_Vatras_DI_EXIT(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 999;
	condition = DIA_Vatras_DI_EXIT_Condition;
	information = DIA_Vatras_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Vatras_DI_HEAL(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_HEAL_Condition;
	information = DIA_Vatras_DI_HEAL_Info;
	permanent = TRUE;
	description = "Vyleč mě.";
};


func int DIA_Vatras_DI_HEAL_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_HEAL_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_HEAL_15_00");	//Vyleč mě.

	if(DIA_Vatras_DI_PEDROTOT_VatrasSucked == FALSE)
	{
		if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
		{
			AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_01");	//Adanos mu žehnej, bude to on, kdo udrží rovnováhu mezi světy.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_02");	//Vždyť nejsi zraněn...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Běž mi z očí vrahu! A žádnou další pomoc ode mě nečekej.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Vatras_DI_TRADE(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 12;
	condition = DIA_Vatras_DI_TRADE_Condition;
	information = DIA_Vatras_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Můžeš mi něco prodat?";
};

func int DIA_Vatras_DI_TRADE_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//Můžeš mi něco prodat?

	if(DIA_Vatras_DI_PEDROTOT_VatrasSucked == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_TRADE_05_01");	//Tak co potřebuješ?
		B_GiveTradeInv(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Běž mi z očí vrahu! A žádnou další pomoc ode mě nečekej.
		AI_StopProcessInfos(self);
	};	
};


instance DIA_Vatras_DI_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 35;
	condition = DIA_Vatras_DI_OBSESSION_Condition;
	information = DIA_Vatras_DI_OBSESSION_Info;
	permanent = TRUE;
	description = "Pomoz mi, jsem posedlý!";
};


func int DIA_Vatras_DI_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Vatras_DI_OBSESSION_Info_OneTime;

func void DIA_Vatras_DI_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_OBSESSION_15_00");	//Pomoz mi, jsem posedlý!

	if(DIA_Vatras_DI_PEDROTOT_VatrasSucked == FALSE)
	{
		if(Got_HealObsession_Day <= (Wld_GetDay() - 2))
		{
			if(DIA_Vatras_DI_OBSESSION_Info_OneTime <= 1)
			{
				CreateInvItems(self,ItPo_HealObsession_MIS,1);
				DIA_Vatras_DI_OBSESSION_Info_OneTime = DIA_Vatras_DI_OBSESSION_Info_OneTime + 1;
			};
			if(Npc_HasItems(self,ItPo_HealObsession_MIS))
			{
				AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_01");	//Vezmi si tenhle lektvar Vykoupení. Pyrokar mi dal několik těch léčivých lektvarů pro vlastní potřebu.
				AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//Nicméně vždycky pamatuj: moje prostředky na zbavení těch nočních můr jsou velmi omezené.
				B_GiveInvItems(self,other,ItPo_HealObsession_MIS,1);
				Got_HealObsession_Day = Wld_GetDay();
			}
			else
			{
				AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_03");	//Pyrokarovy zásoby jsou vyčerpány. Je mi opravdu líto, příteli. Už ti nemůžu nijak pomoct.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_04");	//Nevezmu si na svědomí, dát ti další lahvičku po tak krátké době. Vrať se později, příteli.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Běž mi z očí vrahu! A žádnou další pomoc ode mě nečekej.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Vatras_DI_RAT(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_RAT_Condition;
	information = DIA_Vatras_DI_RAT_Info;
	description = "Co mi můžeš dát za radu?";
};

func int DIA_Vatras_DI_RAT_Condition()
{
	if((UndeadDragonIsDead == FALSE) && (SC_IsObsessed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_RAT_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_RAT_15_00");	//Co mi můžeš dát za radu?
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_01");	//Drž se od Pátračů dál. Pamatuj, že ti jejich černý pohled tady, daleko od kláštera, může způsobit vážné obtíže.
	if(Npc_HasItems(other,ItAm_Prot_BlackEye_Mis))
	{
		AI_Output(other,self,"DIA_Vatras_DI_RAT_15_02");	//Nic se neděje, mám amulet na ochranu před jejich zrakem.
	};
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_03");	//Kdyby se ti přesto cokoli stalo, přijď za mnou. Uvidíme, co se dá dělat.
};


instance DIA_Vatras_DI_PEDROTOT(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 3;
	condition = DIA_Vatras_DI_PEDROTOT_Condition;
	information = DIA_Vatras_DI_PEDROTOT_Info;
	description = "Našel jsem toho zrádce Pedra.";
};

func int DIA_Vatras_DI_PEDROTOT_Condition()
{
	if((MIS_Gorax_KillPedro == LOG_SUCCESS) || (PEDROWITHUS == TRUE))
	{
		return TRUE;
	};
};


var int DIA_Vatras_DI_PEDROTOT_VatrasSucked;

func void DIA_Vatras_DI_PEDROTOT_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_00");	//Našel jsem toho zrádce Pedra.
	B_GivePlayerXP(XP_Ambient);

	if((MIS_Gorax_KillPedro == LOG_SUCCESS) && Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_01");	//Je mrtvý.
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_02");	//Jsem opravdu zklamán. Tohle jsem si o tobě nemyslel.
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_03");	//Co tím myslíš?
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_04");	//Vím o tvé odporné dohodě se Serpentesem. Jsem hluboce otřesen tím, jak jsem se nakonec v tobě zmýlil.
		DIA_Vatras_DI_PEDROTOT_VatrasSucked = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_05");	//Tak ho přiveď sem na palubu. Předáme ho úřadům v Khorinisu.

		if(Npc_IsDead(Pedro_DI))
		{
			AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_06");	//Teď už je trochu pozdě. Je mrtvý.
			AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_07");	//(překvapeně) Ó, to je politováníhodné. Budu se modlit za jeho nebohou duši.
		}
		else
		{
			if(MIS_Gorax_KillPedro == LOG_Running)
			{
				AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_05_08");	//Mám nyní malý problém.
				AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_09");	//Problém?! Hmm... Jestli myslíš to, co chtěl Serpentes, zapomeň na to.
				AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_05_10");	//Co?! Jak to víš?
				AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_11");	//Vím o tom, ale budeš jednat lépe, když ho nezabiješ.
				AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_05_12");	//Ale co by na to řekli mágové Ohně?!
				AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_13");	//Neboj, promluvím se Serpentesem.
				AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_05_14");	//Tak dobře.

				if((PEDROWITHUS == TRUE) && (MIS_Gorax_KillPedro == LOG_Running))
				{
					B_GivePlayerXP(500);
					MIS_Gorax_KillPedro = LOG_SUCCESS;
					Log_SetTopicStatus(Topic_Gorax_KillPedro,LOG_SUCCESS);
					B_LogEntry(Topic_Gorax_KillPedro,"Vatras mi řekl, že bych neměl zabíjet Pedra a tu věc se Serpentesem vyřeší on.");

					if(MIS_TraitorPedro == LOG_Running)
					{
						MIS_TraitorPedro = LOG_SUCCESS;
						Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_SUCCESS);
					};
				};
			};
		};
	};
};

instance DIA_Vatras_DI_Talente(C_Info)
{
	npc = VLK_439_Vatras_DI;
	condition = DIA_Vatras_DI_Talente_Condition;
	information = DIA_Vatras_DI_Talente_Info;
	permanent = TRUE;
	description = "Nauč mě něco ze svých schopností.";
};

func int DIA_Vatras_DI_Talente_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_Talente_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//Nauč mě něco ze svých schopností.

	if(DIA_Vatras_DI_PEDROTOT_VatrasSucked == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//Udělám, co bude v mých silách.
		Info_ClearChoices(DIA_Vatras_DI_Talente);
		Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);

		if((hero.guild == GIL_KDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
		{
			Info_AddChoice(DIA_Vatras_DI_Talente,"Kruhy magie",DIA_Vatras_DI_Talente_CIRCLES);
		};

		Info_AddChoice(DIA_Vatras_DI_Talente,"Alchymie",DIA_Vatras_DI_Talente_ALCHIMIE);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Běž mi z očí vrahu! A žádnou další pomoc ode mě nečekej.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Vatras_DI_Talente_CIRCLES()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1) && (CanLearnMagicCircleNext_ABCZ(1) == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString("1. kruh magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,1)),DIA_Vatras_DI_Talente_Circle_1);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (CanLearnMagicCircleNext_ABCZ(2) == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString("2. kruh magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2)),DIA_Vatras_DI_Talente_Circle_2);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (CanLearnMagicCircleNext_ABCZ(3) == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString("3. kruh magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,3)),DIA_Vatras_DI_Talente_Circle_3);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (CanLearnMagicCircleNext_ABCZ(4) == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString("4. kruh magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,4)),DIA_Vatras_DI_Talente_Circle_4);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (CanLearnMagicCircleNext_ABCZ(5) == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString("5. kruh magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,5)),DIA_Vatras_DI_Talente_Circle_5);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && (CanLearnMagicCircleNext_ABCZ(6) == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString("6. kruh magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,6)),DIA_Vatras_DI_Talente_Circle_6);
	};
};

func void DIA_Vatras_DI_Talente_ALCHIMIE()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Vatras_DI_Talente_POTION_Health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Extrakt hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Vatras_DI_Talente_POTION_Health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Elixír hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Vatras_DI_Talente_POTION_Health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Vatras_DI_Talente_POTION_Mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Vatras_DI_Talente_POTION_Mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Elixír many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Vatras_DI_Talente_POTION_Mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Lektvar rychlosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Vatras_DI_Talente_POTION_Speed);
	}
	else if(PLAYER_TALENT_ALCHEMY[15] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Dvojitý lektvar rychlosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED_02)),dia_vatras_di_talente_potion_speed_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Elixír síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Vatras_DI_Talente_POTION_Perm_STR);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Elixír obratnosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Vatras_DI_Talente_POTION_Perm_DEX);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Elixír ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Vatras_DI_Talente_POTION_Perm_Mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,b_buildlearnstringforalchemy("Elixír života",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Vatras_DI_Talente_POTION_Perm_Health);
	};
};

func void DIA_Vatras_DI_Talente_Circle_1()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,1);
};

func void DIA_Vatras_DI_Talente_Circle_2()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,2);
};

func void DIA_Vatras_DI_Talente_Circle_3()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,3);
};

func void DIA_Vatras_DI_Talente_Circle_4()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,4);
};

func void DIA_Vatras_DI_Talente_Circle_5()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//Stal ses mágem pátého kruhu. Používej své vědomosti s rozvahou.
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,5);
};

func void DIA_Vatras_DI_Talente_Circle_6()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//Právě jsi získal přístup k nejvyšším magickým vědomostem.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//Nech se vést rozumem a ovládej své lidské slabosti. Jinak ti mohou zastřít zrak.
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self,other,6);
};

func void DIA_Vatras_DI_Talente_POTION_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Vatras_DI_Talente_POTION_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Vatras_DI_Talente_POTION_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void DIA_Vatras_DI_Talente_POTION_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Vatras_DI_Talente_POTION_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Vatras_DI_Talente_POTION_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Vatras_DI_Talente_POTION_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
};

func void dia_vatras_di_talente_potion_speed_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_SPEED_02);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void DIA_Vatras_DI_Talente_BACK()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
};

instance DIA_Vatras_DI_DementorObsessionBook(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_DementorObsessionBook_Condition;
	information = DIA_Vatras_DI_DementorObsessionBook_Info;
	permanent = TRUE;
	description = "Mám tady Almanach prokletých.";
};

func int DIA_Vatras_DI_DementorObsessionBook_Condition()
{
	if(Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};


var int DIA_Vatras_DI_DementorObsessionBook_OneTime;

func void DIA_Vatras_DI_DementorObsessionBook_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_DementorObsessionBook_15_00");	//Mám tady Almanach prokletých.
	if(DIA_Vatras_DI_DementorObsessionBook_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_01");	//Hm. Mám dojem, že bude lepší, když ho vezmu Pyrokarovi do kláštera, jestli se tedy odsud ještě někdy dostaneme.
		DIA_Vatras_DI_DementorObsessionBook_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_02");	//Máš jich víc? Přines mi všechno, co najdeš.
	};

	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	Npc_RemoveInvItems(self,ITWR_DementorObsessionBook_MIS,Npc_HasItems(self,ITWR_DementorObsessionBook_MIS));
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Vatras_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 99;
	condition = DIA_Vatras_DI_UndeadDragonDead_Condition;
	information = DIA_Vatras_DI_UndeadDragonDead_Info;
	permanent = FALSE;
	description = "Dokázal jsem to!";
};

func int DIA_Vatras_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

var int DIA_Vatras_DI_UndeadDragonDead_OneTime;

func void DIA_Vatras_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_00");	//Dokázal jsem to!

	if(DIA_Vatras_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_01");	//Já vím, cítím to.
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_02");	//Zasadil jsi Beliarovi ránu, ze které se jen tak nedostane.

		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_03");	//Můžu teď odejít, nebo máte vy mágové v zásobě ještě nějaký kostlivce, co potřebujou opustit tenhle svět?
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_04");	//Zlo si vždycky najde způsob, jak se dostat na tenhle svět. Válka nikdy neskončí.
		};

		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_05");	//Ale měj na paměti, že to byla jen pouhá epizoda z věčné války mezi dobrem a zlem.

		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_06");	//Jako válečník dobra bys to měl vědět.
		};

		AI_Output(self,other,"DIA_Vatras_Add_05_15");	//Jenom Adanos stojí mezi válčícími bohy a udržuje rovnováhu!
		AI_Output(other,self,"DIA_Vatras_Add_15_16");	//Mohl mi pomoct...
		AI_Output(self,other,"DIA_Vatras_Add_05_17");	//On tak udělal, věř mi!
		DIA_Vatras_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_09");	//Řekni kapitánovi ať zvedne kotvy!
};
