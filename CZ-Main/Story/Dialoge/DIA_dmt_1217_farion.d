
instance DMT_1217_FARION_EXIT(C_Info)
{
	npc = dmt_1217_farion;
	nr = 999;
	condition = dmt_1217_farion_exit_condition;
	information = dmt_1217_farion_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1217_farion_exit_condition()
{
	return TRUE;
};

func void dmt_1217_farion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1217_FARION_HELLO(C_Info)
{
	npc = dmt_1217_farion;
	condition = dmt_1217_farion_hello_condition;
	information = dmt_1217_farion_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1217_farion_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (DEMOS_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1217_farion_hello_info()
{
	AI_Output(self,other,"DMT_1217_Farion_Hello_00");	//Stát, člověče!
	AI_Output(other,self,"DMT_1217_Farion_Hello_01");	//Kdo jsi?!
	AI_Output(self,other,"DMT_1217_Farion_Hello_02");	//Před tebou stojí Farion - poslední strážce posvátného Ohně a pátý Strážce posvátných Vakhanských síní!
	AI_Output(other,self,"DMT_1217_Farion_Hello_03");	//Jsi tady, protože nadešel čas na mou zkoušku, nepletu se?
	AI_Output(self,other,"DMT_1217_Farion_Hello_04");	//Geniální, smrtelníku... Ale stejně jsem zrovna byl v tomto světě!
	AI_Output(self,other,"DMT_1217_Farion_Hello_05");	//Doslechl jsem se, že se chceš stát součástí našeho kruhu.
	AI_Output(self,other,"DMT_1217_Farion_Hello_06");	//Podle ostatních Strážců jsi již splnil nějaké jejich úkoly a prokázal tak, že je to tvůj osud!
	AI_Output(self,other,"DMT_1217_Farion_Hello_07");	//Ale já před sebou vidím jen ubohou osobu, kterou zničí závan teplého vzduchu z povrchu tohoto světa.
	AI_Output(other,self,"DMT_1217_Farion_Hello_08");	//No, jsem si jistý, že tvé mínění dokážu rychle změnit.
	AI_Output(self,other,"DMT_1217_Farion_Hello_09");	//Hmm... Pak zkus projít zkouškou, kterou jsem ti připravil.
	AI_Output(self,other,"DMT_1217_Farion_Hello_10");	//Pak nebudu pochybovat o tvém potenciálu!
	AI_Output(other,self,"DMT_1217_Farion_Hello_11");	//To doufám.
	AI_Output(self,other,"DMT_1217_Farion_Hello_12");	//Nadešel čas tvé odpovědi - přijmeš můj úkol?!
	Info_ClearChoices(dmt_1217_farion_hello);
	Info_AddChoice(dmt_1217_farion_hello,"Samozřejmě.",dmt_1217_farion_hello_test);
};

func void dmt_1217_farion_hello_test()
{
	AI_Output(other,self,"DMT_1217_Farion_Hello_13");	//Samozřejmě.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1217_Farion_Hello_14");	//Hmmm... Jsi troufalý člověk!
	AI_Output(self,other,"DMT_1217_Farion_Hello_15");	//Pojďme se podívat jak ti tvá troufalost pomůže. Poslouchej pozorně... (povýšeně)
	AI_Output(other,self,"DMT_1217_Farion_Hello_16");	//Ano, mistře.
	AI_Output(self,other,"DMT_1217_Farion_Hello_17");	//Pravděpodobně víš, že Oheň může i tvořit i ničit... (děsivě) V našem případě ničit!
	AI_Output(other,self,"DMT_1217_Farion_Hello_18");	//Co to má znamenat?!
	AI_Output(self,other,"DMT_1217_Farion_Hello_19");	//To znamená, že mi budeš sloužit a jako nástroj posvátného vědění a svatého oltáře osudu mě uctíš životem jednoho smrtelníka.
	AI_Output(other,self,"DMT_1217_Farion_Hello_20");	//To jako že mám někoho zabít?!
	AI_Output(self,other,"DMT_1217_Farion_Hello_21");	//Ne jen tak někoho... (vážně) Není to jen tak obyčejný člověk!
	AI_Output(self,other,"DMT_1217_Farion_Hello_22");	//Vlastně to není tak docela člověk.
	AI_Output(other,self,"DMT_1217_Farion_Hello_23");	//A kdo to teda je?!
	AI_Output(self,other,"DMT_1217_Farion_Hello_24");	//Nyní je paladinem Innosovým a pokorným služebníkem bohů!... (ztěžka)
	AI_Output(other,self,"DMT_1217_Farion_Hello_25");	//Paladin Innose? Tak jak, že to není člověk?!
	AI_Output(self,other,"DMT_1217_Farion_Hello_26");	//Vidím, že jsi trochu překvapen... (zlomyslně) Nicméně to budeš muset udělat, pokud chceš projít mou zkouškou.
	AI_Output(other,self,"DMT_1217_Farion_Hello_27");	//Ano, mistře. Nemám jinou volbu.
	AI_Output(self,other,"DMT_1217_Farion_Hello_28");	//Je dobře, že mi rozumíš! Nyní, když už nepochybuji o tvé osobě, ti mohu povědět PROČ.
	AI_Output(other,self,"DMT_1217_Farion_Hello_29");	//To by bylo dobré! Vražda paladina chce velmi závažný důvod.
	AI_Output(self,other,"DMT_1217_Farion_Hello_30");	//Je jasné, že to opravdu je... (zlomyslně)
	AI_Output(other,self,"DMT_1217_Farion_Hello_31");	//A jak to teda je?
	AI_Output(self,other,"DMT_1217_Farion_Hello_32");	//Podle toho, co zatím vím, život toho paladina byl obětován a po jeho smrti proběhne rituál obnovení!
	AI_Output(self,other,"DMT_1217_Farion_Hello_33");	//Víš o co jde?!... (mocně)
	AI_Output(other,self,"DMT_1217_Farion_Hello_34");	//Absolutně ne.
	AI_Output(self,other,"DMT_1217_Farion_Hello_35");	//Vše je velmi jednoduché... (vznešeně) Stane se z něj temný paladin, služebník Temného boha.
	AI_Output(other,self,"DMT_1217_Farion_Hello_36");	//Temný paladin? Co to je?
	AI_Output(self,other,"DMT_1217_Farion_Hello_37");	//Páni stínů, generálové Beliarovy armády! Mocná stvoření velké síly s chtíčem zničit vše živé.
	AI_Output(self,other,"DMT_1217_Farion_Hello_38");	//Vedou sem na tento svět legie bytostí z temnot.
	AI_Output(self,other,"DMT_1217_Farion_Hello_39");	//Takže je důležité, abys můj úkol splnil!
	AI_Output(other,self,"DMT_1217_Farion_Hello_40");	//Dobrá, mistře! Už jdu.
	AI_Output(other,self,"DMT_1217_Farion_Hello_41");	//A jak se jmenuje ten paladin?!
	AI_Output(self,other,"DMT_1217_Farion_Hello_42");	//Sergio. Najdeš ho v klášteře Ohně.
	AI_Output(self,other,"DMT_1217_Farion_Hello_43");	//Tam se v modlitbách snaží spasit svoji bídnou duši.
	AI_Output(self,other,"DMT_1217_Farion_Hello_44");	//Ale už mu to nepomůže... Jeho osud se naplnil!
	AI_Output(self,other,"DMT_1217_Farion_Hello_45");	//Najdi ho a splň svůj úkol.
	AI_Output(self,other,"DMT_1217_Farion_Hello_46");	//Budu čekat zde!
	MIS_FARIONTEST = LOG_Running;
	Log_CreateTopic(TOPIC_FARIONTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FARIONTEST,LOG_Running);
	B_LogEntry(TOPIC_FARIONTEST,"Strážce Farion mi zadal můj další úkol. Nyní budu vraždit pro účel dobra! Můj cíl je paladin Sergio - teď zemře mou rukou. Vše proto, že jeho život byl obětován a po jeho smrti se provede rituál obnovení, který z něj má udělat Temného paladina! Je nezbytné ho zastavit než se tak stane. Můžu ho najít v klášteře Ohně, kde se modlí za svou duši a snaží se zvrátit prokletí - marně.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(PAL_299_Sergio,"AwayMonastery");
};


instance DMT_1217_FARION_TEST(C_Info)
{
	npc = dmt_1217_farion;
	nr = 1;
	condition = dmt_1217_farion_test_condition;
	information = dmt_1217_farion_test_info;
	permanent = FALSE;
	important = TRUE;
};


func int dmt_1217_farion_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_FARIONTEST == LOG_Running) && (SERGIOISDEAD == TRUE) && (SERDAHISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1217_farion_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DMT_1217_Farion_Test_00");	//Nemusíš nic říkát!... Už vše vím.
	AI_Output(self,other,"DMT_1217_Farion_Test_01");	//Pravděpodobně si nejseš jistý svým činem, ale můžeš si být jistý, že jsi jednal správně.
	AI_Output(self,other,"DMT_1217_Farion_Test_02");	//Také jsi splnil můj úkol a to je teď to důležité!
	Info_ClearChoices(dmt_1217_farion_test);
	Info_AddChoice(dmt_1217_farion_test,"Znamená to, že mám tvůj souhlas, mistře?",dmt_1217_farion_test_pass);
};

func void dmt_1217_farion_test_pass()
{
	AI_Output(other,self,"DMT_1217_Farion_Test_03");	//Znamená to, že mám tvůj souhlas, mistře?
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1217_Farion_Test_04");	//No, tak to je. Splnil jsi můj úkol a prokázal jsi tak pevnou mysl a odvahu.
	AI_Output(self,other,"DMT_1217_Farion_Test_05");	//Ve jménu svatého Ohně ti dávám souhlas ke vstupu do Kruhu.
	AI_Output(self,other,"DMT_1217_Farion_Test_07");	//Nyní jdi! Cesta tě zavede za dalším z nás.
	AI_Output(self,other,"DMT_1217_Farion_Test_08");	//Nech velký Oheň naplnit tvé jednání věděním!
	MIS_FARIONTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FARIONTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_FARIONTEST,"Splnil jsem úkol Strážce Fariona.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Farion mi dal souhlas ke vstupu do Kruhu Strážců.");
	FARION_AGREE = TRUE;
	Info_ClearChoices(dmt_1217_farion_test);
	Info_AddChoice(dmt_1217_farion_test,"... (KONEC)",dmt_1217_farion_test_end);
};

func void dmt_1217_farion_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

