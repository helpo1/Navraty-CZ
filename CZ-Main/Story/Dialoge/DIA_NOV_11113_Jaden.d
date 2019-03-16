
instance DIA_JADEN_KAP1_EXIT(C_Info)
{
	npc = nov_11113_jaden;
	nr = 999;
	condition = dia_jaden_kap1_exit_condition;
	information = dia_jaden_kap1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jaden_kap1_exit_condition()
{
	return TRUE;
};

func void dia_jaden_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


var int is_jaden_about_church_condition;
var int jaden_about_sengo_answer_1;

instance DIA_JADEN_HELLO1(C_Info)
{
	npc = nov_11113_jaden;
	nr = 1;
	condition = dia_jaden_hello1_condition;
	information = dia_jaden_hello1_info;
	permanent = TRUE;
	important = FALSE;
	description = "Jsi v klášteře dlouho?";
};


func int dia_jaden_hello1_condition()
{
	return TRUE;
};

func void dia_jaden_hello1_info()
{
	AI_Output(other,self,"DIA_Jaden_Hello_00_01");	//Jsi v klášteře dlouho?
	AI_Output(self,other,"DIA_Jaden_Hello_00_02");	//Skoro rok. Jsem z pevniny.
	AI_Output(other,self,"DIA_Jaden_Hello_00_03");	//A jak ses dostal sem?
	AI_Output(self,other,"DIA_Jaden_Hello_00_04");	//Na lodi, jak jinak?! Jsme na ostrově.
	AI_Output(other,self,"DIA_Jaden_Hello_00_05");	//Myslím, proč jsi plul zrovna tu. Na pevnině klášter není? 
	AI_Output(self,other,"DIA_Jaden_Hello_00_06");	//Jeden je v Nordmaru.
	AI_Output(self,other,"DIA_Jaden_Hello_00_07");	//Ale sám se tam dostat uprostřed války by byl problém.
	AI_Output(self,other,"DIA_Jaden_Hello_00_08");	//Tak jsem vzal peníze po otci, nastoupil na loď a vyplul sem. 
	AI_Output(other,self,"DIA_Jaden_Hello_00_09");	//Otec byl asi bohatý muž.
	AI_Output(self,other,"DIA_Jaden_Hello_00_10");	//Byl paladinem. Ale v řádu nedostával tolik, kolik by sis myslel.
	AI_Output(self,other,"DIA_Jaden_Hello_00_11");	//Tuto částku šetřil skoro rok. Doufal, že bych vstoupil do městské stráže ve Vengardu.
	AI_Output(self,other,"DIA_Jaden_Hello_00_12");	//Ale mě přitahuje magie a tajemství minulosti, tak jsem tady.
	AI_Output(other,self,"DIA_Jaden_Hello_00_13");	//Otec BYL paladinem?
	AI_Output(self,other,"DIA_Jaden_Hello_00_14");	//(smutně) Ano... Před šesti měsíci jsem obdržel dopis, kde stálo, že zemřel v bitvě. 
};

instance DIA_JADEN_JOIN(C_Info)
{
	nr = 4;
	condition = dia_jaden_join_condition;
	information = dia_jaden_join_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = "Chci se stát mágem!";
};

func int dia_jaden_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_jaden_join_info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//Chci se stát mágem!
	AI_Output(self,other,"DIA_Jaden_Join_03_01");	//To všichni novicové. Ale jen málu se to povede.
	AI_Output(self,other,"DIA_Jaden_Join_03_02");	//Stát se mágem je nejvyšší čest a musí být zasloužena.
	AI_Output(self,other,"DIA_Jaden_Join_03_03");	//Musíš pracovat velmi pilně. Pak máš možná šanci.
};


instance DIA_JADEN_PEOPLE(C_Info)
{
	nr = 5;
	condition = dia_jaden_people_condition;
	information = dia_jaden_people_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = "Kdo stojí v čele kláštera?";
};


func int dia_jaden_people_condition()
{
	return TRUE;
};

func void dia_jaden_people_info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//Kdo stojí v čele kláštera?
	AI_Output(self,other,"DIA_Jaden_People_03_01");	//Mágové. Jim sloužíme my, novicové. V úplném čele je Nejvyšší rada.
	AI_Output(self,other,"DIA_Jaden_People_03_02");	//Za novice je zodpovědný Parlan, najdeš ho na dvoře, jak dohlíží na novice.
};


instance DIA_JADEN_LOCATION(C_Info)
{
	nr = 6;
	condition = dia_jaden_location_condition;
	information = dia_jaden_location_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = "Co mi můžeš říct o klášteru?";
};


func int dia_jaden_location_condition()
{
	return TRUE;
};

func void dia_jaden_location_info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//Co mi můžeš říct o klášteru?
	AI_Output(self,other,"DIA_Jaden_Location_03_01");	//Chováme ovce a vyrábíme víno.
	AI_Output(self,other,"DIA_Jaden_Location_03_02");	//Je tu i knihovna, ale do ní smí jen mágové a někteří novicové. 
	AI_Output(self,other,"DIA_Jaden_Location_03_03");	//My obyčejní novicové dbáme na to, aby mágové měli všeho dostatek.
};


instance DIA_JADEN_STANDARD(C_Info)
{
	nr = 10;
	condition = dia_jaden_standard_condition;
	information = dia_jaden_standard_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = "Něco nového?";
};

func int dia_jaden_standard_condition()
{
	return TRUE;
};

func void dia_jaden_standard_info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//Něco nového?
	if(Kapitel == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_01");	//Všichni novicové mluví jen o tobě.
			AI_Output(self,other,"DIA_Jaden_Standard_03_02");	//Je velmi vzácné, aby novic, který byl v klášteře takto krátce, byl přijat mezi mágy. 
		}
		else
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_03");	//Brzy bude jeden z noviců opět přijmut mezi mágy.
			AI_Output(self,other,"DIA_Jaden_Standard_03_04");	//Zase bude zkouška.
		};
	};
	if((Kapitel == 2) || (Kapitel == 3))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_05");	//Našeho řádu se dotkla špinavá tlapa Beliara! Zlo musí být velmi silné, pokud našlo spojence i zde... 
			AI_Output(self,other,"DIA_Jaden_Standard_03_06");	//Pedro žil v klášteře mnoho let. Ale myslím, že čas strávený mimo něj oslabil jeho víru.
		}
		else if(MIS_NovizenChase == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_07");	//Přišel jsi včas, Innos nemohl vybrat lepší čas pro tvůj příchod.
			AI_Output(self,other,"DIA_Jaden_Standard_03_08");	//Budeš zapsán do análů kláštera jako zachránce.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_09");	//Zprávy z Hornického údolí jsou znepokojivé. Innos nás zkouší.
		}
		else
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_10");	//Říká se, že nejsou zprávy o paladinech, kteří šli do údolí...
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Jaden_Standard_03_11");	//Musíme zničit draky, hněv Innose je spálí. 
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Jaden_Standard_03_12");	//Chvála Innosovi, musíme sledovat jeho cestu a odolat zlu. 
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_Jaden_Standard_03_13");	//Skřeti, skřeti, skřeti... Jediná novinka. A každý den jich je víc. 
	};
};

func void b_assignambientinfos_jaden(var C_Npc slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc = Hlp_GetInstanceID(slf);
};

instance DIA_Jaden_Wurst(C_Info)
{
	npc = nov_11113_jaden;
	nr = 2;
	condition = DIA_Jaden_Wurst_Condition;
	information = DIA_Jaden_Wurst_Info;
	permanent = FALSE;
	description = "Tady, mám pro tebe jehněčí klobásu.";
};

func int DIA_Jaden_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Jaden_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Tady, mám pro tebe jehněčí klobásu.
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Díky, sem s ní!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};

instance DIA_JADENSLD_PICKPOCKET(C_Info)
{
	nr = 900;
	npc = nov_11113_jaden;
	condition = dia_jadensld_pickpocket_condition;
	information = dia_jadensld_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_40;
};

func int dia_jadensld_pickpocket_condition()
{
	return C_Beklauen(56,35);
};

func void dia_jadensld_pickpocket_info()
{
	Info_ClearChoices(dia_jadensld_pickpocket);
	Info_AddChoice(dia_jadensld_pickpocket,Dialog_Back,dia_jadensld_pickpocket_back);
	Info_AddChoice(dia_jadensld_pickpocket,DIALOG_PICKPOCKET,dia_jadensld_pickpocket_doit);
};

func void dia_jadensld_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void dia_jadensld_pickpocket_back()
{
	Info_ClearChoices(dia_jadensld_pickpocket);
};