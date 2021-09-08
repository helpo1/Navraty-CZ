instance DIA_Ass_393_Adept_EXIT(C_Info)
{
	npc = Ass_393_Adept;
	nr = 999;
	condition = DIA_Ass_393_Adept_exit_condition;
	information = DIA_Ass_393_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_393_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_393_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_393_Adept_Hello(C_Info)
{
	npc = Ass_393_Adept;
	nr = 1;
	condition = DIA_Ass_393_Adept_hello_condition;
	information = DIA_Ass_393_Adept_hello_info;
	permanent = FALSE;
	description = "Něco na tebe mám.";
};
	
func int DIA_Ass_393_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_393_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_393_Adept_hello_01_01");	//Něco na tebe mám.
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_02");	//Zajímavé. Co bys chtěl po Nazimovi?
	AI_Output(other,self,"DIA_Ass_393_Adept_hello_01_03");	//Nechtěl bys pracovat pro mistra Osaira?
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_04");	//Pro Osaira? No klidně i pro samotného Beliara!
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_05");	//Ale jen pod podmínkou, že mě pustí z této prokleté díry.
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_06");	//Už mě štve, jak je tato jeskyně nudná, ale kam jít - a ještě k tomu musím chránit tyto otroky!
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_07");	//No Haniar ze mě ale sedře kůži, pokud opustím svoje místo.
	AI_Output(other,self,"DIA_Ass_393_Adept_hello_01_08");	//Možna bych ti mohl pomoct s tvojim problémem.
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_09");	//Postarej se o to, bratře! A já určite zmizím, tomu věř.
	NazimNeedGetOutCave = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Nazim chce vypadnout z dolu. Když mu pomůžu, je připraven pracovat pro Osaira. Myslím, že stojí za to si o tom promluvit s Haniarem.");
};

instance DIA_Ass_393_Adept_GetOutCave(C_Info)
{
	npc = Ass_393_Adept;
	nr = 1;
	condition = DIA_Ass_393_Adept_GetOutCave_condition;
	information = DIA_Ass_393_Adept_GetOutCave_info;
	permanent = FALSE;
	description = "Mluvil jsem s Haniarem...";
};
	
func int DIA_Ass_393_Adept_GetOutCave_condition()
{
	if((MIS_CareOsair == LOG_Running) && ((NazimPissOff == TRUE) || (NazimGetOutCave == TRUE) || (NazimStayInCave == TRUE)))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_393_Adept_GetOutCave_info()
{
	AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_01");	//Mluvil jsem s Haniarem...

	if(NazimPissOff == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_02");	//(naštvane) Nemusíš se o tom ani rozmlouvat. Už jsem o tom slyšel!
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_03");	//Díky tvojí laskavosti v této jeskyni zůstanu až do konce života!
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_04");	//Takže už by bylo lepší, kdybys mi nechodil na oči.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_05");	//Jinak za sebe nezodpovídám!
		B_LogEntry(TOPIC_CareOsair,"Takže Nazimovi už nemám chodit na oči. Natož aby me ješte poslouchal.");
	}
	else if(NazimStayInCave == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_06");	//A co říkal?
		AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_07");	//Budeš muset ješte chvíli zůstat tady v dole.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_08");	//Myslel jsem si to. Ten dědek starý mě jednou dostane do hrobu.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_09");	//No nic, k Beliarovi s ním! Díky tobě jsem si aspoň udělal hezký obrázek o mistru Osairovi.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_10");	//No hlavní věc je se teď odtud dostat pryč. A pak se o vše postarám pěkne sám!
		B_LogEntry(TOPIC_CareOsair,"Nazimovi jsem nemohl pomoct. Teď už se mi ho těžko podaří přetáhnout na Osairovu stranu. I když netřeba - Nazim se rozhodl sám vyměnit mistra. Vše dopadlo tak, jak mělo.");
	}
	else if(NazimGetOutCave == TRUE)
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_11");	//Můžes opustit svoje místo v dole.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_12");	//(nedůvěřivě) Je to pravda? Haniar nade mnou konečne zlomil hůl?
		AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_13");	//Ano, je to pravda. A pokud se už nechceš vrátit sem zpatky, měl bys přijmout moji nabidku.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_14");	//Myslíš pracovat pro mistra Osaira?
		AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_15");	//Přesně tak.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_16");	//Hm... (zadumčivě) Myslím, že do toho půjdu. Jak jsem slyšel, lidi se u něj mají jako prasata v žite.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_17");	//Tak teď už za ním půjdu. Díky za pomoc, bratře.
		B_LogEntry(TOPIC_CareOsair,"Dostal jsem Nazima z dolu, ale jen díky tomu, že Haniar se take zajímal o tuto situaci.");
		Npc_ExchangeRoutine(self,"WaitInOsairCave");
	};

	NazimKnowAboutCave = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_393_Adept_NazimPissOff(C_Info)
{
	npc = Ass_393_Adept;
	nr = 1;
	condition = DIA_Ass_393_Adept_NazimPissOff_condition;
	information = DIA_Ass_393_Adept_NazimPissOff_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_393_Adept_NazimPissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Ass_393_Adept_GetOutCave) && (NazimPissOff == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_393_Adept_NazimPissOff_info()
{
	AI_Output(self,other,"DIA_Ass_393_Adept_NazimPissOff_01_01");	//Mám pocit, že jsem tě varoval...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};