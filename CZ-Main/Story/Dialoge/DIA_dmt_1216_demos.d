
instance DMT_1216_DEMOS_EXIT(C_Info)
{
	npc = dmt_1216_demos;
	nr = 999;
	condition = dmt_1216_demos_exit_condition;
	information = dmt_1216_demos_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1216_demos_exit_condition()
{
	return TRUE;
};

func void dmt_1216_demos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1216_DEMOS_HELLO(C_Info)
{
	npc = dmt_1216_demos;
	nr = 1;
	condition = dmt_1216_demos_hello_condition;
	information = dmt_1216_demos_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1216_demos_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (KELIOS_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1216_demos_hello_info()
{
	AI_Output(self,other,"DMT_1216_Demos_Hello_00");	//(zdvořile) Vítám tě poutníku... Nastal čas našeho setkání!
	AI_Output(other,self,"DMT_1216_Demos_Hello_01");	//Kdo jsi?
	AI_Output(self,other,"DMT_1216_Demos_Hello_02");	//Jmenuji se Demos! Jsem druhý strážce Innose a Strážce Ohně.
	AI_Output(self,other,"DMT_1216_Demos_Hello_03");	//Víš proč jsem tady?!
	AI_Output(other,self,"DMT_1216_Demos_Hello_04");	//Ano, mistře! Musím splnit tvůj úkol a získat tvé svolení vstoupit ke Strážcům.
	AI_Output(self,other,"DMT_1216_Demos_Hello_05");	//Správně, ale nemá cenu zde bezcílně tlachat.
	AI_Output(self,other,"DMT_1216_Demos_Hello_06");	//Jsi připraven?!
	Info_ClearChoices(dmt_1216_demos_hello);
	Info_AddChoice(dmt_1216_demos_hello,"Jsem připraven.",dmt_1216_demos_hello_test);
};

func void dmt_1216_demos_hello_test()
{
	AI_Output(other,self,"DMT_1216_Demos_Hello_07");	//Jsem připraven.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1216_Demos_Hello_08");	//Dobře! (zdvořile) poslouchej pozorně.
	AI_Output(self,other,"DMT_1216_Demos_Hello_09");	//Pro splnění mé zkoušky budeš muset jít na místo jménem Gades!
	AI_Output(other,self,"DMT_1216_Demos_Hello_10");	//Gades?!
	AI_Output(self,other,"DMT_1216_Demos_Hello_11");	//To jméno vznilko v době, kdy lidé přicházeli na tento svět.
	AI_Output(self,other,"DMT_1216_Demos_Hello_12");	//Ale aby ti to bylo jasné, vysvětlím ti to podrobněji - vy lidé jste kdysi to místo nazvali Hornické údolí!
	AI_Output(self,other,"DMT_1216_Demos_Hello_13");	//Myslím, že to jméno je ti velmi známé.
	AI_Output(other,self,"DMT_1216_Demos_Hello_14");	//To teda je.
	AI_Output(self,other,"DMT_1216_Demos_Hello_15");	//Také o tom nepochybuji, ale nemá cenu zacházet do podrobností - jen by tě rozptylovaly!
	AI_Output(other,self,"DMT_1216_Demos_Hello_16");	//Co tam mam hledat?
	AI_Output(self,other,"DMT_1216_Demos_Hello_17");	//Tam v údolí je jeden starý artefakt velké magické síly.
	AI_Output(other,self,"DMT_1216_Demos_Hello_18");	//Co je to za věc?!
	AI_Output(self,other,"DMT_1216_Demos_Hello_19");	//Nemá jméno, ale jeho podstata posílí mého pána!
	AI_Output(self,other,"DMT_1216_Demos_Hello_20");	//Myslím, že asi neporozumíš tomu, co tím myslím.
	AI_Output(self,other,"DMT_1216_Demos_Hello_21");	//Je to nyní ve vlastnictví skřetů, ani nevím, kdy to získali.
	AI_Output(self,other,"DMT_1216_Demos_Hello_22");	//I když ty jsi ale člověk!... (smích)
	AI_Output(self,other,"DMT_1216_Demos_Hello_23");	//Bojím se, že skřeti ho skryli na jednom z jejich posvátných míst.
	AI_Output(self,other,"DMT_1216_Demos_Hello_24");	//Kde přesně ti nemůžu říci!
	AI_Output(self,other,"DMT_1216_Demos_Hello_25");	//Ale snad ti s tím někdo pomůže.
	AI_Output(other,self,"DMT_1216_Demos_Hello_26");	//Ty chceš, abych to pro tebe našel?!
	AI_Output(self,other,"DMT_1216_Demos_Hello_27");	//Přesně tak, přines ho a máš můj souhlas!
	AI_Output(other,self,"DMT_1216_Demos_Hello_28");	//To nezní tak jednoduše.
	AI_Output(self,other,"DMT_1216_Demos_Hello_32");	//Dobrá, tak běž a nech posvátný plamen ať ti pomůže s hledáním.
	AI_StopProcessInfos(self);
	MIS_DEMOSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_DEMOSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMOSTEST,LOG_Running);
	B_LogEntry(TOPIC_DEMOSTEST,"Demos - Druhý Strážce Ohně mi dal jeho zkoušku. Mám najít artefakt na místě zvaném Gades - které potom lidé označili jako Hornické údolí! Podle Strážcových slov má obrovskou sílu a význam pro jeho pána. Poslední vlastníci - skřeti - ho prý schovali na jedno z jejich posvátných míst. Co je to za místo nikdo neví, měl bych se po něm podívat.");
};

instance DMT_1216_DEMOS_TEST(C_Info)
{
	npc = dmt_1216_demos;
	nr = 1;
	condition = dmt_1216_demos_test_condition;
	information = dmt_1216_demos_test_info;
	permanent = FALSE;
	description = "Myslím, že jsem našel ten artefakt.";
};


func int dmt_1216_demos_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_DEMOSTEST == LOG_Running) && (Npc_HasItems(other,itmi_idol_02) >= 1))
	{
		return TRUE;
	};
};

func void dmt_1216_demos_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DMT_1216_Demos_Test_00");	//Myslím, že jsem našel ten artefakt.
	AI_Output(self,other,"DMT_1216_Demos_Test_01");	//Ukaž mi ho.
	AI_Output(other,self,"DMT_1216_Demos_Test_02");	//Zde, mistře.
	B_GiveInvItems(other,self,itmi_idol_02,1);
	Npc_RemoveInvItems(self,itmi_idol_02,1);
	AI_Output(self,other,"DMT_1216_Demos_Test_03");	//Hmmm... (zkoumavě) Ano, to je on!
	AI_Output(self,other,"DMT_1216_Demos_Test_04");	//Tvar temnot, třetí esence Temného boha - nyní je u spolehlivých majitelů.
	AI_Output(other,self,"DMT_1216_Demos_Test_05");	//Třetí esence?!
	AI_Output(self,other,"DMT_1216_Demos_Test_08");	//(směje se) Ano, nepřeslechl ses!
	AI_Output(self,other,"DMT_1216_Demos_Test_09");	//Měl bys vědět pravdu o něčem pro co jsi riskoval život.
	AI_Output(other,self,"DMT_1216_Demos_Test_10");	//S potěšením si vyslechnu tvůj příběh.
	AI_Output(self,other,"DMT_1216_Demos_Test_11");	//Dobrá, slyšel jsi někdy o Irdorathských síních?!
	if(ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		AI_Output(other,self,"DMT_1216_Demos_Test_12");	//Ano!
		AI_Output(self,other,"DMT_1216_Demos_Test_13");	//Pak bys měl vědět, že jsou i jiné - síně zvířat!
		AI_Output(self,other,"DMT_1216_Demos_Test_14");	//Místa magie Temného boha...
	}
	else
	{
		AI_Output(other,self,"DMT_1216_Demos_Test_15");	//Ne. Slyším o nich po prvé.
		AI_Output(self,other,"DMT_1216_Demos_Test_16");	//(silný) Nevadí, hlavní je, že jsou i jiné - síně zvířat!
		AI_Output(self,other,"DMT_1216_Demos_Test_17");	//Místa magie Temného boha...
	};
	AI_Output(self,other,"DMT_1216_Demos_Test_18");	//Jsou tu vlastně čtyři chrámy!
	AI_Output(self,other,"DMT_1216_Demos_Test_19");	//Paladinové Innose zničili dva z nich.
	AI_Output(self,other,"DMT_1216_Demos_Test_20");	//Každé z těchto míst ukrývalo starodávný artefakt, ve kterém byla část Beliarovi síly.
	AI_Output(self,other,"DMT_1216_Demos_Test_21");	//To jsou také esence Temného boha!...
	AI_Output(other,self,"DMT_1216_Demos_Test_22");	//Znamená to, že existují čtyři takové artefakty?!
	AI_Output(self,other,"DMT_1216_Demos_Test_23");	//Ano, jsou jen čtyři... A jeden z nich máš právě v ruce.
	AI_Output(other,self,"DMT_1216_Demos_Test_24");	//A kde můžu najít ostatní tři?!
	AI_Output(self,other,"DMT_1216_Demos_Test_25");	//(směje se) Myslím, že to nepotřebuješ vědět.
	AI_Output(other,self,"DMT_1216_Demos_Test_26");	//Ale proč?!
	AI_Output(self,other,"DMT_1216_Demos_Test_27");	//I kdybys je zázračně našel, nedokázal bys použít jejich sílu.
	AI_Output(self,other,"DMT_1216_Demos_Test_28");	//Ani Strážci to nedokáží, natož pouhý smrtelník!
	AI_Output(self,other,"DMT_1216_Demos_Test_29");	//Bude lepší, když nebudeš plýtvat časem!
	AI_Output(other,self,"DMT_1216_Demos_Test_30");	//Dobrá, jak říkáš.
	AI_Output(self,other,"DMT_1216_Demos_Test_31");	//Nyní ke tvé zkoušce... (vážně)
	AI_Output(self,other,"DMT_1216_Demos_Test_32");	//Myslím, že jsi ji splnil - máš můj souhlas!
	KNOWABOUTIRDORAT = TRUE;
	MIS_DEMOSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DEMOSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_DEMOSTEST,"Splnil jsem zkoušku Strážce jménem Demos.");
	Info_ClearChoices(dmt_1216_demos_test);
	Info_AddChoice(dmt_1216_demos_test,"Ano, mistře.",dmt_1216_demos_test_pass);
};

func void dmt_1216_demos_test_pass()
{
	AI_Output(other,self,"DMT_1216_Demos_Test_33");	//Ano, mistře.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1216_Demos_Test_34");	//Z moci mě svěřené stvořitelem ti dávám svolení!
	AI_Output(self,other,"DMT_1216_Demos_Test_35");	//Nyní najdi Strážce Fariona, třetího Strážce Ohně - dá ti další zkoušku.
	AI_Output(self,other,"DMT_1216_Demos_Test_36");	//Sbohem!
	B_LogEntry(TOPIC_GUARDIANSTEST,"Strážce jménem Demos mi dal svůj souhlas - nyní bych měl najít Strážce Fariona.");
	DEMOS_AGREE = TRUE;
	Info_ClearChoices(dmt_1216_demos_test);
	Info_AddChoice(dmt_1216_demos_test,"... (KONEC)",dmt_1216_demos_test_end);
};

func void dmt_1216_demos_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

