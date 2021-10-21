
instance DIA_Regis_EXIT(C_Info)
{
	npc = VLK_425_Regis;
	nr = 999;
	condition = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Regis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Regis_PICKPOCKET(C_Info)
{
	npc = VLK_425_Regis;
	nr = 900;
	condition = DIA_Regis_PICKPOCKET_Condition;
	information = DIA_Regis_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Regis_PICKPOCKET_Condition()
{
	return C_Beklauen(40,35);
};

func void DIA_Regis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
	Info_AddChoice(DIA_Regis_PICKPOCKET,Dialog_Back,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Regis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
};

func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
};


instance DIA_Regis_Hallo(C_Info)
{
	npc = VLK_425_Regis;
	nr = 1;
	condition = DIA_Regis_Hallo_Condition;
	information = DIA_Regis_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Regis_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Regis_Hallo_Info()
{
	AI_Output(self,other,"DIA_Regis_Hallo_13_00");	//Hej, tys v tomhle městě nový co?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//Ano, a co ty?
	AI_Output(self,other,"DIA_Regis_Hallo_13_02");	//Přišel jsem z pevniny a teď se tu jen tak poflakuju. Už mi skoro došly peníze, takže mi nejspíš nezbude nic jiného, než se přidat k domobraně.
	AI_Output(self,other,"DIA_Regis_Hallo_13_03");	//Ale já tam nechci. Nemíním se nechat ve jménu krále zabít nějakými špinavými skřety.
};


instance DIA_Regis_MILIZ(C_Info)
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_MILIZ_Condition;
	information = DIA_Regis_MILIZ_Info;
	permanent = FALSE;
	description = "Co bys mi řekl o domobraně?";
};


func int DIA_Regis_MILIZ_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Regis_MILIZ_Info()
{
	AI_Output(other,self,"DIA_Regis_MILIZ_15_00");	//Co bys mi řekl o domobraně?
	AI_Output(self,other,"DIA_Regis_Add_13_01");	//Vede ji jeden z paladinů, jistý lord Andre.
	AI_Output(self,other,"DIA_Regis_Add_13_02");	//Pokouší se zmobilizovat půlku města pro případ, že by nás napadli skřeti.
	AI_Output(self,other,"DIA_Regis_Add_13_03");	//Ale chceš-li se nechat najmout, musíš se napřed stát občanem města.
	AI_Output(self,other,"DIA_Regis_Add_13_04");	//Pokud vím, tak ty nejsi zdejším občanem, takže i když budeš cvičit sebevíc, stejně tě oficiálně nepřijmou.
};


instance DIA_Regis_ANDRE(C_Info)
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_ANDRE_Condition;
	information = DIA_Regis_ANDRE_Info;
	permanent = FALSE;
	description = "Co dalšího mi ještě můžeš prozradit o lordu Andrem?";
};


func int DIA_Regis_ANDRE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_MILIZ))
	{
		return TRUE;
	};
};

func void DIA_Regis_ANDRE_Info()
{
	AI_Output(other,self,"DIA_Regis_ANDRE_15_00");	//Co dalšího mi ještě můžeš prozradit o lordu Andrem?
	AI_Output(self,other,"DIA_Regis_Add_13_05");	//Také tu zastává funkci soudce.
	AI_Output(self,other,"DIA_Regis_Add_13_06");	//Pokud ve městě něco provedeš, budeš se zodpovídat jemu.
	AI_Output(self,other,"DIA_Regis_Add_13_07");	//Jednou jsem se takhle s někým popral.
	AI_Output(self,other,"DIA_Regis_Add_13_08");	//On si pak šel stěžovat lordu Andremu a udal mě.
	AI_Output(self,other,"DIA_Regis_Add_13_09");	//Celá ta záležitost mě přišla na 50 zlatých.
	AI_Output(self,other,"DIA_Regis_Add_13_10");	//A to jsem měl kliku, že se to stalo v noci, a tak u toho nebyli žádní svědkové.
	AI_Output(self,other,"DIA_Regis_Add_13_11");	//Čím víc lidí si na tebe totiž stěžuje, tím vyšší pokutu pak musíš zaplatit.
};


instance DIA_Regis_Valentino(C_Info)
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_Valentino_Condition;
	information = DIA_Regis_Valentino_Info;
	permanent = FALSE;
	description = "S kým jsi bojoval?";
};


func int DIA_Regis_Valentino_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_ANDRE))
	{
		return TRUE;
	};
};

func void DIA_Regis_Valentino_Info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_12");	//S kým jsi bojoval?
	AI_Output(self,other,"DIA_Regis_Add_13_13");	//S chlápkem jménem Valentino - často se poflakuje kolem putyky poblíž chrámu.
	AI_Output(self,other,"DIA_Regis_Add_13_14");	//Já tedy nejsem žádný násilník, ale TENHLE maník si zaslouží, aby mu někdo pořádně zmaloval ciferník.
};


instance DIA_Regis_ValDefeat(C_Info)
{
	npc = VLK_425_Regis;
	nr = 5;
	condition = DIA_Regis_ValDefeat_Condition;
	information = DIA_Regis_ValDefeat_Info;
	permanent = FALSE;
	description = "Setkal jsem se s Valentinem...";
};


func int DIA_Regis_ValDefeat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Regis_Valentino) && (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Regis_ValDefeat_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Regis_Add_15_15");	//Setkal jsem se s Valentinem...
	AI_Output(self,other,"DIA_Regis_Add_13_16");	//A?
	AI_Output(other,self,"DIA_Regis_Add_15_17");	//Dal jsem mu pár facek.
	AI_Output(self,other,"DIA_Regis_Add_13_18");	//(směje se) Zasloužil si to.

	if(!Npc_IsDead(Valentino))
	{
		AI_Output(self,other,"DIA_Regis_Add_13_19");	//Tumáš - tenhle prsten jsem od něj získal, když se náš malý spor urovnal.
		B_GiveInvItems(self,other,ItRi_ValentinosRing,1);
		Regis_Ring = TRUE;
		AI_Output(self,other,"DIA_Regis_Add_13_20");	//(kření se) Můžeš ho pak věnovat prvnímu, kdo mu dá pár přes hubu.
	};
};


var int Regis_Bogendieb;

instance DIA_Regis_PERM(C_Info)
{
	npc = VLK_425_Regis;
	nr = 200;
	condition = DIA_Regis_PERM_Condition;
	information = DIA_Regis_PERM_Info;
	permanent = TRUE;
	description = "Stalo se tu něco zajímavého?";
};


func int DIA_Regis_PERM_Condition()
{
	return TRUE;
};

func void DIA_Regis_PERM_Info()
{
	AI_Output(other,self,"DIA_Regis_PERM_15_00");	//Stalo se tu něco zajímavého?

	if((Regis_Bogendieb == FALSE) && (MIS_Bosper_Bogen != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_01");	//Dalo by se to tak říct.
		AI_Output(self,other,"DIA_Regis_PERM_13_02");	//Okradli výrobce luků Bospera - takovou drzost aby pohledal!
		AI_Output(self,other,"DIA_Regis_PERM_13_03");	//Ten maník prostě za bílého dne vešel do krámu a rychle čmajznul jeden z luků.
		AI_Output(self,other,"DIA_Regis_PERM_13_04");	//A Bosper hned za ním a hulákal 'Stůj, ty zloději!'. Ale lupič byl rychlejší.
		MIS_Bosper_Bogen = LOG_Running;
		Regis_Bogendieb = TRUE;
	}
	else if((MIS_Bosper_Bogen == LOG_SUCCESS) && (Regis_Bogendieb != 2))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_05");	//Ale pak nějaký poctivý nálezce vrátil ukradený luk zpátky Bosperovi.
		AI_Output(self,other,"DIA_Regis_PERM_13_06");	//To je divné - člověk by si myslel, že se dnes každý stará jen sám o sebe, ale tenhle chlap byl jiný a luk vrátil.
		Regis_Bogendieb = 2;
	}
	else if(Kapitel != 3)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_07");	//No, všechno je v klidu. Počítám, že až sem přitáhnou skřeti, určitě si jich všimneme.
	}
	else if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_08");	//Nakonec zjistili, že ten žoldák je nevinný, a museli ho pustit.
		AI_Output(self,other,"DIA_Regis_PERM_13_09");	//Lord Hagen musí být vzteky bez sebe.
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_10");	//Je toho plné město. Pamatuješ se na paladina Lothara?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//Možná.
		AI_Output(self,other,"DIA_Regis_PERM_13_12");	//Tak ten je mrtvý. Zabili ho přímo na ulici a samozřejmě z toho obvinili žoldáky, jak jinak.
	};
};


instance DIA_Regis_Crew(C_Info)
{
	npc = VLK_425_Regis;
	nr = 51;
	condition = DIA_Regis_Crew_Condition;
	information = DIA_Regis_Crew_Info;
	permanent = FALSE;
	description = "Pokouším se najít posádku na cestu po moři.";
};


func int DIA_Regis_Crew_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Regis_Crew_Info()
{
	AI_Output(other,self,"DIA_Regis_Crew_15_00");	//Pokouším se najít posádku na cestu po moři.
	AI_Output(self,other,"DIA_Regis_Crew_13_01");	//Tak s tím ti nepomůžu. Nejspíš by ses měl porozhlédnout po přístavu nebo se poptat někde v hospodě.
	AI_Output(self,other,"DIA_Regis_Crew_13_02");	//Jestli tu zůstali ještě nějací námořníci, určitě je najdeš tam.
};


instance DIA_REGIS_PAYBACK(C_Info)
{
	npc = VLK_425_Regis;
	nr = 51;
	condition = dia_regis_payback_condition;
	information = dia_regis_payback_info;
	permanent = FALSE;
	description = "Pozdravuje tě Valentino!";
};


func int dia_regis_payback_condition()
{
	if(MIS_VALENTINOHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_regis_payback_info()
{
	AI_Output(other,self,"DIA_Regis_PayBack_01_00");	//Pozdravuje tě Valentino!
	AI_Output(self,other,"DIA_Regis_PayBack_01_01");	//Co?! Kdo?!... (udiveně)
	AI_Output(self,other,"DIA_Regis_PayBack_01_02");	//Co ode mě chce ten idiot?!
	AI_Output(other,self,"DIA_Regis_PayBack_01_04");	//Prostě, že tě mám na nějakou chvíli vyřídit - tak nějak to řekl.
	AI_Output(self,other,"DIA_Regis_PayBack_01_05");	//On - poslal tě, abys mě vyřídil?!
	AI_Output(self,other,"DIA_Regis_PayBack_01_07");	//Ha! A opravdu si myslíš, že to jen tak provedeš a v pohodě odejdeš?!... (směje se)
	self.guild = GIL_NONE;
	Npc_SetTrueGuild(self,GIL_NONE);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_REGIS_PAYBACKOK(C_Info)
{
	npc = VLK_425_Regis;
	nr = 1;
	condition = dia_regis_paybackok_condition;
	information = dia_regis_paybackok_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_regis_paybackok_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && Npc_KnowsInfo(other,dia_regis_payback) && (REGISPISSOFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_regis_paybackok_info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_00");	//No - jsi šťastný?!
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_01");	//Myslíš, že když si mě porazil, tak že jsi borec?!
		AI_Output(other,self,"DIA_Regis_PayBackOk_01_02");	//Hej, kámo - sklidni se! Asi tě musím naučit, jak se chovat.
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_03");	//Jen do toho, opovaž se... (naštvaný)
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_04");	//Jen měj na paměti, že jestli se mě někdy příště jen dotkneš prstem - vyřídíš si to s lordem Andrem!
		self.guild = GIL_VLK;
		REGISPISSOFF = TRUE;
		Npc_SetTrueGuild(self,GIL_VLK);
		self.aivar[AIV_ToughGuy] = FALSE;

		if((MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == FALSE))
		{
			B_GivePlayerXP(250);
			REGISFIGHTOK = TRUE;
			B_LogEntry(TOPIC_VALENTINOHELP,"Zbil jsem Regise!");
		};

		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		self.guild = GIL_VLK;
		Npc_SetTrueGuild(self,GIL_VLK);
		self.aivar[AIV_ToughGuy] = FALSE;
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_07");	//No, bastarde - to by ti stačilo!
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_08");	//A už se na mě nikdy znova neobracej!... (rozzlobeně)
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_09");	//A teď - vypadni!
		REGISPISSOFF = TRUE;

		if((MIS_VALENTINOHELP == LOG_Running) && (VALENTINOPSI == FALSE))
		{
			REGISFIGHTNOTOK = TRUE;
			B_LogEntry(TOPIC_VALENTINOHELP,"Regis mě zbil.");
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_10");	//Copak, ty děcko - jsi tak vyděšený, že sis nadělal do kalhot?!... (směje se)
		AI_Output(self,other,"DIA_Regis_PayBackOk_01_11");	//Vlastně jsem ještě nedokončili náš rozhovor...
		AI_StopProcessInfos(self);
		self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
		B_Attack(self,other,AR_NONE,0);
	};
};
