/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

func int dia_Orc_8572_UrHoshNar_OrcHolyPlaces_condition - upraveny podmínky dialogu

*/



instance DIA_ORC_8552_WATCHER_EXIT(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_exit_condition;
	information = dia_orc_8552_watcher_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8552_watcher_exit_condition()
{
	return TRUE;
};

func void dia_orc_8552_watcher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8552_WATCHER_HELLO(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_hello_condition;
	information = dia_orc_8552_watcher_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8552_watcher_hello_condition()
{
	return TRUE;
};

func void dia_orc_8552_watcher_hello_info()
{
	AI_ReadyMeleeWeapon(self);
	Snd_Play("ORC_Angry");
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_01");	//GROTAK NABAR!
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_02");	//ČLOVĚK?!... (nepochopitelně)
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_03");	//A nese Ulu-Mulu?!... (udiveně)
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_04");	//Člověk být silný válečník! Jen silný válečník získat skřetí čest! Skřeti nezabít člověka.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_05");	//Proč člověk zde?
	AI_Output(other,self,"DIA_Orc_8552_Watcher_Hello_Info_18_06");	//Musím se skřety promluvit o jedné velmi důležité věci, která nesnese žádného odkladu.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_07");	//Člověk přijít mluvit s skřeti. Á...
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_08");	//Člověk smět mluvit se skřety. Člověk nést Ulu-Mulu, mít respekt skřetů!
	AI_Output(other,self,"DIA_Orc_8552_Watcher_Hello_Info_18_12");	//Kdo to tu vede?
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_10");	//Cizinec myslet Ur-Thrall. Ur-Thrall být nejsilnější válečník v pevnosti.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_11");	//S ním cizinec mluvit!
	AI_Output(other,self,"DIA_Orc_8552_Watcher_Hello_Info_18_16");	//A kde najdu Ur-Thralla?
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_13");	//Člověk jít do hory. Tam hledat.
	AI_Output(other,self,"DIA_Orc_8552_Watcher_Hello_Info_18_14");	//Aha, a to jsem měl vědět jak...
	AI_Output(self,other,"DIA_Orc_8552_Watcher_Hello_Info_18_15");	//Člověk jít než já rozmyslet!
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

instance DIA_ORC_8552_WATCHER_DRINK(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_DRINK_condition;
	information = dia_orc_8552_watcher_DRINK_info;
	permanent = FALSE;
	description = "Proč se díváš dolů?";
};

func int dia_orc_8552_watcher_DRINK_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8552_Watcher_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_orc_8552_watcher_DRINK_info()
{
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_01_01");	//Proč se díváš dolů?
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_01_02");	//Wah Grosh upustit svou láhev s grog... (potřásá hlavou) Moc dobrý grog!
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_01_03");	//Tak jdi dolů a vezmi si to.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_01_04");	//Tam být velká tma! Wah Grosh hledá dlouho.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_01_05");	//Wah Grosh nemoct opustit svoje místo.
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_01_06");	//Jinak Farrok rozzloben, Ur-Thrall rozzloben, porazí Wah Groshe!
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_01_07");	//Chápu, nemůžeš opustit svoje místo.
	MIS_GroshBottle = LOG_Running;
	Log_CreateTopic(TOPIC_GroshBottle,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GroshBottle,LOG_Running);
	B_LogEntry(TOPIC_GroshBottle,"Wah Grosh, strážný u mostu, upustil svou flašku s grogem. Dolů jít nemůže, protože by opustil svůj post.");
};

instance DIA_ORC_8552_WATCHER_DRINK_Done(C_Info)
{
	npc = orc_8552_watcher;
	condition = dia_orc_8552_watcher_DRINK_Done_condition;
	information = dia_orc_8552_watcher_DRINK_Done_info;
	permanent = FALSE;
	description = "Tady je tvoje láhev.";
};

func int dia_orc_8552_watcher_DRINK_Done_condition()
{
	if((MIS_GroshBottle == LOG_Running) && (Npc_HasItems(other,ItMi_GroshBottle) >= 1))

	{
		return TRUE;
	};
};

func void dia_orc_8552_watcher_DRINK_Done_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_Done_01_01");	//Tady je tvoje láhev.
	B_GiveInvItems(other,self,ItMi_GroshBottle,1);
	Npc_RemoveInvItems(self,ItMi_GroshBottle,1);
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_Done_01_02");	//URAT DAR! Wah Grosh znovu pít svůj grog!
	AI_Output(self,other,"DIA_Orc_8552_Watcher_DRINK_Done_01_03");	//Být velmi vděčný za pomoc Wah Groshovi.
	AI_Output(other,self,"DIA_Orc_8552_Watcher_DRINK_Done_01_04");	//Rádo se stalo.
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace mezi skřety + 5");
	};

	MIS_GroshBottle = LOG_Success;
	Log_SetTopicStatus(TOPIC_GroshBottle,LOG_Success);
	B_LogEntry(TOPIC_GroshBottle,"Přinesl jsem Wah Groshovi jeho láhev.");
};


//--------------------------------------strazh shakhty v gorode--------------------------------------------------


instance DIA_ORC_8901_GuardMine_EXIT(C_Info)
{
	npc = OrcWarrior_GuardMine;
	condition = DIA_ORC_8901_GuardMine_exit_condition;
	information = DIA_ORC_8901_GuardMine_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_ORC_8901_GuardMine_exit_condition()
{
	return TRUE;
};

func void DIA_ORC_8901_GuardMine_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8901_GuardMine_HELLO(C_Info)
{
	npc = OrcWarrior_GuardMine;
	condition = DIA_ORC_8901_GuardMine_hello_condition;
	information = DIA_ORC_8901_GuardMine_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_ORC_8901_GuardMine_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_ORC_8901_GuardMine_hello_info()
{
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_hello_01_01");	//(hrozivě) KAR NATARAK! Kdo být osoba z Turraku?
};

instance DIA_ORC_8901_GuardMine_Enter(C_Info)
{
	npc = OrcWarrior_GuardMine;
	condition = DIA_ORC_8901_GuardMine_Enter_condition;
	information = DIA_ORC_8901_GuardMine_Enter_info;
	permanent = FALSE;
	description = "Co to hlídáš?";
};

func int DIA_ORC_8901_GuardMine_Enter_condition()
{
	return TRUE;
};

func void DIA_ORC_8901_GuardMine_Enter_info()
{
	AI_Output(other,self,"DIA_ORC_8901_GuardMine_Enter_01_01");	//Co to hlídáš?
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_02");	//Turrak podívat se za vchod na skřetí železný důl!
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_03");	//Nikoho nevpustit dovnitř ani ven, dokud velká náčelník neřekne.
	AI_Output(other,self,"DIA_ORC_8901_GuardMine_Enter_01_04");	//A co když stejně vstoupit chci?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_05");	//To muž nesmí udělat! Bratři šamani dělají kouzla u vchodu do dolu.
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_06");	//Oni zabíjí každého, kdo není bratr.
	AI_Output(other,self,"DIA_ORC_8901_GuardMine_Enter_01_07");	//A co když se tam stejně musím podívat?
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_08");	//(hrozivě) ARRUG NOR! Pouze velký náčelník to dovolit.
	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Enter_01_09");	//Pak dveře otevřit a kouzla nezabít muže!
};

//instance DIA_ORC_8901_GuardMine_Closed(C_Info)
//{
//	npc = OrcWarrior_GuardMine;
//	condition = DIA_ORC_8901_GuardMine_Closed_condition;
//	information = DIA_ORC_8901_GuardMine_Closed_info;
//	permanent = FALSE;
//	description = "Pochemu shakhta zakryta?";
//};

//func int DIA_ORC_8901_GuardMine_Closed_condition()
//{
//	if(MIS_EscapeMine == LOG_Success)
//	{
//		return TRUE;
//	};
//};

//func void DIA_ORC_8901_GuardMine_Closed_info()
//{
//	B_GivePlayerXP(200);
//	AI_Output(other,self,"DIA_ORC_8901_GuardMine_Closed_01_01");	//Pochemu shakhta zakryta?
//	AI_PlayAni(self,"T_NO");
//	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Closed_01_02");	//Vse raby sbezhat' ottuda! Ur-Trall sil'no gnevat'sya!
//	AI_Output(self,other,"DIA_ORC_8901_GuardMine_Closed_01_03");	//Ubivat' mnogo bratov, zakryvat' shakhta. Chelovek bol'she ne khodit' tuda!
//};

//-----------------------------------------------------Tar Gor----------------------------------------

instance DIA_Orc_8205_TarGor_EXIT(C_Info)
{
	npc = Orc_8205_TarGor;
	condition = DIA_Orc_8205_TarGor_exit_condition;
	information = DIA_Orc_8205_TarGor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8205_TarGor_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8205_TarGor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8205_TarGor_HELLO(C_Info)
{
	npc = Orc_8205_TarGor;
	condition = DIA_Orc_8205_TarGor_hello_condition;
	information = DIA_Orc_8205_TarGor_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8205_TarGor_hello_condition()
{
	return TRUE;
};

func void DIA_Orc_8205_TarGor_hello_info()
{
	AI_ReadyMeleeWeapon(self);
	Snd_Play("ORC_Angry");
	AI_Output(self,other,"DIA_Orc_8205_TarGor_hello_01_01");	//(hrozivě) KRUSHAK KAR! Kdo dovolil vejít člověku!
	AI_Output(other,self,"DIA_Orc_8205_TarGor_hello_01_02");	//Uklidni se! Ur-Thrall mi dovolil vejít do dolu.
	AI_Output(self,other,"DIA_Orc_8205_TarGor_hello_01_03");	//Hmmm... Člověk chodit dál může.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Orc_8205_TarGor_hello_01_04");	//Člověk nevytvářet problém tady! Neodvádět otrok od práce.
	AI_Output(self,other,"DIA_Orc_8205_TarGor_hello_01_05");	//Jinak TarGor rozzlobit! Ar-Dagar se rozzlobit! Udělat mrtvého muže...
	AI_StopProcessInfos(self);
};


//-----------------------------------------------------Grok----------------------------------------

instance DIA_Orc_8204_Grok_EXIT(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_exit_condition;
	information = DIA_Orc_8204_Grok_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8204_Grok_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8204_Grok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8204_Grok_HELLO(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_hello_condition;
	information = DIA_Orc_8204_Grok_hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8204_Grok_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_hello_info()
{
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_01_01");	//CRIC TAR MOR THAT! UKT DAR MAR BAR DURAT GRAK...
	AI_Output(other,self,"DIA_Orc_8204_Grok_hello_01_02");	//Um... Vůbec ti nerozumím.
	AI_PlayAni(self,"T_DONTKNOW");
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_01_03");	//UR DAGAR TAROK MOR DAK KUR ZAR PARAK TURAB.
	AI_Output(other,self,"DIA_Orc_8204_Grok_hello_01_04");	//Hmmm... (vypadá to,že se budu muset naučit jazyk skřetů, abych si s ním promluvil)
	AI_PlayAni(self,"T_GETLOST2");
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_01_05");	//UKATAR Tarka BOR! NABAR...
	NeedKnowOrcLang = TRUE;

	if((MIS_LowLevel == LOG_Running) && (KnowGrok == TRUE))
	{
		B_LogEntry(TOPIC_LowLevel,"Abych si promluvil s Grokem musím se naučit skřetí jazyk. Kdo mi s tím pomůže?");
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8204_Grok_HELLO_OK(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_hello_OK_condition;
	information = DIA_Orc_8204_Grok_hello_OK_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8204_Grok_hello_OK_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_hello_OK_info()
{
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_OK_01_01");	//Co potřebuješ člověče? Proč rušit starého Groka?
	AI_Output(other,self,"DIA_Orc_8204_Grok_hello_OK_01_02");	//Musím s tebou mluvit, skřete.
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_OK_01_03");	//(překvapen) Člověk znát můj jazyk? Dobře, Grok mluvit s člověk.
	AI_Output(self,other,"DIA_Orc_8204_Grok_hello_OK_01_04");	//O čem chce člověk mluvit s Grok?
};

instance DIA_Orc_8204_Grok_HowThings(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_HowThings_condition;
	information = DIA_Orc_8204_Grok_HowThings_info;
	permanent = TRUE;
	description = "Jak se máš, skřete?";
};

func int DIA_Orc_8204_Grok_HowThings_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_HowThings_info()
{
	AI_Output(other,self,"DIA_Orc_8204_Grok_HowThings_01_01");	//Jak se máš, skřete?
	AI_Output(self,other,"DIA_Orc_8204_Grok_HowThings_01_02");	//Grok nerozumí co člověk chce.
	AI_Output(self,other,"DIA_Orc_8204_Grok_HowThings_01_03");	//Bude lepší když člověk jít a neobtěžovat starý Grok.
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8204_Grok_WhatYouDo(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_WhatYouDo_condition;
	information = DIA_Orc_8204_Grok_WhatYouDo_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};

func int DIA_Orc_8204_Grok_WhatYouDo_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_WhatYouDo_info()
{
	AI_Output(other,self,"DIA_Orc_8204_Grok_WhatYouDo_01_01");	//Co tady děláš?
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_02");	//Grok stát a dívat se, aby nikdo nešel dolů.
	AI_Output(other,self,"DIA_Orc_8204_Grok_WhatYouDo_01_03");	//Co je tam dole?
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_04");	//Tam je velký skřetí důl. Ale ty nesmít jít dolů. HARAD!
	AI_Output(other,self,"DIA_Orc_8204_Grok_WhatYouDo_01_05");	//Proč?
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_06");	//Protože člověk nesmí! Mohou pouze bratři.
	AI_Output(other,self,"DIA_Orc_8204_Grok_WhatYouDo_01_07");	//Hmmm... Zajímavé. Opravdu tam nemohu?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_08");	//(naštvaně) Ne. HARAD!
	AI_Output(self,other,"DIA_Orc_8204_Grok_WhatYouDo_01_09");	//Nech mě!
};

instance DIA_Orc_8204_Grok_Help(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_Help_condition;
	information = DIA_Orc_8204_Grok_Help_info;
	permanent = FALSE;
	description = "Nevypadáš dobře.";
};

func int DIA_Orc_8204_Grok_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8204_Grok_WhatYouDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_Help_info()
{
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_01");	//Nevypadáš dobře. Co ti je?
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_02");	//Grok je velmi starý skřet... Je těžké stát tu celé dny. Sil málo!
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_03");	//Dříve měl Grok lektvar síly. Tak obnovit svou sílu.
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_04");	//Ale účinky již nejsou! Grok být horší každý den.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_05");	//A co se stane když budeš slabý?
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_06");	//Když Grok slabý a bratři vidět, tak již nebýt Grok.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_07");	//Hmmm, to máte zajímavé tradice. Jak ti můžu pomoci?
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_08");	//Člověk chce Grokovi pomoct? Grok být velmi překvapen.
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_09");	//Obvykle lidi chtít zabít Grok.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_10");	//Obvykle do vašeho města nepřichází lidé.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_11");	//Říkáš tedy, že potřebuješ nějaký lektvar?
	AI_Output(self,other,"DIA_Orc_8204_Grok_Help_01_12");	//Lektvar, aby Grok opět silná! Potom bude Grok schopen tu dlouho stát.
	AI_Output(other,self,"DIA_Orc_8204_Grok_Help_01_13");	//Lektvar síly. Pokusím se ho sehnat.
	MIS_GrokBringPotion = LOG_Running;
	Log_CreateTopic(TOPIC_GrokBringPotion,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GrokBringPotion,LOG_Running);
	B_LogEntry(TOPIC_GrokBringPotion,"Skřet jménem Grok je již velice starý a každým dnem je slabší. Předtím měl lektvary od šamanů, které ho udržovali při síle. Nyní již žádný lektvar nemá a nemůže s tím nic udělat. Pokud to uvidí ostatní skřeti, tak Groka snědí.");
};

instance DIA_Orc_8204_Grok_BringPotion(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_BringPotion_condition;
	information = DIA_Orc_8204_Grok_BringPotion_info;
	permanent = FALSE;
	description = "Tady máš svůj lektvar.";
};

func int DIA_Orc_8204_Grok_BringPotion_condition()
{
	if((MIS_GrokBringPotion == LOG_Running) && (Npc_HasItems(hero,ItPo_Perm_STR) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_BringPotion_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Orc_8204_Grok_BringPotion_01_01");	//Tady máš svůj lektvar.
	B_GiveInvItems(other,self,ItPo_Perm_STR,1);
	Npc_RemoveInvItems(self,ItPo_Perm_STR,1);
	B_UseItem(self,ItPo_Perm_STR_Fake);
	AI_Output(self,other,"DIA_Orc_8204_Grok_BringPotion_01_02");	//Grok děkovat člověku! Cítit jak se vracet síla.
	AI_Output(other,self,"DIA_Orc_8204_Grok_BringPotion_01_03");	//V tom případě tě tvý bratři snědí někdy jindy.
	AI_Output(self,other,"DIA_Orc_8204_Grok_BringPotion_01_04");	//Člověk mít smysl pro vtip... (směje se) Grok líbit vtip.
	MIS_GrokBringPotion = LOG_Success;
	Log_SetTopicStatus(TOPIC_GrokBringPotion,LOG_Success);
	B_LogEntry(TOPIC_GrokBringPotion,"Donesl jsem Grokovi lektvar. Vrátila se mu síla.");
};

instance DIA_Orc_8204_Grok_LowLevel(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_LowLevel_condition;
	information = DIA_Orc_8204_Grok_LowLevel_info;
	permanent = FALSE;
	description = "Potřebuji vědět co se děje na dně dolu.";
};

func int DIA_Orc_8204_Grok_LowLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (KnowGrok == TRUE) && (MIS_GrokBringPotion == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_LowLevel_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_01");	//Potřebuji vědět co se děje na dně dolu.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_02");	//A proč člověk ptát zrovna Groka?
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_03");	//Protože ty jsi jediný, kdo ví proč ostatní skřeti zavřeli spodní patro dolu.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_04");	//Grok je velmi překvapený... (překvapeně) Jak to člověk vědět?
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_05");	//Tavič Hildur říkal, že jsi jediný, kdo v dolu přežil.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_06");	//Hmmm... (zamyšleně) Dobře! Člověk pomáhá Grockovi a on jako důkaz vděčnosti mu vypráví o dolu.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_07");	//Hildur mluvit pravdu! Grok opravdu vidí a ví všechno.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_09");	//Je to už tolik zim. Grok byl silný válečník a strážit spodní patro dolu.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_10");	//Bratři kopat hodně rudy. A chtít víc a víc!
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_11");	//Jednoho dne objevit jednu jeskyni a najít zlá a velká démon.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_12");	//Grok ho vidět! Vidět, jak zabíjí bratry a otroky.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_13");	//On je velmi vyděšený a uteče odtud! A všichni jeho bratři zemřeli.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_14");	//Pak bratři zamknout důl a nikdy znovu neotevřít. Nechtít probudit znovu démon!
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_15");	//Nemám ten pocit že by skutečnýho démona zastavila mříž.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_16");	//To samé myslet Grok. Počkej až sem démon přijde.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_17");	//Mnoho zim přejít a démon pořád zamčený.
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_18");	//Zajímalo by mě co ho zastavilo?
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_19");	//Grok netuší ale myslí, že démon něco chránit.
	AI_Output(self,other,"DIA_Orc_8204_Grok_LowLevel_01_20");	//Vidí jasné světlo v jeskyni. Myslet, to je velmi silná kouzla!
	AI_Output(other,self,"DIA_Orc_8204_Grok_LowLevel_01_21");	//To hodně vysvětluje.
	B_LogEntry(TOPIC_LowLevel,"Od Groka jsem se dozvěděl, že skřeti kdysi narazili na jeskyni, ve které byl démon. Zabil všechny skřety ale Grokovi se podařilo uprchnout. Zdá se, že démon něco střeží ale Grok neví co. Viděl jen jasné světlo, které osvětlovalo celou jeskyni.");
};

instance DIA_Orc_8204_Grok_GoLevel(C_Info)
{
	npc = Orc_8204_Grok;
	condition = DIA_Orc_8204_Grok_GoLevel_condition;
	information = DIA_Orc_8204_Grok_GoLevel_info;
	permanent = FALSE;
	description = "Nezkoušel jsi toho démona zabít viď?";
};

func int DIA_Orc_8204_Grok_GoLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Orc_8204_Grok_LowLevel) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8204_Grok_GoLevel_info()
{
	AI_Output(other,self,"DIA_Orc_8204_Grok_GoLevel_01_01");	//Nezkoušel jsi toho démona zabít viď?
	AI_Output(self,other,"DIA_Orc_8204_Grok_GoLevel_01_02");	//Když Ar-Dagar stát hlavní skřet tady, poslat celý oddíl skřetů na démon.
	AI_Output(self,other,"DIA_Orc_8204_Grok_GoLevel_01_03");	//Ale žádný z nich se nevrátí! Nikdo neví, kam zmizí.
	AI_Output(self,other,"DIA_Orc_8204_Grok_GoLevel_01_04");	//Nikdy bratři nevratit a chtít zabít démon.
	KnowGrokDemon = TRUE;
	B_LogEntry(TOPIC_LowLevel,"Ar-Dagar poslal do dolu oddíl skřetů ale nikdo se nevrátil.");
};

//-----------------------------------------------------Dabar Shak----------------------------------------

instance DIA_Orc_8206_Dakar_EXIT(C_Info)
{
	npc = Orc_8206_Dakar;
	condition = DIA_Orc_8206_Dakar_exit_condition;
	information = DIA_Orc_8206_Dakar_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8206_Dakar_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8206_Dakar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8206_Dakar_HELLO(C_Info)
{
	npc = Orc_8206_Dakar;
	condition = DIA_Orc_8206_Dakar_hello_condition;
	information = DIA_Orc_8206_Dakar_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8206_Dakar_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Orc_8206_Dakar_hello_info()
{
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_01");	//Co je osoba? Proč mluvit s Dakar Shaku?
	AI_Output(other,self,"DIA_Orc_8206_Dakar_hello_01_02");	//Jen se tu rozhlížím. Co tady hlídáš?
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_03");	//Dakar Shak dívat na výheň, dívat na muže, co dělat ocel pro skřety.
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_04");	//Pokud není dostatek oceli, Ar-Dagar nebýt spokojen!
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_05");	//Takže Dakar Shak chce, aby muži pracovala dobře.
	AI_Output(self,other,"DIA_Orc_8206_Dakar_hello_01_06");	//Neopírejte se! Jen pracujte, dělejte ocel. Hodně oceli...
};

instance DIA_Orc_8206_Dakar_Steel(C_Info)
{
	npc = Orc_8206_Dakar;
	condition = DIA_Orc_8206_Dakar_Steel_condition;
	information = DIA_Orc_8206_Dakar_Steel_info;
	permanent = FALSE;
	description = "Proč potřebujete tolik oceli?";
};

func int DIA_Orc_8206_Dakar_Steel_condition()
{
	return TRUE;
};

func void DIA_Orc_8206_Dakar_Steel_info()
{
	AI_Output(other,self,"DIA_Orc_8206_Dakar_Steel_01_01");	//Proč potřebujete tolik oceli?
	AI_Output(self,other,"DIA_Orc_8206_Dakar_Steel_01_02");	//Skřeti bojovat hodně! Bratři potřebují spoustu zbraní.
};


//-----------------------------------------------------Ar Dagar----------------------------------------


instance DIA_OrcWarrior_MineCommander_EXIT(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_exit_condition;
	information = DIA_OrcWarrior_MineCommander_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_OrcWarrior_MineCommander_exit_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineCommander_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineCommander_HELLO(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_hello_condition;
	information = DIA_OrcWarrior_MineCommander_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_OrcWarrior_MineCommander_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_hello_info()
{
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_hello_01_01");	//(rozčileně) Co člověk dělat tady? Proč nepracuje?
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_hello_01_02");	//Nejsem jeden z tvých otroků.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_hello_01_03");	//Takže, co od Ar-Dagar potřebuješ?
};

instance DIA_OrcWarrior_MineCommander_WhoYou(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_WhoYou_condition;
	information = DIA_OrcWarrior_MineCommander_WhoYou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int DIA_OrcWarrior_MineCommander_WhoYou_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineCommander_WhoYou_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhoYou_01_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhoYou_01_02");	//Jmenuji se Ar-Dagar, člověk... (hrozivě) A tohle je můj železný důl.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhoYou_01_03");	//Myslel jsem, že důl patří šamanům Ur-Thralla.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhoYou_01_04");	//Ano, je to tak. Ale já jsem jediný, kdo dává rozkazy!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhoYou_01_05");	//Takže člověk být opatrná ve svých slovech, pokud nechce vztek Ar-Dagar.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhoYou_01_06");	//Jinak ani znamení síly mu nepomoct!
};

instance DIA_OrcWarrior_MineCommander_LowLevel(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_LowLevel_condition;
	information = DIA_OrcWarrior_MineCommander_LowLevel_info;
	permanent = FALSE;
	description = "Chci se zeptat na spodní patro dolu.";
};

func int DIA_OrcWarrior_MineCommander_LowLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (KnowGrokDemon == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_LowLevel_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_LowLevel_01_01");	//Chci se zeptat na spodní patro dolu.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_02");	//(hrozivě) Ar-Dagar si myslí, že to není starost pro člověk.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_LowLevel_01_03");	//Je mi pověz... Poslal jsi tam své válečníky?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_04");	//Hmmm... (hrozivě) Ar-Dagar neví odkud člověk dovědět.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_05");	//Ale má pravdu! Ar-Dagar chtít otevřít dno dolu.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_06");	//Posílá tam mnoho silných bratr, ale tam všichni zahynou.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_07");	//Nikdo se nevrátit zpět k Ar-Dagar...
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_LowLevel_01_08");	//Víš, co je tam dole?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_09");	//Bude to zlo... (smutně) Obrovské zlo, které zabíjí mnoho bratrů Ar-Dagara!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_10");	//Strašný démon, který nemá jméno, nemá jméno.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_LowLevel_01_11");	//Ar-Dagar už neposílá nikdo! Nerušit démona.
	B_LogEntry(TOPIC_LowLevel,"Ar-Dagar potvrdil Grokova slova, jednou se pokusil znovu obsadit spodní patro dolu.");
};

instance DIA_OrcWarrior_MineCommander_WhyDemon(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_WhyDemon_condition;
	information = DIA_OrcWarrior_MineCommander_WhyDemon_info;
	permanent = FALSE;
	description = "Víš odkud se tam vzal?";
};

func int DIA_OrcWarrior_MineCommander_WhyDemon_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineCommander_LowLevel) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_WhyDemon_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhyDemon_01_01");	//Víš odkud se tam vzal?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhyDemon_01_02");	//Ar-Dagar to nevědět! Pouze starý Grok tam být, když démon probudit.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhyDemon_01_03");	//Grok říkal, že tam něco hlídá.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhyDemon_01_04");	//Ar-Dagar o tomhle nic neví... (hrozivě) Ale možná Grok má pravdu.
};

instance DIA_OrcWarrior_MineCommander_HelpDemon(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_HelpDemon_condition;
	information = DIA_OrcWarrior_MineCommander_HelpDemon_info;
	permanent = FALSE;
	description = "Chci Vám pomoct porazit démona.";
};

func int DIA_OrcWarrior_MineCommander_HelpDemon_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineCommander_LowLevel) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_HelpDemon_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_HelpDemon_01_01");		//Chci Vám pomoct porazit démona.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_02");		//(smích) Opravdu člověk tak velký válečník?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_03");		//Zlý démon rozdrtit člověka!
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_HelpDemon_01_04");		//Být tebou, nebyl bych si tím tak jistý.

	if(MIS_PsicampDemon == LOG_Success)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_01");	//Chrám v bažinách je volný!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_05");		//Ar-Dagar vidí, že člověk nelhat. Člověk bojovat dobře!
		AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_06");		//A co ten důl?
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_08");		//Ar-Dagar povoluje, aby člověk bojovat s démon v dolu.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_09");		//Ale zlý démon má spoustu mrtvých služebníků! Pro člověk je těžké chodit tam.
		AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_10");		//Co navrhuješ?
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_11");		//Ar-Dagar mít málo silných bratří aby poslal s člověk. 
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_12");		//Proto nejprve jít k Ur-Thrall, velkého vůdce bratrů. Požádat, aby dal silné válečníky.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_13");		//Jdou spolu s člověk. Pomůže mu bojovat s démon!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_14");		//Nyní člověk jít. Přijít k Ar-Dagar až mluvit s Ur-Thrall.
		B_LogEntry(TOPIC_LowLevel,"Ar-Dagar mě poslal za Ur-Thrallem, aby mi poslal vojáky. Tito skřeti půjdou se mnou, aby mi pomohli vypořádat se s démonem.");
		SendForHelp = TRUE;
	}
	else
	{
	 	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_HelpDemon_01_05");		//Alespoň mi dej šanci.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_06");		//Hmmm... (zamyšleně) Člověk být velmi statečný a velmi hloupý!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_07");		//Ale Ar-Dagar mu dá šanci bojovat s tím démon.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_08");		//Ale nejdřív mi člověk přinést Grah Shah!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_09");		//Ar-Dagar zkontroluje, zda je člověk tak silný, jaký mluví.
		AI_Output(other,self,"DIA_OrcWarrior_MineCommander_HelpDemon_01_10");		//A co je Grah Shah?
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_11");		//Odměna někoho, kdo se stane nejsilnějším válečníkem ve městě svých bratrů!
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_12");		//Pokud člověk dokázat, že je hoden nosit Grah Shah, pak jít do boje se zlým démon.
		AI_Output(self,other,"DIA_OrcWarrior_MineCommander_HelpDemon_01_13");		//A Ar-Dagar mu v tom pomůže.
		B_LogEntry(TOPIC_LowLevel,"Když se stanu mistrem arény ve městě skřetů, Ar-Dagar mi dovolí, abych sestoupil do spodního patra dolu.");
	};
};

instance DIA_OrcWarrior_MineCommander_BringGrah(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_BringGrah_condition;
	information = DIA_OrcWarrior_MineCommander_BringGrah_info;
	permanent = FALSE;
	description = "Mám Grah Shah!";
};

func int DIA_OrcWarrior_MineCommander_BringGrah_condition()
{
	if((MIS_LowLevel == LOG_Running) && (SendForHelp == FALSE) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineCommander_HelpDemon) == TRUE) && (Npc_HasItems(hero,ItMi_GrahShar) >= 1))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_BringGrah_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_01");	//Mám Grah Shah!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_02");	//Člověk ukázat Ar-Dagar. On podívat!
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_03");	//Tady je.
	B_GiveInvItems(other,self,ItMi_GrahShar,1);
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_04");	//Hmmm... (s respektem) BACK COR! Člověk je darem! Velký válečník bratrů.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_05");	//Nyní Ar-Dagar vidí, že člověk nelže. Člověk může dobře bojovat!
	B_GiveInvItems(self,other,ItMi_GrahShar,1);
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_06");	//A co ten důl?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_07");	//Ar-Dagar dát slovo, aby pomohl člověku, pokud přinese Grah Shah! Ar-Dagar splnit svůj slib.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_08");	//Umožňuje člověku jít do hlubokého dolu, aby tam bojoval s démon.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_09");	//Ale zlý démon má spoustu mrtvých služebníků! Pro člověk je těžké chodit tam.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_BringGrah_01_10");	//Co navrhuješ?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_11");	//Ar-Dagar má málo silného válečníka, aby je poslal spolu s člověk.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_12");	//Proto nejprve jít k Ur-Thrall, velkého vůdce bratrů. Požádat, aby dal silné válečníky.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_13");	//Jdou spolu s člověk. Pomůže mu bojovat s démon!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_BringGrah_01_14");	//Nyní člověk jít. Přijít k Ar-Dagar až mluvit s Ur-Thrall.
	B_LogEntry(TOPIC_LowLevel,"Ar-Dagar mě poslal za Ur-Thrallem, aby mi poslal vojáky. Tito skřeti půjdou se mnou, aby mi pomohli vypořádat se s démonem.");
	SendForHelp = TRUE;
};

instance DIA_OrcWarrior_MineCommander_GoShaht(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_GoShaht_condition;
	information = DIA_OrcWarrior_MineCommander_GoShaht_info;
	permanent = FALSE;
	description = "Ur-Thrall mi poskytne válečníky!";
};

func int DIA_OrcWarrior_MineCommander_GoShaht_condition()
{
	if((MIS_LowLevel == LOG_Running) && (OrcHelpLowLevel == TRUE) && (Npc_IsDead(HaosDemon_Orcmine) == FALSE) && (Npc_IsDead(skeleton_warrior_dark_stoneshpere) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_GoShaht_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_GoShaht_01_01");	//Ur-Thrall mi poskytne válečníky!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_GoShaht_01_02");	//To dobré! Člověk jít a bojovat s démon.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_GoShaht_01_03");	//Ar-Dagar mu přeje štěstí!
	GoFightDeepMine = TRUE;
	B_LogEntry(TOPIC_LowLevel,"Informoval jsem Ar-Dagara, že Ur-Thrall souhlasil, že poskytne válečníky. Je načase zastavit zlo, které tam sídlí.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(STRF_2153_Fighter,"ORCMINE_FIGHTER_01");
	Wld_InsertNpc(STRF_2154_Fighter,"ORCMINE_FIGHTER_02");
	Wld_InsertNpc(STRF_2155_Fighter,"ORCMINE_FIGHTER_03");
	Wld_InsertNpc(STRF_2156_Fighter,"ORCMINE_FIGHTER_04");
	Wld_InsertNpc(STRF_2157_Fighter,"ORCMINE_FIGHTER_05");
};

instance DIA_OrcWarrior_MineCommander_FreeDeepShaht(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_FreeDeepShaht_condition;
	information = DIA_OrcWarrior_MineCommander_FreeDeepShaht_info;
	permanent = FALSE;
	description = "Zlo bylo poraženo.";
};

func int DIA_OrcWarrior_MineCommander_FreeDeepShaht_condition()
{
	if((MIS_LowLevel == LOG_Running) && (Npc_IsDead(HaosDemon_Orcmine) == TRUE) && (Npc_IsDead(skeleton_warrior_dark_stoneshpere) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_FreeDeepShaht_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_01");	//Zlo bylo poraženo.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_02");	//(překvapen) Člověk jistý, že démon mrtev?
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_03");	//Pokud mi nevěříš, můžeš jít dolů a zkontrolovat to. Nikdo tam není!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_04");	//To není nutné! Ar-Dagar věřit.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_05");	//Prostě nechápe, jak se mu to podařilo.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_06");	//Člověk je skutečně velký a neohrožený válečník! Ar-Dagar je poctěn, že s ním mluví.
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_FreeDeepShaht_01_07");	//Hezky se to poslouchá.
	MIS_LowLevel = LOG_Success;
	Log_SetTopicStatus(TOPIC_LowLevel,LOG_Success);
	B_LogEntry(TOPIC_LowLevel,"Vrátil jsem se k Ar-Dagarovi a řekl mu, že jsem dokázal ukončit prokletí skřetů.");
};

instance DIA_OrcWarrior_MineCommander_WhatNow(C_Info)
{
	npc = OrcWarrior_MineCommander;
	condition = DIA_OrcWarrior_MineCommander_WhatNow_condition;
	information = DIA_OrcWarrior_MineCommander_WhatNow_info;
	permanent = FALSE;
	description = "Budou skřeti opět těžit rudu?";
};

func int DIA_OrcWarrior_MineCommander_WhatNow_condition()
{
	if(MIS_LowLevel == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_WhatNow_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhatNow_01_01");	//Budou skřeti opět těžit rudu?
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhatNow_01_02");	//Ar-Dagar myslí že ne... To nemůže!
	AI_Output(other,self,"DIA_OrcWarrior_MineCommander_WhatNow_01_03");	//Ale proč? Konečně je spodní patro bezpečné.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhatNow_01_04");	//Skřeti být pak velice hloupí, že kopají tak hluboko!
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhatNow_01_05");	//Ar-Dagar nechce dělat další chyby svých bratrů.
	AI_Output(self,other,"DIA_OrcWarrior_MineCommander_WhatNow_01_06");	//Žádný skřet už nikdy nesmí jít dolů! Jinak dojít k novým potížím.
};

instance DIA_OrcWarrior_MineCommander_PICKPOCKET(C_Info)
{
	npc = OrcWarrior_MineCommander;
	nr = 900;
	condition = DIA_OrcWarrior_MineCommander_pickpocket_condition;
	information = DIA_OrcWarrior_MineCommander_pickpocket_info;
	permanent = TRUE;
	description = "(Pokusit se ukrást jeho klíč)";
};

func int DIA_OrcWarrior_MineCommander_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MIS_ArDagarKey == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineCommander_pickpocket_info()
{
	Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
	Info_AddChoice(DIA_OrcWarrior_MineCommander_pickpocket,Dialog_Back,DIA_OrcWarrior_MineCommander_pickpocket_back);
	Info_AddChoice(DIA_OrcWarrior_MineCommander_pickpocket,DIALOG_PICKPOCKET,DIA_OrcWarrior_MineCommander_pickpocket_doit);
};

func void DIA_OrcWarrior_MineCommander_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		B_GiveThiefXP();
		B_GiveInvItems(self,other,ItKe_ArDagar,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_LogEntry(TOPIC_ArDagarKey,"Ukradl jsem klíč Ar-Dagarovi! Nyní se můžu vrátit.");
		Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
	}
	else
	{
		B_Say(other,other,"$TOOHEAVYFORME");
		Print("Požadovaná obratnost: 100");
		Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
	};
};

func void DIA_OrcWarrior_MineCommander_pickpocket_back()
{
	Info_ClearChoices(DIA_OrcWarrior_MineCommander_pickpocket);
};

//-----------------------------------------------------Vakur Shak----------------------------------------

var int VakurShakNeedGold;
var int VakurShakNeedMoreGold;
var int VakurShakSellRing;
var int VakurShakNeedGoldCount;

instance DIA_OrcWarrior_MineWatcher_Vakur_EXIT(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_exit_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_OrcWarrior_MineWatcher_Vakur_exit_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Vakur_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_Hello(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_Hello_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_Hello_info;
	permanent = FALSE;
	description = "Zdravím tě, zelená hubo.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_Hello_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Vakur_Hello_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_01");	//Zdravím tě, zelená hubo.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_02");	//Člověk... (hrozivě) Proč přijít? 
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_03");	//Člověk chtít stát se otrokem bratří, stejně jako ostatní Morra?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_Hello_01_04");	//Tohle nečekej, skřete.
};

instance DIA_OrcWarrior_MineWatcher_Vakur_WhatDo(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Vakur_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_01");	//Co tady děláš?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_02");	//Vakur Shak zajistit, že otroci dobře pracují.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_03");	//Pokud pracujete špatně, Vakur Shak je porazit!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_WhatDo_01_04");	//To zní jednoduše.
};

instance DIA_OrcWarrior_MineWatcher_Vakur_DontLove(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_DontLove_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_DontLove_info;
	permanent = FALSE;
	description = "Je vás tu hodně?";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_DontLove_condition()
{
	if(Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Vakur_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_DontLove_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_01");	//Je vás tu hodně?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_02");	//Bratři jsou mnozí, lidí být málo.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_03");	//Nikdo nemůže uniknout!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_DontLove_01_04");	//Samozřejmě.
};

instance DIA_OrcWarrior_MineWatcher_Vakur_FerdRing(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_info;
	permanent = FALSE;
	description = "Hej, něco pro tebe mám.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_condition()
{
	if((MIS_FerdRing == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Vakur_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_01");	//Hej, něco pro tebe mám...
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_02");	//Vakur Shak nemá žádný obchod s člověk!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_03");	//Říkat Morra co dělat. Ale neposlouchat ho!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_04");	//A co když jde o zlato?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_05");	//Hmmm... (zamyšleně) Pak osoba, dát Vakur Shak a pak poslouchala.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_06");	//Kolik potřebuješ?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_07");	//Mnoho, velmi mnoho! Mnoho aby Vakur Shak štatný.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_08");	//Řekni to přesně!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_09");	//(přemýšlí) Třicet zlatých nuget! 
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_10");	//Máš dobrý vkus. V tom případě je pro tebe budu muset sehnat.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_FerdRing_01_11");	//Dobrá, nejsi hlupák a rozumíš.
	VakurShakNeedGold = TRUE;
	B_LogEntry(TOPIC_FerdRing,"Vakur Shak se mnou nechce vůbec mluvit! Jenom zlato ho přiměje, aby se mnou mluvil. Jmenovitě třicet zlatých nugetů. Není to hlupák...");
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_info;
	permanent = FALSE;
	description = "Tady máš třicet zlatých nugetů.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_condition()
{
	if((MIS_FerdRing == LOG_Running) && (VakurShakNeedGold == TRUE) && (Npc_HasItems(hero,ItMi_Addon_GoldNugget) >= 30))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_info()
{
	VakurShakNeedGoldCount = FALSE;
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_01");	//Tady máš třicet zlatých nugetů.
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,30);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,30);
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_02");	//Zlato! Vakur Shak velmi miluje zlato.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_03");	//Nyní se člověk může zeptat, co chce. Vakur Shak ho poslouchá!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_04");	//Potřebuji ten prsten, který jsi vzal od Ferdova otroka.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_05");	//Co je prsten?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_06");	//Jednoduchý stříbrný prsten! Nikdo jsi ho neviděl?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_07");	//Áááá, Vakur Shak rozumí tomu, o čem člověk mluví... (vyndal prsten) Myslí toto?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_08");	//To je ono. Dej mi to!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_09");	//(směje se) Vakur Shak neudělá takovu věc pro hloupého člověka!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_10");	//A co za něj chceš?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_11");	//Vakur Shak si myslí, že to člověk ví.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_12");	//Zase zlato?!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_13");	//Ne zlato! Hodně zlata! (chamtivě) Padesát zlatých nugetů... 
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_14");	//To nemyslíš vážně, že chceš tolik za obyčejný stříbrný prsten!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_15");	//Je to pouze na tobě, zda vzít nebo ne! Vakur Shak říkat cenu.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_16");	//Ty a ta tvoje povýšenost!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNugget_01_17");	//Arrgh...
	VakurShakNeedMoreGold = TRUE;
	VakurShakNeedGoldCount = 50;	
	B_LogEntry(TOPIC_FerdRing,"Přinesl jsem Vakur Shakovi třicet zlatých nugetů a zeptal jsem se ho na Ferdův prsten. Chce dalších padesát zlatých nugetů! Proč jsem se s ním jenom zapletl...");
};

instance DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_info;
	permanent = FALSE;
	description = "Můžeme to snížit na polovinu?";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_condition()
{
	if((MIS_FerdRing == LOG_Running) && (VakurShakNeedMoreGold == TRUE) && (VakurShakSellRing == FALSE) && (VakurShakNeedGoldCount >= 50))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_01_01");	//Můžeme to snížit na polovinu?

	if(RhetorikSkillValue[1] >= 65)
	{
		AI_PlayAni(self,"T_YES");
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_01_02");	//Hmmm... Dobrá tedy! To je poslední nabídka od Vakur Shak.
		B_LogEntry(TOPIC_FerdRing,"Vyjednal jsem snížení ceny na dvacetpět zlatých nugetů.");
		VakurShakNeedGoldCount = 25;
	}
	else
	{
		AI_PlayAni(self,"T_NO");
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDiscount_01_03");	//(nevraživě) Ne... HARAD!
	};
};

instance DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_info;
	permanent = FALSE;
	description = "Tady, vezmi si to zlato.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_condition()
{
	if((MIS_FerdRing == LOG_Running) && (VakurShakNeedMoreGold == TRUE) && (Npc_HasItems(hero,ItMi_Addon_GoldNugget) >= VakurShakNeedGoldCount))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_01");	//Tady, vezmi si to zlato.
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,VakurShakNeedGoldCount);
	Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,VakurShakNeedGoldCount);
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_02");	//(chamtivě) Zlato je dobré. Vakur Shak je velmi potěšen!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_03");	//Teď mi dej ten prsten.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_04");	//HARAD! (smích) Vakur Shak je chytrý! Přechytračil člověk.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_05");	//To by bylo velmi hloupé, pokud si myslet, že Vakur Shak dát prsten.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_06");	//Takže ty ses mě rozhodl podvést?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_07");	//Mizerný Morro! Nikdy to nedostaneš.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_08");	//V tom případě navštívím Ur-Thralla, aby nás rozsoudil!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_09");	//(vyděšeně) Ur-Thrall? Člověk pozná velkého náčelníka?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_10");	//A kdo si myslíš, že mi dovolil vstoupit do dolu?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_11");	//HARAD! Člověk nemusí jít za Ur-Thrall! Vakur Shak jen žertuje.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_12");	//Tady, ten člověk vzal ten prsten! Jen nechodíte k velkému vůdci.
	B_GiveInvItems(self,other,ItRi_Ferd,1);

	if(RhetorikSkillValue[1] >= 65)
	{
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_13");	//To nestačí!
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_14");	//Co?!
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_15");	//Za ty tvoje lži mi musíš zaplatit mnohem víc.
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_16");	//Arrgh... (naštvaně) A co chce člověk od Vakur Shak?!
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_17");	//Tak schválně, co mi nabídneš.
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_18");	//Hmmm... (zamyšleně) Vakur Shak má lektvar, díky němuž je Morra silná.
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_19");	//Může to dát člověku.
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_20");	//Skvěle. De mi to.
		B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_21");	//(vztekle) Arrgh...
	}
	else
	{
		AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_GoldNuggetDone_01_22");	//Tak to bychom měli.
	};

	VakurShakSellRing = TRUE;
	B_LogEntry(TOPIC_FerdRing,"Ferdův prsten patří mě.");
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_Perm(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_Perm_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_Perm_info;
	permanent = TRUE;
	description = "Na co potřebuješ tolik zlata, skřete?";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_Perm_condition()
{
	if(VakurShakSellRing == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_Perm_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_Perm_01_01");	//Na co potřebuješ tolik zlata, skřete?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_Perm_01_02");	//Člověk nezajímat se! 
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_Perm_01_03");	//Je lepší jít kam chce. Nemluvit s Vakur Shak.
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_info;
	permanent = FALSE;
	description = "Potřebuju nový krumpáč.";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (ElkNeedNewKirka == 2))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_01");	//Potřebuju nový krumpáč.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_02");	//Pokud chce člověk nový krumpáč, pak zaplatí zlato Vakur Shak.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_03");	//A kolik chceš?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_04");	//Deset zlatých nuget! A ne o něco méně...
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_05");	//Hele, není to moc za obyčejný krumpáč?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_01_06");	//Vakur Shak si myslí, že cena je dobrá. Je dobré ho prodat!
	ElkNeedNewKirka = 3;
};

instance DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done(C_Info)
{
	npc = OrcWarrior_MineWatcher_Vakur;
	condition = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_condition;
	information = DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_info;
	permanent = TRUE;
	description = "Prodá mi nový krumpáč. (cena: 10 zlatých nugetů)";
};

func int DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_condition()
{
	if((MIS_ElkKirka == LOG_Running) && (ElkNeedNewKirka == 3))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_01");	//Tady je máš. Teď mi dej ten krumpáč.

	if(Npc_HasItems(hero,ItMi_Addon_GoldNugget) >= 10)
	{
		B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,10);
		Npc_RemoveInvItems(self,ItMi_Addon_GoldNugget,10);
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_02");	//Dobrý obchod... (spokojeně) Nyní člověk vzít svůj nástroj!
		B_GiveInvItems(self,other,ItMw_Kirka_New,1);
		ElkNeedNewKirka = 4;
	}
	else
	{
		AI_PlayAni(self,"T_NO");
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_03");	//Člověk nemá dost zlata!
		AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Vakur_ElkKirka_Done_01_04");	//Vakur Shak mu nedá nic.
	};
};

//-----------------------------------------------------Kor Shak----------------------------------------

instance DIA_OrcWarrior_MineWatcher_Korshak_EXIT(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_exit_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_OrcWarrior_MineWatcher_Korshak_exit_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Korshak_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_OrcWarrior_MineWatcher_Korshak_Hello(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_Hello_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_Hello_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_Hello_condition()
{
	return TRUE;
};

func void DIA_OrcWarrior_MineWatcher_Korshak_Hello_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_02");	//Jmenuji se Kor Shak, člověče...
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_03");	//Starám se, aby otroci neokouněli ale těžili rudu.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_04");	//Hmmm... Na skřeta mluvíš velmi dobře.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_05");	//Kor Shak se dlouho učil lidskému jazyku.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_Hello_01_06");	//Vždycky se hodí znát svého nepřítele po všech stránkách.
};

instance DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_info;
	permanent = FALSE;
	description = "Kde ses naučil tak dobře mluvit?";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_condition()
{
	if(Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Korshak_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_01");	//Kde ses naučil tak dobře mluvit?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_02");	//Kor Shak byl velmi dlouho lidským vězněm! Byl jejich vězněm po mnoho zim.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_03");	//Poslouchal lidi a naučil se mluvit jako oni.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeak_01_04");	//Je to znát.
};

instance DIA_OrcWarrior_MineWatcher_Korshak_KrowBook(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_info;
	permanent = FALSE;
	description = "Prý máš deník nějakého otroka.";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_condition()
{
	if((MIS_KrowBook == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Korshak_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_01");	//Prý máš deník nějakého otroka.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_02");	//Ano, máš pravdu...
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_03");	//Kor Shak deník zabavil a nikomu ho nedá.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_04");	//A na co ho potřebuješ?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_05");	//Kor Shak si myslí, že se může naučit mluvit lépe, pokud přečte tuto knihu.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_06");	//A jak ti to jde?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_07");	//Nic moc... Kor Shak zatím moc nerozumí, co se tam píše.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_08");	//Ale on si myslí, že pokud to bude číst dlouho, pak bude všechno lepší.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBook_01_09");	//Nejsem si tím úplně jistý.
	B_LogEntry(TOPIC_KrowBook,"Kor Shak vzal deník od Crowa, aby se naučil mluvit lépe lidsky. Na skřeta opravdu zvláštní touha. Musím mu nějak pomoct, abych dostal Crowův deník zpět. Pomohla by mi jiná kniha?");
};

instance DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_info;
	permanent = FALSE;
	description = "Mám pro tebe lepší nabídku.";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_condition()
{
	if((MIS_KrowBook == LOG_Running) && (Npc_KnowsInfo(hero,DIA_OrcWarrior_MineWatcher_Korshak_KrowBook) == TRUE) && (Npc_HasItems(hero,ITWR_RHETORIKBOOK) >= 1))
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_01");	//Mám pro tebe lepší nabídku.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_02");	//O čem to mluvíš?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_03");	//Podívěj, tohle je učebnice rétoriky! Pomůže ti porozumět lidské řeči daleko lépe.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_04");	//(se zájmem) Člověk má jinou knihu? Co za ní chce?
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_05");	//Uděláme výměnu. Dám ti tuhle knihu a ty mi dáš ten deník.
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_06");	//Veř mi, skřete. Je to férový obchod!
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_07");	//Hmmm... (zamyšleně) Dobře! Kor Shak souhlasí s výměnou.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_08");	//Ale pokud se mi nebude líbit kniha od člověka tam mu nic nedám!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_09");	//Tak si ji prohlédni.
	B_GiveInvItems(other,self,ITWR_RHETORIKBOOK,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_10");	//KRODAR CAR! UR TAR BAR!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_11");	//(spokojeně) Kor Shak si myslí, že je to velmi zajímavá kniha. Dokonce rozumí, co tu lidé napsali!
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_12");	//Tak na, užij si ji. Ale nejdřív mi dej ten deník.
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_13");	//Počkej, člověče! Vezmi si to. Kor Shak už to nepotřebuje!
	B_GiveInvItems(self,other,ItWr_KrowBook,1);
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_KrowBookBack_01_14");	//Je radost s tebou obchodovat.
	B_LogEntry(TOPIC_KrowBook,"Vyměnil jsem učebnici rétoriky za Crowův deník. Nyní je načase vrátit deník právoplatnému majiteli.");
};

instance DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore(C_Info)
{
	npc = OrcWarrior_MineWatcher_Korshak;
	condition = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_condition;
	information = DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_info;
	permanent = TRUE;
	description = "Nuže, jak se ti líbí ta kniha?";
};

func int DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_condition()
{
	if(MIS_KrowBook == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_info()
{
	AI_Output(other,self,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_01_01");	//Nuže, jak se ti líbí ta kniha?
	AI_Output(self,other,"DIA_OrcWarrior_MineWatcher_Korshak_GoodSpeakMore_01_02");	//Velmi zajímavé! Kor Shak moc děkuje za knihu.
	AI_PlayAni(self,"T_GREETGRD");
};

//-----------------------------------------------------Ork okhranik ryadom s Nutsom----------------------------------------


instance DIA_Orc_8208_MineGuard_EXIT(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_exit_condition;
	information = DIA_Orc_8208_MineGuard_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8208_MineGuard_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8208_MineGuard_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8208_MineGuard_HELLO(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_hello_condition;
	information = DIA_Orc_8208_MineGuard_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8208_MineGuard_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_hello_info()
{
	AI_PlayAni(self,"T_GETLOST2");
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_hello_01_01");	//(rozzlobeně) KRATUK KAR DRAG BAR KIRAK! HARAD MORRA TAR!
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_hello_01_02");	//Um... Co jsi říkal?

	if(MIS_RemoveOrc == FALSE)
	{
		AI_StopProcessInfos(self);
	};
};

instance DIA_Orc_8208_MineGuard_RemoveOrc(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_RemoveOrc_condition;
	information = DIA_Orc_8208_MineGuard_RemoveOrc_info;
	permanent = FALSE;
	description = "Předvolává tě Ar-Dagar!";
};

func int DIA_Orc_8208_MineGuard_RemoveOrc_condition()
{
	if(MIS_RemoveOrc == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_RemoveOrc_info()
{
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_RemoveOrc_01_01");	//Předvolává tě Ar-Dagar!
	AI_PlayAni(self,"T_DONTKNOW");
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_RemoveOrc_01_02");	//PAT TOR KU BAR HAK NOR...
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_RemoveOrc_01_03");	//Abych řekl pravdu, netuším, co to blekotáš.
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_RemoveOrc_01_04");	//Ale pokud ho nechceš naštvat, měl by sis pospíšit.
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_RemoveOrc_01_05");	//MORRA DACH TUP GRON SAKUR DAR...
	RemoveOrcDone = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8208_MineGuard_Angry(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_Angry_condition;
	information = DIA_Orc_8208_MineGuard_Angry_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Orc_8208_MineGuard_Angry_condition()
{
	if((MIS_RemoveOrc == LOG_Success) && (OrcDoneWalArDagar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_Angry_info()
{
	AI_ReadyMeleeWeapon(self);
	Snd_Play("ORC_Angry");
	AI_PlayAni(self,"T_IGETYOU");
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_Angry_01_01");	//MORRA CRUSH DAR SUR MER! AR DAGAR KAR BIT MORRA.
	AI_Output(other,self,"DIA_Orc_8208_MineGuard_Angry_01_02");	//Jasně, zvoral jsem to. To se občas stane každému!
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_Angry_01_03");	//HARAD KAR VAK SHAR TUG! KROTAK NABAR...
	AI_RemoveWeapon(self);
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8208_MineGuard_Angry_Perm(C_Info)
{
	npc = Orc_8208_MineGuard;
	condition = DIA_Orc_8208_MineGuard_Angry_Perm_condition;
	information = DIA_Orc_8208_MineGuard_Angry_Perm_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Orc_8208_MineGuard_Angry_Perm_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_KnowsInfo(hero,DIA_Orc_8208_MineGuard_Angry) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8208_MineGuard_Angry_Perm_info()
{
	AI_PlayAni(self,"T_GETLOST");
	AI_Output(self,other,"DIA_Orc_8208_MineGuard_Angry_Perm_01_01");	//MORRA HARAD TAR...
	AI_StopProcessInfos(self);
};

//-----------------------------------------------------Umrak----------------------------------------

instance DIA_Orc_8210_Umrak_EXIT(C_Info)
{
	npc = STRF_8151_Umrak;
	condition = DIA_Orc_8210_Umrak_exit_condition;
	information = DIA_Orc_8210_Umrak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8210_Umrak_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8210_Umrak_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8210_Umrak_PreHello(C_Info)
{
	npc = STRF_8151_Umrak;
	condition = DIA_Orc_8210_Umrak_PreHello_condition;
	information = DIA_Orc_8210_Umrak_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8210_Umrak_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8210_Umrak_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8210_Umrak_PreHello_01_01");	//Vypadni odsud! Nebo vás rozříznu...
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8210_Umrak_PreHello_01_02");	//Teď ne, Morra.
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8210_Umrak_PreHello_01_03");	//Mám toho hodně co dělat.
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8210_Umrak_Hello(C_Info)
{
	npc = STRF_8151_Umrak;
	condition = DIA_Orc_8210_Umrak_Hello_condition;
	information = DIA_Orc_8210_Umrak_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8210_Umrak_Hello_condition()
{
	if((ArenaBattle_06 == TRUE) && (ArenaBattle_06_Won == FALSE) && (ArenaBattle_06_Lost == FALSE) && (UmrakIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8210_Umrak_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8210_Umrak_Hello_01_00");	//Dobře!
	AI_Output(self,other,"DIA_Orc_8210_Umrak_Hello_01_01");	//Konečně, rovnocený soupeř.
	AI_Output(self,other,"DIA_Orc_8210_Umrak_Hello_01_02");	//Rozdrtím jako červa...
	UmrakIsFight = TRUE;
	KnowAboutUmrak = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

//-------------------------------Urtrok----------------------------

instance DIA_Orc_8211_UrTrok_EXIT(C_Info)
{
	npc = STRF_8150_UrTrok;
	condition = DIA_Orc_8211_UrTrok_exit_condition;
	information = DIA_Orc_8211_UrTrok_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8211_UrTrok_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8211_UrTrok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8211_UrTrok_PreHello(C_Info)
{
	npc = STRF_8150_UrTrok;
	condition = DIA_Orc_8211_UrTrok_PreHello_condition;
	information = DIA_Orc_8211_UrTrok_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8211_UrTrok_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8211_UrTrok_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8211_UrTrok_PreHello_01_01");	//Orak Shaka!
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8211_UrTrok_PreHello_01_02");	//Vždy se ctí...
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8211_UrTrok_PreHello_01_03");	//Zmiz!
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8211_UrTrok_Hello(C_Info)
{
	npc = STRF_8150_UrTrok;
	condition = DIA_Orc_8211_UrTrok_Hello_condition;
	information = DIA_Orc_8211_UrTrok_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8211_UrTrok_Hello_condition()
{
	if((ArenaBattle_05 == TRUE) && (ArenaBattle_05_Won == FALSE) && (ArenaBattle_05_Lost == FALSE) && (UrTrokIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8211_UrTrok_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8211_UrTrok_Hello_01_01");	//Nikdo mě nemůže porazit, Morra.
	AI_Output(self,other,"DIA_Orc_8211_UrTrok_Hello_01_02");	//Teď roztrhám na kousky!
	UrTrokIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


//-------------------------------Turuk----------------------------

instance DIA_Orc_8212_Turuk_EXIT(C_Info)
{
	npc = STRF_8149_Turuk;
	condition = DIA_Orc_8212_Turuk_exit_condition;
	information = DIA_Orc_8212_Turuk_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8212_Turuk_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8212_Turuk_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8212_Turuk_PreHello(C_Info)
{
	npc = STRF_8149_Turuk;
	condition = DIA_Orc_8212_Turuk_PreHello_condition;
	information = DIA_Orc_8212_Turuk_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8212_Turuk_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8212_Turuk_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8212_Turuk_PreHello_01_01");	//Dobrá zbraň musí být ostrá!
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8212_Turuk_PreHello_01_02");	//Vypadni!
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8212_Turuk_PreHello_01_03");	//Zmiz!
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8212_Turuk_Hello(C_Info)
{
	npc = STRF_8149_Turuk;
	condition = DIA_Orc_8212_Turuk_Hello_condition;
	information = DIA_Orc_8212_Turuk_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8212_Turuk_Hello_condition()
{
	if((ArenaBattle_03 == TRUE) && (ArenaBattle_03_Won == FALSE) && (ArenaBattle_03_Lost == FALSE) && (TurukIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8212_Turuk_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8212_Turuk_Hello_01_01");	//Blázne!
	AI_Output(self,other,"DIA_Orc_8212_Turuk_Hello_01_02");	//Opravdu si myslíš, že mě můžeš porazit?
	TurukIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

//-------------------------------Gunnok----------------------------

instance DIA_Orc_8213_Gunnok_EXIT(C_Info)
{
	npc = STRF_8148_Gunnok;
	condition = DIA_Orc_8213_Gunnok_exit_condition;
	information = DIA_Orc_8213_Gunnok_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8213_Gunnok_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8213_Gunnok_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8213_Gunnok_PreHello(C_Info)
{
	npc = STRF_8148_Gunnok;
	condition = DIA_Orc_8213_Gunnok_PreHello_condition;
	information = DIA_Orc_8213_Gunnok_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8213_Gunnok_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8213_Gunnok_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8213_Gunnok_PreHello_01_01");	//Ty příliš mluvit, Morra.
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8213_Gunnok_PreHello_01_02");	//Orak Shaka!
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8213_Gunnok_PreHello_01_03");	//Vypadni odsud.
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8213_Gunnok_Hello(C_Info)
{
	npc = STRF_8148_Gunnok;
	condition = DIA_Orc_8213_Gunnok_Hello_condition;
	information = DIA_Orc_8213_Gunnok_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8213_Gunnok_Hello_condition()
{
	if((ArenaBattle_02 == TRUE) && (ArenaBattle_02_Won == FALSE) && (ArenaBattle_02_Lost == FALSE) && (GunnokIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8213_Gunnok_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8213_Gunnok_Hello_01_01");	//Ano, rozmazám člověk!
	GunnokIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

//-------------------------------Dagrat----------------------------

instance DIA_Orc_8214_Dagrag_EXIT(C_Info)
{
	npc = STRF_8147_Dagrag;
	condition = DIA_Orc_8214_Dagrag_exit_condition;
	information = DIA_Orc_8214_Dagrag_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8214_Dagrag_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8214_Dagrag_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8214_Dagrag_PreHello(C_Info)
{
	npc = STRF_8147_Dagrag;
	condition = DIA_Orc_8214_Dagrag_PreHello_condition;
	information = DIA_Orc_8214_Dagrag_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8214_Dagrag_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") > 500))
	{
		return TRUE;
	};
};

func void DIA_Orc_8214_Dagrag_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		random = Hlp_Random(3);

		if(random == 0)
		{
			AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_01");	//Mít nějaký problém v hlavě člověk?
		}
		else if(random == 1)
		{
			AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_02");	//Být silnější!
		}	
		else if(random == 2)
		{
			AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Orak Shaka!
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Orc_8214_Dagrag_Hello(C_Info)
{
	npc = STRF_8147_Dagrag;
	condition = DIA_Orc_8214_Dagrag_Hello_condition;
	information = DIA_Orc_8214_Dagrag_Hello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8214_Dagrag_Hello_condition()
{
	if((ArenaBattle_01 == TRUE) && (ArenaBattle_01_Won == FALSE) && (ArenaBattle_01_Lost == FALSE) && (DagragIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 200) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_Orc_8214_Dagrag_Hello_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_PlayAni(self,"T_GREETGRD");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Orc_8214_Dagrag_Hello_01_01");	//No, ukaž za co stojíš, Morra...
	DagragIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

//-------------------------------Ur Kan----------------------------

instance DIA_Orc_8215_Kan_EXIT(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_exit_condition;
	information = DIA_Orc_8215_Kan_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8215_Kan_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8215_Kan_exit_info()
{
	AI_StopProcessInfos(self);
};

var int UrKanFirstTime;

instance DIA_Orc_8215_Kan_PreHello(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_PreHello_condition;
	information = DIA_Orc_8215_Kan_PreHello_info;
	permanent = TRUE;
	description = "Zdravím tě, skřete!";

};

func int DIA_Orc_8215_Kan_PreHello_condition()
{
	if(PlayerKnowsOrcLanguage == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_PreHello_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_PreHello_01_00");	//Zdravím tě, skřete!

	if(UrKanFirstTime == FALSE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_PreHello_01_01");	//COR GAR! TOUR KAR ULU-MULU GOR...
		AI_Output(other,self,"DIA_Orc_8215_Kan_PreHello_01_02");	//Nerozumím ti!
		NeedKnowOrcLang = TRUE;
		UrKanFirstTime = TRUE;
	};

	AI_Output(self,other,"DIA_Orc_8215_Kan_PreHello_01_03");	//BAR KARAT GOR AS THE NIR VAK.
	AI_Output(other,self,"DIA_Orc_8215_Kan_PreHello_01_04");	//Tohle je zbytečný! Musím se naučit tvůj jazyk.
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8215_Kan_Hello(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Hello_condition;
	information = DIA_Orc_8215_Kan_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8215_Kan_Hello_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Hello_info()
{
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other,"DIA_Orc_8215_Kan_Hello_01_01");	//COR GAR! Člověk... Vidím, nosíš Ulu-Mulu.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Hello_01_03");	//No a?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Hello_01_02");	//Myslím, že člověk je velmi silný válečník, pokud má Ulu-Mulu.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Hello_01_04");	//A pokud ano, pak může člověk bojovat s dalšími válečníky, aby získal velkou čest.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Hello_01_05");	//Když je to velká čest, všichni bratři respektují osobu.
};

instance DIA_Orc_8215_Kan_WhoYou(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_WhoYou_condition;
	information = DIA_Orc_8215_Kan_WhoYou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int DIA_Orc_8215_Kan_WhoYou_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_WhoYou_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_WhoYou_01_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Orc_8215_Kan_WhoYou_01_02");	//Jmenuji se Ur-Kan, člověče.
	AI_Output(other,self,"DIA_Orc_8215_Kan_WhoYou_01_03");	//Co tu děláš?
	AI_Output(self,other,"DIA_Orc_8215_Kan_WhoYou_01_04");	//Ur-Kan dbá o to, aby jeho válečníci byli vždy připraveni bojovat.
	AI_Output(self,other,"DIA_Orc_8215_Kan_WhoYou_01_05");	//Buďte silní! Hodně trénování, málo spánek...
};

instance DIA_Orc_8215_Kan_Place(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Place_condition;
	information = DIA_Orc_8215_Kan_Place_info;
	permanent = FALSE;
	description = "Co je to za místo?";
};

func int DIA_Orc_8215_Kan_Place_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Place_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Place_01_01");	//Co je to za místo?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Place_01_02");	//Velká skřetí aréna.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Place_01_03");	//Mocný válečník tady bojovat mezi sebou za čest, za právo být nazýván Mor Dar!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Place_01_04");	//Mor Dar?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Place_01_05");	//Jazyk bratrů znamená nejlepšího, nejsilnějšího válečníka skřetů. Hodně cti, hodně respektu!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Place_01_06");	//Áááá, rozumím.
};

instance DIA_Orc_8215_Kan_MorDar(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_MorDar_condition;
	information = DIA_Orc_8215_Kan_MorDar_info;
	permanent = FALSE;
	description = "Kdo je Mor Dar:";
};

func int DIA_Orc_8215_Kan_MorDar_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Place) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_MorDar_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_MorDar_01_01");	//Kdo je Mor Dar?
	AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_02");	//Černý skřet jménem Ur-Karras je posledním, kdo má čest nosit titul.

	if(UrKarrasInsert == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_03");	//Ale už dlouho nebojovat v aréně!
		AI_Output(other,self,"DIA_Orc_8215_Kan_MorDar_01_04");	//Proč?
		AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_05");	//Ur-Karras se stal velkým starším a jde do války spolu s Ur-Thrallem proti lidem.
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_07");	//Ale už dávno opustit město, aby bojoval s lidi.
		AI_Output(self,other,"DIA_Orc_8215_Kan_MorDar_01_08");	//Bratři potřebují nový Mor Dar!
	};
};

instance DIA_Orc_8215_Kan_Interes(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Interes_condition;
	information = DIA_Orc_8215_Kan_Interes_info;
	permanent = FALSE;
	description = "Bojujete pouze pro čest nebo pro nějakou odměnu?";
};

func int DIA_Orc_8215_Kan_Interes_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Join) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Interes_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Interes_01_01");	//Bojujete pouze pro čest nebo pro nějakou odměnu?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_02");	//Pokud člověk bojuje dobře a vyhraje, dostane od Ur-Kan za každou boj odměnu.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_03");	//Pokud prohraješ a budeš chtít znovu bojovat, dej Ur-Kan trochu rudy.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Interes_01_04");	//A nechcete raději zlato?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_05");	//Skřeti nemají rádi zlato, jak milovat lidi...
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_06");	//Skřeti milují jen dobrý meč a silná zbroj!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Interes_01_07");	//A proč potřebujete magickou rudu?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_08");	//Bratři mohou z toho dělat velmi silné zbraně. Pak jít a bojovat lépe!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Interes_01_09");	//A kdo pro Vás dělá takové zbraně?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Interes_01_10");	//Člověk se má zeptat Hash Tor! Jen on dělat takové zbraně.
	KnowAboutHashTor = TRUE;
	B_LogEntry(TOPIC_OrcArena,"Za každý boj co vyhraji dostanu odměnu. Pokud prohraji, budu potřebovat magickou rudu na další kolo. Z magické rudy se dají udělat velmi silné zbraně.");
};

instance DIA_Orc_8215_Kan_GrahShar(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_GrahShar_condition;
	information = DIA_Orc_8215_Kan_GrahShar_info;
	permanent = FALSE;
	description = "A jaká je hlavní cena?";
};

func int DIA_Orc_8215_Kan_GrahShar_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Interes) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_GrahShar_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_GrahShar_01_01");	//A jaká je hlavní cena?
	AI_Output(self,other,"DIA_Orc_8215_Kan_GrahShar_01_02");	//Pokud člověk porazí každého a stane se Mor Dar, obdrží Grah Shah.
	AI_Output(other,self,"DIA_Orc_8215_Kan_GrahShar_01_03");	//Grah Shah?
	AI_Output(self,other,"DIA_Orc_8215_Kan_GrahShar_01_04");	//Skvělý symbol mocného válečníka skřetů! Učinit člověka ještě silnější...
	B_LogEntry(TOPIC_OrcArena,"Nejcennější cenou je Grah Shah. Nevím, co to je. A Ur-Kan mi to moc nevysvětlil.");
};


instance DIA_Orc_8215_Kan_Join(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Join_condition;
	information = DIA_Orc_8215_Kan_Join_info;
	permanent = FALSE;
	description = "Chci bojovat v aréně.";
};

func int DIA_Orc_8215_Kan_Join_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Place) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Join_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Join_01_01");	//Chci bojovat v aréně.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_02");	//Nejprve musí člověk prokázat, že je hoden toho.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Join_01_03");	//A jak to mám udělat? Zmalovat ti hřbet, skřete?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_04");	//(smích) Člověk, která je zábavná! Ur-Kan má rád, jak vtipkovat.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_05");	//To mu však nepomůže.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_06");	//Člověk musí porazit jednoho z válečníků Ur-Kana! Jen tehdy dokáže, že je hoden.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Join_01_07");	//No, to zvládnu.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_08");	//To není všechno... (vážně) Člověk bojovat s Ulu-Mulu!
	AI_Output(self,other,"DIA_Orc_8215_Kan_Join_01_09");	//Když vzít jiná zbraň tak zemřít rychle! Tak říkat Ur-Kan...
	AI_Output(other,self,"DIA_Orc_8215_Kan_Join_01_10");	//Aha, rozumím.
	MIS_OrcArena = LOG_Running;
	Log_CreateTopic(TOPIC_OrcArena,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcArena,LOG_Running);
	B_LogEntry(TOPIC_OrcArena,"Ve skřetím městě je aréna, kde se bojuje o právo nosit titul velkých skřetích válečníků, Mor Dar. Ur-Kan to tu řídí. Projevil jsem zájem zúčastnit se. Ur-Kan mě chce pro začátek prověřit jak jsem na tom s bojem. Musím porazit jednoho z jeho válečníků.");
};

instance DIA_Orc_8215_Kan_JoinNext(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_JoinNext_condition;
	information = DIA_Orc_8215_Kan_JoinNext_info;
	permanent = FALSE;
	description = "A když zvítězím, pak co?";
};

func int DIA_Orc_8215_Kan_JoinNext_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_Join) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_JoinNext_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_JoinNext_01_01");	//A když zvítězím, pak co?
	AI_Output(self,other,"DIA_Orc_8215_Kan_JoinNext_01_02");	//Pak se člověk stává jedním z válečníků Ur-Kan a pak může vyzvat další válečníky.
	AI_Output(self,other,"DIA_Orc_8215_Kan_JoinNext_01_03");	//Dokud se nestát Mor Dar!
};

var int UrKanTellRules;

instance DIA_Orc_8215_Kan_Rules(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Rules_condition;
	information = DIA_Orc_8215_Kan_Rules_info;
	permanent = FALSE;
	description = "Jaká jsou pravidla?";
};

func int DIA_Orc_8215_Kan_Rules_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_JoinNext) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Rules_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Rules_01_01");	//Jaká jsou pravidla?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_02");	//Muž bojovat pouze s Ulu-Mulu!
	AI_Output(other,self,"DIA_Orc_8215_Kan_Rules_01_03");	//Co, vždycky?!
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_04");	//Ne. Jenom v první bitvě pak už může jakoukoli zbraň.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Rules_01_05");	//Dobře. Ještě něco?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_06");	//Nechte šíp nebo šipka HARAD! Muž umírá...
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_07");	//Použijte kouzlo HARAD! Muž znovu zemře...
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_08");	//Začít boj až promluvit se soupeř! Pokud jinak muž zemře...
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_09");	//Nezabíjej, pokud vyhraješ! Jinak bratři rychle učiní člověk mrtvým.
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_10");	//Pokud uteče, pak už nebude bojovat ve velké aréně.
	AI_Output(other,self,"DIA_Orc_8215_Kan_Rules_01_11");	//Je to všechno?
	AI_Output(self,other,"DIA_Orc_8215_Kan_Rules_01_12");	//Ano, Ur-Kan říká všechno.
	UrKanTellRules = TRUE;
	B_LogEntry(TOPIC_OrcArena,"Ur-Kan mi řekl pravidla pro boj v aréně. Nesmím používat luky, kuše a dokonce ani magii. Pokud něco z toho použiju, zemřu! Nejprve musím pozdravit svého soupěře a pak začne boj. Nemůžu opustit arénu, protože bych pak nemohl dále bojovat. Není dovoleno zabít svého soupeře. V mém prvním souboji musím používat POUZE Ulu-Mulu! V následujícím boji mohu použít libovolnou zbraň ale po každém boji si musím nasadit Ulu-Mulu jinak mě skřeti zabijí. Vše je strašně komplikované... Ale není se čemu divit, když jsem pro ně cizinec.");
};

instance DIA_Orc_8215_Kan_Ready(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Ready_condition;
	information = DIA_Orc_8215_Kan_Ready_info;
	permanent = TRUE;
	description = "Jsem připraven bojovat.";
};

func int DIA_Orc_8215_Kan_Ready_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Orc_8215_Kan_JoinNext) == TRUE) && (ArenaBattle_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Ready_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8147_Dagrag);
	AI_Output(other,self,"DIA_Orc_8215_Kan_Ready_01_01");	//Jsem připraven bojovat.

	if(UrKanTellRules == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_02");	//Dobře. Tvým prvním soupeř je Dagrag!
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_03");	//Je nejslabším válečníkem Ur-Kan.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_04");	//Pokud člověk nemůže překonat Dagrag, nemá tu co dělat.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_05");	//Člověk odchází a už nechodí k Ur-Kan.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_06");	//Teď vstoupí do arény! Dagrag už musí čekat...
		B_LogEntry(TOPIC_OrcArena,"Takže, můj první soupeř je Dagrag. Jsem zvědav jak moc jsou skřetí válečníci silní.");
		AI_StopProcessInfos(self);
		ArenaBattle_01 = TRUE;
		ArenaFightNow = TRUE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_07");	//Za prvé, Ur-Kan říct člověk pravidla.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Ready_01_08");	//Pak už bude bojovat.
	};
};

var int ReadyForRoundTwo;
var int ReadyForRoundThree;
var int ReadyForRoundFour;
var int ReadyForRoundFive;
var int ReadyForRoundSix;
var int LostLastOrcFight;

instance DIA_Orc_8215_Kan_PissOff(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_PissOff_condition;
	information = DIA_Orc_8215_Kan_PissOff_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8215_Kan_PissOff_condition()
{
	if((UrKanPissOff == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_PissOff_info()
{
	AI_Output(self,other,"DIA_Orc_8215_Kan_PissOff_01_01");	//(s odporem) Člověk jít pryč. Tak slabý!
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8215_Kan_Round_First(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_Round_First_condition;
	information = DIA_Orc_8215_Kan_Round_First_info;
	permanent = FALSE;
	description = "Mám za sebou první zápas.";
};

func int DIA_Orc_8215_Kan_Round_First_condition()
{
	if((ArenaBattle_01_Won == TRUE) || (ArenaBattle_01_Lost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_Round_First_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_Round_First_01_01");	//Mám za sebou první zápas.

	if(ArenaBattle_01_Won == TRUE)
	{
		B_GivePlayerXP(300);
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_02");	//Člověk vyhrál... (s respektem) Ur-Kan vidí, že člověk je zručný válečník!
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_03");	//Teď, pokud chce, může bojovat s dalšími válečníky Ur-Kan.
		AI_Output(other,self,"DIA_Orc_8215_Kan_Round_First_01_04");	//A co moje odměna?
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_05");	//Pro tento boj člověk nedostávat nic. Ur-Kan prostě zkontrolovat člověk.
		B_LogEntry(TOPIC_OrcArena,"Prošel jsem zkouškou Ur-Kana. Teď můžu vyzvat další valečníky.");
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Reputace mezi skřety + 5");
		};
		ArenaFightNow = FALSE;
		ReadyForRoundTwo = TRUE;
		CanArenaFightNoUluMulu = TRUE;
	}
	else if(ArenaBattle_01_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_07");	//Tys prohrál! Člověk je slabá a není hodna nosit Ulu-Mulu.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Round_First_01_08");	//Ur Kan už nemluví s mužem! Ty odejít.
		AI_Output(other,self,"DIA_Orc_8215_Kan_Round_First_01_09");	//Počkej...
		B_LogEntry(TOPIC_OrcArena,"Nesplnil jsem Ur-Kanovu zkoušku. Nemám mu chodit na oči.");
		MIS_OrcArena = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_OrcArena);
		UrKanPissOff = TRUE;
		AI_StopProcessInfos(self);
	};

	B_StartOtherRoutine(STRF_8147_Dagrag,"Start");
};

//-----------------------------tsikl bitv-----------------------------------------------------

instance DIA_Orc_8215_Kan_RoundTwo(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundTwo_condition;
	information = DIA_Orc_8215_Kan_RoundTwo_info;
	permanent = FALSE;
	description = "Chci bojovat!";
};

func int DIA_Orc_8215_Kan_RoundTwo_condition()
{
	if((ReadyForRoundTwo == TRUE) && (ArenaBattle_02 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundTwo_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8148_Gunnok);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundTwo_01_01");	//Chci bojovat!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_01_02");	//Dobře. Věděl jsem, že člověk to líbí!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_01_03");	//Dalším soupeřem Gunnok.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_01_04");	//Je silným válečníkem skřetů. Člověk nelehké!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_01_05");	//Teď vstoupí do arény! Ur-Kan říct vše...
	B_LogEntry(TOPIC_OrcArena,"Mým dalším soupeřem je skřet Gunnok.");
	AI_StopProcessInfos(self);
	ArenaBattle_02 = TRUE;
	ArenaFightNow = TRUE;
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundTwoDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundTwoDone_condition;
	information = DIA_Orc_8215_Kan_RoundTwoDone_info;
	permanent = TRUE;
	description = "Bojoval jsem s Gunnokem.";
};

func int DIA_Orc_8215_Kan_RoundTwoDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (ReadyForRoundThree == FALSE) && ((ArenaBattle_02_Won == TRUE) || (ArenaBattle_02_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundTwoDone_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundTwoDone_01_01");	//Bojoval jsem s Gunnokem.

	if(ArenaBattle_02_Won == TRUE)
	{
		B_GivePlayerXP(400);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwoDone_01_02");	//Ur Kahn vidět boj... (s úctou) Muž je dobrý bojovat a zaslouží si odměnu!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwoDone_01_03");	//Tady vzít tyto magické lektvary. Pomáhají obnovit sílu člověka.
		B_GiveInvItems(self,other,ItPo_Health_03,2);
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Reputace mezi skřety + 5");
		};
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundTwoDone_01_04");	//Děkuju.
		ArenaFightNow = FALSE;
		ReadyForRoundThree = TRUE;
	}
	else if(ArenaBattle_02_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_05");	//Ur-Kan vidět bitvu... (zklamaný) Člověk není dostatečně silný na to, aby porazil Gunnoka.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_06");	//To je první krok přípravy a prokázání odvahy.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_07");	//Přijít znovu až připraven bojovat s Gunnok.
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_08");	//Nezapomenout na magická ruda pro Ur-Kan!
		AI_Output(self,other,"DIA_Orc_8215_Kan_Kan_RoundTwoDone_01_09");	//Ur-Kan nedovolit bojovat pokud nepřinést!
		ArenaBattle_02_Won = FALSE;
		ArenaBattle_02_Lost = FALSE;
		ArenaBattle_02 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(STRF_8148_Gunnok,"Start");
};

instance DIA_Orc_8215_Kan_RoundTwo_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundTwo_Again_condition;
	information = DIA_Orc_8215_Kan_RoundTwo_Again_info;
	permanent = TRUE;
	description = "Chci znovu bojovat s Gunnokem. (cena: 10 kusů magické rudy)";
};

func int DIA_Orc_8215_Kan_RoundTwo_Again_condition()
{
	if((ReadyForRoundTwo == TRUE) && (ArenaBattle_02 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundTwo_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8148_Gunnok);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundTwo_Again_01_01");	//Chci znovu bojovat s Gunnokem.

	if(Npc_HasItems(other,ItMi_Nugget) >= 10)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,10);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_Again_01_02");	//Dobře. Člověk se pokouší znovu porazit Gunnoka!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_Again_01_03");	//Jdi do arény! On tam bude čekat...
		AI_StopProcessInfos(self);
		ArenaBattle_02 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_Again_01_04");	//Člověk na to nemá dost rudy!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundTwo_Again_01_05");	//Ur-Kan nedovoluje muži bojovat v aréně.
	};
};

//-----------------------------Turuk---------------------------------------------------------

instance DIA_Orc_8215_Kan_RoundThree(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundThree_condition;
	information = DIA_Orc_8215_Kan_RoundThree_info;
	permanent = FALSE;
	description = "Kdo je tvůj další válečník?";
};

func int DIA_Orc_8215_Kan_RoundThree_condition()
{
	if((ReadyForRoundThree == TRUE) && (ArenaBattle_03 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundThree_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8149_Turuk);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundThree_01_01");	//Kdo je tvůj další válečník?
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_01_02");	//Turuk. Být velmi silný válečník!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_01_03");	//On velmi silný se sekyrou a porazit mnoho silných válečníků.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_01_04");	//Muž vstoupí do arény! Turuk už čekat...
	B_LogEntry(TOPIC_OrcArena,"Teď musím bojovat se skřetem jménem Turuk.");
	AI_StopProcessInfos(self);
	ArenaBattle_03 = TRUE;
	ArenaFightNow = TRUE;
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundThreeDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundThreeDone_condition;
	information = DIA_Orc_8215_Kan_RoundThreeDone_info;
	permanent = TRUE;
	description = "Bojoval jsem Turukem.";
};

func int DIA_Orc_8215_Kan_RoundThreeDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (ReadyForRoundFour == FALSE) && ((ArenaBattle_03_Won == TRUE) || (ArenaBattle_03_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundThreeDone_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8149_Turuk);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundThreeDone_01_01");	//Bojoval jsem s Turukem.

	if(ArenaBattle_03_Won == TRUE)
	{
		B_GivePlayerXP(400);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_02");	//Turuk je velmi zkušený válečník, ale člověk ho porazil!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_03");	//Za to Ur-Kan dá jako odměnu černé perly.
		B_GiveInvItems(self,other,ItMi_DarkPearl,1);
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Reputace mezi skřety + 5");
		};
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundThreeDone_01_04");	//To není špatné.
		ArenaFightNow = FALSE;
		ReadyForRoundFour = TRUE;
	}
	else if(ArenaBattle_03_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_05");	//Turuk je velmi zkušený válečník! Člověk ho nemohl porazit.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_06");	//Člověk musí být rychlejší a silnější, aby porazit Turuk.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThreeDone_01_07");	//Pokud chcete znovu bojovat, řekni Ur-Kan.
		ArenaBattle_03_Won = FALSE;
		ArenaBattle_03_Lost = FALSE;
		ArenaBattle_03 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Start");
};

instance DIA_Orc_8215_Kan_RoundThree_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundThree_Again_condition;
	information = DIA_Orc_8215_Kan_RoundThree_Again_info;
	permanent = TRUE;
	description = "Chci s Turukem znovu bojovat. (cena: 20 kusů magické rudy)";
};

func int DIA_Orc_8215_Kan_RoundThree_Again_condition()
{
	if((ReadyForRoundThree == TRUE) && (ArenaBattle_03 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundThree_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8149_Turuk);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundThree_Again_01_01");	//Chci s Turukem znovu bojovat.

	if(Npc_HasItems(other,ItMi_Nugget) >= 20)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,20);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_Again_01_02");	//Člověk chce zavolat mocný Turuk?
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_Again_01_03");	//Ur-Kan nebude proti! Jděte do arény a bojujte.
		AI_StopProcessInfos(self);
		ArenaBattle_03 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		Npc_ClearAIQueue(ArenaFighter);
		AI_RemoveWeapon(ArenaFighter);
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_Again_01_04");	//Člověk na to nemá dost rudy!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundThree_Again_01_05");	//Ur-Kan nedovoluje muži bojovat v aréně.
	};
};

//--------------------------------Khart--------------------------------------------------------------------------------------

instance DIA_Orc_8215_Kan_RoundFour(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFour_condition;
	information = DIA_Orc_8215_Kan_RoundFour_info;
	permanent = FALSE;
	description = "Máš ještě silnějšího válečníka?";
};

func int DIA_Orc_8215_Kan_RoundFour_condition()
{
	if((ReadyForRoundFour == TRUE) && (ArenaBattle_04 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFour_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8146_Hart);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFour_01_01");	//Máš ještě silnějšího válečníka?
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_01_02");	//Samozřejmě. Další boj bude s mužem jménem Hart!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_01_03");	//Zasloužil si právo bojovat zde a porazit mnoho mocných bratrů Ur-Kana.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_01_04");	//Jděte do arény teď! Ur-Kan přeje člověku štěstí...
	B_LogEntry(TOPIC_OrcArena,"Je čas bojovat s Hartem, jediným člověkem, který bojuje ve skřetí aréně.");
	AI_StopProcessInfos(self);
	ArenaBattle_04 = TRUE;
	ArenaFightNow = TRUE;
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundFourDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFourDone_condition;
	information = DIA_Orc_8215_Kan_RoundFourDone_info;
	permanent = TRUE;
	description = "Bojoval jsem s Hartem.";
};

func int DIA_Orc_8215_Kan_RoundFourDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (ReadyForRoundFive == FALSE) && ((ArenaBattle_04_Won == TRUE) || (ArenaBattle_04_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFourDone_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8146_Hart);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFourDone_01_01");	//Bojoval jsem s Hartem.

	if(ArenaBattle_04_Won == TRUE)
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_02");	//A tys ho porazil! Ačkoliv silný a rychlý soupeř.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_03");	//Jako odměnu získáte nyní kůži černého trol.
		B_GiveInvItems(self,other,ItAt_TrollBlackFur,1);
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Reputace mezi skřety + 5");
		};

		ArenaFightNow = FALSE;
		ReadyForRoundFive = TRUE;
	}
	else if(ArenaBattle_04_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_04");	//Člověk nemohl porazit svého bratra...
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_05");	//Ten člověk je pro něj příliš silný a hbitý.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_06");	//Nyní naučit se lépe bojovat.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFourDone_01_07");	//A pak znovu do arény.
		ArenaBattle_04_Won = FALSE;
		ArenaBattle_04_Lost = FALSE;
		ArenaBattle_04 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ClearAIQueue(ArenaFighter);
	AI_RemoveWeapon(ArenaFighter);
	B_StartOtherRoutine(ArenaFighter,"Start");
	AI_Teleport(STRF_8146_Hart,"ORC_CITY_HART");
};

instance DIA_Orc_8215_Kan_RoundFour_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFour_Again_condition;
	information = DIA_Orc_8215_Kan_RoundFour_Again_info;
	permanent = TRUE;
	description = "Chci s Hartem znovu bojovat. (cena: 30 kusů magické rudy)";
};

func int DIA_Orc_8215_Kan_RoundFour_Again_condition()
{
	if((ReadyForRoundFour == TRUE) && (ArenaBattle_04 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFour_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8146_Hart);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFour_Again_01_01");	//Chci s Hartem znovu bojovat.

	if(Npc_HasItems(other,ItMi_Nugget) >= 30)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,30);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_Again_01_02");	//Člověk má rudu, to známená souboj!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_Again_01_03");	//Nyní jít do arény a porazit svého nepřítele.
		AI_StopProcessInfos(self);
		ArenaBattle_04 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		Npc_ClearAIQueue(ArenaFighter);
		AI_RemoveWeapon(ArenaFighter);
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_Again_01_04");	//Člověk na to nemá dost rudy!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFour_Again_01_05");	//Ur-Kan nedovoluje muži bojovat v aréně.
	};
};

//--------------------------------Ur Trok----------------------------------------

instance DIA_Orc_8215_Kan_RoundFive(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFive_condition;
	information = DIA_Orc_8215_Kan_RoundFive_info;
	permanent = FALSE;
	description = "Potřebuju dalšího soupeře.";
};

func int DIA_Orc_8215_Kan_RoundFive_condition()
{
	if((ReadyForRoundFive == TRUE) && (ArenaBattle_05 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFive_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8150_UrTrok);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFive_01_01");	//Potřebuju dalšího soupeře.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_01_02");	//Člověk dostane... (s respektem) Ur-Trok být jedním z nesilnějších válečník Ur-Kan!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_01_03");	//Je možné, že porazí muž jedním máchnutím zbraně.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_01_04");	//Nyní jděte do arény! Už na tebe čeká...
	B_LogEntry(TOPIC_OrcArena,"Ur-Trok je můj další soupeř.");
	AI_StopProcessInfos(self);
	ArenaBattle_05 = TRUE;
	ArenaFightNow = TRUE;
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundFiveDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFiveDone_condition;
	information = DIA_Orc_8215_Kan_RoundFiveDone_info;
	permanent = TRUE;
	description = "Bojoval jsem s Ur-Trokem.";
};

func int DIA_Orc_8215_Kan_RoundFiveDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (ReadyForRoundSix == FALSE) && ((ArenaBattle_05_Won == TRUE) || (ArenaBattle_05_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFiveDone_info()
{
	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFiveDone_01_01");	//Bojoval jsem s Ur-Trokem.

	if(ArenaBattle_05_Won == TRUE)
	{
		B_GivePlayerXP(600);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_02");	//Ur Kan obdivovat sílu člověka! Je velmi obtížné porazit Ur-Trok.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_03");	//Proto dává muži velmi cennou odměnu. Lektvar s síla!
		B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFiveDone_01_04");	//To potěsí.
		ArenaFightNow = FALSE;
		ReadyForRoundSix = TRUE;
		ORCRESPECT = ORCRESPECT + 5;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Reputace mezi skřety + 5");
		};
	}
	else if(ArenaBattle_05_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_05");	//Ur-Kan varoval, že Ur-Trok je velmi silný.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_06");	//Člověk to zjistit sám.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_07");	//Musíš být mnohem silnější, aby porazit Ur-Trok!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFiveDone_01_08");	//Muž jít trénovat! Až připraven říct Ur-Kan.
		ArenaBattle_05_Won = FALSE;
		ArenaBattle_05_Lost = FALSE;
		ArenaBattle_05 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(STRF_8150_UrTrok,"Start");
};

instance DIA_Orc_8215_Kan_RoundFive_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundFive_Again_condition;
	information = DIA_Orc_8215_Kan_RoundFive_Again_info;
	permanent = TRUE;
	description = "Chci znovu bojovat s Ur-Trokem. (cena: 60 kusů magické rudy)";
};

func int DIA_Orc_8215_Kan_RoundFive_Again_condition()
{
	if((ReadyForRoundFive == TRUE) && (ArenaBattle_05 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundFive_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8150_UrTrok);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundFive_Again_01_01");	//Chci znovu bojovat s Ur-Trokem.

	if(Npc_HasItems(other,ItMi_Nugget) >= 60)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,60);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_Again_01_02");	//Pokud je člověk jistý svou silou, pak Ur-Kan zavelí k boji.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_Again_01_03");	//Jdi člověče! Ur-Trok ho čeká.
		AI_StopProcessInfos(self);
		ArenaBattle_05 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_Again_01_04");	//Člověk na to nemá dost rudy!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundFive_Again_01_05");	//Ur-Kan nedovoluje muži bojovat v aréně.
	};
};

//----------------------------------Umrak----------------------------------------------

instance DIA_Orc_8215_Kan_RoundSix(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundSix_condition;
	information = DIA_Orc_8215_Kan_RoundSix_info;
	permanent = FALSE;
	description = "Kdo ještě zbývá?";
};

func int DIA_Orc_8215_Kan_RoundSix_condition()
{
	if((ReadyForRoundSix == TRUE) && (ArenaBattle_06 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundSix_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8151_Umrak);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSix_01_01");	//Kdo ještě zbývá?
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_01_02");	//Umrak zůstal proti člověk.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_01_03");	//To je nejsilnější válečník Ur-Kan! Ani síle Ur-Thrall nepodlehl.
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_01_04");	//Člověk nejprve dobře myslí. Chce skutečně bojovat s Umrakem?
	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSix_01_05");	//Sem s ním!
	AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_01_06");	//(vážně) Dobře. Jak chce! Jděte do arény, bojuj s Umrak.
	B_LogEntry(TOPIC_OrcArena,"Můj poslední boj v aréně. Umrak proti mně. Podle Ur-Kana je to velmi mocný soupeř. Nepodlehl dokonce ani velkému náčelníkovi skřetů.");
	AI_StopProcessInfos(self);
	ArenaBattle_06 = TRUE;
	ArenaFightNow = TRUE;
	B_StartOtherRoutine(ArenaFighter,"Arena");
};

instance DIA_Orc_8215_Kan_RoundSixDone(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundSixDone_condition;
	information = DIA_Orc_8215_Kan_RoundSixDone_info;
	permanent = TRUE;
	description = "Bojoval jsem s Umrakem.";
};

func int DIA_Orc_8215_Kan_RoundSixDone_condition()
{
	if((ULUMULUISEQUIP == TRUE) && (HeroIsMorDar == FALSE) && ((ArenaBattle_06_Won == TRUE) || (ArenaBattle_06_Lost == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundSixDone_info()
{

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_01");	//Bojoval jsem s Umrakem.

	if(ArenaBattle_06_Won == TRUE)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_02");	//Ur-Kan nevěří svým očím! Muž, který se porazí Umrak!
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_03");	//Ano, nebylo to snadné!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_04");	//Pak se nyní člověk stane Mor Dar! Nejlepší válečník je velká skřetí aréna.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_05");	//Silnější než on je už nikdo. Hodně síly, hodně čestnosti a úcty.
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_06");	//A kde je moje odměna?
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_07");	//Tady, člověk který obdrží Grah Shah! Nejcennější odměna, kterou má.
		B_GiveInvItems(self,other,ItMi_GrahShar,1);
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_08");	//Zajímavé. A co to je?
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_09");	//Člověk, obléknout a podívat se ! Ur-Kan si myslí, že člověk to pochopí.
		ORCRESPECT = ORCRESPECT + 45;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Reputace mezi skřety + 45");
		};

		ArenaFightNow = FALSE;
		HeroIsMorDar = TRUE;
		MIS_OrcArena = LOG_Success;
		Log_SetTopicStatus(TOPIC_OrcArena,LOG_Success);
		B_LogEntry(TOPIC_OrcArena,"Teď jsem Mor Dar - šampión velké skřetí arény!");
	}
	else if(ArenaBattle_06_Lost == TRUE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_11");	//Ur-Kan není překvapen, že člověk prohrát s Umrak.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_12");	//Měl štěstí, že ho Umrak nezabil!
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSixDone_01_13");	//Ano, ten skřet je tuhý soupeř.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSixDone_01_14");	//Protože je skoro nejlepší, skoro Mor Dar!
		ArenaBattle_06_Won = FALSE;
		ArenaBattle_06_Lost = FALSE;
		ArenaBattle_06 = FALSE;
		ArenaFightNow = FALSE;
		LostLastOrcFight = TRUE;
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(STRF_8151_Umrak,"Start");
};

instance DIA_Orc_8215_Kan_RoundSix_Again(C_Info)
{
	npc = Orc_8215_Kan;
	condition = DIA_Orc_8215_Kan_RoundSix_Again_condition;
	information = DIA_Orc_8215_Kan_RoundSix_Again_info;
	permanent = TRUE;
	description = "Chci znovu bojovat s Umrakem. (cena: 100 kusů magické rudy)";
};

func int DIA_Orc_8215_Kan_RoundSix_Again_condition()
{
	if((ReadyForRoundSix == TRUE) && (ArenaBattle_06 == FALSE) && (LostLastOrcFight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8215_Kan_RoundSix_Again_info()
{
	var C_Npc ArenaFighter;

	ArenaFighter = Hlp_GetNpc(STRF_8151_Umrak);

	AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSix_Again_01_01");	//Chci znovu bojovat s Umrakem.

	if(Npc_HasItems(other,ItMi_Nugget) >= 100)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_Again_01_02");	//Člověk si jistý, že to chce?
		AI_Output(other,self,"DIA_Orc_8215_Kan_RoundSix_Again_01_03");	//Musím ho porazit.
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_Again_01_04");	//Pak jdi! Velká bitva brzy začne...
		AI_StopProcessInfos(self);
		ArenaBattle_06 = TRUE;
		ArenaFightNow = TRUE;
		LostLastOrcFight = FALSE;
		B_StartOtherRoutine(ArenaFighter,"Arena");
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_Again_01_05");	//Člověk na to nemá dost rudy!
		AI_Output(self,other,"DIA_Orc_8215_Kan_RoundSix_Again_01_06");	//Ur-Kan nedovoluje muži bojovat v aréně.
	};
};

//--------------------------------------------------Ur-Tak-------------------------------------

instance DIA_STRF_8152_UrTak_EXIT(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_exit_condition;
	information = DIA_STRF_8152_UrTak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8152_UrTak_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8152_UrTak_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8152_UrTak_Hello(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_Hello_condition;
	information = DIA_STRF_8152_UrTak_Hello_info;
	permanent = FALSE;
	description = "Trénuješ?";
};

func int DIA_STRF_8152_UrTak_Hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8152_UrTak_Hello_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Hello_01_01");	//Trénuješ?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Hello_01_02");	//Urtak chce být silným válečníkem... (vážně) Chci být jako bratr Umrak!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Hello_01_03");	//Proto nemluvit s Urtak! Jinak velmi rozzloben a zmlátit člověk.
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Hello_01_04");	//Jsi děsivý.
};


instance DIA_STRF_8152_UrTak_Umrak(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_Umrak_condition;
	information = DIA_STRF_8152_UrTak_Umrak_info;
	permanent = FALSE;
	description = "Umrak je tvůj bratr?";
};

func int DIA_STRF_8152_UrTak_Umrak_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8152_UrTak_Hello) == TRUE) && (KnowAboutUmrak == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_Umrak_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Umrak_01_01");	//Umrak je tvůj bratr?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Umrak_01_02");	//(hrdě) Přesně. Být velmi silným válečníkem! Bojuje ve velká aréna bratří.
};

instance DIA_STRF_8152_UrTak_Teach(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_Teach_condition;
	information = DIA_STRF_8152_UrTak_Teach_info;
	permanent = FALSE;
	description = "Ukážeš mi jak to děláš?";
};

func int DIA_STRF_8152_UrTak_Teach_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8152_UrTak_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_Teach_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Teach_01_01");	//Ukážeš mi jak to děláš?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Teach_01_02");	//Proč Urtak dělat? Urtak myslí, že člověk slabý.
	AI_Output(other,self,"DIA_STRF_8152_UrTak_Teach_01_03");	//Chceš se přesvědčit?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Teach_01_04");	//Ar-Dagar zákazát boj zde! Když neposlechnout bratři zabít člověk i Urtak.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Teach_01_05");	//Pokud chce dokázat, že je silný, pak jdi a porazit Umrak!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_Teach_01_06");	//Pak ho Urtak naučí bojovat s zbraněmi jeho bratra.
	MIS_UrTakTeach = LOG_Running;
	Log_CreateTopic(TOPIC_UrTakTeach,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_UrTakTeach,LOG_Running);
	B_LogEntry(TOPIC_UrTakTeach,"Urtak mi ukáže, jak bojovat se skřetími zbraněmi. Ale jenom když dokážu porazit jeho bratra Umraka.");
};


instance DIA_STRF_8152_UrTak_TeachDone(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_TeachDone_condition;
	information = DIA_STRF_8152_UrTak_TeachDone_info;
	permanent = FALSE;
	description = "Porazil jsem tvého bratra v aréně!";
};

func int DIA_STRF_8152_UrTak_TeachDone_condition()
{
	if((MIS_UrTakTeach == LOG_Running) && (HeroIsMorDar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_TeachDone_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_TeachDone_01_01");	//Porazil jsem tvého bratra v aréně!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_TeachDone_01_02");	//Muž překoná Umrak? (s úctou) Pak bude velkým válečníkem!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_TeachDone_01_03");	//Pro Urtak je velkou ctí ho naučit bojovat.
	AI_PlayAni(self,"T_GREETGRD");
	MIS_UrTakTeach = LOG_Success;
	Log_SetTopicStatus(TOPIC_UrTakTeach,LOG_Success);
	B_LogEntry(TOPIC_UrTakTeach,"Urtak mě naučí zacházet se zbraněmi skřetů.");
};

instance DIA_STRF_8152_UrTak_OFStyle(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_OFStyle_condition;
	information = DIA_STRF_8152_UrTak_OFStyle_info;
	permanent = TRUE;
	description = "Nauč mě ovládat skřetí zbraně. (VB: 10)";
};

func int DIA_STRF_8152_UrTak_OFStyle_condition()
{
	if((MIS_UrTakTeach == LOG_Success) && (OFStyle == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_OFStyle_info()
{
	var int kosten;

	kosten = 10;

	AI_Output(other,self,"DIA_STRF_8152_UrTak_OFStyle_01_00");	//Nauč mě ovládat skřetí zbraně.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_01");	//Člověk nemá k tomu dostatek zkušeností! Urtak ho nemůže učit...
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= kosten)
	{
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_02");	//Tak pozorně naslouchej Urtak. Bude mluvit.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_03");	//Zbraně bratří jsou pro člověka velmi těžké! Je těžké držet, je těžké bojovat.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_04");	//Rychle se unaví, ztratí sílu a ztratí bitvu.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_05");	//Urtak ukázat, jak správně držet zbraň, jak správně zasáhnout.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_06");	//Muž musí použít tíhu zbraně, ne svou vlastní sílu.
		AI_Output(self,other,"DIA_STRF_8152_UrTak_OFStyle_01_07");	//Pak může správně použít zbraně bratrů!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Naučeno: Boj se skřetími zbraněmi");
		OFStyle = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_STRF_8152_UrTak_WhatDo(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_WhatDo_condition;
	information = DIA_STRF_8152_UrTak_WhatDo_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};

func int DIA_STRF_8152_UrTak_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8152_UrTak_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_WhatDo_info()
{
	AI_Output(other,self,"DIA_STRF_8152_UrTak_WhatDo_01_01");	//Co tady děláš?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_02");	//Urtak hlídá vstup do hlubokého dolu.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_03");	//Pokud nepřítel přijde, pak s ním Urtak bojuje!
	AI_Output(other,self,"DIA_STRF_8152_UrTak_WhatDo_01_04");	//Jaký nepřítel?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_05");	//Urtak to neví, ale jiní bratři říkají, že je velmi silný!
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_06");	//Urtak rád podívat ale Ar-Dagar nedat povolení.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_WhatDo_01_07");	//Urtak je velmi smutný. Urtak chce bojovat s nepřítelem!
	AI_Output(other,self,"DIA_STRF_8152_UrTak_WhatDo_01_08");	//Nebuď smutný! Možná ta příležitost teprve přijde.
	MIS_UrTakWannaFight = LOG_Running;
	Log_CreateTopic(TOPIC_UrTakWannaFight,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_UrTakWannaFight,LOG_Running);
	B_LogEntry(TOPIC_UrTakWannaFight,"Urtak chce bojovat s nepřítelem, který se skrývá v hlubokém dolu. Ale Ar-Dagar zakázal všem vstup do dolu a proto je Urtak velmi smutný. Jestli tam jednou půjdu nesmím na Urtaka zapomenout.");
};

instance DIA_STRF_8152_UrTak_GoWithMe(C_Info)
{
	npc = STRF_8152_UrTak;
	condition = DIA_STRF_8152_UrTak_GoWithMe_condition;
	information = DIA_STRF_8152_UrTak_GoWithMe_info;
	permanent = FALSE;
	description = "Půjdeš se mnou do hlubokého dolu?";
};

func int DIA_STRF_8152_UrTak_GoWithMe_condition()
{
	if((MIS_LowLevel == LOG_Running) && (MIS_UrTakWannaFight == LOG_Running) && (GoFightDeepMine == TRUE) && (DeepMineArrived == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8152_UrTak_GoWithMe_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8152_UrTak_GoWithMe_01_01");	//Půjdeš se mnou do hlubokého dolu?
	AI_Output(self,other,"DIA_STRF_8152_UrTak_GoWithMe_01_02");	//Člověk s Urtak žertovat? Nezakázal Ar-Dagar vstup do dolu?
	AI_Output(other,self,"DIA_STRF_8152_UrTak_GoWithMe_01_03");	//Ar-Dagar mi dal svůj souhlas.
	AI_Output(other,self,"DIA_STRF_8152_UrTak_GoWithMe_01_04");	//Takže teď jdu dolů s několika válečníky, abychom nepřítele porazili.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_GoWithMe_01_05");	//Urtak velmi šťastný, že člověk nezapomenout! Šel spolu s ním, aby bojoval v hlubokém dolu.
	AI_Output(other,self,"DIA_STRF_8152_UrTak_GoWithMe_01_06");	//Pak jdi k výtahu. Sejdeme se tam.
	AI_Output(self,other,"DIA_STRF_8152_UrTak_GoWithMe_01_07");	//Dobře! Urtak je na cestě.

	if(MIS_UrTakWannaFight != LOG_Success)
	{
		MIS_UrTakWannaFight = LOG_Success;
		Log_SetTopicStatus(TOPIC_UrTakWannaFight,LOG_Success);
		B_LogEntry(TOPIC_UrTakWannaFight,"Vzal jsem Urtaka sebou do hlubokého dolu.");
	};

	AI_StopProcessInfos(self);

	if((OrcMineFightReady == TRUE) && (ORCMINEKILL_01 == FALSE))
	{
		Npc_ExchangeRoutine(STRF_8152_UrTak,"Elevator");
	}
	else
	{
		Npc_ExchangeRoutine(self,"NearFight");
	};
};


//--------------------------------------------------Orki UrTralla-------------------------------------

instance DIA_STRF_8153_Fighter_EXIT(C_Info)
{
	npc = STRF_2153_Fighter;
	condition = DIA_STRF_8153_Fighter_exit_condition;
	information = DIA_STRF_8153_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8153_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8153_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8153_Fighter_PreHello(C_Info)
{
	npc = STRF_2153_Fighter;
	condition = DIA_STRF_8153_Fighter_PreHello_condition;
	information = DIA_STRF_8153_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8153_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8153_Fighter_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Orak Shaka!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8154_Fighter_EXIT(C_Info)
{
	npc = STRF_2154_Fighter;
	condition = DIA_STRF_8154_Fighter_exit_condition;
	information = DIA_STRF_8154_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8154_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8154_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8154_Fighter_PreHello(C_Info)
{
	npc = STRF_2154_Fighter;
	condition = DIA_STRF_8154_Fighter_PreHello_condition;
	information = DIA_STRF_8154_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8154_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8154_Fighter_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Orak Shaka!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8155_Fighter_EXIT(C_Info)
{
	npc = STRF_2155_Fighter;
	condition = DIA_STRF_8155_Fighter_exit_condition;
	information = DIA_STRF_8155_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8155_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8155_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8155_Fighter_PreHello(C_Info)
{
	npc = STRF_2155_Fighter;
	condition = DIA_STRF_8155_Fighter_PreHello_condition;
	information = DIA_STRF_8155_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8155_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8155_Fighter_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Orak Shaka!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8156_Fighter_EXIT(C_Info)
{
	npc = STRF_2156_Fighter;
	condition = DIA_STRF_8156_Fighter_exit_condition;
	information = DIA_STRF_8156_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8156_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8156_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8156_Fighter_PreHello(C_Info)
{
	npc = STRF_2156_Fighter;
	condition = DIA_STRF_8156_Fighter_PreHello_condition;
	information = DIA_STRF_8156_Fighter_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8156_Fighter_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8156_Fighter_PreHello_info()
{
	var int random;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		random = Hlp_Random(8);

		if(random == 0)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_01");
			Snd_Play3d(self,"ORC_Happy");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_02");
			Snd_Play3d(self,"ORC_Die_A1");
		}	
		else if(random == 2)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_03");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_04");
			Snd_Play3d(self,"ORC_Die_A1");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_05");
			Snd_Play3d(self,"ORC_Die_A2");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_06");
			Snd_Play3d(self,"ORC_Angry");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_07");
			Snd_Play3d(self,"ORC_Frightened");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"T_DIALOGGESTURE_08");
			Snd_Play3d(self,"ORC_Angry");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Orak Shaka!
	};

	AI_StopProcessInfos(self);
};

instance DIA_STRF_8157_Fighter_EXIT(C_Info)
{
	npc = STRF_2157_Fighter;
	condition = DIA_STRF_8157_Fighter_exit_condition;
	information = DIA_STRF_8157_Fighter_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_STRF_8157_Fighter_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8157_Fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8157_Fighter_PreHello(C_Info)
{
	npc = STRF_2157_Fighter;
	condition = DIA_STRF_8157_Fighter_PreHello_condition;
	information = DIA_STRF_8157_Fighter_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8157_Fighter_PreHello_condition()
{
	return TRUE;
};

func void DIA_STRF_8157_Fighter_PreHello_info()
{
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other,"DIA_Orc_8214_Dagrag_PreHello_01_03");	//Orak Shaka!
	AI_Output(self,other,"DIA_STRF_8157_Fighter_PreHello_01_01");	//Velký vůdce poslat do bitva v hlubokém dole!
	AI_Output(other,self,"DIA_STRF_8157_Fighter_PreHello_01_02");	//Není vás moc.
	AI_Output(self,other,"DIA_STRF_8157_Fighter_PreHello_01_03");	//Všichni válečníci zde velmi silní! Mnohokrát bojovat s nepřítel a porazit ho.
	AI_Output(other,self,"DIA_STRF_8157_Fighter_PreHello_01_04");	//Doufám, že máš pravdu. Snad nám pomohou.
	AI_Output(self,other,"DIA_STRF_8157_Fighter_PreHello_01_05");	//Čůlověk, říct kdy začít! Počkáme na jeho signál...
};

instance DIA_STRF_8157_Fighter_Go(C_Info)
{
	npc = STRF_2157_Fighter;
	condition = DIA_STRF_8157_Fighter_Go_condition;
	information = DIA_STRF_8157_Fighter_Go_info;
	permanent = FALSE;
	description = "Jdi na plošinu! Začínáme.";
};

func int DIA_STRF_8157_Fighter_Go_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8157_Fighter_PreHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8157_Fighter_Go_info()
{
	AI_Output(other,self,"DIA_STRF_8157_Fighter_Go_01_01");	//Jdi na plošinu! Začínáme.
	AI_Output(self,other,"DIA_STRF_8157_Fighter_Go_01_02");	//Dobře! Člověk vzít klíč pro spuštění plošiny.
	B_GiveInvItems(self,other,ItKe_OrcMine_Elevator,1);
	AI_Output(self,other,"DIA_STRF_8157_Fighter_Go_01_03");	//Orak Shaka!
	OrcMineFightReady = TRUE;
	AI_StopProcessInfos(self);
	B_SetAttitude(STRF_2153_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2154_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2155_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2156_Fighter,ATT_FRIENDLY);
	B_SetAttitude(STRF_2157_Fighter,ATT_FRIENDLY);
	Npc_ExchangeRoutine(STRF_2153_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2154_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2155_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2156_Fighter,"Elevator");
	Npc_ExchangeRoutine(STRF_2157_Fighter,"Elevator");

	if((MIS_UrTakWannaFight == LOG_Success) && (Npc_IsDead(STRF_8152_UrTak) == FALSE))
	{
		Npc_ExchangeRoutine(STRF_8152_UrTak,"Elevator");
		AI_Teleport(STRF_8152_UrTak,"ORCMINE_FIGHTER_URTAK");
		B_SetAttitude(STRF_8152_UrTak,ATT_FRIENDLY);
	};
};

//------------------------------------------------------kuznets orkov--------------------------

instance DIA_Orc_8571_HashTor_EXIT(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_exit_condition;
	information = dia_Orc_8571_HashTor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_Orc_8571_HashTor_exit_condition()
{
	return TRUE;
};

func void dia_Orc_8571_HashTor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8571_HashTor_PreHello(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = DIA_Orc_8571_HashTor_PreHello_condition;
	information = DIA_Orc_8571_HashTor_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8571_HashTor_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8571_HashTor_PreHello_info()
{
	AI_Output(self,other,"DIA_Orc_8571_HashTor_PreHello_01_01");	//KARAT DAR POR NURAK KAR?
	AI_Output(other,self,"DIA_Orc_8571_HashTor_PreHello_01_02");	//Hmmm...
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8571_HashTor_UpHello(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = DIA_Orc_8571_HashTor_UpHello_condition;
	information = DIA_Orc_8571_HashTor_UpHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8571_HashTor_UpHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8571_HashTor_UpHello_info()
{
	AI_Output(self,other,"DIA_Orc_8571_HashTor_UpHello_01_02");	//Co potřebuje člověk od Hash Tor?
};

instance DIA_Orc_8571_HashTor_HELLO(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_hello_condition;
	information = dia_Orc_8571_HashTor_hello_info;
	permanent = FALSE;
	description = "Ty jsi kovář?";
};

func int dia_Orc_8571_HashTor_hello_condition()
{
	if(KnowAboutHashTor == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_01");	//Ty jsi kovář?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_02");	//(pokyvuje) DAG TAKAR. Hash Tor je mistr rudy! Jak říkají lidé... kovář.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_03");	//Ur-Han řekl, že děláš zbraně z magické rudy. Je to tak?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_04");	//Ano, Hash Tor dělá! Ale jen tehdy, když mu bratři přinesou hodně magické rudy.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_05");	//Zbraně skřetů jsou velmi velké a těžké! Potřebujete hodně rudy k tomu, abyste ji vylepšili.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_06");	//A můžeš mě to naučit?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_07");	//Zbraně skřetů nepotřebují člověka... Nemusí je ani zvednout!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_08");	//Pokud se člověk naučí ovládat zbraně skřetů, pak Hash Tor ukáže, jak to udělat.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_09");	//A kdo mě to naučí?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Hello_01_10");	//Hash Tor to nevědět! Člověk se zeptat ostatních bratrů.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Hello_01_11");	//Dobře, rozumím.
	MIS_HashTorRule = LOG_Running;
	Log_CreateTopic(TOPIC_HashTorRule,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HashTorRule,LOG_Running);
	B_LogEntry(TOPIC_HashTorRule,"Hash Tor mě naučí kovat magické zbraně, ale pouze když budu vědět jak je ovládat.");	
};

instance DIA_Orc_8571_HashTor_Rule(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Rule_condition;
	information = dia_Orc_8571_HashTor_Rule_info;
	permanent = FALSE;
	description = "Vím, jak ovládat skřetí zbraně.";
};

func int dia_Orc_8571_HashTor_Rule_condition()
{
	if((MIS_HashTorRule == LOG_Running) && (OFStyle == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Rule_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Rule_01_01");	//Vím, jak ovládat skřetí zbraně.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Rule_01_02");	//Urak Shaka Morra... (přikyvuje) Hash Tor to vidět! Člověk je silný, když se mohl naučit.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Rule_01_03");	//Takže teď mid ukážeš jak ukovat zbraně z magické rudy?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Rule_01_04");	//Hash Tor dal slovo. Hash Tor držet slovo!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Rule_01_05");	//Hash Tor učit člověk, pokud má člověk mnoho rudy a zkušeností.
	MIS_HashTorRule = LOG_Success;
	Log_SetTopicStatus(TOPIC_HashTorRule,LOG_Success);
	B_LogEntry(TOPIC_HashTorRule,"Teď když ovládám skřetí zbraně mě Hash Tor naučí, jak ukovat magické skřetí meče a sekery. Jako platbu bude chtít magickou rudu.");	
	Log_CreateTopic(TOPIC_ORCWEAPON,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_ORCWEAPON,"Kování skřetích zbraní...");
};

var int HashTorTeachAll;

instance DIA_Orc_8571_HashTor_Teach(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Teach_condition;
	information = dia_Orc_8571_HashTor_Teach_info;
	permanent = TRUE;
	description = "Nauč mě kovat skřetí magické zbraně.";
};

func int dia_Orc_8571_HashTor_Teach_condition()
{
	if((MIS_HashTorRule == LOG_Success) && (HashTorTeachAll == FALSE))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Teach_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Teach_01_01");	//Nauč mě kovat skřetí magické zbraně.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Teach_01_02");	//Co přesně chce naučit člověk?
	Info_ClearChoices(DIA_Orc_8571_HashTor_Teach);
	Info_AddChoice(DIA_Orc_8571_HashTor_Teach,Dialog_Back,DIA_Orc_8571_HashTor_Teach_Back);

	if(ORCWEAPON_LINE_STR_01 == FALSE)
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Rudná skřetí sekyra (cena: 125 kusů magické rudy)",DIA_Orc_8571_HashTor_Teach_STR_01);
	};
	if((ORCWEAPON_LINE_STR_01 == TRUE) && (ORCWEAPON_LINE_STR_02 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Rudný meč válečníka (cena: 250 kusů magické rudy)",DIA_Orc_8571_HashTor_Teach_STR_02);
	};
	if((ORCWEAPON_LINE_STR_02 == TRUE) && (ORCWEAPON_LINE_STR_03 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Rudná válečná sekyra (cena: 500 kusů magické rudy)",DIA_Orc_8571_HashTor_Teach_STR_03);
	};
	if((ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_01 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Rudný skřetí kalač (cena: 125 kusů magické rudy)",DIA_Orc_8571_HashTor_Teach_HP_01);
	};
	if((ORCWEAPON_LINE_HP_01 == TRUE) && (ORCWEAPON_LINE_HP_02 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Rudný meč stařešiny (cena: 250 kusů magické rudy)",DIA_Orc_8571_HashTor_Teach_HP_02);
	};
	if((ORCWEAPON_LINE_HP_02 == TRUE) && (ORCWEAPON_LINE_HP_03 == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Rudná útočná sekyra (cena: 500 kusů magické rudy)",DIA_Orc_8571_HashTor_Teach_HP_03);
	};
	if((ORCWEAPON_LINE_HP_03 == TRUE) && (ORCPRIMEWEAPON == FALSE))
	{
		Info_AddChoice(DIA_Orc_8571_HashTor_Teach,"Rudný dvousečný meč náčelníka (VB: 10, cena: 1000 kusů magické rudy)",DIA_Orc_8571_HashTor_Teach_PRIME);
	};
};

func void DIA_Orc_8571_HashTor_Teach_Back()
{
	Info_ClearChoices(DIA_Orc_8571_HashTor_Teach);
};

func void DIA_Orc_8571_HashTor_Teach_STR_01()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 125)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(hero,ItMi_Nugget,125);
		ORCWEAPON_LINE_STR_01 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná skřetí sekyra'");
		B_LogEntry(TOPIC_ORCWEAPON,"Materiály pro vykování RUDNÉ SKŘETÍ SEKYRY: 10x magická ruda, 2x železná ruda, prykyřice a síra.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_STR_02()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 250)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 10;
		Npc_RemoveInvItems(hero,ItMi_Nugget,250);
		ORCWEAPON_LINE_STR_02 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný meč válečníka'");
		B_LogEntry(TOPIC_ORCWEAPON,"Materiály pro vykování RUDNÉHO MEČE VÁLEČNÍKA: 20x magická ruda, 5x železná ruda, 2x uhlí, síra a pryskyřice.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_STR_03()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 500)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 15;
		Npc_RemoveInvItems(hero,ItMi_Nugget,500);
		ORCWEAPON_LINE_STR_03 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná válečná sekyra'");
		B_LogEntry(TOPIC_ORCWEAPON,"Materiály pro vykování RUDNÉ VÁLEČNÉ SEKYRY: 30x magická ruda, 5x uhlí, 3x prykyřice, rtuť a síra.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");

		if((ORCPRIMEWEAPON == TRUE) && (ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_03 == TRUE))
		{
			HashTorTeachAll = TRUE;
		};
	};
};

func void DIA_Orc_8571_HashTor_Teach_HP_01()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 125)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(hero,ItMi_Nugget,125);
		ORCWEAPON_LINE_HP_01 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný skřetí kalač'");
		B_LogEntry(TOPIC_ORCWEAPON,"Materiály pro vykování RUDNÉHO SKŘETÍHO KALAČE: 5x magická ruda, 10x železná ruda, uhlí a síra.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_HP_02()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 250)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 10;
		Npc_RemoveInvItems(hero,ItMi_Nugget,250);
		ORCWEAPON_LINE_HP_02 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný meč stařešiny'");
		B_LogEntry(TOPIC_ORCWEAPON,"Materiály pro vykování RUDNÉHO MEČE STAŘEŠINY: 10x magické rudy, 10x železné rudy, síra a rtuť.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	};
};

func void DIA_Orc_8571_HashTor_Teach_HP_03()
{
	if(Npc_HasItems(hero,ItMi_Nugget) < 500)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		RankPoints = RankPoints + 15;
		Npc_RemoveInvItems(hero,ItMi_Nugget,500);
		ORCWEAPON_LINE_HP_03 = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudná útočná sekyra'");
		B_LogEntry(TOPIC_ORCWEAPON,"Materiály pro vykování RUDNÉ ÚTOČNÉ SEKYRY: 30x magická ruda, 5x síra, 2x uhlí a černá perla.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");

		if((ORCPRIMEWEAPON == TRUE) && (ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_03 == TRUE))
		{
			HashTorTeachAll = TRUE;
		};
	};
};

func void DIA_Orc_8571_HashTor_Teach_PRIME()
{
	if(hero.lp < 10)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
	}
	else if(Npc_HasItems(hero,ItMi_Nugget) < 1000)
	{
		AI_Print(Print_NotEnoughOre);
	}
	else
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 20;
		Npc_RemoveInvItems(hero,ItMi_Nugget,1000);
		ORCPRIMEWEAPON = TRUE;
		AI_Print("Naučeno: Kovářství - 'Rudný dvousečný meč náčelníka'");
		B_LogEntry(TOPIC_ORCWEAPON,"Materiály pro vykování RUDNÉHO DVOUSEČNÉHO MEČE NÁČELNÍKA: 50x magická ruda, 2x černá ruda, 10x síra, 2x prykyřice, černá perla, smaragd a rtuť.");
		Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");

		if((ORCPRIMEWEAPON == TRUE) && (ORCWEAPON_LINE_STR_03 == TRUE) && (ORCWEAPON_LINE_HP_03 == TRUE))
		{
			HashTorTeachAll = TRUE;
		};
	};
};

instance DIA_Orc_8571_HashTor_Anvil(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Anvil_condition;
	information = dia_Orc_8571_HashTor_Anvil_info;
	permanent = FALSE;
	description = "Máš velkou kovárnu!";
};

func int dia_Orc_8571_HashTor_Anvil_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8571_HashTor_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Anvil_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Anvil_01_01");	//Máš velkou kovárnu!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Anvil_01_02");	//Když hodně kování, pak musíš mít spoustu místa.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Anvil_01_03");	//A zapálit velký oheň, abyste vyrobili skvělé zbraně!
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Anvil_01_04");	//To je pochopitelné.
};

instance DIA_Orc_8571_HashTor_War(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_War_condition;
	information = dia_Orc_8571_HashTor_War_info;
	permanent = FALSE;
	description = "Hodně práce?";
};

func int dia_Orc_8571_HashTor_War_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8571_HashTor_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_War_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_War_01_01");	//Hodně práce?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_War_01_02");	//Bratři jdou do války. Musíme mít hodně zbraně, hodně zbroje!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_War_01_03");	//Všechno to dělá Hash Tor! Má toho hodně co dělat.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_War_01_04");	//To je vidět.
};

instance DIA_Orc_8571_HashTor_Help(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_Help_condition;
	information = dia_Orc_8571_HashTor_Help_info;
	permanent = FALSE;
	description = "Nepotřebuješ pomoc?";
};

func int dia_Orc_8571_HashTor_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8571_HashTor_War) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_Help_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Help_01_01");	//Nepotřebuješ pomoc?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Help_01_02");	//Hash Tor opravdu muset mít černá ruda. Musí být alespoň pět kusů!
	AI_Output(other,self,"DIA_Orc_8571_HashTor_Help_01_03");	//Proč tolik?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Help_01_04");	//Hash Tor udělá nový meč velkému vůdci! Skvělý a velmi silný.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_Help_01_05");	//A pro to musí mít černá ruda. Bez něj nemůže Hash Tor vyrábět zbraně.
	MIS_HashTorOre = LOG_Running;
	Log_CreateTopic(TOPIC_HashTorOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HashTorOre,LOG_Running);
	B_LogEntry(TOPIC_HashTorOre,"Kovář Hash Tor potřebuje pět kusů černé rudy. Bez ní nebude schopen ukovat novou zbraň pro svého vůdce.");	
};


instance DIA_Orc_8571_HashTor_OreDone(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_OreDone_condition;
	information = dia_Orc_8571_HashTor_OreDone_info;
	permanent = FALSE;
	description = "Přinesl jsem ti rudu.";
};

func int dia_Orc_8571_HashTor_OreDone_condition()
{
	if((MIS_HashTorOre == LOG_Running) && (Npc_HasItems(other,ItMi_Zeitspalt_Addon) >= 5))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_OreDone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_01");	//Přinesl jsem ti rudu.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_02");	//Pak jí dát Hash Tor a ten udělat pro velkého vůdce velký meč.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_03");	//Tady, vem si to.
	B_GiveInvItems(other,self,ItMi_Zeitspalt_Addon,5);
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,5);
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_04");	//Být velice dobrá... Nyní člověk trochu čeká.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_05");	//Um... A na co?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_06");	//Hash Tor uková meč a člověk zanést do paláce Ur-Thrall.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_07");	//Nebojíš se, že s tím mečem uteču pryč?
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_08");	//Ne... (řehtá se) Je pro člověka příliš těžký! Nebude s ním moci jít do války.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_09");	//Jen velký vůdce musí být tak silný, že ho může vztyčit.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_10");	//Ale pokud člověk nevěří, může se sám pokusit.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_11");	//Tady, drž to.
	B_GiveInvItems(self,other,ITMW_2H_ORCSWORD_05,1);
	AI_Output(other,self,"DIA_Orc_8571_HashTor_OreDone_01_12");	//Sakra... To je váha!
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_13");	//Hash Tor nelhat člověk! Zbraň pro Ur-Thrall je pro něj velmi těžká.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_OreDone_01_14");	//Nyní člověk vzít a donést k Ur-Thrall. Už čekat na meč.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace mezi skřety + 10");
	};

	B_LogEntry(TOPIC_HashTorOre,"Přinesl jsem Hash Torovi 5 kusů černé rudy. Dokončil práci na meči a požádal mě, abych ho vzal Ur-Thrallovi.");	
};

instance DIA_Orc_8571_HashTor_SwordBack(C_Info)
{
	npc = Orc_8571_HashTor;
	condition = dia_Orc_8571_HashTor_SwordBack_condition;
	information = dia_Orc_8571_HashTor_SwordBack_info;
	permanent = FALSE;
	description = "Donesl jsem meč Ur-Thrallovi.";
};

func int dia_Orc_8571_HashTor_SwordBack_condition()
{
	if((MIS_HashTorOre == LOG_Running) && (UrTrallTakeSword == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8571_HashTor_SwordBack_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8571_HashTor_SwordBack_01_01");	//Donesl jsem meč Ur-Thrallovi.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_SwordBack_01_02");	//Dobře. A co vůdce říct?
	AI_Output(other,self,"DIA_Orc_8571_HashTor_SwordBack_01_03");	//Byl potěšen s tvou prací a řekl, že jsi velký mistr.
	AI_Output(self,other,"DIA_Orc_8571_HashTor_SwordBack_01_04");	//KOR, KOR! (radostně) Velký vůdce chválí Hash Tor! Je to velmi dobré.
	AI_Output(other,self,"DIA_Orc_8571_HashTor_SwordBack_01_05");	//Rozumím tvé radosti.
	MIS_HashTorOre = LOG_Success;
	Log_SetTopicStatus(TOPIC_HashTorOre,LOG_Success);
	B_LogEntry(TOPIC_HashTorOre,"Pověděl jsem Hash Torovi, že vůdce byl spokojený.");
};
//------------------------------------------------------shaman orkov--------------------------

instance DIA_Orc_8572_UrHoshNar_EXIT(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_exit_condition;
	information = dia_Orc_8572_UrHoshNar_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_Orc_8572_UrHoshNar_exit_condition()
{
	return TRUE;
};

func void dia_Orc_8572_UrHoshNar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8572_UrHoshNar_PreHello(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = DIA_Orc_8572_UrHoshNar_PreHello_condition;
	information = DIA_Orc_8572_UrHoshNar_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8572_UrHoshNar_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8572_UrHoshNar_PreHello_info()
{
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PreHello_01_01");	//DAGAR KHAR MORA!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PreHello_01_02");	//Ehm... Cože?
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8572_UrHoshNar_HELLO(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_hello_condition;
	information = dia_Orc_8572_UrHoshNar_hello_info;
	permanent = FALSE;
	description = "Zdravím!";
};

func int dia_Orc_8572_UrHoshNar_hello_condition()
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_01");	//Zdravím!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_02");	//Hmmm... (překvapeně) Vidím, že člověk zná náš jazyk.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_03");	//Hosh-Nar nevědět, že takový lidé jsou!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_04");	//A kdo jsi ty?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_05");	//Hosh-Nar být syn duchů, být velkým šamanem bratří.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_06");	//Zaklínat duchy předků, aby nezabíjet bratr skřety.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_07");	//Jaký druh duchů to je?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Hello_01_08");	//Člověk není bratr! Člověk nemůže pochopit...
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Hello_01_09");	//Ano, samozřejmě.
};

instance DIA_Orc_8572_UrHoshNar_Clever(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Clever_condition;
	information = dia_Orc_8572_UrHoshNar_Clever_info;
	permanent = FALSE;
	description = "Vy, šamani, jste mezi skřety nejchytřejší?";
};

func int dia_Orc_8572_UrHoshNar_Clever_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Clever_info()
{
	AI_Output(other,self,"DIA_Orc_8571_UrHoshNar_Clever_01_01");	//Vy, šamani, jste mezi skřety nejchytřejší?
	AI_Output(self,other,"DIA_Orc_8571_UrHoshNar_Clever_01_02");	//UR RAT! Synové duchů vědí mnoho... (přikyvuje) Ale proč by se o to člověk měl ptát?
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Clever_01_03");	//Rád bych se naučil něco o Vaší kultuře. A pochybuju, že o tom někomu budu vyprávět.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_05");	//Člověk velmi překvapit Hosh-Nar! To je velmi zvláštní!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_06");	//Ale jestli opravdu chce vědět hodně o skřetech, jít sem.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_07");	//Hosh-Nah ví o svých bratrech hodně, vidí hodně, slyší hodně...
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_08");	//Člověk, která zná náš jazyk, pochopila, co říkat Hosh-Nar!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_09");	//Proto mu řekne, co má znát. Pokud chce člověk samozřejmě poslouchat.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_10");	//Nicméně předtím než Hosh-Nar začít, člověk přinést znalosti lidí!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Clever_01_11");	//Myslíš lidské knihy?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_12");	//Knihy? Hmmm... (váhavě) Hosh-Nar nerozumí, o čem člověk mluví!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_13");	//Ale potřebuje něco, co lidé píší o svém lidu.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_14");	//Hosh-Nar chce dozvědět více o lidech! Jak žijí, co dělají, jak bojují...
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Clever_01_15");	//Dobře, zkusím ti něco najít.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Clever_01_16");	//Pak člověk, který má pro Hash-Nar tu věc... (přikyvuje) Ten muž čekat tady!
	MIS_HoshNarBooks = LOG_Running;
	Log_CreateTopic(TOPIC_HoshNarBooks,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HoshNarBooks,LOG_Running);
	B_LogEntry(TOPIC_HoshNarBooks,"Ve skřetím městě jsem se setkal s nejvyšším šamanem Hosh-Narem, který chce vědět víc o lidské kultuře. Mám sehnat zajímavé záznamy o tom jak lidé bojují, žijí...");
};

instance DIA_Orc_8572_UrHoshNar_CleverDone(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_CleverDone_condition;
	information = dia_Orc_8572_UrHoshNar_CleverDone_info;
	permanent = FALSE;
	description = "Přinesl jsem ti knihu.";
};

func int dia_Orc_8572_UrHoshNar_CleverDone_condition()
{
	if((MIS_HoshNarBooks == LOG_Running) && (Npc_HasItems(other,ItWr_EinhandBuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_CleverDone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Orc_8571_UrHoshNar_CleverDone_01_01");	//Přinesl jsem ti knihu.
	AI_Output(self,other,"DIA_Orc_8571_UrHoshNar_CleverDone_01_02");	//(spokojeně) UR DAG TAK. A co lidé tam psali?
	AI_Output(other,self,"DIA_Orc_8571_UrHoshNar_CleverDone_01_03");	//Nevzpomínám si přesně ale myslím, že je tam popsaná velká bitva. Lepší bude když si to přečteš sám.
	B_GiveInvItems(other,self,ItWr_EinhandBuch,1);
	Npc_RemoveInvItems(self,ItWr_EinhandBuch,1);
	AI_Output(self,other,"DIA_Orc_8571_UrHoshNar_CleverDone_01_05");	//(se zájmem) Velká bitva? Hosh-Nah si myslí, že je pro něj zajímavé!
	AI_Output(self,other,"DIA_Orc_8571_UrHoshNar_CleverDone_01_06");	//Děkuji člověk za zajímavá kniha.
	ORCRESPECT = ORCRESPECT + 15;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace mezi skřety + 15");
	};

	TellAboutOrcs = TRUE;
	MIS_HoshNarBooks = LOG_Success;
	Log_SetTopicStatus(TOPIC_HoshNarBooks,LOG_Success);
	B_LogEntry(TOPIC_HoshNarBooks,"Donesl jsem Hosh-Narovi knihu o kultuře lidí. Na oplátku mě řekne něco o kultuře skřetů.");
};

instance DIA_Orc_8572_UrHoshNar_WhereFrom(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_WhereFrom_condition;
	information = dia_Orc_8572_UrHoshNar_WhereFrom_info;
	permanent = FALSE;
	description = "Řekni mi něco o skřetím městě.";
};

func int dia_Orc_8572_UrHoshNar_WhereFrom_condition()
{
	if(TellAboutOrcs == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_WhereFrom_info()
{
	AI_Output(other,self,"DIA_Orc_8571_HashTor_WhereFrom_01_01");	//Řekni mi něco o skřetím městě.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_02");	//UR KAR VASHAR... Toto není město jako lidé! Být místo pro mnoho bratrů, kdyby šli do války.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_03");	//Takže je to pevnost?!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_04");	//UR AR SHAR... (přikyvuje) Skřeti postavit před mnoho roky.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_05");	//Být místem, kde se shromažďují nejsilnější válečníci! Tam jsou také paláce vůdců kmenů.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_06");	//A co ostatní skřeti?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_07");	//Zbývající bratři žijí daleko v horách! Lidé se tam nikdy nedostanou. Žít velmi vysoko!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_WhereFrom_01_08");	//Rozumím.
};

instance DIA_Orc_8572_UrHoshNar_War(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_War_condition;
	information = dia_Orc_8572_UrHoshNar_War_info;
	permanent = FALSE;
	description = "Pověz mi o válce.";
};

func int dia_Orc_8572_UrHoshNar_War_condition()
{
	if(TellAboutOrcs == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_War_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_War_01_01");	//Pověz mi o válce.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_02");	//Být to před velmi dlouho. Hosh-Nar být ještě velmi mladý, když válka.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_War_01_03");	//Kde to všechno začalo?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_04");	//(zlostně) KOR MORA TAR! Lidé jsou příliš chamtiví, chtějí hodně zlata, hodně rudy!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_05");	//Mnoho zim předtím, připlout sem a zabít mnoho bratří Hosh-Nar.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_06");	//Pak se skřeti dostanou vysoko do hor, sbírají mnoho válečníků a jdou do války.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_07");	//Pomstít své bratry! Zabít a vyhnat člověk z ostrova.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_War_01_08");	//A to Vám stačí?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_War_01_09");	//Ne! Skřeti vždy chtít žít v klidu, ale lidé nevědí jak. Lidé jsou zlí, velmi zlí!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_War_01_10");	//Hmmm... Vidím.
};

instance DIA_Orc_8572_UrHoshNar_Faith(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Faith_condition;
	information = dia_Orc_8572_UrHoshNar_Faith_info;
	permanent = FALSE;
	description = "Pověz mi něco o vaší víře.";
};

func int dia_Orc_8572_UrHoshNar_Faith_condition()
{
	if(TellAboutOrcs == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Faith_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_01");	//Pověz mi něco o vaší víře.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_02");	//Skřeti vždy ustívali jen svého velkého předka! Modlíme se k velkým vůdcům a šamanům minulosti.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_03");	//A někteří z nás s nimi mohou dokonce komunikovat!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_04");	//A co Spáč nebo Beliar?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_05");	//(rozzlobeně) UR DAR KRUSHAK KAT ZO KHAR!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_06");	//Co to znamená?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_07");	//Bratři z Vysoká skála jsou hloupí, velmi hloupí, že Krushak je uctíván! Zlý démon je všechny zabít.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_08");	//Z Vysoké skály?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_09");	//Ano, vysoko v horách volat předky. Je to jejich vina, že Krushak přijít na tento svět!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_10");	//Rozumím. Uctíváte Beliara?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_11");	//Bratři se nikdy modlit k GRAT BASHAR, není jejich velkým předkem.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_12");	//GRAT BASHAR je Beliar?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Faith_01_13");	//KOR KOR... (souhlasně) Ale GRAT BASHAR je velmi rozzlobený! Všichni bratři se ho velice bojí.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Faith_01_14");	//(sarkasticky) Chápu. Vidíš, proto mu sloužíš.
};

instance DIA_Orc_8572_UrHoshNar_Peace(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Peace_condition;
	information = dia_Orc_8572_UrHoshNar_Peace_info;
	permanent = FALSE;
	description = "A co děláte když neválčíte?";
};

func int dia_Orc_8572_UrHoshNar_Peace_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_War) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Peace_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Peace_01_01");	//A co děláte když neválčíte?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_02");	//No... (úsměv) Většinou bratři na lovu!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_03");	//Každý skřet se musí nakrmit sám a uchránit když žít v horách.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_04");	//Koneckonců je mnoho strašlivých zvířat a k tomu velká zima!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Peace_01_05");	//A co dělají šamani?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_06");	//Synové duchů spí do noci. Pak modlit k předkům a chránit bratry zatímco spí.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_07");	//Noc je nejnebezpečnějším časem, kdy všichni bratři spí a snadno se zabíjejí.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Peace_01_08");	//A šamani nebojují?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_09");	//(překvapeně) Proč by měl šaman bojovat? K tomu je spousta silných válečníků.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_10");	//Pouze v případě nouze může velký šaman dát svým bratřím příkazy.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Peace_01_11");	//Obvykle to dělají starší a náčelníci kmenů.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Peace_01_12");	//Jasný.
};

instance DIA_Orc_8572_UrHoshNar_Castle(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Castle_condition;
	information = dia_Orc_8572_UrHoshNar_Castle_info;
	permanent = FALSE;
	description = "Máte tolik silných válečníků...";
};

func int dia_Orc_8572_UrHoshNar_Castle_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Peace) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Castle_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_01");	//Máte tolik silných válečníků. Proč ještě nedobudete hrad v Hornickém údolí?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_03");	//První útok na hrad selhat... Mnoho bratrů zemřít!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_04");	//Jak se to stalo?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_05");	//Nepřítel má spoustu dobrých střelců a velmi silné kouzlo.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_06");	//Zabíjí mnoho bratrů ze zdi bez větší námahy.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_07");	//Proto skřeti přemýšlet a znovu na hrad neútočit.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_08");	//Počkej, dokud ostatní bratři nepřivedou velký BUDRAK, aby porazil hlavní bránu.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_09");	//BUDRAK?!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_10");	//Být velká kláda, prorazit hradní brána!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_11");	//Áááá, ty myslíš beranidlo. Kdo ho přiveze? 
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Castle_01_12");	//Skřetí bratři z velkého ostrov. Připlouvají s BUDRAK!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Castle_01_13");	//Hmmm... Velmi šikovný.
};

instance DIA_Orc_8572_UrHoshNar_Myrtana(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Myrtana_condition;
	information = dia_Orc_8572_UrHoshNar_Myrtana_info;
	permanent = FALSE;
	description = "A kdo jsou tihle 'Bratři z velkého ostrova'?";
};

func int dia_Orc_8572_UrHoshNar_Myrtana_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Castle) == TRUE)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Myrtana_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_01");	//A kdo jsou tihle 'Bratři z velkého ostrova'?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_02");	//Plavou sem po mnoho dní. Velký ostrov, kde být vůdce lidí.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_03");	//Takže přicházejí z pevniny?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_04");	//Hmmm... (překvapeně) Hosh-Nar nechápe, co říká člověk. Co je to pev... nina?
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_05");	//Dobře, je to 'velký ostrov'. Podstata je stejná.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_06");	//Zajímá mě něco jiného. Takže jsi v kontaktu se skřety z pev...'velkého ostrova'?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_07");	//Před mnoho zim, náš velkolepý vůdce, Kan, přišel k nám!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_08");	//Říká nám, abychom šli bojovat s lidmi. Naším vůdcem je Ur-Thrall, ten souhlasil.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_09");	//Nyní se naše klany stávají bratry, mají společného nepřítele, navzájem si pomáhají!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Myrtana_01_10");	//Kan nám dal BUDRAK! Bratři ho vezmou sem.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Myrtana_01_11");	//Rozumím.
};

instance DIA_Orc_8572_UrHoshNar_Dragon(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_Dragon_condition;
	information = dia_Orc_8572_UrHoshNar_Dragon_info;
	permanent = FALSE;
	description = "Co víš o dracích?";
};

func int dia_Orc_8572_UrHoshNar_Dragon_condition()
{
	if((Kapitel < 4) && (Npc_KnowsInfo(hero,DIA_Orc_8572_UrHoshNar_Faith) == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_Dragon_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Dragon_01_01");	//Co víš o dracích?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_02");	//(s respektem) Být velmi starověcí tvory... Velmi silné a nebezpečné!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_03");	//Bratři se z jich velmi bojí a nikdy se blížit k jejich doupěti.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Dragon_01_04");	//Takže se jich bojíte jako Beliara! Koneckonců draci mu taky slouží.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_05");	//Člověk se mýlí... Tyto stvoření neposlouchají vůli GRAT BASHAR!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_06");	//Jejich pánové jsou mnohem silnější než on.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Dragon_01_07");	//Hmmm... Jsi si tím jistý?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_08");	//Hosh-Nar říkat pouze co je pravda.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_Dragon_01_09");	//Pokud člověk nevěří, jít k drakům a zeptat se sám.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_Dragon_01_10");	//Víš, tohle zatím nechci udělat.
	MIS_TrueDragonMasters = LOG_Running;
	Log_CreateTopic(TOPIC_TrueDragonMasters,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrueDragonMasters,LOG_Running);
	B_LogEntry(TOPIC_TrueDragonMasters,"Slova nejvyššího z šamanů Hosh-Nara me zaskočila. Říká, že draci neposlouchají Beliara, ale někoho mještě silnějšího. Měl bych si o tom promluvit s Xardasem. Jeho názor a vědomosti budou třeba.");
};

instance DIA_Orc_8572_UrHoshNar_OrcHolyPlaces(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_condition;
	information = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_info;
	permanent = FALSE;
	description = "Potřebuješ ještě pomoc?";
};

func int dia_Orc_8572_UrHoshNar_OrcHolyPlaces_condition()
{
	if((MIS_HoshNarBooks == LOG_Success)) // && (MIS_HeroOrcJoin == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_OrcHolyPlaces_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_01");	//Potřebuješ ještě pomoc?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_02");	//(překvapeně) Ty chtít pomoc Hosh-Nar? Proč?
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_03");	//Musím se dostat k Vašemu vůdci. Jelikož mě skřeti ještě nerespektují tak mě Farrok nepustí.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_05");	//Hosh-Nar pochopit...
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_06");	//Pokud chce, aby jeho bratři respektovali, půjde do Velkého údolí a modlí se tam k velkým duchům předků!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_07");	//A jak to mám udělat?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_08");	//Skřeti staví velkou svatyni pro každého velkého předka. Ve Velkém údolí jsou... mmm... čtyři.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_09");	//A kde mohu najít tyto svatyně?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_10");	//Hosh-Nar říct muži... (zamyšleně) Jedna být nedaleko klanu Vysoké skály. 
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_11");	//Druhá je tam, kde voda padat z výšky hluboko! Další je vedle věže šamana lídi.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_12");	//A poslední na vysoké hoře, kde je moře.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_13");	//Dobře, pokusím se je najít.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_14");	//Muž chodit a modlit se k duchům předků! Pak se vrátit k Hosh-Nar.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_01_15");	//On říkat svým bratrům, že respektovat člověk.
	MIS_OrcHolyPlaces = LOG_Running;
	Log_CreateTopic(TOPIC_OrcHolyPlaces,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcHolyPlaces,LOG_Running);
	B_LogEntry(TOPIC_OrcHolyPlaces,"Šaman Hosh-Nar mi řekl, že pokud si chci získat respekt skřetů musím se pomohlit ve svatyních k jejich velkým předkům. Podle něj jsou čtyři - blízko vodopádu, u klanu Vysoké skály, vedle mágovy věže a poslední u moře vysoko v horách.");
};

instance DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_condition;
	information = dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_info;
	permanent = FALSE;
	description = "Pomodlil jsem se ve všech svatyních Vašich předků.";
};

func int dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_condition()
{
	if((MIS_OrcHolyPlaces == LOG_Running) && (OrcHolyPlaces_01 == TRUE) && (OrcHolyPlaces_02 == TRUE) && (OrcHolyPlaces_03 == TRUE) && (OrcHolyPlaces_04 == TRUE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_01");	//Pomodlil jsem se ve všech svatyních Vašich předků.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_02");	//Hosh-Nar o tom už ví... (souhlasně) Člověk udělat všechno správně!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_03");	//Jak o tom můžeš vědět?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_04");	//Hosh-Nar mluvit s duchy. To duchové říct Hosh-Nar.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_05");	//Ano, ano. Zapomněl jsem, že jsi nejvyšší šaman.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_06");	//Takže, teď mě tvoji bratři budou respektovat?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_07");	//Hosh-Nar jim vyprávět o člověk, jak slíbit.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_08");	//Člověk může věřit Hosh-Nar, neoklamat člověk.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_OrcHolyPlaces_Done_01_09");	//To doufám.
	ORCRESPECT = ORCRESPECT + 20;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace mezi skřety + 20");
	};

	MIS_OrcHolyPlaces = LOG_Success;
	Log_SetTopicStatus(TOPIC_OrcHolyPlaces,LOG_Success);
	B_LogEntry(TOPIC_OrcHolyPlaces,"Hosh-Nar o mě řekne svým bratrům. To značně zvyší mojí reputaci mezi skřety.");
};

instance DIA_Orc_8572_UrHoshNar_PsicampDemon(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_PsicampDemon_condition;
	information = dia_Orc_8572_UrHoshNar_PsicampDemon_info;
	permanent = FALSE;
	description = "Můžu ti s něčím pomoci?";
};

func int dia_Orc_8572_UrHoshNar_PsicampDemon_condition()
{
	if((MIS_OrcHolyPlaces == LOG_Success) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_PsicampDemon_info()
{
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_01");	//Můžu ti s něčím pomoci?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_02");	//Hmmm... (zamyšleně) Ano, člověk může.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_03");	//Ale Hosh-Nar myslet, že pro člověk moc nebezpečné.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_04");	//Povídej.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_05");	//Hosh-Nar před pár dny poslat malou skupinu bratrů do velké bažiny.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_06");	//Duchové předků mu říkají, že se tam děje velmi zvláštní věc!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_07");	//Jaká zvláštní věc?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_08");	//Hosh-Nar netuší. Bratři stále nevracejí.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_09");	//Pokud chce člověk pomoci Hosh-Nar, musí jít k velká bažina a zjistit všechno.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_10");	//Rozumím.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_11");	//Hosh-Nar bude čekat na muže až vrátit! Být ostražitý.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_12");	//Velká bažina nebezpečné místo - hodně zla, mnoho mrtvých...
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_13");	//Nedělej si starost! Nějak se s tím poperu.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_14");	//KRAT SHAKA OR... (přikyvuje) Šťastnou cestu.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemon_01_15");	//Budu to potřebovat.
	MIS_PsicampDemon = LOG_Running;
	Log_CreateTopic(TOPIC_PsicampDemon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PsicampDemon,LOG_Running);
	B_LogEntry(TOPIC_PsicampDemon,"Hosh-Nar poslal do bažiny průzkumný oddíl skřetů. Zatím nedostal žádné zprávy. Mám jít do bažiny a zjistit co se stalo se skřety.");	
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8572_UrHoshNar_What(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_What_condition;
	information = dia_Orc_8572_UrHoshNar_What_info;
	permanent = FALSE;
	description = "Přinesl jsem zprávy od Tor-Dal.";
};

func int dia_Orc_8572_UrHoshNar_What_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (TorDalSentMe == TRUE) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_What_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_01");	//Přinesl jsem zprávy od Tor-Dal.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_02");	//Hosh-Nar poslouchat... (dychtivě) Muž mluvit!
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_03");	//Oddíl, co jsi poslal do bažin je skoro zničený.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_04");	//Zůstal pouze Tor-Dal a pár jeho válečníků.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_05");	//V tom chrámu, kde bývalo Bratrstvo Spáče, je zlo.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_06");	//Nicméně, Tor-Dal netuší, co to je. V noci je slyšet strašlivé vrčení.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_07");	//Požaduje víc válečníků, aby mohl získat chrám pro skřety.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_08");	//Hmmm... (nespokojeně) To je špatná zpráva, kterou přinést člověk!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_09");	//Hosh-Nar myslet, že v chrámu postavit svatyni pro bratry, nyní změnit názor.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_00");	//A nemůže poslat ještě více válečníků.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_11");	//A kdo může?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_12");	//Pouze velký vůdce Ur-Thrall to může vyřešit!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_13");	//On nadávat Hosh-Nar pokud dozvědět, co stalo v bažině.
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_14");	//Proč?
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_15");	//Ur-Thrall se domnívá, že je to špatné místo pro svatyni bratří.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_16");	//Zatracený KRUSHAK! Musí tam být spousta zla...
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_What_01_17");	//Musím pomoct Tor-Dalovi. Nejdřív musím zajít za Ur-Thrallem.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_What_01_18");	//Hosh-Nar si to myslí. Muž jít k Ur-Thrall a mluvit s ním o chrámu v bažinách.
	HoshNarSentMe = TRUE;
	B_LogEntry(TOPIC_PsicampDemon,"Podal jsem zprávy o Tor-Dalovi. Hosh-Nar mu němůže poslat další válečníky. To vyžaduje povolení od Ur-Thralla.");	
};

instance DIA_Orc_8572_UrHoshNar_PsicampDemonDone(C_Info)
{
	npc = Orc_8572_UrHoshNar;
	condition = dia_Orc_8572_UrHoshNar_PsicampDemonDone_condition;
	information = dia_Orc_8572_UrHoshNar_PsicampDemonDone_info;
	permanent = FALSE;
	description = "Chrám v bažině je volný!";
};

func int dia_Orc_8572_UrHoshNar_PsicampDemonDone_condition()
{
	if(MIS_PsicampDemon == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_Orc_8572_UrHoshNar_PsicampDemonDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_01");	//Chrám v bažině je volný!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_02");	//Hosh-Nar to rád slyší!
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_03");	//Nyní mohou skřeti postavit svou svatyni a modlit se k duchům svých předků.
	AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_04");	//Proto si člověk zaslouží velkou odměnu od Hosh-Nar, když pomáhá bratřím.

	if((hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW))
	{
		ORCRESPECT = ORCRESPECT + 50;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Reputace mezi skřety + 50");
		};
		if(ShamanArmor == FALSE)
		{
			AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_05");	//Vzít si tato zbroj! Být zbroj synů duchů. Chránit lidi před ohněm a magií.
			CreateInvItems(other,ItMw_2h_OrcStab,1);
			B_GiveInvItems(self,other,ITAR_SHAMANROBE,1);
			ShamanArmor = TRUE;
		}
		else
		{
			B_GiveInvItems(self,other,ItRu_OrcFireball,1);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_06");	//Vzít tento nápoj! On dělá silného muže, jako skřet.
		ORCRESPECT = ORCRESPECT + 50;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Reputace mezi skřety + 50");
		};

		B_GiveInvItems(self,other,ITPO_XORCPOTION02,1);
	};
	
	AI_Output(other,self,"DIA_Orc_8572_UrHoshNar_PsicampDemonDone_01_07");	//Děkuji.
};


//-------------------------------------------------Tor Dal---------------------------------------------------

instance DIA_ORC_8216_TorDal_EXIT(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_exit_condition;
	information = dia_ORC_8216_TorDal_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_ORC_8216_TorDal_exit_condition()
{
	return TRUE;
};

func void dia_ORC_8216_TorDal_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8216_TorDal_HELLO(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_hello_condition;
	information = dia_ORC_8216_TorDal_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_ORC_8216_TorDal_hello_condition()
{
	if(MIS_PsicampDemon == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_hello_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_ORC_8216_TorDal_HELLO_01_01");	//(pohotově) Stůj člověče! Proč přijít?!
	AI_Output(other,self,"DIA_ORC_8216_TorDal_HELLO_01_02");	//Kdo jsi, skřete?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_HELLO_01_03");	//GOR TAK NABAR SHAR... (třese hlavou)
	AI_Output(self,other,"DIA_ORC_8216_TorDal_HELLO_01_04");	//Pokud chce hloupý člověk umřít, pak může pokračovat!
	AI_Output(self,other,"DIA_ORC_8216_TorDal_HELLO_01_05");	//Tor-Dal ho nezastaví.
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8216_TorDal_Meet(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_Meet_condition;
	information = dia_ORC_8216_TorDal_Meet_info;
	permanent = FALSE;
	description = "Byl to Hosh-Nar, kdo tě poslal do bažiny?";
};

func int dia_ORC_8216_TorDal_Meet_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (Npc_KnowsInfo(hero,DIA_ORC_8216_TorDal_HELLO) == TRUE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_Meet_info()
{
	AI_Output(other,self,"DIA_ORC_8216_TorDal_Meet_01_01");	//Byl to Hosh-Nar, kdo tě poslal do bažiny?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Meet_01_02");	//(překvapeně) KOR RAD... Ano, velký šaman poslal Tor-Dal do velké bažiny.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Meet_01_03");	//Ale jak to člověk ví?
	AI_Output(other,self,"DIA_ORC_8216_TorDal_Meet_01_04");	//Jsem tady na jeho pokyn. Už dlouho o Vás neslyšel takže chce nějaké zprávy.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Meet_01_06");	//Takže člověk přišla pomoci Tor-Dal.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Meet_01_07");	//Být lepší kdyby Hosh-Nar poslat další válečníky. Člověk příliš malá...
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace mezi skřety + 5");
	};
};

instance DIA_ORC_8216_TorDal_Many(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_Many_condition;
	information = dia_ORC_8216_TorDal_Many_info;
	permanent = FALSE;
	description = "Není Vás tu mnoho.";
};

func int dia_ORC_8216_TorDal_Many_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (Npc_KnowsInfo(hero,DIA_ORC_8216_TorDal_Meet) == TRUE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_Many_info()
{
	AI_Output(other,self,"DIA_ORC_8216_TorDal_Many_01_01");	//Není Vás tu mnoho.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Many_01_02");	//Mnozí bratři Tor-Dal zemřeli... Všechny zabili mrtvé!
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Many_01_03");	//Pouze Tor-Dal a několik dalších válečníků dokázali přežít.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_Many_01_04");	//Počkej tady, přemýšlet co dál.
};

instance DIA_ORC_8216_TorDal_What(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_What_condition;
	information = dia_ORC_8216_TorDal_What_info;
	permanent = FALSE;
	description = "Proč tě sem Hosh-Nar poslal?";
};

func int dia_ORC_8216_TorDal_What_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (Npc_KnowsInfo(hero,DIA_ORC_8216_TorDal_Meet) == TRUE) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_What_info()
{
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_01");	//Proč tě sem Hosh-Nar poslal?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_02");	//Tor-Dal šel do chrám ve velká bažina, jak mu velký šaman Hosh-Nar řekl.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_03");	//Chce zde postavit velkou svatyni svých bratrů! Modlit se k duchům předků.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_04");	//Pak přijít temný šamani a rozpoutat peklo. Velké zlo působit...
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_05");	//Zvýšit počet mrtvých, kteří sloužit! Teď zabíjet bratry Tor-Dal.
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_06");	//Jaké zlo myslíš?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_07");	//Tor-Dal nevěděl, neviděl to... Jen slyšet v noci! Bratři jsou vyděšení.
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_08");	//Měl bys to říct Hosh-Narovi! 
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_09");	//Tor-Dal se nemůže vrátit do města. Nejprve musí zničit zlo! Pomstít své bratry.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_10");	//Tor-Dal mít málo válečníků na boj v chrámu. Zemřít když tam vrátit.
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_11");	//Chceš mojí pomoc?
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_12");	//Hmmm... Muž je slabý! Zemřít dřív než Tor-Dal.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_13");	//Lepší se vrátí k Hosh-Nar a požádá ho, aby mu poslal další válečníky.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_What_01_14");	//Ti přijdou a pomáhají Tor-Dal zabít zlo v chrámu!
	AI_Output(other,self,"DIA_ORC_8216_TorDal_What_01_15");	//Dobře.
	TorDalSentMe = TRUE;
	B_LogEntry(TOPIC_PsicampDemon,"V bažinách jsem narazil na skřeta Tor-Dala a zbytek jeho skupiny. Tor-Dal mě poslal za Hosh-Narem a požádal ho o posily, aby mohl bojovat s mrtvými z chrámu. Možná se pokusí dobýt chrám tak jako tak...");	
};

instance DIA_ORC_8216_TorDal_PsiCampDone(C_Info)
{
	npc = ORC_8216_TorDal;
	condition = dia_ORC_8216_TorDal_PsiCampDone_condition;
	information = dia_ORC_8216_TorDal_PsiCampDone_info;
	permanent = FALSE;
	description = "Chrám je čistý!";
};

func int dia_ORC_8216_TorDal_PsiCampDone_condition()
{
	if((MIS_PsicampDemon == LOG_Running) && (DemonPsicampIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_ORC_8216_TorDal_PsiCampDone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_ORC_8216_TorDal_PsiCampDone_01_01");	//Chrám je čistý!
	AI_Output(self,other,"DIA_ORC_8216_TorDal_PsiCampDone_01_02");	//(s respektem) Jak je možné, že člověk sám zabil zlo?
	AI_Output(other,self,"DIA_ORC_8216_TorDal_PsiCampDone_01_03");	//Ano, skončil jsem s ním.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_PsiCampDone_01_04");	//Tor-Dal omlouvá, že muži řekl, že je slabý.
	AI_Output(self,other,"DIA_ORC_8216_TorDal_PsiCampDone_01_05");	//To je silný válečník! Tor-Dal respektuje muže... Orak Shaka!
	ORCRESPECT = ORCRESPECT + 15;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace mezi skřety + 15");
	};

	AI_PlayAni(self,"T_GREETGRD");
	MIS_PsicampDemon = LOG_Success;
	Log_SetTopicStatus(TOPIC_PsicampDemon,LOG_Success);
	B_LogEntry(TOPIC_PsicampDemon,"Informoval jsem Tor-Dala o tom, že jsem porazil zlo v chrámu. Nyní můžou skřeti postavit svatyni.");	
};