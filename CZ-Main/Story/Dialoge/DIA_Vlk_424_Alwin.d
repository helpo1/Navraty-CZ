
instance DIA_Alwin_EXIT(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 999;
	condition = DIA_Alwin_EXIT_Condition;
	information = DIA_Alwin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alwin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alwin_PICKPOCKET(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 900;
	condition = DIA_Alwin_PICKPOCKET_Condition;
	information = DIA_Alwin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Alwin_PICKPOCKET_Condition()
{
	return C_Beklauen(20,10);
};

func void DIA_Alwin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,Dialog_Back,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};

func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};


instance DIA_Alwin_Sheep(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Condition;
	information = DIA_Alwin_Sheep_Info;
	permanent = FALSE;
	description = "Tohle jsou tvoje ovce?";
};


func int DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};

func void DIA_Alwin_Sheep_Info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Tohle jsou tvoje ovce?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Kdepak mě patří jenom ta, která se jmenuje Lucy (usměje se) - a to je moje žena.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Ovce jsou majetkem domobrany - hned, jak je získají od farmářů, přivedou je ke mně.
};

instance DIA_Alwin_Sheep_Do(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Do_Condition;
	information = DIA_Alwin_Sheep_Do_Info;
	permanent = FALSE;
	description = "A co s nima děláš?";
};

func int DIA_Alwin_Sheep_Do_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Sheep_Do_Info()
{
   	AI_Output(other,self,"DIA_Alwin_Sheep_Do_12_00");   //A co s nima děláš?
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_01");   //(udiveně) Jakto co! Domobrana a paladinové potřebují zásobovat proviantem a já jim obstarávám maso.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_02");   //Ale poslední dobou, to jde velmi špatně. Nyní má každá živá ovce téměř cenu svojí váhy ve zlatě.
   	AI_Output(other,self,"DIA_Alwin_Sheep_Do_12_03");   //Tak to nemáš moc práce.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_04");   //No jak ti to mám říct. Ano práce není moc, ale vyžaduje určité dovednosti.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_05");   //Musíš znát jak správně oddělit maso od kostí, a jaké kousky masa jsou nejlepší.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_06");   //A taky musíš dbát na to abys maso nepoškodil. A nyní posuď sám jestli je to složitá práce.
   	AI_Output(other,self,"DIA_Alwin_Sheep_Do_12_07");   //A můžeš mě to naučit?
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_08");   //K čemu, chceš umět bourat maso? No, ale proč ne.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_09");   //Ale musíš za to zaplatit, zadarmo to dělat nebudu.
   	AI_Output(other,self,"DIA_Alwin_Sheep_Do_12_10");   //Kolik?
	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_11");   //No co třeba 150 zlatých.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_12");   //Aspoň to pokryje moje výdaje, kdyby někdo ukradl jednu z mých ovcí zatím co tě budu učit.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Alwin mě může naučit získávat maso ze zvířat.");
};

instance DIA_Alwin_Butcher(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 5;
	condition = DIA_Alwin_Butcher_condition;
	information = DIA_Alwin_Butcher_info;
	permanent = TRUE;
	description = "Nauč mě získávat maso ze zvířat. (VB: 2, cena: 150 zlatých)";
};

func int DIA_Alwin_Butcher_condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep_Do) && (ButcherSkill == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Butcher_info()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Alwin_Butcher_01_00");   //Nauč mě získávat maso ze zvířat.
	kosten = 2;
	money = 150;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Alwin_Butcher_01_90");   //Nemáš dost zlata!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
      	AI_Output(self,other,"DIA_Alwin_Butcher_01_01");   //Je to jednoduché. Hlavně si pamatuj: Nikdy nezačínej od hlavy.
      	AI_Output(self,other,"DIA_Alwin_Butcher_01_02");   //První řez proveď na břiše kde je kůže měkká a dobře se odstraní.
      	AI_Output(self,other,"DIA_Alwin_Butcher_01_03");   //Vždy si vybírej místa kde můžeš získat pořádný kus masa. Čím víc tím lépe.
      	AI_Output(self,other,"DIA_Alwin_Butcher_01_04");   //A teď se můžeš procvičit. Ale nezkoušej to na mých ovcích nebo z tebe sám stáhnu kůži!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Zvířecí trofeje - 'Získávání masa'");
		ButcherSkill = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... získávat ze zvířat maso.");
	};
};

instance DIA_Alwin_Fellan(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_Fellan_Condition;
	information = DIA_Alwin_Fellan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alwin_Fellan_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Fellan_Info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Hochu, to šílené mlácení kladivem mě přivede do hrobu.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//O čem to mluvíš?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Copak neslyšíš ty rány? Kdo asi tak může v přístavní čtvrti od rána do večera bušit kladivem?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//Myslím toho cvoka Fellana. Každý den si do té své chatrče bere kladivo.
};


instance DIA_Alwin_FellanRunning(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_FellanRunning_Condition;
	information = DIA_Alwin_FellanRunning_Info;
	permanent = FALSE;
	description = "Mohl bych se o Fellana postarat.";
};


func int DIA_Alwin_FellanRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanRunning_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Mohl bych se o Fellana postarat.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Ty mi chceš pomoct? A co z toho budeš mít?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//To mi pověz ty.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Aha, tak je to! No dobře - když to jeho bušení nějak umlčíš, zaplatím ti 25 zlatých.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Ale upozorňuju tě, že s ním rozumnou domluvou nic nesvedeš - je to totální magor. Jediná věc, která by mu pomohla, je pár dobře mířených facek!
	MIS_AttackFellan = LOG_Running;
	Log_CreateTopic(TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alwin,LOG_Running);
	B_LogEntry(TOPIC_Alwin,"Alwin mě požádal, zda bych nepřiměl Fellana, aby přestal bušit kladivem. Zabít ho ale nebude zrovna to nejlepší řešení.");
	Info_ClearChoices(DIA_Alwin_FellanRunning);
	Info_AddChoice(DIA_Alwin_FellanRunning,"Uvidím, co se dá dělat...",DIA_Alwin_FellanRunning_Ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW))
	{
		Info_AddChoice(DIA_Alwin_FellanRunning,"Když ho zmlátím, budu z toho mít jenom opletačky s domobranou...",DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Uvidím, co se dá dělat.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Jen si to rozmysli a pamatuj si, že jsem ti slíbil 25 zlatých.
	Info_ClearChoices(DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Když ho zmlátím, budu z toho mít jenom opletačky s domobranou.
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Tady v přístavu se nějaká ta rvačka tak tragicky nebere.
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Ale jestli tu někde něco šlohneš nebo mi šáhneš na ovce, budeš v pěkném průšvihu.
};


instance DIA_Alwin_FellanSuccess(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 4;
	condition = DIA_Alwin_FellanSuccess_Condition;
	information = DIA_Alwin_FellanSuccess_Info;
	permanent = FALSE;
	description = "Fellan už kladivem tlouci nebude.";
};


func int DIA_Alwin_FellanSuccess_Condition()
{
	if((MIS_AttackFellan == LOG_Running) && ((FellanGeschlagen == TRUE) || Npc_IsDead(Fellan)))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanSuccess_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Fellan už kladivem tlouci nebude.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//Slyšíš to? Ticho - žádné rány. Konečně. Myslel jsem, že ten chlap nikdy nezmlkne.
	if(Npc_IsDead(Fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Prokázals mi velkou laskavost. Víš co? Dám ti celých 30 zlatých.
		B_GiveInvItems(self,other,ItMi_Gold,30);
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};


instance DIA_Alwin_Endlos(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 8;
	condition = DIA_Alwin_Endlos_Condition;
	information = DIA_Alwin_Endlos_Info;
	permanent = TRUE;
	description = "A jak se daří ovcím?";
};


func int DIA_Alwin_Endlos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Endlos_Info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//A jak se daří ovcím?
	if((MIS_AttackFellan != LOG_SUCCESS) && (Npc_IsDead(Fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Z toho Fellanova mlácení už pomalu šílí. Ještě pár dní a budou úplně našrot.
	}
	else if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Ovce se jen cpou a jsou čím dál tím tlustší. Stejně jako moje žena. HAHAHA. (hlasitě se směje)
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Možná bych měl jednu z nich klepnout - jako poslední večeři!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Jako co?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Pro jednoho žoldáka, který zabil paladina. Samozřejmě ho za to popraví.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Jen se musím rozhodnout, která z nich půjde na popravčí špalek.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Lucy má opravdu štěstí, že je ještě naživu.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//Myslel jsem, že jsi říkal, že Lucy je tvá žena.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Správně, ale jedna z ovcí se taky jmenuje Lucy. Právě ona měla být posledním jídlem pro Benneta.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Ale nakonec se to všechno vyřešilo a Lucy může být ráda.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//Časem je ale pozorování pasoucích se ovcí docela nuda.
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Tak se s nimi loučím. Lord Hagen rozkázal, že všechny ovce poslouží jako zásoby pro jeho armádu.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Ale aspoň budu mít víc času na svou ženu.
	};
};

instance DIA_Alwin_GiveAmulet(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_GiveAmulet_condition;
	information = DIA_Alwin_GiveAmulet_info;
	permanent = FALSE;
	description = "Poslal mě za tebou Holger.";
};

func int DIA_Alwin_GiveAmulet_condition()
{
	if(MIS_HOLGER_QUEST == 1)
	{
		return TRUE;
	};
};

func void DIA_Alwin_GiveAmulet_info()
{
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_01");	//Poslal mě za tebou Holger.
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_02");	//(udiveně) Můj syn! Lucy! Slyšela jsi. Nakonec přišla zpráva od Holgera.
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_03");	//No, jak se má? Nechybí mu něco?
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_04");	//Nic mu nechybí, aspoň myslím.
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_05");	//Jediný co mu vadí tak, ta tvrdá disciplína.
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_06");	//Znám svého syna, nikdy nebyl poslušné dítě.
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_07");	//Jediné o co mě prosil, abych mu přinesl amulet, prý budete vědět jaký.
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_08");	//Tady je. Ten jsme mu darovali ještě když mu bylo osm let. 
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_09");	//Měl mu přinést štěstí, ale v ten nešťastný den ho zapomněl doma... 
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_10");	//Na, předej mu ho a vyřiď mu, že se nám po něm stýská!
	B_GiveInvItems(self,other,itam_holger_amulet,1);
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_11");	//Dobře, předám.
	MIS_HOLGER_QUEST = 2;
	B_LogEntry(TOPIC_BADSON,"Něco se objasnilo. Vypadá to, že Holger je syn Alwina. Kdo by to řek. Co měl na mysli Alwin když mluvil o tom nešťastném dni. Holger mi bude muset říct vše!");

	if(Npc_HasItems(other,itwr_holger_letter) >= 1)
	{
		B_GivePlayerXP(50);
		AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_12");	//A ještě něco jiného jsem skoro zapomněl...
		AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_13");	//Ještě mě prosil předat ti tento dopis.
		B_GiveInvItems(other,self,itwr_holger_letter,1);
		B_UseFakeScroll();

		if((hero.guild != GIL_NDM) && (hero.guild != GIL_KDM))
		{
			AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_14");	//Mockrát děkujem! Ať tě Innos ochraňuje v tvém konání.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_15");	//(pro sebe) Nekromant koná dobro pro lidi... ničemu už nerozumím ve svém životě! Stárnu asi...
		};
	};
};
