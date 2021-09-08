
instance DIA_DiegoNW_EXIT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 999;
	condition = DIA_DiegoNW_EXIT_Condition;
	information = DIA_DiegoNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoNW_Perm(C_Info)
{
	npc = PC_Thief_NW;
	nr = 998;
	condition = DIA_DiegoNW_Perm_Condition;
	information = DIA_DiegoNW_Perm_Info;
	permanent = TRUE;
	description = "Jak jdou obchody?";
};


func int DIA_DiegoNW_Perm_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Mizerně. Někdo mi měl říct, že to s Khorinisem šlo k šípku.
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//No nevím. Já to město znám jenom takhle.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//Měl jsi ho vidět před pár lety. To by se ti vážně líbilo.
};


instance DIA_DiegoNW_NeedHelp(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = DIA_DiegoNW_NeedHelp_Condition;
	information = DIA_DiegoNW_NeedHelp_Info;
	important = TRUE;
};


func int DIA_DiegoNW_NeedHelp_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_NeedHelp_Info()
{
	if(Diego_IsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Netvař se tak překvapeně.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(směje se) Ty sis opravdu myslel, že jsem mrtvý?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//Byl jsem chvíli v bezvědomí. Nicméně žiji, jak sis mohl všimnout.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//A nyní jsme spolu. A to se počítá.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//Potřebuji tvou pomoc.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Dobře že jsi tady. Budeš mi muset pomoci.
	};
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	if(DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	};
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co je tohle za šaty?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co tady děláš?",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Kdo jsi?",DIA_DiegoNW_NeedHelp_Problem);
};

func void DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//Pozoroval jsem stráže. Jsou pořád na nohou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//Řekl bych, že proklouznout mezi nimi nebude nijak snadné.
};

func void DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Asi to bude mými šaty. Stráže mě nechtějí pustit do města.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Proto jsem před městem koupil od jednoho obchodníka tyhle hadry. Doufám, že si na mě už vzpomínáš. Jsem Diego.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//Tenkrát v base jsem tě naučil všechno, co jsi potřeboval vědět, abys přežil.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//Přece jsi to všechno nemohl zapomenout.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Ehm... co všechno se vlastně stalo?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//No to mě omyj, ty si vážně nic nepamatuješ.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//Hele, vážně teď nemám čas ti všechno vysvětlovat. Řeknu to takhle: bývali jsme zatraceně dobří přátelé a několikrát jsem ti zachránil život.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//A teď potřebuji tvou pomoc.
};

func void DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Co je tohle za šaty?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Koupil jsem je před městem od jednoho obchodníka. Stráže mě poprvé nechtěli pustit dovnitř.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Také není nutné, aby celý svět věděl, odkud jsem.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//To je fakt.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Také to tak vidím. Ale i když jsem zahodil svůj hábit Stína, jsem pořád tím, kým jsem byl vždycky.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//A s tímhle městem mám velké plány.
};

func void DIA_DiegoNW_NeedHelp_Problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//Co jako?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Hodně věcí se změnilo, co jsem odešel. Musím se znovu postavit na nohy.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//V čem je problém?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Musím se dostat do horní čtvrti.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Nejsem ale občanem města a nemám dost peněz, abych podplatil stráže. Ale naštěstí tady jsi ty!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//Takže po mně chceš, abych ti půjčil nějaké peníze?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//Nesmysl. Nějaké zlato mám - dokonce spoustu zlata! Bohužel ho nemám s sebou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Takže mi to moje zlato přineseš.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Na to nemám čas.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co z toho budu mít?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Dobrá, pomůžu ti.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

func void DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Hele, já myslel, že jsme kámoši! Byl jsem to koneckonců já, kdo ti zachránil kejhák, když tě hodili do kolonie.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//Přeháníš.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//Vážně? Tak se zkus na chvilku zamyslet, jak by to s tebou dopadlo, kdybych ti tehdy nevysvětlil, jak se chovat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Rudobaroni by si tě dali k snídani, čekala by tě mizerná smrt v dolech.
	MIS_HelpDiegoNW = LOG_FAILED;
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//Ptal jsem se snad někdy já tebe, co dostanu na oplátku? Jsme přátelé, copak to je málo?
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//Dobrá, pomůžu ti.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_01");	//Dobrá, poslouchej: Když ještě stála bariéra, schoval jsem si malý poklad.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_02");	//Počkej chvíli. To je to, co jsem si zapomněl vzít s sebou.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_03");	//Ale musím zde zůstat.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_04");	//Abych to zkrátil, prostě běž do Hornického údolí a přines mi moje zlato.
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto v Hornickém údolí. Potřebuje se dostat mezi smetánku, a tak mě pro ně poslal.");
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Co chceš s tím zlatem dělat?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Kde jsi to zlato získal?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Kam jsi to zlato ukryl?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Co chceš s tím zlatem dělat?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//V horní čtvrti je obchodník, kterému musím zaplatit dluh. Potřebuju to dát konečně do pořádku.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//A pak budu moci začít zcela nový život!
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Kde jsi to zlato získal?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Jsem snad jediný, kdo si v Hornickém údolí šetřil pro strýčka Příhodu?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//Štípnout pár nugetů byla hračka. Dělal jsem to prostě pro případ, že bychom se nakonec dostali ven.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Každý se staral pouze o rudu, nikdo se nestaral o zlato...
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Kam jsi to zlato ukryl?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Je přímo na místě výměny. Nad opuštěným dolem. Jsou v kožené kabele.
	if(Diego_angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Ale ticho. Myslím, že si toho nikdo nevšiml.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Prostě vezmi váček a dones mi ho.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Nezapomeň se ale přesvědčit, že tam opravdu je, ať se nevracíš s prázdnou.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Jak to poznám?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Ten vak je plný zlata. Je to spousta zlata!
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Pokusím se najít tvoje zlato.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);
	B_LogEntry(TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto kdesi na staré obchodní cestě, nad opuštěným dolem - tam, kudy kdysi dopravovali do kolonie zboží.");
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Zkusím to tvoje zlato najít.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(zašklebí se) Jen do toho. Budeme si kvit.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"A dál...",dia_diegonw_needhelp_problem_willhelpyou_wheremoregold);
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheremoregold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_15_00");	//A dál... Kde jsi našel nugety?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_01");	//Hmm... No, proč ne...
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_02");	//Na jednom místečku... Co myslíš, že jsem měl na práci v průsmyku? Přišel jsem se na něj dívat?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_03");	//Je to u jednoho dolu, kde už všichni zapomněli, že je tam ruda. Má ještě jeden vchod.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_04");	//Když budeš stát nad tajným průchodem do Khorinisu, tak jdi doleva.
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"V Hornickém údolí je nad tajným průchodem do Khorinisu další vchod do Starého dolu.");
};


instance DIA_DiegoNW_HelpYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_HelpYou_Condition;
	information = DIA_DiegoNW_HelpYou_Info;
	permanent = FALSE;
	description = "Dobrá, přece jenom ti pomůžu.";
};


func int DIA_DiegoNW_HelpYou_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_HelpDiegoNW == LOG_FAILED) && (Diego_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HelpYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//Dobrá, přece jenom ti pomůžu.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//Věděl jsem to.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//Fajn, přejděme rovnou k věci.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Takže. V Hornickém údolí jsem si schoval poklad, a ty mi ho přineseš.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//Já mezitím zůstanu tady a všechno připravím.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto kdesi na staré obchodní cestě, nad opuštěným dolem - tam, kudy kdysi dopravovali do kolonie zboží.");
};

instance DIA_DiegoNW_HaveYourGold(C_Info)
{
	npc = PC_Thief_NW;
	nr = 31;
	condition = DIA_DiegoNW_HaveYourGold_Condition;
	information = DIA_DiegoNW_HaveYourGold_Info;
	permanent = TRUE;
	description = "Našel jsem tvoje zlato!";
};


func int DIA_DiegoNW_HaveYourGold_Condition()
{
	if(((OpenedDiegosBag == TRUE) || (Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Velmi dobře. Gerbandt by se měl začít pakovat.
};


var int DiegosRevenge;

func void DIA_DiegoNW_HaveYourGold_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Našel jsem tvoje zlato!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//Výborně. Ukaž.

	if(Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)
	{
		B_GiveInvItems(other,self,ItSe_DiegosTreasure_Mis,1);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	}
	else if(Npc_HasItems(other,ItMi_Gold) < DiegosTreasure)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Ale to není všechno! Nevěříš mi? Potřebuju všechno.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Pokud můj plán vyjde, zbude dost i na tebe.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Takže se snaž, aby nic nechybělo. Je to důležité!
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,DiegosTreasure);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	};
	if((Npc_IsDead(Gerbrandt) == FALSE) && (DiegosRevenge == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//Poslouchej, ještě se musím postarat o ty stráže.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Chtěl bych, abys donesl tenhle dopis Gerbrandtovi. Je to jeden z těch tlustých obchodníků v horní čtvrti.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Pozdravuj ho ode mne. Pak se s tebou setkám před Gerbrandtovým domem.
		CreateInvItems(self,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems(self,other,ItWr_DiegosLetter_MIS,1);
		B_StartOtherRoutine(Gerbrandt,"WaitForDiego");
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_Running;
		B_GivePlayerXP(XP_HelpDiegoNW);
		Log_CreateTopic(TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DiegosResidence,LOG_Running);
		B_LogEntry(TOPIC_DiegosResidence,"Diego mi předal dopis pro obchodníka Gerbrandta.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DiegoNW_DeliveredLetter(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_DeliveredLetter_Condition;
	information = DIA_DiegoNW_DeliveredLetter_Info;
	permanent = FALSE;
	description = "Doručil jsem ten dopis.";
};


func int DIA_DiegoNW_DeliveredLetter_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_DiegosResidence == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_DeliveredLetter_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Doručil jsem ten dopis.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Velmi dobře. Jak to Gerbrandt vzal?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Vypadal docela šokovaně a okamžitě se ztratil.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(spokojeně) To bych řekl.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Obávám se, že ze všeho nejdřív budu muset dohlédnout na vybavení svého nového domu. Pokud si dobře pamatuju, tak Gerbrandt měl strašný vkus, co se nábytku týče.
	B_GivePlayerXP(XP_DiegoHasANewHome);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"A jak jsi to vlastně udělal?",DIA_DiegoNW_DeliveredLetter_YourTrick);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Takže ten dům je tvůj?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

func void DIA_DiegoNW_DeliveredLetter_Gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//A co Gerbrandt?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//Už si užíval toho pohodlného života příliš dlouho.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//On si žil tady, uprostřed luxusu, zatímco já dlabal v dolech vývar z krys.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Netuším, kam měl namířeno, ale do Khorinisu už nikdy nevkročí - na to dohlédnu.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Kdybys ho hledal, najdeš ho asi v přístavní čtvrti.
};

func void DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//Takže ten dům je tvůj?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Ano, od sklepa až po půdu, včetně všeho nábytku.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Po několika letech strávených v krajně nevyhovujících podmínkách se těším, až se vyspím v posteli s nebesy.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//A k snídani si pak dám dobré víno a šťavnatou šunčičku.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//O tom jsi mi nikdy neřekl.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//Se vsaď.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//A jak jsi to vlastně udělal?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Myslíš snad, že Gerbrandt přišel ke všemu tomu bohatství poctivým obchodem?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Když přišlo na nějakou levotu, tak si sám ruce pochopitelně nikdy nezašpinil. Na to měl pomocníka.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//Samozřejmě, že jsem tu a tam něco pochytil. Gerbrandt se mě nakonec zbavil. Nejspíš se bál, že toho vím příliš.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//O tom jsi mi nikdy neřekl.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//Nikdy ses neptal.
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,Dialog_Back,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"A co můj podíl?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"A co Gerbrandt?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//A co můj podíl?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Zdá se, že jsi nakonec přece jenom nezapomněl na všechno, co jsem tě naučil.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Ale máš pravdu, bez tebe bych to nedokázal. Tady je tvůj díl.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
};


var int Diego_Teach;

instance DIA_DiegoNW_CanYouTeach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_CanYouTeach_Condition;
	information = DIA_DiegoNW_CanYouTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě něčemu naučit?";
};


func int DIA_DiegoNW_CanYouTeach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_CanYouTeach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//Můžeš mě něčemu naučit?
	if(Npc_KnowsInfo(other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Ale jistě. Jen mi řekni, až budeš připraven.
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Nejdřív se musím postarat o vlastní záležitosti.
	};
};


var int DiegoNW_Merke_DEX;

instance DIA_DiegoNW_Teach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_Teach_Condition;
	information = DIA_DiegoNW_Teach_Info;
	permanent = TRUE;
	description = "Uč mě.";
};


func int DIA_DiegoNW_Teach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//Uč mě.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//Naučím tě, jak být o něco obratnější.
	DiegoNW_Merke_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if(DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//Už jsi obratnější. Jen tak dál!
	};
	Info_ClearChoices(DIA_DiegoNW_Teach);
};

func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};


instance DIA_DiegoNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_KnowWhereEnemy_Condition;
	information = DIA_DiegoNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Odcházím z Khorinisu.";
};


func int DIA_DiegoNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Diego_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Odcházím z Khorinisu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//Moudré rozhodnutí. Přál bych si jít s tebou. Tohle město se příliš rychle změnilo - časy, kdy jsi mohl rychle zbohatnout, už jsou pryč.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//Mohl bych tě učit v lučištnictví, páčení zámků a navyšování obratnosti.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//Navíc by se ti určitě hodil nějaký slušný zloděj.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Diego chce jít samozřejmě se mnou. Vidí to tak, že čím dřív Khorinis opustí, tím líp. Mohl by mi ukázat, jak se stát obratnějším a vycvičit mě v lukostřelbě. Také se se mnou podělí o umění páčit zámky.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Nechám si to projít hlavou. Momentálně je moje posádka v plném stavu.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Rozmysli si to. Tak jako tak mě najdeš tady.
	}
	else
	{
		Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Snad ti dám vědět, až přijde ten pravý čas.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Nechceš jít taky?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Tak pojeď se mnou setkáme se v přístavu.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Hmm. Máš pravdu, Khorinis je žumpa. Jdu s tebou.
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Počkej, za okamžik budu připraven.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Tak, jsem připraven. Uvidíme se u lodi.
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};

func void DIA_DiegoNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Možná ti dám vědět, až nadejde čas.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Jak myslíš. A možná s tebou dokonce i půjdu. Kdo ví?
	Diego_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};


instance DIA_DiegoNW_LeaveMyShip(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_LeaveMyShip_Condition;
	information = DIA_DiegoNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Dohlídni radši na město.";
};


func int DIA_DiegoNW_LeaveMyShip_Condition()
{
	if((Diego_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Dohlídni radši na město.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//Vážně? Už mě nepotřebuješ? No dobrá. Nezapomeň se stavit, až budeš zpátky ve městě.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//Myslíš, že se ještě setkáme?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Nikdy nezapomenu na ten výraz, který jsi měl ve tváři, když ses válel po zemi po té ráně od Bullita a my se poprvé setkali.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Nemají šanci sehnat někoho lepšího, než jsi ty. MĚLI bychom se znovu setkat. Dávej na sebe pozor.
	Diego_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DiegoNW_StillNeedYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_StillNeedYou_Condition;
	information = DIA_DiegoNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Rozmyslel jsem si to. Chci, abys šel se mnou.";
};


func int DIA_DiegoNW_StillNeedYou_Condition()
{
	if(((Diego_IsOnBoard == LOG_OBSOLETE) || (Diego_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Rozmyslel jsem si to. Chci, abys šel se mnou.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Kam se podělo tvé odhodlání, příteli? Jasně, že s tebou půjdu - ale už se sakra rozhodni.
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Počkej, za okamžik budu připraven.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Dobrá, můžeme jít.
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

instance DIA_DIEGONW_NW_KAPITELORCATTACK(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_kapitelorcattack_condition;
	information = dia_diegonw_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Na město zaútočili skřeti.";
};


func int dia_diegonw_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (THIEFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_00");	//Na město zaútočili skřeti.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_01");	//To je smutné... Přišly těžké časy, v nichž mnoho bylo ztraceno a ještě více bude.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_03");	//Lepší je říci, co budeme dělat?!
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_04");	//Přirozeně se nějak musíme dostat z této pasti.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_05");	//I když, šance na to jsou opravdu malé.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_06");	//Nebo také můžeme počkat, co budou skřeti dělat.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_07");	//Nemyslím, že bychom to měli riskovat.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_08");	//Správně... S největší pravděpodobností by nás nepřivítali jako návštěvu. (úsměv)
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_09");	//Chceš říci, že bychom je měli napadnout?!
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_10");	//Myslím, že mi rozumíš.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_11");	//Ale to je šílenství!
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_12");	//Může, ale skřeti od nás nebudou očekávat podobný krok, takže můj plán může vyjít!
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_13");	//A když ne?
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_14");	//Pak ne, ale měli bychom to zkusit!
	Info_ClearChoices(dia_diegonw_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportTaverne) >= 1)
	{
		Info_AddChoice(dia_diegonw_nw_kapitelorcattack,"Nabídnout runu teleportace do hostince.",dia_diegonw_nw_kapitelorcattack_taverne);
	};
	Info_AddChoice(dia_diegonw_nw_kapitelorcattack,"O tom nepochybuji.",dia_diegonw_nw_kapitelorcattack_nogiverune);
};

func void dia_diegonw_nw_kapitelorcattack_taverne()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_01");	//Tady je teleportační kámen do hostince 'U Mrtvé harpyje'.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_02");	//S její pomocí se odsud dostaneš!
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_05");	//No... Pak tu nabídku využiji.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_07");	//Dobře, tady je.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_08");	//Dík.
	B_GiveInvItems(other,self,ItMi_TeleportTaverne,1);
	Npc_RemoveInvItems(self,ItMi_TeleportTaverne,1);
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_09");	//Díkes, máš to u mě.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_11");	//Jak říkáš, snad se uvidíme.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_12");	//Dobře.
	THIEFNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Dal jsem Diegovi runu do hostince 'U Mrtvé harpyje'. Snad se mu nic nestane.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_diegonw_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_NoGiveRune_01_01");	//O tom nepochybuji!
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_NoGiveRune_01_02");	//Jako za starých časů!
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Jak říkáš, dávej bacha.
	B_LogEntry(TOPIC_HELPCREW,"Diego se rozhodl proplížit se kolem skřetů. Snad se mu to povede.");
	THIEFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_NW_ESCAPE(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_escape_condition;
	information = dia_diegonw_nw_escape_info;
	permanent = FALSE;
	description = "Jsem rád, že tě vidím živého a zdravého!";
};


func int dia_diegonw_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Diego_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_01");	//Jsem rád, že tě vidím živého a zdravého!
	AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_02");	//Abych řekl pravdu, já taky!
	AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_03");	//Takže to znamená že jsi proklouzl kolem skřetů?!
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_04");	//Jak vidíš já jo, ale ne všichni.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_05");	//Skřeti nás mnoho zajmuli!
			B_LogEntry(TOPIC_HELPCREW,"Na Onarově farmě jsem potkal Diega. To jsou dobré zprávy!");
			Log_AddEntry(TOPIC_HELPCREW,"Pravda je, že ne jen tak. Mnoho nás zajali. Doufám, že jsou kluci na živu!");
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_06");	//Skřeti nás mnoho zajali, ale někteří bojovali!
			B_LogEntry(TOPIC_HELPCREW,"Na Onarově farmě jsem potkal Diega. To jsou dobré zprávy!");
			Log_AddEntry(TOPIC_HELPCREW,"Pravda je, že ne jen tak. Mnoho nás zajali. Hodně jsme ztratili.");
		};
		AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_07");	//To není moc dobré.
		AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_08");	//To jo, měli bychom s tím něco dělat.
		AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_09");	//To vím.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_10");	//Jo, jo. A taky každému, kdo byl na lodi.
		AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_11");	//To jsou dobré zprávy!
		AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_12");	//Souhlasím!
		AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_13");	//Přesně.
		B_LogEntry(TOPIC_HELPCREW,"Na Onarově farmě jsem potkal Diega - živého a zdravého. To jsou dobré zprávy! Snad se tam dostanou i ostatní.");
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_DIEGONW_NW_GATHERARMY(C_Info)
{
	npc = PC_Thief_NW;
	nr = 3;
	condition = dia_diegonw_nw_gatherarmy_condition;
	information = dia_diegonw_nw_gatherarmy_info;
	permanent = FALSE;
	description = "Budeš bojovat proti skřetům?";
};


func int dia_diegonw_nw_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (ALLGUARDIANSKILLED == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_gatherarmy_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_00");	//Budeš bojovat proti skřetům?
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_01");	//Proč by to nebylo možné... (ztěžka) Armáda nás potřebuje pouze k tomuto účelu...
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_02");	//Nejsem si jistý, jestli armáda, ale paladinové určitě.
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_03");	//A pomoci takovým osobám by bylo užitečné.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_04");	//To je jistě dobrá zpráva, nicméně myslím, že tak užitečné zase ne.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_05");	//Prostě se může stát, že nebudeme mít dost sil k zastavení nestvůr z Hornického údolí.
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_06");	//To ano, ale pokud budeme jednotní, situace se může vyvinout v náš prospěch.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_08");	//Hmm... Pokud je to tak, máš pravdu. Pomůžu ti pozvednout iluzi výhry. (úsměv)
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_09");	//Nicměně tvé nepochopitelné plány by mohly iluzi proměnit ve skutečnost. (úsměv)
	OTH_JOINHAGEN = TRUE;
	if(MIS_OLDGUARDGOWAR == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_10");	//Zejména teď, když jsou se mnou chlapci z Hornického údolí se na mě můžeš spolehnout!
	}
	else if(REFUSEHELPCAVALORN == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_11");	//Ale každý by byl klidnější, kdyby měl u sebe jen spolehlivé lidi!
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_12");	//A nemyslím jimi ty pyšné paladiny, kteří se zajímají převážně o svůj osobní prospěch!
		AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_13");	//Koho přesně myslíš?!
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_14");	//Hmm... No, například někoho ze Starého tábora.
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_15");	//Máme spoustu společného a prožili jsme mnoho nebezpečí - spolu a ve zdraví.
		AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_17");	//Samo sebou.
		MIS_DIEGOOLDFRIENS = LOG_Running;
		Log_CreateTopic(TOPIC_DIEGOOLDFRIENS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOOLDFRIENS,LOG_Running);
  		B_LogEntry(TOPIC_DIEGOOLDFRIENS,"Zdá se, že Diego se přidá na stranu paladinů, nicméně, jak řekl, byl by klidnější, kdyby měl kolem sebe jen lidi, kterým může důvěřovat.");
	}
	else
	{
		B_StartOtherRoutine(thorus_nw,"KillHim");
		B_StartOtherRoutine(scatty_nw,"KillHim");
		AI_Teleport(vlk_6022_thorus,"NW_FARM2_PATH_SCATTY");
		AI_Teleport(vlk_6024_scatty,"NW_FARM2_PATH_01");
		B_KillNpc(vlk_6022_thorus);
		B_KillNpc(vlk_6024_scatty);
		b_killnpccannodead(BAU_4300_Addon_Cavalorn);
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_02");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_03");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_04");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_05");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_06");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_07");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_08");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_09");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_10");
		ORCAKILINSERTED = TRUE;
	};
};


instance DIA_DIEGONW_NW_GATHERARMYDONE(C_Info)
{
	npc = PC_Thief_NW;
	nr = 3;
	condition = dia_diegonw_nw_gatherarmydone_condition;
	information = dia_diegonw_nw_gatherarmydone_info;
	permanent = FALSE;
	description = "Co takhle Cavalorna?";
};


func int dia_diegonw_nw_gatherarmydone_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_SUCCESS) && (MIS_DIEGOOLDFRIENS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_gatherarmydone_info()
{
	var int ths;
	var int sct;
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_00");	//Co takhle Cavalorna?
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_01");	//Hmm... Jo, tomu bych život svěřil!
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_02");	//S ním jsem prožil hodně.
	if((THORUSINSERTED == TRUE) && (THORUSJOINME == TRUE) && !Npc_IsDead(vlk_6022_thorus))
	{
		ths = TRUE;
	};
	if((SCATTYINSERTED == TRUE) && (SCATTYJOINME == TRUE) && !Npc_IsDead(vlk_6024_scatty))
	{
		sct = TRUE;
	};
	if((sct == TRUE) || (ths == TRUE))
	{
		if((sct == TRUE) && (ths == TRUE))
		{
			B_GivePlayerXP(150);
			AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_03");	//Kromě Scattyho je zde i Thorus.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_04");	//Super! To jsou ti praví chlapi.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_05");	//To již prokázal čas.
		}
		else if((sct == TRUE) && (ths == FALSE))
		{
			B_GivePlayerXP(100);
			AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_06");	//Scatty je zde také.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_07");	//Super! To je ten pravý chlap.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_08");	//To již prokázal čas.
		}
		else if((sct == FALSE) && (ths == TRUE))
		{
			B_GivePlayerXP(100);
			AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_09");	//Thorus je zde také.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_10");	//Super! To je ten pravý chlap.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_11");	//To již prokázal čas.
		};
	}
	else
	{
		B_GivePlayerXP(300);
	};
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_12");	//Jsem přesvědčen, že s těmito lidmi nebudou žádné problémy, je to tak?
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_13");	//Samo sebou, díky za tvou pomoc.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_14");	//Také nezapomeň říci, až půjdeš proti skřetům.
	MIS_DIEGOOLDFRIENS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DIEGOOLDFRIENS,LOG_SUCCESS);
	B_LogEntry(TOPIC_DIEGOOLDFRIENS,"Nyní jsou v Diegově blízkosti lidé, kterým věří.");
};


instance DIA_DIEGONW_NW_SOONBATTLENOW(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_soonbattlenow_condition;
	information = dia_diegonw_nw_soonbattlenow_info;
	permanent = FALSE;
	description = "Nervózní?";
};


func int dia_diegonw_nw_soonbattlenow_condition()
{
	if((STOPBIGBATTLE == FALSE) && (MOVEFORCESCOMPLETE_01 == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_soonbattlenow_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_SoonBattleNow_01_00");	//Nervózní?
	AI_Output(self,other,"DIA_DiegoNW_NW_SoonBattleNow_01_01");	//Ne... Jen mě dostává ta nejistota. (úsměv)
	AI_Output(self,other,"DIA_DiegoNW_NW_SoonBattleNow_01_02");	//Možná, že skřeti již brzy pohnou svíma prdelema a půjdou na nás!
	AI_Output(other,self,"DIA_DiegoNW_NW_SoonBattleNow_01_03");	//Věřím, že to brzo zjistíme.
	AI_Output(self,other,"DIA_DiegoNW_NW_SoonBattleNow_01_04");	//To doufám příteli, byl bych rád!
};


instance DIA_DIEGONW_NW_BATTLEWIN(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_battlewin_condition;
	information = dia_diegonw_nw_battlewin_info;
	permanent = FALSE;
	description = "Vyhráli jsme ten boj.";
};


func int dia_diegonw_nw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_DiegoNW_NW_BattleWin_01_00");	//Vyhráli jsme ten boj.
	AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_01");	//Amo kamaráde, věřím, že skřeti si tenhle den zapamatují.
	AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_02");	//I když cena za vítězství byla velmi vysoká.
	if(HORINISISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_03");	//Nicméně s tím se nedá nic dělat a je třeba jít dále!
		AI_Output(other,self,"DIA_DiegoNW_NW_BattleWin_01_04");	//Máš přestavu co těď dělat?
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_05");	//Hmm... Hlavní věcí bude nepřeceňovat tenhle úspěch.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_06");	//Přesto většina ostrova je stále na milost a nemilost krvelačných potvor.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_09");	//Takže se nesmíme zastavit zde.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_10");	//A je lepší použít tuto chvíli, než nepřítel přijde k rozumu a schová se.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_11");	//Proto jsem si jistý, že víš co je třeba.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_12");	//Mnozí by souhlasili s tím, aby ti pomohli a já smozřejmě taky!
	};
};


instance DIA_DIEGONW_NW_GOONORKSHUNT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_goonorkshunt_condition;
	information = dia_diegonw_nw_goonorkshunt_info;
	permanent = FALSE;
	description = "Slíbil jsi mi pomoc!";
};


func int dia_diegonw_nw_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (ALLGREATVICTORY == FALSE) && (DIEGOTOBIGLAND == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && Npc_KnowsInfo(hero,dia_diegonw_nw_battlewin))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_DiegoNW_NW_GoOnOrksHunt_01_00");	//Slíbil jsi mi pomoc!
	AI_Output(self,other,"DIA_DiegoNW_NW_GoOnOrksHunt_01_01");	//Neodmítnu svůj slib, takže ses rozhodl?
	AI_Output(other,self,"DIA_DiegoNW_NW_GoOnOrksHunt_01_02");	//Je třeba těm tvorům ukázat komu tato země patří!
	AI_Output(self,other,"DIA_DiegoNW_NW_GoOnOrksHunt_01_03");	//Tady se na mě můžeš spolehnout.
	DIEGOJOINMEHUNT = TRUE;
};


instance DIA_DIEGONW_NW_FOLLOWME(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_followme_condition;
	information = dia_diegonw_nw_followme_info;
	permanent = TRUE;
	description = "Pojď za mnou!";
};


func int dia_diegonw_nw_followme_condition()
{
	if((DIEGOJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (DIEGOTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_followme_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_FollowMe_01_00");	//Pojď za mnou!
	AI_Output(self,other,"DIA_DiegoNW_NW_FollowMe_01_01");	//Jasně, vpřed!
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_NW_STOPHERE(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_stophere_condition;
	information = dia_diegonw_nw_stophere_info;
	permanent = TRUE;
	description = "Čekej!";
};


func int dia_diegonw_nw_stophere_condition()
{
	if((DIEGOJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (DIEGOTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_stophere_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_StopHere_01_00");	//Čekej!
	AI_Output(self,other,"DIA_DiegoNW_NW_StopHere_01_01");	//Dobře, víš kde mne hledat.
	Npc_ExchangeRoutine(self,"OrcAtcNW");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_THIEF_NW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_thief_nw_allgreatvictory_condition;
	information = dia_thief_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Problémy se skřety jsou minulostí.";
};


func int dia_thief_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_thief_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Thief_NW_AllGreatVictory_01_00");	//Problémy se skřety jsou minulostí.
	AI_Output(self,other,"DIA_Thief_NW_AllGreatVictory_01_01");	//Výborně. Ve všech koutech tu jednou bude klid.
	AI_Output(self,other,"DIA_Thief_NW_AllGreatVictory_01_02");	//Nicméně ještě není konec.
	AI_Output(self,other,"DIA_Thief_NW_AllGreatVictory_01_03");	//S největší pravděpodobností je to jen malý oddech!
	AI_Output(other,self,"DIA_Thief_NW_AllGreatVictory_01_04");	//To se ukáže.
};


instance DIA_THIEF_NW_WHATDONOW(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_thief_nw_whatdonow_condition;
	information = dia_thief_nw_whatdonow_info;
	permanent = FALSE;
	description = "Takže co teď?";
};


func int dia_thief_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (DIEGOTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_thief_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Thief_NW_WhatDoNow_01_00");	//Takže co teď?
	AI_Output(self,other,"DIA_Thief_NW_WhatDoNow_01_01");	//Hmm... Na to bych se měl zeptat já tebe!
	AI_Output(self,other,"DIA_Thief_NW_WhatDoNow_01_02");	//Ve skutečnosti ty z nás dvou jsi nikdy nevydržel sedět na stejném místě.
	AI_Output(self,other,"DIA_Thief_NW_WhatDoNow_01_03");	//A já na tebe jako vždy budu dávat pozor. Takže si odpověz sám, protože moji odpověď znáš.
	AI_Output(other,self,"DIA_Thief_NW_WhatDoNow_01_05");	//Samo sebou.
};


instance DIA_THIEF_NW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_thief_nw_travelonbigland_condition;
	information = dia_thief_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Jsi připraven jít se mnou?";
};


func int dia_thief_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_thief_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Thief_NW_TravelOnBigLand_01_00");	//Jsi připraven jít se mnou?
	AI_Output(self,other,"DIA_Thief_NW_TravelOnBigLand_01_01");	//Hned jak řekneš kámo!... (lstivě)
	AI_Output(other,self,"DIA_Thief_NW_TravelOnBigLand_01_02");	//Mám důležité poselství pro krále na kontinentu.
	AI_Output(self,other,"DIA_Thief_NW_TravelOnBigLand_01_03");	//Tak to je jiná, musíme si vypůjčit plavidlo.
	AI_Output(other,self,"DIA_Thief_NW_TravelOnBigLand_01_04");	//Loď je v přístavu a čeká na odjezd.
	AI_Output(self,other,"DIA_Thief_NW_TravelOnBigLand_01_05");	//Dobře, jdu tam.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	DIEGOTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Diego nepotřeboval dlouhého přemlouvání a souhlasil jít se mnou.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

instance DIA_Thief_NW_PICKPOCKET(C_Info)
{
	npc = PC_Thief_NW;
	nr = 998;
	condition = DIA_Thief_NW_PICKPOCKET_Condition;
	information = DIA_Thief_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Thief_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_Thief_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,Dialog_Back,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};
