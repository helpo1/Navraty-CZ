/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(3x) CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)

*/



var int dia_addon_vatras_pissoffforevver_li_onetime;
var int trd_vatli;

instance DIA_VATRAS_LI_EXIT(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 999;
	condition = dia_vatras_li_exit_condition;
	information = dia_vatras_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_vatras_li_exit_condition()
{
	return TRUE;
};

func void dia_vatras_li_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VATRAS_LI_HEAL(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 99;
	condition = dia_vatras_li_heal_condition;
	information = dia_vatras_li_heal_info;
	permanent = TRUE;
	description = "Vyleč mě.";
};

func int dia_vatras_li_heal_condition()
{
	return TRUE;
};

func void dia_vatras_li_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_HEAL_15_00");	//Vyleč mě.

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
};


instance DIA_VATRAS_LI_TRADE(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 12;
	condition = dia_vatras_li_trade_condition;
	information = dia_vatras_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Můžeš mi něco prodat?";
};


func int dia_vatras_li_trade_condition()
{
	return TRUE;
};

func void dia_vatras_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//Můžeš mi něco prodat?
	AI_Output(self,other,"DIA_Vatras_DI_TRADE_05_01");	//Tak co potřebuješ?

	if(TRD_VATLI != TRUE)
	{
		CreateInvItems(self,ItPo_HealObsession_MIS,2);
		CreateInvItems(self,ItPl_Temp_Herb,4);
		CreateInvItems(self,ItSc_LightHeal,2);
		CreateInvItems(self,ItSc_Zap,2);
		CreateInvItems(self,ItSc_Icebolt,2);
		CreateInvItems(self,itsc_sumicegol,2);
		CreateInvItems(self,ItSc_Icelance,5);
		CreateInvItems(self,ItSc_LightningFlash,1);
		CreateInvItems(self,ItSc_TrfScavenger,1);
		CreateInvItems(self,ItSc_IceWave,2);
		CreateInvItems(self,ItPo_Health_03,10);
		CreateInvItems(self,ItPo_Mana_02,12);
		CreateInvItems(self,ItPo_Mana_03,10);
		TRD_VATLI = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_VATRAS_LI_VATRASSUCKED(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 1;
	condition = dia_vatras_li_vatrassucked_condition;
	information = dia_vatras_li_vatrassucked_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_vatras_li_vatrassucked_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Vatras_DI_PEDROTOT_VatrasSucked == TRUE) && (VATRASFORGIVENME == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_li_vatrassucked_info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Běž mi z očí, ty vrahu. Nemůžeš už ode mě očekávat absolutně žádnou pomoc.
	AI_Output(other,self,"DIA_Vatras_DI_VatrasSucked_05_10");	//Po všem co jsem udělal - mě nyní neposloucháš?!
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_11");	//Ano, tvé skutky jsou velké! Ale teď jsi udělal hrozné věci.
	AI_Output(other,self,"DIA_Vatras_DI_VatrasSucked_05_12");	//Ale hodně lidí dělá velké omily.
	AI_Output(other,self,"DIA_Vatras_DI_VatrasSucked_05_13");	//Odpust mi, mistře, chtěl bych tě požádat o milost.
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_14");	//To není tak lehké, synu.
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_15");	//Přirozeně já ti odpustit mohu, ale jak ti může tvé činy odpustit Adanos?!
	AI_Output(other,self,"DIA_Vatras_DI_VatrasSucked_05_16");	//Chtěl bych si vysloužit odpuštění.
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_17");	//Nužě... (vážně) Doufám, že tvá slova jsou pravdivá, jak říkáš!
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_18");	//Dobrá považuj to za odpuštěné, nechť tě bohové soudí za tvé činy.
	VATRASFORGIVENME = TRUE;
};

instance DIA_VATRAS_LI_TALENTE(C_Info)
{
	npc = vlk_439_vatras_li;
	condition = dia_vatras_li_talente_condition;
	information = dia_vatras_li_talente_info;
	permanent = TRUE;
	description = "Nauč mě něco ze svých schopností.";
};

func int dia_vatras_li_talente_condition()
{
	return TRUE;
};

func void dia_vatras_li_talente_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//Nauč mě něco ze svých schopností.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//Udělám, co bude v mých silách.
	Info_ClearChoices(dia_vatras_li_talente);
	Info_AddChoice(dia_vatras_li_talente,Dialog_Back,dia_vatras_li_talente_back);
	if((hero.guild == GIL_KDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
	{
		Info_AddChoice(dia_vatras_li_talente,"Kruhy magie",dia_vatras_li_talente_circles);
	};

	Info_AddChoice(dia_vatras_li_talente,"Alchymie",dia_vatras_li_talente_alchimie);
};

func void dia_vatras_li_talente_circles()
{
	Info_ClearChoices(dia_vatras_li_talente);
	Info_AddChoice(dia_vatras_li_talente,Dialog_Back,dia_vatras_li_talente_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (CanLearnMagicCircleNext_ABCZ(4) == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,B_BuildLearnString("4. kruh magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,4)),dia_vatras_li_talente_circle_4);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (CanLearnMagicCircleNext_ABCZ(5) == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,B_BuildLearnString("5. kruh magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,5)),dia_vatras_li_talente_circle_5);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && (CanLearnMagicCircleNext_ABCZ(6) == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,B_BuildLearnString("6. kruh magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,6)),dia_vatras_li_talente_circle_6);
	};
};

func void dia_vatras_li_talente_alchimie()
{
	Info_ClearChoices(dia_vatras_li_talente);
	Info_AddChoice(dia_vatras_li_talente,Dialog_Back,dia_vatras_li_talente_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),dia_vatras_li_talente_potion_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Extrakt hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),dia_vatras_li_talente_potion_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Elixír hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),dia_vatras_li_talente_potion_health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),dia_vatras_li_talente_potion_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),dia_vatras_li_talente_potion_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Elixír many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),dia_vatras_li_talente_potion_mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Lektvar rychlosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),dia_vatras_li_talente_potion_speed);
	}
	else if(PLAYER_TALENT_ALCHEMY[15] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Dvojitý lektvar rychlosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED_02)),dia_vatras_di_talente_potion_speed_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Elixír síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),dia_vatras_li_talente_potion_perm_str);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Elixír obratnosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),dia_vatras_li_talente_potion_perm_dex);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Elixír ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),dia_vatras_li_talente_potion_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Elixír života",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),dia_vatras_li_talente_potion_perm_health);
	};
};

func void dia_vatras_li_talente_circle_4()
{
	Info_ClearChoices(dia_vatras_li_talente);
	B_TeachMagicCircle(self,other,4);
};

func void dia_vatras_li_talente_circle_5()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//Stal ses mágem pátého kruhu. Používej své vědomosti s rozvahou.
	Info_ClearChoices(dia_vatras_li_talente);
	B_TeachMagicCircle(self,other,5);
};

func void dia_vatras_li_talente_circle_6()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//Právě jsi získal přístup k nejvyšším magickým vědomostem.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//Nech se vést rozumem a ovládej své lidské slabosti. Jinak ti mohou zastřít zrak.
	Info_ClearChoices(dia_vatras_li_talente);
	B_TeachMagicCircle(self,other,6);
};

func void dia_vatras_li_talente_potion_health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void dia_vatras_li_talente_potion_health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void dia_vatras_li_talente_potion_health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void dia_vatras_li_talente_potion_mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void dia_vatras_li_talente_potion_mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void dia_vatras_li_talente_potion_mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void dia_vatras_li_talente_potion_speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
};

func void dia_vatras_li_talente_potion_speed_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_SPEED_02);
};

func void dia_vatras_li_talente_potion_perm_str()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void dia_vatras_li_talente_potion_perm_dex()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};

func void dia_vatras_li_talente_potion_perm_mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void dia_vatras_li_talente_potion_perm_health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void dia_vatras_li_talente_back()
{
	Info_ClearChoices(dia_vatras_li_talente);
};

instance DIA_ADDON_VATRAS_LI_MISSMYGOLD(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 2;
	condition = dia_addon_vatras_li_missmygold_condition;
	information = dia_addon_vatras_li_missmygold_info;
	permanent = FALSE;
	description = "Nevíš kam se po té bouři podělo mé zlato?";
};


func int dia_addon_vatras_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LI_MissMyGold_01_01");	//Nevíš kam se po té bouři podělo mé zlato?
	AI_Output(self,other,"DIA_Addon_Vatras_LI_MissMyGold_01_02");	//To není vědění pro mě synu... (vážně) Opravdu mě to ani nezajímá...
	B_LogEntry(TOPIC_MISSMYGOLD,"Přirozeně, Vatras nic neví o ztrátě mého zlata.");
};


instance DIA_ADDON_VATRAS_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 2;
	condition = dia_addon_vatras_li_findmagicorecave_condition;
	information = dia_addon_vatras_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem jeskyni plnou magické rudy.";
};


func int dia_addon_vatras_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LI_FindMagicOreCave_01_01");	//Našel jsem jeskyni plnou magické rudy.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_FindMagicOreCave_01_02");	//Opravdu?!... (udiveně) to bys o tom měl říct kapitánovi.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_FindMagicOreCave_01_03");	//Myslím, že ho to bude velice zajímat.
	GOTOORECAPITAN = TRUE;
};


instance DIA_ADDON_VATRAS_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 2;
	condition = dia_addon_vatras_li_changecourse_condition;
	information = dia_addon_vatras_li_changecourse_info;
	permanent = FALSE;
	description = "Potřebuji tvou radu.";
};


func int dia_addon_vatras_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_01_00");	//Potřebuji tvou radu.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_01_01");	//Jak ti můžu pomoct můj synu?
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_01_02");	//Měli bychom vymyslet co s rudou nalezenou na ostrově.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_01_03");	//Hmmm... (zamyšleně) A co si o tom myslíš ty?
	Info_ClearChoices(dia_addon_vatras_li_changecourse);
	Info_AddChoice(dia_addon_vatras_li_changecourse,"Myslím, že bychom o ní měli říci paladinům.",dia_addon_vatras_li_changecourse_ore);
	Info_AddChoice(dia_addon_vatras_li_changecourse,"Myslím, že paladinové za ni dobře zaplatí!",dia_addon_vatras_li_changecourse_gold);
};

func void dia_addon_vatras_li_changecourse_ore()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_01");	//Myslím, že bychom o ní měli říci paladinům.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_03");	//Rozumím a souhlasím s tvím plánem, můj synu... (vážně)
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_04");	//Máš pravdu! Měli bychom zařídit, aby se o tom dozvěděl lord Hagen.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_05");	//Hmmm... (zamyšleně) měli bychom se co nejrychleji vrátit na Khorinis...
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_08");	//Díky za radu.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_09");	//Není zač, můj synu. Ano, vrátíme se s Adanovou pomocí!
	B_LogEntry(TOPIC_CHANGECOURSE,"Vatras věří, že bychom se měli vrátit do Khorinisu a říct paladinům o rudě.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Promluvil jsem se všemi chlapy! Nyní bych měl zajít za kapitánem.");
	};
	Info_ClearChoices(dia_addon_vatras_li_changecourse);
};

func void dia_addon_vatras_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_01");	//Myslím, že paladinové za ni dobře zaplatí. Potřebují její moc!
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_02");	//Moc se mi nelíbí ten tvůj nápad synu... (vážně) Neměl bys profitovat z něčeho, co je tak životně důležité.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_05");	//Doufal jsem, že odoláš vábení zlata.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_06");	//Ale asi jsem se zmýlil!... (smutně)
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_07");	//Přirozeně je rozhodnutí na tobě...
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_08");	//... Ale neschvaluju tenhle plán.
	B_LogEntry(TOPIC_CHANGECOURSE,"Vatrasovi se nelíbí můj nápad prodat rudu paladinům.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Promluvil jsem se všemi chlapy. Nyní bych měl promluvit s kapitánem.");
	};
	Info_ClearChoices(dia_addon_vatras_li_changecourse);
};

