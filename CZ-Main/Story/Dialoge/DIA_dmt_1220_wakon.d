
instance DMT_1220_WAKON_EXIT(C_Info)
{
	npc = dmt_1220_wakon;
	nr = 999;
	condition = dmt_1220_wakon_exit_condition;
	information = dmt_1220_wakon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1220_wakon_exit_condition()
{
	return TRUE;
};

func void dmt_1220_wakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1220_WAKON_HELLO(C_Info)
{
	npc = dmt_1220_wakon;
	condition = dmt_1220_wakon_hello_condition;
	information = dmt_1220_wakon_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1220_wakon_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (NARUS_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1220_wakon_hello_info()
{
	AI_Output(self,other,"DMT_1220_Wakon_Hello_00");	//Takže se konečně setkáváme, člověče!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_01");	//Doufám, že ti nemusím vysvětlovat kdo jsem?
	AI_Output(other,self,"DMT_1220_Wakon_Hello_02");	//Jsi jeden ze Strážců, nemá pravdu?!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_03");	//Správně, smrtelníku... Před tebou stojí Wakon, třetí strážce Vody a Strážce posvátných Vakhanských síní.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_04");	//Přišel čas na tvou zkoušku u mě!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_05");	//Jedině když ho podstoupíš, přijmeme tě.
	AI_Output(other,self,"DMT_1220_Wakon_Hello_06");	//Já vím, mistře.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_07");	//Dobrá, ale nemyslím si, že bude jednoduchý.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_08");	//(mocně)Pak neztrácejme čas, jsi připraven?!
	Info_ClearChoices(dmt_1220_wakon_hello);
	Info_AddChoice(dmt_1220_wakon_hello,"Ano, mistře - jsem.",dmt_1220_wakon_hello_test);
};

func void dmt_1220_wakon_hello_test()
{
	AI_Output(other,self,"DMT_1220_Wakon_Hello_09");	//Ano, mistře - jsem.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1220_Wakon_Hello_10");	//Pak pozorně poslouchej...
	AI_Output(self,other,"DMT_1220_Wakon_Hello_11");	//Tvá cesta tě zavede na místo zvané Gades - lidé ho pojmenovali Hornické údolí.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_12");	//Myslím, že ho znáš.
	AI_Output(other,self,"DMT_1220_Wakon_Hello_13");	//Ano, mistře.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_14");	//Dobrá... Najdeš tam jednoho z pěti Duchů Vody sloužících Adanovi a osvobodíš ho!
	AI_Output(other,self,"DMT_1220_Wakon_Hello_15");	//Osvobodit Ducha Vody?!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_16");	//Chápu, že podobný úkol tě musí překvapit.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_17");	//Nicméně, jestliže neprojdeš, nesplníš mou zkoušku.
	AI_Output(other,self,"DMT_1220_Wakon_Hello_18");	//A kdo je ten Duch Vody?!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_19");	//Dítě elementu vody! Prastaré esence, ze kterých získáváme sílu.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_20");	//Jsou dalším zdrojem vědění a moci.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_22");	//Je to pár století co jeden šaman zajal Ducha Vody, aby jeho kmeni přinesl sílu.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_23");	//Nicméně i přes svou sílu jsou to bezzbranná stvoření!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_24");	//Ale ti skřeti si neuvědomili, že vězněním ho pomalu ničí!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_27");	//Když Duch Vody nemá možnost si dobíjet energii od elementů, začne uvadat.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_28");	//Takže s největší pravděpodobností ztratil svou sílu.
	AI_Output(other,self,"DMT_1220_Wakon_Hello_29");	//Ale proč jste ho ještě neosvobodili?
	AI_Output(self,other,"DMT_1220_Wakon_Hello_30");	//Měl bys pochopit, že neděláme věci, které by mohly změnit chod času.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_31");	//Mohla by se poničit rovnováha tohoto světa!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_32");	//Z toho důvodu užíváme smrtelníky!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_34");	//Jdi do Gades a uvolni zajatce z vězení.(velitelsky)Počkám tu na tebe.
	AI_StopProcessInfos(self);
	MIS_WAKONTEST = LOG_Running;
	Log_CreateTopic(TOPIC_WAKONTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WAKONTEST,LOG_Running);
	B_LogEntry(TOPIC_WAKONTEST,"Strážce Wakon mi dal úkol jít do Hornického údolí a osvobodit Ducha Vody! Kdysi ho uvěznil jeden skřetí šaman.");

	if(URSHAKISDEAD == FALSE)
	{
		Log_AddEntry(TOPIC_WAKONTEST,"Měl bych se znovu spojit se skřety - je čas navštívit Ur-Shaka a poptat se jak se mu daří...");
	};
};


instance DMT_1220_WAKON_TEST(C_Info)
{
	npc = dmt_1220_wakon;
	nr = 1;
	condition = dmt_1220_wakon_test_condition;
	information = dmt_1220_wakon_test_info;
	important = FALSE;
	permanent = TRUE;
	description = "Duch Vody je volný!";
};


func int dmt_1220_wakon_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_WAKONTEST == LOG_Running) && (FREEWATERSOUL == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1220_wakon_test_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DMT_1220_Wakon_Test_00");	//Duch Vody je volný!
	AI_Output(self,other,"DMT_1220_Wakon_Test_01");	//To jsou dobré zprávy, ale už to vím.
	AI_Output(other,self,"DMT_1220_Wakon_Test_02");	//Jakto?!
	AI_Output(self,other,"DMT_1220_Wakon_Test_03");	//Všechno je jednoduché, člověče - nezapomínej, že my jsme Strážci!
	AI_Output(self,other,"DMT_1220_Wakon_Test_04");	//Dozvídáme se informace pomocí všech živých stvoření, pamatuj na to, že každý z nás to dokáže.
	AI_Output(self,other,"DMT_1220_Wakon_Test_06");	//Divím se, že sis toho ještě nevšiml.
	AI_Output(self,other,"DMT_1220_Wakon_Test_07");	//Ale to není důležité, důležité je, že jsi splnil můj úkol! Víš co to znamená, ne?
	MIS_WAKONTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WAKONTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_WAKONTEST,"Splnil jsem Wakonovu zkoušku.");
	Info_ClearChoices(dmt_1220_wakon_test);
	Info_AddChoice(dmt_1220_wakon_test,"Ano, vím.",dmt_1220_wakon_test_pass);
};

func void dmt_1220_wakon_test_pass()
{
	AI_Output(other,self,"DMT_1220_Wakon_Test_08");	//Ano, vím.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	B_LogEntry(TOPIC_GUARDIANSTEST,"Splnil jsem úkol Strážce Wakona - nyní zbývá poslední z nich, jejich vůdce. Zdá se že ho najdu na místě který představuje element který ho stvořil. Pokud si dobře vzpomínám tento element není nic jiného než posvátný Kámen!");
	WAKON_AGREE = TRUE;
	AI_Output(self,other,"DMT_1220_Wakon_Test_09");	//Pak ti z moci mě svěřené Adanem já - Wakon, třetí strážce Vody a první Strážce posvátných Vakhanských síní - dávám svůj souhlas.
	AI_Output(self,other,"DMT_1220_Wakon_Test_10");	//Mé rozhodnutí je pevné a nehodlám ho změnit!
	AI_Output(other,self,"DMT_1220_Wakon_Test_11");	//Děkuji, mistře. Teď budu sloužit správcům?
	AI_Output(self,other,"DMT_1220_Wakon_Test_12");	//Zasloužíš si můj souhlas!
	AI_Output(self,other,"DMT_1220_Wakon_Test_13");	//Nyní jdi za posledním z nás.
	AI_Output(self,other,"DMT_1220_Wakon_Test_15");	//Strážce Stonnos - je z nás nejmocnější a jeho elementem je Kámen.
	AI_Output(other,self,"DMT_1220_Wakon_Test_17");	//Ale kde?!
	AI_Output(self,other,"DMT_1220_Wakon_Test_18");	//Podívej se po něm tam, kde bývají obnovovány mocné věci... Však brzy pochopíš! Určitě o takovém místě víš.
	AI_Output(self,other,"DMT_1220_Wakon_Test_20");	//Toť vše, ať tě chrání vědění Vody!
	Info_ClearChoices(dmt_1220_wakon_test);
	Info_AddChoice(dmt_1220_wakon_test,"... (KONEC)",dmt_1220_wakon_test_end);
};

func void dmt_1220_wakon_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

