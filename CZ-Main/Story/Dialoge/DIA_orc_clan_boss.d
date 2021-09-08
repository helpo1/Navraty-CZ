instance DIA_NagShor_EXIT(C_Info)
{
	npc = Orc_Clan_Boss;
	nr = 999;
	condition = DIA_NagShor_Exit_Condition;
	information = DIA_NagShor_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NagShor_Exit_Condition()
{
	return TRUE;
};

func void DIA_NagShor_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NagShor_Hello(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_Hello_Condition;
	information = DIA_NagShor_Hello_Info;
	permanent = FALSE;
	description = "Zdravím, skřete.";
};

func int DIA_NagShor_Hello_Condition()
{
	return TRUE;
};

func void DIA_NagShor_Hello_Info()
{
	AI_Output(other,self,"DIA_NagShor_Hello_01_01");	//Zdravím, skřete.
	AI_Output(self,other,"DIA_NagShor_Hello_01_02");	//URG KHAR BAR... ČLOVĚK?...
	AI_Output(self,other,"DIA_NagShor_Hello_01_03");	//Nikdy jsem nemyslel, že člověk dostat zde.
	AI_Output(self,other,"DIA_NagShor_Hello_01_04");	//I když vidím, že mít Ulu-Mulu - znak síly!
	AI_Output(self,other,"DIA_NagShor_Hello_01_05");	//Takže znát naše zvyky... (s uznáním) To být dobré pro člověk.
	AI_Output(self,other,"DIA_NagShor_Hello_01_06");	//Skřeti respektovat Ulu-Mulu, mluv, co cheš?!
	Info_ClearChoices(DIA_NagShor_Hello);
	Info_AddChoice(DIA_NagShor_Hello,"Nevím.",DIA_NagShor_Hello_None);

	if((MIS_WakonTest == LOG_Running) && (UrShakTellWaterSoul == TRUE))
	{
		Info_AddChoice(DIA_NagShor_Hello,"Posílá mě šaman Ur-Shak!",DIA_NagShor_Hello_UrShak);
	};

	if((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcTraitor == FALSE) && (Npc_HasItems(other,ItWr_UrKarrasLetter) >= 1) && (OrcClanBossLetterDeliver == FALSE))
	{
		Info_AddChoice(DIA_NagShor_Hello,"Mám pro tebe zprávu.",DIA_NagShor_Hello_UrKarras);
	};
};

func void DIA_NagShor_Hello_UrShak()
{
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_01");	//Posílá mě šaman Ur-Shak!
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_02");	//Řekl, že zde najdu nějaké odpovědi na mé otázky.
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_03");	//Posílat tě Ur-Shak?! Hmmm... (zamyšleně) To velké překvapení!
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_04");	//Proč?!
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_05");	//Arrgh!... Protože skřeti nemají rádi lidi!
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_06");	//Skřeti vždy bojovat s lidi. Lidi vždy nepřátelé skřetů!
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_07");	//Jak vidíš, ne tak docela! Zachránil jsem Ur-Shakovi život a on mě nazývá přítelem skřetů.
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_08");	//Takže nemáme důvod k nepřátelství.
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_09");	//Člověk zachránil skřetí život?!... (velmi udiveně) Nikdy jsem neslyšel! Mluví člověk pravda?!
	AI_Output(other,self,"DIA_NagShor_Hello_UrShak_01_10");	//Jestli mi nevěříš, tak jednoduše můžeš jít za ním a zeptat se ho.
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_11");	//Hmmm... (unaveně) To být v pořádku! Věří ti on, já ti také věřit.
	AI_Output(self,other,"DIA_NagShor_Hello_UrShak_01_13");	//Nyní člověk říct - co on chce vědet?
	NagShorFirstMeet = TRUE;
	NagShorAreedAnswer = TRUE;
	NagShorTellUrShak = TRUE;
	Info_ClearChoices(DIA_NagShor_Hello);
};


func void DIA_NagShor_Hello_UrKarras()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_01");	//Mám pro tebe zprávu.
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_02");	//Je od skřeta jménem Ur-Karras, jednoho z velitelů klanu Černého draka.
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_03");	//Člověk je blázen? (výhružně) Pochybuji, že naši bratři by ti tolik důvěřovat!
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_04");	//Myslím, že lžeš! Takže teď řeknu svým mužům aby tě zabili!
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_05");	//Počkej, šéfe! Tady, vem si tento svitek - vše je zde napsáno.
	B_GiveInvItems(other,self,ItWr_UrKarrasLetter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_06");	//Arrgh... Zdá se, že človek mluví pravdu!
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_07");	//Je zřejmé, že Ur-Karras a klan Černého draka si tohohle človeka opravdu vážit!
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_08");	//Když tě respektovat oni - my budeme taky. Nezabíjejte ho! Od teď s ním zacházejte jako se svým bratem.
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_09");	//Jsem rád, že se všechno vyjasnilo. Když sis teď prečetl tu zprávu - jakou odpověď mám přinést Ur-Karrasovi?
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_10");	//Hmm... (přemýšlí) Řekni mu, že já i mí bratři přistoupíme na jeho návrh.
	AI_Output(other,self,"DIA_NagShor_Hello_UrKarras_01_11");	//Dobrá. Musím jít.
	AI_Output(self,other,"DIA_NagShor_Hello_UrKarras_01_12");	//Sbohem, bratře člověku!
	NagShorFirstMeet = TRUE;
	NagShorTellUrKarras = TRUE;
	OrcClanBossLetterDeliver = TRUE;
	B_LogEntry(TOPIC_HeroOrcJoin_T2,"Doručil jsem zprávu od Ur-Karrase vůdci klanu Vysoké skály. Nyní je čas vrátit se do města skřetů a předat Ur-Karrasovi jeho odpověď.");
	AI_StopProcessInfos(self);
};

func void DIA_NagShor_Hello_None()
{
	AI_Output(other,self,"DIA_NagShor_Hello_None_01_01");	//Nevím.
	AI_Output(self,other,"DIA_NagShor_Hello_None_01_02");	//Člověk neví co tu? Hloupá člověk!
	AI_Output(self,other,"DIA_NagShor_Hello_None_01_03");	//Člověk mě moc rozesmát... (směje se) Nikdy jsem nevidět takový hlupák!
	AI_Output(self,other,"DIA_NagShor_Hello_None_01_04");	//Jestli člověk nemá co říct, já taky nemluvit!
	AI_Output(self,other,"DIA_NagShor_Hello_None_01_05");	//Raději jít!... Skřet nadále smát...
	NagShorFirstMeet = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_NagShor_HelloAgain(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_HelloAgain_Condition;
	information = DIA_NagShor_HelloAgain_Info;
	permanent = TRUE;
	description = "Potřebuji si promluvit, skřete!";
};

func int DIA_NagShor_HelloAgain_Condition()
{
	if(NagShorFirstMeet == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NagShor_HelloAgain_Info()
{
	AI_Output(other,self,"DIA_NagShor_HelloAgain_01_01");	//Potřebuji si promluvit, skřete!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_01_02");	//URG KHAR BAR!... Hloupá člověk zde zase?! Zase chce rozesmát skřeta?
	AI_Output(self,other,"DIA_NagShor_HelloAgain_01_03");	//Proč jsi zde?
	Info_ClearChoices(DIA_NagShor_HelloAgain);
	Info_AddChoice(DIA_NagShor_HelloAgain,"Nemám tušení.",DIA_NagShor_HelloAgain_None);

	if((MIS_WakonTest == LOG_Running) && (UrShakTellWaterSoul == TRUE) && (NagShorTellUrShak == FALSE))
	{
		Info_AddChoice(DIA_NagShor_HelloAgain,"Posílá mě šaman Ur-Shak!",DIA_NagShor_HelloAgain_UrShak);
	};

	if((MIS_HeroOrcJoin_T2 == LOG_Running) && (OrcTraitor == FALSE) && (NagShorTellUrKarras == FALSE) && (Npc_HasItems(other,ItWr_UrKarrasLetter) >= 1) && (OrcClanBossLetterDeliver == FALSE))
	{
		Info_AddChoice(DIA_NagShor_HelloAgain,"Mám pro tebe správu.",DIA_NagShor_HelloAgain_UrKarras);
	};
};

func void DIA_NagShor_HelloAgain_UrShak()
{
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_01");	//Posílá mě šaman Ur-Shak!
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_02");	//Řekl, že zde najdu nějaké odpovědi na mé otázky.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_03");	//Posílat tě Ur-Shak?! Hmmm... (zamyšleně) To velké překvapení!
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_04");	//Proč?!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_05");	//Arrgh!... Protože skřeti nemají rádi lidi!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_06");	//Skřeti vždy bojovat s lidi. Lidi vždy nepřátelé skřetů!
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_07");	//Jak vidíš, ne tak docela! Zachránil jsem Ur-Shakovi život a on mě nazývá přítelem skřetů.
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_08");	//Takže nemáme důvod k nepřátelství.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_09");	//Člověk zachránil skřetí život?!... (velmi udiveně) Nikdy jsem neslyšel! Mluví člověk pravda?!
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrShak_01_10");	//Jestli mi nevěříš, tak jednoduše můžeš jít za ním a zeptat se ho.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_11");	//(prozíravě) Dobrá. já věřit. Člověk vypadá, že mluvit pravda.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrShak_01_13");	//Nyní člověk říct - co on chce vědet?
	NagShorTellUrShak = TRUE;
	NagShorAreedAnswer = TRUE;
	Info_ClearChoices(DIA_NagShor_HelloAgain);
};

func void DIA_NagShor_HelloAgain_UrKarras()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_01");	//Mám pro tebe zprávu.
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_02");	//Je od skřeta jménem Ur-Karras, jednoho z velitelů klanu Černého draka.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_03");	//Člověk je blázen? (výhružně) Pochybuji, že naši bratři by ti tolik důvěřovat!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_04");	//Myslím, že lžeš! Takže teď řeknu svým mužům aby tě zabili!
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_05");	//Počkej, šéfe! Tady, vem si tento svitek - vše je zde napsáno.
	B_GiveInvItems(other,self,ItWr_UrKarrasLetter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_06");	//Arrgh... Zdá se, že človek mluví pravdu!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_07");	//Je zřejmé, že Ur-Karras a klan Černého draka si tohohle člověka opravdu vážit!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_08");	//Když tě respektovat oni - my budeme taky. Nezabíjejte ho! Od teď s ním zacházejte jako se svým bratem.
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_09");	//Jsem rád, že se všechno vyjasnilo. Když sis teď prečet tu zprávu - jakou odpověď mám přinést Ur-Karrasovi?
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_10");	//Hmm... (přemýšlí) Řekni mu, že já i mí bratři přistoupíme na jeho návrh.
	AI_Output(other,self,"DIA_NagShor_HelloAgain_UrKarras_01_11");	//Dobrá. Musím jít.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_UrKarras_01_12");	//Sbohem, bratře človeku!
	NagShorTellUrKarras = TRUE;
	OrcClanBossLetterDeliver = TRUE;
	B_LogEntry(TOPIC_HeroOrcJoin_T2,"Doručil jsem zprávu od Ur-Karrase vůdci klanu Vysoké skály. Nyní je čas vrátit se do města skřetů a předat Ur-Karrasovi jeho odpověď.");
	AI_StopProcessInfos(self);
};

func void DIA_NagShor_HelloAgain_None()
{
	AI_Output(other,self,"DIA_NagShor_HelloAgain_None_01_01");	//Nemám tušení.
	AI_Output(self,other,"DIA_NagShor_HelloAgain_None_01_02");	//Ha ha ha! Člověk moc legrační... (směje se) Jak hloupá člověk!
	AI_Output(self,other,"DIA_NagShor_HelloAgain_None_01_03");	//Raději jít!... Skřet nadále smát...
	AI_StopProcessInfos(self);
};

instance DIA_NagShor_WhoYou(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_WhoYou_Condition;
	information = DIA_NagShor_WhoYou_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int DIA_NagShor_WhoYou_Condition()
{
	if(NagShorAreedAnswer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NagShor_WhoYou_Info()
{
	AI_Output(other,self,"DIA_NagShor_WhoYou_01_01");	//Kdo jsi?!
	AI_Output(self,other,"DIA_NagShor_WhoYou_01_02");	//Říkají mi Shor! Jsem náčelník Vysoká skála! To proto, že já být nejvíc chytrý, silný a elegantní skřet co ty tu moci potkat! (škrábe se na zadku)
	AI_Output(other,self,"DIA_NagShor_WhoYou_01_03");	//Takže jsi zde nejdůležitejší?
	AI_Output(self,other,"DIA_NagShor_WhoYou_01_04");	//To ano!
	AI_Output(other,self,"DIA_NagShor_WhoYou_01_05");	//Dobrá.
};

instance DIA_NagShor_WaterSoul(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_WaterSoul_Condition;
	information = DIA_NagShor_WaterSoul_Info;
	permanent = FALSE;
	description = "Víš něco o stvoření zvaném Duch Vody?";
};

func int DIA_NagShor_WaterSoul_Condition()
{
	if((MIS_WakonTest == LOG_Running) && (NagShorAreedAnswer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NagShor_WaterSoul_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_01");	//Víš něco o stvoření zvaném Duch Vody?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_02");	//Duch Vody?! Hmmm... Nemám ponětí co člověk myslí.
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_03");	//Jen šamani mluví s duchy! Shor nebýt šaman.
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_04");	//Shor válečník. Vstupuje do bitvy a zabije nepřítele! Nic jiného nedělat!
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_05");	//Áha, a nevíš, který šaman by o tom mohl něco málo vědět?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_06");	//Hmmm... Myslím, že šaman Ur-Dah by mohl pomoci. On moci vědět více!
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_07");	//Ur-Dah?! Kdo je to?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_08");	//On být šaman Vysoké skály - šamani mluví s duchy a získají od nich magii! Je velmi starý a moudrý!
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_09");	//Pak s ním musím mluvit. Ve které části tábora ho najdu?
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_10");	//On nyní nebýt v kmeni! Odešel bojovat proti lidem.
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_11");	//A kde muže být?!
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_12");	//Ty muset jít tam, kde mi léčíme rány a pohřbíváme, vééélmi daleko odsud.
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_14");	//Mluvíš o Skřetím hřbitově?!
	AI_Output(self,other,"DIA_NagShor_WaterSoul_01_15");	//Shor věří, že tak lidé nazývají to místo. Hledej tam!
	AI_Output(other,self,"DIA_NagShor_WaterSoul_01_16");	//Díky.
	NagShorTellMe = TRUE;
	B_LogEntry(TOPIC_WakonTest,"Vůdce klanu Vysoké skály neví vůbec nic o Duchu Vody. Nicméně řekl, že nejvyšší šaman Ur-Dah by měl něco vědět. Podle toho co Shor mlel by měl Ur-Dah být na skřetím hřbitově!");
};

instance DIA_NagShor_UrShak(C_Info)
{
	npc = Orc_Clan_Boss;
	condition = DIA_NagShor_UrShak_Condition;
	information = DIA_NagShor_UrShak_Info;
	permanent = FALSE;
	description = "Odkud znáš Ur-Shaka?";
};

func int DIA_NagShor_UrShak_Condition()
{
	if(NagShorAreedAnswer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NagShor_UrShak_Info()
{
	AI_Output(other,self,"DIA_NagShor_UrShak_01_01");	//Odkud znáš Ur-Shaka?
	AI_Output(self,other,"DIA_NagShor_UrShak_01_02");	//Je to hodně zim zpátky, bitva s nepřítelem! Nepřítel byl z klanu Ohně.
	AI_Output(self,other,"DIA_NagShor_UrShak_01_03");	//Ur-Shak byl v klanu Ohně tu dobu, on proto také nepřítel.
	AI_Output(self,other,"DIA_NagShor_UrShak_01_04");	//Zapojil se do bitvy a zabíjel vše kolem sebe.
	AI_Output(other,self,"DIA_NagShor_UrShak_01_05");	//Ur-Shak byl tvůj nepřítel?!
	AI_Output(self,other,"DIA_NagShor_UrShak_01_06");	//Byl, ale teď už není! 
	AI_Output(self,other,"DIA_NagShor_UrShak_01_07");	//Nyní nejsme nepřátelé, klan Ohně zanikl!
	AI_Output(self,other,"DIA_NagShor_UrShak_01_08");	//Ur-Shaka od té doby velmi respektuji! Být veliký voják a poté se stát syn Ducha! Být šaman.
	AI_Output(other,self,"DIA_NagShor_UrShak_01_09");	//Rozumím.
};