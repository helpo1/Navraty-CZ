
instance DIA_STRF_8124_Addon_Morigan_EXIT(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 999;
	condition = DIA_STRF_8124_Addon_Morigan_exit_condition;
	information = DIA_STRF_8124_Addon_Morigan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_STRF_8124_Addon_Morigan_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8124_Addon_Morigan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8124_Addon_Morigan_HELLO(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_hello_condition;
	information = DIA_STRF_8124_Addon_Morigan_hello_info;
	permanent = FALSE;
	description = "S čím mohu pomoct?";
};

func int DIA_STRF_8124_Addon_Morigan_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8124_Addon_Morigan_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Hello_15_00");	//S čím mohu pomoct?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Hello_08_00");	//Ano...(reptání) Například, mě můžeš dát pokoj.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Hello_08_01");	//Jestli si skřeti všimnou, že tady s tebou žvaním, tak budu mít problémy, kamaráde.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8124_Addon_Morigan_Help(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_Help_condition;
	information = DIA_STRF_8124_Addon_Morigan_Help_info;
	permanent = FALSE;
	description = "Ale vážně?";
};

func int DIA_STRF_8124_Addon_Morigan_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8124_Addon_Morigan_hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_Help_info()
{
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Help_01_00");	//Ale vážně?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Help_01_01");	//Poslouchej...(nervozně) Nepotřebuju tvoji pomoc!
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Help_01_02");	//Ale jestli chceš opravdu udělat dobrý skutek, přines mě něco k pití.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Help_01_03");	//Mám tak sucho v puse, že nemůžu ani polykat.
};

instance DIA_STRF_8124_Addon_Morigan_Water(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_Water_condition;
	information = DIA_STRF_8124_Addon_Morigan_Water_info;
	permanent = FALSE;
	description = "Tady, žitná pálenka.";
};

func int DIA_STRF_8124_Addon_Morigan_Water_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8124_Addon_Morigan_Help) == TRUE) && (Npc_HasItems(other,ItFo_Water) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_Water_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Water_01_00");	//Tady, žitná pálenka.
	B_GiveInvItems(other,self,ItFo_Water,1);
	B_UseItem(self,ItFo_Water);
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Water_01_01");	//Mnohem lepší.
};

instance DIA_STRF_8124_Addon_Morigan_Father(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_Father_condition;
	information = DIA_STRF_8124_Addon_Morigan_Father_info;
	permanent = FALSE;
	description = "Můžu pro tebe ještě něco udělat?";
};

func int DIA_STRF_8124_Addon_Morigan_Father_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8124_Addon_Morigan_Water) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_Father_info()
{
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_00");	//Můžu pro tebe ještě něco udělat?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_01");	//Hmmm...(zamyšleně) Nevím jestli tě o to můžu požádat.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_02");	//Tak to zkus.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_03");	//Dobře. Koneckonců, kromě tebe mě tu stejně nikdo jiný nepomůže.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_04");	//Pověz, jsi často na povrchu?
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_05");	//Samozřejmě.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_06");	//A jaká je tam situace?
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_07");	//Ne o mnoho lepší, než tady! Skřeti téměř ovládli ostrov.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_08");	//Zatím se neodvážili akorát do Khorinisu.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_09");	//A to se asi v nejbližší době nestane, protože tam je velký oddíl paladinů.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_10");	//To je dobře, aspoň tak...
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_11");	//Proč tě to tak zajímá?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_12");	//To proto, že v Khorinisu žije můj otec.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_13");	//Kdybys mu tak mohl dát zprávu že jsem naživu.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_14");	//A kdo je tvůj otec?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_15");	//Jmenuje se Carl a je kovář. Jestli jsi byl někdy ve městě tak ho musíš znát.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_16");	//Ano znám ho. Ale jestli vůbec chce slyšet takové novinky
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_17");	//Chápu, že moje vyhlídky nejsou nejlepší. 
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_18");	//Ale stále jsem na živu a chci aby to věděl!
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_19");	//Dobře, předám mu tvojí zprávu.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_20");	//Děkuji kamaráde, víc nepotřebuji.
	MIS_FatherNews = LOG_Running;
	Log_CreateTopic(TOPIC_FatherNews,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FatherNews,LOG_Running);
	B_LogEntry(TOPIC_FatherNews,"Moriganovi jsem slíbil, že navštívím jeho otce v Khorinisu a řeknu mu, že jeho syn je stále naživu. Jeho otec je kovář Carl.");
};

instance DIA_STRF_8124_Addon_Morigan_FatherDone(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_FatherDone_condition;
	information = DIA_STRF_8124_Addon_Morigan_FatherDone_info;
	permanent = FALSE;
	description = "Mluvil jsem s tvým otcem.";
};

func int DIA_STRF_8124_Addon_Morigan_FatherDone_condition()
{
	if(MIS_FatherNews == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_FatherDone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_00");	//Mluvil jsem s tvým otcem.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_01");	//(vzrušeně) Nelžeš?
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_02");	//Ne, samozřejmě! Proč bych to dělal.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_03");	//A co říkal?
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_04");	//Tvůj otec byl rád, když slyšel, že jsi stále naživu.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_05");	//A bude se za tebe modlit k Innosovi.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_06");	//V naději, že se jednoho dne vrátíš domů.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_07");	//Ach...(smutně) To bych rád, věř mi. Ale odsud se nedá utéct.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_08");	//Ale v každém případě děkuji za tvoji pomoc.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_09");	//Tady vem si ten kus rudy, jako výraz mé vděčnosti.
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon,1);
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_10");	//Bohužel nic víc ti dát nemůžu.
	RT_Respect = RT_Respect + 1;
};