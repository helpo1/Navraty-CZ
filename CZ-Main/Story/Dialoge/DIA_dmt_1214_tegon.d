
instance DMT_1214_TEGON_EXIT(C_Info)
{
	npc = dmt_1214_tegon;
	nr = 999;
	condition = dmt_1214_tegon_exit_condition;
	information = dmt_1214_tegon_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1214_tegon_exit_condition()
{
	return TRUE;
};

func void dmt_1214_tegon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1214_TEGON_HELLO(C_Info)
{
	npc = dmt_1214_tegon;
	condition = dmt_1214_tegon_hello_condition;
	information = dmt_1214_tegon_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1214_tegon_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MORIUS_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1214_tegon_hello_info()
{
	AI_Output(self,other,"DMT_1214_Tegon_Hello_00");	//Vidím, že jsi splnil Moriusův úkol. Na cestě, kterou sis vybral tě provází štěstí!
	AI_Output(self,other,"DMT_1214_Tegon_Hello_01");	//Ale nebuď překvapen, jestli tě opustí štěstí odejdeš do věčného zapomnění...
	AI_Output(other,self,"DMT_1214_Tegon_Hello_02");	//Ty jsi taky Strážce?!...
	AI_Output(self,other,"DMT_1214_Tegon_Hello_03");	//Myslím, že bych ti měl dát vědět kdo... No, na zbytečné řeči není čas.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_04");	//Bude lepší, když přijdeme k věci - tak proč tu jsi?
	AI_Output(other,self,"DMT_1214_Tegon_Hello_05");	//Přišel jsem se tě zeptat na tvé rozhodnutí ohledně mého vstupu do kruhu Strážců.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_06");	//Takže jsi tu, abych ti položil úkol.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_08");	//Jsi připraven?
	Info_ClearChoices(dmt_1214_tegon_hello);
	Info_AddChoice(dmt_1214_tegon_hello,"Ano, jsem připraven.",dmt_1214_tegon_hello_test);
};

func void dmt_1214_tegon_hello_test()
{
	AI_Output(other,self,"DMT_1214_Tegon_Hello_09");	//Ano, jsem připraven.
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1214_Tegon_Hello_10");	//Dobrá. Já, Tegon, třetí strážce boha Beliara a devátý Strážce posvátných Vakhanských síní ti dávám tvůj další úkol...
	AI_Output(self,other,"DMT_1214_Tegon_Hello_11");	//Poslouchej pozorně a pamatuj si co ti říkám.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_12");	//Nebudeš muset proti nikomu tasit zbraň, ale nemysli si, že to bude procházka růžovým sadem.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_13");	//Půjdeš do horního podlaží Xardasovi věže. Jestli jsi tam ještě nebyl, měl bys to napravit.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_14");	//Přečteš tam jeho knihy a zapamatuješ si jejich obsah a to, co nám sdělují.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_15");	//Pro prostého člověka jsou bezcenné!...
	AI_Output(self,other,"DMT_1214_Tegon_Hello_16");	//Jsou napsány v klasickém jazyce démonů, a já ti můžu povědět - jen málo lidí umí tento jazyk.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_17");	//Musíš pochopit tento jazyk, abys mohl studovat Xardasovi knihy.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_18");	//Až to vše uděláš, přijď za mnou a povíme si co dál.
	AI_Output(other,self,"DMT_1214_Tegon_Hello_19");	//Ale kdo mě může naučit tomuto jazyku?!
	AI_Output(self,other,"DMT_1214_Tegon_Hello_20");	//Promluv si s Xardasem - určitě ti pomůže.
	AI_Output(self,other,"DMT_1214_Tegon_Hello_21");	//Nyní jdi, udělej vše co je třeba a pak se vrať.
	AI_StopProcessInfos(self);
	MIS_TEGONTEST = LOG_Running;
	Log_CreateTopic(TOPIC_TEGONTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TEGONTEST,LOG_Running);
	B_LogEntry(TOPIC_TEGONTEST,"Další zkoušku mi zadal Strážce Tegon - třetí strážce boha Beliara a devátý Strážce posvátných Vakhanských síní. Musím se naučit jazyk démonů a pak přečíst všechny knihy v Xardasově věži. Pak se mám za ním vrátit pro zbytek zadání.");
};


instance DMT_1214_TEGON_TEST(C_Info)
{
	npc = dmt_1214_tegon;
	nr = 1;
	condition = dmt_1214_tegon_test_condition;
	information = dmt_1214_tegon_test_info;
	permanent = FALSE;
	description = "Udělal jsem co jsi mi nařídil, mistře.";
};


func int dmt_1214_tegon_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_TEGONTEST == LOG_Running) && (KNOWDEMENTORLANGUAGE == TRUE) && (READDEMENTORBOOK_01 == TRUE) && (READDEMENTORBOOK_02 == TRUE) && (READDEMENTORBOOK_03 == TRUE) && (READDEMENTORBOOK_04 == TRUE) && (READDEMENTORBOOK_05 == TRUE) && (READDEMENTORBOOK_06 == TRUE) && (READDEMENTORBOOK_07 == TRUE) && (TEGON_TEST == FALSE))
	{
		return TRUE;
	};
};

func void dmt_1214_tegon_test_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DMT_1214_Tegon_Test_00");	//Udělal jsem co jsi mi nařídil, mistře.
	AI_Output(self,other,"DMT_1214_Tegon_Test_01");	//(panovačně) Už to vím...
	AI_Output(self,other,"DMT_1214_Tegon_Test_02");	//Prokázal jsi, že jsi schopem mnoha věcí!
	AI_Output(self,other,"DMT_1214_Tegon_Test_03");	//Nejdůležitější část zkoušky, která rozhodne o tom, jestli jsi ní prošel teprve přijde. Podíváme se jak si pamatuješ co bylo v těch knihách.
	AI_Output(self,other,"DMT_1214_Tegon_Test_04");	//Myslím, že to by pro tebe neměl být problém.
	AI_Output(self,other,"DMT_1214_Tegon_Test_05");	//Dám ti otázky a ty budeš odpovídat.
	AI_Output(self,other,"DMT_1214_Tegon_Test_06");	//Pokud odpovědi budou správné, prošel jsi.
	AI_Output(self,other,"DMT_1214_Tegon_Test_09");	//Dobrá! Tak se připrav na mé otázky.
	B_LogEntry(TOPIC_TEGONTEST,"Nyní přišla hlavní část Tegonovy zkoušky - Strážce bude klást otázky a já odpovídat.");
	TEGON_TEST = TRUE;
};


instance DIA_TEGON_TEST_FRAGEN(C_Info)
{
	npc = dmt_1214_tegon;
	nr = 5;
	condition = dia_tegon_test_fragen_condition;
	information = dia_tegon_test_fragen_info;
	permanent = TRUE;
	description = "Jsem připraven odpovědět na tvé otázky.";
};


func int dia_tegon_test_fragen_condition()
{
	if((MIS_TEGONTEST == LOG_Running) && (TEGON_TEST == TRUE) && (TEGON_AGREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_tegon_test_fragen_failed()
{
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Failed_01_00");	//Nedokázal jsi odpovědět na mé otázky.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Failed_01_01");	//Dokud nebudou tvé odpovědi pravdivé, nedám ti svolení.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Failed_01_02");	//Jdi a vrať se až budeš schopen zapamatovat si obsah těch knih.
	Info_ClearChoices(dia_tegon_test_fragen);
	AI_StopProcessInfos(self);
};

func void dia_tegon_test_fragen_testok()
{
	B_GivePlayerXP(200);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_00");	//Správně jsi odpověděl na všechny mé otázky...
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_01");	//... ukazuje to, že máš i dostatek moudrosti.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_02");	//Myslím, že v našem kruhu bys byl přínosem.
	AI_Output(other,self,"DIA_Tegon_Test_Fragen_TestOk_01_04");	//Znamená to, že mám tvé svolení, mistře?
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_05");	//Ano, dávám ti můj souhlas vstoupit do našeho kruhu.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_TestOk_01_06");	//Přišel čas, abychom se rozloučili - jdi dál po tvé cestě ke kruhu!
	MIS_TEGONTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TEGONTEST,LOG_SUCCESS);
	Log_AddEntry(TOPIC_TEGONTEST,"Odpověděl jsem správně na Tegonovy otázky, takže jsem splnil jeho zkoušku.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Tegon mi dal souhlas vstoupit do jejich kruhu.");
	TEGON_AGREE = TRUE;
	Info_ClearChoices(dia_tegon_test_fragen);
	Info_AddChoice(dia_tegon_test_fragen,"... (KONEC)",dia_tegon_test_fragen_end);
};

func void dia_tegon_test_fragen_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

func void b_tegon_fragen_choices()
{
	if(TEGON_TESTEND == TRUE)
	{
		if(TEGON_RICHTIGEANTWORTEN < 8)
		{
			dia_tegon_test_fragen_failed();
		}
		else
		{
			dia_tegon_test_fragen_testok();
		};
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Osmá otázka - 'Co byl pravý důvod, že sis zvolil tuto cestu?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_04");	//Dobrá! Nyní poslední a nejdůležitější otázka.
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_05");	//Zní velmi jednoduše, ale není.
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_06");	//Co byl pravý důvod, že sis zvolil tuto cestu?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Taková byla vůle bohů.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Bylo to mé vlastní rozhodnutí.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Vybral mě osud!",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Přilákala mě moc Strážců.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Byla to prostě náhoda.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Nevím.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"'Sedmá otázka - 'Kdo toužil po nekonečné moci a započal válku bohů?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_07");	//Kdo toužil po nekonečné moci a započal válku bohů?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Innos.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Adanos.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Beliar.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Chaos.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Stonos.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Nevím.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Šestá otázka - 'Kdo je největší hrozbou pro tento svět?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_08");	//Kdo je největší hrozbou pro tento svět?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Chaos.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Draci.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Beliar.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Innos.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Skřeti.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Nevím.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Pátá otázka - 'Čeho si Strážci cení nade vše a je tím pravým pokladem?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_09");	//Čeho si Strážci cení nade vše a je tím pravým pokladem?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Síla.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Znalosti.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Moudrost.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Zlato.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Moc.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Nevím.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Čtvrtá otázka - 'Co je pro učení Strážců nepřirozené?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_10");	//Co je pro učení Strážců nepřirozené?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Pocity.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Ctnost.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Zlo.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Slabost.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Tohle všechno dohromady.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Nevím.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Třetí otázka - 'Jaký je pravý cíl cesty Strážců a co je cestou k existenci světa?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_11");	//Jaký je pravý cíl cesty Strážců a co je cestou k existenci světa?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Ctnost.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Rovnost.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Zlo.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Rovnováha.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Chaos.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Nevím.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"Druhá otázka - 'Kdo jsou posvátnými strážci tohoto světa?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_12");	//Kdo jsou posvátnými strážci tohoto světa?
		Info_ClearChoices(dia_tegon_test_fragen);
		Info_AddChoice(dia_tegon_test_fragen,"Bohové.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Elementy.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Paladinové.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Strážci.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Základy elementů.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Nevím.",dia_tegon_test_fragen_answer_6);
	}
	else if(TEGON_NEXTQUESTION == 0)
	{
		Log_AddEntry(TOPIC_TEGON_QUESTIONS,"První otázka - 'Kdo jsou Tvůrci?'");
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_13");	//Kdo jsou Tvůrci?
		Info_AddChoice(dia_tegon_test_fragen,"Strážci.",dia_tegon_test_fragen_answer_1);
		Info_AddChoice(dia_tegon_test_fragen,"Bohové.",dia_tegon_test_fragen_answer_2);
		Info_AddChoice(dia_tegon_test_fragen,"Elementy.",dia_tegon_test_fragen_answer_3);
		Info_AddChoice(dia_tegon_test_fragen,"Lidé.",dia_tegon_test_fragen_answer_4);
		Info_AddChoice(dia_tegon_test_fragen,"Chaos.",dia_tegon_test_fragen_answer_5);
		Info_AddChoice(dia_tegon_test_fragen,"Nevím.",dia_tegon_test_fragen_answer_6);
	};
};

func void dia_tegon_test_fragen_info()
{
	TEGON_NEXTQUESTION = 0;
	TEGON_RICHTIGEANTWORTEN = 0;
	TEGON_TESTEND = FALSE;
	AI_Output(other,self,"DIA_Tegon_Test_Fragen_01_00");	//Jsem připraven odpovědět na tvé otázky.
	if(dia_tegon_test_fragen_info_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_01");	//Tak neztrácejme čas a začněme!
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_02");	//Poslouchej pozorně a odpovídej správně...
		B_LogEntry(TOPIC_TEGONTEST," --- Otázky Strážce Tegona --- ");
		dia_tegon_test_fragen_info_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Tegon_Test_Fragen_01_03");	//Poslouchej pozorně a odpovídej správně...
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_1()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_00");	//Strážci.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_01");	//Bohové.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_02");	//Ctnost
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_03");	//Pocity.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_04");	//Síla.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_05");	//Chaos.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_06");	//Innos.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_1_01_07");	//Taková byla vůle bohů.
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_2()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_00");	//Bohové.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_01");	//Elementy.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_02");	//Rovnost.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_03");	//Ctnost.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_04");	//Znalosti.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_05");	//Draci.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_06");	//Adanos.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_2_01_07");	//Bylo to mé vlastní rozhodnutí.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_3()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_00");	//Elementy.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_01");	//Paladinové.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_02");	//Zlo.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_03");	//Zlo.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_04");	//Moudrost.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_05");	//Beliar.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_06");	//Beliar.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_3_01_07");	//Vybral mě osud!
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_4()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_00");	//Lidé.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_01");	//Strážci.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_02");	//Rovnováha.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_03");	//Slabost.
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_04");	//Zlato.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_05");	//Innos.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_06");	//Chaos.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_4_01_07");	//Přilákala mě síla a moc Strážců.
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_5()
{
	if(TEGON_NEXTQUESTION == 0)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_00");	//Chaos.
	}
	else if(TEGON_NEXTQUESTION == 1)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_01");	//Základy elementů.
	}
	else if(TEGON_NEXTQUESTION == 2)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_02");	//Chaos.
	}
	else if(TEGON_NEXTQUESTION == 3)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_03");	//Tohle všechno dohromady.
		TEGON_RICHTIGEANTWORTEN = TEGON_RICHTIGEANTWORTEN + 1;
	}
	else if(TEGON_NEXTQUESTION == 4)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_04");	//Moc.
	}
	else if(TEGON_NEXTQUESTION == 5)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_05");	//Skřeti.
	}
	else if(TEGON_NEXTQUESTION == 6)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_06");	//Stonnos.
	}
	else if(TEGON_NEXTQUESTION == 7)
	{
		AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_5_01_07");	//Byla to prostě náhoda.
	};
	TEGON_NEXTQUESTION = TEGON_NEXTQUESTION + 1;
	if(TEGON_NEXTQUESTION > 7)
	{
		TEGON_TESTEND = TRUE;
	};
	b_tegon_fragen_choices();
};

func void dia_tegon_test_fragen_answer_6()
{
	AI_Output(other,self,"DIA_Tegon_Test_Fragen_Answer_6_01_00");	//Nevím.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Answer_6_01_01");	//Tak neplýtvej mým časem.
	AI_Output(self,other,"DIA_Tegon_Test_Fragen_Answer_6_01_02");	//Jdi znovu studovat a přijď až budeš vědět.
	AI_StopProcessInfos(self);
};

