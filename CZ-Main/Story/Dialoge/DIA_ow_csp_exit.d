
instance DIA_OW_CSP_EXIT(C_Info)
{
	nr = 999;
	condition = dia_ow_csp_exit_condition;
	information = dia_ow_csp_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_ow_csp_exit_condition()
{
	return TRUE;
};

func void dia_ow_csp_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OW_CSP_PEOPLE(C_Info)
{
	nr = 3;
	condition = dia_ow_csp_people_condition;
	information = dia_ow_csp_people_info;
	permanent = TRUE;
	description = "Kdo je tvůj velitel?";
};


func int dia_ow_csp_people_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_ow_csp_people_info()
{
	AI_Output(other,self,"DIA_OW_CSP_People_15_00");	//Kdo je tvůj velitel?
	AI_Output(self,other,"DIA_OW_CSP_People_04_01");	//Naši skupině velí Albert.
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") > 1000)
	{
		AI_Output(self,other,"DIA_OW_CSP_People_04_02");	//Najdeš ho hloub v jeskyni.
	}
	else
	{
		AI_Output(self,other,"DIA_OW_CSP_People_04_03");	//Najdeš ho v jeskyni kde jsme tabořili.
	};
};


instance DIA_OW_CSP_LOCATION(C_Info)
{
	nr = 2;
	condition = dia_ow_csp_location_condition;
	information = dia_ow_csp_location_info;
	permanent = TRUE;
	description = "Co mi můžeš říci o okolí?";
};


func int dia_ow_csp_location_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_ow_csp_location_info()
{
	AI_Output(other,self,"DIA_OW_CSP_Location_15_00");	//Co mi můžeš říci o okolí?
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") > 1000)
	{
		AI_Output(self,other,"DIA_OW_CSP_Location_04_01");	//Kolem tábora je klid. Nad námi mají tábor zbytky nějakých fanatiků.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_02");	//Neuctívají Innose, ale můžeme s nimi obchodovat.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_03");	//Za řekou je nebezpečný les.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_04");	//Na pobřeží mají ležení skřeti.
	}
	else
	{
		AI_Output(self,other,"DIA_OW_CSP_Location_04_05");	//Na východě jsou skřeti a západ není o nic bezpečnější!
		AI_Output(self,other,"DIA_OW_CSP_Location_04_06");	//Na jihu je cesta - hlídaná skřety.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_07");	//A na severu naše jeskyně.
		AI_Output(self,other,"DIA_OW_CSP_Location_04_08");	//Vždy u nás najdeš ochranu.
	};
};


instance DIA_OW_CSP_LOCATION2(C_Info)
{
	nr = 2;
	condition = dia_ow_csp_location2_condition;
	information = dia_ow_csp_location2_info;
	permanent = TRUE;
	description = "Co mi můžeš říci o okolí?";
};


func int dia_ow_csp_location2_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_ow_csp_location2_info()
{
	AI_Output(other,self,"DIA_OW_CSP_Location2_15_00");	//Co mi můžeš říci o okolí?
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") > 1000)
	{
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_01");	//Kolem tábora je klid.
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_02");	//Za řekou je nebezpečný les.
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_03");	//Na pobřeží mají skřeti ležení.
	}
	else
	{
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_05");	//Na východě a západě jsou skřeti!
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_06");	//Na jihu je cesta odsud - hlídaná skřety.
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_07");	//Na severu je naše jeskyně.
		AI_Output(self,other,"DIA_OW_CSP_Location2_04_08");	//V ní vždy najdeš útočiště.
	};
};


instance DIA_OW_CSP_STANDARD(C_Info)
{
	nr = 1;
	condition = dia_ow_csp_standard_condition;
	information = dia_ow_csp_standard_info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int dia_ow_csp_standard_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_ow_csp_standard_info()
{
	AI_Output(other,self,"DIA_OW_CSP_Standard_15_00");	//Jaká je situace?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OW_CSP_Standard_04_01");	//Všude je klid, ale nelíbí se mi ten les.
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OW_CSP_Standard_04_02");	//Draci se sem nedostanou, ale to neplatí o skřetech.
		}
		else
		{
			AI_Output(self,other,"DIA_OW_CSP_Standard_04_05");	//Nyní bychom se mohli teoreticky dostat do hradu.
		};
	};
	if(Kapitel >= 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OW_CSP_Standard_04_06");	//Vypadá to, že smrt draků skřety spíše ještě více podráždila.
		}
		else
		{
			AI_Output(self,other,"DIA_OW_CSP_Standard_04_07");	//Doufám, že pro nás z hradu přijdou.
		};
	};
};


instance DIA_OW_CSP_SEAPOST(C_Info)
{
	nr = 1;
	condition = dia_ow_csp_seapost_condition;
	information = dia_ow_csp_seapost_info;
	permanent = TRUE;
	description = "Co dělají?";
};


func int dia_ow_csp_seapost_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_FOREST_126") < 1000)
	{
		return TRUE;
	};
};

func void dia_ow_csp_seapost_info()
{
	AI_Output(other,self,"DIA_OW_CSP_SeaPost_15_00");	//Co dělaj?
	AI_Output(self,other,"DIA_OW_CSP_SeaPost_04_01");	//Vypadá to, že je teďka moc nezajímáme.
};

func void b_assignambientinfos_csp(var C_Npc slf)
{
	dia_ow_csp_exit.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_people.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_location.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_standard.npc = Hlp_GetInstanceID(slf);
	dia_ow_csp_seapost.npc = Hlp_GetInstanceID(slf);
};

