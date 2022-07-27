
instance DIA_Marduk_Kap1_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap1_EXIT_Condition;
	information = DIA_Marduk_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_NoEnter_PissOff(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = DIA_Marduk_NoEnter_PissOff_Condition;
	information = DIA_Marduk_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Marduk_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Marduk_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Marduk_NoEnter_PissOff_01_00");	//Hmm... (naštvaně)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};


instance DIA_Marduk_JOB(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_JOB_Condition;
	information = DIA_Marduk_JOB_Info;
	permanent = FALSE;
	description = "Jaké máš zde povinnosti?";
};

func int DIA_Marduk_JOB_Condition()
{
	return TRUE;
};

func void DIA_Marduk_JOB_Info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//Jaké máš zde povinnosti?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//Připravuji paladiny na jejich boj se Zlem.
};


instance DIA_Marduk_Arbeit(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 3;
	condition = DIA_Marduk_Arbeit_Condition;
	information = DIA_Marduk_Arbeit_Info;
	permanent = FALSE;
	description = "Co pro tebe můžu udělat, mistře?";
};


func int DIA_Marduk_Arbeit_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//Co pro tebe můžu udělat, mistře?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//Pro mne? Ne, nepotřebuji tvou pomoc. Raději se pomodli za válečníky Innose, kteří se vypravili do Hornického údolí.
	MIS_MardukBeten = LOG_Running;
	B_StartOtherRoutine(Sergio,"WAIT");
	Log_CreateTopic(Topic_MardukBeten,LOG_MISSION);
	Log_SetTopicStatus(Topic_MardukBeten,LOG_Running);
	B_LogEntry(Topic_MardukBeten,"Mistr Marduk pro mne nemá žádné úkoly. Byl by ale rád, kdybych se pomodlil za paladiny.");
};


instance DIA_Marduk_Gebetet(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 3;
	condition = DIA_Marduk_Gebetet_Condition;
	information = DIA_Marduk_Gebetet_Info;
	permanent = FALSE;
	description = "Pomodlil jsem se za paladiny.";
};


func int DIA_Marduk_Gebetet_Condition()
{
	if((MIS_MardukBeten == LOG_Running) && Npc_KnowsInfo(other,PC_PrayShrine_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Gebetet_Info()
{
	AI_Output(other,self,"DIA_Marduk_Gebetet_15_00");	//Pomodlil jsem se za paladiny.
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//Dobře jsi udělal. Teď se vrať ke svým povinnostem.
	MIS_MardukBeten = LOG_SUCCESS;
	B_GivePlayerXP(XP_MardukBeten);
	B_StartOtherRoutine(Sergio,"START");
};


instance DIA_Marduk_Evil(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_Evil_Condition;
	information = DIA_Marduk_Evil_Info;
	permanent = TRUE;
	description = "Co je 'Zlo'?";
};


func int DIA_Marduk_Evil_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Evil_Info()
{
	AI_Output(other,self,"DIA_Marduk_Evil_15_00");	//Co je 'Zlo'?
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//Zlo je všude. Je to síla Beliara, Innosova odvěkého nepřítele.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//Je to všudypřítomná temnota, která chce navždy zničit Světlo Innosovo.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//Beliar je Pán temnoty, nenávisti a ničení.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//Jenom ti z nás, kterým v srdci hoří Innosův oheň, přinesou do světa jeho Světlo a zaženou temnotu.
};


instance DIA_Marduk_Pal(C_Info)
{
	npc = KDF_505_Marduk;
	condition = DIA_Marduk_Pal_Condition;
	information = DIA_Marduk_Pal_Info;
	permanent = FALSE;
	description = "V kláštere žijí jenom mágové a novici?";
};


func int DIA_Marduk_Pal_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Pal_Info()
{
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//V kláštere žijí jenom mágové a novici?
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//Správně. Na rozdíl od naší komunity, která uznává Slovo Innosovo...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//... si paladinové nadevše ctí Pánovy Skutky.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//My jsme jeho představitelé, ale paladinové válečníci, kteří jdou do boje v jeho jméně a zvyšují jeho slávu.
};


instance DIA_Marduk_Kap2_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap2_EXIT_Condition;
	information = DIA_Marduk_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap3_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap3_EXIT_Condition;
	information = DIA_Marduk_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap3_Hello(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 30;
	condition = DIA_Marduk_Kap3_Hello_Condition;
	information = DIA_Marduk_Kap3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Marduk_Kap3_Hello_Condition()
{
	if((Kapitel == 3) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_Hello_Info()
{
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_00");	//Vítej, synu můj.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//Kdy ses stal jedním z paladinů?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//Odkud jsi přišel?
	};
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
	Info_AddChoice(DIA_Marduk_Kap3_Hello,"To není tvoje věc.",DIA_Marduk_Kap3_Hello_NotYourConcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello,"Jenom nedávno.",DIA_Marduk_Kap3_Hello_Soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello,"Přišel jsem ze statků.",DIA_Marduk_Kap3_Hello_DJG);
	};
};

func void DIA_Marduk_Kap3_Hello_NotYourConcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//To není tvoje věc.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//(nadává) Paladin by měl vždy být slušný a skromný. Je tvou povinností chránit ty, kteří to sami nedokážou.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//(nadává) Je to výsada a měl bys být vděčný za to, že ti to Innos umožnil. Popřemýšlej o tom!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//(nahněvaně) Byly časy, kdy spodina nemohla vstoupit do našeho kláštera. Ty jsi důkazem, že to tak bylo lepší.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//(varovně) Varuji tě, když něco uděláš, budeš okamžitě potrestán. Nebudeme podporovat falešnou shovívavost.
	};
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_Soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//Jenom nedávno.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//Tak tě teda vítám. V tomto boji potřebujeme každého muže, který má kuráž postavit se Zlu.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//Naše víra leží v rukou mužů jako ty. Nechť ti Innos dodá odvahu.
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_DJG()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//Přišel jsem ze statků.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//Tak tě teda ve jméně naší pohostinnosti vítám. Doufám, že jí patřičně oceníš.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//Nezneužívej svou pozici hosta, jinak budeš mít veliké problémy.
	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};


instance DIA_Marduk_TrainPals(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 32;
	condition = DIA_Marduk_TrainPals_Condition;
	information = DIA_Marduk_TrainPals_Info;
	permanent = TRUE;
	description = "Co mě můžeš naučit?";
};


var int Marduk_TrainPals_permanent;

func int DIA_Marduk_TrainPals_Condition()
{
	if((hero.guild == GIL_PAL) && (Marduk_TrainPals_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Marduk_TrainPals_Info()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//Co mě můžeš naučit?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//Přirozeně to nejsou bojová umění.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//Můžu k tobě ale přinést něco z darů Innose.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//Mimo toho tě musím připravit na Posvěcení meče.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//A magie?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//Tady vyučujeme jenom naši magii. Magii paladinů se musíš naučit ve městě.
	Info_ClearChoices(DIA_Marduk_TrainPals);
	Info_AddChoice(DIA_Marduk_TrainPals,"Možná později.",DIA_Marduk_TrainPals_Later);
	Info_AddChoice(DIA_Marduk_TrainPals,"Co tím myslíš?",DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice(DIA_Marduk_TrainPals,"Co je Posvěcení meče?",DIA_Marduk_TrainPals_Blessing);
};

func void DIA_Marduk_TrainPals_Later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//Možná později.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//Jsi tu kdykoli srdečně vítán.
	Info_ClearChoices(DIA_Marduk_TrainPals);
};

func void DIA_Marduk_TrainPals_Meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//Když musel Innos opustit svět, nechal lidstvu část své božské moci.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//Jenom několik z nás jí může použít a dozírat na vykonávání spravedlnosti v jeho jménu.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//A co vyžaduješ ode mne?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//Můžu tě přivést na správnou cestu, abys poznal podstatu Innose a následoval ho.
};

func void DIA_Marduk_TrainPals_Blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//Co je Posvěcení meče?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//Posvěcení meče je jeden z nejposvátnějších rituálů paladinů.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//Při této ceremonii, Svatá síla Innosova přetéká čepeli paladinovho meče a dodá meči ohromnou sílu.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//Takhle posvěcený meč je paladinův nejcennější majetek a provází ho celý život.
	Marduk_TrainPals_permanent = TRUE;
};


instance DIA_Marduk_SwordBlessing(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 33;
	condition = DIA_Marduk_SwordBlessing_Condition;
	information = DIA_Marduk_SwordBlessing_Info;
	permanent = TRUE;
	description = "Chtěl bych posvětit svůj meč.";
};


func int DIA_Marduk_SwordBlessing_Condition()
{
	if(Marduk_TrainPals_permanent == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Marduk_SwordBlessing_Info()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//Chtěl bych posvětit svůj meč.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//Pokud jsi rozhodnout podstoupit tento krok, nejprve potřebuješ magickou čepel.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//Pak bys měl jít do kaple a pomodlit se.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//Při modlitbě a po rozumném daru, bys měl žádat o jeho přízeň a vedení v boji proti Zlu.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//Pokud ti bude Innos nakloněný, od toho momentu bude tvůj meč zasvěcen Pánovi.
	Info_ClearChoices(DIA_Marduk_SwordBlessing);
	Info_AddChoice(DIA_Marduk_SwordBlessing,Dialog_Back,DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice(DIA_Marduk_SwordBlessing,"Co by mělo být tím darem?",DIA_Marduk_SwordBlessing_Donation);
	Info_AddChoice(DIA_Marduk_SwordBlessing,"Kde získám čepel z rudy?",DIA_Marduk_SwordBlessing_OreBlade);
};

func void DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices(DIA_Marduk_SwordBlessing);
};

func void DIA_Marduk_SwordBlessing_Donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//Co by mělo být tím darem?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//Teď, vzhledem na přízeň, která je ti nakloněna, je 5000 zlatých víc než vhodných.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//Samozřejmě můžeš darovat i víc.
};

func void DIA_Marduk_SwordBlessing_OreBlade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//Kde můžu získat magickou čepel?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//Zkus kováře Harada ve městě.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//Paladiny zásobuje těmi nejlepšími čepelemi.
	if(Npc_IsDead(Harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//Harad je mrtvý.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//To je mi líto, budeš tedy muset čekat, dokud se nevrátíš s ostatními paladiny na pevninu.
	};
};


instance DIA_Marduk_Kap3_PERM(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 39;
	condition = DIA_Marduk_Kap3_PERM_Condition;
	information = DIA_Marduk_Kap3_PERM_Info;
	permanent = TRUE;
	description = "Nějaké novinky?";
};


func int DIA_Marduk_Kap3_PERM_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_PERM_Info()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//Nějaké novinky?
	if(MIS_NovizenChase == LOG_Running)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//Ano, nepřítel uspěl a v naších radách je zrádce.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//Ukradl Innosovo oko, jeden z naších nejdůležitějších artefaktů. A to je jenom špička ledovce.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//(neklidně) Nepřítel už pronikl i do města.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//Jeden z paladinů, Lothar, byl zavražděn uprostřed ulice.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//(nahněvaně) A za denního světla! Už to zašlo příliš daleko, ale obávám se, že to je jenom začátek.
	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
	Info_AddChoice(DIA_Marduk_Kap3_PERM,Dialog_Back,DIA_Marduk_Kap3_PERM_BAck);
	Info_AddChoice(DIA_Marduk_Kap3_PERM,"Co bude teď?",DIA_Marduk_Kap3_PERM_AndNow);
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM,"Bennet je nevinný.",DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}
	else
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM,"Chytli už toho vraha?",DIA_Marduk_Kap3_PERM_Murderer);
	};
	if(MIS_NovizenChase == LOG_Running)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM,"Kde je teď ten zloděj?",DIA_Marduk_Kap3_PERM_thief);
	};
};

func void DIA_Marduk_Kap3_PERM_BAck()
{
	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
};

func void DIA_Marduk_Kap3_PERM_AndNow()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_00");	//Co bude teď?
	if(MIS_NovizenChase == LOG_Running)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//Budeme stíhat toho zloděje kam bude třeba. Polapíme ho a dohlédneme na to, aby dostal, co mu patří.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//Musíme zjistit kdo ten zloděj je.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//Za nedlouho na to přijdeme. A nezáleží na tom jak dlouho to bude trvat, my ho chytneme.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//Přísahám Innosovi.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//Vražda, ještě k tomu paladina, je bezpochyby jeden z nejhorších zločinů.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//Vrah bude nepochybně popraven.
	};
};

func void DIA_Marduk_Kap3_PERM_BennetisNotGuilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//Bennet je nevinný. Ten svědek lhal.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//Jak to víš?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//Našel jsem důkaz.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//Někdy si myslím, že zrada a nenasytnost jsou našimi největšími nepříteli.
};

func void DIA_Marduk_Kap3_PERM_Murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//Chytli už toho vraha?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//Naštěstí, ano. Byl to jeden z těch hrdlořezů z Onarovy farmy.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//Kdo?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//To nevím. Ale určitě existuje několik žoldáků, od kterých bys to mohl očekávat.
};

func void DIA_Marduk_Kap3_PERM_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//Kde je teď ten zloděj?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//Nevím, vyletěl z brány jako posednutý a pak zmizel.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//Nezáleží na tom, kam se skryje, Innosův hněv ho zasáhne a spálí jeho temnou duši.
};


instance DIA_Marduk_Kap4_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap4_EXIT_Condition;
	information = DIA_Marduk_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_Kap4U5_PERM(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = DIA_Marduk_Kap4U5_PERM_Condition;
	information = DIA_Marduk_Kap4U5_PERM_Info;
	permanent = TRUE;
	description = "Nějaké novinky?";
};


func int DIA_Marduk_Kap4U5_PERM_Condition()
{
	if((Kapitel == 4) || (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4U5_PERM_Info()
{
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//Nějaké novinky?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//Ne, bohužel ne, situace je ještě stále kritická.
};


instance DIA_Marduk_Kap5_EXIT(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 999;
	condition = DIA_Marduk_Kap5_EXIT_Condition;
	information = DIA_Marduk_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marduk_Kap5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marduk_PICKPOCKET(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 900;
	condition = DIA_Marduk_PICKPOCKET_Condition;
	information = DIA_Marduk_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Marduk_PICKPOCKET_Condition()
{
	return C_Beklauen(36,40);
};

func void DIA_Marduk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
	Info_AddChoice(DIA_Marduk_PICKPOCKET,Dialog_Back,DIA_Marduk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Marduk_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Marduk_PICKPOCKET_DoIt);
};

func void DIA_Marduk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};

func void DIA_Marduk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};


instance DIA_MARDUK_CANTEACHARMOR(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = dia_marduk_canteacharmor_condition;
	information = dia_marduk_canteacharmor_info;
	permanent = TRUE;
	description = "(Zeptat se na rudné zbroje)";
};


func int dia_marduk_canteacharmor_condition()
{
	if((MARDUK_CANTEACHARMOR == FALSE) && ((HARADTELLSMARDUK_P1 == TRUE) || (HARADTELLSMARDUK_P2 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_marduk_canteacharmor_info()
{
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_00");	//Slyšel jsem, že mágové Ohně vědí, jak dodat rudným zbrojím božskou sílu. Je to tak?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_01");	//A od koho jsi to slyšel, synu?
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_02");	//Řekl mi o tom kovář Harad. Taktéž říkal, že to jsou jenom povídačky...
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_03");	//Kdybys nebyl paladin, asi bych ti pověděl, že jsou to jenom rozprávky... (přemýšlí)
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_04");	//Ale jelikož jsi Innosův válečník... – myslím, že ti můžu odhalit toto tajemství.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_05");	//Pokud toto vážně ovládneš – najdeš nejdražší dar Innose, jaký může být...
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_07");	//Podstata tohoto poznání pozůstává z posvěcení paladinské rudné zbroje skrze tajnou modlitbu, kterou znají jenom Vyvolení.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_08");	//Posvěcení zbroje – nejsvatější paladinský rituál... A zvládnou ho jenom ti nejlepší.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_10");	//V tomto rituálu zbrojí prochází energie a moudrost Innose, která ho naplní sílou a dodá mu božskou podstatu!
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_12");	//Poté si zbroj nemůžeš jednoduše sundat, protože když tak uděláš, zemřeš!
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_15");	//A co je potřebné na to, abych se stal jedním z Vyvolených?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_16");	//Nic! Innos si sám zvolí, kdo je hodný jeho daru a kdo ne...
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_17");	//A co potřebuji, když chci vykonat tenhle rituál?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_19");	//Rudná paladinská zbroj je na začátek potřebná – nezáleží na tom, která.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_20");	//Pak bys měl přijít do kaple, ale nejprve by sis měl nastudovat modlitbu Vyvolených.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_21");	//Pří modlení a po odevzdání daru, bys měl Innose požádat o přízeň a vedení v boji se Zlem.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_22");	//Když se Innos rozhodne, že jsi hoden jeho daru, sešle na tebe svou dobrou vůli a posvětí tvou zbroj.
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_24");	//A jak Innos zjistí, zda jsem hoden?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_25");	//Modli se k němu a možná tě vyslyší.
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_26");	//A kde mám najít slova modlitby Vyvolených, mistře?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_27");	//Nemusíš. Dám ti knihu, ve které jsou napsané. Jednoduše si je přečti a zapamatuj.
	B_GiveInvItems(self,other,itwr_innospray,1);
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_29");	//Děkuji, mistře.
	AI_Output(other,self,"DIA_Marduk_CanTeachArmor_01_30");	//A jaký dar bych měl dát Innosovi?
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_31");	//Myslím, že jistá suma zlata bude v pořádku. Nemůžu ti ale říct, kolik – Innos se rozhodne sám.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_33");	//To je všechno, co bys měl vědět. Teď jdi, synu můj.
	AI_Output(self,other,"DIA_Marduk_CanTeachArmor_01_34");	//Nechť tě Innos provází!
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_MAGICINNOSARMOR,"Mág Ohně Marduk mi řekl o posvátném rituálu posvěcení paladinské zbroje a tvrdí, že je ho nutné vykonat.");
	MARDUK_CANTEACHARMOR = TRUE;
};


instance DIA_MARDUK_TELLSERGIO(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 49;
	condition = dia_marduk_tellsergio_condition;
	information = dia_marduk_tellsergio_info;
	permanent = FALSE;
	description = "Kde je paladin Sergio?";
};


func int dia_marduk_tellsergio_condition()
{
	if((MIS_FARIONTEST == LOG_Running) && (SERGIOISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_tellsergio_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Marduk_TellSergio_01_00");	//Kde je paladin Sergio?
	AI_Output(self,other,"DIA_Marduk_TellSergio_01_01");	//Tady ho nenajdeš, synu. Jenom nedávno se rozhodl opustit klášter!
	B_LogEntry(TOPIC_FARIONTEST,"Ukázalo se, že paladin Sergio nedávno opustil klášter a nikdo neví, kam šel. Mimo jiného Marduk řekl, že Sergio byl silně rozrušen!");
};


instance DIA_MARDUK_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_runemagicnotwork_condition;
	information = dia_marduk_runemagicnotwork_info;
	permanent = FALSE;
	description = "Tvé magické runy - stále fungují?";
};


func int dia_marduk_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Marduk_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Marduk_RuneMagicNotWork_01_01");	//Momentálně ne... (nechápavě) A ani za svět nedokážu pochopit proč!
	AI_Output(self,other,"DIA_Marduk_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechny! Ostatním mágům Ohně se také nic nedaří.
	AI_Output(other,self,"DIA_Marduk_RuneMagicNotWork_01_04");	//Očividně.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_MARDUK_TREVIUS(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_trevius_condition;
	information = dia_marduk_trevius_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_marduk_trevius_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (COUNT_TREVIUS_DIALOG == TRUE))
	{
		return TRUE;
	};
};

func void dia_marduk_trevius_info()
{
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_00");	//Hledáš písemnosti Xardase?
	AI_Output(other,self,"DIA_Marduk_TREVIUS_01_01");	//No vlastně ano. Můžeš mě k tomu něco říct? 
	AI_Output(other,self,"DIA_Marduk_TREVIUS_01_02");	//Ostatní mě málem spálili pohledem, při zmínce o Xardasovi.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_03");	//U nás není přípustné o tom mluvit...
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_04");	//Zejména o temných mázích a jejich přisluhovačích.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_05");	//Ale tento případ je velmi zvláštní. Ztratil se náš bratr - Trevius.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_06");	//On se zabýval studiem magických formulí, které zůstali po Xardasovi v klášteře.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_07");	//Je už příliš dlouho pryč, a obávám se, že už ho živého neuvidíme. Najdi ho a najdeš i rukopisy.
	AI_Output(self,other,"DIA_Marduk_TREVIUS_01_08");	//A prosím tě, informuj mě co se stalo s Treviusem! To je vše, jdi...
	B_LogEntry(TOPIC_XARDASNDMTASKSONE,"Alespoň, že se mezi těmi arogantními mágy našel ještě rozumný člověk. Marduk mi řekl, že rukopis Xardase studoval mág Trevius. Ale někam zmizel...");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(KDF_512_Trevius,"NW_FARM2_TAVERNCAVE1_02");
	B_KillNpc(KDF_512_Trevius);
	Wld_InsertNpc(Demon,"NW_FARM2_TAVERNCAVE1_02");
};

instance DIA_MARDUK_TREVIUS1(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_trevius1_condition;
	information = dia_marduk_trevius1_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_marduk_trevius1_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_SUCCESS) || (Npc_HasItems(hero,itwr_xardasdocs_3) >= 1))
	{
		return TRUE;
	};
};

func void dia_marduk_trevius1_info()
{
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_Marduk_TREVIUS1_01_00");	//Co víš o Treviusovi?
	AI_Output(other,self,"DIA_Marduk_TREVIUS1_01_01");	//Ano, je mrtvý. Našel jsem ho v blízkosti podivného kamene v západních lesích.
	AI_Output(self,other,"DIA_Marduk_TREVIUS1_01_02");	//Jak k tomu došlo... (smutně) Innos žehnej jeho duši!
	AI_Output(self,other,"DIA_Marduk_TREVIUS1_01_03");	//Děkuji, že jsi přišel. I když jsi temný mág, nemůžu se zbavit pocitu, že jsi přišel konat dobro na tomto světě.
	AI_Output(self,other,"DIA_Marduk_TREVIUS1_01_04");	//Vezmi si svoji odměnu a můžeš jít...
	B_GiveInvItems(self,hero,ItPo_Mana_03,1);
	AI_StopProcessInfos(self);
};

instance DIA_MARDUK_LORDS_HORINIS(C_Info)
{
	npc = KDF_505_Marduk;
	nr = 1;
	condition = dia_marduk_lords_horinis_condition;
	information = dia_marduk_lords_horinis_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_marduk_lords_horinis_condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void dia_marduk_lords_horinis_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_01");	//Bratře, mám pocit, že zlé síly způsobily rozsáhlé škody!
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_02");	//Všechno nasvědčuje tomu, že někdo hodně šílený, posla zpět do říše Beliara, několik velmi nebezpečných stvoření.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_03");	//Je to velké vítězství, které naplňuje mé srdce radostí.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_04");	//Nevíš o tom náhodou něco?
	Info_ClearChoices(dia_marduk_lords_horinis);
	Info_AddChoice(dia_marduk_lords_horinis,"To jako, že je to moje práce!",dia_marduk_lords_horinis_yes);
	Info_AddChoice(dia_marduk_lords_horinis,"Ani nevím...",dia_marduk_lords_horinis_no);
};

func void dia_marduk_lords_horinis_yes()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Marduk_LORDS_HORINIS_01_05");	//To jako, že je to moje práce!
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_06");	//Opravdu? Tak to vypadá, že nemám na výběr, než tě za tu práci odměnit.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_07");	//Vezmi si tohle zlato, na důkaz vděčnosti.
	B_GiveInvItems(self,hero,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Marduk_LORDS_HORINIS_01_08");	//To je opravdu velká částka!
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_09");	//Zasloužíš si to. Jdi bratře a Innos s tebou, při veškerém tvém počínání.
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	AI_StopProcessInfos(self);
};

func void dia_marduk_lords_horinis_no()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Marduk_LORDS_HORINIS_01_10");	//Ani nevím...
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_11");	//Opravdu? Ale mám silný pocit, že je to tvoje zásluha.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_12");	//Nebuď skromný, udělal jsi něco neuvěřitelného pro slávu Innose a svatý oheň.
	AI_Output(other,self,"DIA_Marduk_LORDS_HORINIS_01_13");	//Nu dobrá, tebe neoklamu.
	AI_Output(self,other,"DIA_Marduk_LORDS_HORINIS_01_14");	//Já to věděl! Velice ti děkuji, bratře. Udělal jsi skvělou věc pro celý ostrov. A zasloužíš si odměnu.

	if((hero.guild == GIL_KDF) && (hero.guild == GIL_KDW) && (hero.guild == GIL_KDM) && (hero.guild == GIL_GUR))
	{
		B_GiveInvItems(self,hero,ItPo_Perm_Mana,1);
	}
	else
	{
		B_GiveInvItems(self,hero,ItPo_Perm_Health,1);
	};

	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	AI_StopProcessInfos(self);
};
