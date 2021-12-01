
instance DIA_GORNATOT_EXIT(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 999;
	condition = dia_gornatot_exit_condition;
	information = dia_gornatot_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornatot_exit_condition()
{
	return TRUE;
};

func void dia_gornatot_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_gornatot_PICKPOCKET(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 900;
	condition = dia_gornatot_PICKPOCKET_Condition;
	information = dia_gornatot_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_gornatot_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void dia_gornatot_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_gornatot_PICKPOCKET);
	Info_AddChoice(dia_gornatot_PICKPOCKET,Dialog_Back,dia_gornatot_PICKPOCKET_BACK);
	Info_AddChoice(dia_gornatot_PICKPOCKET,DIALOG_PICKPOCKET,dia_gornatot_PICKPOCKET_DoIt);
};

func void dia_gornatot_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_gornatot_PICKPOCKET);
};

func void dia_gornatot_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_gornatot_PICKPOCKET);
};


instance DIA_GORNATOT_WHOYOU(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 1;
	condition = dia_gornatot_whoyou_condition;
	information = dia_gornatot_whoyou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_gornatot_whoyou_condition()
{
	if(PSI_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornatot_whoyou_info()
{
	AI_Output(other,self,"DIA_GorNaTot_WhoYou_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_01");	//Jmenuji se Gor Na Toth.
	AI_Output(other,self,"DIA_GorNaTot_WhoYou_01_02");	//A co tady děláš?!
	if((other.guild == GIL_NONE) || (other.guild == GIL_GUR) || (other.guild == GIL_TPL) || (other.guild == GIL_SEK))
	{
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_03");	//Trénuji rekruty.
		AI_Output(other,self,"DIA_GorNaTot_WhoYou_01_04");	//A jak to jde?
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_05");	//Výborně, ale potřebuji, aby byli silnejší a aby jich bylo více...
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_06");	//Baal Parvez už vyrazil do města, aby objevil potenciální novice.
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_07");	//Ale většina těch v táboře je nepoužitelná!
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_08");	//A ti, co ani neumí držet meč, tu nejvíce melou o tom, že potřebují odpočinek.
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_09");	//Budeme ale rádi za každého novice - ve množství je síla!
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_10");	//(agresivně) Nebudu odpovídat na tvou blbou otázku!
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_11");	//Bude lepší, když vypadneš. Jasný?!
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNATOT_MITMACHEN(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 2;
	condition = dia_gornatot_mitmachen_condition;
	information = dia_gornatot_mitmachen_info;
	permanent = TRUE;
	description = "Chci se k vám přidat!";
};


func int dia_gornatot_mitmachen_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornatot_whoyou) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_gornatot_mitmachen_info()
{
	AI_Output(other,self,"DIA_GorNaTot_Mitmachen_01_00");	//Chci se k vám přidat!
	AI_Output(self,other,"DIA_GorNaTot_Mitmachen_01_01");	//Výborně, chceš se vydat na naši cestu?
	AI_Output(self,other,"DIA_GorNaTot_Mitmachen_01_02");	//Žij pak chvíli v táboře a porozhlédni se.
};


instance DIA_GORNATOT_ABWEISEND(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 2;
	condition = dia_gornatot_abweisend_condition;
	information = dia_gornatot_abweisend_info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit?";
};


func int dia_gornatot_abweisend_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornatot_whoyou) && (GORNATOTTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornatot_abweisend_info()
{
	AI_Output(other,self,"DIA_GorNaTot_Abweisend_01_00");	//Můžeš mě něco naučit?
	if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_01");	//Učím POUZE svaté templáře Bratrstva!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_02");	//Od Baalů jsou tu Guru.
	}
	else if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_03");	//Učím POUZE svaté templáře Bratrstva!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_04");	//Jestli chceš být jedním z nich, promluv s Gor Na Koshem.
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_06");	//Jako jednoho z nás tě rád naučím VŠE, co vím.
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_07");	//Pomůžu ti ovládnout templářskou magii a čepel.
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_08");	//Ano, naše magie není tak silná, jako magie Guru...
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_09");	//... Nicméně čepel dorovná zbytek rozdílu.
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_10");	//Také tě budu učit kruhy magie.
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_11");	//Až budeš chtít začít, řekni mi.
		Log_CreateTopic(TOPIC_ADDON_TPLTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_TPLTEACHER,"Gor Na Toth mě zasvětí do bojové magie Bratrstva.");
		GORNATOTTEACH = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_12");	//Mé lekce jsou pouze pro templáře!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_13");	//Ty ani nepatříš k Bratrstvu!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_14");	//Nemůžu tě učit.
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_15");	//Mé lekce nejsou pro tebe!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_16");	//Zmiz!
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNATOT_TEACH_MANA(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 10;
	condition = dia_gornatot_teach_mana_condition;
	information = dia_gornatot_teach_mana_info;
	permanent = TRUE;
	description = "Chci vylepšit svou magickou energii.";
};


func int dia_gornatot_teach_mana_condition()
{
	if((other.guild == GIL_TPL) && (GORNATOTTEACH == TRUE) && (other.attribute[ATR_MANA_MAX] < T_MED))
	{
		return TRUE;
	};
};

func void dia_gornatot_teach_mana_info()
{
	AI_Output(other,self,"DIA_GorNaTot_TEACH_MANA_15_00");	//Chci vylepšit svou magickou energii.
	AI_Output(self,other,"DIA_GorNaTot_TEACH_MANA_15_01");	//Síla mysli je stejně důležitá, jako lovcova obratnost a válečníkova síla.
	Info_ClearChoices(dia_gornatot_teach_mana);
	Info_AddChoice(dia_gornatot_teach_mana,Dialog_Back,dia_gornatot_teach_mana_back);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_gornatot_teach_mana_1);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_gornatot_teach_mana_5);
};

func void dia_gornatot_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_GorNaTot_TEACH_MANA_05_00");	//Více už ti nepomůžu.
		AI_Output(self,other,"DIA_GorNaTot_TEACH_MANA_05_01");	//Jsme na hranici mých možností!
	};
	Info_ClearChoices(dia_gornatot_teach_mana);
};

func void dia_gornatot_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_gornatot_teach_mana);
	Info_AddChoice(dia_gornatot_teach_mana,Dialog_Back,dia_gornatot_teach_mana_back);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_gornatot_teach_mana_1);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_gornatot_teach_mana_5);
};

func void dia_gornatot_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_gornatot_teach_mana);
	Info_AddChoice(dia_gornatot_teach_mana,Dialog_Back,dia_gornatot_teach_mana_back);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_gornatot_teach_mana_1);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_gornatot_teach_mana_5);
};


instance DIA_GORNATOT_TEACHTPLRUNES(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 100;
	condition = dia_gornatot_teachtplrunes_condition;
	information = dia_gornatot_teachtplrunes_info;
	permanent = TRUE;
	description = "Chci si procvičit bojovou magii.";
};


func int dia_gornatot_teachtplrunes_condition()
{
	if((other.guild == GIL_TPL) && (GORNATOTTEACH == TRUE) && (FIRSTTALKTPLMAGIC == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornatot_teachtplrunes_info()
{
	AI_Output(other,self,"DIA_GorNaTot_TEACHTplRunes_01_00");	//Chci si procvičit bojovou magii.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_01");	//Než začneme, řeknu ti malé poučení.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_02");	//Princip naší magie je podobný jako u normální magie.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_03");	//Pro uvolnění moci v našem tele užíváme magické runy. Ale jsou zde také rozdíly...
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_05");	//První co je, je to, že magie templářů po tobě nevyžaduje znalost kruhů magie.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_06");	//Místo toho máme něco podobného - Cestu Moci.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_07");	//Čím dále na své duchovní cestě budeš, tím více moci můžeš ze svého tela uvolňovat.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_09");	//Myslím, že to je vše, co potřebuješ vědet. Jestli máš otázky, ptej se teď.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_10");	//Jestli ne, já bych nějaké měl. Ale pozorně si rozmysli co odpovíš, více se tě ptát nebudu.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_11");	//Následuješ Cestu obnovy nebo Cestu destrukce?
	Info_ClearChoices(dia_gornatot_teachtplrunes);
	Info_AddChoice(dia_gornatot_teachtplrunes,"Cestu obnovy.",dia_gornatot_teachtplrunes_heal);
	Info_AddChoice(dia_gornatot_teachtplrunes,"Cestu destrukce.",dia_gornatot_teachtplrunes_combat);
};

func void dia_gornatot_teachtplrunes_heal()
{
	AI_Output(other,self,"DIA_GorNaTot_TEACHTplRunes_Heal_01_00");	//Cestu obnovy.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Heal_01_01");	//Dobrá, pak přijmi jako dar tuto runu.
	B_GiveInvItems(self,other,itru_tplheal_00,1);
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Heal_01_02");	//Vyléčí tvá zranění v bitvách za slávu Bratrstva!
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Heal_01_03");	//Buď moudrý při jejím užívání a nezapomeň, co jsem ti sdělil.
	PSIWAYHEAL = TRUE;
	FIRSTTALKTPLMAGIC = TRUE;
	Info_ClearChoices(dia_gornatot_teachtplrunes);
};

func void dia_gornatot_teachtplrunes_combat()
{
	AI_Output(other,self,"DIA_GorNaTot_TEACHTplRunes_Combat_01_00");	//Cestu destrukce.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Combat_01_01");	//Dobrá, pak přijmi jako dar tuto runu.
	B_GiveInvItems(self,other,itru_tplstrike_00,1);
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Combat_01_02");	//Pomůže ti překonat tvé nepřátele!
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Combat_01_03");	//Ale buď moudrý při jejím užití.
	PSIWAYCOMBAT = TRUE;
	FIRSTTALKTPLMAGIC = TRUE;
	Info_ClearChoices(dia_gornatot_teachtplrunes);
};


instance DIA_GORNATOT_TEACHTPLNEXTRUNES(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 100;
	condition = dia_gornatot_teachtplnextrunes_condition;
	information = dia_gornatot_teachtplnextrunes_info;
	permanent = TRUE;
	description = "Chci pokračovat ve výcviku.";
};

func int dia_gornatot_teachtplnextrunes_condition()
{
	if((other.guild == GIL_TPL) && (GORNATOTTEACH == TRUE) && (PSIWAYRUNECOMPLETE == FALSE) && ((PSIWAYHEAL == TRUE) || (PSIWAYCOMBAT == TRUE)))
	{
		return TRUE;
	};
};

func void dia_gornatot_teachtplnextrunes_info()
{
	var string concatText;

	AI_Output(other,self,"DIA_GorNaTot_TEACHTplNextRunes_01_00");	//Chci pokračovat ve výcviku.
	if(PSIWAYHEAL == TRUE)
	{
		if((PSIWAYHEALRUNE_01 == FALSE) && (Kapitel >= 2))
		{
			if(other.lp < 10)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(10));
				concatText = ConcatStrings(concatText," VB!");
				AI_Print(concatText);
				AI_Print(PRINT_NotEnoughLearnPoints);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_01");	//Myslím, že jsi připraven učinit další krok na tvé cestě.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_02");	//Přijmi ode mne tuto runu.
				other.lp = other.lp - 10;
				RankPoints = RankPoints + 10;
				B_GiveInvItems(self,other,itru_tplheal_01,1);
				PSIWAYHEALRUNE_01 = TRUE;
			};
		}
		else if((PSIWAYHEALRUNE_01 == TRUE) && (PSIWAYHEALRUNE_02 == FALSE) && (Kapitel >= 3))
		{
			if(other.lp < 15)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(15));
				concatText = ConcatStrings(concatText," VB!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_03");	//Myslím, že nadešel čas k dalšímu kroku.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_04");	//Jako znamení mého uznání přijmi tuto runu.
				other.lp = other.lp - 15;
				RankPoints = RankPoints + 15;
				B_GiveInvItems(self,other,itru_tplheal_02,1);
				PSIWAYHEALRUNE_02 = TRUE;
			};
		}
		else if((PSIWAYHEALRUNE_01 == TRUE) && (PSIWAYHEALRUNE_02 == TRUE) && (PSIWAYHEALRUNE_03 == FALSE) && (Kapitel >= 5))
		{
			if(other.lp < 20)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(20));
				concatText = ConcatStrings(concatText," VB!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_05");	//Ano, nadešel čas na další krok.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_06");	//Jako potvrzení, o správnosti tvého rozhodnutí, přijmi tuto runu.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_07");	//Je to poslední kouzlo na Cestě obnovy.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_08");	//Užívej je moudře!
				other.lp = other.lp - 20;
				RankPoints = RankPoints + 20;
				B_GiveInvItems(self,other,itru_tplheal_03,1);
				PSIWAYHEALRUNE_03 = TRUE;
				PSIWAYRUNECOMPLETE = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_09");	//Jsi připraven na další kouzlo z Cesty obnovy.
		};
	};
	if(PSIWAYCOMBAT == TRUE)
	{
		if((PSIWAYCOMBATRUNE_01 == FALSE) && (Kapitel >= 2))
		{
			if(other.lp < 10)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(10));
				concatText = ConcatStrings(concatText," VB!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_10");	//Je čas učinit další krok na cestě.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_11");	//Přijmi tuto runu na jeho ztvrzení.
				other.lp = other.lp - 10;
				RankPoints = RankPoints + 10;
				B_GiveInvItems(self,other,itru_tplstrike_01,1);
				PSIWAYCOMBATRUNE_01 = TRUE;
			};
		}
		else if((PSIWAYCOMBATRUNE_01 == TRUE) && (PSIWAYCOMBATRUNE_02 == FALSE) && (Kapitel >= 3))
		{
			if(other.lp < 15)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(15));
				concatText = ConcatStrings(concatText," VB!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_12");	//Jsi připraven na další krok.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_13");	//Přijmi ode mne tuto runu.
				other.lp = other.lp - 15;
				RankPoints = RankPoints + 15;
				B_GiveInvItems(self,other,itru_tplstrike_02,1);
				PSIWAYCOMBATRUNE_02 = TRUE;
			};
		}
		else if((PSIWAYCOMBATRUNE_01 == TRUE) && (PSIWAYCOMBATRUNE_02 == TRUE) && (PSIWAYCOMBATRUNE_03 == FALSE) && (Kapitel >= 5))
		{
			if(other.lp < 20)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(20));
				concatText = ConcatStrings(concatText," VB!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_14");	//Další krok tě očekává.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_15");	//Přijmi tuto runu.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_16");	//Toto je poslední kouzlo Cesty destrukce.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_17");	//Doufám, že tvá moudrost ti ukáže další Cesty!
				other.lp = other.lp - 20;
				RankPoints = RankPoints + 20;
				B_GiveInvItems(self,other,itru_tplstrike_03,1);
				PSIWAYCOMBATRUNE_03 = TRUE;
				PSIWAYRUNECOMPLETE = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_18");	//Jsi připraven na další runu destrukce.
		};
	};
};


instance DIA_GORNATOT_NamibSendTempler(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 1;
	condition = dia_gornatot_NamibSendTempler_condition;
	information = dia_gornatot_NamibSendTempler_info;
	permanent = FALSE;
	description = "Poslal mě Baal Namib.";
};

func int dia_gornatot_NamibSendTempler_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibSendTempler == TRUE) && (AssInvationBegin == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornatot_NamibSendTempler_info()
{
	AI_Output(other,self,"DIA_GorNaTot_NamibSendTempler_01_00");	//Poslal mě Baal Namib.
	AI_Output(self,other,"DIA_GorNaTot_NamibSendTempler_01_01");	//A co po mě náš spirituální vůdce požaduje?
	AI_Output(other,self,"DIA_GorNaTot_NamibSendTempler_01_02");	//Chce, abys poslal pár templářů ku sběračům drogy.
	AI_Output(self,other,"DIA_GorNaTot_NamibSendTempler_01_03");	//A proč?
	AI_Output(other,self,"DIA_GorNaTot_NamibSendTempler_01_04");	//Spochybňuješ snad Namibovy rozkazy?
	AI_Output(self,other,"DIA_GorNaTot_NamibSendTempler_01_05");	//Jasně, že ne. Jen by mě zajímalo proč.
	AI_Output(other,self,"DIA_GorNaTot_NamibSendTempler_01_06");	//Klidně se ho zeptej.
	AI_Output(self,other,"DIA_GorNaTot_NamibSendTempler_01_07");	//Hmm, radši nestrácejme čas! Považuj to za vybaveno.
	GorNaTotSendTemplers = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Tábory sběračů drogy by měly dostat posily co nevidět.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(TPL_8100_TEMPLER,"NW_PSICAMP_GUARDCAMP_00_01");
	Wld_InsertNpc(TPL_8101_TEMPLER,"NW_PSICAMP_GUARDCAMP_01_01");
	Wld_InsertNpc(TPL_8102_TEMPLER,"NW_PSICAMP_GUARDCAMP_02_01");
	Wld_InsertNpc(TPL_8103_TEMPLER,"NW_PSICAMP_GUARDCAMP_03_01");
	Wld_InsertNpc(TPL_8104_TEMPLER,"NW_PSICAMP_GUARDCAMP_04_01");
};

instance DIA_GORNATOT_LetsTrain(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 1;
	condition = dia_gornatot_LetsTrain_condition;
	information = dia_gornatot_LetsTrain_info;
	permanent = FALSE;
	description = "Co mě můžeš říci o svém studentovi Tiraksovi?";
};

func int dia_gornatot_LetsTrain_condition()
{
	if(MIS_TrainInCamp == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_gornatot_LetsTrain_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_00");	//Co mě můžeš říci o svém studentovi Tiraksovi?
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_01");	//Tiraks? Domnívám se, že je jedním z nejlepších vojáků, kterého jsem kdy cvičil.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_02");	//Ale myslím, že mu někdy chybí sebevědomí, což vede ke ztrátě koncentrace v boji.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_03");	//Musí se naučit, soustředit se plně jen na boj a nepřemýšlet o tom, co si ostatní myslí. Proč se ptáš?
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_04");	//Tiraks je nyní v táboře sběračů trávy, spolu s dalšími strážemi.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_05");	//Vím to, protože jsem ho tam sám poslal.
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_06");	//Tak co. Zdá se mě, že by nebylo špatné tam trošku potrénovat s mečem.
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_07");	//Bude to mnohem užitečnější než trávit všechen čas stáním na stanovišti. Ale potřebují někoho kdo by se postaral o jejich výcvik.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_08");	//Dobrej nápad. A jestli to dobře chápu, chceš aby se o to Tiraks postaral.
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_09");	//Přesně na to jsem se tě chtěl zeptat. Tiraks potřebuje tvůj souhlas aby mohl začít s výcvikem.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_10");	//Nemám nic proti. Je na to ten pravý.
	GorNaTotAgreeTiraks = TRUE;
	B_LogEntry(TOPIC_TrainInCamp,"Cvičitel templářů Gor na Toth dal svůj souhlas, aby se Tiraks stal učitelem stráží v táboře sběračů.");
};
