
instance DMT_1215_KELIOS_EXIT(C_Info)
{
	npc = dmt_1215_kelios;
	nr = 999;
	condition = dmt_1215_kelios_exit_condition;
	information = dmt_1215_kelios_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1215_kelios_exit_condition()
{
	return TRUE;
};

func void dmt_1215_kelios_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1215_KELIOS_HELLO(C_Info)
{
	npc = dmt_1215_kelios;
	condition = dmt_1215_kelios_hello_condition;
	information = dmt_1215_kelios_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1215_kelios_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (TEGON_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1215_kelios_hello_info()
{
	AI_Output(self,other,"DMT_1215_Kelios_Hello_00");	//Takže, jak jsem se dozvěděl, byl jsi otestován všemi Strážci Temnoty.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_03");	//Nicméně ostatní zkoušky nebudou tak lehké.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_05");	//Pamatuj si to a nedbej na to, jak beznadějně se budeš cítit.
	AI_Output(other,self,"DMT_1215_Kelios_Hello_06");	//Samozřejmě, rozumím.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_07");	//Dobrá!... (vznešeně) Nyní budeš zkoušen Strážci Ohně.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_08");	//A já - Kelios, první Strážce tohoto elementu, budu tvým instruktorem!
	Info_ClearChoices(dmt_1215_kelios_hello);
	Info_AddChoice(dmt_1215_kelios_hello,"Ano, mistře.",dmt_1215_kelios_hello_test);
};

func void dmt_1215_kelios_hello_test()
{
	AI_Output(other,self,"DMT_1215_Kelios_Hello_09");	//Ano, mistře.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1215_Kelios_Hello_10");	//POSLOUCHEJ POZORNĚ... (vznešeně) Jak jsi jistě porozuměl, mým elementem je Oheň!
	AI_Output(self,other,"DMT_1215_Kelios_Hello_11");	//Dává život, ale v průběhu okamžiku ho dokáže sežehnout na prach!
	AI_Output(self,other,"DMT_1215_Kelios_Hello_12");	//Je na pomezí mezi viditelným a neviditelným, je mezi pevnou formou a magickou esencí.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_13");	//Pro porozumění tomu všemu bys měl pro začátek porozumět esenci.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_14");	//Spolu s porozuměním dosáhneš prozření ohněm!
	AI_Output(other,self,"DMT_1215_Kelios_Hello_15");	//Prozření ohněm?!
	AI_Output(self,other,"DMT_1215_Kelios_Hello_16");	//Ano, nepřeslechl ses! Jen tak můžeš dosáhnout velkého vědění elementů.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_17");	//A jen tak můžeš projít mou zkouškou. A jen tak získáš můj souhlas!
	AI_Output(other,self,"DMT_1215_Kelios_Hello_18");	//Vypadá to, že nemám na vybranou, co mám udělat?!
	AI_Output(self,other,"DMT_1215_Kelios_Hello_19");	//Vše je velmi jednoduché. Jdi na sever ke starým ruinám.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_20");	//Najdeš tam magický kámen, který tě teleportuje na místo tvé zkoušky.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_21");	//Myslím, že více ti říkat nemusím... (majestátně)
	AI_Output(self,other,"DMT_1215_Kelios_Hello_22");	//Jestli prostoupíš rituál prozření, vrať se zpět ke mě - budu zde čekat!
	AI_Output(other,self,"DMT_1215_Kelios_Hello_23");	//No, všemu rozumím.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_24");	//Jdi a buď chráněn ohněm!
	AI_StopProcessInfos(self);
	MIS_KELIOSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_KELIOSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KELIOSTEST,LOG_Running);
	B_LogEntry(TOPIC_KELIOSTEST,"První Strážce Ohně, Kelios, mi dal úkol. Mám projít rituál poznáním ohně! Někde v severní části ostrova jsou starobylé ruiny, kde by měl být teleport, který mě přemístí na místo mé zkoušky. Pak bych se měl vrátit zpět za Keliosem pro jeho souhlas.");
};


instance DMT_1215_KELIOS_TEST(C_Info)
{
	npc = dmt_1215_kelios;
	nr = 1;
	condition = dmt_1215_kelios_test_condition;
	information = dmt_1215_kelios_test_info;
	permanent = FALSE;
	description = "Prošel jsem rituálem!";
};


func int dmt_1215_kelios_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1215_kelios_test_info()
{
	B_GivePlayerXP(150);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1215_Kelios_Test_00");	//Prošel jsem rituálem!
	AI_Output(self,other,"DMT_1215_Kelios_Test_01");	//(panovačně) Ano, už to vím... Posvátný Oheň očistil tvou mysl a rozšířil tvou moc a vědění.
	AI_Output(self,other,"DMT_1215_Kelios_Test_02");	//Nyní ti tento element bude více nakloněn - myslím, že už jsi to sám poznal!
	AI_Output(other,self,"DMT_1215_Kelios_Test_03");	//Tak to opravdu je.
	AI_Output(self,other,"DMT_1215_Kelios_Test_04");	//Nepochybuji... (smích) Tvůj úkol - považuji za splněný.
	AI_Output(self,other,"DMT_1215_Kelios_Test_05");	//A z moci mě svěřené posvátným Ohněm ti uděluji můj souhlas ke vstupu do Kruhu Strážců.
	AI_Output(self,other,"DMT_1215_Kelios_Test_06");	//Tvé schopnosti mě překvapily a věř, že nebude trvat dlouho, než se staneš jedním z nás!
	AI_Output(self,other,"DMT_1215_Kelios_Test_07");	//Nyní jdi, jdi a hledej další z nás.
	AI_Output(self,other,"DMT_1215_Kelios_Test_08");	//Nechť posvátný Oheň chrání tvou cestu!
	other.protection[PROT_FIRE] += 5;
	REALPROTFIRE += 5;
	AI_Print(PRINT_LEARNPROTHOT);
	MIS_KELIOSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KELIOSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_KELIOSTEST,"Splnil jsem zkoušku Strážce Keliose.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Kelios mi udělil souhlas vstoupit do Kruhu Strážců.");
	KELIOS_AGREE = TRUE;
	Info_ClearChoices(dmt_1215_kelios_test);
	Info_AddChoice(dmt_1215_kelios_test,"... (KONEC)",dmt_1215_kelios_test_end);
};

func void dmt_1215_kelios_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

