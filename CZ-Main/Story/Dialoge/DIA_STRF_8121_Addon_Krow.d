
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
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_05");	//Trochu. Samozřejmě v umění magie nejsem tak dobrý jako...  mágové Ohně.
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
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_03");	//Ano. Zapisoval jsem si do něj své myšlenky, pozorování a podobně.
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
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_07");	//Myslíš, že se o tom budu bavit s někým, komu nedůvěřuji?
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
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_08");	//Hmm... (zamyšleně) Napadá mě místo, kde pracuje Nuts. Obvykle tam bývá pouze jeden strážný.
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
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_04");	//Myslíš, že to bylo z dobré vůle?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_05");	//Co už, není jednoduché najít takovou vzácnu věc.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_06");	//Krom toho mě zajímalo, co je tam napsané.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_07");	//Tak se na to podívej, pokud chceš. Nuts stejně neví jak to přečíst.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_08");	//Co už, co to tu máme...
	B_GiveInvItems(other,self,ItWr_OldTextMine,1);
	Npc_RemoveInvItems(self,ItWr_OldTextMine,1);
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_09");	//Hmmm, očividně je to napsané v staromyrtanském dialektu.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_10");	//V těchto krajích ho už dávno nikdo neovládá.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_11");	//A co ty?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_12");	//Něco málo... a potřebuji svůj starý deník.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_13");	//V něm jsem měl nějaké zápisky ohledně jazyka.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_14");	//Tak se do něj podívej.

	if(MIS_KrowBook == LOG_Success)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_15");	//Samozřejmě. Moment... (čte) Takže.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_16");	//Hmmm... (zamyšleně) Tohle je velmi zajímavé.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_17");	//No?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_18");	//Podle tohoto záznamu kdysi v dole existoval magický portál.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_19");	//Není jasné, kdo ho používal, ale můžeš se díky němu přemístit z jedné části ostrova na druhou.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_20");	//Opravdu zajímavé. A kde by mohl být?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_21");	//To tu už není. Ale co já vím, takové místo není ve vrchních částech dolu.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_22");	//Jsi si jistý?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_23");	//Úplně. Nic tu ani nepřipomíná portál.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_24");	//A navíc, pokud by ho skřeti našli, jistě by je zajímal.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_25");	//Tak kde je potom?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_26");	//Možná hluboko dole. Kdo ví?
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_27");	//Chápu. Je tam ještě něco?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_28");	//Ne, to bylo všechno.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_29");	//V tom případě si to nechej.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_30");	//Děkuji.
		MIS_MineTeleport = LOG_Running;
		Log_CreateTopic(TOPIC_MineTeleport,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Running);
		B_LogEntry_Quiet(TOPIC_MineTeleport,"Někde je tu magický portál, který umožňuje přesun z jedné části ostrova na druhou. Asi je někde hluboko. Tak tvrdí Crow.");
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_31");	//Bohužel mi ho vzali skřeti v den kdy mě zajali.

		if(MIS_KrowBook == LOG_Running)
		{
			AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_32");	//Ale o tom jsme se už bavili.
			AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_33");	//Samozřejmě, máš pravdu.
		};

		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_34");	//Jakkoliv to je, bez něj ti nepomůžu.
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
	description = "Teď máš deník.";
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
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_00");	//Teď máš deník, můžeš to přečíst?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_01");	//Samozřejmě! Moment... (čte) Tak se na to podíváme.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_02");	//Hmmm... (zamyšleně) Tohle je velmi zajímavé.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_03");	//No?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_04");	//Podle tohoto záznamu kdysi v dole existoval magický portál.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_05");	//Není jasné, kdo ho používal, ale můžeš se díky němu přemístit z jedné části ostrova na druhou.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_06");	//Opravdu zajímavé. A kde by mohl být?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_07");	//To tu už není. Ale co já vím, takové místo není ve vrchních částech dolu.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_08");	//Jsi si jistý?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_09");	//Úplně. Nic tu ani nepřipomíná portál.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_10");	//A navíc, pokud by ho skřeti našli, jistě by je zajímal.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_11");	//Tak kde je potom?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_12");	//Možná hluboko dole. Kdo ví?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_13");	//Chápu. Je tam ještě něco?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_14");	//Ne, to bylo všechno.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_15");	//V tom případě si to nechej.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Again_01_16");	//Děkuji.
	MIS_MineTeleport = LOG_Running;
	Log_CreateTopic(TOPIC_MineTeleport,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Running);
		B_LogEntry_Quiet(TOPIC_MineTeleport,"Někde je tu magický portál, který umožňuje přesun z jedné části ostrova na druhou. Asi je někde hluboko. Tak tvrdí Crow.");
};

instance DIA_STRF_8121_Addon_Krow_Teleport_Focus(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Teleport_Focus_condition;
	information = DIA_STRF_8121_Addon_Krow_Teleport_Focus_info;
	permanent = FALSE;
	description = "Můžeš se mrknout na tento šutr?";
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
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_00");	//Můžeš sa mrknout na tento šutr?
	B_GiveInvItems(other,self,ItMi_PortalCrystal,1);
	Npc_RemoveInvItems(self,ItMi_PortalCrystal,1);
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_01");	//Hmmm... (zaujatě) Ano, přednedávnem jsem držel něco takového.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_02");	//Wenzel povídal, že mu připomíná něco magického.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_03");	//Uhm, kde jsi ho získal?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_04");	//Řekněme, že jsem ho našel hluboko dole.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_05");	//Našel jsi portál, je to tak?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_06");	//Ano.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_07");	//Nebylo těžké to uhádnout, díky těmto šutrům portály fungují.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_08");	//Ale vypadá to, že tento vyrobili kdesi na kontinentě. Asi Vengard...
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_09");	//Jak to víš?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_10");	//Vidíš? To je značka řádu mágů Ohně. Takové věci si člověk nezplete.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_11");	//Říkáš, že tento portál vede na kontinent?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_12");	//Pravděpodobně. Ale nevím, co dělá ve skřetím dole.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_13");	//Myslím, že to neví ani skřeti.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_14");	//Jich se stejně nikdo ptát nebude.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_15");	//Samo sebou. Můžeš tím ohniskem aktivovat portál?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_16");	//Samozřejmě, jsem zkušený mág... ale teď to asi nebude nejlepší nápad.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_17");	//Skřeti si toho všimnou a buď ho zničí nebo začnou střežit.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_18");	//V každém případě se k němu nedostaneme.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_19");	//Takže bude lepší držet to v tajnosti.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_20");	//Konec konců, ten portál je reálná šance dostat se odtud.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_Focus_01_21");	//Běž za Wenzelem. On ti poví, co dělat dál.
	MIS_MineTeleport = LOG_Success;
	Log_SetTopicStatus(TOPIC_MineTeleport,LOG_Success);
	B_LogEntry_Quiet(TOPIC_MineTeleport,"Šutr co jsem našel dole je magické ohnisko. S ním můžeme aktitovat portál. Podle Crowa ho vyrobili ve Vengardě a je dost možné, že vede na kontinent.");
};
