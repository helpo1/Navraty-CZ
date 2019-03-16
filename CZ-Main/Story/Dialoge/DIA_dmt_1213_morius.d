
instance DMT_1213_MORIUS_EXIT(C_Info)
{
	npc = dmt_1213_morius;
	nr = 999;
	condition = dmt_1213_morius_exit_condition;
	information = dmt_1213_morius_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1213_morius_exit_condition()
{
	return TRUE;
};

func void dmt_1213_morius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1213_MORIUS_HELLO(C_Info)
{
	npc = dmt_1213_morius;
	condition = dmt_1213_morius_hello_condition;
	information = dmt_1213_morius_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1213_morius_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (DAGOT_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1213_morius_hello_info()
{
	AI_Output(self,other,"DMT_1213_Morius_Hello_00");	//Tak, tak... Kdo je to zde?!
	AI_Output(self,other,"DMT_1213_Morius_Hello_01");	//Ááá... Dagoth mi o tobě hodně vyprávěl.
	AI_Output(self,other,"DMT_1213_Morius_Hello_02");	//Jsem překvapen, že jsi přemohl Luciana, i když s pomocí Asgarda.
	AI_Output(self,other,"DMT_1213_Morius_Hello_03");	//Miláček bohů (smích)...
	AI_Output(other,self,"DMT_1213_Morius_Hello_04");	//Ty jsi Strážce? Nehledal jsem tě.
	AI_Output(self,other,"DMT_1213_Morius_Hello_05");	//Měl jsi mě najít, to mi věř.
	AI_Output(self,other,"DMT_1213_Morius_Hello_06");	//Tak, co bys rád?...
	AI_Output(other,self,"DMT_1213_Morius_Hello_07");	//Přišel jsem pro svolení stát se jedním z vás.
	AI_Output(self,other,"DMT_1213_Morius_Hello_08");	//Pak víš co máš dělat?
	AI_Output(other,self,"DMT_1213_Morius_Hello_09");	//Ano, splnit tvůj úkol.
	AI_Output(self,other,"DMT_1213_Morius_Hello_10");	//A jsi připraven?
	B_RemoveNpc(dmt_1212_dagot);
	Info_ClearChoices(dmt_1213_morius_hello);
	Info_AddChoice(dmt_1213_morius_hello,"Ano, mistře.",dmt_1213_morius_hello_test);
};

func void dmt_1213_morius_hello_test()
{
	AI_Output(other,self,"DMT_1213_Morius_Hello_11");	//Ano, mistře.
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1213_Morius_Hello_12");	//Výborně. Já, Morius, druhý strážce boha Beliara a osmý Strážce posvátných Vakhanských síní ti dávám tvůj druhý úkol...
	AI_Output(self,other,"DMT_1213_Morius_Hello_13");	//Poslouchej pozorně.
	AI_Output(self,other,"DMT_1213_Morius_Hello_14");	//Lucian je mrtev, ale to se Beliarovi nelíbí.
	AI_Output(self,other,"DMT_1213_Morius_Hello_15");	//Beliar nemá rád když někdo zasáhne do jeho pomsty bez otázání.
	AI_Output(self,other,"DMT_1213_Morius_Hello_16");	//A my nesmíme dovolit, aby se Temný bůh hněval.
	AI_Output(self,other,"DMT_1213_Morius_Hello_17");	//Musíme dát Beliarovi dar.
	AI_Output(other,self,"DMT_1213_Morius_Hello_18");	//Jaký dar? Snad ne lidskou oběť?!
	AI_Output(self,other,"DMT_1213_Morius_Hello_19");	//Ne, když jsi zabil démona, vzal jsi jeho srdce.
	AI_Output(self,other,"DMT_1213_Morius_Hello_20");	//Duše těch, které zabil jsou v něm.
	AI_Output(self,other,"DMT_1213_Morius_Hello_21");	//Byl to Beliarův sběrač duší a ty duše se musí dostat k Beliarovi.
	AI_Output(other,self,"DMT_1213_Morius_Hello_22");	//A jak mu je vrátíme?
	AI_Output(self,other,"DMT_1213_Morius_Hello_23");	//Mágové Ohně v klášteře mají jisté knihy o tom, jak se to dělá.
	AI_Output(self,other,"DMT_1213_Morius_Hello_24");	//Měl bys je najít, vyjmout ze srdce duše a jít k nejbližší svatyni... a složit modlitbu Temnému bohu...
	AI_Output(self,other,"DMT_1213_Morius_Hello_26");	//... to by mělo zažehnat Beliarův hněv! Zde je srdce, dej na něj pozor!
	B_GiveInvItems(self,other,itat_luzianheart,1);
	AI_Output(self,other,"DMT_1213_Morius_Hello_27");	//A nezapomeň si nasadit prsten co ti dal Dagoth.
	AI_Output(self,other,"DMT_1213_Morius_Hello_28");	//Nyní jdi a splň mou vůli.
	AI_StopProcessInfos(self);
	MIS_MORIUSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_MORIUSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MORIUSTEST,LOG_Running);
	B_LogEntry(TOPIC_MORIUSTEST,"Morius, druhý strážce boha Beliara a osmý Strážce posvátných Vakhanských síní, mi zadal další úkol - mám obětovat Beliarovi duše uchvácené Lucianem. V klášteře Ohně jsou jisté knihy ze kterých se to dozvím, měl bych pak udělat příšlušný lektvar, obětovat ho s nasazeným prstenem, který jsem dostal o Dagotha a vrátit se za Moriusem.");
	MORIUS_AGREE = FALSE;
	SOUL_PRAY = FALSE;
	READ_SOULRIVER = FALSE;
	SOULRIVER = FALSE;
	MORIUS_MEET = TRUE;
	PARLAN_SOULRIVER = FALSE;
	SOUL_PRAY_BLESSED = FALSE;
	Wld_InsertItem(itwr_soulriver,"FP_NW_ITEM_LIBRARY_IRDORATHBOOK");
};


instance DMT_1213_MORIUS_TEST(C_Info)
{
	npc = dmt_1213_morius;
	nr = 1;
	condition = dmt_1213_morius_test_condition;
	information = dmt_1213_morius_test_info;
	permanent = FALSE;
	description = "Udělal jsem co jsi chtěl.";
};


func int dmt_1213_morius_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_MORIUSTEST == LOG_Running) && (SOUL_PRAY == TRUE) && (SOUL_PRAY_AFTER_END == TRUE) && (MORIUS_AGREE == FALSE))
	{
		return TRUE;
	};
};

func void dmt_1213_morius_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DMT_1213_Morius_Test_00");	//Udělal jsem co jsi chtěl - zaplatil jsem Temnému bohu!
	AI_Output(self,other,"DMT_1213_Morius_Test_01");	//(silný) Ano citil jsem to jakmile Beliar přijal svůj dar.
	AI_Output(self,other,"DMT_1213_Morius_Test_02");	//Nyní je vše jak má být.
	MIS_MORIUSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MORIUSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_MORIUSTEST,"Prošel jsem Moriovou zkouškou.");
	Info_ClearChoices(dmt_1213_morius_test);
	Info_AddChoice(dmt_1213_morius_test,"Dáš mi své svolení, mistře?",dmt_1213_morius_test_pass);
};

func void dmt_1213_morius_test_pass()
{
	AI_Output(other,self,"DMT_1213_Morius_Test_03");	//Dáš mi své svolení, mistře?
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1213_Morius_Test_04");	//Ano, samozřejmě. Splnil jsi vše co jsem požadoval.
	if(SAFEYOURING == TRUE)
	{
		AI_Output(self,other,"DMT_1213_Morius_Test_05");	//Kromě toho, Beliar zkusil napadnout tvou duši - jen síla prstenu tě ochránila!
		AI_Output(self,other,"DMT_1213_Morius_Test_06");	//Vidím, že jsi moudrý. Nezapomněl si na mou radu.
		AI_Output(self,other,"DMT_1213_Morius_Test_07");	//Nyní hledej dalšího z nás!
		AI_Output(self,other,"DMT_1213_Morius_Test_08");	//Sbohem!
		B_LogEntry(TOPIC_GUARDIANSTEST,"Po splnění Moriusova úkolu bych měl hledat další Strážce!");
		MORIUS_AGREE = TRUE;
		Info_ClearChoices(dmt_1213_morius_test);
		Info_AddChoice(dmt_1213_morius_test,"... (KONEC)",dmt_1213_morius_test_end);
	}
	else
	{
		AI_Output(self,other,"DMT_1213_Morius_Test_09");	//Mezitím, vidím, že Beliar se pokusil proklet tvou duši - a že se mu to celkem povedlo...(zklamaně)
		AI_Output(self,other,"DMT_1213_Morius_Test_10");	//Prsten od Dagotha by tě ochránil, ale je pozdě!
		AI_Output(self,other,"DMT_1213_Morius_Test_11");	//Už se stalo!
		AI_Output(other,self,"DMT_1213_Morius_Test_12");	//Je možné to nějak zvrátit?
		AI_Output(self,other,"DMT_1213_Morius_Test_13");	//Možná...(přemyšlí) Ti pomohou mágové Ohně!
		AI_Output(self,other,"DMT_1213_Morius_Test_14");	//Nyní jdi hledat dalšího z nás!
		AI_Output(self,other,"DMT_1213_Morius_Test_15");	//Sbohem!
		B_LogEntry(TOPIC_GUARDIANSTEST,"Po splnění zkoušky Moriuse bych měl hledat další Strážce!");
		Log_AddEntry(TOPIC_BELIARCURSE,"Morius mě poslal za mágy Ohně - ti mi možná pomohou zlomit kletbu!");
		MORIUS_AGREE = TRUE;
		Info_ClearChoices(dmt_1213_morius_test);
		Info_AddChoice(dmt_1213_morius_test,"... (KONEC)",dmt_1213_morius_test_end);
	};
};

func void dmt_1213_morius_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

