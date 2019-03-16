
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
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_00");	//(Ticho) Nová tvár v dole.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_01");	//Nemávam hostí často.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_PreHello_01_02");	//Nuž tu som.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_03");	//Je divné, že ťa skřeti nechali vojsť.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_04");	//Normálne sa sem dostávajú iba otroci.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_05");	//Ty ale s nimi máš očividne nejakú dohodu.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_PreHello_01_06");	//Povedzme, že máme nejaké spoločné záujmy.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_PreHello_01_07");	//Nuž, to nie je moja starosť. Ja som len obyčajný služobník.
};

instance DIA_STRF_8121_Addon_Krow_HELLO(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_hello_condition;
	information = DIA_STRF_8121_Addon_Krow_hello_info;
	permanent = FALSE;
	description = "Ako si sa sem dostal?";
};

func int DIA_STRF_8121_Addon_Krow_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Hello_01_00");	//Ako si sa sem dostal?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_01");	//Očividne som niečím rozhneval Innosa.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Hello_01_02");	//A čo si bol predtým?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_03");	//Bol som mág a slúžil som pod rudobaronmi.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Hello_01_04");	//Rozumieš mágii?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_05");	//Niečo málo. Samozrejme nie som tak dobrý v umení mágie ako hmm... mágové Ohně.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_06");	//Ale niečo som vedel urobiť. Až kým som nepadol do rúk skřetům.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Hello_01_07");	//Bohužial za mnoho rokov tvrdej práce som vela pozabúdal.
};

instance DIA_STRF_8121_Addon_Krow_Help(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Help_condition;
	information = DIA_STRF_8121_Addon_Krow_Help_info;
	permanent = FALSE;
	description = "Si v poriadku?";
};

func int DIA_STRF_8121_Addon_Krow_Help_condition()
{
	return TRUE;
};

func void DIA_STRF_8121_Addon_Krow_Help_info()
{
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_00");	//Si v poriadku?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_01");	//Viac menej. Ale cítil by som sa lepšie, ak by som mal so sebou svoj denník.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_02");	//Denník?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_03");	//Hej hej, zapisoval som si tam svoje myšlienky, pozorovania a tak ďalej.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_04");	//Ale keď ma chytili skřeti, tak mi ho spolu s ostatnými vecami vzali.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_05");	//Bol pre mňa velmi doležitý. Povedzme, že to bolo moje životné dielo.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_06");	//Máš potuchy, kde by mohol byť teraz?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_07");	//Asi ho majú stále skřeti. Ale myslím, že ti ho nedajú len tak.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_08");	//Kde si ho videl naposledy?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_09");	//U skřeta, ktorý ma prehladal. Myslím, že sa volal Kor Shack.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Help_01_10");	//To je aspoň niečo. Ak dostanem šancu, tak ti ho donesiem.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Help_01_11");	//Ďakujem cudzinec.
	MIS_KrowBook = LOG_Running;
	Log_CreateTopic(TOPIC_KrowBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KrowBook,LOG_Running);
	B_LogEntry(TOPIC_KrowBook,"Skřeti vzali Crowovi jeho denník, ktorý by chcel zpět. Naposledy ho videl v rukách skřeta s menom Kor Shack.");
};

instance DIA_STRF_8121_Addon_Krow_Book(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Book_condition;
	information = DIA_STRF_8121_Addon_Krow_Book_info;
	permanent = FALSE;
	description = "Je toto tvoj denník?";
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
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_00");	//Je toto tvoj denník?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Book_01_01");	//Hej je to on, ako si ho získal?
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_02");	//To nie je důležité.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_03");	//Zober si ho a poriadne schovaj. Ak ti ho skřeti zas zoberú, už tu nemusím byť.
	B_GiveInvItems(other,self,ItWr_KrowBook,1);
	Npc_RemoveInvItems(self,ItWr_KrowBook,1);
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Book_01_04");	//Samozrejme samozrejme, ďakujem.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Book_01_05");	//Niet zač.
	RT_Respect = RT_Respect + 1;
	MIS_KrowBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_KrowBook,LOG_Success);
	B_LogEntry(TOPIC_KrowBook,"Vrátil som Crowovi jeho denník. Bol v siedmom nebi.");
};

instance DIA_STRF_8121_Addon_Krow_Paladin(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Paladin_condition;
	information = DIA_STRF_8121_Addon_Krow_Paladin_info;
	permanent = FALSE;
	description = "Mám pre teba otázku.";
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
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Paladin_01_00");	//Mám pre teba otázku.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_01");	//Dobre! Ak budem vedieť, odpoviem.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Paladin_01_02");	//Hladám tu paladina.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_03");	//(šeptom) Shhh, tichšie! Možu nás počuť.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_04");	//Je nebezpečné baviť sa o takých veciach. A skřeti neodpúštajú.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Paladin_01_05");	//Ale predsa. Vieš o tom niečo?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_06");	//Hmmm... podla mňa nato ideš príliš priamo.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_07");	//Myslíš, že to budem rozoberať s niekým, ktomu neverím úplne?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_08");	//Koniec koncov, paktuješ so skřety. A to můj drahý nemám priaznivý vplyv na tvoju reputáciu medzi otrokmi.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_09");	//A my nemůžeme riskovať, pretože to může byť naša posledná šanca na útek odtialto.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Paladin_01_10");	//Takže keď sa zmení situácia, můžeme sa o tom porozprávať.
	MIS_TrustMe = LOG_Running;
	Log_CreateTopic(TOPIC_TrustMe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrustMe,LOG_Running);
	B_LogEntry(TOPIC_TrustMe,"Potrebujem získať důveru kopáčov, predtým, než sa dozviem niečo viac o zmiznutom paladinovi. Asi musím týmto ludom pomocť s ich problémami...");
};

instance DIA_STRF_8121_Addon_Krow_Respect(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_Respect_condition;
	information = DIA_STRF_8121_Addon_Krow_Respect_info;
	permanent = TRUE;
	description = "Čo sa tu o mne hovorí?";
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
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_00");	//Čo sa tu o mne hovorí?
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_01");	//Hmmm...(zamyslene)

	if(RT_Respect >= 8)
	{
		B_GivePlayerXP(250);
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_02");	//Zdá sa, že sa ti podarilo získať důveru ostatných cudzinec.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_03");	//Takže je čas aby sa stretol s tými, čo ich hladáš.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_04");	//Avšak, máme malý problém.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_05");	//Aký problém?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_06");	//Tu je vela stráží. Musíme ísť niekam, kde nás nebudú počuť.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_07");	//Nápady?
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_08");	//Hmmm... (zamyslene) V jaskyni, kde maká Nuts zvykne byť len jeden strážca.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_09");	//Ak by sa ti ho podarilo nejako odlákať, získali by sme čas.
		AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Respect_01_10");	//Dobre, pokusím sa ho odtial dostať.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_11");	//Dobre! Počkám na tvoj signál.
		MIS_TrustMe = LOG_Success;
		Log_SetTopicStatus(TOPIC_TrustMe,LOG_Success);
		B_LogEntry(TOPIC_TrustMe,"Získal som důveru kopáčov.");
		MIS_RemoveOrc = LOG_Running;
		Log_CreateTopic(TOPIC_RemoveOrc,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RemoveOrc,LOG_Running);
		B_LogEntry_Quiet(TOPIC_RemoveOrc,"Potrebujem odlákať pozornosť skřetí stráže v jaskyni, kde maká Nuts. Potom si budem mocť pokecať s paladinom.");
	}
	else if(RT_Respect >= 6)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_12");	//Už si skoro tam!
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_13");	//Mnoho z nás ti důveruje.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_14");	//Už len pár krokov.
	}
	else if(RT_Respect >= 3)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_15");	//Ludia ti začínajú trocha veriť.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_16");	//Musíš sa ale snažiť viac.
	}
	else if(RT_Respect >= 0)
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_17");	//Už si pomohol niekolkým z nás.
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_18");	//Ale to nie je dosť. Musíš sa viac snažiť.
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Respect_01_19");	//Nič kámo, nič.
	};
};


instance DIA_STRF_8121_Addon_Krow_RemoveOrc(C_Info)
{
	npc = STRF_8121_Addon_Krow;
	nr = 2;
	condition = DIA_STRF_8121_Addon_Krow_RemoveOrc_condition;
	information = DIA_STRF_8121_Addon_Krow_RemoveOrc_info;
	permanent = FALSE;
	description = "Postaral som sa o stráž.";
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
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_RemoveOrc_01_00");	//Postaral som sa o stráž.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_RemoveOrc_01_01");	//(Šeptom) Dobre, o zvyšok sa postarám ja.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_RemoveOrc_01_02");	//Ty choď do jaskyne a čakaj.
	MIS_RemoveOrc = LOG_Success;
	Log_SetTopicStatus(TOPIC_RemoveOrc,LOG_Success);
	B_LogEntry(TOPIC_RemoveOrc,"Povedal som Crowovi, že jaskyňa je prázdna. On sa postará, aby sa stretnutie uskutočnilo.");
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
	description = "Počul som, že máš záujem o niečo s Nutsom.";
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
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_00");	//Počul som, že máš záujem o niečo s Nutsom.
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_01");	//Hej, ale bohužial ho nikomu nedáva.
	AI_Output(other,self,"DIA_STRF_8121_Addon_Krow_Teleport_01_02");	//Ale mne dal. Tu!
	AI_Output(self,other,"DIA_STRF_8121_Addon_Krow_Teleport_01_03");	//Pre neho to nie je. Dúfam, že to bolo v dobrej viere?
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