
instance DIA_Addon_10023_Wache_EXIT(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_10023_Wache_Hi(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10023_Wache_Hi_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= 300)
	{
		return TRUE;
	};
};

func void DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_00");	//Hej, kam jdeš? Ty chceš tudy projít?
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_01");	//No, samozřejmě. Proč ne?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_02");	//Jsou tam ještě další otroci. Řekl bych, že můžeš dovnitř, ale moc je nebij, potřebujeme, aby mohli ješte pracovat.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_03");	//Nakonec, přece nechceme, aby tu jen tak posedávali. Musí kopat zlato.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_04");	//Rozumím. A kdo to přikázal?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_05");	//Byl to Bloodwynův přímý rozkaz.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_06");	//Myslel jsem, že tady šéfuje Raven.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_07");	//Jasný, ale otroky dal Bloodwynovi. Už je totiž nepotřeboval.
	Pardos.attribute[ATR_HITPOINTS] = 70;
	B_LogEntry(TOPIC_Addon_Sklaven,"Raven už otroky dále nepotřebuje. Na povel je teď má Bloodwyn.");
};


var int PrisonGuard_Rules;

instance DIA_Addon_10023_Wache_go(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 99;
	condition = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent = TRUE;
	description = "Propusť otroky!";
};

func int DIA_Addon_10023_Wache_go_Condition()
{
	if(Ready_Togo == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_10023_Wache_go_Info()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_15_00");	//Propusť otroky!

	if(PrisonGuard_Rules == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_01");	//Poslouchej. Šéf je Bloodwyn a otroci patří jemu, takže on rozhodne, jestli budou propuštěni.
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_02");	//A mimo to, Thorus k tomu má taky co říct. Máš snad takové právo ty?
		PrisonGuard_Rules = TRUE;
		B_LogEntry(TOPIC_Addon_Sklaven,"Jen Bloodwyn a Thorus mají právo propustit otroky.");
	};

	AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_03");	//Máš k tomu co říct?
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
	Info_AddChoice(DIA_Addon_10023_Wache_go,Dialog_Back,DIA_Addon_10023_Wache_go_BACK);

	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if(Npc_IsDead(Bloodwyn) && (Npc_HasItems(other,ItMi_Addon_Bloodwyn_Kopf) >= 1))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"(ukázat Bloodwynovu hlavu)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"Já rozhoduji, kdo půjde do dolu!",DIA_Addon_10023_Wache_go_WER);
	};
};

func void DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_WER()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_WER_15_00");	//Já rozhoduju, kdo půjde do dolu!
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_WER_11_01");	//Děláš Estebanovu bývalou práci. Takže tady nerozhoduješ vůbec o ničem. Vodprejskni.
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

var int Wache_einmal;

func void DIA_Addon_10023_Wache_go_Blood()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_00");	//No, stačí to?
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_01");	//(znechuceně) Dej to pryč! Nechci TO vidět.
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_02");	//Myslím, že uděláš nejlíp, když otroky propustíš. TEĎ!
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_03");	//Počkej! Bloodwyn není jediný, kdo tu má slovo. Dokud nedostanu rozkaz od Thoruse, nikdo propuštěn nebude.

	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_ClearChoices(DIA_Addon_10023_Wache_go);
		Info_AddChoice(DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if(Wache_einmal == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_04");	//Ale říkal jsi přece, že otroci patří Bloodwynovi.
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_05");	//Jo, ale taky jsem říkal, že nikoho nepustím, dokud to nepřikáže Thorus.
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_06");	//Ty jsi takovej ten chlápek, co bez rozkazu neudělá ani krok, co?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_07");	//Ano, ale také jsem říkal...
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_08");	//... jo, jo, ušetři mě toho.
		};

		Info_ClearChoices(DIA_Addon_10023_Wache_go);
	};
};

func void DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_00");	//Mluvil jsem s Thorusem. Říkal, že otroci mají být propuštěni.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_01");	//Dobrá, když to říkal Thorus. Ale nechápu, jak se mohl takhle rozhodnout.
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_02");	//... ale za to abys chápal nejsi placen.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_03");	//Tak jo, tak jo. Jak vidím, už tu nejsem potřeba, tak se jdu trochu nadlábnout.
	Ready_Togo = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};
