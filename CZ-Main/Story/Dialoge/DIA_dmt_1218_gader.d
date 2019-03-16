
instance DMT_1218_GADER_EXIT(C_Info)
{
	npc = dmt_1218_gader;
	nr = 999;
	condition = dmt_1218_gader_exit_condition;
	information = dmt_1218_gader_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1218_gader_exit_condition()
{
	return TRUE;
};

func void dmt_1218_gader_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1218_GADER_HELLO(C_Info)
{
	npc = dmt_1218_gader;
	condition = dmt_1218_gader_hello_condition;
	information = dmt_1218_gader_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1218_gader_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (FARION_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1218_gader_hello_info()
{
	AI_Output(self,other,"DMT_1218_Gader_Hello_00");	//Vítám tě, poutníku... (vznešeně)
	AI_Output(self,other,"DMT_1218_Gader_Hello_01");	//Doufám, že ti nemusím vysvětlovat, kdo jsem. Asi tomu perfektně rozumíš, že?
	AI_Output(other,self,"DMT_1218_Gader_Hello_02");	//Jsi Strážce!
	AI_Output(self,other,"DMT_1218_Gader_Hello_03");	//Ano, máš pravdu... (mocně) Já jsem Strážce Gader, první strážce Vody a šestý Strážce posvátných Vakhanských síní.
	AI_Output(self,other,"DMT_1218_Gader_Hello_04");	//A jestli dobře rozumím, od času, kdy jsme tě potkali jsi ušel velký kus náročné cesty.
	AI_Output(self,other,"DMT_1218_Gader_Hello_05");	//Nyní přišla další část a ty ji musíš splnit, jestli opravdu chceš vstoupit do našeho kruhu!
	AI_Output(self,other,"DMT_1218_Gader_Hello_06");	//Připraven?!
	Info_ClearChoices(dmt_1218_gader_hello);
	Info_AddChoice(dmt_1218_gader_hello,"Ano, mistře, připraven.",dmt_1218_gader_hello_test);
};

func void dmt_1218_gader_hello_test()
{
	AI_Output(other,self,"DMT_1218_Gader_Hello_07");	//Ano, mistře, připraven.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1218_Gader_Hello_08");	//Dobrá... Tak začneme!
	AI_Output(self,other,"DMT_1218_Gader_Hello_09");	//Můj úkol by neměl mít nějaký závažný dopad na tvůj život.
	AI_Output(self,other,"DMT_1218_Gader_Hello_10");	//Rozhodně nebude tak těžký jako úkoly ostatních Strážců.
	AI_Output(self,other,"DMT_1218_Gader_Hello_11");	//Vše co máš udělat je jedna malá práce na druhé straně tohoto ostrova.
	AI_Output(self,other,"DMT_1218_Gader_Hello_12");	//Lidé ji nazvali Jharkendar! Myslím, že už jsi tam určitě byl a nebude pro tebe problém se tam dostat znovu.
	AI_Output(self,other,"DMT_1218_Gader_Hello_13");	//Poneseš tam nějaké artefakty, hned ti je dám.
	AI_Output(self,other,"DMT_1218_Gader_Hello_14");	//Tady, vem si je a neztrať je.
	CreateInvItems(self,itmi_gaderstone,5);
	B_GiveInvItems(self,other,itmi_gaderstone,5);
	AI_Output(other,self,"DMT_1218_Gader_Hello_15");	//To to vážně nebude nebezpečné?!
	AI_Output(self,other,"DMT_1218_Gader_Hello_16");	//Bez obav, magie těchto artefaktů ti neublíží.
	AI_Output(self,other,"DMT_1218_Gader_Hello_17");	//Jen pomůže tomu místu navrátit jeho bývalou moc!
	AI_Output(other,self,"DMT_1218_Gader_Hello_18");	//Dobrá, ale co bych měl dělat s těmi artefakty?
	AI_Output(self,other,"DMT_1218_Gader_Hello_19");	//Nic složitého!
	AI_Output(self,other,"DMT_1218_Gader_Hello_20");	//Jak víš, na Jharkendaru je pár chrámů. Konkrétně pět!
	AI_Output(self,other,"DMT_1218_Gader_Hello_21");	//Konaly se v nich mocné rituály.
	AI_Output(self,other,"DMT_1218_Gader_Hello_22");	//Ale nyní o tyto ruiny není moc velký zájem.
	AI_Output(self,other,"DMT_1218_Gader_Hello_23");	//Jestli ten, kdo je chce využít, neví jednu věc...
	AI_Output(other,self,"DMT_1218_Gader_Hello_24");	//Jakou?!
	AI_Output(self,other,"DMT_1218_Gader_Hello_25");	//Kamenné oltáře v chrámech nebyly jejich stavitely vybudovány jen na ozdobu!
	AI_Output(other,self,"DMT_1218_Gader_Hello_26");	//Opravdu?
	AI_Output(self,other,"DMT_1218_Gader_Hello_27");	//Každý z nich má mocnou, neviditelnou auru, která dokáže každou magii zesílit stokrát!
	AI_Output(self,other,"DMT_1218_Gader_Hello_28");	//Včetně těch artefaktů, které jsem ti dal.
	AI_Output(self,other,"DMT_1218_Gader_Hello_31");	//Vše co po tobě chci je, abys zanechal v každém chrámu na oltáři jeden artefakt a vrátil se za mnou.
	AI_Output(other,self,"DMT_1218_Gader_Hello_35");	//Chápu, mistře.
	AI_Output(self,other,"DMT_1218_Gader_Hello_36");	//Jdi. Nechť síla Vody zažene tvé obavy!
	AI_StopProcessInfos(self);
	MIS_GADERTEST = LOG_Running;
	Log_CreateTopic(TOPIC_GADERTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GADERTEST,LOG_Running);
	B_LogEntry(TOPIC_GADERTEST,"Další zkoušku mi zadal Strážce Vody, Gader. Musím se dostat do Jharkendaru a umístit do pěti chrámů na jejich oltáře jisté artefakty, které mi Gader dal. Jejich síla se pak zestonásobí a dokáže vrátit Jharkendaru původní moc!");
};

instance DMT_1218_GADER_TEST(C_Info)
{
	npc = dmt_1218_gader;
	nr = 1;
	condition = dmt_1218_gader_test_condition;
	information = dmt_1218_gader_test_info;
	permanent = FALSE;
	description = "Dokončil jsem to, mistře.";
};


func int dmt_1218_gader_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1218_gader_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DMT_1218_Gader_Test_00");	//Dokončil jsem to, mistře.
	AI_Output(self,other,"DMT_1218_Gader_Test_01");	//A splnil jsi můj úkol... (mocně)
	AI_Output(self,other,"DMT_1218_Gader_Test_02");	//I když tento by splnil i slepý!
	AI_Output(self,other,"DMT_1218_Gader_Test_03");	//No, udělal jsi co jsem chtěl.
	MIS_GADERTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GADERTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_GADERTEST,"Splnil jsem Gaderův úkol.");
	Info_ClearChoices(dmt_1218_gader_test);
	Info_AddChoice(dmt_1218_gader_test,"Takže mám tvůj souhlas, mistře?",dmt_1218_gader_test_pass);
};

func void dmt_1218_gader_test_pass()
{
	AI_Output(other,self,"DMT_1218_Gader_Test_04");	//Takže mám tvůj souhlas, mistře?
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1218_Gader_Test_05");	//Nepochybně... (vznešeně) A je mi potěšením ti ho udělit!
	AI_Output(self,other,"DMT_1218_Gader_Test_06");	//Nyní jdi, poutníku. Vyhledej Naruse, druhého Strážce Vody.
	AI_Output(self,other,"DMT_1218_Gader_Test_07");	//Dá ti tvůj další úkol.
	AI_Output(self,other,"DMT_1218_Gader_Test_08");	//Sbohem!
	B_LogEntry(TOPIC_GUARDIANSTEST,"Gader mi dal souhlas ke vstupu do Kruhu Strážců.");
	GADER_AGREE = TRUE;
	Info_ClearChoices(dmt_1218_gader_test);
	Info_AddChoice(dmt_1218_gader_test,"... (KONEC)",dmt_1218_gader_test_end);
};

func void dmt_1218_gader_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

