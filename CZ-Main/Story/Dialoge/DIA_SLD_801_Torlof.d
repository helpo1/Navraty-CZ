
instance DIA_Torlof_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_EXIT_Condition;
	information = DIA_Torlof_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_Hallo(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = DIA_Torlof_HALLO_Condition;
	information = DIA_Torlof_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_HALLO_Info()
{
	AI_Output(self,other,"DIA_Torlof_Hallo_01_00");	//Co ode mě chceš?
};


instance DIA_Torlof_WannaJoin(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 2;
	condition = DIA_Torlof_WannaJoin_Condition;
	information = DIA_Torlof_WannaJoin_Info;
	permanent = FALSE;
	description = "Chci se přidat k žoldákům!";
};

func int DIA_Torlof_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//Chci se přidat k žoldákům!
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//Hm? A proč si myslíš, že bych měl být pro, abychom tě sem přijali?
};

var int Torlof_Go;

instance DIA_Torlof_Probe(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 3;
	condition = DIA_Torlof_Probe_Condition;
	information = DIA_Torlof_Probe_Info;
	permanent = TRUE;
	description = "Nech mě projít zkouškou!";
};


func int DIA_Torlof_Probe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_WannaJoin) && (hero.guild == GIL_NONE) && (Torlof_Go == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Probe_Info()
{
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//Nech mě projít zkouškou!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//Poslal tě za mnou Lee?

	if(Npc_KnowsInfo(other,DIA_Lee_OtherSld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//Řekl, že mi pomůžeš.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//Dobrá... (vzdychne si) Fajn! Než se k nám budeš moci přidat, musíš udělat dvě věci.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//Za prvé - musíš prokázat, že budeš schopný zvládnout úkoly, které budeš jako žoldák dostávat. Sám tě ozkouším.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//A za druhé: musíš si vysloužit respekt ostatních žoldáků.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
		B_LogEntry(TOPIC_BecomeSLD,"Mám-li být přijat mezi žoldáky, musím projít Torlofovou zkouškou a získat si úctu ostatních.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//Ne.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//Tak co tady plkáš?
		AI_StopProcessInfos(self);
	};
};


instance DIA_Torlof_Respekt(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 4;
	condition = DIA_Torlof_Respekt_Condition;
	information = DIA_Torlof_Respekt_Info;
	permanent = FALSE;
	description = "Jak si vysloužím respekt ostatních žoldáků?";
};


func int DIA_Torlof_Respekt_Condition()
{
	if((Torlof_Go == TRUE) && (hero.guild == GIL_NONE) && (MIS_SLDRESPEKT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Respekt_Info()
{
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//Jak si vysloužím respekt ostatních žoldáků?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//Většině z nich bude stačit, když splníš svůj úkol a projdeš mou zkouškou.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//Některé ale budeš muset přesvědčit jinak a sám musíš zjistit jak.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//Někteří budou chtít využít toho, v jaké jsi situaci, jiným se prostě nebude líbit tvoje tvář.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//Měl by ses snažit najít společnou řeč s co nejvíce z nich - ale když nepomůže nic jiného, můžeš se vždycky utkat v souboji.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//Když vyhraješ, získáš si u většiny uznání. Dej si ale pozor, abys někoho náhodou nezabil. V tom případě bys byl v pěkné kaši.
	Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
	MIS_SLDRESPEKT = LOG_Running;
	B_LogEntry(TOPIC_SLDRespekt,"Splním-li Torlofovu zkoušku, získám si tím respekt i u ostatních žoldáků. Také na ně mohu zapůsobit, pokud některé z nich přemůžu v souboji.");
};


instance DIA_Torlof_Duellregeln(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 5;
	condition = DIA_Torlof_Duellregeln_Condition;
	information = DIA_Torlof_Duellregeln_Info;
	permanent = FALSE;
	description = "Jaká jsou pravidla pro souboj?";
};


func int DIA_Torlof_Duellregeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_Respekt) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Duellregeln_Info()
{
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//Jaká jsou pravidla pro souboj?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//Je to prosté. Před prvním úderem musejí mít oba soupeři možnost vytasit zbraň.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//Nemůžeš jen tak někoho propíchnout bez varování.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//Musí dojít k nějaké formě ústní výzvy. Urážce, nebo jinému důvodu k boji.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//Do takového souboje se nebude nikdo jiný míchat. Leda že by během něj někdo z těch dvou zemřel.
	B_LogEntry(TOPIC_SLDRespekt,"Pravidla souboje: souboj musí začít výzvou, aby do něj již nikdo další nezasahoval. Také při něm nikdo nesmí být zabit.");
};


instance DIA_Torlof_DeineStimme(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 6;
	condition = DIA_Torlof_DeineStimme_Condition;
	information = DIA_Torlof_DeineStimme_Info;
	permanent = FALSE;
	description = "A co ty? Budeš pro mě hlasovat?";
};


func int DIA_Torlof_DeineStimme_Condition()
{
	if((Torlof_Go == TRUE) && (other.guild == GIL_NONE) && (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DeineStimme_Info()
{
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//A co ty? Budeš pro mě hlasovat?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//Pokud prokážeš, že jsi schopný plnit úkoly žoldáka, tak ano.
};


var int Points_Sld;

instance DIA_Torlof_RUF(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 7;
	condition = DIA_Torlof_RUF_Condition;
	information = DIA_Torlof_RUF_Info;
	permanent = TRUE;
	description = "Jak to vypadá s mojí reputací mezi žoldáky?";
};


func int DIA_Torlof_RUF_Condition()
{
	if((Torlof_Go == TRUE) && (Torlof_GenugStimmen == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_RUF_Info()
{
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//Jak to vypadá s mojí reputací mezi žoldáky?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//Tak se na to podívejme...
	Points_Sld = 0;
	if(Npc_IsDead(SLD_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(MIS_AppleTest == LOG_Success)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//Wolf nemá nic proti tomu, aby ses přidal.
		Points_Sld = Points_Sld + 1;
	};
	if(Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//Jarvis si myslí, že stojíš na správné straně.
		Points_Sld = Points_Sld + 1;
	}
	else if(Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//Jarvis si stále není jistý, jestli stojíš na správné straně.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//Nechce, aby někdo další tancoval tak, jak Sylvio píská. Když jsme u toho, tak já také ne.
	};
	if(Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Cord_Approved == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//Cord si myslí, že bys mohl být dost dobrý na to, abychom tě přijali.
		Points_Sld = Points_Sld + 1;
	}
	else if(Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//Podle Cordova názoru se budeš muset nejdřív naučit pořádně zacházet s mečem, než se budeš moci přidat.
	};
	if(Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if((MIS_Cipher_Paket == LOG_SUCCESS) || (MIS_Cipher_BringWeed == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//Cipher říká, že pro něj bylo od začátku jasné, že by ses měl přidat. Vypadá to, že ho něco vážně potěšilo.
		Points_Sld = Points_Sld + 1;
	}
	else if(Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//Cipher říká, že mu dlužíš laskavost, a že víš, o čem je řeč.
	};
	if(Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Npc_HasItems(Rod,ItMw_2h_Rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//Rod chce jen dostat svůj meč zpátky.
	}
	else if((Rod.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod_WetteGewonnen == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//Zdá se, žes Roda přesvědčil o tom, že jsi dostatečně silný.
		if(Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1;
		};
	}
	else if(Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//Rod si myslí, že jsi slaboch.
	};
	if(Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Npc_HasItems(Sentenza,ItMi_Gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//Sentenza pro tebe ruku zvedne. Říká, že ses zachoval velice rozumně.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if(Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//Sentenza pro tebe ruku nezvedne. Říká, že mu stále dlužíš 50 zlatých.
	};
	if(Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//Raoul je proti tobě. Myslím, že tě nemůže vystát.
	};
	if(Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//O Sylviovi a Bullcovi mluvit nemusím. Ti dva tupci jsou proti každému.
	};
	if(Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Buster_Duell == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//Buster říká, že jsi v pohodě.
		if(Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//I když jsi prohrál.
		};
	}
	else if(Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//Buster říká, že když tě vyzval, tak jsi vyměkl.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//To nebyl dobrý nápad. Možná bys měl za ním zajít a vyzvat ho.
	};
	if(Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if(Dar_LostAgainstCipher == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//A Dar říká, že jsi žvanil. Ale jeho hlas tady moc neznamená.
	};
	if(Points_Sld > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//Zbytek žoldáků neřekl nic.
	};
	if((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//Většina z nich čeká, jak si povedeš během zkoušky.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//Většinu z nich jsi přesvědčil tím, že jsi prošel zkouškou.

		if(Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Torlof_RUF_01_00");	//(úšklebek) Dokonce i Cord trochu pomohl...
			Points_Sld = Points_Sld + 4;
		}
		else if(MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//I když hodně z nich říká, že přesvědčit farmáře, aby zaplatil svůj nájem, bylo na zkoušku moc jednoduché.
			Points_Sld = Points_Sld + 3;
		}
		else
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//Můj hlas každopádně máš.
		Points_Sld = Points_Sld + 1;
	};
	if(Sld_Duelle_gewonnen >= 3)
	{
		Points_Sld = Points_Sld + 1;
		if(Points_Sld >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//A vyhrál jsi několik čestných soubojů.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//To hodně žoldáků respektuje.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//Každopádně jsi vyhrál několik čestných soubojů.
		};
	};
	if(Points_Sld >= 9)
	{
		B_GivePlayerXP(300);
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//Většina žoldáků stojí za tebou - co se nás týče, můžeš u nás začít kdy se ti zlíbí.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//Běž za Leem. Vysvětlí ti všechno potřebné.
		Torlof_GenugStimmen = TRUE;
		MIS_SLDRESPEKT = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_SUCCESS);
		B_LogEntry(TOPIC_BecomeSLD,"Mezi žoldáky už jsem si vydobyl dost úcty. Nyní bych měl prohodit pár slov s Leem!");
	}
	else if(Points_Sld >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//To je dost, ale pořád to nestačí.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//Budeš se muset s chlapci ještě chvíli prát.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//Nemáš to ani zdaleka za sebou, chlapče. Jestli chceš, abychom tě přijali mezi sebe, budeš pro to muset udělat trochu víc!
	};
};


instance DIA_Torlof_Aufgaben(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 8;
	condition = DIA_Torlof_Aufgaben_Condition;
	information = DIA_Torlof_Aufgaben_Info;
	permanent = FALSE;
	description = "Jaké mám jako žoldák povinnosti?";
};


func int DIA_Torlof_Aufgaben_Condition()
{
	if((Torlof_Go == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//Jaké mám jako žoldák povinnosti?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//Onar nás najal ze dvou důvodů: chce, abychom od něj drželi dál domobranu a udržovali pořádek na jeho farmách.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//To zahrnuje vybírání pachtovného, když nebudou chtít drobní farmáři zaplatit.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//Takže, co to bude?
	Info_ClearChoices(DIA_Torlof_Aufgaben);
	Info_AddChoice(DIA_Torlof_Aufgaben,"Nech mě vybrat ten nájem!",DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice(DIA_Torlof_Aufgaben,"Vypořádám se s domobranou, žádné obavy!",DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//Dobrá. Poslouchej. Farmář Sekob už několik týdnů Onarovi nezaplatil nájem.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//Onar po něm chce, aby vysolil 50 zlatých. Nějaké otázky?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//Kde je Sekobova farma?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//V severní části údolí. Když se díváš odsud, je to napravo u té velké křižovatky.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//Kdybys měl nějaké problémy, rolníci na polích ti pomůžou najít cestu.
	MIS_Torlof_HolPachtVonSekob = LOG_Running;
	Sekob.flags = 0;
	CreateInvItems(Sekob,ItMi_Gold,50);
	Log_CreateTopic(TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofPacht,LOG_Running);
	B_LogEntry(TOPIC_TorlofPacht,"Torlof mě požádal, abych od farmáře Sekoba vyinkasoval nájemné, které činí 50 zlatých.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//Farmář Bengar si stěžoval, že mu domobrana z města v poslední době leze na nervy.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//Vyvíjejí na toho farmáře nátlak - nejspíš chtějí, aby se otočil k Onarovi zády.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//Chci, abys šel na jeho farmu a vyjasnil domobraně, že tady nemají co pohledávat! Otázky?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//Jak najdu Bengarovu farmu?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//Na jihozápadě údolí je velké schodiště, které vede na planinu. Tam má Bengar svou farmu.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//Kdyby ses ztratil, zeptej se rolníků na polích, kudy se dát.
	MIS_Torlof_BengarMilizKlatschen = LOG_Running;
	Bengar.flags = 0;
	Wld_InsertNpc(Mil_335_Rumbold,"FARM3");
	Wld_InsertNpc(Mil_336_Rick,"FARM3");
	B_InitNpcGlobals();
	Log_CreateTopic(TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofMiliz,LOG_Running);
	B_LogEntry(TOPIC_TorlofMiliz,"Torlof mě pověřil, abych na planině ze statku farmáře Bengara vyhnal domobranu.");
};

func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//Nech mě vybrat ten nájem!
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices(DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//Vypořádám se s domobranou, žádné obavy!
	B_Torlof_BengarMilizKlatschen();
	Torlof_Probe = Probe_Bengar;
	Info_ClearChoices(DIA_Torlof_Aufgaben);
};


var int Torlof_TheOtherMission_Day;

func void B_Torlof_TheOtherMissionDay()
{
	if(Torlof_TheOtherMission_Day < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//Trvalo ti to strašně dlouho. Onar nebude mít radost.
		Torlof_TheOtherMission_TooLate = TRUE;
		if(EnterOW_Kapitel2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//A je mu jedno, jestli paladiny něco sežere v Hornickém údolí, nebo ne...
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//Dobrá práce! Až budu mít něco dalšího, dám ti vědět.
	};
};


instance DIA_Torlof_SekobSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 9;
	condition = DIA_Torlof_SekobSuccess_Condition;
	information = DIA_Torlof_SekobSuccess_Info;
	permanent = TRUE;
	description = "Vybral jsem nájem od Sekoba.";
};


func int DIA_Torlof_SekobSuccess_Condition()
{
	if(MIS_Torlof_HolPachtVonSekob == LOG_Running)
	{
		if((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))
		{
			return TRUE;
		};
	};
};

func void DIA_Torlof_SekobSuccess_Info()
{
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//Vybral jsem nájem od Sekoba.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		B_GivePlayerXP(XP_Torlof_SekobsKohlebekommen);
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//A? Zaplatil dobrovolně?

		if(Npc_IsDead(Sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//No, potkal ho smrtelný úraz...
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//Nejdřív jsem ho musel přesvědčit.
		};
		if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//Dobrá práce! Prošel jsi zkouškou. To přesvědčí hodně žoldáků o tom, že víš, co se sluší a patří.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TorlofPacht,LOG_SUCCESS);
		B_LogEntry(TOPIC_TorlofPacht,"Přinesl jsem Torlofovi peníze od Sekoba.");
		B_LogEntry_Quiet(TOPIC_BecomeSLD,"Splnil jsem úkol, který mi svěřil Torlof.");
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//A? Utratil jsi to snad za chlast? Přines mi peníze! A hezky zčerstva!
	};
};


instance DIA_Torlof_BengarSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 10;
	condition = DIA_Torlof_BengarSuccess_Condition;
	information = DIA_Torlof_BengarSuccess_Info;
	permanent = FALSE;
	description = "Postaral jsem se o Bengarův problém s domobranou.";
};


func int DIA_Torlof_BengarSuccess_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BengarSuccess_Info()
{
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//Postaral jsem se o Bengarův problém s domobranou.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//Ujistil ses, že nebudou zítra zase stát na jeho zápraží?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//To by s tím měli docela potíže...
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//Dobrá práce!
	if(Torlof_Probe == Probe_Bengar)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//Prošel jsi zkouškou. Když dokážeš zvládnout domobranu, většina tě tady bude uznávat.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry(TOPIC_BecomeSLD,"Už jsem splnil úkol, který mi Torlof zadal.");
	Torlof_ProbeBestanden = TRUE;
};


instance DIA_Torlof_Welcome(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 11;
	condition = DIA_Torlof_Welcome_Condition;
	information = DIA_Torlof_Welcome_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_Welcome_Condition()
{
	if((other.guild == GIL_SLD) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Welcome_Info()
{
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//Vítej mezi žoldáky, chlapče!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//Díky!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//Jakmile pro tebe budu mít něco na práci, dám ti vědět.
};


var int Torlof_KnowsDragons;

func void B_Torlof_Dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//Kde jsi byl?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//Byl jsem v Hornickém údolí! Jsou tam draci! Dali paladinům pěkně zabrat!
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//Fakt? Takže na všech těch povídačkách vážně něco je!
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//Leeho to bude zajímat...
	Torlof_KnowsDragons = TRUE;
};


instance DIA_Torlof_TheOtherMission(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 11;
	condition = DIA_Torlof_TheOtherMission_Condition;
	information = DIA_Torlof_TheOtherMission_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_TheOtherMission_Condition()
{
	if((other.guild == GIL_SLD) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_Torlof_TheOtherMission_Info()
{
	if((Torlof_KnowsDragons == FALSE) && (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		B_Torlof_Dragons();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//Dobře, že jsi tady. Mám pro tebe něco na práci...
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//Co je?
	if(Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else
	{
		B_Torlof_BengarMilizKlatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//A postarej se o to, ať je to do zítra hotové!
	Torlof_TheOtherMission_Day = Wld_GetDay();
};


instance DIA_Torlof_Dragons(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 12;
	condition = DIA_Torlof_Dragons_Condition;
	information = DIA_Torlof_Dragons_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Torlof_Dragons_Condition()
{
	if((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE) && (Kapitel <= 3) && (other.guild == GIL_SLD) && (Torlof_KnowsDragons == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Dragons_Info()
{
	B_Torlof_Dragons();
};


instance DIA_Torlof_WhatCanYouTeach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 140;
	condition = DIA_Torlof_WhatCanYouTeach_Condition;
	information = DIA_Torlof_WhatCanYouTeach_Info;
	permanent = FALSE;
	description = "Můžeš mi pomoci vylepšit moje schopnosti?";
};

func int DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};

func void DIA_Torlof_WhatCanYouTeach_Info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//Můžeš mi pomoci vylepšit moje schopnosti?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//Mohl bych ti ukázat, jak lépe využít svou sílu při boji na blízko.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//Spousta bojovníků je strašně slabá, protože nemají správnou techniku, s jejíž pomocí by správně využívali svou sílu.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//To samé platí u střelných zbraní a obratnosti.
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Torlof mi pomůže vylepšit obratnost a sílu.");
};

var int Torlof_Merke_STR;
var int Torlof_Merke_DEX;

instance DIA_Torlof_NoTeach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 150;
	condition = DIA_Torlof_NoTeach_Condition;
	information = DIA_Torlof_NoTeach_Info;
	permanent = FALSE;
	description = "Chci si vylepšit schopnosti!";
};

func int DIA_Torlof_NoTeach_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Torlof_WhatCanYouTeach) == TRUE) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Torlof_NoTeach_Info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//Chci si vylepšit schopnosti!
	AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//Řekl jsem, že bych ti MOHL pomoci, ne že ti POMŮŽU.
	AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//Dokud nejsi jedním z nás, musíš si najít někoho jiného, kdo by tě učil!
};

instance DIA_Torlof_Teach(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 150;
	condition = DIA_Torlof_Teach_Condition;
	information = DIA_Torlof_Teach_Info;
	permanent = TRUE;
	description = "Chci si vylepšit schopnosti!";
};

func int DIA_Torlof_Teach_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Torlof_WhatCanYouTeach) == TRUE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Teach_Info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//Chci si vylepšit schopnosti!
	Torlof_Merke_STR = other.attribute[ATR_STRENGTH];
	Torlof_Merke_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_Back()
{
	if((Torlof_Merke_STR < other.attribute[ATR_STRENGTH]) || (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//Dobrá! Nyní dokážeš používat svoje schopnosti lépe!
	};
	Info_ClearChoices(DIA_Torlof_Teach);
};

func void DIA_Torlof_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_HIGH);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_HIGH);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void dia_torlof_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};

func void dia_torlof_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach,Dialog_Back,DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_torlof_teach_hp_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_torlof_teach_hp_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_Teach_STR_5);
};


instance DIA_Torlof_KAP3_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP3_EXIT_Condition;
	information = DIA_Torlof_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DEMENTOREN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 30;
	condition = DIA_Torlof_DEMENTOREN_Condition;
	information = DIA_Torlof_DEMENTOREN_Info;
	description = "Nemáš pro mě něco na práci?";
};


func int DIA_Torlof_DEMENTOREN_Condition()
{
	if((Kapitel >= 3) && (CAPITANORDERDIAWAY == FALSE) && (MeetDarkRavenSpeaker == TRUE) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DEMENTOREN_Info()
{
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//Nemáš pro mě něco na práci?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//Viděls ty chlapíky s černými kápěmi, co se potulují po okolí? Řeknu ti, běhá mi z nich mráz po zádech.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//Když jsem byl na moři, viděl jsem pár vážně divných věcí, ale tihle lidi mě vážně děsí.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//Šli směrem na tábor banditů, co je v horách na jižním konci údolí.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//Možná by ses tam měl vydat, zjistit, co jsou zač a vypořádat se s nimi!
	MIS_Torlof_Dmt = LOG_Running;
	Log_CreateTopic(TOPIC_Torlof_Dmt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt,LOG_Running);
	B_LogEntry(TOPIC_Torlof_Dmt,"Pár těch zakuklenců se nejspíš bude skrývat v táboře banditů v horách jižně od údolí. Torlofovi pořádně pijí krev - mám pro něj tenhle problém vyřešit.");
};

instance DIA_Torlof_DmtSuccess(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 30;
	condition = DIA_Torlof_DmtSuccess_Condition;
	information = DIA_Torlof_DmtSuccess_Info;
	description = "Ti černokápníci z hor už nejsou mezi námi!";
};

func int DIA_Torlof_DmtSuccess_Condition()
{
	if((MIS_Torlof_Dmt == LOG_Running) && (CastlemineDMTMasterIsDead == TRUE) && (CastlemineDMTIsDead == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DmtSuccess_Info()
{
	B_GivePlayerXP(XP_Torlof_DMT);
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//Ti černokápníci z hor už nejsou mezi námi!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//Dokázal jsi je vyřídit? Frajer!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//Ani za mák jsem těm chlapíkům nevěřil. Jenom by budili trable!
	MIS_Torlof_Dmt = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Torlof_Dmt,LOG_SUCCESS);
	B_LogEntry(TOPIC_Torlof_Dmt,"Řekl jsem, Torlofovi že se už o černé kápě nemusí starat.");
};

instance DIA_Torlof_KAP4_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP4_EXIT_Condition;
	information = DIA_Torlof_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Torlof_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_WOISTSYLVIO(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 40;
	condition = DIA_Torlof_WOISTSYLVIO_Condition;
	information = DIA_Torlof_WOISTSYLVIO_Info;
	description = "Někteří žoldáci odešli?";
};


func int DIA_Torlof_WOISTSYLVIO_Condition()
{
	if((CAPITANORDERDIAWAY == FALSE) && ((MIS_ReadyforChapter4 == TRUE) || (Kapitel == 4)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_WOISTSYLVIO_Info()
{
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//Někteří žoldáci odešli?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//Sylvio sebral pár chlapců a zmizel s nimi na druhou stranu průsmyku.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//Povídá se, že se tam objevili draci. Když se to doslechl, nešlo ho zastavit.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//Kdo ví? Za dračí trofej by dostal na tržišti hromadu peněz.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//To pro mě není. Jsem námořník. Patřím na moře a ne do nějakého dusného dračího doupěte.
};


instance DIA_Torlof_KAP5_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP5_EXIT_Condition;
	information = DIA_Torlof_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_BEMYCAPTAIN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 51;
	condition = DIA_Torlof_BEMYCAPTAIN_Condition;
	information = DIA_Torlof_BEMYCAPTAIN_Info;
	permanent = FALSE;
	description = "Ty jsi námořník?";
};


func int DIA_Torlof_BEMYCAPTAIN_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (TORLOFCANBECAPITAN == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//Ty jsi námořník?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//Konečně tě to trklo?! (přkvapeně) Jo, ksakru, jsem námořník! Proč se ptáš?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//Hodily by se mi tvoje schopnosti. Potřebuji se dostat na jeden ostrov.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//(zasměje se) Na ostrov? Vždyť ani nemáš loď, natož posádku, která by ji řídila!
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//Ne, chlapče! Jestli chceš využít mých služeb jako kapitána a učitele síly, musíš mi nejdřív dokázat, že víš, o čem mluvíš.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//Kromě toho mám už tak dost svých vlastních starostí. Paladinové se nestáhli z města, jak jsme očekávali.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//Muselo by se stát něco opravdu vážného, aby vyklidili pole.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN,"Aha. Promiň, že jsem rušil.",dia_torlof_bemycaptain_no);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN,"A když se o to postarám, budeš můj kapitán?",dia_torlof_bemycaptain_yes);
};

func void dia_torlof_bemycaptain_no()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_No_01_00");	//Aha. Promiň, že jsem rušil.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_No_01_01");	//Tak tak. (směje se) Už mě neruš.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_08");	//Jdi!
	AI_StopProcessInfos(self);
};

func void dia_torlof_bemycaptain_yes()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_Yes_01_00");	//A když se o to postarám, budeš můj kapitán?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_Yes_01_01");	//Hmmm... (zamyšleně) Ano, mohl bych ti pomoct dostat se na ostrov.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_Yes_01_02");	//Ale ne dříve, než splníš co jsi slíbil!
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Torlof bude můj kapitán, když přimeji paladiny opustit město. Jak tu ale udělat?");
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_BEMYCAPTAIN2(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 52;
	condition = DIA_Torlof_BEMYCAPTAIN2_Condition;
	information = DIA_Torlof_BEMYCAPTAIN2_Info;
	description = "Brána do hradu v Hornickém údolí je otevřená a zaseknutá.";
};


func int DIA_Torlof_BEMYCAPTAIN2_Condition()
{
	if((MIS_OCGateOpen == TRUE) && Npc_KnowsInfo(other,DIA_Torlof_BEMYCAPTAIN) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN2_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//Brána do hradu v Hornickém údolí je otevřená a zaseknutá
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//Paladinové utrpěli v bitvě se skřety vážné ztráty.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//Řekl bych, že už nebude trvat dlouho, než se paladinové odsud z města vydají do Hornického údolí, aby dostali své kamarády pryč z hradu.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//To jsou příjemné zprávy! Takže už nic nestojí v cestě tomu, abych utekl z tohohle prokletého kraje.
};


instance DIA_Torlof_BEMYCAPTAIN3(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 53;
	condition = DIA_Torlof_BEMYCAPTAIN3_Condition;
	information = DIA_Torlof_BEMYCAPTAIN3_Info;
	permanent = TRUE;
	description = "Teď už mi pomůžeš dostat se na ten ostrov?";
};


var int Torlof_PaidToBeCaptain;

func int DIA_Torlof_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Torlof_BEMYCAPTAIN2) && (Torlof_PaidToBeCaptain == FALSE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//Teď už mi pomůžeš dostat se na ten ostrov?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//No jasně. Chtěl jsi jet na nějaký ostrov. Hmm. Dám ti jeden návrh.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//Zaplatíš mi 2500 zlatých a já se ujmu velení tvé lodi.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//Navíc tě budu trénovat v síle a obratnosti, kdykoliv to jen budeš chtít.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3,"To je strašná spousta peněz!",DIA_Torlof_BEMYCAPTAIN3_zuViel);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3,"Dobrá. Tady máš své peníze.",DIA_Torlof_BEMYCAPTAIN3_ok);
};

func void DIA_Torlof_BEMYCAPTAIN3_zuViel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//To je strašná spousta peněz!
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//To jo. Dobrá pomoc je drahá. Nemáš na výběr. Tady v okolí nenajdeš nikoho dalšího, kdo by velel tvé lodi.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//Tak zaplať a nedělej vlny.
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry(Topic_Captain,"Torlof je nyní ochoten řídit loď. Bohužel za to ale požaduje 2500 zlatých.");
};

func void DIA_Torlof_BEMYCAPTAIN3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//Dobrá. Tady máš své peníze.
	if(B_GiveInvItems(other,self,ItMi_Gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//Nádhera. Teď mi jen přesně řekni, co po mně budeš chtít.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry(Topic_Captain,"Jakmile jsem mu předal 2500 zlatých, je Torlof konečně připraven mě dopravit k cíli.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//Snažíš se mě oblbnout pár zlaťáky? Nejdřív přines peníze. Pak uvidíme.
	};
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
};


instance DIA_Torlof_BEMYCAPTAIN4(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 54;
	condition = DIA_Torlof_BEMYCAPTAIN4_Condition;
	information = DIA_Torlof_BEMYCAPTAIN4_Info;
	permanent = TRUE;
	description = "Buď mým kapitánem.";
};


func int DIA_Torlof_BEMYCAPTAIN4_Condition()
{
	if((SCGotCaptain == FALSE) && (Torlof_PaidToBeCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN4_Info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//Buď mým kapitánem.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//Dobrá. Sežeň mi loď a dostatečně silnou posádku a já tě dostanu na ten tvůj mizerný ostrov.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//Máš námořní mapy? Bez nich se moc daleko nedostaneme.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//O to se postarám. Setkáme se v přístavu.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_04");	//Jsem vážně zvědavý, jak to chceš udělat.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	TorlofIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Torlof_LOSFAHREN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 59;
	condition = DIA_Torlof_LOSFAHREN_Condition;
	information = DIA_Torlof_LOSFAHREN_Info;
	permanent = TRUE;
	description = "Vzhůru na ostrov.";
};


func int DIA_Torlof_LOSFAHREN_Condition()
{
	if((TorlofIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_LOSFAHREN_Info()
{
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//Vzhůru na ostrov.
	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//Dobrá! Dej mi mapy a můžeme vyplout!
		AI_Output(other,self,"DIA_Torlof_LOSFAHREN_01_07");	//Tady.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//(zavolá) Všichni na palubu!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//Ujisti se, že máš opravdu všechno, co bys mohl potřebovat. Vracet se nemůžeme!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//Jestli si jsi jistý, běž se natáhnout do kapitánské kajuty. Za chvíli vyrazíme na cestu.
		B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//Žádná loď, žádná posádka, žádná mapa, žádný výlet, příteli.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//Chci vidět aspoň pět chlapů ochotných a schopných plavby.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Torlof_PERM5_NOTCAPTAIN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 59;
	condition = DIA_Torlof_PERM5_NOTCAPTAIN_Condition;
	information = DIA_Torlof_PERM5_NOTCAPTAIN_Info;
	permanent = TRUE;
	description = "Rozhodl jsem se pro jiného kapitána. Můžeš mi hned vrátit mé peníze.";
};


func int DIA_Torlof_PERM5_NOTCAPTAIN_Condition()
{
	if((SCGotCaptain == TRUE) && (TorlofIsCaptain == FALSE) && (Torlof_PaidToBeCaptain == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//Rozhodl jsem se pro jiného kapitána. Můžeš mi hned vrátit mé peníze.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//To by nešlo! Nic takového. Když mi nejdřív zaplatíš a pak nakonec moje služby odmítáš, je to tvůj problém.
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_KAP6_EXIT(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 999;
	condition = DIA_Torlof_KAP6_EXIT_Condition;
	information = DIA_Torlof_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_PICKPOCKET(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 900;
	condition = DIA_Torlof_PICKPOCKET_Condition;
	information = DIA_Torlof_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Torlof_PICKPOCKET_Condition()
{
	return C_Beklauen(76,120);
};

func void DIA_Torlof_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
	Info_AddChoice(DIA_Torlof_PICKPOCKET,Dialog_Back,DIA_Torlof_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Torlof_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Torlof_PICKPOCKET_DoIt);
};

func void DIA_Torlof_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};

func void DIA_Torlof_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};


instance DIA_TORLOF_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_torlof_nw_kapitelorcattack_condition;
	information = dia_torlof_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Mám pro tebe špatné zprávy.";
};


func int dia_torlof_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (TORLOFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_01_00");	//Mám pro tebe špatné zprávy - Khorinis je napaden skřety!
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_01_01");	//Už když jsme se blížili k přístavu, myslel jsem si, že něco není v pořádku.
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_01_04");	//Myslím že v naší situaci by pomohlo jen jedno.
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_01_05");	//Co přesně?!
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_01_06");	//Zázrak, samozřejmě.
	Info_ClearChoices(dia_torlof_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportFarm) >= 1)
	{
		Info_AddChoice(dia_torlof_nw_kapitelorcattack,"Nabídnout runu na Onarovu farmu.",dia_torlof_nw_kapitelorcattack_farm);
	};
	Info_AddChoice(dia_torlof_nw_kapitelorcattack,"Dobře, cokoliv řekneš.",dia_torlof_nw_kapitelorcattack_nogiverune);
};

func void dia_torlof_nw_kapitelorcattack_farm()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_01");	//Mám tu runu, která tě přemístí na Onarovu farmu.
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_02");	//Jestli chceš, použij ji!
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_03");	//Runu?!
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_05");	//Probít se městem je holé šílenství.
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_06");	//Skřeti by z tebe udělali mleté maso.
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_09");	//Dobrá, dej ji sem!
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_10");	//Tady ji máš.
	B_GiveInvItems(other,self,ItMi_TeleportFarm,1);
	Npc_RemoveInvItems(self,ItMi_TeleportFarm,1);
	AI_Output(self,other,"DIA_Torlof_NW_KapitelOrcAttack_Farm_01_11");	//Eh! Doufám, že se ještě uvidíme.
	TORLOFNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Dal jsem Torlofovi runu na Onarovu farmu. Snad ho potká příznivý osud.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_torlof_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Torlof_NW_KapitelOrcAttack_NoGiveRune_01_01");	//V pořádku. Nebudu ti do toho mluvit.
	B_LogEntry(TOPIC_HELPCREW,"Torlof si zkusí probít cestu z města.");
	TORLOFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_801_TORLOF_FUCKOFF(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 2;
	condition = dia_sld_801_torlof_fuckoff_condition;
	information = dia_sld_801_torlof_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_801_torlof_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TORLOFCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SLD_801_TORLOF_YOURFREE(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_sld_801_torlof_yourfree_condition;
	information = dia_sld_801_torlof_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_801_torlof_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TORLOFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_yourfree_info()
{
	AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_08");	//Co tu děláš?!
	AI_Output(other,self,"DIA_SLD_801_Torlof_YourFree_01_00");	//Stavil jsem se, abych ti řekl, že jsi volný!
	AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_01");	//Hmm... (udiveně) Ty jsi pobil všechny skřety ve městě?!
	AI_Output(other,self,"DIA_SLD_801_Torlof_YourFree_01_02");	//Už to tak bude.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_03");	//Výborně příteli, doufal jsem, že ještě není konec.
		AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_04");	//Stačí otevřít mříže od cely, pak můžeme vypadnout.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_05");	//Výborně příteli, doufal jsem, že ještě není konec.
		AI_Output(self,other,"DIA_SLD_801_Torlof_YourFree_01_06");	//Stačí otevřít mříže od cely, pak můžeme vypadnout.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_801_TORLOF_OPENGATENOW(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_sld_801_torlof_opengatenow_condition;
	information = dia_sld_801_torlof_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sld_801_torlof_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TORLOFCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (TORLOFISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_opengatenow_info()
{
	AI_Output(self,other,"DIA_SLD_801_Torlof_OpenGateNow_01_00");	//(nechápavě) Tak budeš tu jen tak stát?!
	AI_StopProcessInfos(self);
};


instance DIA_SLD_801_TORLOF_AGAINCAPITAN(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 5;
	condition = dia_sld_801_torlof_againcapitan_condition;
	information = dia_sld_801_torlof_againcapitan_info;
	permanent = FALSE;
	description = "Potřebuji kapitána!";
};


func int dia_sld_801_torlof_againcapitan_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_needcapitan) && (TORLOFISFREE == TRUE) && (GREGISCAPITAN != TRUE) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_againcapitan_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SLD_801_Torlof_AgainCapitan_01_00");	//Potřebuji kapitána!
	if(TorlofIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_01");	//Ano?! A kam chceš zase plout, kamaráde?
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_02");	//Ano?! A proč ho potřebuješ?!
	};
	AI_Output(other,self,"DIA_SLD_801_Torlof_AgainCapitan_01_03");	//Potřebuji se dostat na kontinent.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_04");	//(překvapě) Na kontinent?
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_06");	//No dobře, budu tvůj kapitán
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_07");	//Je to lepší než zůstat tady na farmě.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_08");	//A kdy vyrážíme?
	AI_Output(other,self,"DIA_SLD_801_Torlof_AgainCapitan_01_09");	//Teď.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_10");	//No... (rozhodně) Pak musím jít do přístavu, připravit loď.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_11");	//A nezapomeň, že potřebujeme posádku.
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_12");	//5 nebo 6 lidí by mohlo stačit!
	AI_Output(self,other,"DIA_SLD_801_Torlof_AgainCapitan_01_14");	//Sejdeme se na lodi!
	B_LogEntry(TOPIC_SALETOBIGLAND,"Torlof je znovu můj kapitán. Mám sehnat 5, nebo 6 lidí do posádky - podle Torlofa to bude stačit.");
	WHOTRAVELONBIGLAND = TRUE;
	TORLOFISAGAINCAPITAN = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AllOnBoard");
};


instance DIA_SLD_801_TORLOF_TRAVELONBIGLAND(C_Info)
{
	npc = SLD_801_Torlof;
	nr = 1;
	condition = dia_sld_801_torlof_travelonbigland_condition;
	information = dia_sld_801_torlof_travelonbigland_info;
	permanent = TRUE;
	description = "Je má loď připravena?";
};


func int dia_sld_801_torlof_travelonbigland_condition()
{
	if((TORLOFISAGAINCAPITAN == TRUE) && (SHIPAGAINACCESS == TRUE) && (WHOTRAVELONBIGLAND == TRUE) && (COUNTTRAVELONBIGLAND > 0) && (ALLSAYGOODBUY == FALSE))
	{
		return TRUE;
	};
};

func void dia_sld_801_torlof_travelonbigland_info()
{
	AI_Output(other,self,"DIA_SLD_801_Torlof_TravelOnBigLand_01_00");	//Je má loď připravena?
	if(COUNTTRAVELONBIGLAND >= 5)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_01");	//Samozřejmě. Vše je v plném pořádku.
		AI_Output(other,self,"DIA_SLD_801_Torlof_TravelOnBigLand_01_02");	//No pokud ano, pak můžeme vyplout.
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_03");	//Hmmm. Jseš si jistý?!
		AI_Output(other,self,"DIA_SLD_801_Torlof_TravelOnBigLand_01_04");	//Ano. Není čas na zdržování.
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_05");	//Dobrá. Naše cesta začíná.
		AI_TurnToNPC(self,DiegoNW);
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_06");	//... (řve) Hej vy suchozemské krysy! Na místa!
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_07");	//... (řve) Zvednout kotvu, napnout plachty!
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_08");	//... (řev) Pohněte kostrou!
		ALLSAYGOODBUY = TRUE;
		MIS_SALETOBIGLAND = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SALETOBIGLAND,LOG_SUCCESS);
		B_LogEntry(TOPIC_SALETOBIGLAND,"Opouštíme Khorinis a plujeme na kontinent. Nikdo neví, co nás tam čeká...");
		Info_ClearChoices(dia_sld_801_torlof_travelonbigland);
		Info_AddChoice(dia_sld_801_torlof_travelonbigland,Dialog_Ende,dia_sld_801_torlof_travelonbigland_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_801_Torlof_TravelOnBigLand_01_09");	//Samozřejmě. Vše je v plném pořádku.
	};
};

func void dia_sld_801_torlof_travelonbigland_ok()
{
	AI_StopProcessInfos(self);
	b_end_avi();
};

