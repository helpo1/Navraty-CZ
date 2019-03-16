
instance DIA_OCPAL_9_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCPAL_9_EXIT_Condition;
	information = DIA_OCPAL_9_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCPAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_9_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCPAL_9_PEOPLE_Condition;
	information = DIA_OCPAL_9_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int DIA_OCPAL_9_PEOPLE_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_OCPAL_9_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCPAL_9_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_OCPAL_9_PEOPLE_09_01");	//Velitelem hradu je Garond. Jeho práci mu vážně není co závidět.
};


instance DIA_OCPAL_9_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCPAL_9_LOCATION_Condition;
	information = DIA_OCPAL_9_LOCATION_Info;
	permanent = TRUE;
	description = "Víš něco zajímavého o tomhle údolí?";
};


func int DIA_OCPAL_9_LOCATION_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_OCPAL_9_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCPAL_9_LOCATION_15_00");	//Víš něco zajímavého o tomhle údolí?
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_01");	//Na východě skřeti postavili obrovskou obrannou zeď - aby mohli chránit své zásoby, předpokládám. Za tou zdí je i místo, kde mohou kotvit jejich lodě.
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_02");	//Doufám, že skřeti nedostanou své zásoby včas. Už teď mi docela stačí, s čím máme tu čest.
};


instance DIA_OCPAL_9_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCPAL_9_STANDARD_Condition;
	information = DIA_OCPAL_9_STANDARD_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_OCPAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Jak se vede?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_01");	//Draci znovu zaútočili! Ale Innos nám v bitvě poskytl svou ochranu. Ty stvůry zaplatí vysokou daň svou vlastní krví!
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_02");	//Drakobijci! Měli nám poslat paladiny!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_03");	//Teď, když jsme se zbavili těch draků, se můžeme konečně vypořádat se skřety!
		};
	};
	if(Kapitel == 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_04");	//Potřebujeme dostat rudu na loď a odplout z pekla týhle zpropadený země.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_05");	//Zrada! Ta brána neměla být nikdy otevřena. Smrt všem zrádcům!
		};
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_06");	//Potom, co byl dobyt hrad, zůstává už jen pramálo naděje. Dnes nám může pomoci jedině zázrak.
	};
};

func void B_AssignAmbientInfos_OCPAL_9(var C_Npc slf)
{
	dia_ocpal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_standard.npc = Hlp_GetInstanceID(slf);
};

