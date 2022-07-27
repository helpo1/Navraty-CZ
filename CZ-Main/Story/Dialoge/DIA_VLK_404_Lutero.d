/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void dia_lutero_tradehelperdone_info - upraveny podmínky na zadání dalšího úkolu

*/




instance DIA_Lutero_EXIT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 999;
	condition = DIA_Lutero_EXIT_Condition;
	information = DIA_Lutero_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if((Lutero_Krallen == LOG_Running) && (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && (Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE))
	{
		Lutero_Krallen = LOG_OBSOLETE;
	};
};


instance DIA_Lutero_Hallo(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Hallo_Condition;
	information = DIA_Lutero_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_Hallo_Condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//Jmenuju se Lutero. Obchoduju se vším, na co si vzpomeneš.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//Jaké zboží mi můžeš nabídnout?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//No, hlavně vzácné a neobvyklé věci. Vždycky jsem se snažil vyhovět zákazníkovu přání.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Lutero prodává v horní čtvrti neobvyklé a vzácné věci.");
};


instance DIA_Lutero_GetLost(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_GetLost_Condition;
	information = DIA_Lutero_GetLost_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_GetLost_Condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW)) && Npc_IsInState(self,ZS_Talk) && (MEMBERTRADEGUILD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lutero_GetLost_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Hej, vypadni odsud! To nemáš nic na práci? Tak si nějakou najdi, ale někde jinde!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//Co tady chceš novici? Neměl bys být v klášteře?
	};
};


instance DIA_Lutero_Snapper(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Snapper_Condition;
	information = DIA_Lutero_Snapper_Info;
	permanent = FALSE;
	description = "Hledáš něco konkrétního?";
};


func int DIA_Lutero_Snapper_Condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV) && (other.guild != GIL_NDM) && (other.guild != GIL_NDW) && (other.guild != GIL_SEK))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Hledáš něco konkrétního?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Pro svůj současný úkol potřebuju drápy chňapavce.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//Ale ne jen tak ledajaké drápy. Musí to být něco zvláštního - drápy mocné bestie, co už zabila mnoho mužů, nebo něco takového.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Kde najdu chňapavce?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//Na tomhle ostrově jich pár je, ale většina z nich žije v Hornickém údolí.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//A co z toho budu mít?
	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//Můžu ti opatřit nějaký runový kámen.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//Můžu ti dát prsten nepřemožitelnosti.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//Uvidím, co se dá dělat.
	Log_CreateTopic(TOPIC_Lutero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lutero,LOG_Running);
	B_LogEntry(TOPIC_Lutero,"Obchodník Lutero hledá drápy zvlášť silného chňapavce.");
	Lutero_Krallen = LOG_Running;
};


instance DIA_Lutero_Kralle(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Kralle_Condition;
	information = DIA_Lutero_Kralle_Info;
	permanent = FALSE;
	description = "Mám pro tebe nějaké zajímavé drápy chňapavce.";
};


func int DIA_Lutero_Kralle_Condition()
{
	if((Npc_HasItems(other,ItAt_ClawLeader) >= 1) && Npc_KnowsInfo(other,DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Kralle_Info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//Mám pro tebe nějaké zajímavé drápy chňapavce.
	Lutero_Krallen = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Lutero,LOG_SUCCESS);
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//Můj zákazník to rád uslyší.
	B_GiveInvItems(other,self,ItAt_ClawLeader,1);
	Npc_RemoveInvItems(self,ItAt_ClawLeader,1);
	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//Nemám ten runový kámen tady u sebe. Ale vím, kde ho můžeš najít.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//Až půjdeš z města do hostince, projdeš pod mostem.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//Je tam jeskyně, moji přátelé tam mají v truhle uložené runové kameny. Tady je klíč.
		B_GiveInvItems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Tady je ten prsten, co jsem si slíbil.
		B_GiveInvItems(self,other,ItRi_Prot_Total_01,1);
	};
};


instance DIA_Lutero_Trade(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Trade_Condition;
	information = DIA_Lutero_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int DIA_Lutero_Trade_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lutero_Hallo) == TRUE) && Wld_IsTime(8,0,23,59))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};


instance DIA_Lutero_PICKPOCKET(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 900;
	condition = DIA_Lutero_PICKPOCKET_Condition;
	information = DIA_Lutero_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lutero_PICKPOCKET_Condition()
{
	return C_Beklauen(58,65);
};

func void DIA_Lutero_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,Dialog_Back,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};


instance DIA_LUTERO_TALIASANLETTER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_taliasanletter_condition;
	information = dia_lutero_taliasanletter_info;
	permanent = FALSE;
	description = "Máš pro mě nějakou práci?";
};


func int dia_lutero_taliasanletter_condition()
{
	if(MIS_TALIASANHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lutero_taliasanletter_info()
{
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_01");	//Hledáš práci?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_02");	//Hmm, myslím, že mít ve službách někoho jako jsi ty může být užitečné, ale přesto je tu jeden problém...
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_03");	//Jaký problém?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_04");	//Problém je ten, že mé obchody nejdou zrovna nejlépe a nebudu ti moct zaplatit ve zlatě.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_05");	//Zlato mě nezajímá.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_06");	//Vážně?! Tak co žádáš jako platbu?
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_09");	//Je pro mě nezbytné abys napsal dopis pro Lariuse.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_10");	//Potřebuji abys pochválil magické schopnosti Gallahada a vůbec, napsal o něm jen to nejlepší.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_13");	//Hmmm... Samozřejmě, že není problém napsat takový dopis.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_14");	//Nuže! Předtím, než ho napíši vyřešíš pro mě jednu záležitost...
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_15");	//Jakou?

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_16");	//No, musíš pochopit... Je to velice specifický byznys...
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_17");	//A?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_18");	//Jak už jsem zmiňoval, mám menší problémy s penězi...
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_19");	//... abych nějak udržel podnikání byl jsem nucen si půjčit menší částku peněz od jisté osoby.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_20");	//Od koho?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_21");	//Od Lehmara a jak si již jistě pochopil, je potřeba vykonat jistou povinnost vůči němu.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_22");	//Takže chceš abych ho zabil?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_23");	//Cože! (ztratí řeč) Ne, to není na pořadu dne!
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_24");	//Mám lepší nápad! Když jsem vzal peníze, nechal jsem si napsat dlužní úpis.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_25");	//A já bych byl rád kdyby se tento kousek papíru, tak nějak... ztratil. Zmizel!
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_26");	//Pokud to tedy dobře chápu, chceš po mně abych ten úpis ukradl?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_27");	//Tišeji, proboha víc potichu! Pro boží rány...

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_28");	//No dá se to tak říct.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_29");	//Hlavní je, že Lehmar nebude moct prokázat, že mu něco dlužím.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_30");	//Jdeme na to. Pokud mi přineseš ten úpis, tak já napíši doporučující dopis pro Gallahada.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_31");	//Souhlasíš s mými podmínkami?
	Info_ClearChoices(dia_lutero_taliasanletter);
	Info_AddChoice(dia_lutero_taliasanletter,"Je mi líto, ale neudělám to.",dia_lutero_taliasanletter_no);
	Info_AddChoice(dia_lutero_taliasanletter,"Ano, bez problému.",dia_lutero_taliasanletter_ok);
};

func void dia_lutero_taliasanletter_no()
{
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_No_01_00");	//Je mi líto, ale neudělám to.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_No_01_01");	//No... To je škoda!
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_No_01_02");	//Jen doufám, že náš rozhovor zůstane mezi námi.
	if(MEMBERTRADEGUILD == FALSE)
	{
		AI_Output(self,other,"DIA_Lutero_TaliasanLetter_No_01_03");	//V opačném případě se postarám o to, abys přišel o jazyk... (hněvá se)
		AI_Output(self,other,"DIA_Lutero_TaliasanLetter_No_01_04");	//A teď vypadni! Nemám pro tebe žádnou práci.
	};
	AI_StopProcessInfos(self);
};

func void dia_lutero_taliasanletter_ok()
{
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_Ok_01_00");	//Ano, bez problému.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_Ok_01_01");	//Skvěle! Vrať se až budeš mít můj úpis.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_Ok_01_02");	//Já mezitím napíšu dopis, který tak zajímá (mumlá) Tebe!
	AI_StopProcessInfos(self);
	MIS_LUTEROHELP = LOG_Running;
	Log_CreateTopic(TOPIC_LUTEROHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LUTEROHELP,LOG_Running);
	B_LogEntry(TOPIC_LUTEROHELP,"Pokud chci doporučující dopis pro Gallahada, tak musím Lehmarovi ukrást dlužní úpis.");
};


instance DIA_LUTERO_BRINGLETTER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_bringletter_condition;
	information = dia_lutero_bringletter_info;
	permanent = FALSE;
	description = "Mám ten úpis.";
};


func int dia_lutero_bringletter_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_LUTEROHELP == LOG_Running) && (Npc_HasItems(other,itwr_luteroloan) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_bringletter_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lutero_BringLetter_01_00");	//Mám ten úpis.
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_01");	//Ukaž mi to...
	B_GiveInvItems(other,self,itwr_luteroloan,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_02");	//ANO! To je ono! (bez sebe radostí)
	Npc_RemoveInvItems(self,itwr_luteroloan,1);
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_03");	//Udělal si ze mě šťastného člověka!
	AI_Output(other,self,"DIA_Lutero_BringLetter_01_04");	//Jsem za tebe šťastný. Co naše dohoda? Kde je můj dopis?
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_05");	//Samozřejmě, samozřejmě! Neměj starosti, již jsem ho napsal.
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_06");	//Tady to máš. Doufám, že budeš spokojený.
	B_GiveInvItems(self,other,itwr_luteroletter,1);
	AI_Output(other,self,"DIA_Lutero_BringLetter_01_07");	//Skvěle! Hlavní je aby byl spokojený Gallahad, ne já...
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_08");	//Nepochybuji, že bude víc, než spokojený.
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_09");	//Tak a teď mě prosím omluv - mám jiné problémy.
	Log_SetTopicStatus(TOPIC_LUTEROHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_LUTEROHELP,"Přinesl jsem Luterovi jeho dlužní úpis a on mi jako odměnu dal doporučující dopis pro Gallahada.");
	MIS_LUTEROHELP = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_LUTERO_NIGELLETTER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_nigelletter_condition;
	information = dia_lutero_nigelletter_info;
	permanent = FALSE;
	description = "Mám pro tebe dopis.";
};


func int dia_lutero_nigelletter_condition()
{
	if((Npc_HasItems(other,itwr_nigelletter) >= 1) || (Npc_HasItems(other,itwr_erolletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_nigelletter_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lutero_NigelLetter_01_00");	//Mám pro tebe dopis.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_01_01");	//Jaký dopis?!
	if(Npc_HasItems(other,itwr_nigelletter) >= 1)
	{
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_02");	//Od obchodníka Nigela... Myslím, že bys ho měl znát.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_03");	//Od Nigela ze starých časů? Ukaž mi ten dopis.
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_04");	//Tady je.
		B_GiveInvItems(other,self,itwr_nigelletter,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_05");	//Hmm... To je velmi zajímavé!
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_06");	//V dopise o tobě píše jako o dobré a věrohodné osobě.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_07");	//A mimo to... mě žádá abych ti pomohl vstoupit do našeho cechu obchodníků.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_08");	//Hmmm... Velice odvážné obrátit se na něj s touto žádostí.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_09");	//Zajímalo by mě, co jsi pro něj udělal, abys ho přinutil napsat takový dopis.
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_10");	//No, jak sám řekl - Zachránil jsem jeho pověst.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_11");	//Hoho! Teď je mi víceméně jasný důvod jeho zdvořilosti.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_12");	//Řeknu to upřímně, chápu ho. Pověst je vskutku pro nás obchodníka jedna z nejdůležitějších věcí!
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_14");	//Samozřejmě! Bez reputace se s vámi nikdo nebude ani bavit!
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_15");	//Eh... dobře! Znamená to, že Nigel za tebe ručí a žádá mě o přijetí tvé osoby do našeho cechu. (zamyšleně)
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_16");	//No... Nevidím žádný důvod, proč bych Nigelovu požadavku nevyšel vstříc.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_17");	//Ale závěrečné rozhodnutí je pouze na tobě.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_18");	//Co myslíš? Chtěl bys zkusit dát se cestou obchodu?
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_19");	//Od obchodníka Erola, myslím, že bys ho měl znát.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_20");	//Od Erola ze starých časů? Ukaž mi ten dopis.
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_21");	//Tady je.
		B_GiveInvItems(other,self,itwr_erolletter,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_22");	//Hmm... To je velmi zajímavé!
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_23");	//V dopise o tobě píše jako o dobré a věrohodné osobě.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_24");	//A mimo to... mě žádá abych ti pomohl vstoupit do našeho cechu obchodníků.
		Npc_RemoveInvItems(self,itwr_erolletter,1);
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_25");	//Hmmm! Velice odvážné obrátit se na něj s touto žádostí.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_26");	//Zajímalo by mě co jsi pro něj udělal, abys ho přinutil napsat takový dopis.
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_27");	//No, jak sám řekl - Zachránil jsem jeho pověst.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_28");	//Hoho! Teď je mi víceméně jasný důvod jeho zdvořilosti.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_29");	//Řeknu to upřímně, chápu ho. Pověst je vskutku pro nás obchodníka jedna z nejdůležitějších věcí!
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_31");	//Samozřejmě! Bez reputace se s vámi nikdo nebude ani bavit!
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_32");	//Eh... dobře! Znamená to, že Erol za tebe ručí a žádá mě o přijetí tvé osoby do našeho cechu. (zamyšleně)
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_33");	//No... Nevidím žádný důvod, proč bych Erolovu požadavku nevyšel vstříc.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_34");	//Ale závěrečné rozhodnutí je pouze na tobě.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_35");	//Co myslíš? Chtěl by ses stát obchodníkem?
	};
	Info_ClearChoices(dia_lutero_nigelletter);
	Info_AddChoice(dia_lutero_nigelletter,"Nemyslím si, že by mě něco takového zajímalo.",dia_lutero_nigelletter_no);
	Info_AddChoice(dia_lutero_nigelletter,"Proč ne?",dia_lutero_nigelletter_yes);
};

func void dia_lutero_nigelletter_no()
{
	AI_Output(other,self,"DIA_Lutero_NigelLetter_No_01_00");	//Nemyslím si, že by mě něco takového zajímalo.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_No_01_01");	//Hmmm... Je to tvoje rozhodnutí.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_No_01_02");	//Myslím si, že děláš obrovskou chybu a odmítáš velkou příležitost.
	Info_ClearChoices(dia_lutero_nigelletter);
};

func void dia_lutero_nigelletter_yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_00");	//Proč ne.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_01");	//Skvěle! Vítej v cechu obchodníků!
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_02");	//Teď jsi jeden z nás, gratuluji.
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_03");	//Díky! Co teď?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_04");	//Teď bychom si měli promluvit o tvých povinnostech v cechu.
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_05");	//Budu mít povinnosti?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_07");	//Snaž se pochopit, že být v cechu neznamená jen být jeden z nás, ale znamená to určitou odpovědnost a povinnosti.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_09");	//Buď klidný! Nebudu chtít nic nadpřirozeného.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_10");	//Jednuduše, čas od času ti dám nějaké pokyny.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_11");	//Právě pro tebe jeden takový mám.
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_12");	//Co mám udělat?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_13");	//Je nezbytné přinést tento nový řád na Bengarovu farmu a přinést poslední várku zboží.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_14");	//Tady - vezmi si tento spis.
	B_GiveInvItems(self,other,itwr_bengarorderletter,1);
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_15");	//Ví o tom Bengar?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_16");	//Ano, je informován a bude na tebe čekat.
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_17");	//Poté co vyzvednu zboží, co s ním mám udělat? Přinést tobě?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_18");	//Ne!... mně ne, já s ním nemám nic společného.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_19");	//Přines to obchodníkovi Jorovi - on se postará o zbytek.
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_20");	//Ten Jora?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_21");	//Ano!... Ten! Najdeš ho na tržišti u východní brány.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_24");	//Poté co svůj úkol splníš, vrať se zamnou a uvidíme co dál.
	Info_ClearChoices(dia_lutero_nigelletter);
	MEMBERTRADEGUILD = TRUE;
	MIS_TRADEGUILD = LOG_Running;
	Log_CreateTopic(TOPIC_TRADEGUILD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_Running);
	B_LogEntry(TOPIC_TRADEGUILD,"Obchodník Lutero mě přijal do cechu.");
	MIS_BENGARORDER = LOG_Running;
	Log_CreateTopic(TOPIC_BENGARORDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BENGARORDER,LOG_Running);
	Log_AddEntry(TOPIC_BENGARORDER,"Lutero mi dal první úkol! Mám zanést nový řád na Bengarovu farmu a zároveň přinést poslední várku zboží, které doručím obchodníku Jorovi pobývajícímu zde v Khorinisu.");
};


instance DIA_LUTERO_BENGARPACKETOPEN(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_bengarpacketopen_condition;
	information = dia_lutero_bengarpacketopen_info;
	permanent = FALSE;
	description = "Mám problém.";
};


func int dia_lutero_bengarpacketopen_condition()
{
	if(BENGARPACKETOPEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_lutero_bengarpacketopen_info()
{
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_00");	//Mám problém.
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_01");	//Co se stalo?
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_02");	//No... Zkráceně - Nemůžu doručit zásilku Jorovi.
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_03");	//Ale proč?
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_04");	//... No, ztratil jsem Bengarovu zásilku.
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_05");	//Jak se ti to proboha povedlo?! Sakra!
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_06");	//Stalo se.
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_07");	//Tohle nemám zapotřebí! Silně jsi mě zklamal!
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_08");	//Je mi to vážně líto...
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_09");	//Nech si své omluvy pro sebe! Můžeš zapomenout na vše co jsem ti slíbil!
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_10");	//Proč? Co tím chceš říct? Už nejsem součástí cechu?
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_11");	//Ano! Lidé jako ty mezi námi nemají místo! Vypadni!
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_12");	//Ale já...
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_13");	//... Běž! A neopovažuj se za mnou ještě někdy přijít!
	AI_StopProcessInfos(self);
	MIS_TRADEGUILD = LOG_FAILED;
	LUTEROPISSOFF = TRUE;
	MEMBERTRADEGUILD = FALSE;
	B_LogEntry_Failed(TOPIC_TRADEGUILD);
};


instance DIA_LUTERO_FUCKOFF(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 10;
	condition = dia_lutero_fuckoff_condition;
	information = dia_lutero_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lutero_fuckoff_condition()
{
	if((LUTEROPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_lutero_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_LUTERO_JORAHELP(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 10;
	condition = dia_lutero_jorahelp_condition;
	information = dia_lutero_jorahelp_info;
	permanent = FALSE;
	description = "Máš pro mě nějaké další úkoly?";
};


func int dia_lutero_jorahelp_condition()
{
	if((MIS_CHURCHDEAL == LOG_SUCCESS) || (MIS_CHURCHDEAL == LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_lutero_jorahelp_info()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_00");	//Máš pro mě nějaké další úkoly?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_01");	//Jora má problémy s jedním obchodníkem.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_02");	//Není z našeho cechu, ale to neznamená, že se tím nebudeme zabývat.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_03");	//Znám Zurise! Je to velice vlivný obchodník. Jaký s ním má Jora problém?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_04");	//Jak můžeš vidět, místo na kterém obchoduje Jora mu vlastně nepatří.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_05");	//Takže?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_06");	//Zuris nedávno odmítl prodloužit smlouvu Jorovi, protože má lepší nabídku od jiného obchodníka.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_07");	//Jorovo místo je velice výhodné a jeho ztráta není v našem zájmu.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_08");	//Proto tě žádám abys vyřešil tento problém nejdříve jak to jen půjde.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_09");	//Ale proč já?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_10");	//Protože Zuris neví že jsi členem našeho cechu. Jinak by tě neposlouchal.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_11");	//Momentálně s námi nemá nejlepší vztahy.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_12");	//Jakto?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_13");	//Měl jsem s ním nějaké menší neshody a od té doby spolu máme problémy.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_14");	//Nicméně, byl bych velice nerad kdyby si Zuris myslel, že je v této záležitosti náš cech příliš aktivní.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_15");	//Mohl by toho zneužít, a to rozhodně není v našem zájmu.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_16");	//Dobře, takže co mám udělat?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_17");	//Nuže... Vlastně ani nevím co bych ti měl poradit.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_18");	//Můžeš se s ním zkusit ze začátku domluvit. Možná se ti podaří ho nějak přesvědčit.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_19");	//(sarkasticky) Chápeš co tím myslím?
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_20");	//Hmm... Myslíš, že to pomůže?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_21");	//Možná! Případně ti to dá představu o celé situaci.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_22");	//Nezapomeň, že to děláš ve svém vlastním zájmu! Takže si to nestěžuj.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_25");	//Dobrá! Něco vymyslím.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_26");	//Skvěle! Pokud něco zajímavého zjistíš, ihned mě informuj. Každopádně, za každých okolností chci zůstat v obraze!
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_28");	//Spoléhám na tebe a doufám, že se vše vyřeší.
	MIS_JORAHELP = LOG_Running;
	Log_CreateTopic(TOPIC_JORAHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORAHELP,LOG_Running);
	B_LogEntry(TOPIC_JORAHELP,"Lutero mi dal zajímavý úkol. Mám pomoct Jorovi zachránit své místo na tržišti. Obchodník s lektvary, Zuris, nechce Jorovi prodloužit nájemní smlouvu, protože našel výnosnější způsob jak s ním naložit. Dostal jsem tedy od Lutera úkol nějakým způsobem tuto zapeklitou situaci vyřešit. Pro začátek si mám se Zurisem pouze promluvit. Lutero mě VAROVAL, že za žádných okolností nesmím zmínit náš cech.");
};


instance DIA_LUTERO_JORAHELPDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 10;
	condition = dia_lutero_jorahelpdo_condition;
	information = dia_lutero_jorahelpdo_info;
	permanent = TRUE;
	description = "Ohledně toho pronájmu...";
};


func int dia_lutero_jorahelpdo_condition()
{
	if(MIS_JORAHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lutero_jorahelpdo_info()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_00");	//Ohledně toho pronájmu...
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_01");	//Ano? Máš nějaké novinky?
	if((ZURISPISSOFF == TRUE) || (ZURISFUCKOFF == TRUE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_02");	//Obávám se, že mám špatné zprávy.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_03");	//COŽE?! Co se stalo?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_04");	//Nedokázal jsem změnit Zurisův názor ohledně pronájmu místa na tržišti.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_05");	//Ale proč?!...
		if(ZURISPISSOFF == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_08");	//Znamená to, že se se mnou Zuris již na to téma nechce vůbec bavit.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_09");	//Sakra! Jak se to mohlo stát?
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_10");	//Pravděpodobně si tam žvatlal nějaké bláboly a Zuris musel reagovat.
		}
		else
		{
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_11");	//Náhodou jsem mu vyzradil, že pracuji pro tebe...
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_12");	//Poté již ode mě nechtěl nic slyšet!
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_13");	//Do háje! Varoval jsem tě abys držel jazyk za zuby.
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_14");	//Snažil jsem se, ale on si to vše nějakým způsobem domyslel.
		};
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_15");	//Ech! Dobrá, teď už s tím nikdo nic nenadělá. Stalo se - není cesty zpět...
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_16");	//Jora si teď musí hledat novou práci a cech díky tobě přišel o lukrativní místo.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_17");	//Je mi to vážně líto!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_18");	//Ha, ha! Na lítost si měl myslet předtím, než sis pustil hubu na špacír!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_19");	//Nebylo nutné posílat tě za Zurisem... Co už se dá dělat.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_20");	//Dobrá, zapomeňme na to! Máme byznys a ten je mnohem důležitější.
		MIS_JORAHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_JORAHELP);

		if(TRADEGUILDREP > 0)
		{
			TRADEGUILDREP = TRADEGUILDREP - 1;
		};
	}
	else if((ZURISTRADEPLACEYES == TRUE) && (ZURISTRADEPLACEMEOK == FALSE) && (ZURISTRADEPLACEYESINFO == FALSE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_21");	//Vyřešil jsem problém, ale nevím jestli se ti to bude líbit.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_22");	//Buď konkrétní!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_23");	//Zuris nebyl v otázce pronájmu příliš ochotný.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_24");	//Mimoto jsem mu náhodou vyzradil, že pracuji pro tebe.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_25");	//Sakra! Varoval jsem tě ať držíš jazyk za zuby!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_26");	//Držel jsem, ale nějak si to celé sám domyslel.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_29");	//Jediná věc co mě v tom momentu napadla byla aby mi Jorovo místo prodal.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_30");	//Prodal?! Jak znám Zurise na takovou transakci by nikdy nepřistoupil!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_31");	//Mýlíš se - je to zvláštní, ale souhlasil.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_32");	//Pravda je, že má docela tvrdé požadavky - chce deset tisíc zlatých!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_33");	//COŽE?! DESET TISÍC?! On se úplně zbláznil!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_34");	//Ty jsi snad s takovými podmínkami souhlasil?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_35");	//Musel jsem - neměl jsem na výběr.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_36");	//Blázen! Takové peníze rozhodně nedám!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_37");	//V každém případě je to jediná možnost jak místo zachránit.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_38");	//Můj bože! Nemám slov - skvělé zprávy! Je to jednoduché, prostě mu těch pár zlatých zaplatíme!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_39");	//Nerozumím, pro cech je tak obtížné tuto sumu zaplatit?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_40");	//Hmmm, jak říkáš. Cech momentálně není ve stavu aby mohl takovou sumu zaplatit.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_45");	//Mimoto, když si spočítám všechny náklady a vezmu v potaz profit, tak nám to místo nestojí za tolik peněz.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_46");	//Hodnota toho místa je přinejlepším maximálně poloviční...
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_47");	//Co teď?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_49");	//To se ptáš mě?! Vůbec netuším!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_51");	//A zbytek příteli, musíš doplatit ty!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_52");	//Nakonec... byly to tvoje geniální vyjednávací schopnosti, které tento obchod dohodly!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_55");	//... nebyl to nikdy jiný, než tvůj jazyk kdo nás do toho zatáhl, takže za to taky musíš být zodpovědný!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_57");	//Přirozeně doufám, že celou tuhle záležitost co nejdříve vyřešíš.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_58");	//Protože pokud to znovu zvoráš, může se stát něco, co by nikdo z nás nechtěl.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_60");	//... Zuris to vytroubí celému městu. Chápeš jak by nás to mohlo ohrozit?!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_62");	//Poškodí to naši reputaci solidních obchodníků, kteří vždy drží své slovo!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_63");	//Lidé nám věří a pro obchodníka je důvěra a pověst nejdůležitější!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_64");	//Myslíš, že nás Zuris schválně poškodil?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_65");	//Jak znám Zurise, tak rozhodně ano! Snaž se tedy tentokrát vše vyřešit bez problémů - tvé místo v cechu na tom závisí!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_66");	//Takže řešení tohoto problému je také ve tvém zájmu!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_67");	//A teď se zvedni a běž to vyřešit, neztrácej zbytečně čas. Je mi jedno kde ty peníze seženeš, prostě je sežeň!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_68");	//A co ty zmíněné peníze od cechu?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_69");	//Ha! Nejprve zvládni svou část a pak si promluvíme o pomoci od cechu.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_70");	//Nuže! Pokusím se udělat vše co bude v mým silách!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_71");	//V to doufám...
		ZURISTRADEPLACEYESINFO = TRUE;
		B_LogEntry(TOPIC_JORAHELP,"Lutero byl extrémně zklamaný, že jsem souhlasil s takovými podmínkami. Zmínil se, že cech je ochoten přispět dvěmi tisíci zlatými. Přesto musím zaplatit zbylých osm.");
	}
	else if((ZURISTRADEPLACEYESCHIP == TRUE) && (ZURISTRADEPLACEMEOK == FALSE) && (ZURISTRADEPLACEYESCHIPINFO == FALSE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_72");	//Vyřešil jsem problém, ale nevím jestli se ti to bude líbit.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_73");	//Buď konkrétní!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_74");	//Zuris nebyl v otázce pronájmu příliš ochotný.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_75");	//Jediná věc co mě napadla byla aby mi Jorovo místo prodal.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_76");	//Prodal?!... Hmmm, zajímavý nápad. Ví Zuris o tom, že jsi součástí cechu?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_77");	//Myslím, že nemá ponětí.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_78");	//Velmi dobře! V tom případě Zuris neví, že pracuješ pro mě.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_79");	//Tím pádem neměl při vyjednávání Zuris žádné pochybnosti.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_80");	//A co je hlavní, tvoje nabídka vypadala přirozeně.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_83");	//Co si tedy Zuris řekl za to místo?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_84");	//Zpočátku trochu váhal, ale nakonec jsme byli schopni se domluvit na rozumných podmínkách.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_85");	//A ty jsou?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_86");	//Přeje si pět tisích zlatých za místo Jory.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_87");	//Pět tisíc?! Hmmm... To je značné množství, ale myslím, že to nebude problém.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_88");	//Co teď?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_89");	//Teď... teď je nutné získat peníze, to je vše.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_90");	//Pro tuto příležitost je cech ochoten obětovat dva a půl tisíce zlatých.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_91");	//To je přesně polovina toho co Zuris požaduje.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_92");	//A co ta druhá polovina?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_93");	//Druhou polovinu musíš sehnat ty.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_104");	//Hmmm a co to zlato slíbené od cechu?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_105");	//Ha! Nejprve zvládni svou část a pak si promluvíme o pomoci od cechu.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_106");	//Nuže! Pokusím se udělat vše co bude v mým silách!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_107");	//V to doufám...
		ZURISTRADEPLACEYESCHIPINFO = TRUE;
		B_LogEntry(TOPIC_JORAHELP,"Lutero byl poměrně šťastný s mou dohodou se Zurisem. Zmínil se, že cech je ochoten obětovat dva a půl tisíce zlatých, zbytek si musím sehnat sám.");
	}
	else if((ZURISISDEAD == TRUE) && (Npc_HasItems(other,itwr_zurisdocs) >= 1))
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_108");	//Vyřešil jsem problém, ale nevím jestli se ti to bude líbit.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_109");	//Buď konkrétní!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_110");	//Nebyl jsem schopen přesvědčit Zurise ke změně názoru ohledně místa pro Joru.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_111");	//Tak jsem podnikl jistou akci k vyřešení problému.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_112");	//Jakou? Co si udělal?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_113");	//Jednoduše jsem ho zabil.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_117");	//U Innose!... Jak tě něco takového proboha napadlo!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_118");	//Musel jsem to udělat - nedal mi jinou možnost!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_119");	//Opravdu to bylo tak nutné!... (třese se mu hlas)
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_121");	//Našel jsem u něj tyto dokumenty. Myslím, že by ses na ně chtěl podívat.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_122");	//Jaké další dokumenty?! (třese se mu hlas)
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_123");	//Tady, podívej se sám.
		B_GiveInvItems(other,self,itwr_zurisdocs,1);
		Npc_RemoveInvItems(self,itwr_zurisdocs,1);
		B_UseFakeScroll();
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_125");	//Tak, co na to říkáš?
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_130");	//Hmmm... asi máš pravdu, ale to tě stále neospravedlňuje z vraždy!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_131");	//Musíš pochopit, že my jsme obchodníci a ne nájemní vrahové!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_132");	//Tvoje chování vrhá na cech špatné světlo!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_133");	//Nezapomínej, že se musíme neustále ukazovat v tom nejlepším možném světle.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_134");	//Chtěl jsem jednoduše pouze vyřešit problém. To je vše!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_135");	//Ale to přeci... ach...
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_137");	//V budoucnosti ale přemýšlej jestli je nutné přistupovat k podobným akcím tímto způsobem!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_138");	//Jinak tvá budoucnost v cechu může být rychle zpečetěna... Je to jasné?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_139");	//No... Pokusím se.
		Log_SetTopicStatus(TOPIC_JORAHELP,LOG_SUCCESS);
		MIS_JORAHELP = LOG_SUCCESS;
		B_LogEntry(TOPIC_JORAHELP,"Lutero byl extrémně naštvaný mou vraždou Zurise. Trochu ho to přešlo, když jsem mu ukázal důležité dokumenty, které měl Zurise u sebe. Nakonec prohlásil, že problém je vyřešen a nemá cenu se v něm dál pitvat. Nicméně upozornil mě, že další podobná akce by mohla mít za následek mé vyloučení z cechu.");
	}
	else if((ZURISGIVEMETASKOK == FALSE) && (ZURISGIVEMETASK == TRUE) && (ZURISGIVEMETASKINFO == FALSE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_143");	//Zuris mi něco pověděl. Pokud bych měl být přesný, tak něco o vašem starém konfliktu.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_144");	//Zdá se, že si ho s něčím podvedl...
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_145");	//S něčím?!... Co to mělo být?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_146");	//Mluvil o nějakém elixíru, který se jmenuje Eligorův plamen.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_147");	//Podle Zurise jste měli smlouvu ohledně ceny tohoto elixíru.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_148");	//Aha! Začínám chápat co máš na mysli.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_149");	//Ale poté si porušil podmínky ke svému vlastnímu prospěchu.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_150");	//A jak jsem to tak celé pochopil, tohle je důvod proč s ním má cech nyní takové problémy.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_151");	//Hmmm... Vidím, že ses mu nepokoušel v čemkoli odporovat...
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_152");	//Byznys byl onehdá trochu o něčem jiném.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_153");	//O čem?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_154");	//Věř mi, nikdy bych se neopovážil měnit podmínky smlouvy.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_155");	//Pro mě je obchodníkova čest nejdůležitější věcí v životě!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_156");	//Jisté okolnosti mě bohužel donutily jednat tak, že to Zurisovi přišlo podezřelé.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_157");	//Hmmm, můžeš to vysvětlit?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_158");	//Věc se má tak, že jsem byl pouze sprostě okraden!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_159");	//Zdá se, že máš se Zurisem podobné verze.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_160");	//On mi ovšem sdělil, že jsi porušil smlouvu zvýšením cen lektvarů!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_161");	//To se plete! Bylo to přesně naopak!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_163");	//... (přeruší) Okradli mě zloději a sebrali mi elixír, který jsem slíbil Zurisovi.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_165");	//A já neměl co bych mu prodal.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_167");	//Zburcoval jsem městské stráže, aby mi pomohly najít ty zloděje.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_168");	//Bohužel jejich hledání nepřineslo žádné výsledky.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_169");	//Tak jsem neměl jinou možnost, než se pokusit najít ten elixír sám.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_170");	//Dokázal jsi to?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_171");	//Zčásti ano! Dokázal jsem zjistit kdo stál za tou krádeží.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_172");	//Nakonec jsem zažádal důvěryhodné přátele aby mi pomohli vrátit ten elixír...
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_173");	//Oni ovšem pochopili jak důležitý pro mě ten elixír je a řekli si cenu, kterou jsem nebyl schopen zaplatit.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_174");	//Jako výsledek mi nezbylo nic jiného, než jít za Zurisem a sdělit mu cenu a podmínky získání elixíru.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_175");	//Snažil jsem se mu to vysvětlit.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_176");	//A jak to všechno dopadlo?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_177");	//To už přece víš!... Zuris nic nepochopil a byl celý bez sebe, že původní dohoda byla porušena...
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_178");	//Vůbec mě již poté nechtěl poslouchat a vykopl mě ze dveří.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_179");	//A jak můžeš vidět, důsledkem toho jsou naše nepříliš dobré vztahy. Lépe řečeno - žádný vztah již neexistuje!
		Info_ClearChoices(dia_lutero_jorahelpdo);
		Info_AddChoice(dia_lutero_jorahelpdo,"Myslím, že by sis měl zkusit se Zurisem znovu promluvit...",dia_lutero_jorahelpdo_yes);
		Info_AddChoice(dia_lutero_jorahelpdo,"Zdá se mi, že je to celé Zurisova vina.",dia_lutero_jorahelpdo_no);
	}
	else if((ZURISGIVEMETASKOK == TRUE) && (ZURISGIVEMETASK == TRUE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_180");	//Zajisté!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_181");	//No tak - nenapínej mě!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_182");	//Dokázal jsem pro Zurise sehnat ten elixír.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_183");	//Jak si to dokázal?!... To je neuvěřitelné!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_185");	//Chlape - nikdy mě nepřestaneš překvapovat!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_187");	//A co Jorovo místo?...
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_188");	//Zuris prodlouží současnou smlouvu a dokonce trochu sníží cenu.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_189");	//Skvělá práce! Věděl jsem, že si s tím dokonale poradíš!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_192");	//Přijmi vděčnost mou, i celého cechu.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_193");	//Přirozeně, že ti ještě za tvou námahu dám malou sumu zlata!
		B_GiveInvItems(self,other,ItMi_Gold,200);
		if(ZURISGIVEMETASKOKBONUS == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_194");	//Díky! Můžu mít ještě jednu malou otázku?
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_195");	//Zajisté!
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_196");	//Zuris mi řekl, že si za ním po našem malém rozhovoru zašel.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_197");	//No... Rozhodl jsem se dát na tvou radu a navštívit ho.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_199");	//Nakonec se ukázalo, že máš pravdu. Abych byl upřímný, nejprve jsem pochyboval, že by mě Zuris poslouchal.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_200");	//Ale vše nakonec dopadlo neuvěřitelně dobře!
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_203");	//Nyní společně vedeme malý podnik, který nám zajistí slušný měsíční příjem.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_208");	//Tady, přijmi ode mě tento prsten. Dostal jsem ho od jednoho potulného obchodníka.
			B_GiveInvItems(self,other,ItRi_Prot_Total_02,1);
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_210");	//Díky. Jsem ti velmi vděčný!
		}
		else
		{
			B_GivePlayerXP(300);
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_212");	//Díky!
		};
		Log_SetTopicStatus(TOPIC_JORAHELP,LOG_SUCCESS);
		MIS_JORAHELP = LOG_SUCCESS;
		B_LogEntry(TOPIC_JORAHELP,"Lutero byl nadšený, že jsem byl schopen vrátit lektvar Zurisovi a tím vyřešit Jorův problém.");
		TRADEGUILDREP = TRADEGUILDREP + 1;
	}
	else if((ZURISTRADEPLACEMEOK == TRUE) && (Npc_HasItems(other,itwr_zurisdocs) >= 1))
	{
		if(ZURISTRADEPLACEYES == TRUE)
		{
			B_GivePlayerXP(250);
		}
		else if(ZURISTRADEPLACEYESCHIP == TRUE)
		{
			B_GivePlayerXP(150);
		};
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_214");	//Ano.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_215");	//No tak - nenapínej mě!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_216");	//Dal jsem Zurisovi požadovanou sumu, na které jsme se dohodli.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_217");	//A on mi dal na oplátku tyto dokumenty potvrzující Jorův nárok na využívání místa na tržišti.
		B_GiveInvItems(other,self,itwr_zurisdocs,1);
		Npc_RemoveInvItems(self,itwr_zurisdocs,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_222");	//No nutno říci, že to vypadá vážně dobře!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_223");	//Zdá se, že pouze do těchto dokumentů stačí vepsat jméno vlastníka a problém lze považovat za uzavřený.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_224");	//Doufám, že již do tohoto obchodu nebudu nucen dávat tak velké investice...
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_225");	//Myslím, že můžeš být spokojený.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_226");	//Dobrá - dost už!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_227");	//Hlavní je, že Jorovo místo nyní náleží cechu a nejsou již žádné problémy.
		Log_SetTopicStatus(TOPIC_JORAHELP,LOG_SUCCESS);
		MIS_JORAHELP = LOG_SUCCESS;
		B_LogEntry(TOPIC_JORAHELP,"Předal jsem Luterovi dokumenty. Považuji tímto tento úkol za hotový.");
		TRADEGUILDREP = TRADEGUILDREP + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_229");	//Ne, zatím nemám nic.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_230");	//To je škoda, už jsem doufal, že...
	};
};

func void dia_lutero_jorahelpdo_yes()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_Yes_01_00");	//Myslím, že by ses měl se Zurisem pokusit znovu promluvit.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_01");	//A co bych mu měl asi tak říct?
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_Yes_01_02");	//Řekni mu jednoduše pravdu! Možná ti to pomůže dosáhnout lepších vztahů.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_03");	//Hmmm... Už mě to napadlo mnohokrát.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_07");	//Myslíš, že to pomůže vyřešit Jorův problém?
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_Yes_01_09");	//Už jsem se Zurisem dohodnutý.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_10");	//Opravdu? To není špatné. Jak jste se domluvili?
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_Yes_01_11");	//Jednoduše - pokud mu donesu ten lektvar, na kterém jste se dohodli...
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_16");	//Hmmm... znamená to, že Zuris si stále přeje získat Eligorův plamen.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_17");	//Dohodli jste se na rozumných podmínkách - o tom není pochyb!
	LUTEROAGREEMEETZURIS = TRUE;
	Info_ClearChoices(dia_lutero_jorahelpdo);
	Info_AddChoice(dia_lutero_jorahelpdo,"Potřebuji nějaké informace o tom lektvaru.",dia_lutero_jorahelpdo_eleksirinfo);
};

func void dia_lutero_jorahelpdo_no()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_No_01_00");	//Zdá se mi, že je to celé Zurisova vina.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_No_01_01");	//Pokud by byl ochoten naslouchat ostatním, nemuselo vše dojít tak daleko.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_02");	//Asi máš pravdu.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_03");	//Hmmm... Nedávno jsem přemýšlel, že bych si s ním mohl znovu promluvit.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_No_01_05");	//Mimoto už jsem se Zurisem dohodnutý.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_06");	//Opravdu? To není špatné. Jak jste se domluvili?
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_No_01_08");	//... tak si rozmyslí celou záležitost ohledně Jory.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_09");	//Hmmm... znamená to, že Zuris si stále přeje získat Eligorův plamen.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_10");	//Dohodli jste se na rozumných podmínkách - o tom není pochyb!
	Info_ClearChoices(dia_lutero_jorahelpdo);
	Info_AddChoice(dia_lutero_jorahelpdo,"Potřebuji nějaké informace o tom lektvaru.",dia_lutero_jorahelpdo_eleksirinfo);
};

func void dia_lutero_jorahelpdo_eleksirinfo()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_00");	//Potřebuji nějaké informace o tom lektvaru.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_03");	//Říkal jsem ti přece, že mě okradli!
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_04");	//Rozhodně si ale podnikl nějaké kroky k získání lektvaru!
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_05");	//Poté co jsem odmítl podmínky navržené bandity, tak se mi...
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_06");	//... stopa elixíru ztratila společně s nimi.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_07");	//Pravda je, že existuje jedna věc, která by ti mohla v této záležitosti pomoci.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_08");	//Která?
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_09");	//Doslechl jsem se, že stráže chytly jednoho zlodějíčka, který prodával podobné věci ve městě.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_10");	//Vypadá to, že ví něco o té krádeži. Bohužel jsem neměl dostatek času zjistit, co ví a co ne.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_12");	//Za pár dnů byl obratem poslán do kolonie.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_14");	//Jak se jmenoval?
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_15");	//Asi Grimes, nejsem si po takové době příliš jistý.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_16");	//Aha... (to jméno mi zní povědomě)
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_18");	//Nemyslím si, že se ti podaří tento problém vyřešit, i když, můžeš to alespoň zkusit.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_24");	//Dobrá tedy - hodně štěstí!
	B_LogEntry(TOPIC_JORAHELP,"Lutero mi dokázal povědět něco málo o osudu ukradeného lektvaru. Zmínil se o malém detailu, který by mi mohl pomoci lektvar najít. Osoba jménem Grimes by o něm mohla něco vědět. Ztratil se mu onehdá z dohledu, když ho hodily stráže do kolonie. Doufám, že u něj se dozvím něco víc o osudu lektvaru Eligorův plamen.");
	ZURISGIVEMETASKINFO = TRUE;
};


instance DIA_LUTERO_JORAHELPGIVEGOLD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_jorahelpgivegold_condition;
	information = dia_lutero_jorahelpgivegold_info;
	permanent = TRUE;
	description = "Ohledně peněz od cechu...";
};


func int dia_lutero_jorahelpgivegold_condition()
{
	if((MIS_JORAHELP == LOG_Running) && (ZURISTRADEPLACEMEOK == FALSE) && (LUTEROJORAHELPGIVEGOLD == FALSE) && ((ZURISTRADEPLACEYESINFO == TRUE) || (ZURISTRADEPLACEYESCHIPINFO == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_jorahelpgivegold_info()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_00");	//Ohledně peněz od cechu.
	AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_01");	//Jakých peněz?
	AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_02");	//Peníze za jednání se Zurisem.
	AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_03");	//Vypadá to, že mluvíš o tom, že by cech měl být připraven vyplatit slíbenou sumu za Jorovo místo.
	AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_04");	//Ano!... Slíbil jsem ti přeci, že si o tom promluvíme až splníš svou část dohody.
	AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_05");	//Máš ty peníze?
	if((ZURISTRADEPLACEYESINFO == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 7500))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_09");	//Tady, dívej - sedm a půl tisíce zlatých - přesně!
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_12");	//Hmmmm... Přesvědčil jsi mě.
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_13");	//Vem si tenhle měšec. Je v něm přesně dva a půl tisíce zlatých.
		B_GiveInvItems(self,other,itse_lutterobigpocket,1);
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_16");	//Neboj se - tvé peníze jsou ve schopných rukou.
		LUTEROJORAHELPGIVEGOLD = TRUE;
	}
	else if((ZURISTRADEPLACEYESCHIPINFO == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 2500))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_20");	//Tady, dívej - dva a půl tisíce zlatých - přesně!
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_23");	//Hmmmm... Přesvědčil jsi mě.
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_24");	//Vem si tenhle měšec. Je v něm přesně tolik, kolik potřebuješ!
		B_GiveInvItems(self,other,itse_lutterobigpocket,1);
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_27");	//V to doufám.
		LUTEROJORAHELPGIVEGOLD = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_28");	//Ještě ne.
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_29");	//Tak proč tady ztrácíš čas!
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_32");	//Až budeš připraven, tak si promluvíme.
	};
};


instance DIA_LUTERO_CHURCHDEAL(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_churchdeal_condition;
	information = dia_lutero_churchdeal_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_churchdeal_condition()
{
	if((MEMBERTRADEGUILD == TRUE) && (JORATAKEPACK == TRUE))
	{
		return TRUE;
	};
};

func void dia_lutero_churchdeal_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_00");	//Dobře, že jsi přišel, čekal jsem na tebe.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_01");	//Předal jsem Jorovi to místo.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_02");	//Ano vím, ne náhodou jsem ten úkol dal zrovna tobě.
	TRADEGUILDREP = TRADEGUILDREP + 1;
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_04");	//Mám pro tebe další úkol.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_10");	//Co je potřeba udělat?
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_11");	//Jedná se pouze o to přinést od mistra Goraxe přichystané víno a přinést mi ho. Já se postarám o zbytek!
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_12");	//Pravdou je, že v tomto úkolu může dojít k malým komplikacím.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_13");	//O co se jedná?!
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_14");	//Nedokázal jsem se s Goraxem dohodnout na přesné ceně vína.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_15");	//Tím pádem to bude na tobě.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_16");	//To znamená, že ji budu muset vyjednat já?
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_17");	//Je to na tobě! Můžeš souhlasit se současnými podmínkami, nebo zkusit vyjednat podmínky lepší.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_18");	//Jaká bude moje odměna za tento obchod?
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_19");	//Tvá odměna závisí na tom jak levně dokážeš víno koupit.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_20");	//Zatím ti dám pět set zlatých. To by mělo na zásilku pohodlně stačit.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_21");	//Nicméně pro cech je výhodnější pokud v cizích kapsách nebudou všechny naše peníze!
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_23");	//Paráda! Potom neztrácej čas a jdi do kláštera za Goraxem.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_24");	//Budu na tebe čekat.
	MIS_CHURCHDEAL = LOG_Running;
	Log_CreateTopic(TOPIC_CHURCHDEAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_Running);
	B_LogEntry(TOPIC_CHURCHDEAL,"Je nezbytné abych okamžitě šel do kláštera vyzvednout zásilku vína od Goraxe. Lutero mě varoval, že se s ním budu muset dohodnout na ceně. Na celý tento obchod mi dal pět set zlatých. Má odměna bude záviset na tom, jakou cenu dokážu vyjednat.");
};


instance DIA_LUTERO_CHURCHDEALDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_churchdealdo_condition;
	information = dia_lutero_churchdealdo_info;
	permanent = FALSE;
	description = "Ohledně obchodu s Goraxem...";
};


func int dia_lutero_churchdealdo_condition()
{
	if((MIS_CHURCHDEAL == LOG_Running) && ((GORAXSNOTRADEMEWINE == TRUE) || (GORAXSTRADEMEWINE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_churchdealdo_info()
{
	var int bonuswineindex;
	AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_00");	//Ohledně obchodu s Goraxem...
	AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_01");	//Co pro mě máš?

	if(GORAXSNOTRADEMEWINE == TRUE)
	{
		AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_02");	//Bohužel, nedokázal jsem se s Goraxem dohodnout na ceně vína.
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_03");	//Jakto?!...
		if(GORAXSNOTENOUGHTGOLD == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_04");	//Lépe řečeno, dohodl jsem se na ceně, ale neměl jsem u sebe dost zlata na obchod.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_05");	//Cože?!... Jak můžeš vyjednat obchod, na který potom nemáš peníze!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_06");	//To snad... ty musíš být úplný idiot!
		}
		else
		{
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_09");	//Nedokázali jsme se dohodnout na ceně.
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_10");	//Cena, kterou nabídl byla krádeží za denního světla!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_11");	//Nevěřím příliš tomu co říkáš...
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_12");	//Znám Goraxe velmi dobře a nikdy by nenasadil takovou cenu, která by ohrozila jeho reputaci férového obchodníka.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_13");	//Pravděpodobně si ho vytočil natolik, že neměl jinou možnost, než tě odmítnout.
		};
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_15");	//Teď, pokud máme stále zájem o víno, musíme zaplatit minimálně dvakrát tolik!
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_16");	//Jinak nás nebude vůbec poslouchat! To vše kvůli tobě!...
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_17");	//Může to dopadnout ještě hůř. Může prodat víno komukoliv jinému!
		if(MIS_JORAHELP == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_20");	//A já s tebou tak počítal! Možná jsem neměl...
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_24");	//Jednoduše se mezi nás nehodíš.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_25");	//Tvé akce přiváději náš cech pouze ke ztrátě.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_26");	//Bude myslím správné, když odmítnu tvou budoucí pomoc!
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_27");	//Co to znamená?
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_28");	//Znamená to, že již nejsi nadále členem cechu!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_29");	//Pro lidi jako ty tu nemáme místo!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_31");	//... (přeruší) Vypadni! Nemáme se již nadále o čem bavit!
			MIS_CHURCHDEAL = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			MIS_TRADEGUILD = LOG_FAILED;
			LUTEROPISSOFF = TRUE;
			MEMBERTRADEGUILD = FALSE;
			B_LogEntry_Failed(TOPIC_TRADEGUILD);
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_33");	//Asi je to moje chyba, přecenil jsem tvé schopnosti.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_34");	//Měl jsem tento úkol zadat raději někomu jinému!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_35");	//Ty ještě nejsi na takovéto úkoly připraven.
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_36");	//Máš pravdu.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_37");	//Dobře! Zapomeňme na to. Půjdu do kláštera osobně a domluvím se s Goraxem.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_39");	//A co se týče tebe! Snaž se mě příliš nepokoušet!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_40");	//Jinak naše spolupráce brzy skončí.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_43");	//Mimochodem, ty peníze co jsem ti na tento obchod dal, kde jsou?
			MIS_CHURCHDEAL = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			if(Npc_HasItems(other,ItMi_Gold) >= 500)
			{
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_44");	//Tady jsou.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_45");	//Tak mi je dej. Nebo sis snad myslel, že ti jen tak zůstanou?
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_46");	//Jak si přeješ, tady jsou.
				B_GiveInvItems(other,self,ItMi_Gold,500);
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_47");	//Alespoň si neztratil peníze, to potěší!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_48");	//Dobrá, pojďme se bavit o něčem jiném.
				if(TRADEGUILDREP > 0)
				{
					TRADEGUILDREP = TRADEGUILDREP - 1;
				};
			}
			else
			{
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_49");	//Už je nemám.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_50");	//Cože?! Jak tomu mám rozumět?
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_52");	//Proboha... To si myslíš, že můžeš jen tak vzít a nechat si cizí zlato?
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_56");	//Od teď se již nemusíš považovat za člena našeho cechu!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_57");	//Pro lidi jako ty tu nemáme místo!
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_60");	//Ale...
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_61");	//... a hlavně nemám žádnou chuť tě nadále poslouchat nebo mít na očích, ty kreténe!
				MIS_TRADEGUILD = LOG_FAILED;
				LUTEROPISSOFF = TRUE;
				MEMBERTRADEGUILD = FALSE;
				B_LogEntry_Failed(TOPIC_TRADEGUILD);
				AI_StopProcessInfos(self);
			};
		};
	};
	if(GORAXSTRADEMEWINE == TRUE)
	{
		AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_63");	//Dohodl jsem se s Goraxem na ceně za víno, které potřebuješ.
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_64");	//Super. To jsou velmi dobré zprávy!
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_65");	//A kde je víno?
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_66");	//Mělo by u tebe být 25 láhví.

		if(Npc_HasItems(other,ItFo_Wine) >= 25)
		{
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_67");	//Tady jsou, všechny do jedné. Hezky v bezpečí.
			B_GiveInvItems(other,self,ItFo_Wine,25);
			Npc_RemoveInvItems(self,ItFo_Wine,25);
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_68");	//Skvělé!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_69");	//Teď vím, že rozumíš tomuto obchodu.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_70");	//Tak a teď mi pověz o detailech vaší transakce.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_71");	//Kolik Gorax chtěl?
			TRADEGUILDREP = TRADEGUILDREP + 1;
			MIS_CHURCHDEAL = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_SUCCESS);
			B_LogEntry(TOPIC_TRADEGUILD,"Dal jsem klášterní víno Luterovi.");

			if(GORAXCURRENTPRICE > 500)
			{
				B_GivePlayerXP(100);
				TRADEGUILDREP = TRADEGUILDREP - 2;
				if(TRADEGUILDREP < 0)
				{
					TRADEGUILDREP = 0;
				};
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_72");	//Bohužel nemám nic z toho, co jsi mi dal.
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_75");	//Vlastně jsem mu dal více, než pět stovek.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_77");	//Velmi jsi mě rozrušil.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_78");	//Myslel jsem si, že jsi schopen usmlouvat cenu za víno.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_79");	//No dobře!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_80");	//Hlavní je, že jsi vyřídil mou objednávku. To ostatní není tak důležité.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_81");	//Nakonec, můžeme to kompenzovat se zákazníky. (zlomyslně)
			}
			else if(GORAXCURRENTPRICE == 500)
			{
				B_GivePlayerXP(100);
				TRADEGUILDREP = TRADEGUILDREP - 2;
				if(TRADEGUILDREP < 0)
				{
					TRADEGUILDREP = 0;
				};
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_84");	//Vlezl jsem se do pěti set.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_87");	//To mě trochu překvapuje.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_88");	//Poslal jsem tě tam, protože jsem si myslel, že jsi lepší.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_91");	//Nakonec, můžeme to kompenzovat se zákazníky. (zlomyslně)
			}
			else if(GORAXCURRENTPRICE > 400)
			{
				B_GivePlayerXP(150);
				TRADEGUILDREP = TRADEGUILDREP - 1;
				if(TRADEGUILDREP < 0)
				{
					TRADEGUILDREP = 0;
				};
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_94");	//Chtěl více než 400 zlatých.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_97");	//To není špatné!... (bez emocí)
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_98");	//I když věřím, že jsi nevydal to nejlepší.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_100");	//Hlavní je, že jsi vyřídil mou objednávku. To ostatní není tak důležité.
			}
			else if(GORAXCURRENTPRICE > 300)
			{
				B_GivePlayerXP(200);
				TRADEGUILDREP = TRADEGUILDREP - 1;
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_101");	//Dal jsem mu více než 300 zlatých.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_102");	//To vážně není špatné.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_103");	//V tobě něco je!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_104");	//Přijmi mou gratulaci.
			}
			else if(GORAXCURRENTPRICE > 200)
			{
				B_GivePlayerXP(200);
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_105");	//Cena byla vyšší než 200 zlatých!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_107");	//Opravdu do toho Gorax šel?!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_110");	//Úžasná práce - to jediné se na to dá říci!
			}
			else if(GORAXCURRENTPRICE > 100)
			{
				TRADEGUILDREP = TRADEGUILDREP + 1;
				B_GivePlayerXP(250);
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_111");	//Chtěl více než 100 zlatých!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_114");	//Nemožné! Nemůžu uvěřit, že Gorax přijal takovéto podmínky!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_116");	//No, překvapil jsi - výborně!
			}
			else if(GORAXCURRENTPRICE > 50)
			{
				TRADEGUILDREP = TRADEGUILDREP + 2;
				B_GivePlayerXP(300);
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_117");	//Dal mi ho za méně než sto zlatých!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_120");	//Cha chá - chudák Gorax!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_121");	//Jednoduše jsi ho oškubal! Kdo by si to pomyslel...
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_122");	//Něco je špatně?
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_124");	//Jen mi to přijde zvláštní. Gorax víno obvykle střeží jako vlk.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_125");	//Hmmm... Velmi jsi mě překvapil - velmi!
			}
			else if(GORAXCURRENTPRICE <= 50)
			{
				TRADEGUILDREP = TRADEGUILDREP + 3;
				B_GivePlayerXP(500);

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Rétorika + 1");
				};

				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_126");	//Dal mi ho za méně než 50 zlatých!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_127");	//Nemožné! Gorax se dal na charitu?!... (udiveně)
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_132");	//Dokázal bys i chudého ubožáka přimět cokoli koupit! 
			};

			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_134");	//A můj podíl?!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_135");	//Tvůj podíl je v tvé kapse.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_136");	//Peníze, které jsi nedal Goraxovi jsou tvé.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_138");	//Ta kupuje víno za nejnižší cenu a prodává dráž, takže ne!
		}
		else
		{
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_144");	//Nic nemám.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_145");	//Co?! Jak to myslíš?
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_150");	//Myslíš, že ti ještě někdy něco svěřím?
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_154");	//Nemáš co dělat v našem cechu!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_155");	//Už tě nechci vidět!
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_158");	//Ale...
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_159");	//Mlč - už ani slovo z té tvé huby zlodějské!
			MIS_CHURCHDEAL = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			MIS_TRADEGUILD = LOG_FAILED;
			LUTEROPISSOFF = TRUE;
			MEMBERTRADEGUILD = FALSE;
			B_LogEntry_Failed(TOPIC_TRADEGUILD);
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_LUTERO_RARETHINGS(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_rarethings_condition;
	information = dia_lutero_rarethings_info;
	permanent = FALSE;
	description = "Další úkol?";
};


func int dia_lutero_rarethings_condition()
{
	if(((MIS_ONARBUSINESS == LOG_SUCCESS) || (MIS_ONARBUSINESS == LOG_FAILED)) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_lutero_rarethings_info()
{
	AI_Output(other,self,"DIA_Lutero_RareThings_01_00");	//Další úkol?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_02");	//Tvoje pomoc by se mi zase celkem hodila.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_04");	//Jeden z mých zámožných zákazníků chce jedny velmi zajímavé věci.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_05");	//Konkrétně jsou tři a jsou velmi cenné. Musím ti říkat, co po tobě chci?
	AI_Output(other,self,"DIA_Lutero_RareThings_01_06");	//A proč já?!
	AI_Output(self,other,"DIA_Lutero_RareThings_01_07");	//Protože jsi jediný, kdo se nebojí toulat se po okolí a nesedí furt na řiti jak někteří!
	AI_Output(self,other,"DIA_Lutero_RareThings_01_10");	//Tak, tak. Ty věci jsou pro našeho klienta velmi důležité.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_11");	//Najít je určitě nebude jednoduché, to mi věř...
	AI_Output(other,self,"DIA_Lutero_RareThings_01_12");	//A co je to za věci?!
	AI_Output(self,other,"DIA_Lutero_RareThings_01_13");	//Mluvíme o třech figurkách Innose vyrobených nejlepšími řemeslníky v Nordmaru - z černého mramoru!
	AI_Output(self,other,"DIA_Lutero_RareThings_01_16");	//Můžu ti povědět, že získat ten materiál je skoro nemožné a něco z něj vyrobit je nemožně obtížné.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_17");	//A ke slovu nemožné přispívají i totožné rozměry všech figurek!
	AI_Output(other,self,"DIA_Lutero_RareThings_01_18");	//A je tvůj kupec schopen dát za ty figurky tolik peněz?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_19");	//Samozřejmě. Jak jsem řekl - potřebuje je.
	AI_Output(other,self,"DIA_Lutero_RareThings_01_20");	//Rozumím. A kde mám začít hledat?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_22");	//Dle toho co vím byly před pár lety poslány zpět za bariéru jako platba za rudu.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_24");	//Nejspíše to byl někdo z rudobaronů, když se rozhodl je požadovat od samého krále.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_29");	//Ale ruda pro záchranu Myrtany je pro krále samozřejmě důležitější!
	AI_Output(self,other,"DIA_Lutero_RareThings_01_30");	//De fakto jen paladinové s rudnými čepelemi můžou skřety zastavit.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_31");	//Proto bez váhání byly přijaty tyto podmínky.
	AI_Output(other,self,"DIA_Lutero_RareThings_01_32");	//Hmmm, jasně. A ty věříš, že ty figurky jsou stále v kolonii?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_33");	//Samozřejmě! Po pádu bariéry by se o ně nikdo nestaral. Všichni prchali.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_35");	//Pamatuj, že jsou tři!
	AI_Output(self,other,"DIA_Lutero_RareThings_01_37");	//Vrať se pouze se všemi, nebo raději s žádnou.
	AI_Output(other,self,"DIA_Lutero_RareThings_01_40");	//Udělám, co bude v mé moci.
	MIS_RARETHINGS = LOG_Running;
	Log_CreateTopic(TOPIC_RARETHINGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RARETHINGS,LOG_Running);
	B_LogEntry(TOPIC_RARETHINGS,"Jeden zámožný obchodník si u Lutera objednal figurky Innose z černého mramoru. Jsou velmi cenné a Lutero říká, že král je vyměnil za dodávku rudy, takže by měly být v kolonii. Až je budu mít všechny tři, mám se vrátit.");
};


instance DIA_LUTERO_RARETHINGSDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_rarethingsdo_condition;
	information = dia_lutero_rarethingsdo_info;
	permanent = FALSE;
	description = "Přinesl jsem ty nordmarské figurky.";
};


func int dia_lutero_rarethingsdo_condition()
{
	if((MIS_RARETHINGS == LOG_Running) && (Npc_HasItems(hero,itmi_innosmramorstatue) >= 3) && (MIS_RESCUEGOMEZ == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lutero_rarethingsdo_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lutero_RareThingsDo_01_00");	//Přinesl jsem ty nordmarské figurky.
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_01");	//Všechny tři? Ukaž... (mysteriózně)
	B_GiveInvItems(other,self,itmi_innosmramorstatue,3);
	Npc_RemoveInvItems(self,itmi_innosmramorstatue,3);
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_03");	//Neskutečné!... Taková nádhera!
	AI_Output(other,self,"DIA_Lutero_RareThingsDo_01_04");	//Jak jsem slíbil - udělám vše, co je v mé moci!
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_07");	//A je jisté, že v podnikání se nebojíš ukázat zuby!
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_10");	//Tady, přijmi menší dárek.
	B_GiveInvItems(self,other,itpo_megapotionskill,1);
	AI_Output(other,self,"DIA_Lutero_RareThingsDo_01_11");	//Elixír? Jaký?!
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_12");	//To se dozvíš. Jen ti řeknu, že na to určitě nezemřeš... (úsměv)
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_13");	//A taky ti dám ještě 1000 zlatých na pokrytí výdajů.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	TRADEGUILDREP = TRADEGUILDREP + 1;
	MIS_RARETHINGS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RARETHINGS,LOG_SUCCESS);
	B_LogEntry(TOPIC_RARETHINGS,"Lutero byl velmi spokojen s mou prací a poděkoval mi zlatem a nějakým zvláštním elixírem.");
};


instance DIA_LUTERO_RARETHINGSFAIL(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_rarethingsfail_condition;
	information = dia_lutero_rarethingsfail_info;
	permanent = FALSE;
	description = "Nedokázal jsem ty figurky najít.";
};


func int dia_lutero_rarethingsfail_condition()
{
	if((MIS_RARETHINGS == LOG_Running) && (MIS_RESCUEGOMEZ == LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_lutero_rarethingsfail_info()
{
	AI_Output(other,self,"DIA_Lutero_RareThingsFail_01_00");	//Nedokázal jsem ty figurky najít.
	AI_Output(self,other,"DIA_Lutero_RareThingsFail_01_01");	//Jsi si jistý?!
	AI_Output(other,self,"DIA_Lutero_RareThingsFail_01_02");	//Absolutně. Nikde nejsou.
	AI_Output(self,other,"DIA_Lutero_RareThingsFail_01_03");	//Když to říkáš, nedá se nic dělat. Je to velká škoda!
	if(TRADEGUILDREP > 0)
	{
		TRADEGUILDREP = TRADEGUILDREP - 1;
	};
	MIS_RARETHINGS = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_RARETHINGS);
};


instance DIA_LUTERO_MISSBRENDI(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_missbrendi_condition;
	information = dia_lutero_missbrendi_info;
	permanent = FALSE;
	description = "Máš nějakou práci?";
};


func int dia_lutero_missbrendi_condition()
{
	if(((MIS_RARETHINGS == LOG_SUCCESS) || (MIS_RARETHINGS == LOG_FAILED)) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_lutero_missbrendi_info()
{
	AI_Output(other,self,"DIA_Lutero_MissBrendi_01_00");	//Máš nějakou práci?
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_01");	//Práce je stále hodně!... Ale teď mě více trápí něco jiného.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_03");	//Poslal jsem jednoho chlapa - jmenuje se Benchel, do hostince 'U Mrtvé harpyje'.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_04");	//Měl by od hospodského Orlana přebrat drahou černou brandy.
	AI_Output(other,self,"DIA_Lutero_MissBrendi_01_07");	//A co to má dělat se mnou?!
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_08");	//To, že jsem od Benchela nedostal žádné zprávy.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_09");	//A nevím, kde je brandy.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_14");	//Bojím se, jestli se Benchelovi nestalo něco špatného...
	AI_Output(other,self,"DIA_Lutero_MissBrendi_01_16");	//A jak ti můžu pomoci?
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_17");	//Co nejdříve najít Benchela a zjistit, co se stalo.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_18");	//A donést černou brandy do zítřejšího poledne!
	BLACKBRENDITIMER = Wld_GetDay();
	MIS_BLACKBRENDI = LOG_Running;
	Log_CreateTopic(TOPIC_BLACKBRENDI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BLACKBRENDI,LOG_Running);
	B_LogEntry(TOPIC_BLACKBRENDI,"Pomocník Lutera jménem Benchel měl donést černou brandy z hostince 'U Mrtvé harpyje'. Protože se ještě neozval a Luterův zákazník neoplývá trpělivostí, vyslal mne, abych zjistil, co je s dodávkou.");
	Wld_InsertNpc(vlk_6130_benchel,"NW_BENCHELBANDITS_01");
	Wld_InsertNpc(bdt_9000_bandit,"NW_BENCHELBANDITS_02");
	Wld_InsertNpc(bdt_9001_bandit,"NW_BENCHELBANDITS_03");
	Wld_InsertNpc(bdt_9002_bandit,"NW_BENCHELBANDITS_04");
	Wld_InsertNpc(bdt_9003_bandit,"NW_BENCHELBANDITS_05");
	Wld_InsertNpc(bdt_9004_bandit,"NW_BENCHELBANDITS_06");
};


instance DIA_LUTERO_MISSBRENDIDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_missbrendido_condition;
	information = dia_lutero_missbrendido_info;
	permanent = TRUE;
	description = "Ohledně Benchela...";
};


func int dia_lutero_missbrendido_condition()
{
	if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELSEE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lutero_missbrendido_info()
{
	var int daynow;
	var int paynow;
	var int solnow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_00");	//Ohledně Benchela...
	AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_01");	//Ano? Něco nového?
	if(Npc_HasItems(hero,itmi_blackbrendi) >= 5)
	{
		paynow = paynow + 1;
		AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_02");	//Pro začátek brandy...
		B_GiveInvItems(other,self,itmi_blackbrendi,5);
		Npc_RemoveInvItems(self,itmi_blackbrendi,5);
		AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_03");	//5 láhví, jak jsi chtěl!
		MIS_BLACKBRENDI = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_BLACKBRENDI,LOG_SUCCESS);
		if((BLACKBRENDITIMER >= daynow) || ((BLACKBRENDITIMER == (daynow - 1)) && Wld_IsTime(0,1,12,0)))
		{
			paynow = paynow + 1;
			TRADEGUILDREP = TRADEGUILDREP + 1;
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_04");	//Nádhera! Kupující tu bude každou chvíli.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_05");	//Jednoduše provedu transakci. Dobrá práce.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_06");	//Díky, a teď Benchel...
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_07");	//Ano? Co je s ním?!
			B_LogEntry(TOPIC_BLACKBRENDI,"Donesl jsem Luterovi jeho černou Brandy.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_08");	//To je dobře, ale až po jeho dodání. (smutně)
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_09");	//Kupující mě již navštívil a bylo to opravdu v nevhodné době.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_11");	//Ale musím mu dát slevu.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_13");	//Ještě něco?
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_14");	//No, co se týče Benchela...
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_15");	//Ano? Kde je?!
			B_LogEntry(TOPIC_BLACKBRENDI,"Donesl jsem Luterovi černou brandy. Pravda, byl zarmoucen, že ji neměl v termínu, ale alespoň něco.");
		};
		if(BENCHELISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_16");	//Je mrtvý.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_19");	//CO?! Ale... co se stalo?!... (nervózně)
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_20");	//Benchel nebyl jen pomocník - byl přítel.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_22");	//Je to škoda.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_24");	//Jak jen budu obchodovat bez jeho pomoci?!
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_25");	//Eh! No, tak se budu muset podívat po někom jiném.
			paynow = paynow + 1;
			Log_AddEntry(TOPIC_BLACKBRENDI,"Sdělil jsem Luterovi, že jeho pomocník je mrtev. Teď bude potřebovat nového.");
		}
		else
		{
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_27");	//Leje do sebe škopky v nejbližší hospodě.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_28");	//CO?!... (naštvaný) Takže ten parchant se vysral na svou práci?!
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_29");	//Jak si mohl myslet, že to asi přijmu?! Málem jsem kvůli němu ztratil zákazníka!... (naštvaný)
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_30");	//Počkej, počkej. Není to jeho vina!
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_32");	//Udělal vše co mohl, ale...
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_33");	//... Když se vracel s brandy, přepadli ho banditi.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_34");	//Jen zázrak zabránil jeho smrti!
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_35");	//Hmmm, opravdu?... To jaksi mění situaci.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_41");	//To není nic špatného.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_42");	//To ano...
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_43");	//Takže si chvíli poleží a pak půjde zase do práce.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_44");	//Bojím se, že se nevrátí.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_46");	//Tak to je. Benchel se rozhodl přestat být poslíčkem.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_48");	//Tak to mě tedy opravdu zaskočilo.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_50");	//To ano, ale Benchel nebyl jen poslíček - byl to i můj pomocník!
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_51");	//Perfektně rozuměl obchodu!
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_58");	//Eh... Potřebuji sehnat někoho jiného.
			Log_AddEntry(TOPIC_BLACKBRENDI,"Řekl jsem Luterovi o Benchelovi. Možná bych se ho měl zeptat, jestli nepotřebuje nového pomocníka.");
			paynow = paynow + 2;
		};
		solnow = 150 * paynow;
		B_GivePlayerXP(solnow);
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_59");	//To nevadí.
		AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_60");	//Velká škoda.
	};
};


instance DIA_LUTERO_TRADEHELPER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_tradehelper_condition;
	information = dia_lutero_tradehelper_info;
	permanent = FALSE;
	description = "Vypadáš zmatený.";
};


func int dia_lutero_tradehelper_condition()
{
	if((MIS_BLACKBRENDI == LOG_SUCCESS) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_lutero_tradehelper_info()
{
	AI_Output(other,self,"DIA_Lutero_TradeHelper_01_00");	//Vypadáš zmatený.
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_01");	//Ano?! Tak pak to bude pravda.
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_03");	//Eh... Hodně důvodů!
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_07");	//Nyní je jen málo lidí, co rozumí obchodu.
	AI_Output(other,self,"DIA_Lutero_TradeHelper_01_09");	//Můžu ti s tím pomoct?
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_10");	//Ty? No tak jo.
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_11");	//Speciálně to musí být dobrý obchodník!
	MIS_TRADEHELPER = LOG_Running;
	Log_CreateTopic(TOPIC_TRADEHELPER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_Running);
	B_LogEntry(TOPIC_TRADEHELPER,"Lutero mě požádal, abych našel někoho, kdo by mu dělal pomocníka místo Benchela. Musí být chytrý, silný a dobrý obchodník.");
};

var int LuteroDealNow;

instance DIA_LUTERO_TRADEHELPERDONE(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_tradehelperdone_condition;
	information = dia_lutero_tradehelperdone_info;
	permanent = FALSE;
	description = "Někoho jsem ti našel.";
};

func int dia_lutero_tradehelperdone_condition()
{
	if((MIS_TRADEHELPER == LOG_Running) && ((FINDPERSONONE == TRUE) || (FINDPERSONTWO == TRUE) || (FINDPERSONTHREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_tradehelperdone_info()
{
	var C_Npc helperlutero;
	AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_00");	//Někoho jsem ti našel.
	AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_01");	//A koho?

	if(FINDPERSONONE == TRUE)
	{
		B_GivePlayerXP(50);
		GAYVERNNOTHIRED = TRUE;

		if(TRADEGUILDREP > 0)
		{
			TRADEGUILDREP = TRADEGUILDREP - 1;
		};

		MIS_TRADEHELPER = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_TRADEHELPER);
		helperlutero = Hlp_GetNpc(vlk_6132_gayvern);
		helperlutero.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_GotoNpc(helperlutero,self);
		AI_TurnToNPC(helperlutero,self);
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_02");	//Jmenuje se Gayvern.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_03");	//Hmmm... A co umí?
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_04");	//A co by měl?!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_05");	//Jak že?!... Pro začátek by měl umět číst a psát!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_06");	//Jak jinak by mohl zapisovat objednávky?!
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_07");	//Neumí ani číst ani psát, ale je silný.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_09");	//Ale kdybych chtěl dělníka z přístavu, řekl bych ti to.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_11");	//Rozumí alespoň obchodu?!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_15");	//A to jsi jako myslíš, že se změní? Jak teď asi bude dělat svou práci?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_16");	//Je to jen dělník ze skladiště a ne obchodník.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_17");	//Takže ho nevezmeš?!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_18");	//Ne! To co jsi mi nabídl je shnilé jablko, ale já chci čerstvé maso.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_19");	//Mám se podívat ještě po někom?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_20");	//Už ne! Raději na to zapomeň.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_21");	//Raději si pomocníka najdu sám.

		if((SARAISDEAD == TRUE) || ((SARAFLEE == FALSE) && (Sarah_Ausgeliefert == FALSE)))
		{
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_57");	//Máš pro mě něco dalšího?
			AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_58");	//Hmm... (přemýšlivě) V blízké době asi ne, můžeš se zatím věnovat svým záležitostem.
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_59");	//OK, jak chceš.
			NEXTQUESTSARAHTOGUILD = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			AI_StopProcessInfos(self);
			B_StartOtherRoutine(vlk_6132_gayvern,"BackToDrink");
		}
		else
		{
			if((NEXTQUESTSARAHTOGUILD == FALSE) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
			{
				if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
				{
					LuteroDealNow = TRUE;

					if(Kapitel >= 4)
					{
						AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_22");	//Nyní si pojďme promluvit o další důležité věci.
						Info_ClearChoices(dia_lutero_tradehelperdone);
						Info_AddChoice(dia_lutero_tradehelperdone,"Dobře, můžem.",dia_lutero_tradehelperdone_gayvernaway);
					}
					else
					{
						AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_59");	//No, jak říkáš.
						AI_StopProcessInfos(self);
						B_StartOtherRoutine(vlk_6132_gayvern,"BackToDrink");
					};
				}
				else
				{
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_57");	//Nechtěl bys něco?
					AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_58");	//(zamyšleně) V blízké budoucnosti - pravděpodobně ne. Můžeš si jít dělat co chceš.
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_59");	//Dobře, tak jdu.
					NEXTQUESTSARAHTOGUILD = TRUE;
					MIS_TRADEGUILD = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
					AI_StopProcessInfos(self);
					B_StartOtherRoutine(vlk_6132_gayvern,"BackToDrink");
				};
			}
			else
			{
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_57");	//Nechtěl bys něco?
				AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_58");	//(zamyšleně) V blízké budoucnosti - pravděpodobně ne. Můžeš si jít dělat co chceš.
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_59");	//Dobře, tak jdu.
				NEXTQUESTSARAHTOGUILD = TRUE;
				MIS_TRADEGUILD = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
				AI_StopProcessInfos(self);
				B_StartOtherRoutine(vlk_6132_gayvern,"BackToDrink");
			};
		};
	}
	else if(FINDPERSONTWO == TRUE)
	{
		B_GivePlayerXP(250);
		MAXIHIRED = TRUE;
		TRADEGUILDREP = TRADEGUILDREP + 1;
		MIS_TRADEHELPER = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_SUCCESS);
		B_LogEntry(TOPIC_TRADEHELPER,"Lutero souhlasil zaměstnat pomocníka, jehož jsem mu navrhl, i když na něj neudělal moc velký dojem.");
		helperlutero = Hlp_GetNpc(vlk_6133_maxi);
		helperlutero.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_GotoNpc(helperlutero,self);
		AI_TurnToNPC(helperlutero,self);
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_23");	//Je to ten pravý - Maxi.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_24");	//Hmm... Dobře, a co umí?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_25");	//No prozačátek, by měl alespoň umět číst a psát?
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_26");	//Trochu ano. Už jednou dělal poslíčka a hodně pochytil.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_27");	//Hmmm... To není špatné.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_28");	//Taky jsem ale říkal, že chci dobrého obchodníka.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_29");	//Tak on rozhodně nevypadá!
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_30");	//Přijmeš ho?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_31");	//Hmmm... No dobře, jen doufám, že to bylo dobré rozhodnutí.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_34");	//Tady, vem si to jako odměnu.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_35");	//Za tvůj čas.
		B_GiveInvItems(self,other,ItMi_Gold,500);

		if((SARAISDEAD == TRUE) || ((SARAFLEE == FALSE) && (Sarah_Ausgeliefert == FALSE)))
		{
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_60");	//Máš pro mě něco dalšího?
			AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_61");	//Hmm... (přemýšlivě) V blízké době asi ne, můžeš se zatím věnovat svým záležitostem.
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_62");	//OK, jak chceš.
			NEXTQUESTSARAHTOGUILD = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			AI_StopProcessInfos(self);
			B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
		}
		else
		{
			if((NEXTQUESTSARAHTOGUILD == FALSE) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
			{
				if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
				{
					LuteroDealNow = TRUE;

					if(Kapitel >= 4)
					{
						AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_37");	//Nyní si pojďme promluvit o další důležité věci. Je to naléhavé.
						Info_ClearChoices(dia_lutero_tradehelperdone);
						Info_AddChoice(dia_lutero_tradehelperdone,"Dobře, můžem.",dia_lutero_tradehelperdone_maxiaway);
					}
					else
					{
						AI_StopProcessInfos(self);
						B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
					};
				}
				else
				{
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_60");	//Nechtěl bys něco?
					AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_61");	//(zamyšleně) V blízké budoucnosti - pravděpodobně ne. Můžeš si jít dělat co chceš.
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_62");	//Dobře, tak jdu.
					NEXTQUESTSARAHTOGUILD = TRUE;
					MIS_TRADEGUILD = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
					AI_StopProcessInfos(self);
					B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
				};
			}
			else
			{
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_60");	//Nechtěl bys něco?
				AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_61");	//(zamyšleně) V blízké budoucnosti - pravděpodobně ne. Můžeš si jít dělat co chceš.
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_62");	//Dobře, tak jdu.
				NEXTQUESTSARAHTOGUILD = TRUE;
				MIS_TRADEGUILD = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
				AI_StopProcessInfos(self);
				B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
			};
		};
	}
	else if(FINDPERSONTHREE == TRUE)
	{
		B_GivePlayerXP(500);
		VALERANHIRED = TRUE;
		TRADEGUILDREP = TRADEGUILDREP + 2;
		MIS_TRADEHELPER = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_SUCCESS);
		B_LogEntry(TOPIC_TRADEHELPER,"Lutero Valerana rád přijal.");
		helperlutero = Hlp_GetNpc(vlk_6134_valeran);
		helperlutero.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_GotoNpc(helperlutero,self);
		AI_TurnToNPC(helperlutero,self);
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_38");	//Jmenuje se Valeran.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_39");	//Valeran?! Hmmm... (zamyšleně) počkat!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_40");	//Není to ten Valeran co pracoval u Fernanda?!... (udiveně)
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_41");	//Přesně on. Fernando je v base a Valeran hledá práci.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_42");	//Zaujalo ho, že by mohl být u tebe a já jsem myslel, že tebe to zaujme taky.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_43");	//To máš pravdu!... To máš sakra pravdu.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_44");	//Znám Valerana. Je chytrý a rozumí obchodu.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_45");	//A vždy snil o tom, že by mohl dělat mého pomocníka!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_46");	//Myslím, že bude dobrý.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_49");	//Takže ho bereš?!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_50");	//Jasně! Chci ho na to místo!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_51");	//Splnil jsi co jsi slíbil!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_52");	//Tady, vem si tyto peníze jako odměnu.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_53");	//Je to kompenzace za tvůj čas!
		B_GiveInvItems(self,other,ItMi_Gold,1000);

		if((SARAISDEAD == TRUE) || ((SARAFLEE == FALSE) && (Sarah_Ausgeliefert == FALSE)))
		{
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_63");	//Máš pro mě něco dalšího?
			AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_64");	//Hmm... (přemýšlivě) V blízké době asi ne, můžeš se zatím věnovat svým záležitostem.
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_65");	//OK, jak chceš.
			NEXTQUESTSARAHTOGUILD = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			AI_StopProcessInfos(self);
			B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
		}
		else
		{
			if((NEXTQUESTSARAHTOGUILD == FALSE) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
			{
				if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
				{
					LuteroDealNow = TRUE;

					if(Kapitel >= 4)
					{
						AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_56");	//A právě včas, potřebuji si s tebou promluvit ohledně jedné obchodně důležité záležitosti.
						Info_ClearChoices(dia_lutero_tradehelperdone);
						Info_AddChoice(dia_lutero_tradehelperdone,"OK, jak chceš.",dia_lutero_tradehelperdone_valeranaway);
					}
					else
					{
						AI_StopProcessInfos(self);
						B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
					};
				}
				else
				{
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_63");	//Máš pro mě něco dalšího?
					AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_64");	//Hmm... (přemýšlivě) V blízké době asi ne, můžeš se zatím věnovat svým záležitostem.
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_65");	//OK, jak chceš.
					NEXTQUESTSARAHTOGUILD = TRUE;
					MIS_TRADEGUILD = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
					AI_StopProcessInfos(self);
					B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
				};
			}
			else
			{
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_63");	//Máš pro mě něco dalšího?
				AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_64");	//Hmm... (přemýšlivě) V blízké době asi ne, můžeš se zatím věnovat svým záležitostem.
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_65");	//OK, jak chceš.
				NEXTQUESTSARAHTOGUILD = TRUE;
				MIS_TRADEGUILD = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
				AI_StopProcessInfos(self);
				B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
			};
		};
	};
};

func void dia_lutero_tradehelperdone_gayvernaway()
{
	AI_Output(other,self,"DIA_Lutero_TradeHelperDone_GayvernAway_01_01");	//Ok, promluvme si.
	B_StartOtherRoutine(vlk_6132_gayvern,"BackToDrink");
};

func void dia_lutero_tradehelperdone_maxiaway()
{
	AI_Output(other,self,"DIA_Lutero_TradeHelperDone_MaxiAway_01_01");	//Ok, promluvme si.
	B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
};

func void dia_lutero_tradehelperdone_valeranaway()
{
	AI_Output(other,self,"DIA_Lutero_TradeHelperDone_ValeranAway_01_01");	//OK, jak chceš.
	B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
};

instance DIA_LUTERO_SARAHTOGUILD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_sarahtoguild_condition;
	information = dia_lutero_sarahtoguild_info;
	permanent = FALSE;
	description = "O co jde?";
};

func int dia_lutero_sarahtoguild_condition()
{
	if((NEXTQUESTSARAHTOGUILD == FALSE) && (Kapitel >= 4) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
	{
		if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
		{
			if(LuteroDealNow == TRUE) 
			{
				return TRUE;
			};
		};
	};
};

func void dia_lutero_sarahtoguild_info()
{
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_00");	//O co jde?
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_01");	//Záležitost je přílíš důvěrná a vyžaduje preciznost!
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_02");	//Řekl bych, přímo speciální takt!
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_03");	//O co jde?
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_04");	//Znáš Sarah?
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_05");	//Ano, znám.
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_06");	//To je dobře, něco ti povím.

	if(Sarah_Ausgeliefert == TRUE)
	{
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_07");	//Zlé jazyky by mohly říci, že je to tvá chyba.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_08");	//A co se stalo?!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_09");	//Někdo ji obvinil, že Onarovi prodávala zbraně! (úsměv)
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_10");	//Dobře znám Sarah a vím, že by to neudělala.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_13");	//Domobrana ji dala do cely - ne zrovna nejlepší místo pro mladou ženu.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_14");	//A proto jí chci pomoci.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_15");	//A co proto mám udělat?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_16");	//Pro začátek je nutné obnovit její pověst, aby mohla pokračovat svou kariéru.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_17");	//Chci jí totiž nabídnout místo v cechu!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_18");	//Sarah má obchodní talent a měla by ho využít.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_19");	//To jsou od tebe zajímavá slova!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_20");	//Chápeš to celkem dobře, ale ne úplně.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_21");	//Opravdu jí chci pomoci, ale musím z toho mít prospěch.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_23");	//Jsi osoba, která by mohla poskytnout finance.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_24");	//Ale proč já?!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_25");	//Protože když u mě bude pracovat, neměl bych jí teď věnovat tak velkou pozornost.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_28");	//A s čím mám začít?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_29");	//Začni tím, že ji dostaneš z basy.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_33");	//V dnešní době smí každý zločinec zaplatit pokutu.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_34");	//A tak by ses s Andrem dohodl!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_37");	//Ale Sarah není bohatá a svoboda je drahá!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_38");	//Pro nás je to ale nic.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_39");	//Přeslechl jsem se? Pro nás?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_40");	//Jako člena cechu je to i tvá věc.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_42");	//Zde je můj příspěvek k akci - 500 zlatých. Zbytek je na tobě!
		B_GiveInvItems(self,other,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_43");	//Myslím, že Andre bude žádat dost velkou pokutu za tu trhovkyni.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_47");	//Až bude Sarah venku, promluv s ní.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_48");	//Snaž se ji přesvědčit, že práce v našem cechu je v její situaci to nejlepší, co ji může potkat.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_52");	//Tak mazej, chci od tebe čerstvé zprávy.
		SARAHELPYOUANDFREE = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lutero chce pomoci jedné dívce jménem Sarah. Nedávno jí mojí vinou poslali do vězení a já jí mám u Andreho koupit svobodu a přesvědčit ji k práci v cechu.");
	}
	else if(SARAFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_55");	//Co je s ní?!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_56");	//Slyšel jsem, že jí Canthar vyhrožuje trestem, jestli mu nedá zpět jeho místo na tržišti.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_57");	//Chudák holka se teď bojí jít do obchodu!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_58");	//Znám Canthara, je to opravdu parchant!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_59");	//Ale je velmi vlivný ve městě!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_60");	//Proto se Sarah tak bojí!

		if(Npc_IsDead(Canthar) == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_61");	//Již není mezi námi. Někdo ho zabil.
			AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_62");	//Ano?! Dobře mu tak!
			AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_63");	//Nicméně to nic nemění. Ve městě je hodně nebezpečné verbeže.
		};

		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_65");	//Rozhodl jsem se Sarah pomoci.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_66");	//Jak?!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_67");	//Chci ji nabídnout práci v cechu, aby byla chráněna proti hajzlům, jako je Canthar!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_69");	//Kromě toho bych těžil nejen ze Sařina talentu...
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_70");	//Tvá slova zní nějak zvláštně!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_72");	//Opravdu jí chci pomoci, ale nesmí to vypadat, jako že ji podporuji já.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_80");	//Najdi Sarah a promluv s ní.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_81");	//Snaž se ji přesvědčit, že práce v našem cechu je to nejlepší, co ji zde může potkat.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_85");	//Čekám na dobré zprávy.
		SARAHELPYOU = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lutero chce pomoci jedné dívce - Sarah. Poslední dobou ji obtěžuje čím dál více lidí a on jí chce nabídnout práci v cechu, aby tomu mohl zabránit. Samozřejmě v tom ale bude i něco jiného...");
	};
};

instance DIA_LUTERO_SARAHTOGUILD_EX(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_sarahtoguild_EX_condition;
	information = dia_lutero_sarahtoguild_EX_info;
	permanent = FALSE;
	description = "Máš pro mě nějakou práci?";
};

func int dia_lutero_sarahtoguild_EX_condition()
{
	if((NEXTQUESTSARAHTOGUILD == FALSE) && (Kapitel >= 4) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
	{
		if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
		{
			if(LuteroDealNow == FALSE) 
			{
				return TRUE;
			};
		};
	};
};

func void dia_lutero_sarahtoguild_EX_info()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_00");	//Dobře, že jsi tady! Čekal jsem na tebe.
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_01");	//Záležitost je přílíš důvěrná a vyžaduje preciznost!
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_02");	//Dokonce bych řekl - speciální takt.
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_03");	//Co se stalo?
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_04");	//Setkal ses na tržišti s obchodnicí jménem Sarah?
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_05");	//Ano, setkal.
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_06");	//To je dobře. Povím ti nedávnou, velmi ošklivou věc.

	if(Sarah_Ausgeliefert == TRUE)
	{
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_07");	//Zlé jazyky by mohly říci, že je to tvá chyba.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_08");	//A co se stalo?!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_09");	//Někdo ji obvinil, že Onarovi prodávala zbraně! (úsměv)
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_10");	//Dobře znám Sarah a vím, že by to neudělala.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_13");	//Domobrana ji dala do cely - ne zrovna nejlepší místo pro mladou ženu.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_14");	//A proto jí chci pomoci.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_15");	//A co pro to mám udělat?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_16");	//Pro začátek je nutné obnovit její pověst, aby mohla pokračovat svou kariéru.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_17");	//Chci jí totiž nabídnout místo v cechu!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_18");	//Sarah má obchodní talent a měla by ho využít.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_19");	//To jsou od tebe zajímavá slova!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_20");	//Chápeš to celkem dobře, ale ne úplně.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_21");	//Opravdu jí chci pomoci, ale musím z toho mít prospěch.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_23");	//Jsi osoba, která by mohla poskytnout finance.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_24");	//Ale proč já?!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_25");	//Protože když u mě bude pracovat, neměl bych jí teď věnovat tak velkou pozornost.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_28");	//A s čím mám začít?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_29");	//Začni tím, že ji dostaneš z basy.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_33");	//V dnešní době smí každý zločinec zaplatit pokutu.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_34");	//A tak by ses s Andrem dohodl!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_37");	//Ale Sarah není bohatá a svoboda je drahá!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_38");	//Pro nás je to ale nic.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_39");	//Přeslechl jsem se? Pro nás?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_40");	//Jako člena cechu je to i tvá věc.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_42");	//Zde je můj příspěvek k akci - 500 zlatých. Zbytek je na tobě!
		B_GiveInvItems(self,other,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_43");	//Myslím, že Andre bude žádat dost velkou pokutu za tu trhovkyni.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_47");	//Až bude Sarah venku, promluv s ní.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_48");	//Snaž se ji přesvědčit, že práce v našem cechu je v její situaci to nejlepší, co ji může potkat.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_52");	//Tak mazej, chci od tebe čerstvé zprávy.
		SARAHELPYOUANDFREE = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lutero chce pomoci jedné dívce jménem Sarah. Nedávno ji mojí vinou poslali do vězení a já jí mám u Andreho koupit svobodu a přesvědčit ji k práci v cechu.");
	}
	else if(SARAFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_55");	//Co je s ní?!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_56");	//Slyšel jsem, že jí Canthar vyhrožuje trestem, jestli mu nedá zpět jeho místo na tržišti.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_57");	//Chudák holka se teď bojí jít do obchodu!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_58");	//Znám Canthara, je to opravdu parchant!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_59");	//Ale je velmi vlivný ve městě!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_60");	//Proto se Sarah tak bojí!

		if(Npc_IsDead(Canthar) == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_61");	//Již není mezi námi. Někdo ho zabil.
			AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_62");	//Ano?! Dobře mu tak!
			AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_63");	//Nicméně to nic nemění. Ve městě je hodně nebezpečné verbeže.
		};

		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_65");	//Rozhodl jsem se Sarah pomoci.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_66");	//Jak?!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_67");	//Chci ji nabídnout práci v cechu, aby byla chráněna proti hajzlům, jako je Canthar!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_69");	//Kromě toho bych těžil nejen ze Sařina talentu...
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_70");	//Tvá slova zní nějak zvláštně!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_72");	//Opravdu jí chci pomoci, ale nesmí to vypadat, jakože jí podporuji já.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_80");	//Najdi Sarah a promluv s ní.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_81");	//Snaž se ji přesvědčit, že práce v našem cechu je to nejlepší, co ji zde může potkat.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_85");	//Čekám na dobré zprávy.
		SARAHELPYOU = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lutero chce pomoci jedné dívce - Sarah. Poslední dobou ji obtěžuje čím dál více lidí a on jí chce nabídnout práci v cechu, aby tomu mohl zabránit. Samozřejmě v tom ale bude i něco jiného...");
	};
};

instance DIA_LUTERO_SARAHTOGUILDDONE(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_sarahtoguilddone_condition;
	information = dia_lutero_sarahtoguilddone_info;
	permanent = FALSE;
	description = "Mluvil jsem se Sarah.";
};

func int dia_lutero_sarahtoguilddone_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && ((SARAPISSOFF == TRUE) || (SARAREFUSEHELPS == TRUE) || (SARAAGREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_sarahtoguilddone_info()
{
	AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_00");	//Mluvil jsem se Sarah.
	AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_01");	//A co řekla?!

	if((SARAPISSOFF == TRUE) || (SARAREFUSEHELPS == TRUE))
	{
		if(TRADEGUILDREP > 0)
		{
			TRADEGUILDREP = TRADEGUILDREP - 1;
		};
		NEXTQUESTSARAHTOGUILD = TRUE;
		MIS_SARAHTOGUILD = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_SARAHTOGUILD);
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_02");	//Byla úplně mimo a vyjela na mě, když jsem s ní mluvil!
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_03");	//To je zajímavé, proč tak ostře reagovala?!
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_04");	//Myslí si, že jsem vinen jejím neštěstím.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_05");	//Tak teď je to jasné.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_06");	//Ten pocit znám!
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_07");	//No, trochu má pravdu.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_08");	//Není divu, že s tebou nemluvila.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_09");	//Řekl jsem ti, že to chce speciální postup!
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_11");	//Udělal jsem vše, co jsem mohl.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_12");	//Eh, to nedává smysl.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_14");	//Až bude čas a Sarah se uklidní, zajdu za ní.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_15");	//A ty nebuď tak horkokrevný!
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_16");	//Jak říkáš.

		if(TRADEGUILDREP >= 9)
		{
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_25");	//Přijmi tento dárek, jako odškodnění.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_26");	//Doufám, že tě potěší, alespoň něco za všechny trable ohledně této záležitosti!
			B_GiveInvItems(self,other,itri_pilligrimring,1);
			AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_27");	//Díky!
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_28");	//To nestojí za děkování.
			TRADEGUILDISOVERMASTER = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_30");	//Tady, vem si tyhle peníze.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_31");	//Doufám, že tě potěší, alespoň něco za všechny trable ohledně této záležitosti!
			TRADEGUILDISOVER = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
		};
	}
	else if(SARAAGREE == TRUE)
	{
		B_GivePlayerXP(500);
		TRADEGUILDREP = TRADEGUILDREP + 1;
		NEXTQUESTSARAHTOGUILD = TRUE;
		SARAHELPYOUDONE = TRUE;
		MIS_SARAHTOGUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_SUCCESS);
		Npc_ExchangeRoutine(VLK_470_Sarah,"Trade");
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lutero byl šťastný, když zjistil, že jsem se dohodl se Sarah...");
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_17");	//Souhlasila s tvojí nabídkou.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_18");	//Super! To rád slyším!
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_19");	//Nyní už snad bude vše dobré.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_20");	//Přijmi tento dárek, jako odškodnění.

		if(TRADEGUILDREP >= 9)
		{
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_25");	//Tady, vem si tyhle peníze.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_26");	//Doufám, že tě potěší, alespoň něco za všechny trable ohledně této záležitosti!
			B_GiveInvItems(self,other,itri_pilligrimring,1);
			TRADEGUILDISOVERMASTER = TRUE;
			if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR))
			{
				AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_34");	//Pro váženého mága, tu mám speciální odměnu.
				B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_35");	//Pro statečného vojáka, tu mám speciální odměnu.
				B_GiveInvItems(self,other,ItPo_Perm_STR,1);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_30");	//Tady, vem si tyhle peníze.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_31");	//Doufám, že tě potěší, alespoň něco za všechny trable ohledně této záležitosti!
			TRADEGUILDISOVER = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
		};
	};
};


instance DIA_LUTERO_PALADINFOOD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_paladinfood_condition;
	information = dia_lutero_paladinfood_info;
	permanent = FALSE;
	description = "Další práce?";
};


func int dia_lutero_paladinfood_condition()
{
	if((MIS_JORAHELP == LOG_FAILED) || (MIS_JORAHELP == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lutero_paladinfood_info()
{
	AI_Output(other,self,"DIA_Lutero_PaladinFood_01_00");	//Další práce?
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_02");	//Paladinové si přejí uzavřít s cechem smlouvu o dodávkách potravin a pitné vody.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_03");	//To je velmi dobrá nabídka a nesmíme ji zmeškat!
	AI_Output(other,self,"DIA_Lutero_PaladinFood_01_04");	//Ale co město a přilehlé farmy?!
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_05");	//Ty nemohou vyrovnat jejich požadavky a Onar odmítá obchod s městem.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_06");	//A pak, všichni chtějí prospěch, dokonce i královští paladinové.
	AI_Output(other,self,"DIA_Lutero_PaladinFood_01_07");	//A co chceš ode mne?
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_08");	//Už jsem s lordem Hagenem na toto téma mluvil.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_09");	//Nicméně až do teď nevíme přesný objem těchto dodávek.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_11");	//Proto jdi za Hagenem a prober to s ním do detailů.

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lutero_PaladinFood_01_12");	//Je ale možné, že s žoldákem se bavit nebude.
		AI_Output(self,other,"DIA_Lutero_PaladinFood_01_13");	//Ale myslím, že ti bude naslouchat i tak.
	};
	AI_Output(other,self,"DIA_Lutero_PaladinFood_01_16");	//Co přesně mám říci lordu Hagenovi?
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_17");	//Přesné množství zásob, které paladinové vyžadují.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_18");	//A nejlépe písemně!
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_26");	//Bezva, takže jdi k paladinům a neudělej žádnou pitomost!
	MIS_PALADINFOOD = LOG_Running;
	Log_CreateTopic(TOPIC_PALADINFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PALADINFOOD,LOG_Running);
	B_LogEntry(TOPIC_PALADINFOOD,"Lutero mě poslal za Hagenem prodiskutovat seznam potravin, které paladinové vyžadují.");
};


instance DIA_LUTERO_PALADINFOODDONE(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_paladinfooddone_condition;
	information = dia_lutero_paladinfooddone_info;
	permanent = FALSE;
	description = "Mluvil jsem s Hagenem.";
};


func int dia_lutero_paladinfooddone_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && (Npc_HasItems(hero,itwr_hagencontent) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_paladinfooddone_info()
{
	B_GivePlayerXP(300);
	TRADEGUILDREP = TRADEGUILDREP + 1;
	MIS_PALADINFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PALADINFOOD,LOG_SUCCESS);
	Log_AddEntry(TOPIC_PALADINFOOD,"Dostal jsem seznam Lutera.");
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_00");	//Mluvil jsem s Hagenem.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_01");	//A co jsi zjistil?
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_02");	//Dal mi papír se vším, co potřebují.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_03");	//Ukaž, nech mě se podívat.
	B_GiveInvItems(other,self,itwr_hagencontent,1);
	B_UseFakeScroll();
	Npc_RemoveInvItems(self,itwr_hagencontent,1);
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_05");	//Hmmm... Lord toho chce nějak moc.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_07");	//Náš cech prostě nemá tolik potravin!
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_08");	//Můžeme poskytnout maximálně půlku toho co chce.
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_09");	//Tak pak to asi musím říci Hagenovi.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_10");	//NE! Jestli by se to dozvěděl, mohl by odmítnout obchod!
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_12");	//Je třeba vymyslet něco jiného... (zamyšleně)
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_15");	//Bojím se, že tak velké zásoby může mít jen jeden člověk...
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_16");	//Máš na mysli Onara?!
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_17");	//Ano, toho.
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_18");	//Ale on by paladinům nikdy jídlo neprodal!
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_20");	//Onar je obchodník a každý obchodník miluje zvuk zlata.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_21");	//Měli bychom to zkusit.
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_22");	//A co mu mám říct? Že pěkně prosím?!
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_23");	//Jistě, je to riziko, ale musíme ho podstoupit.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_25");	//Ne já, ale ty! (zlomyslně) Myslím, že ty dopadneš lépe než já.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_31");	//Takže jdi na jeho farmu a pokus se ho přesvědčit k obchodu.
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_32");	//Dobře, ale nic neslibuji!
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_34");	//Ale pokud se ti to povede, má vděčnost nebude znát hranice.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_36");	//A teď jdi, nesmíme ztrácet čas.
	MIS_ONARBUSINESS = LOG_Running;
	Log_CreateTopic(TOPIC_ONARBUSINESS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ONARBUSINESS,LOG_Running);
	B_LogEntry(TOPIC_ONARBUSINESS,"Objednávku lorda Hagena Lutero prostě nemohl splnit. Musel hledat někde jinde, takže se rozhodl zkusit obchodovat s Onarem. Přesněji řečeno se rozhodl mě tam poslat a doufá, že se mi povede našeho křečka přesvědčit k obchodu.");
};


instance DIA_LUTERO_ONARBUSINESS(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_onarbusiness_condition;
	information = dia_lutero_onarbusiness_info;
	permanent = TRUE;
	description = "O tom tvém nápadu...";
};


func int dia_lutero_onarbusiness_condition()
{
	if((MIS_ONARBUSINESS == LOG_Running) && ((ONARAGREED == TRUE) || (ONARNOTAGREED == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_onarbusiness_info()
{
	AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_00");	//O tom tvém nápadu...
	AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_01");	//Něco nového?
	if(ONARAGREED == TRUE)
	{
		B_GivePlayerXP(300);
		TRADEGUILDREP = TRADEGUILDREP + 1;
		MIS_ONARBUSINESS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_ONARBUSINESS,LOG_SUCCESS);
		B_LogEntry(TOPIC_ONARBUSINESS,"Řekl jsem Luterovi, že jsem se s Onarem dokázal dohodnout.");
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_02");	//Dohodl jsem se s Onarem!
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_03");	//Souhlasil s prodejem trochy svých zásob cechu.
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_04");	//I když poznamenal, že to nebude levné!
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_05");	//To je super! Nemyslel jsem si, že přesvědčíš to staré prase, aby nás pustilo ke korytu.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_11");	//Ale jen díky tobě.
		B_GiveInvItems(self,other,itwr_elementarearcanei,1);
	}
	else if(ONARNOTAGREED == TRUE)
	{
		B_GivePlayerXP(250);
		MIS_ONARBUSINESS = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_ONARBUSINESS);
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_23");	//Bohužel, nedohodl jsem se s Onarem.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_24");	//Ale já myslel... A co... Co ti řekl?
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_25");	//To prase mě ani nepustilo do dveří.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_26");	//To je mu podobné...
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_27");	//No dobře, s tím nic neuděláme.
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_28");	//A co teď?
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_29");	//Nyní bych někde měl splašit zásoby pro paladiny.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_34");	//Nedokázal jsi splnit tento úkol... (smutně)
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_35");	//... Ale nechci tě propustit s prázdnýma rukama.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_43");	//Tady, vezmi toto zlato.
		B_GiveInvItems(self,other,ItMi_Gold,300);
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_44");	//Myslím, že to splatí něco z problémů, vzniklých z práce pro náš cech.
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_47");	//Zatím nic.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_48");	//Tak neztrácej můj čas.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_49");	//Jdi a promluv s Onarem!
		AI_StopProcessInfos(self);
	};
};

instance DIA_LUTERO_MASTERRING(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 1;
	condition = dia_lutero_masterring_condition;
	information = dia_lutero_masterring_info;
	permanent = FALSE;
	description = "Co ten prsten, co jsi mi dal?";
};

func int dia_lutero_masterring_condition()
{
	if((TRADEGUILDISOVERMASTER == TRUE) && (Npc_HasItems(hero,itri_pilligrimring) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_masterring_info()
{
	Snd_Play("LevelUp");
	hero.exp = hero.exp + 1000;
	AI_NoticePrint(3000,4098,NAME_ADDON_TRADEBONUS);
	TRADEBONUS = TRUE;
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_00");	//Co ten prsten, co jsi mi dal?
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_01");	//Věděl jsem, že si toho všimneš a dovol mi to vysvětlit.
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_02");	//Tento prsten je prsten mistra cechu obchodníků. Jen málo lidí si ho zaslouží, takže ho nos hrdě.
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_03");	//Mistra cechu obchodníků?!
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_04");	//Ale to jsi přece ty!
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_05");	//To ano, ale neznamená to, že jen já sám můžu nést tuto hodnost.
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_08");	//Tento prsten ti nepřidá jen stav mistra, ale i jistá privilegia.
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_09");	//Například?
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_10");	//Když obchodníci z našeho cechu uvidí tento prsten...
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_11");	//... S radostí ti nabídnou nejlepší zboží, které mají.
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_12");	//Poptej se některého z nich a řekne ti, v čem ten rozdíl spočívá.
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_13");	//Jen nezapomeň mít prsten na sobě!
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_14");	//Dobrá, budu si to pamatovat a díky!
	NAME_TRADEMASTERRING = "Ten prsten je znak mistra cechu obchodníků z Khorinisu...";
	Npc_RemoveInvItems(other,itri_pilligrimring,1);
	CreateInvItems(other,itri_pilligrimring,1);
	MIS_TRADEGUILD = LOG_SUCCESS;
	TRADEMASTERBEGAN = TRUE;
	Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
	B_LogEntry(TOPIC_TRADEGUILD,"Nyní jsem mistr obchodníků z Khorinisu.");
};

instance DIA_LUTERO_ENDTRADEGUILD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 2;
	condition = dia_lutero_endtradeguild_condition;
	information = dia_lutero_endtradeguild_info;
	permanent = TRUE;
	description = "Máš pro mě nějakou práci?";
};

func int dia_lutero_endtradeguild_condition()
{
	if((MIS_TRADEGUILD != LOG_SUCCESS) && ((TRADEGUILDISOVERMASTER == TRUE) || (TRADEGUILDISOVER == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_endtradeguild_info()
{
	AI_Output(other,self,"DIA_Lutero_EndTradeGuild_01_00");	//Máš pro mě nějakou práci?

	if(TRADEGUILDISOVERMASTER == TRUE)
	{
		AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_01");	//Ne, pro tebe už více ne.
		AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_02");	//Myslím, že bys měl dělat něco jiného, než podnikat s paladiny.
		AI_Output(other,self,"DIA_Lutero_EndTradeGuild_01_03");	//Jak říkáš.

		if(TRADEMASTERBEGAN == TRUE)
		{
			AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_04");	//A mistr cechu by neměl dělat tuhle práci, chlape.
		};
	}
	else if(TRADEGUILDISOVER == TRUE)
	{
		AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_08");	//Již pro tebe nemám více práce.
		AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_09");	//Místo obchodu s paladiny bys měl zkusit něco jiného.
		AI_Output(other,self,"DIA_Lutero_EndTradeGuild_01_10");	//Když to říkáš.

		if(MIS_TRADEGUILD == LOG_Running)
		{
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			B_LogEntry(TOPIC_TRADEGUILD,"Lutero pro mě již nemá další práci.");
		};
	};
};


instance DIA_LUTERO_WHOISTRADEGUILD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_whoistradeguild_condition;
	information = dia_lutero_whoistradeguild_info;
	permanent = TRUE;
	description = "Kdo patří do cechu?";
};

func int dia_lutero_whoistradeguild_condition()
{
	if((MEMBERTRADEGUILD == TRUE) && (KNOWS_GUILDTRADERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_lutero_whoistradeguild_info()
{
	AI_Output(other,self,"DIA_Lutero_WhoIsTradeGuild_01_00");	//Kdo patří do cechu?
	if(TRADEMASTERBEGAN == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_01");	//Jako mistru ti to můžu říci.
		if(MIS_SARAHTOGUILD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_02");	//Za prvé Jora a Sarah...
			if(KNOWS_GUILDTRADERS == FALSE)
			{
				Log_CreateTopic(TOPIC_GUILDTRADERS,LOG_NOTE);
				B_LogEntry(TOPIC_GUILDTRADERS,"Lutero mi řekl jména členů cechu - Matteo, Salandril, Jora, Erol, Nigel a Sarah.");
				KNOWS_GUILDTRADERS = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_03");	//Za prvé Jora...
			if(KNOWS_GUILDTRADERS == FALSE)
			{
				Log_CreateTopic(TOPIC_GUILDTRADERS,LOG_NOTE);
				B_LogEntry(TOPIC_GUILDTRADERS,"Lutero mi řekl o členech cechu obchodníků - Matteo, Salandril, Jora, Erol a Nigel.");
				KNOWS_GUILDTRADERS = TRUE;
			};
		};
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_04");	//Kromě toho ale jiní - Matteo, Salandril, Erol a Nigel.
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_05");	//Všichni z nich ti nabídnou to nejlepší.
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_06");	//Jen nesmíš zapomenout mít prsten. Jasné?!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_08");	//Na to je brzy!
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_09");	//Než začneš klást takové otázky, ještě více pracuj.
	};
};
