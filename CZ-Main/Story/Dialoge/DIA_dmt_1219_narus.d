
instance DMT_1219_NARUS_EXIT(C_Info)
{
	npc = dmt_1219_narus;
	nr = 999;
	condition = dmt_1219_narus_exit_condition;
	information = dmt_1219_narus_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1219_narus_exit_condition()
{
	return TRUE;
};

func void dmt_1219_narus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1219_NARUS_HELLO(C_Info)
{
	npc = dmt_1219_narus;
	condition = dmt_1219_narus_hello_condition;
	information = dmt_1219_narus_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1219_narus_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (GADER_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1219_narus_hello_info()
{
	AI_Output(self,other,"DMT_1219_Narus_Hello_00");	//Takže jsi zde...
	AI_Output(self,other,"DMT_1219_Narus_Hello_01");	//Abych řekl pravdu, jsem trochu překvapen našim setkáním - nevěřil jsem, že se dostaneš tak daleko!
	AI_Output(self,other,"DMT_1219_Narus_Hello_02");	//Na této náročné cestě tě musel ochraňovat sám Adanos.
	AI_Output(self,other,"DMT_1219_Narus_Hello_03");	//To je dobré znamení!
	AI_Output(other,self,"DMT_1219_Narus_Hello_04");	//Kdo jsi?
	AI_Output(self,other,"DMT_1219_Narus_Hello_05");	//Já? Narus... (mocně) Druhý Strážce Vody a Adanovy magie!
	AI_Output(self,other,"DMT_1219_Narus_Hello_06");	//A jsem tu proto, abych ti udělil můj úkol.
	AI_Output(self,other,"DMT_1219_Narus_Hello_07");	//I když, pro tebe by to neměl být nijak náročný úkol.
	AI_Output(self,other,"DMT_1219_Narus_Hello_08");	//Už jsi prokázal, že to pro tebe nebude nic těžkého!
	AI_Output(self,other,"DMT_1219_Narus_Hello_09");	//Ovšem jestliže teď zklameš, tvé předchozí úspěchy upadnou v zapomnění!
	Info_ClearChoices(dmt_1219_narus_hello);
	Info_AddChoice(dmt_1219_narus_hello,"Ano jsem připraven.",dmt_1219_narus_hello_test);
};

func void dmt_1219_narus_hello_test()
{
	AI_Output(other,self,"DMT_1219_Narus_Hello_10");	//Ano jsem připraven.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1219_Narus_Hello_11");	//Dobrá, poslouchej pozorně...
	AI_Output(self,other,"DMT_1219_Narus_Hello_12");	//Stojím zde a rozjímám nad tím, jak plyne čas a jak písek zasype mé prsty.
	AI_Output(self,other,"DMT_1219_Narus_Hello_13");	//Ale uprostřed meditace jsem ztratil svůj safírový prsten.
	AI_Output(self,other,"DMT_1219_Narus_Hello_14");	//Asi spadl do toho jezírka pod námi...
	AI_Output(self,other,"DMT_1219_Narus_Hello_15");	//Byl mi velmi drahý a chtěl bych ho zpět!
	AI_Output(self,other,"DMT_1219_Narus_Hello_16");	//Nebuď překvapen, já vím, že je to lehký úkol.
	AI_Output(self,other,"DMT_1219_Narus_Hello_17");	//Jednoduše, pokud jestli ho najdeš, přines ho ke mně!
	AI_Output(other,self,"DMT_1219_Narus_Hello_18");	//Dobrá, najdu tvůj prsten, mistře.
	AI_Output(self,other,"DMT_1219_Narus_Hello_19");	//Počkám zde na tebe, jdi!
	AI_StopProcessInfos(self);
	MIS_NARUSTEST = LOG_Running;
	Wld_InsertItem(itri_narus,"FP_ITEM_NARUSRING");
	Log_CreateTopic(TOPIC_NARUSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NARUSTEST,LOG_Running);
	B_LogEntry(TOPIC_NARUSTEST,"Narus chce, abych našel jeho milovaný safírový prsten. Uprostřed meditace mu vypadl a skončil v jezírku pod Bengarovou farmou.");
};


instance DMT_1219_NARUS_TEST(C_Info)
{
	npc = dmt_1219_narus;
	nr = 1;
	condition = dmt_1219_narus_test_condition;
	information = dmt_1219_narus_test_info;
	permanent = FALSE;
	description = "Našel jsem tvůj prsten.";
};


func int dmt_1219_narus_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_NARUSTEST == LOG_Running) && (Npc_HasItems(other,itri_narus) >= 1))
	{
		return TRUE;
	};
};

func void dmt_1219_narus_test_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DMT_1219_Narus_Test_00");	//Našel jsem tvůj prsten.
	AI_Output(self,other,"DMT_1219_Narus_Test_01");	//Dobrá, ukaž mi ho!
	AI_Output(other,self,"DMT_1219_Narus_Test_02");	//Tady, podívej.
	AI_Output(self,other,"DMT_1219_Narus_Test_03");	//Ano, není pochyb o tom, že je to on!
	AI_Output(other,self,"DMT_1219_Narus_Test_04");	//No, už ho máš zpět, mistře.
	AI_Output(self,other,"DMT_1219_Narus_Test_05");	//Počkej! Ještě mi ho nedávej. Myslím, že tento prsten by se hodil tobě.
	AI_Output(self,other,"DMT_1219_Narus_Test_06");	//Užiješ ho více než já, o tom není pochyb!
	AI_Output(self,other,"DMT_1219_Narus_Test_07");	//Není třeba děkovat, pokud se nemýlím, přece to není první věc, kterou máš od Strážců?!
	AI_Output(other,self,"DMT_1219_Narus_Test_08");	//Ano, máš pravdu - Strážce Dagoth mi také dal jeden prsten.
	AI_Output(other,self,"DMT_1219_Narus_Test_09");	//Nicméně mi nevysvětlil jak ho užívat!
	AI_Output(self,other,"DMT_1219_Narus_Test_10");	//Ale již brzy budeš moci poznat moc tohoto prstenu!
	AI_Output(self,other,"DMT_1219_Narus_Test_11");	//Brzy přijde čas, kdy pochopíš.
	AI_Output(other,self,"DMT_1219_Narus_Test_12");	//Už chápu, mistře.
	AI_Output(self,other,"DMT_1219_Narus_Test_13");	//Dobrá... Nyní zpět k tvému úkolu.
	AI_Output(self,other,"DMT_1219_Narus_Test_14");	//Prošel jsi mou zkouškou.
	AI_Output(self,other,"DMT_1219_Narus_Test_15");	//A máš můj souhlas!
	MIS_NARUSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NARUSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_NARUSTEST,"Našel jsem Narusův prsten. Narus se rozhodl, že pro mě bude více užitečný a prsten mi nechal.");
	Info_ClearChoices(dmt_1219_narus_test);
	Info_AddChoice(dmt_1219_narus_test,"Opravdu mám tedy tvůj souhlas?",dmt_1219_narus_test_pass);
};

func void dmt_1219_narus_test_pass()
{
	AI_Output(other,self,"DMT_1219_Narus_Test_16");	//Opravdu mám tedy tvůj souhlas?
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	B_LogEntry(TOPIC_GUARDIANSTEST,"Mám souhlas Strážce Naruse.");
	NARUS_AGREE = TRUE;
	AI_Output(self,other,"DMT_1219_Narus_Test_17");	//Ano, už to tak je... Z moci mě svěřené Adanem ti uděluji souhlas ke vstupu do Kruhu!
	AI_Output(self,other,"DMT_1219_Narus_Test_18");	//Nyní učiň další krok na tvé cestě.
	AI_Output(self,other,"DMT_1219_Narus_Test_19");	//Najdi posledního strážce Vody - Wakona.
	AI_Output(self,other,"DMT_1219_Narus_Test_20");	//Dá ti poslední úkol. Pak se setkáš s našim Vůdcem...
	AI_Output(self,other,"DMT_1219_Narus_Test_21");	//Sbohem!
	Info_ClearChoices(dmt_1219_narus_test);
	Info_AddChoice(dmt_1219_narus_test,"... (KONEC)",dmt_1219_narus_test_end);
};

func void dmt_1219_narus_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

