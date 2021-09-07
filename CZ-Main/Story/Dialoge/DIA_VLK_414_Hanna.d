
instance DIA_Hanna_EXIT(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 999;
	condition = DIA_Hanna_EXIT_Condition;
	information = DIA_Hanna_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hanna_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Hanna_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hanna_Hello(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Hello_Condition;
	information = DIA_Hanna_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hanna_Hello_Condition()
{
	return TRUE;
};

func void DIA_Hanna_Hello_Info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//Á, zákazník - čímpak posloužím?
};

instance DIA_Hanna_Armor(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Armor_Condition;
	information = DIA_Hanna_Armor_Info;
	permanent = FALSE;
	description = "Právě jdu od Pabla.";
};

func int DIA_Hanna_Armor_Condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Armor_Info()
{
	AI_Output(other,self,"DIA_Hanna_Armor_01_00");	//Právě jdu od Pabla.
	AI_Output(other,self,"DIA_Hanna_Armor_01_01");	//Řekl, že mi můžeš prodat oděv, který nosí většina zdejších občanů.
	AI_Output(self,other,"DIA_Hanna_Armor_01_02");	//Hmm...(Nevěřícně) No, tak pokud tak řekl, předpokládám že asi můžu.
	AI_Output(self,other,"DIA_Hanna_Armor_01_03");	//Ale nemysli si, že to bude zadarmo.
	AI_Output(self,other,"DIA_Hanna_Armor_01_04");	//Budeš za to muset zaplatit. A to přesně 100 zlatých.
	AI_Output(other,self,"DIA_Hanna_Armor_01_05");	//Aha, no tak to jsem nečekal.
	B_LogEntry(TOPIC_PathFromDown,"Hanna mi může prodat lehký oděv občana, ale za 100 zlatých.");
};

instance DIA_Hanna_Armor_Dis(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Armor_Dis_Condition;
	information = DIA_Hanna_Armor_Dis_Info;
	permanent = TRUE;
	description = "Nemůžeš mi to prodat levněji?";
};

func int DIA_Hanna_Armor_Dis_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Hanna_Armor) == TRUE) && (Hanna_LeatherBought_Dis == FALSE) && (Hanna_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Armor_Dis_Info()
{
	AI_Output(other,self,"DIA_Hanna_Armor_Dis_01_00");	//Nemůžeš mi to prodat levněji?

	if(HannaTakeBuh == TRUE)
	{
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_01");	//Hmm...(přemýšlivě) Dobře. Přeci jen jsi mi pomohl vyřešit problém s Lehmarem.
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_02");	//Takže ti to dám zadarmo.
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_03");	//Na, vezmi si to.
		AI_Output(other,self,"DIA_Hanna_Armor_Dis_01_04");	//Díky.
		B_GiveInvItems(self,other,ITAR_Vlk_L,1);
		Hanna_LeatherBought = TRUE;
	}
	else if(IS_LOVCACH == TRUE)
	{
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_05");	//Hmm...(přemýšlivě) Dobře. Přeci jenom jsi jedním z nás.
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_06");	//Měli bychom držet pospolu.
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_07");	//Takže ti to prodám za polovinu ceny.
		AI_Output(other,self,"DIA_Hanna_Armor_Dis_01_08");	//Díky.
		Hanna_LeatherBought_Dis = TRUE;
		B_LogEntry(TOPIC_PathFromDown,"Díky tomu, že jsem jedním ze zlodějů, Hanna mi oděv občana prodá za poloviční cenu.");
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_09");	//Hmm...(Sarkasticky) A proč bych to tak asi dělala?
		AI_Output(self,other,"DIA_Hanna_Armor_Dis_01_10");	//Ne kdepak... Nic ti neslevím!
	};
};

instance DIA_Hanna_LEATHER(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 850;
	condition = DIA_Hanna_LEATHER_Condition;
	information = DIA_Hanna_LEATHER_Info;
	permanent = TRUE;
	description = "(Koupit lehký oděv občana).";
};

func int DIA_Hanna_LEATHER_Condition()
{
	if((CanTeachTownMaster == FALSE) && (Npc_KnowsInfo(other,DIA_Hanna_Armor) == TRUE) && (MIS_PathFromDown == LOG_Running) && (Hanna_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_LEATHER_Info()
{
	AI_Output(other,self,"DIA_Hanna_LEATHER_15_00");	//Prodej mi ten oděv.

	if(Hanna_LeatherBought_Dis == TRUE)
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			B_GiveInvItems(other,self,ItMi_Gold,50);
			Npc_RemoveInvItems(self,ItMi_Gold,50);
			AI_Output(self,other,"DIA_Hanna_LEATHER_09_01");	//Dobře...(usmívá se) Tady, vem si to.
			B_GiveInvItems(self,other,ITAR_Vlk_L,1);
			Hanna_LeatherBought = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hanna_LEATHER_09_02");	//Bohužel nemáš dostatek zlata.
		};
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) >= 100)
		{
			B_GiveInvItems(other,self,ItMi_Gold,100);
			Npc_RemoveInvItems(self,ItMi_Gold,100);
			AI_Output(self,other,"DIA_Hanna_LEATHER_09_01");	//Dobře...(usmívá se) Tady, vem si to.
			B_GiveInvItems(self,other,ITAR_Vlk_L,1);
			Hanna_LeatherBought = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hanna_LEATHER_09_02");	//Bohužel nemáš dostatek zlata.
		};
	};
};

instance DIA_Hanna_Room(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_Room_Condition;
	information = DIA_Hanna_Room_Info;
	permanent = FALSE;
	description = "Hledám pokoj.";
};

func int DIA_Hanna_Room_Condition()
{
	return TRUE;
};

func void DIA_Hanna_Room_Info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//Hledám pokoj.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//Tak to jsi na správném místě.

	if(Npc_KnowsInfo(other,DIA_Lothar_Schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//Jeden z paladinů mi naznačil, že bych tu mohl přespat i zadarmo.
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//Kolik stojí noc?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//Vůbec nic.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//Ubytování poutníků jde na účet paladinům.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//Takže tu můžu zůstat zadarmo?
	};

	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//Ano, ano.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//Prostě vyjdi po schodech nahoru.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//Ještě tam máme dvě postele volné.
};


instance DIA_Hanna_WhyPay(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 3;
	condition = DIA_Hanna_WhyPay_Condition;
	information = DIA_Hanna_WhyPay_Info;
	permanent = FALSE;
	description = "Proč paladinové za všechno platí?";
};

func int DIA_Hanna_WhyPay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WhyPay_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//Proč paladinové za všechno platí?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//Nevím, ale nejspíš v tom bude víc věcí najednou.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//Jednak chtějí, aby se po ulici netoulala žádná pochybná sebranka a zbytečně tu nedělala bordel.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//A taky si možná chtějí na svou stranu naklonit potulné kupce.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//Teď, když se farmáři bouří, je naše zásobování závislé hlavně na obchodnících.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//A kromě toho bych řekla, že taky chtějí ve městě trochu pozvednout morálku.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//Lord Andre dokonce nařídil, aby v šibeniční uličce denně nalévali jedno pivo zdarma.
};


instance DIA_Hanna_WerHier(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 4;
	condition = DIA_Hanna_WerHier_Condition;
	information = DIA_Hanna_WerHier_Info;
	permanent = FALSE;
	description = "Kdo tady zrovna je?";
};

func int DIA_Hanna_WerHier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WerHier_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//Kdo tady zrovna je?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//Skoro všechno jsou potulní kupci.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//Aha.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//Ať tě ani nenapadne, že bys jim šel 'zkontrolovat' zboží! Nechci tu mít žádné nepříjemnosti!
};


instance DIA_Hanna_City(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 5;
	condition = DIA_Hanna_City_Condition;
	information = DIA_Hanna_City_Info;
	permanent = TRUE;
	description = "Měl bych pár otázek ohledně města...";
};

func int DIA_Hanna_City_Condition()
{
	return TRUE;
};

func void DIA_Hanna_City_Info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//Měl bych pár otázek ohledně města...
	Info_ClearChoices(DIA_Hanna_City);
	Info_AddChoice(DIA_Hanna_City,Dialog_Back,DIA_Hanna_City_Back);
	Info_AddChoice(DIA_Hanna_City,"Kde bych si tu mohl něco nakoupit?",DIA_Hanna_City_Buy);
	Info_AddChoice(DIA_Hanna_City,"Pověz mi něco o městě.",DIA_Hanna_City_City);
};

func void DIA_Hanna_City_Back()
{
	Info_ClearChoices(DIA_Hanna_City);
};

func void DIA_Hanna_City_Buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//Kde bych si tu mohl něco nakoupit?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//Přímo naproti dveřím je tržiště. Tam bys měl najít všechno, co potřebuješ.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//Na druhé straně města najdeš pár řemeslnických krámků. Většina z nich leží poblíž druhé městské brány.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//V přístavu také můžeš zajít k rybáři. Jeho obchod se nachází přímo v přístavu, najdeš to snadno.
};

func void DIA_Hanna_City_City()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//Pověz mi něco o městě.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//Khorinis je jedním z nejbohatších měst v království, i když to teď tak nevypadá.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//Ale od té doby, co začaly ty problémy se skřety, se obchod téměř zastavil. Král totiž naverboval do armády celou kupeckou flotilu.
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//To znamená, že do přístavu teď žádné lodi neplují a zásoby zboží se rapidně tenčí. Spousta zdejších obyvatel se proto bojí, co bude dál.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//Nikdo neví přesně, co nám budoucnost přinese. Vlastně nemůžeme dělat nic jiného, než tu sedět a čekat, co se stane. Nezdá se, že bychom mohli něco změnit.
};


instance DIA_Hanna_Kap3_EXIT(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 999;
	condition = DIA_Hanna_Kap3_EXIT_Condition;
	information = DIA_Hanna_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hanna_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Hanna_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Hanna_PriceForLetter;

instance DIA_Hanna_AnyNews(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_AnyNews_Condition;
	information = DIA_Hanna_AnyNews_Info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int DIA_Hanna_AnyNews_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Hanna_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//Nevypadáš, že by tě problémy druhých lidí nějak zvlášť zajímaly.
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"To se tedy pleteš.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice(DIA_Hanna_AnyNews,"Nu, jak to říct...",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice(DIA_Hanna_AnyNews,"Víceméně máš pravdu.",DIA_Hanna_AnyNews_No);
};

func void DIA_Hanna_AnyNews_No()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//Víceméně máš pravdu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//Přesně jak říkám. Nikdo tu nemyslí na nic jiného, než jenom na sebe. Takže co chceš?
	MIS_HannaRetrieveLetter = LOG_FAILED;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//Nu, jak to říct...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//Tím chceš říct, že prostě všechno stojí a padá na tom, co ti z toho kápne.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//Takové jako ty tu nemůžu vystát.
	MIS_HannaRetrieveLetter = LOG_FAILED;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");	//To se tedy pleteš.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//Co ty víš, svět je plný překvapení. Nedávno jsem si dělala pořádek ve věcech a při té příležitosti jsem prodala štůsek starých map Brahimovi, kartografovi dole v přístavu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//Bohužel jsem ale vzápětí zjistila, že mi chybí jeden dokument.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//Počítám, že se musel nějak přimotat mezi ty papíry.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//Nemohl bys mi ho přinést zpátky?
	MIS_HannaRetrieveLetter = LOG_Running;
	Log_CreateTopic(TOPIC_HannaRetrieveLetter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter,LOG_Running);
	B_LogEntry(TOPIC_HannaRetrieveLetter,"Hanně se ztratil nějaký dokument. Nejspíš jí zmizel v přístavu - tam, kde sídlí kartograf Brahim.");
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"Nejsem žádný poslíček.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice(DIA_Hanna_AnyNews,"A co z toho budu mít já?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice(DIA_Hanna_AnyNews,"Uvidím, co se dá dělat.",DIA_Hanna_AnyNews_Yes_WillSee);
};

func void DIA_Hanna_AnyNews_Yes_Footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//Nejsem žádný poslíček.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//Chápu - problémy obyčejné ženy ti nestojí za námahu. No dobře, tak se o to budu muset postarat sama.
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//A co z toho budu mít já?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//Aha, já to věděla - nejsi o nic lepší než ta lůza dole v přístavu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//Takže co chceš po ubohé ženě?
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ale nic, zapomeň na to.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice(DIA_Hanna_AnyNews,"Mohla by ses ke mně chovat o něco hezčeji... Chci říct, jelikož jsi žena...",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice(DIA_Hanna_AnyNews,"Zlato.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

func void DIA_Hanna_AnyNews_Yes_Reward_OK()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//Ale nic, zapomeň na to.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//Aspoň že v tobě zbyla trocha slušnosti. Když mi ten dokument přineseš, dostaneš ode mě 75 zlatých.
	Hanna_PriceForLetter = 75;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward_BeNice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//Mohla by ses ke mně chovat o něco hezčeji... Chci říct, jelikož jsi žena...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//No teda, ty prase! Já... zmiz odsud! Ty nevychovaný hulváte!
	MIS_HannaRetrieveLetter = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void DIA_Hanna_AnyNews_Yes_Reward_Gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//Zlato.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//Takže tě zajímá jen tenhle bezcenný kov? No dobrá - ten dokument si cením na 50 zlatých.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//Jestli se ti podaří ten dokument získat zpátky, dám ti ty peníze.
	Hanna_PriceForLetter = 50;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_WillSee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//Uvidím, co se dá dělat.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//To je od tebe milé! Hodně štěstí!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//Když mi ten dokument přineseš zpátky, odměním se ti.
	Hanna_PriceForLetter = 200;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

instance DIA_Hanna_ThisLetter(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_ThisLetter_Condition;
	information = DIA_Hanna_ThisLetter_Info;
	permanent = FALSE;
	description = "Myslela jsi tenhle dokument?";
};

func int DIA_Hanna_ThisLetter_Condition()
{
	if((MIS_HannaRetrieveLetter == LOG_Running) && (Npc_HasItems(other,itwr_shatteredgolem_mis_1) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hanna_ThisLetter_Info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//Myslela jsi tenhle dokument?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//Ano, to je přesně ono. Děkuji ti.
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//A co má odměna?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//Ne tak zhurta. Tady máš peníze.
	B_GiveInvItems(other,self,itwr_shatteredgolem_mis_1,1);
	CreateInvItems(self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems(self,other,ItMi_Gold,Hanna_PriceForLetter);
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP(XP_HannaRetrieveLetter);
};


instance DIA_Hanna_PICKPOCKET(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 900;
	condition = DIA_Hanna_PICKPOCKET_Condition;
	information = DIA_Hanna_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hanna_PICKPOCKET_Condition()
{
	return C_Beklauen(45,25);
};

func void DIA_Hanna_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,Dialog_Back,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

var int HannaThief;
var int HannaBuyStones;

instance DIA_Hanna_AusKeller(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 11;
	condition = DIA_Hanna_AusKeller_Condition;
	information = DIA_Hanna_AusKeller_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Hanna_AusKeller_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hanna_AusKeller_Info()
{
	if((Cassia.aivar[AIV_KilledByPlayer] == TRUE) || (Jesper.aivar[AIV_KilledByPlayer] == TRUE) || (Ramirez.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_27");	//Odkud... jsi to přišel?
		AI_Output(other,self,"DIA_Hanna_Add_15_28");	//U tebe ve sklepě jsem našel cosi velmi zajímavého.
		AI_Output(self,other,"DIA_Hanna_Add_17_29");	//A co jsi dělal u mě ve sklepě?
		AI_Output(other,self,"DIA_Hanna_Add_15_30");	//To víš zatraceně dobře!
		AI_Output(self,other,"DIA_Hanna_Add_17_31");	//(chladně) Nemám ponětí, o čem to mluvíš.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_19");	//(nedůvěřivě) Jen se na sebe podívej! Odkud jsi to přišel, co?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//(rozpačitě) Já...
		AI_Output(self,other,"DIA_Hanna_Add_17_21");	//(usměje se) Já vím!
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//(spiklenecky) Nemusíš mi nic říkat - vím všechno.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//Ale ať tě ani nenapadne něco tady ukrást, jasné?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//Nemůžeme si dovolit přilákat k hotelu příliš velkou pozornost.
		HannaThief = TRUE;
	};
};

instance DIA_Hanna_TradeMe(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_TradeMe_Condition;
	information = DIA_Hanna_TradeMe_Info;
	permanent = FALSE;
	description = "Ty jsi taky zloděj?";
};

func int DIA_Hanna_TradeMe_Condition()
{
	if((HannaThief == TRUE) && ((HANNAISKNAST == FALSE) || (HANNAISFREE == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Hanna_TradeMe_Info()
{
	AI_Output(other,self,"DIA_Hanna_TradeMe_01_00");	//Ty jsi taky zloděj?

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other,"DIA_Hanna_TradeMe_01_01");	//(Usmívá se) Bývávalo.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_02");	//Ale teď mám slušné příjmy z provozu hotelu a prodeje potravin.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_03");	//Popravdě, stále mám zákazníky, kteří mají zájem o více než jen jídlo a přístřeší.
	AI_Output(other,self,"DIA_Hanna_TradeMe_01_04");	//A co jim prodáváš?

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other,"DIA_Hanna_TradeMe_01_05");	//Moji zákazníci mají často zájem o drahé kameny a šperkovnice.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_06");	//Takové věci na tržišti normálně nenajdeš.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_07");	//Takže pokud pro mne chceš něco udělat, přines mi je.
	AI_Output(self,other,"DIA_Hanna_TradeMe_01_08");	//A na oplátku se ti dobře odměním!
	AI_Output(other,self,"DIA_Hanna_TradeMe_01_09");	//Dohodnuto.
	Log_CreateTopic(Topic_GoldStones,LOG_NOTE);
	B_LogEntry(Topic_GoldStones,"Hanna koupí veškeré klenoty a drahé kameny - za dobrou cenu.");
	HannaBuyStones = TRUE;
};

instance DIA_Hanna_BuyStones(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 200;
	condition = DIA_Hanna_BuyStones_Condition;
	information = DIA_Hanna_BuyStones_Info;
	permanent = TRUE;
	description = "Přinesl jsem ti něco na prodej.";
};

func int DIA_Hanna_BuyStones_Condition()
{
	if((HannaBuyStones == TRUE) && ((Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD) >= 1) || (Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY) >= 1) || (Npc_HasItems(other,ItMi_Diamod) >= 1) || (Npc_HasItems(other,ItMi_Emerald) >= 1) || (Npc_HasItems(other,ItMi_Topaz) >= 1) || (Npc_HasItems(other,ItMi_Opal) >= 1) || (Npc_HasItems(other,ItMi_Sapphire) >= 1) || (Npc_HasItems(other,ItMi_Ruby) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hanna_BuyStones_Info()
{
	AI_Output(other,self,"DIA_Hanna_BuyStones_01_00");	//Přinesl jsem ti něco na prodej.
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_01");	//Dobře, ta se tedy podívejme.
	Info_ClearChoices(DIA_Hanna_BuyStones);
	Info_AddChoice(DIA_Hanna_BuyStones,DIALOG_BACK,DIA_Hanna_BuyStones_Back);

	if((Npc_HasItems(other,ItMi_Diamod) > 0) || (Npc_HasItems(other,ItMi_Emerald) > 0) || (Npc_HasItems(other,ItMi_Topaz) > 0) || (Npc_HasItems(other,ItMi_Opal) > 0) || (Npc_HasItems(other,ItMi_Sapphire) > 0) || (Npc_HasItems(other,ItMi_Ruby) > 0))
	{
		Info_AddChoice(DIA_Hanna_BuyStones,"Prodej všechny kameny/klenoty.",DIA_Hanna_BuyStones_Stones);
	};
	if((Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD) > 0) || (Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY) > 0))
	{
		Info_AddChoice(DIA_Hanna_BuyStones,"Prodej všechny šperkovnice.",DIA_Hanna_BuyStones_Chests);
	};
};

func void DIA_Hanna_BuyStones_Back()
{
	Info_ClearChoices(DIA_Hanna_BuyStones);
};

func void DIA_Hanna_BuyStones_Stones()
{
	var int misc_03;
	var int misc_04;
	var int misc_05;
	var int misc_06;
	var int misc_07;
	var int misc_08;
	var int misc_all;

	misc_03 = Npc_HasItems(other,ItMi_Diamod);	
	misc_04 = Npc_HasItems(other,ItMi_Emerald);
	misc_05 = Npc_HasItems(other,ItMi_Topaz);
	misc_06 = Npc_HasItems(other,ItMi_Opal);
	misc_07 = Npc_HasItems(other,ItMi_Sapphire);
	misc_08 = Npc_HasItems(other,ItMi_Ruby);

	misc_03 = misc_03 * 750;
	misc_04 = misc_04 * 450;
	misc_05 = misc_05 * 150;
	misc_06 = misc_06 * 300;
	misc_07 = misc_07 * 450;
	misc_08 = misc_08 * 450;

	misc_all = misc_03 + misc_04 + misc_05 + misc_06 + misc_07 + misc_08;

	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMi_Diamod,Npc_HasItems(other,ItMi_Diamod));
	Npc_RemoveInvItems(other,ItMi_Emerald,Npc_HasItems(other,ItMi_Emerald));
	Npc_RemoveInvItems(other,ItMi_Topaz,Npc_HasItems(other,ItMi_Topaz));
	Npc_RemoveInvItems(other,ItMi_Opal,Npc_HasItems(other,ItMi_Opal));
	Npc_RemoveInvItems(other,ItMi_Sapphire,Npc_HasItems(other,ItMi_Sapphire));
	Npc_RemoveInvItems(other,ItMi_Ruby,Npc_HasItems(other,ItMi_Ruby));
	AI_PlayAni(self,"T_YES");
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_02");	//Hmmm... Dobře, myslím že vše koupím.
	AI_Output(other,self,"DIA_Hanna_BuyStones_01_03");	//A zlaťáky?
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_04");	//Tady to je, tvoje odměna.
	B_GiveInvItems(self,other,ItMi_Gold,misc_all);
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_05");	//A věř mi, tohle je mnohem víc než bys kdy dostal od jiných zdejších obchodníků.
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_06");	//Pokud budeš mít něco dalšího na prodej, víš kde mě najdeš.
	Info_ClearChoices(DIA_Hanna_BuyStones);
};

func void DIA_Hanna_BuyStones_Chests()
{
	var int misc_01;
	var int misc_02;
	var int misc_all;

	misc_01 = Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD); 
	misc_02 = Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY);

	misc_01 = misc_01 * 45;
	misc_02 = misc_02 * 60;

	misc_all = misc_01 + misc_02;

	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ITMI_CHEST_EMPTYGOLD,Npc_HasItems(other,ITMI_CHEST_EMPTYGOLD));
	Npc_RemoveInvItems(other,ITMI_JEWELERYCHEST_EMPTY,Npc_HasItems(other,ITMI_JEWELERYCHEST_EMPTY));
	AI_PlayAni(self,"T_YES");
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_02");	//Hmmm... Jo můj drahý. Myslím, že si vezmu všechno.
	AI_Output(other,self,"DIA_Hanna_BuyStones_01_03");	//A peníze?
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_04");	//Neboj. Zde je tvá odměna.
	B_GiveInvItems(self,other,ItMi_Gold,misc_all);
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_05");	//A věř mi, tohle je mnohem víc než bys kdy dostal od jiných zdejších obchodníků.
	AI_Output(self,other,"DIA_Hanna_BuyStones_01_06");	//Pokud budeš mít něco dalšího na prodej, víš kde mě najdeš.
	Info_ClearChoices(DIA_Hanna_BuyStones);
};

instance DIA_Hanna_Schuldenbuch(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Schuldenbuch_Condition;
	information = DIA_Hanna_Schuldenbuch_Info;
	permanent = FALSE;
	description = "Podívej, jakou knihu tu mám!";
};

func int DIA_Hanna_Schuldenbuch_Condition()
{
	if((Npc_HasItems(other,ItWr_Schuldenbuch) >= 1) && (LemarBookRead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//Podívej, jakou knihu tu mám!
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//Lehmarova účetní kniha. Jak jsi k ní přišel?
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//No...
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//Pokud už ji Lehmar nemá, je to dobrá věc. Stejně bych ji ale radši ukryla u sebe.
};

instance DIA_Hanna_GiveSchuldenbuch(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_GiveSchuldenbuch_Condition;
	information = DIA_Hanna_GiveSchuldenbuch_Info;
	permanent = FALSE;
	description = "Tumáš - klidně si tu knihu vezmi.";
};

func int DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Schuldenbuch) && (Npc_HasItems(other,ItWr_Schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hanna_GiveSchuldenbuch_Info()
{
	B_GivePlayerXP(XP_Schuldenbuch);
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//Tumáš - klidně si tu knihu vezmi.
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	Npc_RemoveInvItems(self,ItWr_Schuldenbuch,1);
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//Díky.
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//Tady máš něco za odměnu.
	B_GiveInvItems(self,other,ItMi_Emerald,1);
	HannaTakeBuh = TRUE;
};

func void Hanna_Blubb()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_37");	//Je v úkrytu všechno v pořádku?
	AI_Output(self,other,"DIA_Hanna_Add_17_39");	//Už jsem nikoho z nich nějakou dobu neviděla.
	AI_Output(self,other,"DIA_Hanna_Add_17_40");	//Měla bych sejít tam dolů a trochu to tam prošetřit.
	AI_Output(self,other,"DIA_Hanna_Add_17_38");	//Ano, ale radši bys o tom neměl mluvit.
	AI_Output(other,self,"DIA_Hanna_Add_15_25");	//Víš o tom úkrytu zlodějů v tvém sklepě?
	AI_Output(self,other,"DIA_Hanna_Add_17_26");	//(domýšlivě) Nemám potuchy, o čem to mluvíš.
	AI_Output(self,other,"DIA_Hanna_Add_17_32");	//Vtrhla sem domobrana - někdo vyzradil naši skrýš!
	AI_Output(self,other,"DIA_Hanna_Add_17_33");	//Mně neměli co přišít, ale Cassia je mrtvá a její lidé taky!
	AI_Output(self,other,"DIA_Hanna_Add_17_34");	//Určitě jsi to byl TY.
	AI_Output(self,other,"DIA_Hanna_Add_17_35");	//Tohle jsem koupila zvlášť pro tebe.
	AI_Output(self,other,"DIA_Hanna_Add_17_36");	//Stálo mě to sice majlant, ale ty si to fakt zasloužíš, ty svině podrazácká.
};

instance DIA_HANNA_INKNAST(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = dia_hanna_inknast_condition;
	information = dia_hanna_inknast_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_hanna_inknast_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISKNAST == TRUE) && (HANNAISFREE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hanna_inknast_info()
{
	AI_Output(self,other,"DIA_Hanna_InKnast_01_00");	//Nemluv na mě.
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_ISFREE(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = dia_hanna_isfree_condition;
	information = dia_hanna_isfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_isfree_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISFREE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hanna_isfree_info()
{
	AI_Output(self,other,"DIA_Hanna_IsFree_01_00");	//Díky za pomoc.
	AI_Output(self,other,"DIA_Hanna_IsFree_01_01");	//Jsem tvá dlužnice!
	AI_Output(other,self,"DIA_Hanna_IsFree_01_02");	//To nestojí za řeč.
	AI_Output(self,other,"DIA_Hanna_IsFree_01_03");	//Ale ano. Zasloužíš si odměnu za tvou práci.
	B_GiveInvItems(self,other,ItSe_HannasBeutel,1);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//Co jsi mi to dala?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//To je klíč k bráně, vedoucí k pokladu.
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Hanna mi dala odměnu za mou pomoc. Nyní bych jí měl dát náhrdelník od Abigail a vrátit se zpět.");
};

instance DIA_HANNA_GOLDNECKLACEHANNA(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = dia_hanna_goldnecklacehanna_condition;
	information = dia_hanna_goldnecklacehanna_info;
	permanent = FALSE;
	description = "Tvá sestra ti posílá tento náhrdelník.";
};


func int dia_hanna_goldnecklacehanna_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (Npc_HasItems(other,ITMI_HANNAGOLDNECKLACE) >= 1) && (HANNAISFREE == TRUE))
	{
		return TRUE;
	};
};

func void dia_hanna_goldnecklacehanna_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Hanna_GoldNecklaceHanna_01_00");	//Tvá sestra ti posílá tento náhrdelník.
	AI_Output(self,other,"DIA_Hanna_GoldNecklaceHanna_01_01");	//Ano?!
	AI_Output(other,self,"DIA_Hanna_GoldNecklaceHanna_01_02");	//Ano - tady je.
	B_GiveInvItems(other,self,ITMI_HANNAGOLDNECKLACE,1);
	Npc_RemoveInvItems(self,ITMI_HANNAGOLDNECKLACE,Npc_HasItems(self,ITMI_HANNAGOLDNECKLACE));
	AI_Output(self,other,"DIA_Hanna_GoldNecklaceHanna_01_03");	//Ach!... Nádhera!
	AI_Output(self,other,"DIA_Hanna_GoldNecklaceHanna_01_07");	//Jestli se ještě uvidíte, pověz jí, že jí děkuji.
	AI_Output(other,self,"DIA_Hanna_GoldNecklaceHanna_01_08");	//Dobrá, tak já půjdu.
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Dal jsem Hanně náhrdelník od Abigail. Teď bych jí to měl říct!");
	HANNATAKESNECKLACE = TRUE;
};

instance DIA_Hanna_HauntedLH(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_HauntedLH_condition;
	information = DIA_Hanna_HauntedLH_info;
	permanent = FALSE;
	description = "Neznáš náhodou někoho jménem Stefan?";
};

func int DIA_Hanna_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_HauntedLH_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_00");	//Neznáš náhodou někoho jménem Stefan?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_01");	//Stefan? Proč se ptáš?
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_02");	//Našel jsem tento stříbrný prsten. Je na něm nápis 'Stefanovi od Ha ...'. Tak jsem si myslel...
	B_GiveInvItems(other,self,ItMi_StafanRing,1);
	Npc_RemoveInvItems(self,ItMi_StafanRing,1);
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_03");	//Och... To bylo tak dávno a přece na to nemůžu zapomenout.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_04");	//Takže ho znáš?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_05");	//Samozřejmě, protože to já jsem ho Stefanovi dala.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_06");	//A kdo to byl ten Stefan?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_07");	//Pracoval v majáku jako jeho správce. Když byl mladší, často jsem tam chodívala.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_08");	//Dalo by se říct, že jsme si byli celkem blízcí. A potom... ho někdo zabil.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_09");	//Nedokážu si představit, proč by to někdo dělal. Stefan byl milý a slušný člověk. Neublížil by ani mouše.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_10");	//Našel jsem jeho pozůstatky v majáku. Proč nebyl pohřben?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_11");	//Pravděpodobně protože ho nikdo neměl rád, krom mě.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_12");	//Potom někdo začal šírit drby, že na majáku se začali zjevovat duchové. A od té doby se tomu místu každý vyhýbá.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_13");	//Navíc je to skvělé místo na ukrytí tajemství. Pokud víš co myslím.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_14");	//Možná. A Stefan nic neskrýval?
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_15");	//Těsně před vraždou se mi začal vyhýbat. Říkal, že měl nějaké důležité věci na práci v majáku.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_16");	//Nejdřív jsem si myslela, že mě už nemiluje. Ale později jsem zjistila, že se dostal do nějakých problémů a nechtěl mě do toho zatahovat.
	AI_Output(self,other,"DIA_Hanna_HauntedLH_01_17");	//Nevadilo by ti, když bych si ten prsten nechala? Připomíná mi časy, když jsem byla šťastná.
	AI_Output(other,self,"DIA_Hanna_HauntedLH_01_18");	//Ne, klidně si ho nechej.
	KnowStefan = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Ten prsten darovala ještě před lety Hanna svému příteli, kterého pak zjevně někdo zavraždil v majáku.");
};
