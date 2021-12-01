
instance DIA_Addon_Snaf_EXIT(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 999;
	condition = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Snaf_PICKPOCKET(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 900;
	condition = DIA_Addon_Snaf_PICKPOCKET_Condition;
	information = DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	return C_Beklauen(49,56);
};

func void DIA_Addon_Snaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET,Dialog_Back,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};

func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};


instance DIA_Addon_Snaf_Hi(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 1;
	condition = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Snaf_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Snaf_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Snaf_Hi_01_00");	//Chceš dostat najíst nebo po hubě?
};

instance DIA_Addon_Snaf_Cook(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 2;
	condition = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent = FALSE;
	description = "Co chutnýho máš?";
};

func int DIA_Addon_Snaf_Cook_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_Cook_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_15_00");	//Co chutnýho máš?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_01_01");	//Chci vyzkoušet novej recept - 'Ohnivé maso říznuté silnou kladivovou omáčkou'.
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Ohnivé maso?",DIA_Addon_Snaf_Cook_FEUER);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Kladivová omáčka?",DIA_Addon_Snaf_Cook_HAMMER);
};

func void DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_FEUER_15_00");	//Ohnivé maso?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_01");	//Křupavé lehce pečené maso, smícháno s ohnivým býlím.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_02");	//Neboj se - ingredience už mám.
};

func void DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_15_00");	//Kladivová omáčka?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_01");	//Omáčka z fakt tvrdýho destilátu. Dostal jsem ten recept od chlápka jménem Lou.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_02");	//Obstarej si přísady a propašuj likér do laboratoře nahoře, potom udělej omáčku. Co myslíš?
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Nemám na to čas.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice(DIA_Addon_Snaf_Cook,"Vlastně, proč ne?",DIA_Addon_Snaf_Cook_YES);
};

func void DIA_Addon_Snaf_Cook_NO()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");	//Nemám na to čas.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Dobře, zapomeň na to.
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
};

func void DIA_Addon_Snaf_Cook_YES()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");	//Vlastně, proč ne?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");	//Dobře. Tady máš recept.
	B_GiveInvItems(self,other,ITWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_Running;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Log_CreateTopic(Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_Running);
	B_LogEntry(Topic_Addon_Hammer,"Snaf potřebuje destilát pro jeho omáčku. Dal mi recept na destilát jménem Louovo kladivo, připravovaný na alchymistickém stole.");
};

var int Snaf_Tip_Kosten;

instance DIA_Addon_Snaf_Booze(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 3;
	condition = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent = FALSE;
	description = "Udělal jsem ten destilát.";
};

func int DIA_Addon_Snaf_Booze_Condition()
{
	if((Npc_HasItems(other,ItFo_Addon_LousHammer) >= 1) && (MIS_SnafHammer == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Snaf_Booze_Info()
{
	B_GivePlayerXP(XP_Addon_Loushammer);
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Udělal jsem ten destilát.
	B_GiveInvItems(other,self,ItFo_Addon_LousHammer,1);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Skvěle, teď to dokončím.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Teď můžeš jednu porci ochutnat. Zesílí ti po tom paže!
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_03");	//Och, a ještě něco. Až budeš příště něco potřebovat... Všechny informace jsou pro tebe zdarma!
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems(self,other,ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_SUCCESS);
	B_LogEntry(Topic_Addon_Hammer,"Přinesl jsem Snafovi destilát.");
};

instance DIA_Addon_Snaf_Attentat(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 4;
	condition = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent = FALSE;
	description = "Co víš o té vraždě?";
};


func int DIA_Addon_Snaf_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_15_00");	//Co víš o té vraždě?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_01");	//Estebanův případ?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_02");	//Víš odkud vítr vane. Barman pozoruje všechno, ale k nikomu se nepřidává...
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Tak mi aspoň řekni, kde seženu informace.",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Kdybys byl já, co bys udělal?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice(DIA_Addon_Snaf_Attentat,"Takže něco víš?",DIA_Addon_Snaf_Attentat_Something);
};

func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_Something_15_00");	//Takže něco víš?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_Something_01_01");	//To jsem neřekl.
};

func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_GoWhere_15_00");	//Tak mi aspoň řekni, kde seženu informace.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_GoWhere_01_01");	//Můj bože! To by bylo stejný! Zapomeň na to!
};

func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_YouBeingMe_15_00");	//Kdybys byl já, co bys udělal?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_01");	//Snažil bych si vzpomenout, co víš o vrahově zaměstnavateli.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_02");	//Za prvé: Byl to samozřejmě jeden z banditů, to znamená, je tady v táboře.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_03");	//Za druhé: Od té doby, co je dotyčný zde v táboře, tě sleduje.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_04");	//Za třetí: Bude-li přesvědčený, že jsi na Estebanově straně, neodkryje svou totožnost.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_05");	//Zajímavá otázka je, jaké jsou tvé šance najít zaměstnavatele?
	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
};


instance DIA_Addon_Snaf_Abrechnung(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 5;
	condition = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent = TRUE;
	description = "Jaké jsou mé šance najít zaměstnavatele?";
};


func int DIA_Addon_Snaf_Abrechnung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Attentat) && (MIS_Judas == LOG_Running) && (Huno_zuSnaf == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Abrechnung_15_00");	//Jaké jsou mé šance najít zaměstnavatele?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Hmmm...
	if((Senyan_Erpressung == LOG_Running) && !Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_02");	//Velmi špatné. Někteří chlápci si všimli, že ses motal kolem Senyana.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_03");	//Budeš muset s ním přerušit kontakt, jinak nikdy nebudeš mít šanci najít toho, kdo je za útok zodpovědný.
		if(Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry(Topic_Addon_Senyan,"Měl bych ukončit Senyanovu práci. Nicméně bylo by nemoudré zaútočit na něj hlava nehlava. Měl bych s ním naposled promluvit.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if(Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_04");	//Srazil jsi jednoho z Estebanových lidí. Člověk kterého hledáš, bude věřit, že jsi na jeho straně.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_05");	//Ale jen tak svou identitu neukáže. Musíš toho rozlousknout mnohem víc.
	}
	else
	{
		if(Finn_Petzt == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_06");	//Vypadá to, že Finn je velmi rozrušen, poté co jsi s ním mluvil.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_07");	//A všichni ví, že má blízko k Estebanovi.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_08");	//To znamená, že jsi řekl něco, co nechtěl slyšet.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_09");	//Člověk kterého hledáš, bude velmi pobavený...
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_10");	//Hrozí však, že s tím poběží za Estebanem - (ironicky) však to víš i ty sám...
		};
		if(Finn_TellAll == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_11");	//Vypadá to, že bys měl říct Finnovi, že pracuješ pro Estebana.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_12");	//Nevím co děláš, ale člověk kterého hledáš, si bude dávat větší pozor.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_13");	//Možný je všechno.
		};
	};
	if(Snaf_Rechnung == FALSE)
	{
		if(Snaf_Einmal == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_14");	//Díky.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_15");	//(drsně) Hej! Neřeknu ti nic než to, co jsi věděl předtím, chápeš?!
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_16");	//Samozřejmě.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_17");	//To je všechno.
		};
	};
};


instance DIA_Addon_Snaf_HOCH(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HOCH_Info;
	permanent = FALSE;
	description = "Poslal mě Huno.";
};


func int DIA_Addon_Snaf_HOCH_Condition()
{
	if(Huno_zuSnaf == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_HOCH_15_00");	//Poslal mě Huno.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_01");	//Vypadá to, že jsi našel svýho člověka.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_02");	//Jdi nahoru, někdo tam na tebe čeká.
	AI_StopProcessInfos(self);
	AI_Teleport(Fisk,"BL_INN_UP_06");
	B_StartOtherRoutine(Fisk,"MEETING");
	B_GivePlayerXP(XP_Addon_Auftraggeber);
};


var int Kosten_Einmal;

instance DIA_Addon_Snaf_People(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent = TRUE;
	description = "Co si lidé myslí o Estebanovi?";
};


func int DIA_Addon_Snaf_People_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Snaf_People_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_15_00");	//Co si lidé myslí o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_01_01");	//Musíš to upřesnit...
	if((Kosten_Einmal == FALSE) && (MIS_SnafHammer != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_02");	//Každá informace něco stojí...
		AI_Output(other,self,"DIA_Addon_Snaf_People_15_03");	//Kolik?
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_04");	//10 zlatých!
		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Snaf_People);
	Info_AddChoice(DIA_Addon_Snaf_People,Dialog_Back,DIA_Addon_Snaf_People_BACK);
	Info_AddChoice(DIA_Addon_Snaf_People,"Paul.",DIA_Addon_Snaf_People_Paul);
	Info_AddChoice(DIA_Addon_Snaf_People,"Huno.",DIA_Addon_Snaf_People_Huno);
	Info_AddChoice(DIA_Addon_Snaf_People,"Fisk.",DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice(DIA_Addon_Snaf_People,"Emilio.",DIA_Addon_Snaf_People_Emilio);
	if(!Npc_IsDead(Senyan))
	{
		Info_AddChoice(DIA_Addon_Snaf_People,"Senyan.",DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice(DIA_Addon_Snaf_People,"Lennar.",DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice(DIA_Addon_Snaf_People,"Finn.",DIA_Addon_Snaf_People_Finn);
};

func void B_Addon_Snaf_NotEnough()
{
	AI_Output(self,other,"DIA_Addon_Snaf_NotEnough_01_00");	//Nemáš dost zlata, chlape!
};

func void DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_People);
};

func void DIA_Addon_Snaf_People_Paul()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Paul_15_00");	//Co Paul?

	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Paul_01_01");	//Myslím, že nemá Estebana moc v lásce. Od té doby, co pracuje pro Huna, nemůže už do dolu.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Huno()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Huno_15_00");	//Co si o Estebanovi myslí Huno?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_01");	//Á! Huno. Nevím o něm skoro nic.
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_02");	//(úsměv) Tahle informace je zdarma.
};

func void DIA_Addon_Snaf_People_Fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//Co Fisk?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_01");	//Fisk je Fisk. Platí svou částku Estebanovi a dělí se o jeho zboží, které většinou dostane od pirátů.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_02");	//Myslím, že se o Estebana nezajímá.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Emilio()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Emilio_15_00");	//Emilio. Co ten si myslí o Estebanovi?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Emilio_01_01");	//Myslím, že by nenosil kytky na Estebanův hrob, doufám že víš, co tím myslím.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Senyan()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Senyan_15_00");	//Co Senyan?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Senyan_01_01");	//Senyan je jeden z Estebanových chlápků. Chvíli pro něj pracuje.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Lennar()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Lennar_15_00");	//Co si Lennar myslí o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Lennar_01_01");	//Co se týče Lennara ten nemá na Estebana žádný názor.
};

func void DIA_Addon_Snaf_People_Finn()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Finn_15_00");	//Co Finn?
	if(B_GiveInvItems(other,self,ItMi_Gold,Snaf_Tip_Kosten))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_01");	//Dobrej kopáč. Má na zlato čuch.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_02");	//Esteban dává přednost z tohoto důvodu jemu. Myslím, že si navzájem celkem rozumějí.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};


instance DIA_Addon_Snaf_Himself(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 7;
	condition = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent = FALSE;
	description = "Co si myslíš o Estebanovi?";
};


func int DIA_Addon_Snaf_Himself_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Himself_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Himself_15_00");	//Co si myslíš o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Snaf_Himself_01_01");	//Ten kdo o něm mluví, bude brzo mrtvej...
};


instance DIA_Addon_Snaf_PERM(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 8;
	condition = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent = TRUE;
	description = "Jak to jde s tvým krámem?";
};


func int DIA_Addon_Snaf_PERM_Condition()
{
	if(Npc_IsDead(Esteban) && (SNAF_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_PERM_15_00");	//Jak to jde s tvým krámem?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_01");	//Dobře! Estebanova smrt je pro pár lidí důvod k oslavě...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_02");	//Po jeho smrti je to tu lehčí.
		AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_03");	//Chlapi maj více zlata, když ho teď nemusí dávat Estebanovi.
	};
};

instance DIA_ADDON_SNAF_ORCINVASION(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	condition = dia_addon_snaf_orcinvasion_condition;
	information = dia_addon_snaf_orcinvasion_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_addon_snaf_orcinvasion_condition()
{
	if((SNAF_TP == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_orcinvasion_info()
{
	AI_Output(self,other,"DIA_Addon_Snaf_OrcInvasion_01_00");	//Och... chlape, teď mi není do řeči!
	AI_StopProcessInfos(self);
	SNAF_TP = TRUE;
};

var int SnafTeachCook;

instance DIA_Addon_Snaf_TeachCook(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 2;
	condition = DIA_Addon_Snaf_TeachCook_Condition;
	information = DIA_Addon_Snaf_TeachCook_Info;
	permanent = FALSE;
	description = "Sám si vaříš polévku?";
};

func int DIA_Addon_Snaf_TeachCook_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Addon_Snaf_Cook) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_TeachCook_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCook_01_00");	//Sám si vaříš polévku?
	AI_Output(self,other,"DIA_Addon_Snaf_TeachCook_01_01");	//Samozřejmě. (naštvaně) Myslíš, že bych někomu svěřil její přípravu!
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCook_01_02");	//Můžeš mě to naučit?
	AI_Output(self,other,"DIA_Addon_Snaf_TeachCook_01_03");	//Vaření? Hmmm... No, kvůli starým časům, proč ne.
	AI_Output(self,other,"DIA_Addon_Snaf_TeachCook_01_04");	//Ale nebude to zadarmo.
	SnafTeachCook = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Snaf mě může naučit, jak vařit vývary.");
};

instance DIA_Addon_Snaf_TeachCookDone(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_TeachCookDone_Condition;
	information = DIA_Addon_Snaf_TeachCookDone_Info;
	permanent = TRUE;
	description = "Nauč mě vařit vývary.";
};

func int DIA_Addon_Snaf_TeachCookDone_Condition()
{
	if((SnafTeachCook == TRUE) && ((Snaf_Meal_01 == FALSE) || (Snaf_Meal_02 == FALSE) || (Snaf_Meal_03 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_TeachCookDone_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_01_00");	//Nauč mě vařit vývary.
	AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_01_01");	//Dobře, s čím začnem?
	Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
	Info_AddChoice(DIA_Addon_Snaf_TeachCookDone,Dialog_Back,DIA_Addon_Snaf_TeachCookDone_back);

	if(Snaf_Meal_01 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_TeachCookDone,"Vývar z tmavých hub (cena: 500 zlatých)",DIA_Addon_Snaf_TeachCookDone_BlackMeal);
	};
	if(Snaf_Meal_02 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_TeachCookDone,"Vývar z otrokových chlebů (cena: 750 zlatých)",DIA_Addon_Snaf_TeachCookDone_HotMeal);
	};
	if(Snaf_Meal_03 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_TeachCookDone,"Masové ragú (cena: 250 zlatých)",DIA_Addon_Snaf_TeachCookDone_MeatMeal);
	};
};

func void DIA_Addon_Snaf_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
};

func void DIA_Addon_Snaf_TeachCookDone_BlackMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_00");	//Vývar z tmavých hub.

	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_01");	//Nic nemůže být jednodušší. Chceš-li začít, budeš potřebovat asi 50 tmavých hub.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_02");	//Vlož je do hrnce s vodou a vař do té doby, dokud se voda nezbarví do černa.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_03");	//Pak se přidá list ohnivého býlí. To dodá hořkost polévce!
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_04");	//A to je vše.
		AI_Print("Naučeno: Vaření - 'Vývar z tmavých hub'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro VÝVAR Z TMAVÝCH HUB: 50x tmavá houba a ohnivé býlí.");
		Snd_Play("LevelUP");
		Snaf_Meal_01 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_05");	//Máš mě za blázna?
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_06");	//Nic tě nenaučím dokud neuvidím zlato!
		Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
	};
};

func void DIA_Addon_Snaf_TeachCookDone_HotMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_00");	//Vývar z otrokových chlebů.

	if(Npc_HasItems(hero,ItMi_Gold) >= 750)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,750);
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_01");	//Aby se polévka povedla nesmí ti být líto hub.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_02");	//Dáš 50 kusů do hrnce, přidáš ohnivý kořen kvůli ostrosti a pomalu vše vaříš.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_03");	//A do půl hodiny je polévka hotová.
		AI_Print("Naučeno: Vaření - 'Vývar z otrokových chlebů'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro VÝVAR Z OTROKOVÝCH CHLEBŮ: 50x otrokův chléb a ohnivý kořen.");
		Snd_Play("LevelUP");
		Snaf_Meal_02 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_04");	//Máš mě za blázna?
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_05");	//Nic tě nenaučím dokud neuvidím zlato!
		Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
	};
};


func void DIA_Addon_Snaf_TeachCookDone_MeatMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_00");	//Masové ragú.

	if(Npc_HasItems(hero,ItMi_Gold) >= 250)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_01");	//Je to můj vlastní recept. (hrdě) Nic špatnýho!
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_02");	//Jen pár tmavých hub a maso žravé štěnice.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_03");	//Hodíš všechno do hrnce a vaříš - a je hotovej ten nejchutnější pokrm co jsem kdy jedl.
		AI_Print("Naučeno: Vaření - 'Masové ragú'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro MASOVÉ RAGÚ: 2x tmavá houba a maso ze žravé štěnice.");
		Snd_Play("LevelUP");
		Snaf_Meal_03 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_04");	//Máš mě za blázna?
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_05");	//Nic tě nenaučím dokud neuvidím zlato!
		Info_ClearChoices(DIA_Addon_Snaf_TeachCookDone);
	};
};

//----------------------------------kosti---------------------------------

instance DIA_BDT_1098_Addon_Snaf_Game(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 3;
	condition = DIA_BDT_1098_Addon_Snaf_Game_condition;
	information = DIA_BDT_1098_Addon_Snaf_Game_info;
	description = "Nechceš si zahrát kostky?";
};

func int DIA_BDT_1098_Addon_Snaf_Game_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Snaf_Hi))
	{
		return TRUE;
	};
};

func void DIA_BDT_1098_Addon_Snaf_Game_info()
{
 	AI_Output(other,self,"DIA_BDT_1098_Addon_Snaf_Game_01_00"); //Nechceš si zahrát kostky?
 	AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_Game_01_01"); //S tebou?! Hmmm... (uznale) Vypadáš jako zkušený hráč.
 	AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_Game_01_02"); //Nakonec proč ne. Koneckonců, každý zlaťák navíc se hodí!
	SnafPlayResult = 100;
	Menu_WriteInt("AST","SysTimer05",0);
};

instance DIA_BDT_1098_Addon_Snaf_GamePlay(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 900;
	condition = DIA_BDT_1098_Addon_Snaf_GamePlay_condition;
	information = DIA_BDT_1098_Addon_Snaf_GamePlay_info;
	permanent = TRUE;
	description = "Zahrajme si kostky!";
};

func int DIA_BDT_1098_Addon_Snaf_GamePlay_condition()
{
	if((Npc_KnowsInfo(other,DIA_BDT_1098_Addon_Snaf_Game) == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_BDT_1098_Addon_Snaf_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer05");

	if(CheckLastGame >= SnafPlayResult)
	{
		CheckLastSum = CheckLastGame - SnafPlayResult;
	};

	AI_Output(other,self,"DIA_BDT_1098_Addon_Snaf_GamePlay_01_00");	//Zahrajme si kostky!

	if(SnafPlayResult >= CheckLastGame)
	{
		if((SnafPlayResult > 0) && (SnafDayFlag == FALSE))
		{
			AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GamePlay_01_01");	//No tak se ukaž.
			PlayPocker(1,self);
		}
		else
		{
			if(SnafDayFlag == FALSE)
			{
				AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GamePlay_01_02");	//Ne příteli, dobrého pozvolna.
				SnafDayPlay = Wld_GetDay();
				SnafDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GamePlay_01_03");	//Nyní ne!
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GamePlay_01_04");	//V poslední době mě dlužíš pěknou sumu ze hry.
		AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GamePlay_01_05");	//Takže je potřeba nejdřív zaplatit.
		Info_ClearChoices(DIA_BDT_1098_Addon_Snaf_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_BDT_1098_Addon_Snaf_GamePlay,"Zde jsou tvé peníze.",DIA_BDT_1098_Addon_Snaf_GamePlay_Here);
		};

		Info_AddChoice(DIA_BDT_1098_Addon_Snaf_GamePlay,"Nemám tolik peněz.",DIA_BDT_1098_Addon_Snaf_GamePlay_No);
	};
};

func void DIA_BDT_1098_Addon_Snaf_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	SnafPlayResult = CheckLastGame;
	AI_Output(other,self,"DIA_BDT_1098_Addon_Snaf_GamePlay_Here_01_01");	//Zde jsou tvé peníze.
	AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GamePlay_Here_01_02");	//Výborně a teď můžem hrát.
	PlayPocker(1,self);
};

func void DIA_BDT_1098_Addon_Snaf_GamePlay_No()
{
	AI_Output(other,self,"DIA_BDT_1098_Addon_Snaf_GamePlay_No_01_01");	//Nemám tolik peněz.
	AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GamePlay_No_01_02");	//Tak to nemůžu sloužit.
	Info_ClearChoices(DIA_BDT_1098_Addon_Snaf_GamePlay);
};

instance DIA_BDT_1098_Addon_Snaf_GameEnd(C_Info)
{
	npc = BDT_1098_Addon_Snaf;
	nr = 3;
	condition = DIA_BDT_1098_Addon_Snaf_GameEnd_condition;
	information = DIA_BDT_1098_Addon_Snaf_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_BDT_1098_Addon_Snaf_GameEnd_condition()
{
	if((MustTellResult_Snaf == TRUE) && ((SnafLost == TRUE) || (SnafWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_BDT_1098_Addon_Snaf_GameEnd_info()
{
	if(SnafLost == TRUE)
	{
		AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GameEnd_00");	//Neuvěřitelné! Porazil jsi mě! Neočekával jsem, že...
		SnafLost = FALSE;
	}
	else if(SnafWon == TRUE)
	{
		AI_Output(self,other,"DIA_BDT_1098_Addon_Snaf_GameEnd_01");	//Lépe bude tvému zlatu u mě. Nevadí ti to?
		SnafWon = TRUE;
	};

	MustTellResult_Snaf = FALSE;
};
