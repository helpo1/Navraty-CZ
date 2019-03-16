
instance DIA_Addon_Miguel_EXIT(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 999;
	condition = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIGUEL_NO_TALK(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 1;
	condition = dia_addon_miguel_no_talk_condition;
	information = dia_addon_miguel_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_miguel_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Miguel_PICKPOCKET(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 900;
	condition = DIA_Addon_Miguel_PICKPOCKET_Condition;
	information = DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	return C_Beklauen(40,48);
};

func void DIA_Addon_Miguel_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,Dialog_Back,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};

func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};


instance DIA_Addon_Miguel_Hi(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 1;
	condition = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Addon_Miguel_Hi_Condition()
{
	if(MIGUEL_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//Co tady děláš?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Hledáš snad něco?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Rostliny. Hledám rostliny.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Obvykle hledám rostliny.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//Většina toho, co tu roste, může být nějak využita.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Mnoho rostlin má léčivé účinky a můžeš kouřit trávu z bažin.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//Než mě vhodili za bariéru, byl jsem alchymistou.
};


instance DIA_Addon_Miguel_Story(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 2;
	condition = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent = FALSE;
	description = "Proč tě vhodili za bariéru?";
};


func int DIA_Addon_Miguel_Story_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi) && (MIGUEL_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Miguel_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//Proč tě vhodili za bariéru?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//Hodně jsem pracoval s lektvary měnícími mysl.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//Jednoho večera vypil můj mistr Ignaz jeden z mých 'experimentů' namísto vína.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//A ten ho trvale... eh... nečekaně změnil. Od té doby je tak nejak zmatený.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//(posměšně) Mágové mě za to vhodili za bariéru. Výzkum v oblasti zakázaných věd to nazvali.
};


instance DIA_Addon_Miguel_Lager(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 3;
	condition = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent = FALSE;
	description = "Řekni mi něco o táboře.";
};


func int DIA_Addon_Miguel_Lager_Condition()
{
	if(MIGUEL_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//Řekni mi něco o táboře.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Moc ti toho neřeknu. Ještě nikdy jsem tam nebyl.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Jen Ravenovi lidé tam byli už od začátku. Ostatní, kteří přišli později, jako já, musí čekat, dokud nebudou potřebovat nové lidi.
};


instance DIA_Addon_Miguel_WhereFrom(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent = FALSE;
	description = "Odkud jsi přišel?";
};


func int DIA_Addon_Miguel_WhereFrom_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi) || Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager)) && (MIGUEL_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//Odkud jsi přišel?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//Inu, předpokládám, že úplně stejně jako ty. S piráty, přes moře.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//To údolí je naprosto odříznuté. Žádné jiné spojení přes pevninu neexistuje.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//(zamyšleně) Samozřejme.
};


instance DIA_Addon_Miguel_Angefordert(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent = FALSE;
	description = "Kdy jsou noví lidé zapotřebí?";
};


func int DIA_Addon_Miguel_Angefordert_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager) && (MIGUEL_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//Kdy jsou noví lidé zapotřebí?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//No, když jim uvnitř někdo chybí.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//Třeba když kopáče sežere důlní červ, nechávají jednoho z nás kopat místo něj.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//Občas se taky vraždí mezi sebou. Ale v poslední době se zmírnili.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Raven reguluje přístup do dolu tak, že se tam nikdo nemůže dostat ve stejný čas.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//Ale nevím přesně, jak to funguje. Nikdy jsem uvnitř nebyl.
};


instance DIA_Addon_Miguel_Fortuno(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 6;
	condition = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent = FALSE;
	description = "Fortuno to nemá v hlavě moc v pořádku!";
};


func int DIA_Addon_Miguel_Fortuno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE) && (MIGUEL_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//Fortuno je pořádně zmatený a docela by se mu hodil lektvar pro obnovu paměti.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Fortuno? To je ten Ravenův sluha, že?
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//Byl. Teď je z něj jen troska a to kvůli Ravenovi.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Ravenovi? Do teď jsem o něm mel vcelku vysoké mínění. Hm, dobrá. Ale tady v bažine lektvary míchat nemohu.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//Já to klidně namíchám. V táboře je alchymistický stolek. Jediné co potřebuji, je recept.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Buď opatrný. Namíchat tento lektvar je náročné a nebezpečné.
	B_GiveInvItems(self,other,ITWr_Addon_MCELIXIER_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//Když něco při míchání pokazíš, nebo přidáš špatnou přísadu, lektvar může i zabít.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//Dám si pozor.
	B_LogEntry(Topic_Addon_Fortuno,"Miguel mi dal recept na nějaký lektvar. Když ho Fortuno vypije, obnoví mu pameť. Ale musím to připravit teprve až budu mít všechny ingredience, jinak by to mohlo špatne dopadnout.");
};


instance DIA_Addon_Miguel_BRAU(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 7;
	condition = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Addon_Miguel_BRAU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Story) && (MIGUEL_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//Nemám na to čas. Jsem tu, abych získal zlato. A dokud se nedostanu do tábora, musím se živit prodejem bylin.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//Ale kdybys chtěl nejaké lektvary, pořád nějaké mám.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"U Miguela mohu nakoupit rostliny a lektvary.");
};


instance DIA_ADDON_MIGUEL_DRAGONS(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 7;
	condition = dia_addon_miguel_dragons_condition;
	information = dia_addon_miguel_dragons_info;
	description = "Jak se máš?";
};


func int dia_addon_miguel_dragons_condition()
{
	if((Kapitel == 3) && (MIS_AllDragonsDead == FALSE) && (MIGUEL_TP == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_dragons_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Dragons_15_00");	//Jak se máš?
	AI_Output(self,other,"DIA_Addon_Miguel_Dragons_10_01");	//Všichni jsme zticha. A ty, ty jsi dlouhou dobu nebylo vidět.
	AI_Output(other,self,"DIA_Addon_Miguel_Dragons_15_02");	//Ano, všichni máme svojí práci. To ty určitě chápeš.
	AI_Output(self,other,"DIA_Addon_Miguel_Dragons_10_07");	//Pochopitelně. Mimochodem, nedávno jsem našel vzácnou rostlinu. Myslím, že tebe bude zajímat.
	CreateInvItems(self,ItPl_Perm_Herb,1);
};


instance DIA_Addon_Miguel_trade(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 888;
	condition = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Pojďme obchodovat.";
};


func int DIA_Addon_Miguel_trade_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Miguel_BRAU) && (MIGUEL_TP == FALSE)) || (Kapitel == 4))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Miguel_trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};