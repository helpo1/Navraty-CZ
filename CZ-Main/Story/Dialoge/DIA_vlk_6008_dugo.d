
instance DIA_DUGO_EXIT(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 999;
	condition = dia_dugo_exit_condition;
	information = dia_dugo_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dugo_exit_condition()
{
	return TRUE;
};

func void dia_dugo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DUGO_HELLO(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_condition;
	information = dia_dugo_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dugo_hello_condition()
{
	return TRUE;
};

func void dia_dugo_hello_info()
{
	AI_Output(self,other,"DIA_Dugo_Hello_01_00");	//Nevěřím vlastním očím! Odkud...? (překvapeně)... Jak ses sem dostal?!
	AI_Output(other,self,"DIA_Dugo_Hello_01_01");	//Prošel jsem skrz portál nad pyramidou. Proč tě to tak udivuje?
	AI_Output(self,other,"DIA_Dugo_Hello_01_03");	//Za celý čas jsi první, co se zatoulal do těchhle bohem zapomenutých končin...
};


instance DIA_DUGO_HELLO_TWO(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_two_condition;
	information = dia_dugo_hello_two_info;
	permanent = TRUE;
	important = FALSE;
	description = "Kdo jsi a co je toto za místo?";
};


func int dia_dugo_hello_two_condition()
{
	if(DUGOMEET == 0)
	{
		return TRUE;
	};
};

func void dia_dugo_hello_two_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Two_01_00");	//Kdo jsi a co je toto za místo?
	AI_Output(self,other,"DIA_Dugo_Hello_Two_01_01");	//Jmenuji se Dyugo. A všechno, co kolem vidíš, je Údolí stínů...
	AI_Output(self,other,"DIA_Dugo_Hello_Two_01_02");	//A říkám ti to přímo, chlape. Přišel jsi do pekla!
	AI_Output(self,other,"DIA_Dugo_Hello_Two_01_03");	//Tohle údolí je prokleté! Všude kolem jsou zlí duchové a ještě horší monstra...
	AI_Output(self,other,"DIA_Dugo_Hello_Two_01_04");	//A v noci je lepší velmi se tu nepotulovat - riskuješ svůj život.
	DUGOMEET = 1;
};


instance DIA_DUGO_HELLO_THREE(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_three_condition;
	information = dia_dugo_hello_three_info;
	permanent = TRUE;
	important = FALSE;
	description = "Řekni mi o tomhle údolí.";
};


func int dia_dugo_hello_three_condition()
{
	if(DUGOMEET == 1)
	{
		return TRUE;
	};
};

func void dia_dugo_hello_three_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Three_01_15");	//Řekni mi o tomhle údolí.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_00");	//Néže by toho bylo mnoho co říct...
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_01");	//(povzdechne si)... Kdysi dávno bylo jedno krásné se zelenými loukami a zelenými lesy pod krásnými horami.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_02");	//Teď už zbyly jenom vzpomínky.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_03");	//Zůstala jenom spálená zem pokrytá sazí. Všechno je poznačené bolestí a strachem.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_04");	//Věř mi, nic kromě smrti tu nenajdeš.
	AI_Output(other,self,"DIA_Dugo_Hello_Three_01_05");	//A co se stalo?
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_06");	//Přišlo zlo... Strašné zlo! Tak strašné, že to nejde ani pojmenovat.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_08");	//Říká se, že to tady ovládá nějaké strašné monstrum!
	AI_Output(other,self,"DIA_Dugo_Hello_Three_01_09");	//Není to náhodou drak?
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_10");	//Netuším. Může to být drak, i nemusí. Nikdo neví.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_11");	//Vím jenom, že nemnohým se podařilo zachránit se...
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_12");	//A i ti, kteří měli takové štěstí, jsou tady navždy uvězněni!... (povzdech)
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_14");	//Nemůžu ti říct nic víc. Pokud chceš vědět víc, měl by ses zeptat Elvaise.
	if(MIS_URNAZULRAGE == LOG_Running)
	{
		B_LogEntry(TOPIC_URNAZULRAGE,"Teleport při pyramidě mě zavedl do Údolí stínů. Střetl jsem tam lovce jménem Dyugo. Dle jeho slov je tohle místo naprosté peklo!");
	};
	DUGOMEET = 2;
};


instance DIA_DUGO_HELLO_FOUR(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_four_condition;
	information = dia_dugo_hello_four_info;
	permanent = TRUE;
	important = FALSE;
	description = "A nepřemýšlel jsi, jak se odtud dostat?";
};


func int dia_dugo_hello_four_condition()
{
	if((DUGOMEET == 2) && (DUGOMEETONE == 0))
	{
		return TRUE;
	};
};

func void dia_dugo_hello_four_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_01");	//A nepřemýšlel jsi, jak se odtud dostat?
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_03");	//Není žádná úniková cesta. Průsmyk v horách zasypaly skály při posledním zemětřesení.
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_04");	//Je tady už jenom ten teleportačný kámen v jeskyni...
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_05");	//Ale všechny naše pokusy aktivovat ho byli marné...
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_08");	//Až tak bych se netěšil.
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_11");	//Portál vede do místa plného skřetů a asi se z něj nedostanete živí.
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_13");	//Co?! Proboha, to byla naše poslední možnost úniku.
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_14");	//Ale jaks ty mohl mezi nimi projít?!... (nechápavě)
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_15");	//Já má skřetí talisman. Vyrobil mi ho jeden skřet, kterému jsem zachránil život.
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_16");	//Pro skřety je to znamení moci a přátelství. Respektují jeho majitele a nic by mu neprovedli.
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_17");	//ďábelské monstra
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_18");	//Hmm... Obávám se, že nemáme jinou možnost než se probít.
	DUGOMEETONE = 1;
};


instance DIA_DUGO_HELLO_FIVE(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_five_condition;
	information = dia_dugo_hello_five_info;
	permanent = TRUE;
	important = FALSE;
	description = "Elvais? Kdo je to?";
};


func int dia_dugo_hello_five_condition()
{
	if((DUGOMEET == 2) && (DUGOMEETTWO == 0))
	{
		return TRUE;
	};
};

func void dia_dugo_hello_five_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Five_01_01");	//Elvais? Kdo je to?
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_02");	//Elvais je něco jako stařešina v našem táboře. Ví mnoho a řekne ti mnoho.
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_04");	//Ta jeskyně za mnou je náš tábor. Tam se můžeš cítit v bezpečí!
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_05");	//Elvaise najdeš v jedné ze vzdálenějších jeskyň. Můžeš si promluvit i s ostatními dítky.
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_06");	//Někteří, jako Bagrus, jsou skvělými lovci. A jiní, jako Gunmar - nepoznám někoho, kdo by to s luky uměl líp.
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_07");	//Můžou tě to naučit!
	if(MIS_URNAZULRAGE == LOG_Running)
	{
		B_LogEntry(TOPIC_URNAZULRAGE,"Dyugo mi poradil promluvit si s Elvaisem, stařešinou tábora. Jak řekl, Elvais mi prozradí víc jako on. Možná mi taky řekne o černém draku. Elvaise můžu najít v jedné ze vzdálenějších jeskyň nalevo od vstupu do tábora.");
	};
	DUGOMEETTWO = 1;
	KNOWABELV = TRUE;
	Wld_InsertNpc(vlk_6020_harum,"SV_HUMAN_20");
};


instance DIA_DUGO_HELLO_SEVEN(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_seven_condition;
	information = dia_dugo_hello_seven_info;
	permanent = TRUE;
	important = FALSE;
	description = "Asi vám mohu pomoci.";
};


func int dia_dugo_hello_seven_condition()
{
	if((DUGOMEETONE == 1) && (MIS_URNAZULRAGE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_dugo_hello_seven_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_01");	//Asi vám mohu pomoci dostat se odtud.
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_02");	//Jenom blázen by se probíjel skrz hordy skřetů. Nemáte ani ponětí, kolik jich tam je!
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_03");	//Roztrhají vás na kousky než řeknete švec.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_04");	//Máš něco lepšího?
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_07");	//Záleží na úhlu pohledu. Pro začátek bych tady měl něco urovnat.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_08");	//A co by to mohlo být, v těchhle Innosem zapomenutých končinách?
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_10");	//Slyšel jsem, že tady žije mocný černý drak. Jmenuje se Azgalor.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_11");	//O něm jsem už slyšel. Evails o něm mluvil v jedné historce.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_12");	//Měl by sis s ním promluvit. Určitě o té kreatůre ví víc než já.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_14");	//A proč tě sakra zajímá?
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_15");	//Přišel jsem ho zabít.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_16");	//?!... Tedy, chlape, překvapuješ mě. Je to tvá věc, ale je to nebezpečné!
	Log_CreateTopic(TOPIC_HUMANINVALLEY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HUMANINVALLEY,LOG_Running);
	B_LogEntry(TOPIC_HUMANINVALLEY,"Asi bych mohl pomoct lidem tadý dostat se z tohto pekelného místa. Otázkou zůstáva, jak.");
	DUGOMEETONE = 2;
};

