
instance DIA_EMNOL_EXIT(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 999;
	condition = dia_emnol_exit_condition;
	information = dia_emnol_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_emnol_exit_condition()
{
	return TRUE;
};

func void dia_emnol_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EMNOL_HELLO(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 1;
	condition = dia_emnol_hello_condition;
	information = dia_emnol_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Jak to jde?";
};


func int dia_emnol_hello_condition()
{
	if(MEETEMNOL == FALSE)
	{
		return TRUE;
	};
};

func void dia_emnol_hello_info()
{
	AI_Output(other,self,"DIA_Emnol_Hello_01_01");	//Jak to jde?
	AI_Output(self,other,"DIA_Emnol_Hello_01_02");	//Hele, stůj!... Ty jsi ten týpek, co se tu nedávno objevil.
	AI_Output(other,self,"DIA_Emnol_Hello_01_03");	//... Vypadá to, žes o mě slyšel. Jsem hlavní témou rozhovoru, že, kamaráde?
	AI_Output(self,other,"DIA_Emnol_Hello_01_04");	//Vidím, žes na to přišel, kámo... Neber si to k srdci.
	AI_Output(self,other,"DIA_Emnol_Hello_01_05");	//Většinou se tu nic neděje... Nic.
	AI_Output(self,other,"DIA_Emnol_Hello_01_06");	//A pak se objevíš ty! Jasná věc, že to přitahuje pozornost.
	AI_Output(other,self,"DIA_Emnol_Hello_01_07");	//A co v táboře děláš?
	AI_Output(self,other,"DIA_Emnol_Hello_01_08");	//Jako všichni, obyčejně lovím. A jinak jsem v jeskyni.
	AI_Output(other,self,"DIA_Emnol_Hello_01_10");	//Řekni, nezahlédl jsi tady draka?
	AI_Output(self,other,"DIA_Emnol_Hello_01_11");	//... (vystrašeně) Žertuješ, kámo! Nikdy jsem takové monstrum neviděl...
	AI_Output(other,self,"DIA_Emnol_Hello_01_12");	//Fajn, promiň, že jsem se ptal.
	MEETEMNOL = TRUE;
};


instance DIA_EMNOL_HELLO_TEACH(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 1;
	condition = dia_emnol_hello_teach_condition;
	information = dia_emnol_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Slyšel jsem, že jsi dost silný.";
};


func int dia_emnol_hello_teach_condition()
{
	if((MEETEMNOL == TRUE) && (EMNOLTEACHER == TRUE) && (EMNOLREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_emnol_hello_teach_info()
{
	AI_Output(other,self,"DIA_Emnol_Hello_Teach_01_01");	//Slyšel jsem, že jsi silný, Emnole. Vypadáš ohromně!
	AI_Output(other,self,"DIA_Emnol_Hello_Teach_01_02");	//Já však ne. Mohl bys mě trénovat?
	AI_Output(self,other,"DIA_Emnol_Hello_Teach_01_03");	//Koukneme se... Nabrat svaly nikomu neublíží!
	AI_Output(self,other,"DIA_Emnol_Hello_Teach_01_04");	//Než začneme, měl bych ti něco říct. V tomhle údolí slaboch jen těžko přežije.
	AI_Output(self,other,"DIA_Emnol_Hello_Teach_01_05");	//Ty tak sice nevypadáš, ale nějaký trénink ti neuškodí.
	EMNOLREADYTEACH = TRUE;
};


var int emnol_merkestr;

instance DIA_EMNOL_TEACH(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 20;
	condition = dia_emnol_teach_condition;
	information = dia_emnol_teach_info;
	permanent = TRUE;
	description = "Začneme s tréninkem.";
};


func int dia_emnol_teach_condition()
{
	if((MEETEMNOL == TRUE) && (EMNOLREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_emnol_teach_info()
{
	AI_Output(other,self,"DIA_Emnol_Teach_01_01");	//Začneme s tréninkem.
	EMNOL_MERKESTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_emnol_teach);
	Info_AddChoice(dia_emnol_teach,Dialog_Back,dia_emnol_teach_back);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_emnol_teachstr_1);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_emnol_teachstr_5);
};

func void dia_emnol_teach_back()
{
	if(other.attribute[ATR_STRENGTH] > EMNOL_MERKESTR)
	{
		AI_Output(self,other,"DIA_Emnol_Teach_Back_01_01");	//Tak, mnohem lepší. Jsi silnější!
	};
	Info_ClearChoices(dia_emnol_teach);
};

func void dia_emnol_teachstr_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_emnol_teach);
	Info_AddChoice(dia_emnol_teach,Dialog_Back,dia_emnol_teach_back);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_emnol_teachstr_1);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_emnol_teachstr_5);
};

func void dia_emnol_teachstr_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_emnol_teach);
	Info_AddChoice(dia_emnol_teach,Dialog_Back,dia_emnol_teach_back);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_emnol_teachstr_1);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_emnol_teachstr_5);
};


instance DIA_EMNOL_HELLO_ORK(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 1;
	condition = dia_emnol_hello_ork_condition;
	information = dia_emnol_hello_ork_info;
	permanent = TRUE;
	important = FALSE;
	description = "zeptat se na skřety.";
};


func int dia_emnol_hello_ork_condition()
{
	if((MEETEMNOL == TRUE) && (MEETHARUMFOUR == TRUE) && (EMNOLORKKNOWN == FALSE))
	{
		return TRUE;
	};
};

func void dia_emnol_hello_ork_info()
{
	AI_Output(other,self,"DIA_Emnol_Hello_Ork_01_01");	//Elvais mi řekl, žes tady střetl skřety.
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_02");	//Ano, na tamté straně rokliny jsem viděl skřety.
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_03");	//Ale byli divní... Byli více jako duchové!
	AI_Output(other,self,"DIA_Emnol_Hello_Ork_01_04");	//Skřeti-duchové?
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_05");	//Nemůžu ti přesně říct, ale vypadali jako duchové! A nemohl jsem se přiblížit, protože to bylo příliš nebezpečné.
	AI_Output(other,self,"DIA_Emnol_Hello_Ork_01_06");	//A kde je ta roklina, v které jsi je viděl?
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_07");	//Pokud půjdeš z tábora na západ, brzy budeš mířit přímo k ní.
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_08");	//Dávej si pozor, pokud se rozhodneš tam jít. Roklina je velmi nebezpečná!...
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_09");	//Kromě duchů tam jsou ještě různé stvůry, kterým se je lepší vyhnout. He.
	AI_Output(other,self,"DIA_Emnol_Hello_Ork_01_10");	//Děkuji, Emnole.
	EMNOLORKKNOWN = TRUE;
	B_LogEntry(TOPIC_URNAZULRAGE,"Promluvil jsem si s Emnolem o zdejších skřetech. Řekl mi, že v roklině blízko tábora viděl skřety. Také se ale zmínil, že více připomínali duchy než skřety.");
	B_LogEntry(TOPIC_URNAZULRAGE,"Měl bych se do té rokliny jít kouknout. Asi je tam něco, co by mi mohlo pomoct s výzkumy. Uvidím, jestli ke mně budou tyto skřeti přátelští. A jestli pro ně Ulu-Mulu ještě něco znamená.");
};