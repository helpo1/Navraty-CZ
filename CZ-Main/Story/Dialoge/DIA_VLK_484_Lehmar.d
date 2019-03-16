var int LehmarLostBookDay;

instance DIA_Lehmar_EXIT(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 999;
	condition = DIA_Lehmar_EXIT_Condition;
	information = DIA_Lehmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_ENTSCHULDIGUNG(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 2;
	condition = DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information = DIA_Lehmar_ENTSCHULDIGUNG_Info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int DIA_Lehmar_ENTSCHULDIGUNG_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info()
{
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_01");	//Kolik chceš?
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_02");	//Co tím myslíš, 'kolik'?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_03");	//Jsem lichvář a ty jsi přišel za mnou! Co bys tak ode mě mohl chtít? Peníze, samozřejmě.
};

instance DIA_Lehmar_LemarTheft(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_LemarTheft_Condition;
	information = DIA_Lehmar_LemarTheft_Info;
	permanent = FALSE;
	description = "I tak pochybuji, že mi je dáš jenom tak.";
};

func int DIA_Lehmar_LemarTheft_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lehmar_ENTSCHULDIGUNG) == TRUE) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_LemarTheft_Info()
{
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_00");	//I tak pochybuji, že mi je dáš jenom tak.
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_01");	//No, ne vždycky... (usmívá se) Ve většině případů si beru něco cenného do zálohy!
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_02");	//To v případě, že někdo není schopen dostát svých povinoostí!
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_03");	//Bez toho, už bych byl dávno na mizině. Ale některé věci mi zcela zaplatí mé výlohy.
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_04");	//A co s nima děláš potom? Prodáváš je?
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_05");	//Některé prodám, některé zůstanou u mě.
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_06");	//Možná, pokud mi dovolíš, bych se podíval na to, co máš vystaveno k prodeji?
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_07");	//Hmmm...(zamyšleně) Já nevím! Ty mi nepřípadáš jako bohatý člověk.
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_08");	//A všechny ty věci jsou dost drahé!
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_09");	//Já mám peníze.
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_10");	//Dokaž to! Například, kolik máš teď u sebe?
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_11");	//Tady, podívej se.

	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		B_GivePlayerXP(300);
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_12");	//Hmmm...(překvapeně) Jsem ohromen! Máš tady víc než tisíc zlatých.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_13");	//Vypadá to, že jsi opravdu bohatý! I když ty to nemůžeš říct.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_14");	//(iniciativně) Dobře, tak já ti ukážu část mého zboží.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_15");	//Věřím, že tě bude velice zajímat!
		B_LogEntry(Topic_LemarTheft,"Dosáhl jsem u Lehmara toho, že souhlasil s tím, že mi prodá věci, které zůstaly v záloze.");
		LehmarTrade = TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_16");	//Hmmm. (usmívá se) No, to není zlé! Na první pohled, má u sebe víc než pět set mincí.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_17");	//Peníze sice máš u sebe! Ale nemyslím si, že by to mělo stačit k tomu, aby sis mohl koupit moje věci.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_18");	//Promiň.
		LehmarNoTrade = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_19");	//(posmívá se) No co to? Máš tak akorát něco málo přes sto mincí.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_20");	//Moje věci jsou o dost dražší. Takže nemáme už spolu o čem mluvit.
		LehmarNoTrade = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_21");	//Hmmm. (pohrdavě) I odtud můžu vidět, že jsi chudý.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_22");	//Radši si najdi práci! A na moje zboží zapomeň (zívá) Nejsou pro takové jako jsi ty.
		LehmarNoTrade = TRUE;
		AI_StopProcessInfos(self);
	};
};

instance DIA_Lehmar_Trade(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 5;
	condition = DIA_Lehmar_Trade_Condition;
	information = DIA_Lehmar_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};

func int DIA_Lehmar_Trade_Condition()
{
	if(LehmarTrade == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};

instance DIA_Lehmar_LemarTheft_Again(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_LemarTheft_Again_Condition;
	information = DIA_Lehmar_LemarTheft_Again_Info;
	permanent = TRUE;
	description = "Teď už mám dost peněz, abych si mohl koupit tvoje věci.";
};

func int DIA_Lehmar_LemarTheft_Again_Condition()
{
	if((LehmarNoTrade == TRUE) && (LehmarTrade == FALSE) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_LemarTheft_Again_Info()
{
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_Again_01_00");	//Teď už mám dost peněz, abych si mohl koupit tvoje věci.
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_01");	//Jo? (se zájmem) No tak, pochlub se.
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_Again_01_02");	//Tu, Podívej.

	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_03");	//(překvapeně) Jsem ohromen! Máš tady víc než tisíc zlatých.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_04");	//Vypadá to, že jsi opravdu bohatý! I když ty to nemůžeš říct.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_05");	//(iniciativně) Dobře, tak já ti ukážu část mého zboží.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_06");	//Věřím, že tě bude velice zajímat!
		B_LogEntry(Topic_LemarTheft,"Dosáhl jsem u Lehmara toho, že souhlasil s tím, že mi prodá věci, které zůstaly v záloze.");
		LehmarTrade = TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_07");	//Hmmm. (usmívá se) No, to není zlé! Na první pohled, má u sebe víc než pět set mincí.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_08");	//Peníze sice máš u sebe! Ale nemyslím si, že by to mělo stačit k tomu, aby sis mohl koupit moje věci.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_09");	//Promiň.
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_10");	//(posmívá se) No co to? Máš tak akorát něco málo přes sto mincí.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_11");	//Moje věci jsou o dost dražší. Takže nemáme už spolu o čem mluvit.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_12");	//Hmmm. (pohrdavě) I odtud můžu vidět, že jsi chudý.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_13");	//Tak to na moje zboží zapomeň (zívá) Nejsou pro takové jako jsi ty.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Lehmar_Relic(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_Relic_Condition;
	information = DIA_Lehmar_Relic_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lehmar_Relic_Condition()
{
	if((Npc_HasItems(hero,ItMi_ParlanRelic_MIS) >= 1) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Relic_Info()
{
	AI_Output(self,other,"DIA_Lehmar_Relic_01_00");	//Věděl jsem, že bude mít o to zájem!
	AI_Output(self,other,"DIA_Lehmar_Relic_01_01");	//Dal to sem do zálohy jeden z mágu Ohně.
	AI_Output(self,other,"DIA_Lehmar_Relic_01_02");	//Bohužel, ukázalo se, že mě je úplně k ničemu.
	AI_Output(self,other,"DIA_Lehmar_Relic_01_03");	//Proto jsem rád, že se jí konečně zbavím...(docela) výhodná koupě!
	AI_StopProcessInfos(self);
};

instance DIA_Lehmar_GELDLEIHEN(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_GELDLEIHEN_Condition;
	information = DIA_Lehmar_GELDLEIHEN_Info;
	permanent = TRUE;
	description = "Půjč mi nějaké peníze!";
};

var int DIA_Lehmar_GELDLEIHEN_noPerm;

func int DIA_Lehmar_GELDLEIHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lehmar_ENTSCHULDIGUNG) && (DIA_Lehmar_GELDLEIHEN_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_15_00");	//Půjč mi nějaké peníze!
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_09_01");	//Jasně! Kolik bys chtěl? Počítám si 20 procent!
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"Budu o tom přemýšlet.",DIA_Lehmar_GELDLEIHEN_back);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"1000 zlatých.",DIA_Lehmar_GELDLEIHEN_1000);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"200 zlatých",DIA_Lehmar_GELDLEIHEN_200);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"50 zlatých.",DIA_Lehmar_GELDLEIHEN_50);
};

func void DIA_Lehmar_GELDLEIHEN_back()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_back_09_01");	//Zamysli se rychleji! Neplýtvej mým časem nadarmo!
	AI_StopProcessInfos(self);
};

func void DIA_Lehmar_GELDLEIHEN_50()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//50 zlatých.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_50_09_01");	//Malá ryba, co? Chci to zítra zpátky, jasný?
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 50;
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_200()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_200_15_00");	//200 zlatých.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_200_09_01");	//To je spousta peněz. Chci tě tu zítra vidět a ty prachy taky, rozumíme si?
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 200;
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_1000()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_15_00");	//1000 zlatých.

	if(RhetorikSkillValue[1] >= 10)
	{
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_03");	//(udiveně) Tisíc zlatých?! Víš, to je dost velká suma.
		AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_09_04");	//Jak jde vidět, asi nemáš dost peněz.
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_05");	//Peníze jsou, ale já dost riskuju tím, že ti půjčím tolik zlata.
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_06");	//Dobře. (zamyšleně) Dám ti tisíc zlatých.
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_07");	//Ale zítra mi je doneseš zpět! A s úrokem. Je to jasné?
		AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_09_08");	//Dohodnuto.
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_09");	//Podívej! Hlavně mě neoklamej.

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		CreateInvItems(self,ItMi_Gold,1000);
		B_GiveInvItems(self,other,ItMi_Gold,1000);
		DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
		Lehmar_GeldGeliehen_Day = Wld_GetDay();
		Lehmar_GeldGeliehen = 1000;
		Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_01");	//Máš to v hlavě vše v pořádku?
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_02");	//Dám ti sto. A nezapomeň mi to zítra donést!
		CreateInvItems(self,ItMi_Gold,100);
		B_GiveInvItems(self,other,ItMi_Gold,100);
		DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
		Lehmar_GeldGeliehen_Day = Wld_GetDay();
		Lehmar_GeldGeliehen = 100;
		Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	};
};


instance DIA_Lehmar_WARUMGELD(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_WARUMGELD_Condition;
	information = DIA_Lehmar_WARUMGELD_Info;
	permanent = FALSE;
	description = "Ty vždycky tak jednoduše rozdáváš peníze?";
};

func int DIA_Lehmar_WARUMGELD_Condition()
{
	if(Lehmar_GeldGeliehen != 0)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info()
{
	AI_Output(other,self,"DIA_Lehmar_WARUMGELD_15_00");	//Ty vždycky tak jednoduše rozdáváš peníze?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_01");	//Neboj se. Vrátíš se. Jinak si tě najdu a zabiju. Je to tak jednoduché.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_02");	//Ty máš tak osobitej ksicht, že mi nezabere moc času, abych si tě našel.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_03");	//Takže ani nepomysli na nějakou boudu.
};

var int Lehmar_vorbei;

instance DIA_Lehmar_GELDEINTREIBEN(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 5;
	condition = DIA_Lehmar_GELDEINTREIBEN_Condition;
	information = DIA_Lehmar_GELDEINTREIBEN_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_GELDEINTREIBEN_Condition()
{
	if((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)) && (Lehmar_GeldGeliehen != 0) && (RangerHelp_LehmarKohle == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_Info()
{
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_00");	//Nevrátil si dluh, ty bastarde! Dej sem moje prachy! A když ti to musím připomínat, procento půjde nahorů.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_01");	//Bude tě to stát 30 procent namísto těch 20.
	Info_ClearChoices(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN,"Splatím svůj dluh.",DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN,"Nedám ti nic.",DIA_Lehmar_GELDEINTREIBEN_kannstmich);
};

func void DIA_Lehmar_GELDEINTREIBEN_kannstmich()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00");	//Nedám ti nic.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01");	//Ale ano, dáš!
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00");	//Splatím svůj dluh.

	if(Lehmar_GeldGeliehen == 50)
	{
		Lehmar_GeldGeliehen_MitZinsen = 65;
	};
	if(Lehmar_GeldGeliehen == 200)
	{
		Lehmar_GeldGeliehen_MitZinsen = 260;
	};
	if(Lehmar_GeldGeliehen == 100)
	{
		Lehmar_GeldGeliehen_MitZinsen = 130;
	};
	if(Lehmar_GeldGeliehen == 1000)
	{
		Lehmar_GeldGeliehen_MitZinsen = 1300;
	};
	IntToFloat(Lehmar_GeldGeliehen_MitZinsen);

	if(Npc_HasItems(other,ItMi_Gold) >= Lehmar_GeldGeliehen_MitZinsen)
	{
		B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeliehen_MitZinsen);
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01");	//To máš štěstí! A teď se ztrať!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02");	//Nemáš u sebe dost peněz! Dobrá, jak chceš. Vidím, že bych ti měl dát lekci.
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03");	//Neber si to nijak osobně - musím si udržovat svou pověst.
		Lehmar_vorbei = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Lehmar_GELDZURUECK(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 6;
	condition = DIA_Lehmar_GELDZURUECK_Condition;
	information = DIA_Lehmar_GELDZURUECK_Info;
	permanent = TRUE;
	description = "Tady jsou tvoje peníze!";
};


func int DIA_Lehmar_GELDZURUECK_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTREIBEN) && (Lehmar_GeldGeliehen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDZURUECK_15_00");	//Tady jsou tvoje peníze!

	if((RangerHelp_LehmarKohle == TRUE) && (Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)))
	{
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_00");	//Nech si je. Lares se už o to postaral.
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_01");	//Vypadá, že se kamarádíčkuješ s tím podvodníkem, co? Dobře, není to můj problém. hodně štěstí!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Lehmar_GeldGeliehen == 50)
		{
			Lehmar_GeldGeliehen_MitZinsen = 60;
		};
		if(Lehmar_GeldGeliehen == 200)
		{
			Lehmar_GeldGeliehen_MitZinsen = 240;
		};
		if(Lehmar_GeldGeliehen == 100)
		{
			Lehmar_GeldGeliehen_MitZinsen = 120;
		};
		if(Lehmar_GeldGeliehen == 1000)
		{
			Lehmar_GeldGeliehen_MitZinsen = 1200;
		};
		IntToFloat(Lehmar_GeldGeliehen_MitZinsen);

		if(Npc_HasItems(other,ItMi_Gold) >= Lehmar_GeldGeliehen_MitZinsen)
		{
			B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeliehen_MitZinsen);
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_01");	//Výborně! S tebou se dělaj obchody jedna radost.
			Lehmar_GeldGeliehen = 0;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_02");	//Nemáš dost peněz! Vrať se, až to budeš mít pohromadě. Ještě máš trochu času. Pamatuj, 20 procent!
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Lehmar_NOCHMALGELD(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 8;
	condition = DIA_Lehmar_NOCHMALGELD_Condition;
	information = DIA_Lehmar_NOCHMALGELD_Info;
	permanent = TRUE;
	description = "Můžu si u tebe půjčit peníze?";
};

func int DIA_Lehmar_NOCHMALGELD_Condition()
{
	if((Lehmar_GeldGeliehen == 0) && (Lehmar_GeldGeliehen_MitZinsen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_NOCHMALGELD_Info()
{
	AI_Output(other,self,"DIA_Lehmar_NOCHMALGELD_15_00");	//Můžu si u tebe půjčit peníze?

	if(Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTREIBEN) || Npc_KnowsInfo(other,DIA_Lehmar_BuchWeg))
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_01");	//To si myslíš, že jsem blbej? Vypadni!
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_02");	//Teď už ne! Měl jsem velké výdaje a potřebuju každý zlaťák.
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//Vrať se za pár dní!
	};
};

instance DIA_Lehmar_PICKPOCKET(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 900;
	condition = DIA_Lehmar_PICKPOCKET_Condition;
	information = DIA_Lehmar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Pokusit se ukrást jeho knihu dlužníků)";
};

func int DIA_Lehmar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,Dialog_Back,DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if(other.attribute[ATR_DEXTERITY] >= 15)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};

		B_GiveInvItems(self,other,ItWr_Schuldenbuch,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		LehmarLostBookDay = Wld_GetDay();
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
};


instance DIA_Lehmar_BuchWeg(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_BuchWeg_Condition;
	information = DIA_Lehmar_BuchWeg_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_BuchWeg_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (LehmarLostBookDay > 0) && (LehmarLostBookDay < Wld_GetDay()) && (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_BuchWeg_Info()
{
	AI_Output(self,other,"DIA_Lehmar_Add_09_00");	//Nějakej mizernej zloděj mi šlohnul moji účetní knihu.
	AI_Output(self,other,"DIA_Lehmar_Add_09_01");	//Nemáš s tím náhodou nic společného, že ne?
	AI_Output(other,self,"DIA_Addon_Lehmar_Add_15_02");	//Já? Ne.
	AI_Output(self,other,"DIA_Lehmar_Add_09_03");	//Ano, ano, dobrá. Tak se pakuj!
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_verhauen(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_verhauen_Condition;
	information = DIA_Lehmar_verhauen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lehmar_verhauen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		if((self.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_KnowsInfo(other,DIA_Lehmar_BuchWeg) || (Lehmar_vorbei == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Lehmar_verhauen_Info()
{
	B_Say(self,other,"$NOTNOW");
};

var int ShramCanFight;

instance DIA_LEHMAR_KILLNOW(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = dia_lehmar_killnow_condition;
	information = dia_lehmar_killnow_info;
	description = "Pozdravuje tě Asmal!";
};

func int dia_lehmar_killnow_condition()
{
	if(MIS_KILLTARGET2 == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lehmar_killnow_info()
{
	var C_Npc guardian;

	guardian = Hlp_GetNpc(vlk_6120_lemarguard);
	AI_Output(other,self,"DIA_Lehmar_KillNow_01_00");	//Pozdravuje tě Asmal!
	AI_Output(self,other,"DIA_Lehmar_KillNow_01_03");	//Co? (zmateně) Takže naznačuješ, že pracuješ pro toho bastarda?
	AI_Output(self,other,"DIA_Lehmar_KillNow_01_05");	//Ha! To jsem si mohl myslet!
	AI_Output(self,other,"DIA_Lehmar_KillNow_01_06");	//Takže to vypadá, že tě poslal za mnou!
	AI_Output(self,other,"DIA_Lehmar_KillNow_01_07");	//No obávám se, že mu to prd pomůže. Takového usoplence jako jsi ty, se bát nebudu.

	if((ShramIsDead == FALSE) && (Npc_GetDistToNpc(self,guardian) <= 600))
	{
		AI_Output(self,other,"DIA_Lehmar_KillNow_01_15");	//Můj osobní strážce z tebe nadělá fašírku!
		AI_Standup(self);
		AI_GotoNpc(self,guardian);
		AI_TurnToNPC(self,guardian);
		AI_Output(self,other,"DIA_Lehmar_KillNow_01_16");	//Hej, ty! Nestůj jak zkaměnělý!
		AI_Output(self,other,"DIA_Lehmar_KillNow_01_17");	//Víš, co máš dělat! Vypořádej se s ním, jsi za to placený!
		AI_TurnToNPC(self,other);
		ShramCanFight = TRUE;
	};

	AI_Output(self,other,"DIA_Lehmar_KillNow_01_18");	//Neměl si s tou prácičkou souhlasit chlape! Je to na tebe příliš moc... (šklebí se)
	Info_ClearChoices(dia_lehmar_killnow);
	Info_AddChoice(dia_lehmar_killnow,"...(Ještě uvidíme!)",dia_lehmar_killnow_figth);
};

func void dia_lehmar_killnow_figth()
{	
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);

	if(ShramCanFight == TRUE)
	{
		B_Attack(vlk_6120_lemarguard,other,AR_ReactToWeapon,0);
	};
};

instance DIA_Lehmar_Job(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_Job_Condition;
	information = DIA_Lehmar_Job_Info;
	permanent = FALSE;
	description = "A ty by si pro mě nenašel nějakou práci?";
};

func int DIA_Lehmar_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lehmar_ENTSCHULDIGUNG) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Job_Info()
{
	AI_Output(other,self,"DIA_Lehmar_Job_01_00");	//A ty by si pro mě nenašel nějakou práci?
	AI_Output(self,other,"DIA_Lehmar_Job_01_01");	//Chceš pracovat pro mě? (zamyšleně) Hmm... no dobře tedy.
	AI_Output(self,other,"DIA_Lehmar_Job_01_02");	//Mám tráble s jedním člověkem.
	AI_Output(other,self,"DIA_Lehmar_Job_01_03");	//Co ti provedl?
	AI_Output(self,other,"DIA_Lehmar_Job_01_04");	//Vzal si ode mě velkou sumu zlata!
	AI_Output(self,other,"DIA_Lehmar_Job_01_05");	//Jak mi řekl - poveldo se mu velice rychle zbohatnout prodejem trávy z bažin v přístavu.
	AI_Output(self,other,"DIA_Lehmar_Job_01_06");	//Slíbil, že vrátí dvakrát tolik peněz než jsem mu půjčil. Nikdy se ale neukázal!
	AI_Output(self,other,"DIA_Lehmar_Job_01_07");	//Tedy, (vážně) Najdi ho a vrať mi moje peníze! 
	AI_Output(self,other,"DIA_Lehmar_Job_01_08");	//Pokud ty peníze nebude mít u sebe, tak ho prostě zabíj.
	AI_Output(self,other,"DIA_Lehmar_Job_01_09");	//Ale udělej to potichu! Nechci mít nic společného s těma, co obchodují s trávou z bažin.
	AI_Output(self,other,"DIA_Lehmar_Job_01_10");	//Koneckonců zákony města vězní za tokovéto praktiky.
	AI_Output(other,self,"DIA_Lehmar_Job_01_11");	//Dobře. Kde ho můžu najít?
	AI_Output(self,other,"DIA_Lehmar_Job_01_12");	//(kření se) To kdybych věděl, tak je dávno po problému.
	AI_Output(self,other,"DIA_Lehmar_Job_01_13");	//Doufám, že je ti to jasné?
	AI_Output(other,self,"DIA_Lehmar_Job_01_14");	//To je.
	MIS_LehmarDebt = LOG_Running;
	Log_CreateTopic(TOPIC_LehmarDebt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LehmarDebt,LOG_Running);
	B_LogEntry(TOPIC_LehmarDebt,"Jeden chlápek si od Lehmara půčjil slušnou sumičku s tím, že ví, jak rychle zbohatnout na prodeji trávy z bažin. Peníze ale nevrátil. Lehmar po mě chce, abych ho a našel a peníze z něho vybil, nebo ho prostě zabil jako vyrování druhým.");
};

instance DIA_Lehmar_Job_Done(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_Job_Done_Condition;
	information = DIA_Lehmar_Job_Done_Info;
	permanent = TRUE;
	description = "Myslím, že jsem našel tvého dlužníka.";
};

func int DIA_Lehmar_Job_Done_Condition()
{
	if((MIS_LehmarDebt == LOG_Running) && (Npc_IsDead(Mil_328_Miliz) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Job_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Lehmar_Job_Done_01_00");	//Myslím, že jsem našel tvého dlužníka.
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_01");	//Výborně. (tiše) Kde jsou moje prachy?
	AI_Output(other,self,"DIA_Lehmar_Job_Done_01_02");	//Ukázalo se, že je u sebe neměl. Zato, měl u sebe velký balík trávy z bažin.
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_03");	//A co jsi udělal?
	AI_Output(other,self,"DIA_Lehmar_Job_Done_01_04");	//Zabil jsem ho. Jak si mi příkázal!
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_05");	//Výborně. Dobře si si poradil s mým úkolem.
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_06");	//Trávu si můžeš nechat u sebe - jako odměnu!
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_07");	//A teď padej! Mám lepší věci na práci.
	MIS_LehmarDebt = LOG_Success;
	Log_SetTopicStatus(TOPIC_LehmarDebt,LOG_Success);
	B_LogEntry(TOPIC_LehmarDebt,"Lehmar byl spokojen s tím jak jsem vyřídil jeho dlužníka.");
	AI_StopProcessInfos(self);
};