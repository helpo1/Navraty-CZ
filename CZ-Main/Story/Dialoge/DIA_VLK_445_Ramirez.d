
instance DIA_Ramirez_EXIT(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 999;
	condition = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ramirez_PICKPOCKET(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 900;
	condition = DIA_Ramirez_PICKPOCKET_Condition;
	information = DIA_Ramirez_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};

func int DIA_Ramirez_PICKPOCKET_Condition()
{
	return C_Beklauen(90,300);
};

func void DIA_Ramirez_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,Dialog_Back,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,30);
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

func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};

instance DIA_Ramirez_Hallo(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ramirez_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Hallo_Info()
{
	if(IS_LOVCACH == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//Ztratil ses? Nemyslím si, že tohle je to pravé místo pro tebe.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//Jestli se ti tady něco stane, nikdo z nás ti pomoct nepůjde. Takže si dávej bacha. (široký úsměv)
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//Tak jsi tady. Dobrá, tak ti přeju hodně štěstí - ale buď opatrný, ať už děláš cokoli.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//A ještě jedna věc - je mi jedno, kdo jsi tam nahoře a s kým pracuješ.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//Tady dole jsi jen jedním z nás. Zloděj. Nic víc, nic míň.
	};
};

var int RamirezPissOff;

instance DIA_Ramirez_First(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_First_condition;
	information = DIA_Ramirez_First_info;
	permanent = FALSE;
	description = "Poslala mě Cassia.";
};

func int DIA_Ramirez_First_condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_First_info()
{
	AI_Output(other,self,"DIA_Ramirez_First_01_00");	//Poslala mě Cassia. Říkala, že mě můžeš něco naučit.

	if(AttilaIsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_First_01_20");	//To říkala? Hmm... Pro začátek by bylo vhodné zeptat se na můj názor.
		AI_Output(other,self,"DIA_Ramirez_First_01_21");	//A máte nějaký problém?
		AI_Output(self,other,"DIA_Ramirez_First_01_22");	//Největší problém je že Attila byl donedávna můj nejlepší kamarád. A tys ho oddělal.
		AI_Output(self,other,"DIA_Ramirez_First_01_23");	//Takže budeš muset hledat učitele kdekoli jinde. Já tě nic učit nebudu.
		AI_Output(other,self,"DIA_Ramirez_First_01_24");	//Počkej...
		AI_Output(self,other,"DIA_Ramirez_First_01_25");	//Už jsem řekl vše. Náš rozhovor končí!
		RamirezPissOff = TRUE;
		B_LogEntry(Topic_Bonus,"Ramirez mě odmítl učit, protože jsem zabil jeho přítele Attilu. Možná ale existuje nějaký způsob, jak změnit jeho názor.");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Ramirez_First_01_02");	//Jestli to říkala... Prvně mi dovol přivítat tě mezi námi.
		AI_Output(self,other,"DIA_Ramirez_First_01_03");	//Co se tréninku týče, tak tě skutečně můžu naučit něco, co tě nenaučí nikde jinde v Myrtaně.
		AI_Output(self,other,"DIA_Ramirez_First_01_04");	//Několik tajemství, které skrývají tajemství jak vyrábět meče a rapíry, které náš cech používá.
		AI_Output(other,self,"DIA_Ramirez_First_01_05");	//A co je na nich tak úžasného?
		AI_Output(self,other,"DIA_Ramirez_First_01_06");	//Jsem si jistý, že víš, že obyčejné zbraně jsou velmi nemotorné a těžké.
		AI_Output(self,other,"DIA_Ramirez_First_01_07");	//Kým ty zvedneš svoji zbraň, dobrý majster meče tě desetkrát zabije.
		AI_Output(self,other,"DIA_Ramirez_First_01_08");	//Je to pochopitelné, protože meč je volbou vrahů, zlodejů a všech co chtějí být vždy krok před svým nepřítelem.
		AI_Output(other,self,"DIA_Ramirez_First_01_09");	//A ty víš jak takovou zbraň vytvořit?
		AI_Output(self,other,"DIA_Ramirez_First_01_10");	//Existuje mnoho různých metod. Hlavní je vědět, které přísady mají být smíchány z ocelí.
		AI_Output(self,other,"DIA_Ramirez_First_01_11");	//I obyčejný meč nabroušen směsí síry je nebezpečnejší než kdy dřív!
		AI_Output(other,self,"DIA_Ramirez_First_01_12");	//Zajímavé!
		AI_Output(self,other,"DIA_Ramirez_First_01_13");	//Tak to by mělo! Naučím tě kousek po kousku co a jak.
		AI_Output(self,other,"DIA_Ramirez_First_01_14");	//Ale jak poznáš náš cech, nejsme charita...
		AI_Output(self,other,"DIA_Ramirez_First_01_15");	//Budeš muset dokázat, že nejsi jen budižkničema.
		AI_Output(self,other,"DIA_Ramirez_First_01_16");	//Splň úkoly od Cassie, pomoz členům cechu a možná jednou budeš ozbrojen jak se ti ani nesnilo!
		AI_Output(self,other,"DIA_Ramirez_First_01_17");	//Och, a skoro bych zapomněl, než tě začnu učit, běž za nějakým kovářem a nauč se základy.
		AI_Output(self,other,"DIA_Ramirez_First_01_18");	//Bude ti to v budoucnu užitečné.
		AI_Output(other,self,"DIA_Ramirez_First_01_19");	//Rozumím.
		B_LogEntry(Topic_Bonus,"Ramirez mě může naučit, jak vykovat kordy, rapíry a další užitečné věci.");
		RamirezTechMe = TRUE;
	};
};

instance DIA_Ramirez_RamirezPissOff(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_RamirezPissOff_condition;
	information = DIA_Ramirez_RamirezPissOff_info;
	permanent = TRUE;
	description = "Možná bychom mohli nějak urovnat naše rozepře?";
};

func int DIA_Ramirez_RamirezPissOff_condition()
{
	if((RamirezPissOff == TRUE) && (RamirezTechMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_RamirezPissOff_info()
{
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_01_00");	//Možná bychom mohli nějak urovnat naše rozepře?

	if(RamirezMagicDone == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_01_01");	//Ha... A jak bys to chtěl udělat?
		Info_ClearChoices(DIA_Ramirez_RamirezPissOff);
		Info_AddChoice(DIA_Ramirez_RamirezPissOff,"Nevím.",DIA_Ramirez_RamirezPissOff_No);

		if(RhetorikSkillValue[1] >= 25)
		{
			Info_AddChoice(DIA_Ramirez_RamirezPissOff,"Pojďme se podívat na situaci z druhé strany.",DIA_Ramirez_RamirezPissOff_Deal);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_01_02");	//Hmm... Měli jsme něco vyřídit?
		AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_01_03");	//Zdá se že ne.
		AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_01_04");	//Tak co ode mě chcete?
		AI_Output(other,self,"DIA_Ramirez_First_01_00");	//Poslala mě Cassia. Říkala, že mě můžeš něco naučit.
		AI_Output(self,other,"DIA_Ramirez_First_01_03");	//Co se tréninku týče, tak tě skutečně můžu naučit něco, co tě nenaučí nikde jinde v Myrtaně.
		AI_Output(self,other,"DIA_Ramirez_First_01_04");	//Několik tajemství, které skrývají tajemství jak vyrábět meče a rapíry, které náš cech používá.
		AI_Output(other,self,"DIA_Ramirez_First_01_05");	//A co je na nich tak úžasného?
		AI_Output(self,other,"DIA_Ramirez_First_01_06");	//Jsem si jistý, že víš, že obyčejné zbraně jsou velmi nemotorné a těžké.
		AI_Output(self,other,"DIA_Ramirez_First_01_07");	//Kým ty zvedneš svoji zbraň, dobrý majster meče tě desetkrát zabije.
		AI_Output(self,other,"DIA_Ramirez_First_01_08");	//Je to pochopitelné, protože meč je volbou vrahů, zlodejů a všech co chtějí být vždy krok před svým nepřítelem.
		AI_Output(other,self,"DIA_Ramirez_First_01_09");	//A ty víš jak takovou zbraň vytvořit?
		AI_Output(self,other,"DIA_Ramirez_First_01_10");	//Existuje mnoho různých metod. Hlavní je vědět, které přísady mají být smíchány z ocelí.
		AI_Output(self,other,"DIA_Ramirez_First_01_11");	//I obyčejný meč nabroušen směsí síry je nebezpečnejší než kdy dřív!
		AI_Output(other,self,"DIA_Ramirez_First_01_12");	//Zajímavé!
		AI_Output(self,other,"DIA_Ramirez_First_01_13");	//Tak to by mělo! Naučím tě kousek po kousku co a jak.
		AI_Output(self,other,"DIA_Ramirez_First_01_14");	//Ale jak poznáš náš cech, nejsme charita...
		AI_Output(self,other,"DIA_Ramirez_First_01_15");	//Budeš muset dokázat, že nejsi jen budižkničema.
		AI_Output(self,other,"DIA_Ramirez_First_01_16");	//Splň úkoly od Cassie, pomoz členům cechu a možná jednou budeš ozbrojen jak se ti ani nesnilo!
		AI_Output(self,other,"DIA_Ramirez_First_01_17");	//Och, a skoro bych zapomněl, než tě začnu učit, běž za nějakým kovářem a nauč se základy.
		AI_Output(self,other,"DIA_Ramirez_First_01_18");	//Bude ti to v budoucnu užitečné.
		AI_Output(other,self,"DIA_Ramirez_First_01_19");	//Rozumím.
		B_LogEntry(Topic_Bonus,"Ramirez mě může naučit, jak vykovat kordy, rapíry a další užitečné věci.");
		RamirezTechMe = TRUE;
		Info_ClearChoices(DIA_Ramirez_RamirezPissOff);
	};
};

func void DIA_Ramirez_RamirezPissOff_No()
{
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_No_01_00");	//Nevím.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_No_01_01");	//Tak proč ztrácím čas?!
	AI_StopProcessInfos(self);
};

func void DIA_Ramirez_RamirezPissOff_Deal()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_00");	//Pojďme se podívat na situaci z druhé strany
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_01");	//Attila se mě pokusil zabít! Neměl jsem na vybranou.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_Deal_01_02");	//Nemusel jsi ho dorážet!
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_03");	//Innos mi buď svědkem, nechtěl jsem ho zabít. To se tak přihodilo, že jsem ho na místě zabil ranou do srdce.
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_04");	//Jsem si jistý že nic necítil. Prostě zakrvácený padl rovnou k zemi, mrtvý.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_Deal_01_05");	//No, alespoň tak... ještě že nemusel dlouho trpět.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_Deal_01_06");	//Ach, dobře. Beliar s tebou! Příkazy co měl jednou dostat od Cassii by ho stejně přivedly do hrobu.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_Deal_01_07");	//A proto na tebe nejsu tak naštvaný za vraždu Attily.
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_08");	//To je dobře.
	RamirezTechMe = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ramirez_Beute(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 3;
	condition = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ramirez_Beute_Condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",ItMi_Gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",ItMi_Gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",ItMi_SilverCup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",ItMi_Gold) < 75))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Beute_Info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//Poslouchej, to nemůžeš myslet vážně, že ne? Hrabeš se v našem zlatu - to se nás pokoušíš okrást?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//Neříkej, že za tu dřinu je jen těchhle pár mincí.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//Myslím, tahle hromádka tady - to je CELÁ kořist? To je všechno, co má zlodějský cech Khorinisu k dispozici?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//Kdo říkal, že tady dole máme naši kořist?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//Stejně tomu nemůžu uvěřit. Tak kde jste schovali ty poklady?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//Na velmi bezpečné místo.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//Aha.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//Dobrá, můžeš si to zlato nechat. Ale budu na tebe dávat pozor. Tak to nepřepískni.
};

instance DIA_Ramirez_Bezahlen(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 9;
	condition = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent = FALSE;
	description = "Můžeš mě něčemu naučit?";
};

func int DIA_Ramirez_Bezahlen_Condition()
{
	if((IS_LOVCACH == TRUE) && (RamirezTechMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Bezahlen_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_14_99");	//Můžeš mě něčemu naučit?

	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//Nemůžu tě naučit nic. O páčení zámků už víš všechno.

		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//Teď už jen potřebuješ zdokonalit svou obratnost.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//Můžu ti ukázat, jak páčit zámky.
		Ramirez_TeachPlayer = TRUE;
	};
};

instance DIA_Ramirez_Teach(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 99;
	condition = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak páčit zámky. (VB: 10)";
};

func int DIA_Ramirez_Teach_Condition()
{
	if((IS_LOVCACH == TRUE) && (Ramirez_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//Ukaž mi, jak páčit zámky.

	if(Ramirez_Zweimal == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//Páčení zámku je zlodějské umění.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//Potřebuješ spoustu citu a intuice. A hromadu paklíčů.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//Nicméně, některé truhly mají speciální zámky, které lze odemknout jen za pomoci odpovídajícího klíče.
		Ramirez_Zweimal = TRUE;
	};
	if(b_teachthieftalentfree(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//Takže si klekneš před zámek a paklíčem otáčíš napravo a nalevo.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//Když jím otočíš moc rychle nebo moc silně, zlomí se.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//Ale čím zkušenější budeš, tím pro tebe bude snazší s nimi zacházet.
	};
};

instance DIA_Ramirez_Viertel(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 8;
	condition = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent = FALSE;
	description = "Kde to páčení zámků stojí za námahu?";
};

func int DIA_Ramirez_Viertel_Condition()
{
	if((IS_LOVCACH == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Viertel_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//Kde to páčení zámků stojí za námahu?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//V horní čtvrti, samozřejmě.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//Ale jestli se tam budeš chtít k někomu vloupat, počkej si na noc, až všichni usnou - teda kromě stráží.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//Hlídkují tam celou noc. Jednoho z nich znám - jmenuje se Wambo. On je jedinej, koho zajímá zlato.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//Je drahej, ale když mu jednou zaplatíš, už se o to nemusíš dál starat.
};

instance DIA_Ramirez_Sextant(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent = FALSE;
	description = "Máš pro mě práci?";
};

func int DIA_Ramirez_Sextant_Condition()
{
	if((IS_LOVCACH == TRUE) && (RamirezTechMe == TRUE) && (Kapitel >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Sextant_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//Máš pro mě práci?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//Hmm... je tu jedna věcička, kterou bych rád měl. Ale zatím jsem ji nenašel.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//Co to je?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//Sextant. Přines mi sextant - a já ti udělám dobrou cenu.
	MIS_RamirezSextant = LOG_Running;
	Log_CreateTopic(Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus(Topic_RamirezSextant,LOG_Running);
	B_LogEntry(Topic_RamirezSextant,"Ramirez chce, abych mu donesl sextant.");
};

instance DIA_Ramirez_Success(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent = FALSE;
	description = "Mám tu ten sextant.";
};

func int DIA_Ramirez_Success_Condition()
{
	if((MIS_RamirezSextant == LOG_Running) && (Npc_HasItems(other,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Success_Info()
{
	B_GivePlayerXP(XP_RamirezSextant);
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//Mám tu ten sextant.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	Npc_RemoveInvItems(self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//To není možný. Vážně se ti povedlo nějaký najít?
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//Tady, ty peníze si vážně zasloužíš.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_RamirezSextant,LOG_SUCCESS);
	B_LogEntry(Topic_RamirezSextant,"Donesl jsem Ramirezovi sextant.");
};

instance DIA_RAMIREZ_GUILDKILL(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 1;
	condition = dia_ramirez_guildkill_condition;
	information = dia_ramirez_guildkill_info;
	permanent = FALSE;
	description = "Víš něco o cechu vrahů?";
};

func int dia_ramirez_guildkill_condition()
{
	if((MIS_GUILDKILL == LOG_Running) && (IS_LOVCACH == TRUE) && Npc_KnowsInfo(hero,dia_cassia_guildkill) && (CANCOMPLETEGUILDKILL == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_guildkill_info()
{
	AI_Output(other,self,"DIA_Ramirez_GuildKill_01_00");	//Víš něco o cechu vrahů?
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_01");	//(vydešene) Proč se ptáš?!...
	AI_Output(other,self,"DIA_Ramirez_GuildKill_01_02");	//Cassia mi řekla, že bys mohl něco vědět.
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_03");	//Takže ona řekla!
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_04");	//V takovýchto věcech je lepší držet jazyk za zuby, nebo se ti může něco ošklivého stát.
	AI_Output(other,self,"DIA_Ramirez_GuildKill_01_05");	//Povíš mi o nich něco?
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_06");	//No, ale nic jim o tom neříkej, nebo bych se mohl rovnou rozloučit se životem.
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_07");	//Na Šibeničním náměstí se zeptej jednoho z trúbadůrů. Jmenuje se Gillian.
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_08");	//On by to mohl pomoci s tvým hledáním.
	AI_Output(other,self,"DIA_Ramirez_GuildKill_01_09");	//To je vše co víš?
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_10");	//Jo!... (nervózně)
	B_LogEntry(TOPIC_GUILDKILL,"Ramirez mi řekl, že o cechu vrahů se můžu dozvědět od trúbadůra Gilliana na Šibeničním náměstí...");
};

instance DIA_RAMIREZ_WAREZ(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 1;
	condition = dia_ramirez_warez_condition;
	information = dia_ramirez_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};

func int dia_ramirez_warez_condition()
{
	if((IS_LOVCACH == TRUE) && (RamirezTechMe == TRUE))
	{
		return TRUE;
	};
};

func void dia_ramirez_warez_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Ramirez_WAREZ_15_00");	//Ukaž mi své zboží.
	AI_Output(self,other,"DIA_Ramirez_WAREZ_15_01");	//Žádné triky!
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
};

instance DIA_Ramirez_Teach_W1(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W1_condition;
	information = DIA_Ramirez_Teach_W1_info;
	permanent = TRUE;
	description = "Ukaž mi, jak udělat dobrý kord.";
};

func int DIA_Ramirez_Teach_W1_condition()
{
	if((Lovkach_W1 == FALSE) && (RamirezTechMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W1_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W1_01_00");	//Ukaž mi, jak udělat dobrý kord.
	AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_01");	//A víš jak pracovat s kladivem a kovadlinou?

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self,"DIA_Ramirez_Teach_W1_01_02");	//Samozřejmě.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_03");	//Dobře, tak si vezmi ocelový prut a síru...
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_04");	//... pomalu prut obracej, drž ho nad kovadlinou.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_05");	//To samé uděláš s dalším dílem, pro druhou stranu meče.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_06");	//Po chvilce je hotovo.
		AI_Output(other,self,"DIA_Ramirez_Teach_W1_01_07");	//To nevypadá složitě.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_08");	//Jsem si jistý, že to zvládneš.
		AI_Print("Naučeno: Kovářství - 'Kord zloděje'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování KORDU ZLODĚJE: 2x síra.");
		Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
		Lovkach_W1 = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Ramirez_Teach_W1_01_09");	//Zatím ne.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_10");	//Napřed se nauč základy kování a jak který nástroj používat.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_11");	//Až potom za mnou přijď a promluvíme si znovu.
		AI_StopProcessInfos(self);
	};

};


instance DIA_Ramirez_Teach_W2(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W2_condition;
	information = DIA_Ramirez_Teach_W2_info;
	permanent = TRUE;
	description = "Nauč mě, jak vykovat dobrý rapír. (VB: 2, cena: 1000 zlatých)";
};

func int DIA_Ramirez_Teach_W2_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W1 == TRUE) && (THIEF_REPUTATION >= 5) && (Lovkach_W2 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W2_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W2_01_01");	//Nauč mě, jak vykovat dobrý rapír.

	if((hero.lp >= 2) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_02");	//OK, dobře mě poslouchej.
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_03");	//Vezmi si ocelový prut, zahřej ho, vychlaď a vytvaruj.
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_04");	//Vše jako obvykle! Pro zostření použij akvamarín. Minerál tvůj meč zdokonalý.
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_05");	//Nakonec pak celý meč pokryj pryskyřicí.
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_06");	//Dodá tvému meči speciální tmavý odstín!
		hero.lp = hero.lp - 2;
		RankPoints = RankPoints + 2;
		Npc_RemoveInvItems(other,ItMi_Gold,1000);
		AI_Print("Naučeno: Kovářství - 'Rapír zloděje'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování RAPÍRU ZLODĚJE: akvamarín a pryskyřice.");
		Lovkach_W2 = TRUE;
	}
	else
	{
		if(hero.lp < 2)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 1000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W2_03_90");	//Nemáš dost zlata. Přijď později.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Ramirez_Teach_W3(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W3_condition;
	information = DIA_Ramirez_Teach_W3_info;
	permanent = TRUE;
	description = "Nauč mě, jak vykovat mistrovský kord. (VB: 3, cena: 1500 zlatých)";
};

func int DIA_Ramirez_Teach_W3_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W2 == TRUE) && (THIEF_REPUTATION >= 10) && (Lovkach_W3 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W3_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W3_01_01");	//Nauč mě, jak vykovat mistrovský kord.

	if((hero.lp >= 3) && (Npc_HasItems(other,ItMi_Gold) >= 1500))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_02");	//To už je skutečná zbraň! Buď opatrný při výběru komponentů. Vyber jen ty nejlepší a bude z toho výborný meč!.
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_03");	//Teď mě dobře poslouchej.
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_04");	//Uděláš to samé, jako při výrobě krátkého meče.
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_05");	//Ale navíc, do meče zakováš černou perlu.
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_06");	//Jeho tajemný a třpitivý lesk odvrátí nepřátelskou pozornost během bitvy.
		hero.lp = hero.lp - 3;
		RankPoints = RankPoints + 3;
		Npc_RemoveInvItems(other,ItMi_Gold,1500);
		AI_Print("Naučeno: Kovářství - 'Kord mistra zloděje'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování KORDU MISTRA ZLODĚJE: pryskyřice a černá perla.");
		Lovkach_W3 = TRUE;
	}
	else
	{
		if(hero.lp < 3)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 1500)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W3_03_90");	//Nemáš dost zlata. Přijď později.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Ramirez_Teach_W4(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W4_condition;
	information = DIA_Ramirez_Teach_W4_info;
	permanent = TRUE;
	description = "Nauč mě, jak vykovat meč 'Tichá smrt'. (VB: 4, cena: 2000 zlatých)";
};

func int DIA_Ramirez_Teach_W4_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W3 == TRUE) && (THIEF_REPUTATION >= 15) && (Lovkach_W4 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W4_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W4_01_01");	//Nauč mě, jak vykovat meč 'Tichá smrt'.

	if((hero.lp >= 4) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W4_01_02");	//Jen pár šťastlivců vlastní tento nástroj smrti.
		AI_Output(self,other,"DIA_Ramirez_Teach_W4_01_03");	//Dobře poslouchej.
		AI_Output(self,other,"DIA_Ramirez_Teach_W4_01_04");	//Priskyřice tu není třeba, ale zato budeš potřebovat dvě černé perly.
		AI_Output(self,other,"DIA_Ramirez_Teach_W4_01_05");	//Jednu na každou stranu meče.
		hero.lp = hero.lp - 4;
		RankPoints = RankPoints + 4;
		Npc_RemoveInvItems(other,ItMi_Gold,2000);
		AI_Print("Naučeno: Kovářství - 'Tichá smrt'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování TICHÉ SMRTI: 2x černá perla.");
		Lovkach_W4 = TRUE;
	}
	else
	{
		if(hero.lp < 4)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 2000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W4_03_90");	//Nemáš dost zlata. Přijď později.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Ramirez_Teach_W5(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W5_condition;
	information = DIA_Ramirez_Teach_W5_info;
	permanent = TRUE;
	description = "Nauč mě, jak vykovat 'Pronikavá ocel'. (VB: 5, cena: 3000 zlatých)";
};

func int DIA_Ramirez_Teach_W5_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W4 == TRUE) && (THIEF_REPUTATION >= 20) && (Lovkach_W5 == FALSE) && (RavenAway == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W5_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W5_01_01");	//Nauč mě, jak vykovat meč 'Pronikavá ocel'.

	if((hero.lp >= 5) && (Npc_HasItems(other,ItMi_Gold) >= 3000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_02");	//To je velmi sofistikovaná zbraň.
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_03");	//Pečlivě si vyber z čeho ten meč budeš kovat, u tohoto meče je to obzlášť důležité.
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_04");	//A teď mě dobře poslouchej.
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_05");	//Tenhle meč se ková podobným způsobem jako ten předchozí.
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_06");	//Ocel ale tentokrát vyžaduje rudu, a k naostření meče je použita síra.
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_07");	//Broušení meče je nutno věnovat speciální pozornost! 
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_08");	//Jak jméno meče naznačuje, s tímhle mečem bude opravdu jednoduché proniknout jakoukoliv zbrojí nepřítele.
		hero.lp = hero.lp - 5;
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(other,ItMi_Gold,3000);
		AI_Print("Naučeno: Kovářství - 'Pronikavá ocel'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování PRONIKAVÉ OCELI: 2x černá perla, ingot magické rudy a 10x síra.");
		Lovkach_W5 = TRUE;
	}
	else
	{
		if(hero.lp < 5)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 3000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W5_03_90");	//Nemáš dost zlata. Přijď později.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Ramirez_Teach_W6(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W6_condition;
	information = DIA_Ramirez_Teach_W6_info;
	permanent = TRUE;
	description = "Nauč mě, jak vykovat meč 'Žihadlo škorpiona'. (VB: 6, cena: 4000 zlatých)";
};

func int DIA_Ramirez_Teach_W6_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W5 == TRUE) && (THIEF_REPUTATION >= 30) && (Kapitel >= 2) && (Lovkach_W6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W6_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W6_01_01");	//Nauč mě, jak vykovat meč 'Žihadlo škorpiona'.

	if((hero.lp >= 6) && (Npc_HasItems(other,ItMi_Gold) >= 4000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_02");	//Dostal ses k té nejzajímavější části ve výuce! Jednoduché meče už tě nejspíš nezajímají.
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_03");	//Další zbraň - má v sobě osobní kouzlo!
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_04");	//Teď mě dobře poslouchej.
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_05");	//Vhoď do kovárny více uhlí.
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_06");	//Akvamarín bude sloužit jako dekorace pro výrobu rukojeti.
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_07");	//Ta bude vypadat jako zakřivený bodec štíra!
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_08");	//Dále budeš potřebovat černou perlu, simbolizující jen škorpiona.
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_09");	//Pak nanes skutečný jed na její ostří.
		hero.lp = hero.lp - 6;
		RankPoints = RankPoints + 6;
		Npc_RemoveInvItems(other,ItMi_Gold,4000);
		AI_Print("Naučeno: Kovářství - 'Žihadlo škorpiona'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování ŽIHADLA ŠKORPIONA: 5x uhlí, 5x akvamarín, černá perla a 2x jed.");
		Lovkach_W6 = TRUE;
	}
	else
	{
		if(hero.lp < 6)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 4000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W6_03_90");	//Nemáš dost zlata. Přijď později.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Ramirez_Teach_W7(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W7_condition;
	information = DIA_Ramirez_Teach_W7_info;
	permanent = TRUE;
	description = "Nauč mě, jak vykovat 'Noční výkřik'. (VB: 7, cena: 5000 zlatých)";
};

func int DIA_Ramirez_Teach_W7_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W6 == TRUE) && (THIEF_REPUTATION >= 40) && (Kapitel >= 2) && (Lovkach_W7 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W7_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W7_01_01");	//Nauč mě, jak vykovat meč 'Noční výkřik'.

	if((hero.lp >= 7) && (Npc_HasItems(other,ItMi_Gold) >= 5000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_02");	//Je obtížné obstarat si všechny ingredience nutné pro výrobu tohoto meče, ale je to ta nejlepší zbraň kterou tě mohu naučit vykovat.
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_03");	//Jak vidíš k vykování takéveho meče je potřeba hodně zkušeností, je to tak trochu umění.
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_04");	//Meč vyzařuje temnou auru a je smrtící pro všechny tvé nepřátele!
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_05");	//Teď mě dobře poslouchej...
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_06");	//Ocelové pruty, uhlí, křišťál, černou perlu a tři kusy ectoplasmy, to vše budeš potřebovat.
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_07");	//Výroba tohoto meče končí doslova mystickým rituálem. Je nutno ji obětovat mrtvé maso!
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_08");	//To bude asi vše.
		hero.lp = hero.lp - 7;
		RankPoints = RankPoints + 7;
		Npc_RemoveInvItems(other,ItMi_Gold,5000);
		AI_Print("Naučeno: Kovářství - 'Noční výkřik'");
		B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování NOČNÍHO VÝKŘIKU: 5x uhlí, 5x kamenný krystal, černá perla, maso z mrtvoly a 3x ektoplazma.");
		Lovkach_W7 = TRUE;
	}
	else
	{
		if(hero.lp < 7)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 5000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W7_03_90");	//Nemáš dost zlata. Přijď později.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Ramirez_TellAboutFingers(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_TellAboutFingers_condition;
	information = DIA_Ramirez_TellAboutFingers_info;
	permanent = FALSE;
	description = "Je tu prý lepší meč, nežli ten o kterém jsi mi řekl naposled?";
};

func int DIA_Ramirez_TellAboutFingers_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W7 == TRUE) && (THIEF_REPUTATION >= 50) && (Kapitel >= 2) && (Lovkach_W8 == FALSE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_TellAboutFingers_info()
{
	AI_Output(other,self,"DIA_Ramirez_TellAboutFingers_01_01");	//Je tu prý lepší meč, nežli ten o kterém jsi mi řekl naposled?
	AI_Output(self,other,"DIA_Ramirez_TellAboutFingers_01_02");	//Hmmm... (přemýšlí) O něčem takovém jsem slyšel, prý patřil mistru Fingersovi.
	AI_Output(self,other,"DIA_Ramirez_TellAboutFingers_01_03");	//Byla to prý skutečně krásná a nebezpečná zbraň. Ale jestli opravdu existuje, to nemůžu s jistotou říct.
	AI_Output(self,other,"DIA_Ramirez_TellAboutFingers_01_04");	//A pokud o tom opravdu někdo ví, tak jen Fingers.
	AI_Output(self,other,"DIA_Ramirez_TellAboutFingers_01_05");	//Ale neslyšel jsem o něm od té doby, co odešel hnít do kolonie.
	MIS_TellAboutFingers = LOG_Running;
	Log_CreateTopic(TOPIC_TellAboutFingers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TellAboutFingers,LOG_Running);
	B_LogEntry(TOPIC_TellAboutFingers,"Ramirez mi řekl o meči který kdysi patřil Fingerovi. Byla to prý skutečně krásná a nebezpečná zbraň. Ale nejspíš to je jen legenda. Pokud o tom skutečně někdo ví, tak jen samotný Fingers.");
};

instance DIA_Ramirez_BanditShpaga(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 7;
	condition = DIA_Ramirez_BanditShpaga_condition;
	information = DIA_Ramirez_BanditShpaga_info;
	permanent = FALSE;
	description = "Nemáš zájem o meče banditů?";
};

func int DIA_Ramirez_BanditShpaga_condition()
{
	if((THIEF_REPUTATION >= 5) && Npc_HasItems(hero,ItMw_Addon_BanditTrader))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_BanditShpaga_info()
{
	AI_Output(other,self,"DIA_Ramirez_BanditShpaga_01_00");	//Nemáš zájem o meče banditů?
	AI_Output(self,other,"DIA_Ramirez_BanditShpaga_01_01");	//Samozřejmě, že ne... (pohrdavě) Proč bych o takové harampádí měl mít zájem? Ale i přesto je od tebe koupím.
	AI_Output(self,other,"DIA_Ramirez_BanditShpaga_01_02");	//Všem by jen prospělo, kdyby tu těch zlodějů bylo o něco méně.
	B_LogEntry(Topic_Bonus,"Ramirez souhlasil, že ode mne odkoupí jakékoliv meče banditů.");
	RamirezBuyBanditShpaga = TRUE;
};

instance DIA_Ramirez_BanditShpaga_Buy(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 7;
	condition = DIA_Ramirez_BanditShpaga_Buy_condition;
	information = DIA_Ramirez_BanditShpaga_Buy_info;
	permanent = TRUE;
	important = FALSE;
	description = "Mám tu nějaké meče banditů...";
};

func int DIA_Ramirez_BanditShpaga_Buy_condition()
{
	if((RamirezBuyBanditShpaga == TRUE) && Npc_HasItems(hero,ItMw_Addon_BanditTrader))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_BanditShpaga_Buy_info()
{
	var C_Item EquipWeap;
	var int tempgoldrap;

	AI_Output(other,self,"DIA_Ramirez_BanditShpaga_Buy_01_01");	//Mám tu nějaké meče banditů...
	EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	tempgoldrap = Npc_HasItems(hero,ItMw_Addon_BanditTrader);

	if(Hlp_IsItem(EquipWeap,ItMw_Addon_BanditTrader) == TRUE)
	{
		if(tempgoldrap > 1)
		{
			tempgoldrap -= 1;
		};
	};

	AI_Output(self,other,"DIA_Ramirez_BanditShpaga_Buy_01_02");	//Ukaž, podívám se... (smutně) Doufám že to harampádí jednou budem schopni někomu prodat!
	Npc_RemoveInvItems(hero,ItMw_Addon_BanditTrader,Npc_HasItems(hero,ItMw_Addon_BanditTrader));
	B_GiveInvItems(self,other,ItMi_Gold,tempgoldrap * 80);
};

instance DIA_Ramirez_MagicBook(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 7;
	condition = DIA_Ramirez_MagicBook_condition;
	information = DIA_Ramirez_MagicBook_info;
	permanent = FALSE;
	description = "Slyšel jsem, že si kradl v domě mága Vody Vatrase.";
};

func int DIA_Ramirez_MagicBook_condition()
{
	if((MagicBookFindTradeExt == TRUE) && (MIS_VatrasMagicBook == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_MagicBook_info()
{
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_00");	//Slyšel jsem, že si kradl v domě mága Vody Vatrase.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_01");	//No, když to říkáš, tak asi jo. Proč se ptáš?
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_02");	//Hledám jednu věc, která mu patřila.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_03");	//A co přesně to má být?
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_04");	//Něco jako kniha, nebo deník.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_05");	//Hmm... (zamyšleně) Och, už si vzpomínám. Všiml jsem si toho při odchodu.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_06");	//A rozhodl se, že by to mohlo mít nějakou hodnotu.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_07");	//Ale jak se později ukázalo, byl to jen bezcenný kus papíru.
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_08");	//Takže tu knihu máš pořád u sebe?
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_09");	//Ano.
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_10");	//Tak mi ji dej.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_11");	//Hmm... pokud ji chceš, proč ne. 
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_12");	//Ale, pořád z toho chci alespoň něco mít...
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_13");	//... Za 100 zlatých je tvoje, souhlasíš?
	B_LogEntry(TOPIC_VatrasMagicBook,"Ramirez má Vatrasův deník. Prodá mi ho za 100 zlatých.");	
	Info_ClearChoices(DIA_Ramirez_MagicBook);

	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Ramirez_MagicBook,"Tady jsou peníze.",DIA_Ramirez_MagicBook_Yes);
	};

	Info_AddChoice(DIA_Ramirez_MagicBook,"Ne, to je příliš.",DIA_Ramirez_MagicBook_No);

	if(RhetorikSkillValue[1] >= 30)
	{
		Info_AddChoice(DIA_Ramirez_MagicBook,"Ty po mě chceš 100 zlatých, za bezcenný kus papíru?",DIA_Ramirez_MagicBook_Nothing);
	};
};

func void DIA_Ramirez_MagicBook_Yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ramirez_MagicBook_Yes_01_01");	//Dobře, tady jsou peníze.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Npc_RemoveInvItems(self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Yes_01_02");	//Ok příteli.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Yes_01_03");	//Tady vem si tu knihu!
	B_GiveInvItems(self,other,ItWr_VatrasDiary,1);
	Info_ClearChoices(DIA_Ramirez_MagicBook);
};

func void DIA_Ramirez_MagicBook_No()
{
	AI_Output(other,self,"DIA_Ramirez_MagicBook_No_01_01");	//To je moc drahé.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_No_01_02");	//Jak myslíš, nechám si ji zatím u sebe.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_No_01_03");	//Třeba se jí jednou někdo opravdu ode mě koupí.
	MagicBookFindTrade = TRUE;
	Info_ClearChoices(DIA_Ramirez_MagicBook);
};

func void DIA_Ramirez_MagicBook_Nothing()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ramirez_MagicBook_Nothing_01_00");	//Ty po mě chceš 100 zlatých, za bezcenný kus papíru?
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Nothing_01_01");	//Hmmm.
	AI_Output(other,self,"DIA_Ramirez_MagicBook_Nothing_01_02");	//Chceš me snad napálit?
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Nothing_01_03");	//Myslel jsem, že ten deník potřebuješ.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Nothing_01_04");	//Ach, no tak dobře... U Beliara! Tak si ji vem, na... 

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	B_GiveInvItems(self,other,ItWr_VatrasDiary,1);
	Info_ClearChoices(DIA_Ramirez_MagicBook);
};