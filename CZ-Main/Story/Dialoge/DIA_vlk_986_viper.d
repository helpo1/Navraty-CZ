/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků


v1.01:

func void dia_viper_CLEARMAGICOREMAKE_info - upraven přístup do Jeskyně Ohně (FIRECAVE_ZEN) po splnění úkolu Rituál Ohně (TOPIC_KELIOSTEST)

*/



instance DIA_VIPER_EXIT(C_Info)
{
	npc = vlk_986_viper;
	nr = 999;
	condition = dia_viper_exit_condition;
	information = dia_viper_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_viper_exit_condition()
{
	return TRUE;
};

func void dia_viper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VIPER_HALLO(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_hallo_condition;
	information = dia_viper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_viper_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_viper_hallo_info()
{
	AI_Output(self,other,"DIA_Viper_HALLO_01_00");	//Hej, chlape, pootoč se...! Jo, já tě fakt znám!
	AI_Output(self,other,"DIA_Viper_HALLO_01_01");	//Ty jsi ten, kterej ve Starým dole zabil královnu červů.
	AI_Output(self,other,"DIA_Viper_HALLO_01_02");	//Jo, fakt jsi to ty!
	AI_Output(other,self,"DIA_Viper_HALLO_01_03");	//Ty jsi byl kopáč? Nevzpomínám si...
	AI_Output(self,other,"DIA_Viper_HALLO_01_04");	//Máš krátkou paměť. Já jsem Viper, byl jsem tavič ve Starém dole. Tohle si pamatuj.
	AI_Output(other,self,"DIA_Viper_HALLO_01_05");	//Ale jak jsi přežil, když bylo vše zničeno při pádu bariéry?!
	AI_Output(self,other,"DIA_Viper_HALLO_01_06");	//No... Nalej mi nějakej drink a můžem si pokecat.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Viper_HALLO_01_07");	//Máš pravdu, v dole bylo vše ztraceno. Opravdu vše...
	AI_Output(self,other,"DIA_Viper_HALLO_01_08");	//Snipes, Aleph a já jsme provedli fantastický věci. Měl by sis na ně pamatovat.
	AI_Output(self,other,"DIA_Viper_HALLO_01_09");	//První chtěl stále podvádět stráže a druhej se snažil co nejméně pracovat...
	AI_Output(self,other,"DIA_Viper_HALLO_01_10");	//A pak dal Ian nám třem rudu, abychom ji odnesli do Starého tábora.
	AI_Output(self,other,"DIA_Viper_HALLO_01_11");	//Mno, nebyl příliš rád, že ji dal nám. Chtěli jsme s ní utéct.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Viper_HALLO_01_13");	//Poslal se mnou ty dva kopáče a když mu došlo, že rudu už neuvidí, poslal za námi dva strážce.
	AI_Output(self,other,"DIA_Viper_HALLO_01_14");	//Už jsme s rudou byli skoro venku z dolu.
	AI_Output(self,other,"DIA_Viper_HALLO_01_15");	//Mno a tady to začalo. Moc to nechápu.
	AI_Output(self,other,"DIA_Viper_HALLO_01_16");	//Ozvala se silná rána a do dolu vtrhla voda, která začala demolovat spodní části dolu.
	AI_Output(self,other,"DIA_Viper_HALLO_01_17");	//S klukama jsem utíkal dál ven, ale strážci nás skoro chytili, když tu na ně spadla kamenná deska a bylo po nich.
	AI_Output(self,other,"DIA_Viper_HALLO_01_18");	//Bylo po všem během chvilky a my byli s rudou venku sami.
	AI_Output(self,other,"DIA_Viper_HALLO_01_21");	//Mno, byli jsme s rudou v lese a nemohli jsme do Starého tábora. Tak jsme se rozhodli jít k Laresovi.
	AI_Output(self,other,"DIA_Viper_HALLO_01_22");	//Mno ale když jsme si uvědomili, že by nám ji sebral, ukryli jsme ji.
	AI_Output(self,other,"DIA_Viper_HALLO_01_25");	//Když jsme schovávali poklad, zůstal jsem na stráži a měl jsem hlídat, aby nás nikdo neviděl.
	AI_Output(self,other,"DIA_Viper_HALLO_01_26");	//Snipes a Aleph šli zakopat rudu a pár minut po tom bariéra spadla!
	AI_Output(self,other,"DIA_Viper_HALLO_01_27");	//Vše bylo zahaleno mlhou. Když jsem se probral k vědomí, kroužili okolo skřeti. HODNĚ SKŘETŮ!
	AI_Output(self,other,"DIA_Viper_HALLO_01_28");	//Schoval jsem se v blízké jeskyni a když jsem dostal příležitost, mazal jsem ven z údolí.
	AI_Output(self,other,"DIA_Viper_HALLO_01_29");	//A teď jsem zde.
	AI_Output(other,self,"DIA_Viper_HALLO_01_30");	//A co se stalo s ostatními?!
	AI_Output(self,other,"DIA_Viper_HALLO_01_31");	//Nevím. Tenkrát jsem je viděl naposled. Rád bych věděl, kde jsou a co se s nimi stalo - hlavně už kvůli rudě.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Viper_HALLO_01_34");	//Bylo by možné se podívat kolem, ale v údolí jsou hordy skřetů.
	AI_Output(other,self,"DIA_Viper_HALLO_01_35");	//A kde je to místo?
	AI_Output(self,other,"DIA_Viper_HALLO_01_36");	//Ha! Chceš abych ti to řekl? To nepůjde.
};


instance DIA_VIPER_HELP(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_help_condition;
	information = dia_viper_help_info;
	permanent = FALSE;
	description = "Můžu ti pomoct najít tvou rudu.";
};


func int dia_viper_help_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_hallo))
	{
		return TRUE;
	};
};

func void dia_viper_help_info()
{
	AI_Output(other,self,"DIA_Viper_Help_01_00");	//Můžu ti pomoct najít tvou rudu. Tedy, pokud se se mnou rozdělíš.
	AI_Output(self,other,"DIA_Viper_Help_01_01");	//Ty?! Ha, ha, ha - ty tak!... Na území skřetů! A dalších mnohem horších nestvůr...
	AI_Output(other,self,"DIA_Viper_Help_01_02");	//Se skřety budu hned hotovej. To není problém!
	AI_Output(self,other,"DIA_Viper_Help_01_03");	//No, to je možné. Ale nevím, jestli ti svěřím tak velké tajemství... Nějak o tom pochybuji... (nedůvěřivě)
	AI_Output(self,other,"DIA_Viper_Help_01_07");	//Dobrá, jestli mi chceš doopravdy pomoci...
	AI_Output(self,other,"DIA_Viper_Help_01_08");	//... dám ti... (přemýšlí)
	AI_Output(self,other,"DIA_Viper_Help_01_09");	//... sto kousků rudy! To je slušnej kus, co říkáš?
	Info_AddChoice(dia_viper_help,"Dobře, platí!",dia_viper_help_ok);
	Info_AddChoice(dia_viper_help,"Ne, to je málo!",dia_viper_help_no);
};

func void dia_viper_help_ok()
{
	AI_Output(other,self,"DIA_Viper_Help_Ok_00");	//Dobrá, na ruku!
	AI_Output(self,other,"DIA_Viper_Help_Ok_01");	//Dobře, jsme dohodnuti! Eh... Doufám, že nebudu litovat své důvěry.
	AI_Output(other,self,"DIA_Viper_Help_Ok_03");	//Kde jsi naposled viděl své chlapy?
	AI_Output(self,other,"DIA_Viper_Help_Ok_04");	//V blízkosti Nového tábora u mostu za Starým dolem.
	AI_Output(self,other,"DIA_Viper_Help_Ok_07");	//Doufám, že mi pomůžeš je najít.
	AI_Output(self,other,"DIA_Viper_Help_Ok_09");	//Slyšel jsem, že Lobart má nového dělníka. Jmenuje se jako jeden z mých přátel - Snipes.
	AI_Output(self,other,"DIA_Viper_Help_Ok_10");	//Nemyslím si, samozřejmě, že by to mohlo být, ale... (sarkasticky) Co se Beliar nažertuje, když Innos spí! Beztak je to on.
	Info_ClearChoices(dia_viper_help);
	Wld_InsertNpc(bau_987_snipes,"NW_FARM1_FIELD_05");
	MIS_VIPERNUGGETS = LOG_Running;
	Log_CreateTopic(TOPIC_VIPERNUGGETS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_Running);
	B_LogEntry(TOPIC_VIPERNUGGETS,"V Kardifově krčmě jsem potkal Vipera, který říkal, že se svými přáteli, Snipesem a Alephem schovali hromadu rudy. Neví kde jeho kámoši jsou, ale zkusím je najít i s rudou.");
	B_LogEntry(TOPIC_VIPERNUGGETS,"Viper souhlasil s mou nabídkou najít rudu. Přirozeně mi nevěří. Řekl mi, že rudu a své přátelé viděl naposled u mostu do Nového tábora. Přesněji mi to říct nedokáže. Ale na Lobartově farmě je nový dělník, který by to mohl znát, protože se jmenuje stejně jako Snipes a to asi nebude náhoda.");
};

func void dia_viper_help_no()
{
	AI_Output(other,self,"DIA_Viper_Help_No_00");	//Ne, to nestačí!
	AI_Output(self,other,"DIA_Viper_Help_No_01");	//To nestačí?! Dobrá chlape.
	AI_Output(self,other,"DIA_Viper_Help_No_02");	//Promiň, ale více ti nabídnout nemohu.
};


instance DIA_VIPER_HOW(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_how_condition;
	information = dia_viper_how_info;
	permanent = TRUE;
	description = "Co děláš, Vipere?";
};


func int dia_viper_how_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_help) && (MIS_VIPERNUGGETS == FALSE) && (VIPERRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_how_info()
{
	AI_Output(other,self,"DIA_Viper_How_01_00");	//Co děláš, Vipere? O čem sníš?
	AI_Output(self,other,"DIA_Viper_How_01_01");	//A co tě to zajímá? Jdi pryč.
};


instance DIA_VIPER_GETTREASURE(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_gettreasure_condition;
	information = dia_viper_gettreasure_info;
	permanent = FALSE;
	description = "Hej Vipere! Co děláš z lenosti?!";
};

func int dia_viper_gettreasure_condition()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (VIPERGETNUGGETS == FALSE) && (TALKTOALEF == TRUE))
	{
		if((Npc_HasItems(other,ItMi_Nugget) >= 250) && (MEETSNIPS == FALSE))
		{
			return TRUE;
		};
		if((Npc_HasItems(other,ItMi_Nugget) >= 200) && (MEETSNIPS == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_viper_gettreasure_info()
{
	AI_Output(other,self,"DIA_Viper_GetTreasure_01_00");	//Hej Vipere! Co děláš z lenosti?
	AI_Output(self,other,"DIA_Viper_GetTreasure_01_01");	//To není tvá věc... A co ty?!
	AI_Output(self,other,"DIA_Viper_GetTreasure_01_02");	//A ty mi pověz... (pomalu a rozvážně) Našel jsi rudu?
	AI_Output(other,self,"DIA_Viper_GetTreasure_01_03");	//Neměj obavy! Budeš mít radost ze svého bohatství.

	if(MEETSNIPS == TRUE)
	{
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_04");	//Tady, ber. Zde je tvých milovaných 200 nugetů. Nyní si můžeš užívat života jako já!
		B_GiveInvItems(other,self,ItMi_Nugget,200);
		Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_05");	//Nevěřím svým očím! Jak je to možné?! Nyní konečně můžu začít žít. Díky chlape!
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_07");	//Počkat, co tím chceš říct?!
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_08");	//Chci říci, že Aleph - tvůj přítel má méně, než ty a Snipes.
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_09");	//Nedostal se z údolí a skřeti udělali své.
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_10");	//Chudák, chudák Aleph... Kdo by si to pomyslel! (smutný)
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_11");	//Vzal jsem si jeho díl.
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_12");	//Když je Aleph mrtvý, nejsem proti. Zasloužíš si to!

		if(SNIPSGETNUGGETS == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(self,other,"DIA_Viper_GetTreasure_01_13");	//Řekni mi, co je se Snipesem?!
			AI_Output(other,self,"DIA_Viper_GetTreasure_01_14");	//Snipes dostal podíl a už nikdy nebude muset pracovat u Lobarta.
			MIS_VIPERNUGGETS = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_SUCCESS);
			B_LogEntry(TOPIC_VIPERNUGGETS,"Dal jsem Viperovi jeho podíl. Byl šťastný jako blecha!");
		}
		else
		{
			B_GivePlayerXP(100);
			AI_Output(self,other,"DIA_Viper_GetTreasure_01_15");	//Řekni, co je se Snipesem?!
			AI_Output(other,self,"DIA_Viper_GetTreasure_01_16");	//Zatím jsem u něho nebyl, ale jsem si jistý, že už brzy nebude muset makat u Lobarta.
			B_LogEntry(TOPIC_VIPERNUGGETS,"Dal jsem Viperovi jeho podíl. Byl šťastný jako blecha!");
		};
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_17");	//Tady ber. Zde je tvých 250 kusů. Teď si můžeš užívat života!
		B_GiveInvItems(other,self,ItMi_Nugget,250);
		Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_18");	//Nevěřím svým očím! Co se to stalo! Konečně můžu začít žít. Díky chlape!
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_19");	//Ale čekej! Proč 250 kusů?!
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_20");	//Snipese jsem nenašel a Aleph je mrtvý, takže fifty-fifty.
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_21");	//Co tím chceš říct?!
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_22");	//Chtěl bych říct, že Aleph je tuhej a nemám páru, kde je Snipes.
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_23");	//Aleph se nemohl dostat z údolí a skřeti ho sundali.
		AI_Output(self,other,"DIA_Viper_GetTreasure_01_24");	//Chudák, chudák Aleph... (smutný) Kdo by si to pomyslel!
		AI_Output(other,self,"DIA_Viper_GetTreasure_01_25");	//Takže bez podílu od Snipese to bude fifty-fifty.
		MIS_VIPERNUGGETS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_SUCCESS);
		B_LogEntry(TOPIC_VIPERNUGGETS,"Dal jsem Viperovi jeho podíl. Byl šťastný jako blecha, ale sklíčilo ho to, že jsem Snipese nenašel a Aleph je mrtev.");
	};
	AI_Output(self,other,"DIA_Viper_GetTreasure_01_27");	//Ty jsi chlap, kterej je nenahraditelnej! Pochyboval jsem jen napoprvé a to málo.
	VIPERGETNUGGETS = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_VIPER_HELLO(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_hello_condition;
	information = dia_viper_hello_info;
	permanent = TRUE;
	description = "Hej, Vipere! Co je?";
};


func int dia_viper_hello_condition()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (VIPERGETNUGGETS == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_hello_info()
{
	AI_Output(other,self,"DIA_Viper_Hello_01_00");	//Hej, Vipere! Co je?
	AI_Output(self,other,"DIA_Viper_Hello_01_01");	//Raději bys měl dělat něco užitečného.
	AI_Output(self,other,"DIA_Viper_Hello_01_02");	//Například hledat naši rudu!... (naštvaně)
};


instance DIA_VIPER_HELLOAFTER(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_helloafter_condition;
	information = dia_viper_helloafter_info;
	permanent = TRUE;
	description = "Hej, Vipere! Co je?";
};


func int dia_viper_helloafter_condition()
{
	if((MIS_VIPERNUGGETS == LOG_SUCCESS) && (VIPERRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_helloafter_info()
{
	AI_Output(other,self,"DIA_Viper_HelloAfter_01_00");	//Hej, Vipere! Co je?
	AI_Output(self,other,"DIA_Viper_HelloAfter_01_01");	//Vše je v pořádku a nic nemůže být lepší!
};


instance DIA_VIPER_MEETSNIPS(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_meetsnips_condition;
	information = dia_viper_meetsnips_info;
	permanent = FALSE;
	description = "Mám novinky.";
};


func int dia_viper_meetsnips_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo))
	{
		return TRUE;
	};
};

func void dia_viper_meetsnips_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Viper_MeetSnips_01_00");	//Mám novinky.
	if(MEETSNIPS == TRUE)
	{
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_04");	//Dobrá, poslouchej. Chlap, kterej pracuje u Lobarta je opravdu Snipes.
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_06");	//Špatná zpráva je, že neví, kde je ruda.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_07");	//CO?!
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_08");	//Našli místo, kde to zakopat, ale šel tam jen Aleph. Snipes na něj čekal.
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_09");	//Když bariéra padla, jeskyně s Alephem se zasypala. Snipes dostal šutrem do hlavy a omdlel.
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_10");	//Když se probral, utekl z údolí a co je s Alephem a rudou, nikdo neví.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_11");	//To opravdu není dobré, co teď?!
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_12");	//Půjdu hledat Alepha, protože Snipes mi řekl, kde by mohla být ta jeskyně.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_14");	//Dobrá, myslím že to půjde.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_15");	//Dobrá, spoléhám na tebe.
		B_LogEntry(TOPIC_VIPERNUGGETS,"Řekl jsem Viperovi o mém setkání se Snipesem. Viper byl rád, že Snipes žije, ale naštval se, když jsem mu řekl, že Snipes neví, kde je Aleph s rudou. Měl bych se po něm podívat.");
	}
	else
	{
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_18");	//Chlap u Lobarta asi nebude Snipes.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_20");	//Hmm... To není dobré. Co teď?!
		AI_Output(other,self,"DIA_Viper_MeetSnips_01_23");	//Měl bych se podívat do údolí, možná bych tam objevil něco zajímavého.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_24");	//Dobrá, myslím že to půjde.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_25");	//Dobrá, spoléhám na tebe.
		B_LogEntry(TOPIC_VIPERNUGGETS,"Řekl jsem Viperovi, že chlap u Lobarta nebyl Snipes a že neví o rudě. Aleph by mohl vědět, kde je ruda. Ale kde ho mám hledat?");
	};
};

instance DIA_VIPER_PICKPOCKET(C_Info)
{
	npc = vlk_986_viper;
	nr = 900;
	condition = dia_viper_pickpocket_condition;
	information = dia_viper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_viper_pickpocket_condition()
{
	return C_Beklauen(15,25);
};

func void dia_viper_pickpocket_info()
{
	Info_ClearChoices(dia_viper_pickpocket);
	Info_AddChoice(dia_viper_pickpocket,Dialog_Back,dia_viper_pickpocket_back);
	Info_AddChoice(dia_viper_pickpocket,DIALOG_PICKPOCKET,dia_viper_pickpocket_doit);
};

func void dia_viper_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_viper_pickpocket);
};

func void dia_viper_pickpocket_back()
{
	Info_ClearChoices(dia_viper_pickpocket);
};

instance DIA_VIPER_HOWORELIQ(C_Info)
{
	npc = vlk_986_viper;
	nr = 4;
	condition = dia_viper_howoreliq_condition;
	information = dia_viper_howoreliq_info;
	permanent = FALSE;
	description = "Víš kdo mě může naučit těžit rudu?";
};

func int dia_viper_howoreliq_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_help) && (ABOUTSWBL == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_howoreliq_info()
{
	AI_Output(other,self,"DIA_Viper_HOWORELIQ_01_00");	//Víš kdo mě může naučit těžit rudu?
	AI_Output(self,other,"DIA_Viper_HOWORELIQ_01_01");	//Snipes v tom byl celkem dobrej...

	if(Npc_KnowsInfo(other,dia_snipes_hallo))
	{
		AI_Output(self,other,"DIA_Viper_HOWORELIQ_01_02");	//To, ale sám víš...
	};

	AI_Output(other,self,"DIA_Viper_HOWORELIQ_01_03");	//A kdo umí tavit rudu?
	AI_Output(self,other,"DIA_Viper_HOWORELIQ_01_04");	//Hmm... (samolibě) V Hornickém údolí jsem byl jeden z nejlepších tavičů rudy!
	AI_Output(self,other,"DIA_Viper_HOWORELIQ_01_05");	//A mohu tě učit. Ne zdarma, samozřejmě.
	B_LogEntry(TOPIC_STEELDRAW,"Viper mě může naučit, jak tavit rudu. Snipes by zas mohl být schopen naučit mě ji těžit.");
};

instance DIA_VIPER_HOWORELIQ2(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_howoreliq2_condition;
	information = dia_viper_howoreliq2_info;
	permanent = TRUE;
	description = "Nauč mě tavit železnou rudu. (VB: 3, cena: 800 zlatých)";
};

func int dia_viper_howoreliq2_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_howoreliq) && (KNOWHOWTOOREFUS != TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_howoreliq2_info()
{
	var int kosten;
	var int money;
	AI_Output(other,self,"DIA_Viper_HOWORELIQ2_01_00");	//Nauč mě tavit železnou rudu.
	kosten = 3;
	money = 800;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Viper_HOWORELIQ2_03_90");	//Nemáš dost zlata. Přijď později.
		AI_StopProcessInfos(self);
	};

	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Viper_HOWORELIQ2_01_01");	//V tavící peci je to snadné, ale postačí i kovárna.
		AI_Output(self,other,"DIA_Viper_HOWORELIQ2_01_04");	//Budeš potřebovat aspoň padesát kusů rudy, roztavíš ji v peci a naleješ do formy.
		AI_Output(self,other,"DIA_Viper_HOWORELIQ2_01_05");	//A to je celé tajemství.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Tavení železné rudy");
		KNOWHOWTOOREFUS = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_STEELDRAW,"K přetavení železné rudy na ingot potřebuji výheň a padesát kusů rudy.");
	};
};

instance DIA_VIPER_MAGICOREMAKE(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_MAGICOREMAKE_condition;
	information = dia_viper_MAGICOREMAKE_info;
	permanent = TRUE;
	description = "A co tavení magické rudy?";
};

func int dia_viper_MAGICOREMAKE_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_howoreliq) && (KNOWHOWTOOREFUS == TRUE) && (ViperTeachMagicOre == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_MAGICOREMAKE_info()
{
	AI_Output(other,self,"DIA_Viper_MAGICOREMAKE_01_01");	//A co tavení magické rudy?

 	if((MIS_VIPERNUGGETS == LOG_SUCCESS) || (VIPERGETNUGGETS == TRUE))
	{
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_02");	//Hmmm... (zamyšleně) To už je obtížnější.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_03");	//Pokud je mi známo, tajemství tavení magické rudy znají pouze kováři z Nordmaru!
		AI_Output(other,self,"DIA_Viper_MAGICOREMAKE_01_04");	//To jsi mě uklidnil.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_05");	//Ale máš štěstí... (usmívá se) Za dlouhá léta strávená v kolonii jsem se také něco naučil.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_06");	//Né nadarmo jsem byl považován za nejlepšího taviče v Hornickém údolí!
		AI_Output(other,self,"DIA_Viper_MAGICOREMAKE_01_07");	//A můžeš mě to naučit?
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_08");	//Samozřejmě.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_09");	//Zlato si od tebe za to nevezmu. Naučím tě to, protože jsi starý přítel.
		B_LogEntry(TOPIC_STEELDRAW,"Viper mě může naučit, jak tavit magickou rudu.");
		ViperTeachMagicOre = TRUE;
	}
	else if((MIS_VIPERNUGGETS == LOG_RUNNING) && (VIPERGETNUGGETS == FALSE))
	{
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_10");	//Nejdřív musíš donést rudu! 
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_11");	//Pak probereme to ostatní.
	}
	else
	{
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_12");	//(sarkasticky) Obávám se, že tady ti pomoct nedokážu. 
	};
};

instance DIA_VIPER_MAGICOREMAKE_TEACH(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_MAGICOREMAKE_TEACH_condition;
	information = dia_viper_MAGICOREMAKE_TEACH_info;
	permanent = TRUE;
	description = "Nauč mě tavit magickou rudu. (VB: 10)";
};

func int dia_viper_MAGICOREMAKE_TEACH_condition()
{
	if((ViperTeachMagicOre == TRUE) && (PlayerRudoplav == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_MAGICOREMAKE_TEACH_info()
{
	var int kosten;

	kosten = 10;

	AI_Output(other,self,"DIA_Viper_MAGICOREMAKE_TEACH_01_00");	//Nauč mě tavit magickou rudu.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= kosten)
	{
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_01");	//Proces tavení magické rudy je celkem složitý...
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_02");	//V prosté kovářské výhni se dá vyrobit jenom obyčejný rudný ingot.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_03");	//Myslím, že k tomu účelu postačí padesát kusů rudy.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_04");	//Co se týče výrobního procesu, probíhá v několika fázích.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_05");	//Ze začátku pomalu tavíš magickou rudu. Ale ne zas příliš pomalu!
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_06");	//Pak se musí nechat odplavit různé nečistoty. Čím důkladněji tím lépe...
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_07");	//Potom sléváš výsledný produkt do formy a necháš pomalu zchladnout.
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_TEACH_01_08");	//To je vše. Doufám, že sis to pořádně zapamatoval.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Naučeno: Tavení magické rudy");
		PlayerRudoplav = TRUE;
		Snd_Play("LevelUP");

		if(ORE_TOPIC_EXIST != TRUE)
		{
			Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
			ORE_TOPIC_EXIST = TRUE;
		};

		B_LogEntry(TOPIC_MAGICORE,"Nyní umím vyrobit z magické rudy ingoty. Pro výrobu ingotů potřebuji výheň a padesát kusů magické rudy.");
	};
};

instance DIA_VIPER_CLEARMAGICOREMAKE(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_CLEARMAGICOREMAKE_condition;
	information = dia_viper_CLEARMAGICOREMAKE_info;
	permanent = FALSE;
	description = "A jak získám ingot z čisté magické rudy?";
};

func int dia_viper_CLEARMAGICOREMAKE_condition()
{
	if((KNOW_NIMROD_MAKE == TRUE) && (PlayerRudoplav == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_CLEARMAGICOREMAKE_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Viper_CLEARMAGICOREMAKE_01_01");	//A jak získám ingot z čisté magické rudy?
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_02");	//Hmm... (zamyšleně) vytvoření takového ingotu vyžaduje mnohem sofistikovanější přístup.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_03");	//Budeš potřebovat speciální pec, kde budeš muset stále sledovat nahřátí rudy.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_04");	//Nejdůležitější věc v tomto procesu je udržování velmi vysoké teploty a ta nesmí poklesnout.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_05");	//Nevím, jestli se na tomto ostrově taková pec nachází. 
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_06");	//Ale myslím, že s tím si musíš poradit sám.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_07");	//Kromě toho, na výrobu takových ingotů potřebuješ spoustu rudy.
	AI_Output(other,self,"DIA_Viper_CLEARMAGICOREMAKE_01_08");	//Kolik?
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_09");	//Průměrně sto kusů rudy! (vážně) Ne méně...
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_10");	//A kromě toho musíš pracovat s nástroji ze stejného materiálu jako je ingot.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_11");	//Jinak může dojít ke ztrátě magických vlastností.
	AI_Output(self,other,"DIA_Viper_CLEARMAGICOREMAKE_01_12");	//Zbytek procesu je podobný jako u obyčejného magického ingotu. Hlavní je pečlivost a přesnost!
	AI_Output(other,self,"DIA_Viper_CLEARMAGICOREMAKE_01_13");	//Rozumím.
	ClearPlayerRudoplav = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"K výrobě ingotu z čisté magické rudy potřebuji sto kusů rudy, speciální tavící pec a nástroje ze stejného materiálu jako je ingot.");

	if((KELIOSFIRETESTONETIME == TRUE) && (KELIOSFIRETESTFROMNW == TRUE))
	{
		Wld_SendTrigger("EVT_FIRECAVEMOVE_TRG");
		OpenFireCaveAgain_CZ = TRUE;
	};
};

instance DIA_VIPER_ASKMINEDATA(C_Info)
{
	npc = vlk_986_viper;
	nr = 7;
	condition = dia_viper_askminedata_condition;
	information = dia_viper_askminedata_info;
	permanent = FALSE;
	description = "V dole při Onarově farmě je stále ruda.";
};

func int dia_viper_askminedata_condition()
{
	if((MIS_DTOLDNEWMINE == LOG_Running) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_askminedata_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_VIPER_AskMineData_01_01");	//V opuštěném dole při Onarově farmě se mi podařilo najít magickou rudu.
	AI_Output(other,self,"DIA_VIPER_AskMineData_01_02");	//Mohl by ses tam jít podívat, jestli by z toho mohlo něco být?
	AI_Output(self,other,"DIA_VIPER_AskMineData_01_03");	//Ruda? Tady v Khorinisu?
	AI_Output(other,self,"DIA_VIPER_AskMineData_01_04");	//Přesně. Potřebuji vědět, zda se tam vyplatí začít těžit, anebo ne.
	AI_Output(self,other,"DIA_VIPER_AskMineData_01_05");	//No, stále nemám co dělat... Tak se pojďme kouknout do toho tvého dolu.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
};

instance DIA_VIPER_GETMINEDATA(C_Info)
{
	npc = vlk_986_viper;
	nr = 7;
	condition = dia_viper_getminedata_condition;
	information = dia_viper_getminedata_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_viper_getminedata_condition()
{
	if((MIS_DTOLDNEWMINE == LOG_Running) && (Npc_KnowsInfo(other,dia_viper_askminedata) == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_13") < 500) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_getminedata_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_01");	//Jsme na místě.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_02");	//Jen tato jedna šachta? A to je všechno?
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_03");	//A co jsi čekal?
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_05");	//Určitě nic jako Starý důl, ale tohle...
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_06");	//Uh huh.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_07");	//No, vypadá to, že bys odtud mohl dostat tak deset beden.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_08");	//Pokud půjdeš hlouběji do jádra - a soudě dle žíly, možná i více.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_09");	//Kvalita by neměla být horší od té z Hornického údolí.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_10");	//Celkově si myslím, že bys to měl zkusit.
	AI_Output(self,other,"DIA_VIPER_GetMineData_01_11");	//Jen by mě zajímalo, kde máš v plánu sehnat kopáče.
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_02");	//A co ty? Těžení rudy určitě není tvoje specialita, ale nechceš si to aspoň zkusit?
	AI_Output(other,self,"DIA_VIPER_GetMineData_01_03");	//Ne, díky.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	SearchOreMine = TRUE;
	B_LogEntry(TOPIC_DTOLDNEWMINE,"Viper věří, že bych z tohoto místa mohl vytěžit vcelku dost rudy. To znamená, že potřebujeme zkušené kopáče.");

	if(MIS_VIPERNUGGETS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_VIPER_GetMineData_01_14");	//Na co by mi to všechno bylo? Teď když jsi mi dal rudu, nějakou dobu nebudu muset pracovat.
		Info_ClearChoices(DIA_VIPER_GetMineData);

		// if(RhetorikSkillValue[1] >= 45)
		// {
			Info_AddChoice(DIA_VIPER_GetMineData,
				ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 45, TRUE), "(zkusit přesvědčit)"),
				// "(zkusit přesvědčit)",
				DIA_VIPER_GetMineData_Yes);
		// };

		Info_AddChoice(DIA_VIPER_GetMineData,"Zkusím teda najít někoho jiného.",DIA_VIPER_GetMineData_No);
	}
	else
	{
		B_GivePlayerXP(400);
		AI_Output(self,other,"DIA_VIPER_GetMineData_01_15");	//A kolik mi budeš platit? A co jídlo a přístřeší?
		AI_Output(other,self,"DIA_VIPER_GetMineData_15_16");	//Jako platbu si můžeš nechat třetinu vytěžené rudy.
		AI_Output(other,self,"DIA_VIPER_GetMineData_15_17");	//Žít budeš tu v mojí věži. Co na to říkáš?
		AI_Output(self,other,"DIA_VIPER_GetMineData_01_18");	//To zní dobře. Souhlasím.
		self.npcType = NPCTYPE_FRIEND;
		self.aivar[AIV_ToughGuy] = TRUE;
		self.aivar[AIV_IGNORE_Theft] = TRUE;
		self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
		self.aivar[AIV_IgnoresArmor] = TRUE;
		VIPERRECRUITEDDT = TRUE;
	
		if(DT_OREGATHER_START == FALSE)
		{
			DT_OREGATHER_START = TRUE;
			EVERYDAYDTORE = Wld_GetDay();
		};
		
		B_LogEntry(TOPIC_PPL_FOR_TOWER,"Přesvědčil jsem Vipera, aby pro mě pracoval v dole.");
		B_LogEntry(TOPIC_DTOLDNEWMINE,"Viper souhlasil, že bude pracovat v dole, ale sám moc rudy nevytěží. Měl bych sehnat víc lidí.");
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"InTower");
	};
};

func void DIA_VIPER_GetMineData_yes()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_00");	//Dříve nebo později se budeš muset vrátit do práce.
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_01");	//A co budeš dělat potom? Vyhazovače u Kardifa? Na farmě?
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_02");	//Nebo se vrátíš do Hornického údolí?
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_03");	//Vždy budeš mít dost času rudu zužitkovat. Já ti nabízím slušnou práci, střechu nad hlavou a jídlo.
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_04");	//Navíc si budeš moci nechat třetinu rudy, kterou vytěžíš.
	AI_Output(other,self,"DIA_VIPER_GetMineData_yes_15_05");	//Jsi si jistý, že chceš odmítnout? Druhá šance už nebude.
	AI_Output(self,other,"DIA_VIPER_GetMineData_yes_01_06");	//Když to povíš takhle...
	AI_Output(self,other,"DIA_VIPER_GetMineData_yes_01_10");	//Tak dobře. Jsem tvůj člověk!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	VIPERRECRUITEDDT = TRUE;

	if(DT_OREGATHER_START == FALSE)
	{
		DT_OREGATHER_START = TRUE;
		EVERYDAYDTORE = Wld_GetDay();
	};

	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Přesvědčil jsem Vipera, aby pro mě pracoval v dole.");
	B_LogEntry(TOPIC_DTOLDNEWMINE,"Viper souhlasil, že bude pracovat v dole, ale sám moc rudy nevytěží. Měl bych sehnat víc lidí.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

func void DIA_VIPER_GetMineData_no()
{
	AI_Output(other,self,"DIA_VIPER_GetMineData_no_15_00");	//Tak já zkusím najít někoho jiného.
	AI_Output(self,other,"DIA_VIPER_GetMineData_no_01_01");	//Hodně štěstí.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_VIPER_INTOWER(C_Info)
{
	npc = vlk_986_viper;
	nr = 22;
	condition = dia_viper_intower_condition;
	information = dia_viper_intower_info;
	permanent = TRUE;
	description = "Hej Vipere! Jak to jde?";
};

func int dia_viper_intower_condition()
{
	if((VIPERRECRUITEDDT == TRUE) && (MIS_VIPERNUGGETS != LOG_Running))
	{
		return TRUE;
	};
};

func void dia_viper_intower_info()
{
	AI_Output(other,self,"DIA_Viper_HelloAfter_01_00");	//Hej Vipere! Jak to jde?
	AI_Output(self,other,"DIA_Viper_HelloAfter_01_01");	//Všechno v pohodě!
};
