
instance DIA_STRF_8121_Addon_Krow_EXIT(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 999;
	condition = DIA_STRF_8121_Addon_Krow_exit_condition;
	information = DIA_STRF_8121_Addon_Krow_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8121_Addon_Krow_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_8121_Addon_Krow_PreHello(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_PreHello_condition;
	information = DIA_STRF_8121_Addon_Krow_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8121_Addon_Krow_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_00");	//(klidně) Á, nová tvář.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_01");	//Hosty tu nemíváme zrovna často. Ty jsi zde z vlastní svobodné vůle nebo jak, poutníku?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_PreHello_01_02");	//Ano, z vlastního rozhodnutí.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_03");	//Je dost divné, že tě sem skřeti pustili.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_04");	//Obvykle jediní, kteří se sem dostanou, jsou otroci.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_05");	//Očividně jsi s nimi uzavřel nějakou dohodu.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_PreHello_01_06");	//Řekněme, že máme nějaké společné zájmy.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_07");	//Nuže, nakonec to není moje věc. Jsem jen obyčejný otrok.
};

instance DIA_STRF_8121_Addon_Krow_HELLO(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_hello_condition;
	information = DIA_STRF_8121_Addon_Krow_hello_info;
	permanent = FALSE;
	description = "Jak jsi se sem dostal?";
};

func int DIA_STRF_8121_Addon_Krow_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Hello_01_00");	//Jak jsi se sem dostal?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_01");	//Pravděpodobně jsem něčím rozhněval Innose.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Hello_01_02");	//Kdo jsi byl předtím?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_03");	//Byl jsem mág a sloužil jsem rudobaronům.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Hello_01_04");	//Jsi v magii dobrý?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_05");	//Trochu. Samozřejmě v umění magie nejsem tak dobrý, jako...  mágové Ohně.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_06");	//Ale něco jsem uměl. Až do doby, než jsem spadl do spárů skřetů.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_07");	//Bohužel jsem za ta léta strávená v dole spoustu věcí zapomněl.
};

instance DIA_STRF_8121_Addon_Krow_Help(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Help_condition;
	information = DIA_STRF_8121_Addon_Krow_Help_info;
	permanent = FALSE;
	description = "Jsi v pořádku?";
};

func int DIA_STRF_8121_Addon_Krow_Help_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_Help_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_00");	//Jsi v pořádku?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_01");	//Víceméně. Ale cítil bych se lépe, kdybych měl u sebe svůj deník.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_02");	//Deník?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_03");	//Ano. Zapisoval jsem si do něj své myšlenky, pozorovaní a podobně.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_04");	//Ale když mě zajali skřeti, tak mi ho vzali spolu s ostatními věcmi.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_05");	//Byl pro mne velmi důležitý. Řekněme, že byl mým životním dílem.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_06");	//Nemáš tušení, kde je teď?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_07");	//Nejspíš ho mají stále skřeti. Ale pochybuju, že ti ho dají jen tak.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_08");	//Kde jsi ho viděl naposledy?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_09");	//U skřeta, který mě prohledával. Myslím, že se jmenoval Kor Shak.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_10");	//Alespoň něco. Pokud se mi naskytne příležitost, vrátím ti tvůj deník.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_11");	//Děkuji, poutníku.
	MIS_KrowBook = LOG_Running;
	Log_CreateTopic(TOPIC_KrowBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KrowBook,LOG_Running);
	B_LogEntry(TOPIC_KrowBook,"Skřeti vzali Crowovi deník, který byl pro něj velmi cenný. Naposledy ho viděl v rukou skřeta jménem Kor Shak.");
};

instance DIA_STRF_8121_Addon_Krow_Book(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Book_condition;
	information = DIA_STRF_8121_Addon_Krow_Book_info;
	permanent = FALSE;
	description = "Je to tvůj deník?";
};

func int DIA_STRF_8121_Addon_Krow_Book_condition()
{
	if((MIS_KrowBook == LOG_Running) && (Npc_HasItems(other,ItWr_KrowBook) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Book_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_00");	//Je to tvůj deník?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Book_01_01");	//Ano, to je on! Jak jsi ho získal?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_02");	//Na tom nezáleží.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_03");	//Jen si ho vem a pořádně uschovej, aby ti ho skřeti znovu nevzali.
	B_GiveInvItems(other,self,ItWr_KrowBook,1);
	Npc_RemoveInvItems(self,ItWr_KrowBook,1);
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Book_01_04");	//Určitě. Děkuji mockrát!
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_05");	//Nemáš za co.
	RT_Respect = RT_Respect + 1;
	MIS_KrowBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_KrowBook,LOG_Success);
	B_LogEntry(TOPIC_KrowBook,"Vrátil jsem Crowovi jeho deník. Byl v sedmém nebi.");
};

instance DIA_STRF_8121_Addon_Krow_Paladin(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Paladin_condition;
	information = DIA_STRF_8121_Addon_Krow_Paladin_info;
	permanent = FALSE;
	description = "Mám na tebe jeden dotaz.";
};

func int DIA_STRF_8121_Addon_Krow_Paladin_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (AskKrow == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Paladin_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Paladin_01_00");	//Mám na tebe jeden dotaz.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_01");	//Dobře! Odpovím, budu-li znát odpověď.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Paladin_01_02");	//Hledám tady paladina.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_03");	//(šeptem) Ticho, ne tak nahlas, příteli. Uslyší nás.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_04");	//Mluvit tady o takových věcech je velmi nebezpečné. Skřeti chyby neodpouští.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Paladin_01_05");	//Ale přece jen, víš o tom něco?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_06");	//Hmm...  (upřeně hledí) Jdeš na to příliš přímo...
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_07");	//Myslíš, že se o tom budu bavit s někým, komu nedůvěřuju?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_08");	//Koneckonců, paktuješ se se skřety. A to je, můj drahý příteli, velmi nepříznivé pro tvou reputaci s otroky.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_09");	//Nemůžeme takto riskovat, může to být naše poslední šance, jak se odtud dostat živí.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_10");	//K této konverzaci se vraťme až tehdy, jakmile se situace trochu změní.
	MIS_TrustMe = LOG_Running;
	Log_CreateTopic(TOPIC_TrustMe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrustMe,LOG_Running);
	B_LogEntry(TOPIC_TrustMe,"Pokud se chci dozvědět něco víc o ztraceném paladinovi, potřebuji získat důvěru otroků. Musím se jim pokusit pomoct s jejich problémy.");
};

instance DIA_STRF_8121_Addon_Krow_Respect(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Respect_condition;
	information = DIA_STRF_8121_Addon_Krow_Respect_info;
	permanent = TRUE;
	description = "Co se o mně říká?";
};

func int DIA_STRF_8121_Addon_Krow_Respect_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_TrustMe != LOG_Success) && (Npc_KnowsInfo(hero,DIA_STRF_8121_Addon_Krow_Paladin) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Respect_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_00");	//Co se o mně říká?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_01");	//Hmm... (zamyšleně)

	if(RT_Respect >= 8)
	{
		B_GivePlayerXP(250);
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_02");	//Zdá se, že se ti podařilo získat důvěru ostatních, poutníku.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_03");	//Je načase, aby ses setkal s těmi, které hledáš.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_04");	//Avšak, je tu jeden malý problém.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_05");	//Jaký?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_06");	//Je tu příliš mnoho stráží. Musíme najít místo, kde nás skřeti neuslyší.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_07");	//Nějaké nápady?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_08");	//Hmm... (zamyšleně) Napadá mě místo, kde pracuje Nuts, obvykle tam bývá pouze jeden strážný.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_09");	//Pokud by se ti nějakým způsobem podařilo odlákat jeho pozornost, měli bychom čas promluvit si s paladinem.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_10");	//Dobrá, pokusím se ho odlákat.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_11");	//Dobře! Budu čekat na tvůj signál.
		MIS_TrustMe = LOG_Success;
		Log_SetTopicStatus(TOPIC_TrustMe,LOG_Success);
		B_LogEntry(TOPIC_TrustMe,"Získal jsem si důvěru otroků.");
		MIS_RemoveOrc = LOG_Running;
		Log_CreateTopic(TOPIC_RemoveOrc,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RemoveOrc,LOG_Running);
		B_LogEntry_Quiet(TOPIC_RemoveOrc,"Musím odlákat pozornost skřetí stráže v jeskyni, kde pracuje Nuts. Poté si můžeme promluvit s paladinem.");
	}
	else if(RT_Respect >= 6)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_12");	//Už to skoro máš!
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_13");	//Mnoho z nás ti už důveřuje.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_14");	//Zbývá už jen pár věcí.
	}
	else if(RT_Respect >= 3)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_15");	//Lidé ti už začínají důvěřovat.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_16");	//Stále však máš co na práci.
	}
	else if(RT_Respect >= 0)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_17");	//Už jsi pomohl některým z nás.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_18");	//Ale je to pořád málo. Musíš se snažit víc.
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_19");	//Obávám se, že zatím nic.
	};
};


instance DIA_STRF_8121_Addon_Krow_RemoveOrc(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_RemoveOrc_condition;
	information = DIA_STRF_8121_Addon_Krow_RemoveOrc_info;
	permanent = FALSE;
	description = "Postaral jsem se o stráž.";
};

func int DIA_STRF_8121_Addon_Krow_RemoveOrc_condition()
{
	if((MIS_RemoveOrc == LOG_Running) && (RemoveOrcDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_RemoveOrc_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_RemoveOrc_01_00");	//Postaral jsem se o stráž.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_RemoveOrc_01_01");	//(šeptem) Dobře, o zbytek se už postarám.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_RemoveOrc_01_02");	//Zatím se vrať do jeskyně a počkej tam.
	MIS_RemoveOrc = LOG_Success;
	Log_SetTopicStatus(TOPIC_RemoveOrc,LOG_Success);
	B_LogEntry(TOPIC_RemoveOrc,"Řekl jsem Crowovi, že jeskyně je prázdná. Postará se o setkání s paladinem. Zatím mám jít do jeskyně a počkat tam.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(STRF_8120_Addon_Gars,"Meet");
	AI_Teleport(STRF_8120_Addon_Gars,"OM_LEVEL_02_BELIAR_04");
};

instance DIA_STRF_8121_Addon_Krow_Teleport(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_info;
	permanent = FALSE;
	description = "Slyšel jsem, že tě zajímá Nutsova prastará tabulka.";
};

func int DIA_STRF_8121_Addon_Krow_Teleport_condition()
{
	if((Npc_HasItems(other,ItWr_OldTextMine) >= 1) && (MIS_MineTeleport == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Teleport_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_00");	//Slyšel jsem, že tě zajímá Nutsova prastará tabulka.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_01");	//Ano, ale bohužel ji nikomu nedává.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_02");	//Mi ji ale dal, tady je.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_03");	//To na něj moc nevypadá... Doufám, že ti ji dal z vlastní dobré vůle?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_04");	//Myslíš, že to bolo z dobrej vůle?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_05");	//Nuž, nie je jednoduché nájsť takú vzácnu vec.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_06");	//Okrem iného ma zaujímalo, čo je tam napísané.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_07");	//Tak sa nato pozri ak chceš. Nuts to aj tak nevie prečítať.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_08");	//Nuž, čo to tu máme...
	B_GiveInvItems(other,self,ItWr_OldTextMine,1);
	Npc_RemoveInvItems(self,ItWr_OldTextMine,1);
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_09");	//Hmmm, očividne je to napísané v staromirtanskom dialekte.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_10");	//V týchto krajoch ho už dávno nikto neovláda.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_11");	//A čo ty?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_12");	//Len málo... a potrebujem svoj starý denník.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_13");	//V ňom som mal nejaké zápisky ohladom jazyka.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_14");	//Tak sa doň pozri.

	if(MIS_KrowBook == LOG_Success)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_15");	//Samozrejme. Moment... (číta) No takže.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_16");	//Hmmm... (zamyslene) Toto je velmi zaujímavé.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_17");	//No?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_18");	//Podla tohoto záznamu kedysi v dole existoval magický portál.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_19");	//Nie je jasné, kto ho používal, ale můžeš sa vďaka nemu premiestniť z jednej časti ostrova na druhú.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_20");	//Naozaj zaujímavé. A kde by mohol byť?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_21");	//To tu už nie je. Ale čo ja viem, také miesto nie je vo vrchných častiach dolu.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_22");	//Si si istý?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_23");	//Úplne. Nič tu ani nepripomína portál.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_24");	//A navyše, ak by ho skřeti našli, isto by ich zaujímal.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_25");	//Tak kde je potom?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_26");	//Možno hlboko dole. Kto vie?
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_27");	//Chápem. Je tam ešte niečo?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_28");	//Nie, to bolo všetko.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_29");	//V tom prípade si to nechaj.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_30");	//Ďakujem.
		MIS_MineTeleport = LOG_Running;
		Log_CreateTopic(TOPIC_MineTeleport,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Running);
		B_LogEntry_Quiet(TOPIC_MineTeleport,"Kdesi je tu magický portál, ktorý umožňuje presun z jednej časti ostrova na druhú. Asi je niekto hlboko. Tak tvrdí Crow.");
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_31");	//Bohužial mi ho vzali skřeti v deň keď ma zajali.

		if(MIS_KrowBook == LOG_Running)
		{
			AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_32");	//Ale o tom sme sa už bavili.
			AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_33");	//Samozrejme, máš pravdu.
		};

		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_34");	//Akokolvek to je, bez neho ti nepomůžu.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_35");	//Uhm.
	};
};

instance DIA_STRF_8121_Addon_Krow_Teleport_Again(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_Again_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_Again_info;
	permanent = FALSE;
	description = "Teraz máš denník.";
};

func int DIA_STRF_8121_Addon_Krow_Teleport_Again_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8121_Addon_Krow_Teleport) == TRUE) && (MIS_MineTeleport == FALSE) && (MIS_KrowBook == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Teleport_Again_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_00");	//Teraz máš denník, můžeš to prečítať?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_01");	//Samozrejme! Moment... (číta) Nuž pozrime sa.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_02");	//Hmmm... (zamyslene) Toto je velmi zaujímavé.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_03");	//No?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_04");	//Podla tohoto záznamu kedysi v dole existoval magický portál.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_05");	//Nie je jasné, kto ho používal, ale můžeš sa vďaka nemu premiestniť z jednej časti ostrova na druhú.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_06");	//Naozaj zaujímavé. A kde by mohol byť?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_07");	//To tu už nie je. Ale čo ja viem, také miesto nie je vo vrchných častiach dolu.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_08");	//Si si istý?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_09");	//Úplne. Nič tu ani nepripomína portál.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_10");	//A navyše, ak by ho skřeti našli, isto by ich zaujímal.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_11");	//Tak kde je potom?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_12");	//Možno hlboko dole. Kto vie?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_13");	//Chápem. Je tam ešte niečo?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_14");	//Nie, to bolo všetko.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_15");	//V tom prípade si to nechaj.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_16");	//Ďakujem.
	MIS_MineTeleport = LOG_Running;
	Log_CreateTopic(TOPIC_MineTeleport,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Running);
		B_LogEntry_Quiet(TOPIC_MineTeleport,"Kdesi je tu magický portál, ktorý umožňuje presun z jednej časti ostrova na druhú. Asi je niekto hlboko. Tak tvrdí Crow.");
};

instance DIA_STRF_8121_Addon_Krow_Teleport_Focus(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_Focus_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_Focus_info;
	permanent = FALSE;
	description = "Můžeš sa mrknúť na tento šuter?";
};

func int DIA_STRF_8121_Addon_Krow_Teleport_Focus_condition()
{
	if((MIS_MineTeleport == LOG_Running) && (SendPortalKrow == TRUE) && (Npc_HasItems(other,ItMi_PortalCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8121_Addon_Krow_Teleport_Focus_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_00");	//Můžeš sa mrknúť na tento šuter?
	B_GiveInvItems(other,self,ItMi_PortalCrystal,1);
	Npc_RemoveInvItems(self,ItMi_PortalCrystal,1);
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_01");	//Hmmm... (zaujato) Hej, prednedávnom som držal niečo takéto.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_02");	//Wenzel povedal, že mu pripomína niečo magické.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_03");	//Uhm, kde si ho získal?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_04");	//Povedzme, že som ho našiel hlboko dole.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_05");	//Našiel si portál, je to tak?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_06");	//Jop.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_07");	//Nebolo ťažké to uhádnu, vďaka týmto šutrom portály fungujú.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_08");	//Avšak vyzerá, že tento vyrobili kdesi na kontinente. Asi Vengard...
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_09");	//Ako vieš?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_10");	//Vidíš? To je značka rádu mágov Ohně. Také veci si človek nepletie.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_11");	//Hovoríš, že tento portál vedie na kontinent?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_12");	//Dosť možno. Ale som zmatený, čo robí v škreťom dole.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_13");	//Myslím, že to nevedia ani skřeti.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_14");	//Nuž ich sa aj tak nikto pýtať nebude.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_15");	//Samo sebou. Můžeš tým ohniskom aktivovať portál?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_16");	//Samozrejme, som nejaký mág... ale teraz to asi nebude najlepší nápad.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_17");	//Skřeti si to všimnú a buď ho rozbijú alebo začnú strážiť.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_18");	//V každom prípade sa k nemu nedostaneme.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_19");	//Takže bude lepšie držať to v tajnosti.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_20");	//Koniec koncov, ten portál je reálna šanca dostať sa odtialto.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_21");	//Bež za Wenzelom. On ti povie, čo ďalej.
	MIS_MineTeleport = LOG_Success;
	Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Success);
	B_LogEntry_Quiet(TOPIC_MineTeleport,"Šuter čo som našiel dole je magickým ohniskom. S ním můžeme aktitovať portál. Podla Crowa ho vyrobili vo Vengarde a je dosť možné, že vedie na kontinent.");
};