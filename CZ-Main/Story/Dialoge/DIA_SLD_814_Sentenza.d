
instance DIA_Sentenza_EXIT(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 999;
	condition = DIA_Sentenza_EXIT_Condition;
	information = DIA_Sentenza_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sentenza_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sentenza_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Sentenza_Wants50;
var int Sentenza_SearchDay;

instance DIA_Sentenza_Hello(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 1;
	condition = DIA_Sentenza_Hello_Condition;
	information = DIA_Sentenza_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sentenza_Hello_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Hello_Info()
{
	AI_Output(self,other,"DIA_Sentenza_Hello_09_00");	//Kam si myslíš, že jdeš?!
	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello,"A co je ti vlastně do toho?",DIA_Sentenza_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Sentenza_Hello,"Chtěl jsem se tu jen trochu porozhlédnout, nic víc.",DIA_Sentenza_Hello_JustLooking);
};

func void DIA_Sentenza_Hello_JustLooking()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_JustLooking_15_00");	//Chtěl jsem se tu jen trochu porozhlédnout, nic víc!
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_01");	//Na takové jako ty tu číhá spousta nebezpečí! A ty mi říkáš, že se tu chceš jen tak porozhlédnout?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_02");	//Ha! Ty chceš určitě na statek! Proč by ses jinak plahočil takový lán cesty, co?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_03");	//Tak přestaň plácat kraviny a nech mě, ať tě prohledám. Pak si můžeš jít zase po svém.
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello,"Dej ty pracky pryč!",DIA_Sentenza_Hello_HandsOff);
	Info_AddChoice(DIA_Sentenza_Hello,"Jen si posluž, klíďo píďo si mě prohledej!",DIA_Sentenza_Hello_SearchMe);
};

func void DIA_Sentenza_Hello_NotYourBusiness()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_NotYourBusiness_15_00");	//A co je ti vlastně do toho?
	AI_Output(self,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01");	//(povzdech) Pak ti to důkladně vysvětlím.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_Sentenza_SearchMe()
{
	var int playerGold;
	playerGold = Npc_HasItems(other,ItMi_Gold);
	AI_Output(other,self,"DIA_Sentenza_Hello_SearchMe_15_00");	//Jen si posluž, klíďo píďo si mě prohledej!
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_01");	//Tak se podívejme, copak to tu máš...
	if(playerGold >= 50)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_02");	//Á, zlato! Vláčet s sebou tolik peněz, to může být pořádně nebezpečné.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_03");	//Spousta žoldáků jsou prachsprostí hrdlořezové, ne tak poctiví jako já.
		B_GiveInvItems(other,self,ItMi_Gold,50);
		Sentenza_GoldTaken = TRUE;
	}
	else if(playerGold > 0)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_04");	//No... To toho teda moc nemáš.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_05");	//Vrátím se k tobě později.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_06");	//Tos ušel takovou štreku a nemáš ani měďák?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_07");	//Nezdá se mi ale, že bys nějak trpěl hladem. Určitě si někde ňákou tu škváru schováváš, co?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_08");	//Je vidět, že nejsi úplně blbý. Určitě se ještě setkáme - tak na sebe zatím dávej pozor.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_09");	//A nejspíš jenom ty sám víš, kde své zlato máš!
	};
	Sentenza_Wants50 = TRUE;
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_10");	//Já po tobě chci jenom 50 zlatých jako mýtné. A stačí, když to zaplatíš jednou - to je přece fér, ne?
};

func void DIA_Sentenza_Hello_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Hello_HandsOff()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_HandsOff_15_00");	//Dej ty pracky pryč!
	AI_Output(self,other,"DIA_Sentenza_Hello_HandsOff_09_01");	//(výhružně) Nebo co?
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello,"Nebo nic. Tak mě teda prohledej!",DIA_Sentenza_Hello_SearchMe);
	Info_AddChoice(DIA_Sentenza_Hello,"Nebo si na nějaký čas budeš muset nechat zajít chuť na prohledávání!",DIA_Sentenza_Hello_OrElse);
};

func void DIA_Sentenza_Hello_OrElse()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_OrElse_15_00");	//Nebo si na nějaký čas budeš muset nechat zajít chuť na prohledávání!
	AI_Output(self,other,"DIA_Sentenza_Hello_OrElse_09_01");	//Tak to se uvidí!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_Vzwei(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 2;
	condition = DIA_Sentenza_Vzwei_Condition;
	information = DIA_Sentenza_Vzwei_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sentenza_Vzwei_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (KAPITELORCATC == FALSE) && (Sentenza_GoldTaken == FALSE) && (Sentenza_SearchDay < Wld_GetDay()))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vzwei_Info()
{
	AI_Output(self,other,"DIA_Sentenza_Vzwei_09_00");	//Tak tě tu máme zas! Podívám se, co tu máš tentokrát!
	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	Info_ClearChoices(DIA_Sentenza_Vzwei);
	Info_AddChoice(DIA_Sentenza_Vzwei,"Dej ty špinavé pracky pryč!",DIA_Sentenza_Vzwei_HandsOff);
	Info_AddChoice(DIA_Sentenza_Vzwei,"Jen si posluž, klíďo píďo si mě prohledej!",DIA_Sentenza_Vzwei_SearchMe);
};

func void DIA_Sentenza_Vzwei_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Vzwei_HandsOff()
{
	AI_Output(other,self,"DIA_Sentenza_Vzwei_HandsOff_15_00");	//Dej ty špinavé pracky pryč!
	AI_Output(self,other,"DIA_Sentenza_Vzwei_HandsOff_09_01");	//(hrozivě) Nebo co? Tentokrát máš nejspíš u sebe daleko víc!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Sentenza_RagnarDead(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 3;
	condition = DIA_Sentenza_RagnarDead_Condition;
	information = DIA_Sentenza_RagnarDead_Info;
	permanent = FALSE;
	description = "Co se tady stalo?!";
};

func int DIA_Sentenza_RagnarDead_Condition()
{
	if((Kapitel == 2) && (RagnarIsSLDDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_RagnarDead_Info()
{
	AI_Output(other,self,"DIA_Sentenza_RagnarDead_01_00");	//Co se tady stalo?!
	AI_Output(self,other,"DIA_Sentenza_RagnarDead_01_01");	//(tiše) Myslíš toho kreténa? Jen sem ho požádal o paušální poplatek aby mohl sem na farmu a on mě praštil pěstí!
	AI_Output(self,other,"DIA_Sentenza_RagnarDead_01_02");	//Chytnul jsem amok a jednoduše ho zapichl. Viděl si něco?
	AI_Output(other,self,"DIA_Sentenza_RagnarDead_01_03");	//Nic sem neviděl...
};

instance DIA_Sentenza_WannaJoin(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 3;
	condition = DIA_Sentenza_WannaJoin_Condition;
	information = DIA_Sentenza_WannaJoin_Info;
	permanent = FALSE;
	description = "Přišel jsem se k vám přidat!";
};

func int DIA_Sentenza_WannaJoin_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Sentenza_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Sentenza_WannaJoin_15_00");	//Přišel jsem se k vám přidat!
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_01");	//To je od tebe hezké.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_02");	//(lhostejně) Je ti jasné, že žoldáci budou hlasovat, jestli tě přijmout nebo ne?
};


instance DIA_Sentenza_Vote(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 4;
	condition = DIA_Sentenza_Vote_Condition;
	information = DIA_Sentenza_Vote_Info;
	permanent = TRUE;
	description = "A ty mi svůj hlas dáš?";
};

func int DIA_Sentenza_Vote_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sentenza_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vote_Info()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//A ty mi svůj hlas dáš?

	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_01");	//Jenom proto, žes mi dal pár na frak? (zasměje se) Ne.
	}
	else if((Npc_HasItems(self,ItMi_Gold) >= 50) && ((Sentenza_GoldTaken == TRUE) || (Sentenza_GoldGiven == TRUE)))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_02");	//A proč vlastně ne? 50 zlatých je docela dobrá cena za jeden hlas, nemyslíš?
		Sentenza_Stimme = TRUE;
		B_LogEntry(TOPIC_SLDRespekt,"Sentenza nemá nic proti tomu, abych se přidal k žoldákům.");
	}
	else if((Sentenza_Stimme == TRUE) && (Npc_HasItems(self,ItMi_Gold) < 50))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_03");	//Potom, cos mi zase ukradl zlato? Neřekl bych, hochu.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_04");	//Takhle to nefunguje, chlapečku! Jestli pro tebe mám hlasovat, pak musíš ke mně nasměrovat taky nějaký zlato.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//Kolik?
		AI_Output(self,other,"DIA_Sentenza_Vote_09_06");	//50 zlatých. To bys musel stejně zaplatit.
		Sentenza_Wants50 = TRUE;
	};
};

var int Sentenza_GoldGiven;

instance DIA_Sentenza_Pay50(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 5;
	condition = DIA_Sentenza_Pay50_Condition;
	information = DIA_Sentenza_Pay50_Info;
	permanent = TRUE;
	description = "Tady máš tedy těch 50 zlatých.";
};

func int DIA_Sentenza_Pay50_Condition()
{
	if((Sentenza_Wants50 == TRUE) && (Npc_HasItems(self,ItMi_Gold) < 50) && (other.guild == GIL_NONE) && (Sentenza_GoldGiven == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Pay50_Info()
{
	AI_Output(other,self,"DIA_Sentenza_Pay50_15_00");	//Tady máš tedy těch 50 zlatých.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_01");	//Tak díky, to stačí.
		Sentenza_GoldGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_02");	//Nezahrávej si se mnou. Dostanu 50 zlatých a ani o měďák míň, jasné?
	};
};

var int Sentenza_Einmal;

instance DIA_Sentenza_GoldBack(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 6;
	condition = DIA_Sentenza_GoldBack_Condition;
	information = DIA_Sentenza_GoldBack_Info;
	permanent = TRUE;
	description = "Vrať mi mé zlato!";
};

func int DIA_Sentenza_GoldBack_Condition()
{
	if(Npc_HasItems(self,ItMi_Gold) >= 50)
	{
		if((Sentenza_GoldGiven == FALSE) || (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void DIA_Sentenza_GoldBack_Info()
{
	AI_Output(other,self,"DIA_Sentenza_GoldBack_15_00");	//Vrať mi mé zlato!

	if((other.guild == GIL_SLD) && (Torlof_SentenzaCounted == TRUE) && (Sentenza_Einmal == FALSE))
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_01");	//Teď, když jsem ti dal svůj hlas?
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_02");	//Ty mizerný žebračisko!
		Sentenza_Einmal = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_03");	//Klídek! Jenom to na chvilku pohlídám...
	};
};


instance DIA_Sentenza_AufsMaul(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 7;
	condition = DIA_Sentenza_AufsMaul_Condition;
	information = DIA_Sentenza_AufsMaul_Info;
	permanent = FALSE;
	description = "Pověz mi, to, co máš vepředu, je tvůj ksicht, nebo to na mě vystrkuješ prdel?";
};


func int DIA_Sentenza_AufsMaul_Condition()
{
	if((Npc_HasItems(self,ItMi_Gold) >= 50) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaul_15_00");	//Pověz mi, to, co máš vepředu, je tvůj ksicht, nebo to na mě vystrkuješ prdel?
	AI_Output(self,other,"DIA_Sentenza_AufsMaul_09_01");	//(vztekle se směje) Dobře, když to tak chceš...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_AufsMaulAgain(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 8;
	condition = DIA_Sentenza_AufsMaulAgain_Condition;
	information = DIA_Sentenza_AufsMaulAgain_Info;
	permanent = TRUE;
	description = "Je čas na další nářez!";
};


func int DIA_Sentenza_AufsMaulAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sentenza_AufsMaul))
	{
		if((Npc_HasItems(self,ItMi_Gold) >= 50) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
		{
			return TRUE;
		};
	};
};

func void DIA_Sentenza_AufsMaulAgain_Info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaulAgain_15_00");	//Je čas na další nářez!
	AI_Output(self,other,"DIA_Sentenza_AufsMaulAgain_09_01");	//Když to říkáš...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_PERM(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 1;
	condition = DIA_Sentenza_PERM_Condition;
	information = DIA_Sentenza_PERM_Info;
	permanent = TRUE;
	description = "Tak co, jak to jde?";
};


func int DIA_Sentenza_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sentenza_PERM_Info()
{
	AI_Output(other,self,"DIA_Sentenza_PERM_15_00");	//Tak co, jak to jde?
	AI_Output(self,other,"DIA_Sentenza_PERM_09_01");	//Moc lidí tudy nechodí, ale doteďka mi každý zaplatil.
	if(Npc_HasItems(self,ItMi_Gold) < 50)
	{
		AI_Output(self,other,"DIA_Sentenza_PERM_09_02");	//Kromě tebe. (zašklebí se)
	};
};


instance DIA_Sentenza_PICKPOCKET(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 900;
	condition = DIA_Sentenza_PICKPOCKET_Condition;
	information = DIA_Sentenza_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sentenza_PICKPOCKET_Condition()
{
	return C_Beklauen(56,65);
};

func void DIA_Sentenza_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET,Dialog_Back,DIA_Sentenza_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sentenza_PICKPOCKET_DoIt);
};

func void DIA_Sentenza_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};

func void DIA_Sentenza_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};

