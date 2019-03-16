var int CheckTadeNaKosh;

func void B_GorNaKoshEquipWeapon(var C_Npc slf)
{
	var C_Item EquipWeapon;

	EquipWeapon = Npc_GetEquippedMeleeWeapon(slf);

	if(CheckTadeNaKosh == TRUE)
	{
		if(Hlp_IsItem(EquipWeapon,ITMW_ZWEIHAENDER_GORNAKOSH) == FALSE)
		{
			AI_UnequipWeapons(slf);

			if(Npc_HasItems(slf,ITMW_ZWEIHAENDER_GORNAKOSH) < 1)
			{
				CreateInvItem(slf,ITMW_ZWEIHAENDER_GORNAKOSH);
			};

			Npc_EquipItem(slf,ITMW_ZWEIHAENDER_GORNAKOSH);
		};

		CheckTadeNaKosh = FALSE;
	};
};

instance DIA_GORNAKOSH_EXIT(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 999;
	condition = dia_gornakosh_exit_condition;
	information = dia_gornakosh_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornakosh_exit_condition()
{
	return TRUE;
};

func void dia_gornakosh_exit_info()
{
	AI_StopProcessInfos(self);
	B_GorNaKoshEquipWeapon(self);
};

instance dia_gornakosh_PICKPOCKET(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 900;
	condition = dia_gornakosh_PICKPOCKET_Condition;
	information = dia_gornakosh_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_gornakosh_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void dia_gornakosh_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_gornakosh_PICKPOCKET);
	Info_AddChoice(dia_gornakosh_PICKPOCKET,Dialog_Back,dia_gornakosh_PICKPOCKET_BACK);
	Info_AddChoice(dia_gornakosh_PICKPOCKET,DIALOG_PICKPOCKET,dia_gornakosh_PICKPOCKET_DoIt);
};

func void dia_gornakosh_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_gornakosh_PICKPOCKET);
};

func void dia_gornakosh_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_gornakosh_PICKPOCKET);
};


instance DIA_GORNAKOSH_WHOYOU(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_whoyou_condition;
	information = dia_gornakosh_whoyou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_gornakosh_whoyou_condition()
{
	if((Kapitel < 5) && (PSI_TALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_gornakosh_whoyou_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_WhoYou_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_01");	//Moje jméno je - Gor Na Kosh, Nejvyšší templář Bratrstva!... (pyšně) Stačí?!
	AI_Output(other,self,"DIA_GorNaKosh_WhoYou_01_02");	//Ano. Jak můžu získat zbroj, jakou máš ty?
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_03");	//Ha!... Pro začátek by ses musel stát jedním z nás a pak dlouho cvičit, abys dostal zbroj templáře.
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_04");	//Taky ti můžu říct, že tlacháním se tak nestane!
	AI_Output(other,self,"DIA_GorNaKosh_WhoYou_01_05");	//Jaké to je být templářem?
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_06");	//Je to velká čest a zodpovědnost!
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_07");	//Bojujeme ve jménu Bratrstva - A naše životy patří jeho ideálům a plánům!
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_08");	//Pouze zkušený a silný válečník se může dostat mezi templáře.
};


instance DIA_GORNAKOSH_WHAT(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_what_condition;
	information = dia_gornakosh_what_info;
	permanent = FALSE;
	description = "Co tady máš na práci?";
};


func int dia_gornakosh_what_condition()
{
	if((Kapitel < 5) && (PSI_TALK == TRUE) && Npc_KnowsInfo(other,dia_gornakosh_whoyou))
	{
		return TRUE;
	};
};

func void dia_gornakosh_what_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_What_01_00");	//Co tady máš na práci?
	AI_Output(self,other,"DIA_GorNaKosh_What_01_01");	//(pyšně) Trénuji templáře Bratrstva!...
	AI_Output(self,other,"DIA_GorNaKosh_What_01_02");	//Protože tu nění Cor Angar, je tato povinnost na mě.
	AI_Output(self,other,"DIA_GorNaKosh_What_01_03");	//Ale já stále oufám, že se k nám náš učitel vrátí!...
};


instance DIA_GORNAKOSH_ANGAR(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_angar_condition;
	information = dia_gornakosh_angar_info;
	permanent = FALSE;
	description = "(Vyprávět o Angarovi)";
};


func int dia_gornakosh_angar_condition()
{
	if((PSI_TALK == TRUE) && (GORNAKOSHKNOWSANGAR == FALSE) && Npc_KnowsInfo(other,dia_gornakosh_what) && Npc_KnowsInfo(other,DIA_AngarDJG_HALLO))
	{
		return TRUE;
	};
};

func void dia_gornakosh_angar_info()
{
	if(ANGARISDEAD == FALSE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_GorNaKosh_Angar_01_01");	//Angar žije!
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_02");	//Jak to víš?! (neuvěřitelně) Ale, ale...?
		AI_Output(other,self,"DIA_GorNaKosh_Angar_01_03");	//Potkal jsem ho v Hornickém údolí. Je v pořádku!
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_04");	//(potěšeně) To je opravdu skvělá zpráva, která potěší všechny z Bratrstva!
		GORNAKOSHKNOWSANGAR = TRUE;
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(other,self,"DIA_GorNaKosh_Angar_01_05");	//Bojím se, že mám špatné zprávy. Cor Angar je mrtvý!
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_06");	//CO?! (naštvaně) Odkud to víš?!
		AI_Output(other,self,"DIA_GorNaKosh_Angar_01_07");	//Našel svůj osud v Hornickém údolí. Je to velká škoda...
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_08");	//On nežije? Ne! Jak k tomu mohlo dojít...
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_10");	//(smutně) Je to velká ztráta pro Bratrstvo. Každý z nás bude truchlit nad smrtí našeho velkého vůdce a učitele!
		GORNAKOSHKNOWSANGAR = TRUE;
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
};


instance DIA_GORNAKOSH_CANBETPL(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_canbetpl_condition;
	information = dia_gornakosh_canbetpl_info;
	permanent = FALSE;
	description = "Můžeš mě přijat mezi templáře?";
};


func int dia_gornakosh_canbetpl_condition()
{
	if((Kapitel < 5) && (PSI_TALK == TRUE) && Npc_KnowsInfo(other,dia_gornakosh_whoyou))
	{
		return TRUE;
	};
};

func void dia_gornakosh_canbetpl_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_CanBeTPL_01_00");	//Můžeš mě přijat mezi templáře?

	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_01");	//Pro začátek se musíš stát členem Bratrstva.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_02");	//Promluv s Baalem Orunem, pomůže ti.
		CANBETPL = TRUE;

		if(MIS_CanDoTempler == FALSE)
		{
			MIS_CanDoTempler = LOG_Running;
			Log_CreateTopic(TOPIC_CanDoTempler,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CanDoTempler,LOG_Running);
			B_LogEntry(TOPIC_CanDoTempler,"Pokud se chci stát členem templářů, musím udělat dojem na Guru a ostatní učitele.");
		};
	}
	else if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_03");	//Vidím, že ses stal jedním z Bratrstva, to je dobře!
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_04");	//Udělal jsi správnou volbu.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_05");	//Ale být templářem nejsou pouhá slova, kterými jsou templáři nazíváni.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_06");	//Jen několik vyvolených může vstoupit do templářských řad.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_07");	//Proto před tím, než se staneš templářem, bys měl dokázat, že jsi toho hoden!
		CANBETPL = TRUE;

		if(MIS_CanDoTempler == FALSE)
		{
			MIS_CanDoTempler = LOG_Running;
			Log_CreateTopic(TOPIC_CanDoTempler,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CanDoTempler,LOG_Running);
			B_LogEntry(TOPIC_CanDoTempler,"Pokud se chci stát členem templářů, musím udělat dojem na Guru a ostatní učitele.");
		};
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_08");	//Rozhodl ses pro posvátnou cestu Guru.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_09");	//Takže po ní kráčej bezpečně a nepochybuj o svém výběru.
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_10");	//Jen ten kdo patří mezi nás může být hoden takové pocty!
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_11");	//Takže nemarni můj čas.
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
};


instance DIA_GORNAKOSH_TEST(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_test_condition;
	information = dia_gornakosh_test_info;
	permanent = FALSE;
	description = "Jak můžu dokázat, že jsem hoden být templářem?";
};


func int dia_gornakosh_test_condition()
{
	if((CANBETPL == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_gornakosh_test_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_Test_01_00");	//Jak můžu dokázat, že jsem hoden být templářem?
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_01");	//Pravděpodobně chceš, abych tě vyzkoušel.
	AI_Output(other,self,"DIA_GorNaKosh_Test_01_02");	//Ano vyzkoušej mě!
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_04");	//Mám jeden úkol zrovna pro tebe.
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_08");	//Na této části ostrova je skryto Tarakotovo kladivo - mocný, prastarý artefakt.
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_09");	//Není jasné, co přesně dokáže, ale kdyby Bratrstvo mělo tento artefakt, získalo by moc!
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_10");	//Jestli chceš upřesnit, co máš udělat - přines mi ho.
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_11");	//Nicméně měj na paměti, že nejspíše bude chráněno. Proto si rozmysli, než mi slíbíš, že ho přineseš.
	AI_Output(other,self,"DIA_GorNaKosh_Test_01_17");	//Dobře!... Zkusím pro tebe získat to kladivo.
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_20");	//Vrať se ke mě, až dokončíš svůj úkol.
	MIS_TARACOTHAMMER = LOG_Running;
	Log_CreateTopic(TOPIC_TARACOTHAMMER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TARACOTHAMMER,LOG_Running);
	B_LogEntry(TOPIC_TARACOTHAMMER,"Gor Na Kosh mi řekl, že abych jsem se mohl stát templářem, musím mu přinést Tarakotovo kladivo.");
};


instance DIA_GORNAKOSH_TESTOK(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_testok_condition;
	information = dia_gornakosh_testok_info;
	permanent = FALSE;
	description = "Získal jsem to kladivo!";
};

func int dia_gornakosh_testok_condition()
{
	if((MIS_TARACOTHAMMER == LOG_Running) && (Npc_HasItems(other,itmi_taracothammer) >= 1))
	{
		return TRUE;
	};
};

func void dia_gornakosh_testok_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_GorNaKosh_TestOk_01_00");	//Získal jsem to kladivo!
	B_GiveInvItems(other,self,itmi_taracothammer,1);
	Npc_RemoveInvItems(self,itmi_taracothammer,Npc_HasItems(self,itmi_taracothammer));
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_02");	//Nemožné! To... (udiveně)... To je skutečně Tarakotovo kladivo!
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_03");	//Excelentí práce! Abych řekl pravdu, nemyslel jsem si, že se ti to povede.
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_06");	//Prošel jsi mou zkouškou a dokázal svou sílu a vytrvalost. Zasloužíš si velkou úctu!
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_07");	//Kromě toho jsi poskytl neocenitelné služby Bratrstvu.
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_08");	//Pokud bude tvé jednání stále takové, brzy se dostaneš mezi templáře.
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_09");	//Lidi jako jsi ty potřebujeme!
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_10");	//Přijmi prosím ode mě tento dárek, na vyjádření díků mojich a celého Bratrstva.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	GORNAKOSHTEST = TRUE;
	MIS_TARACOTHAMMER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TARACOTHAMMER,LOG_SUCCESS);
	B_LogEntry(TOPIC_TARACOTHAMMER,"Splnil jsem zkoušku Gor Na Koshe.");
};


instance DIA_GORNAKOSH_READYBETPL(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_readybetpl_condition;
	information = dia_gornakosh_readybetpl_info;
	permanent = TRUE;
	description = "Chci se přidat ke templářům!";
};


func int dia_gornakosh_readybetpl_condition()
{
	if((CANBETPL == TRUE) && (hero.guild == GIL_SEK) && (READYBETPL == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornakosh_readybetpl_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_00");	//Chci se přidat ke templářům!
	AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_01");	//Ano, ale první musíš spnit zkoušky.
	AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_02");	//První bys měl dokázat svou odvahu!
	AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_03");	//A potom dostaneš požehnání Bratrstva.

	if((CADARAGREED == TRUE) || (CANJOINPSI == TRUE) || (PARVEZAGREED == TRUE) || (GORNAKOSHTEST == TRUE))
	{
		AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_04");	//A není to dost?!
		AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_05");	//Co vše jsi zatím udělal?

		if(GORNAKOSHTEST == TRUE)
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_06");	//Splnil jsem tvůj úkol!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_07");	//Hmmm... Ano, to máš pravdu!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_08");	//Tím jsi mi ušetřil hodně problémů.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_09");	//A ostatní?
		};
		if(CADARAGREED == TRUE)
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_10");	//Baal Cadar ve mě věří.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_13");	//A dál?
		};
		if(PARVEZAGREED == TRUE)
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_14");	//Baal Parvez souhlasil s mým rozhodnutím...
		};
		if(CANJOINPSI == TRUE)
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_19");	//Splnil jsem úkol Baala Oruna!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_21");	//Guru měli pravdu, mluví o tobě s úctou.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_22");	//A dál?
		};
		if((CADARAGREED == TRUE) && (CANJOINPSI == TRUE) && (PARVEZAGREED == TRUE) && (GORNAKOSHTEST == TRUE))
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_23");	//To je vše!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_24");	//Hmmm... Dobře! Dokázal jsi toho hodně.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_25");	//Můžu o tobě povědět, že někdo, jako ty je pro nás nezbytný!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_26");	//Nicméně, měl bys pochopit, že volbu být templářem nejde změnit.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_27");	//Jestli chceš být raději Guru, promluv s Baal Orunem.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_28");	//Jestli ses ale rozhodl pro cestu templáře, symozřejmě tě přijmu do templářského kruhu.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_29");	//V každém případě, je to tvoje volba...
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_30");	//... Ale dobře si promysli vše okolo, protože finální rozhodnutí již nemůžeš nijak změnit!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_31");	//Myslím, že jsem ti vysvětlil vše důležité. A až se rozhodneš, okamžitě mi to přijď říci!
			READYBETPL = TRUE;

			if(MIS_CanDoTempler == LOG_Running)
			{
				B_LogEntry(TOPIC_CanDoTempler,"Gor Na Kosh je připraven mě přijmout.");
			};
		}
		else
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_33");	//To je vše!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_34");	//Hmmm... Promiň, ale to nestačí!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_35");	//Tvé služby Bratrstvu jsou skvělé, ale nestačí to pro přijetí k templářům!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_37");	//Pokračuj a brzy ti bude udělena pocta nosit zbroj templáře!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_38");	//Proto raději o tomto budeme mluvit později.
	};
};

var int TplNeedTwoH;
var int TplNeedStr;

instance DIA_GORNAKOSH_BETPL(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_betpl_condition;
	information = dia_gornakosh_betpl_info;
	permanent = TRUE;
	description = "Přijmi mě do kruhu templářů.";
};


func int dia_gornakosh_betpl_condition()
{
	if((READYBETPL == TRUE) && (hero.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_gornakosh_betpl_info()
{
	if((other.HitChance[NPC_TALENT_2H] >= 30) && (other.attribute[ATR_STRENGTH] >= 50))
	{
		Snd_Play("GUILD_INV");
		hero.guild = GIL_TPL;
		CheckHeroGuild[0] = TRUE;
		AI_Output(other,self,"DIA_GorNaKosh_BeTPL_01_00");	//Přijmi mě do kruhu templářů.
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_01");	//Ano, staniž se!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_02");	//Nyní jsi templářem Bratrstva, náš bratr ve zbrani!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_03");	//Na... Zde je tvá zbroj.
		CreateInvItems(self,itar_tpl_lst,1);
		B_GiveInvItems(self,other,itar_tpl_lst,1);
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_04");	//Noš ji s pýchou, protože jen málo lidí ji dostane!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_05");	//Také přijmi tento meč, symbol našeho stavu!
		CreateInvItems(self,itmw_zweihaender6,1);
		B_GiveInvItems(self,other,itmw_zweihaender6,1);
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_06");	//Pomůže ti překonat tvé nepřátele!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_07");	//Nezapomeň ale, že být templářem není jen nosit zbroj...
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_08");	//... Znamená to zcela se zasvětit službě Bratrstvu pro jeho dobro a slávu!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_09");	//Najdeme uplatnění síly, ale jen ten, který má sílu ducha spojenou s fyzickou sílou je skutečný templář.
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_11");	//Pamatuj: školení ducha a posilování těla ti pomůže v boji proti nepříteli.
		MIS_CanDoTempler = LOG_Success;
		Log_SetTopicStatus(TOPIC_CanDoTempler,LOG_Success);
		B_LogEntry(TOPIC_CanDoTempler,"Gor Na Kosh mě přijal do řad templářů.");
	}
	else if(other.attribute[ATR_STRENGTH] < 50)
	{
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_12");	//Nejsi dost silný abys nosil naši zbroj a náš meč.

		if((MIS_CanDoTempler == LOG_Running) && (TplNeedStr == FALSE))
		{
			B_LogEntry(TOPIC_CanDoTempler,"Gor Na Kosh si myslí, že jsem moc slabý abych se stal templářem. (nutná síla: 50 a více)");
			TplNeedStr = TRUE;
		};
	}
	else if(other.HitChance[NPC_TALENT_2H] < 30)
	{
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_13");	//Tvé dovednosti s obouručnými zbraňemi nejsou dostatečné.

		if((MIS_CanDoTempler == LOG_Running) && (TplNeedTwoH == FALSE))
		{
			B_LogEntry(TOPIC_CanDoTempler,"Gor Na Kosh si myslí, že nemám dostatečné dovednosti s obouručnými zbraňemi abych se mohl stát templářem. (potřeba dovednost boje s obouručními zbraněmi: 30 a více)");
			TplNeedTwoH = TRUE;
		};
	};
};

var int GorNaKosh_Trade_OneTime;
var int TPLSword2;
var int TPLSword3;
var int TPLSword4;

instance DIA_GorNaKosh_TRADE(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 700;
	condition = DIA_GorNaKosh_TRADE_Condition;
	information = DIA_GorNaKosh_TRADE_Info;
	permanent = TRUE;
	description = "Jaké další zbraně mi můžeš prodat?";
	trade = TRUE;
};

func int DIA_GorNaKosh_TRADE_Condition()
{
	if((hero.guild == GIL_TPL) && Wld_IsTime(8,0,21,30))
	{
		return TRUE;
	};
};

func void DIA_GorNaKosh_TRADE_Info()
{
	AI_Output(other,self,"DIA_GorNaKosh_TRADE_15_00");	//Jaké další zbraně mi můžeš prodat?

	if((GorNaKosh_Trade_OneTime == FALSE) && (hero.guild == GIL_TPL))
	{
		AI_Output(self,other,"DIA_GorNaKosh_TRADE_11_01");	//Teď když jsi jeden z nás ti mohu prodat ty nejlepší zbraňe, které mohou nosit jen templáři.
		AI_Output(self,other,"DIA_GorNaKosh_TRADE_11_02");	//Ale budeš muset zaplatit samozřejmě.
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1,1);
		GorNaKosh_Trade_OneTime = TRUE;
	};
	if((Kapitel >= 2) && (TPLSword2 == FALSE))
	{
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2,1);
		TPLSword2 = TRUE;
	};
	if((Kapitel >= 3) && (TPLSword3 == FALSE))
	{
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3,1);
		TPLSword3 = TRUE;
	};
	if((Kapitel >= 4) && (TPLSword4 == FALSE))
	{
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4,1);
		TPLSword4 = TRUE;
	};
	if((TplBelt_01 == FALSE) && (hero.guild == GIL_TPL))
	{
		CreateInvItems(self,ItBE_Addon_TPL_01,1);
		TplBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);
	AI_UnequipWeapons(self);

	if(Npc_HasItems(self,ITMW_ZWEIHAENDER_GORNAKOSH) >= 1)
	{
		Npc_RemoveInvItems(self,ITMW_ZWEIHAENDER_GORNAKOSH,Npc_HasItems(self,ITMW_ZWEIHAENDER_GORNAKOSH));
	};

	CheckTadeNaKosh = TRUE;
};

instance DIA_GORNAKOSH_ABWEISEND(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_abweisend_condition;
	information = dia_gornakosh_abweisend_info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit, mistře?";
};

func int dia_gornakosh_abweisend_condition()
{
	if((other.guild != GIL_SEK) && (other.guild != GIL_GUR) && (other.guild != GIL_TPL) && Npc_KnowsInfo(other,dia_gornakosh_what))
	{
		return TRUE;
	};
};

func void dia_gornakosh_abweisend_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_Abweisend_01_00");	//Můžeš mě něco naučit, mistře?
	AI_Output(self,other,"DIA_GorNaKosh_Abweisend_01_01");	//Ne, jdi mi z očí!
	AI_StopProcessInfos(self);
	B_GorNaKoshEquipWeapon(self);
};


instance DIA_GORNAKOSH_ABWEISENDTWO(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_abweisendtwo_condition;
	information = dia_gornakosh_abweisendtwo_info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit, mistře?";
};


func int dia_gornakosh_abweisendtwo_condition()
{
	if(Npc_KnowsInfo(other,dia_gornakosh_what) && (GORNAKOSHTEACH == FALSE) && ((other.guild == GIL_SEK) || (other.guild == GIL_GUR) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_gornakosh_abweisendtwo_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_AbweisendTwo_01_00");	//Můžeš mě něco naučit, mistře?
	if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_01");	//Učím pouze templáře, novici.
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_02");	//Takže, nemarni můj čas.
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_03");	//Trénuji jen templáře, mistře.
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_04");	//Baaly Bratrstva trénují Guru.
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_05");	//Vstoupil jsi do posvátného kruhu templářů, proto tě budu učit všemu, co umím.
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_06");	//Můžu tě učit boji s chladnými zbraněmi a také vylepšit tvou sílu a obratnost.
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_07");	//Gor Na Toth ti ukáže, jak používat magii templářů a Gor Na Vid tě zasvětí do používání zbraní na dálku.
		Log_CreateTopic(TOPIC_ADDON_TPLTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_TPLTEACHER,"Gor Na Kosh mě bude učit boji na blízko a zlepšovat mou sílu i obratnost.");
		GORNAKOSHTEACH = TRUE;
	};
};


instance DIA_GORNAKOSH_TEACH(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 10;
	condition = dia_gornakosh_teach_condition;
	information = dia_gornakosh_teach_info;
	permanent = TRUE;
	description = "Chci trénovat.";
};

func int dia_gornakosh_teach_condition()
{
	if(GORNAKOSHTEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornakosh_teach_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_Teach_15_00");	//Chci trénovat.
	AI_Output(self,other,"DIA_GorNaKosh_Teach_04_01");	//A co přesně bys chtěl?
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60))
	{
		AI_Output(self,other,"DIA_GorNaKosh_Teach_1H_1_04_00");	//Ještě musíš cvičit, ale stane se z tebe mistr.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60))
	{
		AI_Output(self,other,"DIA_GorNaKosh_Teach_1H_5_04_00");	//Zápětí máš příliš tuhé, uvolni ho, ale ne moc.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_GorNaKosh_Teach_2H_1_04_00");	//Vždy měj na paměti, že se zbraní hýbej boky a ne zápěstím.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_GorNaKosh_Teach_2H_5_04_00");	//Největší rána je k ničemu, když jde do prázdna!
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_back()
{
	Info_ClearChoices(dia_gornakosh_teach);
};


var int gornakosh_merke_str;
var int gornakosh_merke_dex;

instance DIA_GORNAKOSH_TEACHATT(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 150;
	condition = dia_gornakosh_teachatt_condition;
	information = dia_gornakosh_teachatt_info;
	permanent = TRUE;
	description = "Chci zlepšit své dovednosti.";
};

func int dia_gornakosh_teachatt_condition()
{
	if(GORNAKOSHTEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornakosh_teachatt_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_TeachATT_15_00");	//Chci zlepšit své dovednosti.
	GORNAKOSH_MERKE_STR = other.attribute[ATR_STRENGTH];
	GORNAKOSH_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Regenerace výdrže (VB: 15, cena: 5000 zlatých)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_back()
{
	if((GORNAKOSH_MERKE_STR < other.attribute[ATR_STRENGTH]) || (GORNAKOSH_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_GorNaKosh_TeachATT_Back_01_00");	//Dobře, nyní jsi lepší!
	};

	Info_ClearChoices(dia_gornakosh_teachatt);
};

func void DIA_GorNaKosh_TeachATT_RegenStam()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_03");	//Nauč mě jak rychleji obnovit svou výdrž.

	kosten = 15;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Regenerace výdrže");
		VATRAS_TEACHREGENSTAM = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);
};

func void dia_gornakosh_teachatt_str_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Regenerace výdrže (VB: 15, cena: 5000 zlatých)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_str_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Regenerace výdrže (VB: 15, cena: 5000 zlatých)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Regenerace výdrže (VB: 15, cena: 5000 zlatých)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Regenerace výdrže (VB: 15, cena: 5000 zlatých)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Regenerace výdrže (VB: 15, cena: 5000 zlatých)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Regenerace výdrže (VB: 15, cena: 5000 zlatých)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Regenerace výdrže (VB: 15, cena: 5000 zlatých)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Regenerace výdrže (VB: 15, cena: 5000 zlatých)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};


instance DIA_GORNAKOSH_ADVANTAGE(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 5;
	condition = dia_gornakosh_advantage_condition;
	information = dia_gornakosh_advantage_info;
	permanent = FALSE;
	description = "Je lepší jednoruční zbraň, nebo obouruční?";
};


func int dia_gornakosh_advantage_condition()
{
	if(GORNAKOSHTEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornakosh_advantage_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_Advantage_15_00");	//Je lepší jednoruční zbraň, nebo obouruční?
	AI_Output(self,other,"DIA_GorNaKosh_Advantage_04_01");	//S jednoruční jsi rychlejší. Ale neudělá tolik škody.
	AI_Output(self,other,"DIA_GorNaKosh_Advantage_04_02");	//Obouruční napáchá více škody, ale je pomalá.
};


instance DIA_GORNAKOSH_HOWTOBEGIN(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 6;
	condition = dia_gornakosh_howtobegin_condition;
	information = dia_gornakosh_howtobegin_info;
	permanent = FALSE;
	description = "S čím bych měl začít? Jedno, nebo obouruční zbraní?";
};


func int dia_gornakosh_howtobegin_condition()
{
	if(Npc_KnowsInfo(other,dia_gornakosh_advantage))
	{
		return TRUE;
	};
};

func void dia_gornakosh_howtobegin_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_HowToBegin_15_00");	//S čím bych měl začít? Jedno, nebo obouruční zbraní?
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_01");	//To je zcela na tobě.
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_02");	//Pokud se specializuješ pouze na jenu zbraň, můžeš být dobrý i u jiné.
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_03");	//Jestliže jsi dobrý v boji s jednoručními zbraněmi, jsi začátečník s obouručními...
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_04");	//... Stejně je to i naopak.
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_05");	//Takovéto učení je ale těžší, než se zlepšovat v obojím najednou.
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_06");	//Věř mi, vím co říkám.
};

var int BuyTemplerHeavy;
var int BuyTemplerMed;
var int BuyTemplerLight;

instance TPL_8005_GORNAKOSH_ARMOR(C_Info)
{
	npc = tpl_8005_gornakosh;
	condition = tpl_8005_gornakosh_armor_condition;
	information = tpl_8005_gornakosh_armor_info;
	permanent = TRUE;
	description = "Potřebuji lepší zbroj.";
};


func int tpl_8005_gornakosh_armor_condition()
{
	if((hero.guild == GIL_TPL) && (TAKETPLBESTARMOR == FALSE))
	{
		return TRUE;
	};
};

func void tpl_8005_gornakosh_armor_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"TPL_8005_GorNaKosh_ARMOR_01_00");	//Potřebuji lepší zbroj.
	AI_Output(self,other,"TPL_8005_GorNaKosh_ARMOR_01_01");	//Mám dobrou zbroj, ale měl bys přinést odpovídající poplatek pro dobro Bratrstva!
	Info_ClearChoices(tpl_8005_gornakosh_armor);
	Info_AddChoice(tpl_8005_gornakosh_armor,Dialog_Back,tpl_8005_gornakosh_armor_back);

	if(BuyTemplerHeavy == FALSE)
	{
		Info_AddChoice(tpl_8005_gornakosh_armor,"Těžká zbroj templáře (cena: 14000 zlatých)",tpl_8005_gornakosh_armor_h);
	};
	if(BuyTemplerMed == FALSE)
	{
		Info_AddChoice(tpl_8005_gornakosh_armor,"Zbroj templáře (cena: 9500 zlatých)",tpl_8005_gornakosh_armor_m);
	};
	if(BuyTemplerLight == FALSE)
	{
		Info_AddChoice(tpl_8005_gornakosh_armor,"Lehká zbroj templáře (cena: 1500 zlatých)",tpl_8005_gornakosh_armor_l);
	};
};

func void tpl_8005_gornakosh_armor_m()
{
	AI_Output(hero,self,"TPL_8005_GorNaKosh_ARMOR_M_01_00");	//Potřebuji zbroj templáře.

	if(Npc_HasItems(hero,ItMi_Gold) < VALUE_ITAR_TPL_M)
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_M_01_02");	//Jakmile poskytneš dostatečný dar Bratrstvu na jeho potřeby, zvážím tvou prosbu.
	}
	else if((Kapitel >= 2) && (FORTUNOBACK == TRUE) && (MIS_KORANGAR == LOG_SUCCESS))
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_M_01_03");	//Nyní, když jsi přinesl dar, dostaneš novou zbroj.
		B_GiveInvItems(hero,self,ItMi_Gold,VALUE_ITAR_TPL_M);
		CreateInvItems(hero,itar_tpl_m,1);
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_TPL_M);
		BuyTemplerMed = TRUE;
	}
	else
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_M_01_01");	//Nemáš dostatek zkušeností na to, abys mohl nést na ramenou naše zbroje.
	};
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};

func void tpl_8005_gornakosh_armor_h()
{
	AI_Output(hero,self,"TPL_8005_GorNaKosh_ARMOR_H_01_00");	//Potřebuji těžkou zbroj templáře.

	if(Kapitel < 4)
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_H_01_01");	//Nemáš dostatek zkušeností na to, abys mohl nést na ramenou naše zbroje.
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < VALUE_ITAR_TPL_S)
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_H_01_02");	//Jakmile poskytneš dostatečný dar Bratrstvu na jeho potřeby, zvážím tvou prosbu.
	}
	else
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_H_01_03");	//Nyní, když jsi přinesl dar, dostaneš novou zbroj.
		B_GiveInvItems(hero,self,ItMi_Gold,VALUE_ITAR_TPL_S);
		CreateInvItems(hero,itar_tpl_s,1);
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_TPL_S);
		TAKETPLBESTARMOR = TRUE;
		BuyTemplerHeavy = TRUE;
	};
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};

func void tpl_8005_gornakosh_armor_l()
{
	AI_Output(hero,self,"TPL_8005_GorNaKosh_ARMOR_L_01_00");	//Potřebuji lehkou zbroj templáře.

	if(Npc_HasItems(hero,ItMi_Gold) < VALUE_ITAR_TPL_L)
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_L_01_02");	//Jakmile poskytneš dostatečný dar Bratrstvu na jeho potřeby, zvážím tvou prosbu.
	}
	else
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_L_01_03");	//Nyní, když jsi přinesl dar, dostaneš novou zbroj.
		B_GiveInvItems(hero,self,ItMi_Gold,VALUE_ITAR_TPL_L);
		CreateInvItems(hero,itar_tpl_l,1);
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_TPL_L);
		BuyTemplerLight = TRUE;
	};
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};

func void tpl_8005_gornakosh_armor_back()
{
	AI_Output(hero,self,"TPL_8005_GorNaKosh_ARMOR_BACK_01_01");	//Změnil jsem rozhodnutí!
	AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_BACK_01_02");	//Jak cheš. Víš, kde mě najít.
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};


instance DIA_GORNAKOSH_GATHERARMY(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_gatherarmy_condition;
	information = dia_gornakosh_gatherarmy_info;
	permanent = FALSE;
	description = "Poslal mě Baal Orun!";
};


func int dia_gornakosh_gatherarmy_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalorun_gatherarmy))
	{
		return TRUE;
	};
};

func void dia_gornakosh_gatherarmy_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_00");	//Poslal mě Baal Orun!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_01");	//Co ode mě Guru žádá?
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_02");	//Ptá se, jestli je Bratrstvo připraveno odolat skřetům! Souhlasil totiž s návrhem lorda Hagena!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_06");	//Dokonalé! Již dlouho jsem říkal, že nesmíme jen tak čekat, až skřeti přijdou. Když nás podpoří paladinové krále, myslím, že jsme připraveni jim pomoct!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_09");	//Naneštěstí ale máme malý problém...
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_10");	//Jaký problém?!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_13");	//Mno, znepokojuje mě, že s námi bude chtít mnoho noviců...
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_15");	//Protože s jejich výbavou nemůžou jít do bitvy!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_16");	//Nevydrželi by proti sekyrám skřetů.
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_17");	//Tak jim rozdej zbroje templářů!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_18");	//To není tak jedoduché příteli, protože většinu jsme nechali v Hornickém údolí.
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_22");	//Co navrhuješ?
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_23");	//Jak znám skřety, jsou v boji neohrabaní a pomalí!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_24");	//Takže kdyby moji lidé byli dostatečně rychlí, mohli by se jejich úderům vyhnout.
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_25");	//A jak ti můžu pomoci?
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_26");	//Napadají mě lektvary rychlosti.
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_28");	//Věřím, že 50 by stačilo. Pak podpoříme paladiny!
	MIS_GORNAKOSHSPEEDPOTION = LOG_Running;
	Log_CreateTopic(TOPIC_GORNAKOSHSPEEDPOTION,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORNAKOSHSPEEDPOTION,LOG_Running);
	B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Bratrstvo podpoří paladiny, když jim přinesu dostatek lektvarů rychlosti. Alespoň padesát.");
};


instance DIA_GORNAKOSH_GATHERARMYDONE(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_gatherarmydone_condition;
	information = dia_gornakosh_gatherarmydone_info;
	permanent = FALSE;
	description = "Mám lektvary pro tvé lidi.";
};

func int dia_gornakosh_gatherarmydone_condition()
{
	if((MIS_GORNAKOSHSPEEDPOTION == LOG_Running) && ((Npc_HasItems(other,ITPO_SPEED_03) >= 50) || (Npc_HasItems(other,ItPo_Speed) >= 50) || (Npc_HasItems(other,itpo_speed_02) >= 50) || (Npc_HasItems(other,ItFo_Addon_SchnellerHering) >= 50)))
	{
		return TRUE;
	};
};

func void dia_gornakosh_gatherarmydone_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmyDone_01_01");	//Mám lektvary pro tvé lidi.

	if(Npc_HasItems(other,ItFo_Addon_SchnellerHering) >= 50)
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(other,self,ItFo_Addon_SchnellerHering,50);
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_04");	//Co to je?!
		AI_Output(other,self,"DIA_GorNaKosh_GatherArmyDone_01_05");	//Tento nápoj se jmenuje rychlý sleď. Funguje jako lektvar rychlosti.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_08");	//Hmmm... Dobrá, snad je to tak, jak říkáš.
		if(Npc_HasItems(self,ItFo_Addon_SchnellerHering) == 0)
		{
			CreateInvItem(self,ItFo_Addon_SchnellerHering);
		};
		AI_UseItem(self,ItFo_Addon_SchnellerHering);
		AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_09");	//Aargh...
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_10");	//Funguje to! Ach to je síla.
		AI_Output(other,self,"DIA_GorNaKosh_GatherArmyDone_01_11");	//Jak se cítíš?!
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_12");	//Jako, kdyby na mě plivl drak.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_13");	//Kde jsi to sebral?!
		AI_Output(other,self,"DIA_GorNaKosh_GatherArmyDone_01_14");	//U pirátů. Pijou to jako kořalku.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_15");	//Nyní mí lidé budou dost rychlí. Děkuji.
		B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Dal jsem Bratrstvu lektvary. Souhlasili jít do bitvy!");
	}
	else if(Npc_HasItems(other,itpo_speed_02) >= 50)
	{
		B_GivePlayerXP(400);
		B_GiveInvItems(other,self,itpo_speed_02,50);
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_18");	//Dvojité lektvary rychlosti?!... To je excelentní.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_21");	//Nyní mí lidé budou dost rychlí. Děkuji.
		B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Dal jsem Bratrstvu lektvary. Souhlasili jít do bitvy!");
	}
	else if(Npc_HasItems(other,ITPO_SPEED_03) >= 50)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ITPO_SPEED_03,50);
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_24");	//Dobrá, to potřebujeme.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_25");	//Nyní mí lidé budou dost rychlí. Děkuji.
		B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Dal jsem Bratrstvu lektvary. Souhlasili jít do bitvy!");
	}
	else if(Npc_HasItems(other,ItPo_Speed) >= 50)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ItPo_Speed,50);
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_24");	//Dobrá, to potřebujeme.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_25");	//Nyní mí lidé budou dost rychlí. Děkuji.
		B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Dal jsem Bratrstvu lektvary. Souhlasili jít do bitvy!");
	};
	MIS_GORNAKOSHSPEEDPOTION = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GORNAKOSHSPEEDPOTION,LOG_SUCCESS);
};

instance DIA_GORNAKOSH_GATHERARMYGO(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_gatherarmygo_condition;
	information = dia_gornakosh_gatherarmygo_info;
	permanent = FALSE;
	description = "Jsi připraven podpořit paladiny?";
};

func int dia_gornakosh_gatherarmygo_condition()
{
	if(MIS_GORNAKOSHSPEEDPOTION == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gornakosh_gatherarmygo_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmyGo_01_01");	//Jsi připraven podpořit paladiny?
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmyGo_01_02");	//Ano, běž vyřídit mou odpověď lordu Hagenovi.
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmyGo_01_03");	//A zjisti kde má v plánu se skřety bojovat.
	TPL_JOINHAGEN = TRUE;
	B_LogEntry(TOPIC_ORсGREATWAR,"Bratrstvo se připojí k paladinům. Měl bych to říci lordu Hagenovi!");
	AI_StopProcessInfos(self);
	B_GorNaKoshEquipWeapon(self);
};