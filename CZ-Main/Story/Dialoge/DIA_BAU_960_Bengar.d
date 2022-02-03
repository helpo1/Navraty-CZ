/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



instance DIA_Bengar_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_HALLO(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 3;
	condition = DIA_Bengar_HALLO_Condition;
	information = DIA_Bengar_HALLO_Info;
	description = "To je tvá farma?";
};


func int DIA_Bengar_HALLO_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//To je tvá farma?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//Jo, dalo by se to tak říct, ale ve skutečnosti jsem jen nájemce.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//Všechny zdejší pozemky patří velkostatkáři.
};


instance DIA_Bengar_WOVONLEBTIHR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Bengar_WOVONLEBTIHR_Condition;
	information = DIA_Bengar_WOVONLEBTIHR_Info;
	description = "A z čeho tedy žiješ?";
};


func int DIA_Bengar_WOVONLEBTIHR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_WOVONLEBTIHR_Info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//A z čeho tedy žiješ?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//Většinou z lovu a kácení stromů. Taky samozřejmě chováme ovce a obděláváme půdu.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//Onar mi sem poslal všechny tyhle lidi a já je musím živit. A ne všichni jsou zrovna skvělí lovci, chápeš?
};


instance DIA_Bengar_TAGELOEHNER(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 6;
	condition = DIA_Bengar_TAGELOEHNER_Condition;
	information = DIA_Bengar_TAGELOEHNER_Info;
	description = "Zaměstnáváš nádeníky?";
};


func int DIA_Bengar_TAGELOEHNER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_TAGELOEHNER_Info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//Zaměstnáváš nádeníky?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//Onar posílá pryč ty dělníky, které už nevyužije na své farmě.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//A tak je posílá ke mně. Já je krmím a oni pro mě pracují.
};


instance DIA_Addon_Bengar_MissingPeople(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_MissingPeople_Condition;
	information = DIA_Addon_Bengar_MissingPeople_Info;
	description = "Stalo se tu poslední dobou něco divného?";
};


func int DIA_Addon_Bengar_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_15_00");	//Stalo se tu poslední dobou něco divného?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_01");	//V poslední době se tu stalo hodně zvláštních věcí.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_02");	//Ale nejpodivnější z nich je záhadné zmizení Pardose.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_03");	//Je jeden z mých nejlepších pracovníků. Není to ten typ, který by nechal všeho a přes noc se takhle vytratil, víš.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Farmář Bengar postrádá svého dělníka Pardose.");
	MIS_Bengar_BringMissPeopleBack = LOG_Running;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,Dialog_Back,DIA_Addon_Bengar_MissingPeople_back);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Nějaké nápady?",DIA_Addon_Bengar_MissingPeople_Hint);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Možná že už toho měl prostě dost.",DIA_Addon_Bengar_MissingPeople_voll);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"Co je přesně na jeho zmizení tak zvláštního?",DIA_Addon_Bengar_MissingPeople_was);
};

func void DIA_Addon_Bengar_MissingPeople_was()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_00");	//Co je přesně na jeho zmizení tak zvláštního?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_01");	//Pardos je strašpytel, nikdy nebyl dál, než na konci mého pole.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_02");	//Utíkal, jakmile zahlédl třeba jen žravou štěnici.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_03");	//Tyhle věci nejsou na pohled zrovna moc hezké, ale jen opravdu těžko je můžeš nazvat nebezpečnými...
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_04");	//(znechuceně) Říká se, že někteří lidé je dokonce jedí! Odporné.
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_05");	//Zvykneš si na to.
};

func void DIA_Addon_Bengar_MissingPeople_voll()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_voll_15_00");	//Možná že už toho měl prostě dost.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_01");	//Práce na poli byla pro něho vším. Neumím si představit, že by odešel pracovat pro jiného farmáře.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_02");	//U mě měl všechno, co by chtěl nebo potřeboval.
};

var int Bengar_ToldAboutRangerBandits;

func void DIA_Addon_Bengar_MissingPeople_Hint()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Hint_15_00");	//Nějaké nápady?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_01");	//Myslím, že ho sebrali banditi. Nějací se tu okolo potloukají.
	Bengar_ToldAboutRangerBandits = TRUE;
};

func void DIA_Addon_Bengar_MissingPeople_back()
{
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
};


instance DIA_Addon_Bengar_ReturnPardos(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_ReturnPardos_Condition;
	information = DIA_Addon_Bengar_ReturnPardos_Info;
	description = "Už se Pardos vrátil?";
};


func int DIA_Addon_Bengar_ReturnPardos_Condition()
{
	if((MIS_Bengar_BringMissPeopleBack == LOG_Running) && (Npc_GetDistToWP(Pardos_NW,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_00");	//Už se Pardos vrátil?
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_01");	//Ano, je uvnitř a odpočívá. Díky za všechno.
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//Není zač.
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_03");	//Počkej, rád bych se ti odměnil, ale nemám...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_04");	//Zapomeň na to.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Bengar_FernandosWeapons(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_FernandosWeapons_Condition;
	information = DIA_Addon_Bengar_FernandosWeapons_Info;
	description = "Měli ti banditi u sebe zbraně?";
};


func int DIA_Addon_Bengar_FernandosWeapons_Condition()
{
	if((Bengar_ToldAboutRangerBandits == TRUE) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_00");	//Měli ti banditi u sebe zbraně?
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_01");	//Co je to za blbou otázku? Už jsi někdy viděl bandity beze zbraní?
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_02");	//Já myslím celou ZÁSILKU zbraní. Velkou dodávku.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_03");	//Aha, už chápu. Ano, jak jsi říkal. Nesli toho opravdu hodně.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_04");	//Něco vezli v sudech, něco v pytlích a něco také naložili na vozík.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_REBELLIEREN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 8;
	condition = DIA_Bengar_REBELLIEREN_Condition;
	information = DIA_Bengar_REBELLIEREN_Info;
	description = "Co si myslíš o Onarovi?";
};


func int DIA_Bengar_REBELLIEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//Co si myslíš o Onarovi?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//Je to nenažranej parchant, co nás nakonec všechny dostane na šibenici.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//Jednoho dne přijdou paladinové z města a my, malé farmy budeme platit krví za to, co dělá.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//Ale já nemám na výběr. Domobrana si sem chodí jen, aby si odnesla naše zboží, ale chránit nás ji ani nenapadne.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//Kdybych zůstal věrný městu, byl bych na to teď sám.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//Alespoň, že Onar tu a tam pošle své žoldáky, aby věděl, jak se nám daří.
};


instance DIA_Bengar_PALADINE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 9;
	condition = DIA_Bengar_PALADINE_Condition;
	information = DIA_Bengar_PALADINE_Info;
	description = "Co máš proti královským vojskům?";
};


func int DIA_Bengar_PALADINE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_REBELLIEREN) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PALADINE_Info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//Co máš proti královským vojskům?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//To je přece jasný. Od tý doby, co jsou paladinové ve městě, se nic nezlepšilo. Právě naopak.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//Teď ti zatracení vojáci z domobrany přicházejí na naše pozemky stále častěji a kradou, co se jim zachce. A paladinové proti tomu nehnou ani prstem.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//Jediní paladinové, které jsem kdy viděl, jsou ti dva strážci u průsmyku.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//A oni by nic neudělali, ani kdyby nás všechny třeba zmasakrovala domobrana.
};


instance DIA_Bengar_PASS(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 10;
	condition = DIA_Bengar_PASS_Condition;
	information = DIA_Bengar_PASS_Info;
	description = "Průsmyk?";
};


func int DIA_Bengar_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PASS_Info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//Průsmyk?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//Jo. Průsmyk do Hornického údolí, u vodopádů na samém konci náhorních pastvin.
	AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//Zeptej se Malaka. Minulý týden tam několikrát byl.
};


instance DIA_Bengar_MILIZ(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_MILIZ_Condition;
	information = DIA_Bengar_MILIZ_Info;
	permanent = FALSE;
	description = "Mám vyřešit tvůj problém s domobranou.";
};


func int DIA_Bengar_MILIZ_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//Mám vyřešit tvůj problém s domobranou.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//Co? Říkal jsem Onarovi, ať pošle pár svých ŽOLDÁKŮ.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//To je má šance dokázat mu, že na to mám.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//(ironicky) Skvěle! Je ti jasné, co se mnou domobrana udělá, když to zpackáš?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//Už jsem si myslel, že nikdo nepřijde.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//Už jsem o tom Onarovi říkal před pár dny. Za co mu tu rentu tedy platím?
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//Ti bastardi sem přijdou jednou týdně a vybírají daně pro město.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//Je fajn, žes přišel právě teď. V tuhle dobu obvykle přicházejí.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//Měli by tu být každou chvíli.
};


instance DIA_Bengar_Selber(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_Selber_Condition;
	information = DIA_Bengar_Selber_Info;
	permanent = FALSE;
	description = "Proč se domobraně prostě nepostavíte sami?";
};


func int DIA_Bengar_Selber_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && (Bengar_MilSuccess == FALSE) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//Je vás tu tolik. Proč se domobraně prostě nepostavíte sami?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//Je pravda, že je nás tu hodně, ale my nejsme cvičení bojovníci, jako oni.
};


instance DIA_Bengar_MILIZKLATSCHEN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZKLATSCHEN_Condition;
	information = DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent = FALSE;
	description = "Jen ať si tedy domobrana dorazí, já už to s nimi vyřídím!";
};


func int DIA_Bengar_MILIZKLATSCHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && !Npc_IsDead(Rick) && !Npc_IsDead(Rumbold) && (Rumbold_Bezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//Jen ať si tedy domobrana dorazí, já už to s nimi vyřídím!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//Nemůžu se dočkat. Už přicházejí. Říkal jsem ti to.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//Jen to nezpackej!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//Tak tedy hodně štěstí. Nandej jim to.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(Rick) && !Npc_IsDead(Rick))
	{
		Npc_ExchangeRoutine(Rick,"MilComing");
		AI_ContinueRoutine(Rick);
	};
	if(Hlp_IsValidNpc(Rumbold) && !Npc_IsDead(Rumbold))
	{
		Npc_ExchangeRoutine(Rumbold,"MilComing");
		AI_ContinueRoutine(Rumbold);
	};
};

instance DIA_Bengar_MILIZWEG(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZWEG_Condition;
	information = DIA_Bengar_MILIZWEG_Info;
	permanent = TRUE;
	description = "Tvůj problém s domobranou je minulostí.";
};


func int DIA_Bengar_MILIZWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && (Bengar_MilSuccess == FALSE))
	{
		if((Npc_IsDead(Rick) && Npc_IsDead(Rumbold)) || (Rumbold_Bezahlt == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//Tvůj problém s domobranou je minulostí.

	if((Rumbold_Bezahlt == TRUE) && (Npc_IsDead(Rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//Zbláznil ses? Víš, co se mnou ti chlapi udělají, když odejdeš?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//Stále se tu okolo poflakují. Řekl jsem, že musí zmizet... ÚPLNĚ!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//To nebylo špatné. Možná mi na konci měsíce dokonce zbude něco pro obchod. Díky!

		if(Rumbold_Bezahlt == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//Dokonce jsi za mě chtěl zaplatit. To je od tebe velice ušlechtilé.
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_77_01");	//Tady, vem si tohle zlato! Díky za pomoc.
			B_GiveInvItems(self,other,ItMi_Gold,100);
		}
		else
		{
			B_GivePlayerXP(100);
		};

		Bengar_MilSuccess = TRUE;
	};
};


instance DIA_Bengar_BALTHASAR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 13;
	condition = DIA_Bengar_BALTHASAR_Condition;
	information = DIA_Bengar_BALTHASAR_Info;
	description = "Proč nemůže Balthasar pást ovce na tvých pastvinách?";
};


func int DIA_Bengar_BALTHASAR_Condition()
{
	if((MIS_Balthasar_BengarsWeide == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASAR_Info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//Proč nemůže Balthasar pást ovce na tvých pastvinách?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//Ach ano, dlouhý příběh. Říkal jsem, že by mi měl Sekob zaplatit, pokud chce pást ovce na mých pastvinách.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//Abych řekl pravdu, chtěl jsem to jen proto, aby už sem nechodil. Prostě nemůžu Balthasara vystát.
	B_LogEntry(TOPIC_BalthasarsSchafe,"Mám-li přesvědčit Bengara, aby Balthasara pustil na své pastviny, musím mu učinit laskavost. Určitě se k tomu nějaká příležitost naskytne.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_BALTHASARDARFAUFWEIDE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 14;
	condition = DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information = DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;
	description = "Domobrana je pryč a Balthasar může tvoji pastvinu znovu používat.";
};


func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_BALTHASAR) && (MIS_Balthasar_BengarsWeide == LOG_Running) && (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS) && (Bengar_MilSuccess == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//Domobrana je pryč a Balthasar může tvoji pastvinu znovu používat.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//Proč?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//(výhružně) Protože jsem to řekl.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//Hmm. Dobře, když to říkáš.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//Ať si najde pro svá zvířata nějaké místo za polem.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe,LOG_SUCCESS);
	B_LogEntry(TOPIC_BalthasarsSchafe,"Bengar dovolí Balthasarovi pást ovce na svých pastvinách.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_PERMKAP1(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 15;
	condition = DIA_Bengar_PERMKAP1_Condition;
	information = DIA_Bengar_PERMKAP1_Info;
	permanent = TRUE;
	description = "Dávej na sebe pozor.";
};


func int DIA_Bengar_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_BALTHASARDARFAUFWEIDE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//Dávej na sebe pozor.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//Ty taky.
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP3_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP3_EXIT_Condition;
	information = DIA_Bengar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_ALLEIN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 30;
	condition = DIA_Bengar_ALLEIN_Condition;
	information = DIA_Bengar_ALLEIN_Info;
	description = "Jak to jde?";
};


func int DIA_Bengar_ALLEIN_Condition()
{
	if((Kapitel >= 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_ALLEIN_Info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//Jak to jde?

	if((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//Malak zmizel a vzal sebou všechno a všechny, kdo s ním pro mě pracovali. Říkal, že má namířeno do hor.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//Už to tady nemohl vydržet.
		MIS_GetMalakBack = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//Časy jsou zlé. Nevím, jak dlouho tu ještě vydržím.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//Hordy příšer přicházejí každý den skrz průsmyk a je jen otázka času, kdy se dostanou až ke mně.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//Kdybych tu alespoň měl pár žoldáků...
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//Dokonce tam byl jeden, který byl ochoten pro mě pracovat. Myslím, že se jmenoval Wolf.
	MIS_BengarsHelpingSLD = LOG_Running;
	Log_CreateTopic(TOPIC_BengarALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN,LOG_Running);
	B_LogEntry(TOPIC_BengarALLEIN,"Bengar zůstal na svém statku docela sám. Malak zmizel a všichni ostatní odešli s ním. Podle Bengara se nejspíš uchýlili do hor.");
	B_LogEntry_Quiet(TOPIC_BengarALLEIN,"Bengarova farma je teď úplně nechráněná. Bengar potřebuje urychleně pomoc. Mluvil o nějakém žoldákovi, který se jmenoval Wolf a ptal se na práci... Copak já toho chlápka neznám?");
};

instance DIA_Bengar_MALAKTOT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_MALAKTOT_Condition;
	information = DIA_Bengar_MALAKTOT_Info;
	description = "Malak je mrtvý.";
};

func int DIA_Bengar_MALAKTOT_Condition()
{
	if(Npc_IsDead(Malak) && (Malak_isAlive_Kap3 == TRUE) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKTOT_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//Malak je mrtvý.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//Pak je vše jen horší.
};


instance DIA_Bengar_SLDDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_SLDDA_Condition;
	information = DIA_Bengar_SLDDA_Info;
	description = "Najal jsem ty žoldáky, které jsi chtěl.";
};


func int DIA_Bengar_SLDDA_Condition()
{
	if((Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Npc_IsDead(SLD_Wolf) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_SLDDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//Najal jsem ty žoldáky, které jsi chtěl.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//Nikdy jsem na své farmě nikoho podobného neměl. Jen doufám, že to bude fungovat.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//Tady, vezmi si tohle. Mám dojem, že se ti to bude hodit.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_BengarsHelpingSLDArrived);
};


instance DIA_Bengar_MALAKWIEDERDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 35;
	condition = DIA_Bengar_MALAKWIEDERDA_Condition;
	information = DIA_Bengar_MALAKWIEDERDA_Info;
	// description = "Malak se vrátil.";
};


func int DIA_Bengar_MALAKWIEDERDA_Condition()
{
	DIA_Bengar_MALAKWIEDERDA.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 30, FALSE), "Malak se vrátil.");
	
	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && (DarkPathStart == FALSE) && ((MIS_GetMalakBack == LOG_SUCCESS) || (NpcObsessedByDMT_Malak == TRUE)) && (Npc_IsDead(Malak) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKWIEDERDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//Malak se vrátil.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//Už bylo načase. Myslel jsem, že už ho víckrát neuvidím.
	B_GivePlayerXP(XP_GetMalakBack);

	if(RhetorikSkillValue[1] >= 30)
	{
		AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_66_01");	//A co nějakou odměnu?
		AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_66_02");	//Proč ne. Tady máš. Zasloužil sis to!
		B_GiveInvItems(self,hero,ItMi_Gold,150);
	};
};


instance DIA_Bengar_PERM(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 80;
	condition = DIA_Bengar_PERM_Condition;
	information = DIA_Bengar_PERM_Info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};


func int DIA_Bengar_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_ALLEIN) && (Kapitel >= 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERM_Info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//Všechno v pořádku?

	if((Npc_GetDistToWP(Malak,"FARM3") < 3000) && (Npc_IsDead(Malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//Malak se sice vrátil, ale na situaci to moc nemění.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//Pokud se nestane nějaký zázrak, všichni to tu odskáčeme.
	}
	else if(Npc_KnowsInfo(other,DIA_Bengar_SLDDA) && (Npc_IsDead(SLD_Wolf) == FALSE) && (Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//Wolf je zvláštní člověk, ale myslím si, že bude užitečný.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//Bez Malaka tu nic nefunguje. Pokud se brzy něco nestane, budu se muset vzdát své farmy.
		if((Malak_isAlive_Kap3 == TRUE) && (Npc_IsDead(Malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//Doufejme, že se brzy vrátí.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(SLD_Wolf) && (MIS_BengarsHelpingSLD == LOG_SUCCESS))
	{
		B_StartOtherRoutine(SLD_815_Soeldner,"Start");
		B_StartOtherRoutine(SLD_817_Soeldner,"Start");
	};
};


instance DIA_Bengar_KAP4_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP4_EXIT_Condition;
	information = DIA_Bengar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP5_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP5_EXIT_Condition;
	information = DIA_Bengar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_KAP6_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_KAP6_EXIT_Condition;
	information = DIA_Bengar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_PICKPOCKET(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 900;
	condition = DIA_Bengar_PICKPOCKET_Condition;
	information = DIA_Bengar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bengar_PICKPOCKET_Condition()
{
	return C_Beklauen(28,50);
};

func void DIA_Bengar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
	Info_AddChoice(DIA_Bengar_PICKPOCKET,Dialog_Back,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bengar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};

func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};


instance DIA_BENGAR_LUTEROLETTER(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 35;
	condition = dia_bengar_luteroletter_condition;
	information = dia_bengar_luteroletter_info;
	description = "Přináším od Lutera dopis s novými rozkazy.";
};


func int dia_bengar_luteroletter_condition()
{
	if((MIS_BENGARORDER == LOG_Running) && (Npc_HasItems(other,itwr_bengarorderletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_bengar_luteroletter_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Bengar_LuteroLetter_01_00");	//Přináším od Lutera dopis s novými rozkazy.
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_01");	//Nejvyšší čas!
	AI_Output(other,self,"DIA_Bengar_LuteroLetter_01_02");	//Tady.
	B_GiveInvItems(other,self,itwr_bengarorderletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_03");	//(zamyšleně) Hmm... No, myslím, že by s tím neměly být problémy.
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_04");	//Ještě něco?
	AI_Output(other,self,"DIA_Bengar_LuteroLetter_01_05");	//Lutero chtěl, abys poslal poslední část zboží.
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_06");	//Ach ano, jistě! Už jsem ti to připravil - tady, vezmi si tenhle balíček...
	B_GiveInvItems(self,other,itmi_bengarpacket,1);
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_07");	//... a hlavně ho neztrať!
	AI_Output(other,self,"DIA_Bengar_LuteroLetter_01_08");	//Pokusím se.
	AI_Output(self,other,"DIA_Bengar_LuteroLetter_01_09");	//To doufám. Pokud potkáš Lutera, řekni mu, že nová zásilka bude připravena do dvou týdnů.
	B_LogEntry(TOPIC_BENGARORDER,"Předal jsem dopis Bengarovi a on mi dal balíček se zbožím pro Joru.");
};


instance DIA_BENGAR_PSICAMP(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 1;
	condition = dia_bengar_psicamp_condition;
	information = dia_bengar_psicamp_info;
	description = "Co je to za tábor u tvé farmy?";
};


func int dia_bengar_psicamp_condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO) && !Npc_KnowsInfo(other,dia_tpl_8014_templer_first))
	{
		return TRUE;
	};
};

func void dia_bengar_psicamp_info()
{
	AI_Output(other,self,"DIA_Bengar_Psicamp_01_00");	//Co je to za tábor u tvé farmy?
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_01");	//(zamyšleně) Přesně nevím. Znám jen název té jejich komunity - nějaké Bratrstvo!
	AI_Output(other,self,"DIA_Bengar_Psicamp_01_02");	//Bratrstvo? Zajímavé. A kdo jsou ti lidé?
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_03");	//Nu, rozhodně to jsou zvláštní typy. Prakticky všichni kouří trávu z bažin.
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_04");	//Abych řekl pravdu, ještě jsem se tam ani nebyl podívat.
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_05");	//Na druhou stranu, nejsou s nimi téměř žádné problémy.
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_06");	//V jejich táboře je pořád ticho. A to je pro mě to nejdůležitější, víš.
	AI_Output(self,other,"DIA_Bengar_Psicamp_01_07");	//Koneckonců mi jejich přítomnost tady až tak nevadí. Žij a nech žít.
	AI_Output(other,self,"DIA_Bengar_Psicamp_01_08");	//Jasně.
};