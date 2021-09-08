
instance DIA_Ulthar_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_EXIT_Condition;
	information = DIA_Ulthar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ulthar_NoEnter_PissOff(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 1;
	condition = DIA_Ulthar_NoEnter_PissOff_Condition;
	information = DIA_Ulthar_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Ulthar_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Ulthar_NoEnter_PissOff_01_00");	//Hmm... (naštvaně)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Ulthar_GREET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_GREET_Condition;
	information = DIA_Ulthar_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulthar_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_GREET_Info()
{
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//Pohleďte, nový novic předstupuje před Nejvyšší radu. Innos s tebou, synu.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//Co přesně je úlohou Nejvyšší rady?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//Je naší povinností plnit vůli Innose. Čili jmenujeme novice, kteří podstoupí Zkoušku Ohně.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//A i když vedeme poklidný život, stále pozorujeme události ve světě, protože Innos reprezentuje nejvyšší právo světa.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//Á, takže vy se zaujímáte o to, co se děje ve světě...
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//Co si tedy myslíte o těch dracích v Hornickém údolí s armádou, která každým dnem roste?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//Chápu, že cítíš hněv, ale musíme zvážit tvé slova, dokud podnikneme nějaké kroky.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//Pokud se necháme unést a budeme konat unáhleně, nic nedosáhneme. Plň své povinnosti – my prodiskutujeme, co je třeba udělat.
};


instance DIA_Ulthar_MAGETEST(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_MAGETEST_Condition;
	information = DIA_Ulthar_MAGETEST_Info;
	description = "Pověz mi o Zkoušce.";
};


func int DIA_Ulthar_MAGETEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulthar_GREET))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_MAGETEST_Info()
{
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//Pověz mi o Zkoušce.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//Je to šance pro vyvolené novice vstoupit do cechu mágů. Ale jenom jeden ní může projít.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//A Innos si novice sám zvolí.
};


instance DIA_Ulthar_WHEN(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 3;
	condition = DIA_Ulthar_WHEN_Condition;
	information = DIA_Ulthar_WHEN_Info;
	permanent = TRUE;
	description = "Kdy se Zkouška odohrává?";
};


func int DIA_Ulthar_WHEN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulthar_MAGETEST) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_WHEN_Info()
{
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//Kdy se Zkouška odohrává?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//Jakmile uslyšíme vůli Innose, ohlásíme to novicům a Zkouška se začne.
};


instance DIA_Ulthar_TEST(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 10;
	condition = DIA_Ulthar_TEST_Condition;
	information = DIA_Ulthar_TEST_Info;
	permanent = FALSE;
	description = "Mistře, jsem připraven postoupit Zkoušku.";
};


func int DIA_Ulthar_TEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_TEST_Info()
{
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//Mistře, jsem připraven postoupit Zkoušku.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//Nejsem překvapený, že poznáš staré pravidla.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//Ale tuším, že si neuvědomuješ, jak riskantní to je. Pamatuj, že netrpělivý duch Zkoušku Ohně nezvládne.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//Už dávno ji nikdo nepodstoupil. A existuje jenom jeden člověk, který jí prošel živý.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//Tehdy mladý, a ctižádostivý novic má už dlouho místo v Nejvyšší radě - hovořím o Serpentesovi.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//Za krátký čas už nebude jediný, kdo Zkouškou kdy prošel.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//Nebudu tě tedy už dál zdržovat. Poslouchej mou část Zkoušky:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//Vytvoř runu Ohnivého šípu. Nic víc, nic míň – Innos s tebou.
	MIS_RUNE = LOG_Running;
	Log_CreateTopic(TOPIC_Rune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rune,LOG_Running);
	B_LogEntry(TOPIC_Rune,"Ulthar mi dal úlohu. Měl bych vytvořit runu Ohnivého šípu.");
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_RUNNING(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 10;
	condition = DIA_Ulthar_RUNNING_Condition;
	information = DIA_Ulthar_RUNNING_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Ulthar_RUNNING_Condition()
{
	if((MIS_RUNE == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(other,ItRu_FireBolt) == 0))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_RUNNING_Info()
{
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//Poznáš svojí úlohu. Plň ji.
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SUCCESS(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_SUCCESS_Condition;
	information = DIA_Ulthar_SUCCESS_Info;
	permanent = FALSE;
	description = "Vytvořil jsem runu Ohnivého šípu!";
};


func int DIA_Ulthar_SUCCESS_Condition()
{
	if((MIS_RUNE == LOG_Running) && (Npc_HasItems(hero,ItRu_FireBolt) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//Vytvořil jsem tu runu!
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//Skvěle, novici. Nech si ji, tvou první runu.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//Jakmile se naučíš první kruh magie, budeš jí moci použít.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//Naplnil jsi svůj úkol k mojí spokojenosti.
	if((MIS_GOLEM == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//Ale Serpentesova nebezpečná úloha je stále před tebou!
	};
	MIS_RUNE = LOG_SUCCESS;
	B_GivePlayerXP(XP_RUNE);
};


instance DIA_Ulthar_KAP3_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP3_EXIT_Condition;
	information = DIA_Ulthar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_PermAbKap3(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 99;
	condition = DIA_Ulthar_PermAbKap3_Condition;
	information = DIA_Ulthar_PermAbKap3_Info;
	permanent = TRUE;
	description = "Je něco nového?";
};


func int DIA_Ulthar_PermAbKap3_Condition()
{
	if((Kapitel >= 3) || Npc_KnowsInfo(other,DIA_Ulthar_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_PermAbKap3_Info()
{
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//Je něco nového?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//Momentálně ne. Jdi a plň své povinnosti. Ještě stále je toho mnoho.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//Ne. Nic, co bys již nevěděl, bratře.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SCHREINEVERGIFTET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information = DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important = TRUE;
};


func int DIA_Ulthar_SCHREINEVERGIFTET_Condition()
{
	if((Pedro_Traitor == TRUE) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SCHREINEVERGIFTET_Info()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//Ještě jedna věc... (vážně) Některé z oltářů zasvěcených Innosovi byly znesvěcené. Ztratili jejich sílu!
		AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//Aha. A co teď?
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//Měl bys je očistit, aby se situace ještě nezhoršila.
		CreateInvItems(self,ItMi_UltharsHolyWater_Mis,1);
		B_GiveInvItems(self,other,ItMi_UltharsHolyWater_Mis,1);
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//Vezmi si tuhle svěcenu vodu a použij ji na oltáře.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//Svatá slova jim dodají jejich dřívější sílu.
		if(Npc_HasItems(other,itwr_map_shrine_mis_1) == FALSE)
		{
			if(Npc_HasItems(Gorax,itwr_map_shrine_mis_1) && (Npc_IsDead(Gorax) == FALSE))
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//Gorax ti může prodat mapu, kde jsou zaznačeny naše oltáře.
			}
			else
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//Tady máš mapu. Oltáře jsou na ni zaznačeny.
				CreateInvItems(self,itwr_map_shrine_mis_1,1);
				B_GiveInvItems(self,other,itwr_map_shrine_mis_1,1);
			};
		};
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//Teď jdi a plň své povinnosti.
		MIS_Ulthar_HeileSchreine_PAL = LOG_Running;
		Log_CreateTopic(TOPIC_Ulthar_HeileSchreine_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL,LOG_Running);
		B_LogEntry(TOPIC_Ulthar_HeileSchreine_PAL,"Ulthar chce, abych očistil všechny oltáře znesvěcené nepřítelem. Mám použit svěcenou vodu.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//Ještě jedna věc. Drž se dál od oltářů při cestách. Slyšeli jsme, že některé byli znesvěcené.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//Nikdo nedokáže teď říct, jak zaúčinkují.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//Není ale tvou povinností řešit to. Paladinové se o to postarají.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Ulthar_SchreineGeheilt(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SchreineGeheilt_Condition;
	information = DIA_Ulthar_SchreineGeheilt_Info;
	description = "Očistil jsem všechny Innosovy oltáře.";
};


func int DIA_Ulthar_SchreineGeheilt_Condition()
{
	if(MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SchreineGeheilt_Info()
{
	B_GivePlayerXP(XP_Ulthar_SchreineGereinigt);
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//Očistil jsem všechny Innosovy oltáře.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//Excelentně, synu. Jsem na tebe hrdý. Innos s tebou.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//Seber si tenhle Amulet síly, může ti přijít vhod ve tvém boji s nepřítelem.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM))
	{
		CreateInvItems(self,ItAm_Hp_Mana_01,1);
		B_GiveInvItems(self,other,ItAm_Hp_Mana_01,1);
	}
	else
	{
		CreateInvItems(self,ItAm_Dex_Strg_01,1);
		B_GiveInvItems(self,other,ItAm_Dex_Strg_01,1);
	};

	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_KAP4_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP4_EXIT_Condition;
	information = DIA_Ulthar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SchreineGeheiltNoPAL(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information = DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important = TRUE;
};


func int DIA_Ulthar_SchreineGeheiltNoPAL_Condition()
{
	if((MIS_Ulthar_HeileSchreine_PAL == FALSE) && (Kapitel >= 5) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SchreineGeheiltNoPAL_Info()
{
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//Dobré zprávy. Oltáře při cestách byli očištěny. Síla Innosova pomohla paladinům odstranit tento problém z povrchu zemského.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//Můžeš konečně přinést dary Innosovi bez váhání či lítosti.
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_KAP5_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP5_EXIT_Condition;
	information = DIA_Ulthar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_KAP6_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_KAP6_EXIT_Condition;
	information = DIA_Ulthar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_PICKPOCKET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 900;
	condition = DIA_Ulthar_PICKPOCKET_Condition;
	information = DIA_Ulthar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ulthar_PICKPOCKET_Condition()
{
	return C_Beklauen(74,320);
};

func void DIA_Ulthar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET,Dialog_Back,DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};

func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};


instance DIA_ULTHAR_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 1;
	condition = dia_ulthar_runemagicnotwork_condition;
	information = dia_ulthar_runemagicnotwork_info;
	permanent = FALSE;
	description = "Tvé magické runy - stále fungují?";
};


func int dia_ulthar_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulthar_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ulthar_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Ulthar_RuneMagicNotWork_01_01");	//Momentálně ne... (nechápavě) A ani za svět nedokážu pochopit proč!
	AI_Output(other,self,"DIA_Ulthar_RuneMagicNotWork_01_02");	//A co ostatní?!
	AI_Output(self,other,"DIA_Ulthar_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechny! Ostatním mágům Ohně se také nic nedaří.
	AI_Output(other,self,"DIA_Ulthar_RuneMagicNotWork_01_04");	//Očividně.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};

