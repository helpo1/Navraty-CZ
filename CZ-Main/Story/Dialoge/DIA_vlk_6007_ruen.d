
instance DIA_RUEN_EXIT(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 999;
	condition = dia_ruen_exit_condition;
	information = dia_ruen_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_ruen_exit_condition()
{
	return TRUE;
};

func void dia_ruen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUEN_HELLO(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_condition;
	information = dia_ruen_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Jak se ti daří?";
};


func int dia_ruen_hello_condition()
{
	if(MEETRUEN == 0)
	{
		return TRUE;
	};
};

func void dia_ruen_hello_info()
{
	AI_Output(other,self,"DIA_Ruen_Hello_01_00");	//Jak se ti daří?
	AI_Output(self,other,"DIA_Ruen_Hello_01_01");	//... stůj! Tys ten chlapík, co se tu objevil!
	AI_Output(self,other,"DIA_Ruen_Hello_01_02");	//Všichni mluví jen o tobě...
	AI_Output(self,other,"DIA_Ruen_Hello_01_03");	//Ano, brácho. Lov tady je čím dál, tím nebezpečnější.
	AI_Output(self,other,"DIA_Ruen_Hello_01_04");	//Je to jakoby ses tím potvorám vrhal přímo do tlamy.
	AI_Output(self,other,"DIA_Ruen_Hello_01_05");	//A v noci máš přímo husí kůži!
	AI_Output(self,other,"DIA_Ruen_Hello_01_06");	//Jenom v téhle jeskyni se můžeš cítit více-jméně bezpečne.
	AI_Output(self,other,"DIA_Ruen_Hello_01_07");	//Život tady není procházka růžovou zahradou!
	AI_Output(other,self,"DIA_Ruen_Hello_01_08");	//A co lovíte?
	AI_Output(self,other,"DIA_Ruen_Hello_01_09");	//Nejvíce wargy. Řeknu ti, ďábelsky nebezpečné monstra!
	AI_Output(self,other,"DIA_Ruen_Hello_01_10");	//Néže bychom si měli z čeho vybírat. Skoro nic jiné tady není.
	AI_Output(other,self,"DIA_Ruen_Hello_01_11");	//Taky jste lovci?
	AI_Output(self,other,"DIA_Ruen_Hello_01_12");	//Všichni tady jsme lovci. Taky tady nemůžeš kromě lovení nic dělat.
	MEETRUEN = 1;
};


instance DIA_RUEN_HELLO_TWO(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_two_condition;
	information = dia_ruen_hello_two_info;
	permanent = TRUE;
	important = FALSE;
	description = "Můžeš mě naučit lovit?";
};


func int dia_ruen_hello_two_condition()
{
	if(MEETRUEN == 1)
	{
		return TRUE;
	};
};

func void dia_ruen_hello_two_info()
{
	AI_Output(other,self,"DIA_Ruen_Hello_Two_01_01");	//Můžeš mě naučit lovit?
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_02");	//Bohužel ne moc.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_03");	//Pokud se chceš naučit něco víc, raději si promluv s Bargusem.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_04");	//Je tady nejlepší! Promluv si s ním. Je v jeskyni nalevo.
	AI_Output(other,self,"DIA_Ruen_Hello_Two_01_05");	//A kdo jiný tady mě může něco naučit?
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_06");	//Jak jsem ti řekl, Bagrus tě může naučit lovit a brát trofeje ze zvířat.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_07");	//U Gunmare hledej šípy! A právě on ti může vysvětlit, jak lépe zacházet s lukem.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_08");	//Gillimor ti může objasnit výrobu některých léčivých lektvarů. Je tady něco jako alchymista.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_09");	//Emnol je prostě hora svalů! Pokud se chceš stát silnějším, jdi k němu. Ukáže ti několik cviků, které zvednou tvojí sílu.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_10");	//Pokud chceš lépe zacházet s chladnou ocelí - nezáleží jestli jedno- nebo obouručnou, Kardor ti to může ukázat. Nikdo mezi námi se mu v tom nevyrovná!
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_11");	//Nofeld ti ukáže, jak být obratnějším.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_12");	//Hasan ti může prodat věci ze skladu, na který dohlíží.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_13");	//Možná ti něco ukáže i někdo jiný.
	AI_Output(other,self,"DIA_Ruen_Hello_Two_01_14");	//A ty?
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_15");	//Já?!... Hmmm... Bojím se, že ne.
	AI_Output(other,self,"DIA_Ruen_Hello_Two_01_16");	//Fajn. A děkuji ti.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_17");	//Není zač.
	Log_CreateTopic(TOPIC_TEACHERSINVALLEY,LOG_NOTE);
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Bagrus je nejlepším lovcem v táboře. Může mi ukázat, jak vybírat trofeje ze zvířat.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Gunmar se specializuje na střelbu s lukem. Ruen mi řekl, že právě on má tady nejlepší šípy.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Gillimor mě může naučit připravit různé lektvary.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Emnol mi pomůže zvýšit mojí sílu.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Kardor mi může ukázat několik triků s chladnými zbraněmi.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Nofeld mi pomůže zvýšit mojí obratnost.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Hasan obchoduje s různými věcmi. Můžu ho najít v skladě.");
	BARGUSTEACHER = TRUE;
	GUNMARTEACHER = TRUE;
	GILLIMORTEACHER = TRUE;
	EMNOLTEACHER = TRUE;
	KARDORTEACHER = TRUE;
	NOFELDTEACHER = TRUE;
	HASANTEACHER = TRUE;
	MEETRUEN = 2;
};


instance DIA_RUEN_HELLO_SKLEP(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_sklep_condition;
	information = dia_ruen_hello_sklep_info;
	permanent = TRUE;
	important = FALSE;
	description = "(zeptat se na kryptu v údolí)";
};


func int dia_ruen_hello_sklep_condition()
{
	if((MEETHARUMTWO == TRUE) && (RUENSKLEPKNOWN == FALSE))
	{
		return TRUE;
	};
};

func void dia_ruen_hello_sklep_info()
{
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_00");	//Elvais mi řekl, že když jste lovili, našla se jedna krypta.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_01");	//Ano, něco takovýho. Říkám ti, hrozné místo!
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_03");	//A co s ním chceš?
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_04");	//Chci ho navštívit. Elvais mi také řekl, že jste odtamtud přinesli nějaké starobylé věci.
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_05");	//A některé podle něho obsahovali velice zajímavé informace.
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_06");	//Myslím, že bych se tam měl jít kouknout. Může mě tam čekat něco zajímavé.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_07");	//Radím ti, drž se od té krypty dál. Je to sídlo zla.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_08");	//Hemží se to tam monstry! Nikdy jsem jich neviděl na jednom místě víc.
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_09");	//Nějak se s nimi vypořádám. Mohl bys mi přesněji říct, kde se krypta nachází?
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_10");	//Nebudu ti bránit, jsi odvážný, chlape! Tvá věc...
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_11");	//Jen se obávám, že ti nemůžu přesně říct, kde je.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_12");	//Jen tak se objevila. A nebyl čas pamatovat si cestu.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_13");	//Vím jen, že je někde v jeskyni při kamenném kruhu.
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_14");	//Kamenném kruhu?
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_15");	//Ano, kamenném kruhu. Je severně od nášho tábora.
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_16");	//Ano... protože teď vůbec není problém ho najít!
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_17");	//Chlape, řekl jsem ti vše, co vím.
	B_LogEntry(TOPIC_URNAZULRAGE,"Mluvil jsem s Ruenem o té kryptě. Řekl mi, že je severně od tábora, v jeskyni při kamenném kruhu.");
	RUENSKLEPKNOWN = TRUE;
};


instance DIA_RUEN_HELLO_LAST(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_last_condition;
	information = dia_ruen_hello_last_info;
	permanent = TRUE;
	important = FALSE;
	description = "Je to vše?";
};


func int dia_ruen_hello_last_condition()
{
	if(RUENSKLEPKNOWN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ruen_hello_last_info()
{
	AI_Output(other,self,"DIA_Ruen_Hello_Last_01_00");	//Je to vše?
	AI_Output(self,other,"DIA_Ruen_Hello_Last_01_01");	//Zatím.
};


