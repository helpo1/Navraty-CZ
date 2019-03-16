
instance DIA_NOV_3_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_3_EXIT_Condition;
	information = DIA_NOV_3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_3_Fegen(C_Info)
{
	nr = 2;
	condition = DIA_NOV_3_Fegen_Condition;
	information = DIA_NOV_3_Fegen_Info;
	permanent = TRUE;
	description = "Potřebuju pomoci zamést pokoje noviců.";
};


var int Feger1_Permanent;
var int Feger2_Permanent;

func int DIA_NOV_3_Fegen_Condition()
{
	if((Kapitel == 1) && (MIS_KlosterArbeit == LOG_Running) && (NOV_Helfer < 4))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_NOV_3_Fegen_Info()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_15_00");	//Potřebuju pomoci zamést pokoje noviců.
	if(Hlp_GetInstanceID(Feger1) == Hlp_GetInstanceID(self))
	{
		if((NOV_Helfer < 1) && (Feger1_Permanent == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_01");	//Nikdo ti nechce jen tak pomoct, co? Pomůžu ti, ale jen v případě, že se ti podaří přesvědčit ještě někoho dalšího, aby do toho šel taky.
			B_LogEntry(Topic_ParlanFegen,"Novic, který uklízí sklep, mi nabídl pomocnou ruku, pokud některého z jeho bratrů přesvědčím, aby mu pomohl zamést komnaty.");
		}
		else if((NOV_Helfer >= 1) && (Feger1_Permanent == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_02");	//To jsem sám, kdo ti pomáhá?
			AI_Output(other,self,"DIA_NOV_3_Fegen_15_03");	//Ne, už se mi podařilo získat někoho dalšího.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_04");	//Tak to jsem pro.
			NOV_Helfer = NOV_Helfer + 1;
			Feger1_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			B_LogEntry(Topic_ParlanFegen,"Novic ze sklepa mi nyní pomůže uklidit komnaty.");
		}
		else if(Feger1_Permanent == TRUE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_05");	//Hej, bratře - já už ti přece pomáhám. Nemusíš mě přemlouvat.
		};
	};
	if(Hlp_GetInstanceID(Feger2) == Hlp_GetInstanceID(self))
	{
		if(Feger2_Permanent == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_08");	//Jasně, že ti pomůžu. My novicové musíme držet při sobě. Ruka ruku myje.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_09");	//Ale potřebuju 50 zlatých, protože jsem stále ještě nezaplatil Parlanovi.
			B_LogEntry(Topic_ParlanFegen,"Novic před chrámem mi pomůže, pokud mu zaplatím padesát zlatých.");
			Info_ClearChoices(DIA_NOV_3_Fegen);
			Info_AddChoice(DIA_NOV_3_Fegen,"Možná později...",DIA_NOV_3_Fegen_Nein);
			if(Npc_HasItems(other,ItMi_Gold) >= 50)
			{
				Info_AddChoice(DIA_NOV_3_Fegen,"Dobrá. Zaplatím.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_06");	//Však už jsem ti to slíbil. Tys pomohl mně, já pomůžu tobě.
		};
	};
	if((Hlp_GetInstanceID(Feger1) != Hlp_GetInstanceID(self)) && (Hlp_GetInstanceID(Feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self,other,"DIA_NOV_3_Fegen_03_07");	//Zapomeň na to - nemám na takové věci čas. Podívej se po někom jiném, kdo by ti mohl pomoct.
	};
};

func void DIA_NOV_3_Fegen_Nein()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Nein_15_00");	//Možná později. Právě teď si to nemůžu dovolit.
	Info_ClearChoices(DIA_NOV_3_Fegen);
};

func void DIA_NOV_3_Fegen_Ja()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Ja_15_00");	//Dobrá. Zaplatím.
	AI_Output(self,other,"DIA_NOV_3_Fegen_Ja_03_01");	//Fajn, v tom případě můžu začít.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	NOV_Helfer = NOV_Helfer + 1;
	B_GivePlayerXP(XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices(DIA_NOV_3_Fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	B_LogEntry(Topic_ParlanFegen,"Novic před chrámem mi nyní pomůže s úklidem komnat.");
};


instance DIA_NOV_3_Wurst(C_Info)
{
	nr = 3;
	condition = DIA_NOV_3_Wurst_Condition;
	information = DIA_NOV_3_Wurst_Info;
	permanent = TRUE;
	description = "Nedal by sis klobásu?";
};


func int DIA_NOV_3_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_NOV_3_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_NOV_3_Wurst_15_00");	//Nedal by sis klobásu?
	AI_Output(self,other,"DIA_NOV_3_Wurst_03_01");	//Jasně, dej to sem. Taková klobása není vůbec k zahození.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_NOV_3_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_NOV_3_JOIN_Condition;
	information = DIA_NOV_3_JOIN_Info;
	permanent = TRUE;
	description = "Chci se stát mágem!";
};


func int DIA_NOV_3_JOIN_Condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_NOV_3_JOIN_Info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//Chci se stát mágem!
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_01");	//To chce každý novic. Ale jen několika z nich je požehnáno být Vyvoleným a dostat šanci na přijetí do Kruhu Ohně.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_02");	//Být mágem Kruhu Ohně je tou nejvyšší poctou, jaké se ti u nás může dostat.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_03");	//Budeš muset tvrdě pracovat, abys dostal svou šanci.
};


instance DIA_NOV_3_PEOPLE(C_Info)
{
	nr = 5;
	condition = DIA_NOV_3_PEOPLE_Condition;
	information = DIA_NOV_3_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo je představeným tohoto kláštera?";
};


func int DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//Kdo je představeným tohoto kláštera?
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_01");	//My novicové sloužíme mágům Kruhu Ohně. Ti se zodpovídají Nejvyšší radě, které sestává ze tří nejmocnějších čarodějů.
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_02");	//Ale za vše, co se týká noviců, je zodpovědný mistr Parlan. Veškerý svůj čas tráví na nádvoří, kde kontroluje práci noviců.
};


instance DIA_NOV_3_LOCATION(C_Info)
{
	nr = 6;
	condition = DIA_NOV_3_LOCATION_Condition;
	information = DIA_NOV_3_LOCATION_Info;
	permanent = TRUE;
	description = "Co mi můžeš říct o tomto klášteru?";
};


func int DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_LOCATION_Info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//Co mi můžeš říct o tomto klášteru?
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_01");	//Tady se staráme o to, abychom si zajistili své skromné zásoby. Chováme ovce a děláme víno.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_02");	//Tady je knihovna, ale mohou ji využívat pouze mágové a vyvolení novicové.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_03");	//My novicové se do ní podíváme jen, když sem pro něco zajdeme mágům Kruhu Ohně.
};


instance DIA_NOV_3_STANDARD(C_Info)
{
	nr = 10;
	condition = DIA_NOV_3_STANDARD_Condition;
	information = DIA_NOV_3_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_STANDARD_Info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//Co je nového?
	if(Kapitel == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_01");	//Ty jsi zrovna ten pravý, co by se na to měl ptát! O ničem jiném než o tobě novicové nemluví.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_02");	//Jen málokdy se stane, že by se takový nováček jako ty stal vyvoleným pro Kruh Ohně.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_03");	//Čas znovu nadešel. Jeden z noviců bude brzy přijat do Kruhu Ohně.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_04");	//Zkouška začne už brzy.
		};
	};
	if((Kapitel == 2) || (Kapitel == 3))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_05");	//Do našeho řádu pronikl Beliar! Zlo musí být velmi silné, když si dokázalo najít spojence už i tady.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_06");	//Pedro byl tady v klášteře už celá léta. Dlouhý čas, který strávil venku, musel oslabit jeho víru, a tak snadno podlehl Beliarovu pokoušení.
		}
		else if(MIS_NovizenChase == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_07");	//Přišel jsi právě včas. Sám Innos by nemohl zvolit vhodnější dobu pro tvůj příchod.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_08");	//Zapíšeš se do kroniky našeho kláštera jako mocný zachránce Oka.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_09");	//Zprávy z Hornického údolí jsou znepokojivé. Innos nás těžce zkouší.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_10");	//Říká se, že od paladinů, kteří se vydali ho Hornického údolí, zatím nedorazily žádné zprávy. Nejvyšší rada bude vědět, co má být učiněno.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_11");	//Říkají, že bychom draky měli zničit za pomoci našeho Pána. Beliarovy zrůdy stihne Innosův hněv.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_12");	//Jen díky Innosovi se nám podařilo zažehnat bezprostřední hrozbu. Musíme se vrátit na cestu našeho Pána, protože pouze s jeho pomocí se můžeme postavit zlu.
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_13");	//Ty to snad nevíš? Skřeti, skřeti a ještě jednou skřeti - to jsou jediné poslední novinky. A každým dnem jich je více!
	};
};

func void B_AssignAmbientInfos_NOV_3(var C_Npc slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc = Hlp_GetInstanceID(slf);
};

