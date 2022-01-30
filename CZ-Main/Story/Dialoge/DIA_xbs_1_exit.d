
instance DIA_XBS_1_EXIT(C_Info)
{
	nr = 999;
	condition = dia_xbs_1_exit_condition;
	information = dia_xbs_1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xbs_1_exit_condition()
{
	return TRUE;
};

func void dia_xbs_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XBS_1_ABOUT(C_Info)
{
	nr = 1;
	condition = dia_xbs_1_about_condition;
	information = dia_xbs_1_about_info;
	permanent = TRUE;
	description = "Co tu vůbec děláte?";
};


func int dia_xbs_1_about_condition()
{
	return TRUE;
};

func void dia_xbs_1_about_info()
{
	AI_Output(other,self,"DIA_XBS_1_ABOUT_15_00");	//Co tu vůbec děláte?
	AI_Output(self,other,"DIA_XBS_1_ABOUT_01_01");	//Žijeme, lovíme, mluvíme o minulosti a nasloucháme hlasům budoucnosti.
	b_heroknowforestbase();
};


instance DIA_XBS_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = dia_xbs_1_people_condition;
	information = dia_xbs_1_people_info;
	permanent = TRUE;
	description = "Kdo je tu nejstarší?";
};


func int dia_xbs_1_people_condition()
{
	return TRUE;
};

func void dia_xbs_1_people_info()
{
	AI_Output(other,self,"DIA_XBS_1_PEOPLE_15_00");	//Kdo je tu nejstarší?
	AI_Output(self,other,"DIA_XBS_1_PEOPLE_01_01");	//My se shromáždili pod vedením Netbeka.
	AI_Output(self,other,"DIA_XBS_1_PEOPLE_01_02");	//Ale on se nezapojuje do života v táboře.
	AI_Output(self,other,"DIA_XBS_1_PEOPLE_01_03");	//Stařec se zařídil pod horou na útesu.
	AI_Output(self,other,"DIA_XBS_1_PEOPLE_01_04");	//Všichni jsme si tady rovni - žádné vyznamenání ani privilegia.
	b_heroknowforestbase();
};


instance DIA_XBS_1_LOCATION(C_Info)
{
	nr = 2;
	condition = dia_xbs_1_location_condition;
	information = dia_xbs_1_location_info;
	permanent = TRUE;
	description = "Co je zajímavého v tomhle táboře?";
};


func int dia_xbs_1_location_condition()
{
	return TRUE;
};

func void dia_xbs_1_location_info()
{
	AI_Output(other,self,"DIA_XBS_1_LOCATION_15_00");	//Co je zajímavého v tomhle táboře?
	AI_Output(self,other,"DIA_XBS_1_LOCATION_01_01");	//Nic! Tohle není město, ani hrad.
	AI_Output(self,other,"DIA_XBS_1_LOCATION_01_02");	//Několik stanů a několik noviců.
	AI_Output(self,other,"DIA_XBS_1_LOCATION_01_03");	//Ale, dole v jeskyni žije pár paladinů Innose. Sejdi k nim, oni určitě mají zajímavější život.
	b_heroknowforestbase();
};


instance DIA_XBS_1_STANDARD(C_Info)
{
	nr = 4;
	condition = dia_xbs_1_standard_condition;
	information = dia_xbs_1_standard_info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int dia_xbs_1_standard_condition()
{
	return TRUE;
};

func void dia_xbs_1_standard_info()
{
	AI_Output(other,self,"DIA_XBS_1_STANDARD_15_00");	//Co je nového?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_01");	//Už po několik týdnů jsem neviděl nikoho z Bažinného tábora - teda kromě těch, co jsou zde.
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_02");	//Vítr sem nese křik vycházející zpoza palisády. Nechtěl bych být touhle dobou na hradě!
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_03");	//Smutek občas padne na každého z nás. Je to, jako bychom něco nebo někoho ztratili...
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_04");	//Právě připlul skřetům nový oddíl. Myslím, že obránci hradu budou mít krušné chvilky!
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_05");	//Povídá se, že jsi pozabíjel všechny draky. Jak jsi to dokázal, chlape?!
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_06");	//Říká se, že skřeti vezmou hrad útokem! Obávám se, že brzy přijde řada na nás.
	};
	b_heroknowforestbase();
};

func void b_assignambientinfos_xbs(var C_Npc slf)
{
	dia_xbs_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_about.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_people.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_location.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_standard.npc = Hlp_GetInstanceID(slf);
};

