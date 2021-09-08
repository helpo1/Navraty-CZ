
instance DIA_HARUM_EXIT(C_Info)
{
	npc = vlk_6020_harum;
	nr = 999;
	condition = dia_harum_exit_condition;
	information = dia_harum_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_harum_exit_condition()
{
	return TRUE;
};

func void dia_harum_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARUM_HELLO(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_condition;
	information = dia_harum_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Ty jsi Elvais?";
};


func int dia_harum_hello_condition()
{
	if((MEETHARUM == FALSE) && (KNOWABELV == TRUE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_info()
{
	AI_Output(other,self,"DIA_Harum_Hello_01_00");	//Ty jsi Elvais?
	AI_Output(self,other,"DIA_Harum_Hello_01_01");	//Říkají mi tak.
	AI_Output(self,other,"DIA_Harum_Hello_01_03");	//Ty jsi pravděpodobne poutník osudu, který přišel do naší zeme. Dyugo mi o tobe řekl.
	AI_Output(self,other,"DIA_Harum_Hello_01_04");	//Všiáchni o tobě mluví. Pro mnohé jsi svetlo, které nás vyvede z temnoty.
	AI_Output(self,other,"DIA_Harum_Hello_01_13");	//Ale můžu říci, že i jiní čekali na tvůj příchod...
	AI_Output(self,other,"DIA_Harum_Hello_01_14");	//... Mluví se o tobě v faliante Humgata.
	AI_Output(other,self,"DIA_Harum_Hello_01_15");	//Faliantě Humgata?!
	AI_Output(self,other,"DIA_Harum_Hello_01_16");	//Ano... Asi toho o historii tohoto místa moc nevíš. To napravíme.
	AI_Output(self,other,"DIA_Harum_Hello_01_18");	//Pak začneme... (...) Kdysi dávno toto místo nebylo takové, jak ho vidíš dnes.
	AI_Output(self,other,"DIA_Harum_Hello_01_20");	//Ale stále se máš co učit... Toto místo bylo známo jako Kalimdor - Posvátné síně Humgata.
	AI_Output(self,other,"DIA_Harum_Hello_01_21");	//O těch časech a lidech, kteří zde žili toho mnoho nevíme. Tyto vedomosti byly ztraceny navždy.
	AI_Output(self,other,"DIA_Harum_Hello_01_22");	//Ale některé informace zůstaly průbehem času zachovány.
	AI_Output(self,other,"DIA_Harum_Hello_01_23");	//Jsou to jen malé úlomky z časů, kdy v údolí nastal bod zlomu, která vše změnil.
	AI_Output(self,other,"DIA_Harum_Hello_01_26");	//V jedné části Kalimdora byla skryta legenda.
	AI_Output(other,self,"DIA_Harum_Hello_01_28");	//A co je to za legendu?
	AI_Output(self,other,"DIA_Harum_Hello_01_29");	//Legenda o mocném artefaktu, který může tuto zemi uvrhnout v chaos.
	AI_Output(self,other,"DIA_Harum_Hello_01_30");	//Artefakt nese jméno Oko hněvu.
	AI_Output(self,other,"DIA_Harum_Hello_01_31");	//Legenda říká, že ten, kdo probudí Oko - probudí také velké zlo.
	AI_Output(self,other,"DIA_Harum_Hello_01_32");	//... Povstane Velký Stín, aby ustonavil svou říši...
	AI_Output(self,other,"DIA_Harum_Hello_01_33");	//Ale není jisté, jestli ho probudí Oko samotné - lidé z Kalimdoru nezacházeli do podrobností.
	AI_Output(other,self,"DIA_Harum_Hello_01_34");	//A co se stalo s Kalimdorem?!
	AI_Output(self,other,"DIA_Harum_Hello_01_35");	//Podle knih ho se zemí srovnal příval skřetů.
	AI_Output(self,other,"DIA_Harum_Hello_01_36");	//Vše spálili a jen malé skupinky uprchlíků přežily.
	AI_Output(self,other,"DIA_Harum_Hello_01_38");	//Ale kromě legendy je tu další zajímavá vec.
	AI_Output(self,other,"DIA_Harum_Hello_01_40");	//Podle legend přijde válečník, který bude schopen zahnat Velký Stín.
	AI_Output(self,other,"DIA_Harum_Hello_01_41");	//... A na zlomku časů, kdy poslední naděje na záchranu lidstva budou ztraceny...
	AI_Output(self,other,"DIA_Harum_Hello_01_42");	//... Se zjevý Obránce, aby jednal proti temnotě...
	AI_Output(self,other,"DIA_Harum_Hello_01_43");	//... Povede přežívší proti zlua zničí Velký Stín...
	AI_Output(self,other,"DIA_Harum_Hello_01_44");	//... Dostane jméno Poutník Osudu...
	AI_Output(self,other,"DIA_Harum_Hello_01_45");	//No, to ještě úplne neznamená, že jsi ten z legendy.
	AI_Output(other,self,"DIA_Harum_Hello_01_47");	//Možná máš pravdu, Elvaisi...
	AI_Output(self,other,"DIA_Harum_Hello_01_48");	//Proč myslíš?!... (zmateně)
	AI_Output(other,self,"DIA_Harum_Hello_01_49");	//Protože jsem tu proto, abych zničil jisté zlo...
	AI_Output(other,self,"DIA_Harum_Hello_01_50");	//Slyšel jsem, že v údolí žije mocný černý drak. Říká ti něco jméno Azgalor?
	AI_Output(self,other,"DIA_Harum_Hello_01_51");	//(v hrůze) Azgalor?! Legendy o tomto stvoření leží daleko v dětství tohoto sveta.
	AI_Output(self,other,"DIA_Harum_Hello_01_52");	//V knize Kalidroma je podobné stvoření zmíněno.
	AI_Output(self,other,"DIA_Harum_Hello_01_53");	//Ale nikdo ho zde nikdy neviděl. Ale spíše je pravdepodobné, že nikdo nepřežil setkání s ním.
	AI_Output(self,other,"DIA_Harum_Hello_01_54");	//Ale nemůžu ti přesně povedet, jestli je to opravdu jenom mýtus.
	if(MIS_URNAZULRAGE == LOG_Running)
	{
		B_LogEntry(TOPIC_URNAZULRAGE,"Elvais mi řekl o mocném artefaktu známem jako Oko hněvu. Pravdepodobne nejak souvisí s návratem Azgalora do údolí.");
	};
	MEETHARUM = TRUE;
};


instance DIA_HARUM_HELLO_TWO(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_two_condition;
	information = dia_harum_hello_two_info;
	permanent = TRUE;
	important = FALSE;
	description = "Myslím, že Azgalor není mýtus.";
};


func int dia_harum_hello_two_condition()
{
	if((MEETHARUM == TRUE) && (MEETHARUMONE == FALSE) && (MIS_URNAZULRAGE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_harum_hello_two_info()
{
	var C_Item heroweapon;
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_01");	//Myslím, že Azgalor není mýtus.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_02");	//Jak to můžeš vědet?!... (udivene)
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_03");	//Potkal jsem se s někým, kdo tvrdí, že ho videl.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_04");	//Ale to není možné. Je to už celé tisíciletí, co upadl do temnoty!
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_05");	//Kdo je to?!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_06");	//Skřeti!
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_07");	//Skřeti!... (s hrůzou) Ale ti už také v tomto údolí nebyli dlouho spatřeni. Ne živí.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_08");	//A ajk já vím, nejsou to zrovna přátelská stvoření - nemyslím, že by mluvili s člověkem.
	if(Npc_HasItems(hero,itmw_2h_orcprestige) >= 1)
	{
		heroweapon = Npc_GetEquippedMeleeWeapon(hero);
		if(Hlp_IsItem(heroweapon,itmw_2h_orcprestige) == TRUE)
		{
			AI_ReadyMeleeWeapon(other);
			AI_Output(other,self,"DIA_Harum_Hello_Two_01_10");	//Ten divný předmět, ano, to je skřetí práce!
			AI_Output(other,self,"DIA_Harum_Hello_Two_01_11");	//Pro skřety je to talisman přátelství a síly. Nikdy nenapadnou jeho nositele.
			AI_RemoveWeapon(other);
		};
	};
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_12");	//Portál, kterým jsem se zde dostal, stojí v podzemním měste skřetů.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_13");	//Jo, Dyugo mi něco říkal.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_14");	//Tam jsem potkal toho skřeta, který mi o Azgalorovi řekl.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_22");	//Ur-Thrall mi řekl, že ve skutečnosti Azgalorovi slouží jeden mocný démon. Skřeti mu říkají Kovář Duší.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_23");	//Zjistili to z jeho démonické podstaty!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_24");	//A když ochutnali jeho krev, pomátli se a začali zabíjet vše živé.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_27");	//Nemohli vzdorovat.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_28");	//Dal jim velkou sílu, ale sebral veškerou vůli.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_29");	//Po té, co už žádný skřet neovládal své myšlení, uvrhli údolí v potopu krve!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_30");	//Démon pak jen vzal oběti a donesl je jako obětinu Azgalorovi.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_31");	//Kovář Duší se vrátil odkud přišel a nechal za sebou spousty nemrtvých, které můžeš vidět kolem.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_32");	//Takže Kalidmor byl navž...
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_33");	//Prokletí skřeti! Bez nich by svět byl lepší... (agresivne)
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_34");	//Byli pouze nástrojem, nemohli za to.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_35");	//Ale pak padlo prokletí na všechny obyvatele údolí...
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_36");	//Jak?!... (nechápavě)
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_37");	//Skřeti po potocích krve už nechtěli bojovat.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_39");	//Ale krev démona v jejich žilách je nutila zabíjet znovu a znovu.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_40");	//Dohodli se, že už démona nebudou poslouchat.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_42");	//Pak Azgalor pozvedl armádu nemrtvých a Kováře Duší postavil do jejího čela...
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_45");	//Skřeti bojovali zuřivě a dovedne, ale nepřátel bylo příliš mnoho.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_46");	//I přesto ale skřeti armádu porazili a Kováře Duší zahnali. Ale zaplatili za svou svobodu velkou cenu.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_48");	//Drak proklel každého, kdo prolil krev jeho armády. Z prokletých se stali fantomové a jejich duše jsou vězněny Azgalorem.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_49");	//Jen Ur-Thrall se odsud dokázal dostat.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_51");	//To je vše, co mi řekl.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_52");	//Tak to opravdu bylo?!... Skřeti mě nekdy překvapují!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_53");	//Jediné, co chtějí, je pomsta Azgalorovi.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_56");	//A on ti řekl, abys to udělal?!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_57");	//Máme jednu dohodu.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_58");	//Jestli zabiju Azgalora, možná vás odsud budu moci dostat.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_61");	//Opravdu?
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_64");	//Ale skřeti... Můžeme jim věřit?!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_65");	//Ano. Jsou to bestie, ale slovo čest pro ně není prázdná fráze.
	B_LogEntry(TOPIC_HUMANINVALLEY,"Řekl jsem Elvaisovi vše, co mi řekl Ur-Thrall. Napadlo mě jak pomoci temto lidem z údolí. Jestli zabiju Azgalora, Ur-Thrall by mohl nechat lidi projít skřetím mestem do Khorinisu.");
	MEETHARUMONE = TRUE;
};


instance DIA_HARUM_HELLO_THREE(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_three_condition;
	information = dia_harum_hello_three_info;
	permanent = FALSE;
	important = FALSE;
	description = "Odkud máš ty knihy?!";
};


func int dia_harum_hello_three_condition()
{
	if((MEETHARUMTWO == FALSE) && (MEETHARUMONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_three_info()
{
	AI_Output(other,self,"DIA_Harum_Hello_Three_01_01");	//Odkud máš ty knihy?!
	AI_Output(self,other,"DIA_Harum_Hello_Three_01_02");	//Ruen jednou při svých cestách našel malou jeskyni, ve které byla knihovna.
	AI_Output(self,other,"DIA_Harum_Hello_Three_01_03");	//Utíkal co mohl, v té jeskyni byli nemrtví.
	AI_Output(self,other,"DIA_Harum_Hello_Three_01_04");	//Ale cestou stihl popadnout pár knih pro mne.
	B_LogEntry(TOPIC_URNAZULRAGE,"Elvais zmínil jednu kryptu, ve který má být knihovna. Možná tam najdu své odpovědi, ale jsou tam nemrtví.");
	MEETHARUMTWO = TRUE;
};


instance DIA_HARUM_HELLO_FOUR(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_four_condition;
	information = dia_harum_hello_four_info;
	permanent = FALSE;
	important = FALSE;
	description = "Můžeš mi říci něco o Oku hněvu?";
};


func int dia_harum_hello_four_condition()
{
	if((MEETHARUMTHREE == FALSE) && (MEETHARUMONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_four_info()
{
	AI_Output(other,self,"DIA_Harum_Hello_Four_01_01");	//Můžeš mi říci něco o Oku hněvu?
	AI_Output(self,other,"DIA_Harum_Hello_Four_01_02");	//Nic víc, než jsem ti řekl.
	AI_Output(self,other,"DIA_Harum_Hello_Four_01_04");	//Měl bys odpovedi hledat mimo tuto jeskyni.
	AI_Output(self,other,"DIA_Harum_Hello_Four_01_05");	//Nebo se zeptat ostatních.
	MEETHARUMTHREE = TRUE;
};


instance DIA_HARUM_HELLO_FIVE(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_five_condition;
	information = dia_harum_hello_five_info;
	permanent = TRUE;
	important = FALSE;
	description = "Říkal jsi, že jsi zde někde videl skřety.";
};


func int dia_harum_hello_five_condition()
{
	if((MEETHARUMFOUR == FALSE) && (MEETHARUMONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_five_info()
{
	AI_Output(other,self,"DIA_Harum_Hello_Five_01_01");	//Říkal jsi, že jsi zde někde videl skřety.
	AI_Output(self,other,"DIA_Harum_Hello_Five_01_02");	//Zeptej se Emnola, ten s tím přišel první.
	AI_Output(self,other,"DIA_Harum_Hello_Five_01_03");	//Kde je viděl, to nevím.
	MEETHARUMFOUR = TRUE;
};


instance DIA_HARUM_HELLO_SIX(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_six_condition;
	information = dia_harum_hello_six_info;
	permanent = TRUE;
	important = FALSE;
	description = "Je po drakovi.";
};


func int dia_harum_hello_six_condition()
{
	if((BLKDRAGNISDEAD == TRUE) && (CURSEISENDHUMAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_six_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Harum_Hello_Six_01_01");	//Je po drakovi.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_02");	//Tak to jsou nejlepší zprávy, které jsi mohl donést.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_03");	//Jeho řev byl slyšet po celém údolí!
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_05");	//Vědel jsem... Vedel jsem, že ty jsi TEN muž z legendy.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_07");	//Legenda nelhala! Všechny jsi nás zachránil!
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_08");	//Co budeš dělat nyní?
	AI_Output(other,self,"DIA_Harum_Hello_Six_01_09");	//Půjdu si svou cestou. Slíbil jsem ti, že ti pomůžu z údolí.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_10");	//No, zlo je zažehnáno, takže zde můžeme zůstat.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_11");	//Myslím, že ostatí nebudou proti!
	AI_Output(other,self,"DIA_Harum_Hello_Six_01_12");	//Ale co skřeti?
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_13");	//Skřeti?!
	if(MEETURGROM > 0)
	{
		AI_Output(other,self,"DIA_Harum_Hello_Six_01_14");	//Ano, kletba zmizela a nyní je údolí zase v jejich moci.
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_15");	//Zase ti skřeti! Po těch všech letech se zase schovávat a bojovat o své životy?!
		AI_Output(other,self,"DIA_Harum_Hello_Six_01_16");	//No, jestli se ti chce odejít, můžu to zkusit domluvit s vůdcem skřetů z údolí, odkud jsem přišel.
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_19");	//Trochu jsi mě zaskočil... Ale... (tajemne)
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_23");	//Hodně štěstí!
		B_LogEntry(TOPIC_HUMANINVALLEY,"Elvais a ostatní nechtěli opustit údolí. Ale já myslím, že by meli. Po pádu kletby se zase začne hemžit skřety. Mel bych promluvit s Ur-Gromem, koneckonců, nyní je vůdcem on.");
	}
	else
	{
		AI_Output(other,self,"DIA_Harum_Hello_Six_01_24");	//Skřeti se budou chtít vrátit.
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_25");	//To zase budeme bojovat o holé životy?!
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_27");	//Budeme to muset nějak vyřešit.
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_29");	//Hodně štěstí!
		B_LogEntry_Failed(TOPIC_HUMANINVALLEY);
	};
	Npc_ExchangeRoutine(orc_8565_urgrom,"HomeUrGrom");
	CURSEISENDHUMAN = TRUE;
};


instance DIA_HARUM_HELLO_SEVEN(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_seven_condition;
	information = dia_harum_hello_seven_info;
	permanent = TRUE;
	important = FALSE;
	description = "Skřeti tě nechají projít.";
};


func int dia_harum_hello_seven_condition()
{
	if((SAVEHUMAN == TRUE) && (SAVEHUMANEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_seven_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Harum_Hello_Seven_01_01");	//Skřeti tě nechají projít! Dohodl jsem se s jejoch vůdcem, můžete odejít.
	AI_Output(self,other,"DIA_Harum_Hello_Seven_01_02");	//Udělal jsi pro nás hodne, cizinče, ale nemáme ti jak podekovat.
	AI_Output(self,other,"DIA_Harum_Hello_Seven_01_03");	//Ale počkat... Pár dní zpátky našel Bagrus tuto zvláštní tabulku.
	AI_Output(self,other,"DIA_Harum_Hello_Seven_01_04");	//Číší z ní magie, ale nevím jak ji využít.
	AI_Output(self,other,"DIA_Harum_Hello_Seven_01_05");	//Jsem si ale jistý, že ty na to přijdeš!
	B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
	SAVEHUMANEND = TRUE;
	B_LogEntry(TOPIC_HUMANINVALLEY,"Dohodl jsem průchod lidí skřetím městem. Je už všemu konec?");
	MIS_SAVEHUMANEND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HUMANINVALLEY,LOG_SUCCESS);
};


instance DIA_HARUM_SEEKAZGOLOR(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_seekazgolor_condition;
	information = dia_harum_seekazgolor_info;
	permanent = TRUE;
	important = FALSE;
	description = "Můžeš se podívat na tuhle knihu?";
};


func int dia_harum_seekazgolor_condition()
{
	if((SEEKAZGOLOR == TRUE) && (READ_AZGOLOR == FALSE) && (Npc_HasItems(other,itwr_azgolor) >= 1))
	{
		return TRUE;
	};
};

func void dia_harum_seekazgolor_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Harum_SeekAzgolor_01_01");	//Můžeš se podívat na tuhle knihu?
	AI_Output(self,other,"DIA_Harum_SeekAzgolor_01_02");	//Ukaž... (dívá se) Zajímavé, velice zajímavé!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Harum_SeekAzgolor_01_03");	//Divná kniha a stejně tak jazyk. (dívá se) Připomíná skřetí jazyk, ale je trochu jiný.
	AI_Output(self,other,"DIA_Harum_SeekAzgolor_01_04");	//Hmm... Bojím se, že ti nemůžu pomoci.
	B_LogEntry(TOPIC_URNAZULRAGE,"Elvais nebyl schopen přeložit knihu, kterou jsem v ruinách našel, ale dokázal identifikovat skřetí jazyk. Měl bych se podívat po nejakém skřetovi.");
	SEEKAZGOLOR = FALSE;
};