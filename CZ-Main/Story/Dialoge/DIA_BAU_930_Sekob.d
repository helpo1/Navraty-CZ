
instance DIA_Sekob_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 999;
	condition = DIA_Sekob_EXIT_Condition;
	information = DIA_Sekob_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_HALLO(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 3;
	condition = DIA_Sekob_HALLO_Condition;
	information = DIA_Sekob_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sekob_HALLO_Condition()
{
	if((Kapitel < 3) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_HALLO_Info()
{
	AI_Output(self,other,"DIA_Sekob_HALLO_01_00");	//Co děláš na mém pozemku? Tady není nic, co bys mohl ukrást. Pakuj se.
	AI_Output(other,self,"DIA_Sekob_HALLO_15_01");	//Není v téhle zemi alespoň kousek půdy, která by nikomu nepatřila?
	AI_Output(self,other,"DIA_Sekob_HALLO_01_02");	//Začni makat, pak ti možná jednoho dne bude taky nějaká půda patřit. Ale do té doby se poflakuj někde jinde.
};


instance DIA_Sekob_PermVorMis(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 3;
	condition = DIA_Sekob_PermVorMis_Condition;
	information = DIA_Sekob_PermVorMis_Info;
	permanent = TRUE;
	description = "Poslouchej...";
};


func int DIA_Sekob_PermVorMis_Condition()
{
	if((Kapitel < 3) && (MIS_Torlof_HolPachtVonSekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PermVorMis_Info()
{
	AI_Output(other,self,"DIA_Sekob_PermVorMis_15_00");	//Poslouchej...
	AI_Output(self,other,"DIA_Sekob_PermVorMis_01_01");	//Nemám pro tebe žádnou práci. A teď vypadni!
};


instance DIA_Sekob_ZAHLPACHT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_ZAHLPACHT_Condition;
	information = DIA_Sekob_ZAHLPACHT_Info;
	permanent = FALSE;
	description = "Onar chce, abys už konečně zaplatil nájem.";
};


func int DIA_Sekob_ZAHLPACHT_Condition()
{
	if(MIS_Torlof_HolPachtVonSekob == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Sekob_ZAHLPACHT_Info()
{
	AI_Output(other,self,"DIA_Sekob_ZAHLPACHT_15_00");	//Tahle půda patří velkostatkáři. Jsi tady pouze nájemcem. Onar chce, abys mu zaplatil rentu. Dlužíš už za několik týdnů.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_01");	//Co? A to poslal takovýho ničemu? Přece ti nebudu věřit.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_02");	//Vypadni odsud, nebo se neudržím.
	self.aivar[AIV_DefeatedByPlayer] = FALSE;
};


instance DIA_Sekob_KohleRaus(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_KohleRaus_Condition;
	information = DIA_Sekob_KohleRaus_Info;
	permanent = TRUE;
	description = "Naval prachy, nebo dostaneš do zubů!";
};


func int DIA_Sekob_KohleRaus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_KohleRaus_Info()
{
	AI_Output(other,self,"DIA_Sekob_KohleRaus_15_00");	//Naval prachy, nebo dostaneš do zubů!
	AI_Output(self,other,"DIA_Sekob_KohleRaus_01_01");	//Nedostaneš ani zlaťák z mé peněženky, ty kriminálníku. TY ROZHODNĚ NE!
	AI_StopProcessInfos(self);
	self.aivar[AIV_ToughGuy] = TRUE;
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sekob_InformOnar(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_InformOnar_Condition;
	information = DIA_Sekob_InformOnar_Info;
	permanent = FALSE;
	description = "Tak to mám dojem, že o tom povím Onarovi.";
};


func int DIA_Sekob_InformOnar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_InformOnar_Info()
{
	AI_Output(other,self,"DIA_Sekob_InformOnar_15_00");	//Tak to mám dojem, že o tom povím Onarovi.
	AI_Output(self,other,"DIA_Sekob_InformOnar_01_01");	//To je mi fuk! Můžeš Onarovi říct, že nic nemám. To je smutná pravda.
	MIS_Sekob_RedeMitOnar = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_Defeated(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_Defeated_Condition;
	information = DIA_Sekob_Defeated_Info;
	permanent = FALSE;
	description = "Kde jsou ty peníze?!";
};


func int DIA_Sekob_Defeated_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == TRUE) && Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (Sekob_Pachtbezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Defeated_Info()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_15_00");	//Kde jsou ty peníze?!
	AI_Output(self,other,"DIA_Sekob_Defeated_01_01");	//Už mě nebij, prosím. Udělám, co řekneš.
	AI_Output(other,self,"DIA_Sekob_Defeated_15_02");	//Tak zaplať nájem.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_03");	//(naříkavě) Ale, já nic nemám. Jsem jen chudý ubožák, co skoro umírá hlady.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_04");	//Moje úroda celá uschla. CHTĚL bych zaplatit, ale já prostě nemám čím. Smůla.
	Info_ClearChoices(DIA_Sekob_Defeated);
	Info_AddChoice(DIA_Sekob_Defeated,"Buď ten nájem zaplatíš hned teď, nebo tě zabiju.",DIA_Sekob_Defeated_hart);
	Info_AddChoice(DIA_Sekob_Defeated,"Fajn, řeknu to Onarovi.",DIA_Sekob_Defeated_weich);
};

func void DIA_Sekob_Defeated_weich()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_weich_15_00");	//Fajn, řeknu to Onarovi.
	AI_Output(self,other,"DIA_Sekob_Defeated_weich_01_01");	//Díky, pane. Tisíceré díky!
	MIS_Sekob_RedeMitOnar = LOG_Running;
	AI_StopProcessInfos(self);
};

func void B_Sekob_Kassieren()
{
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_00");	//Přestaň s těmi žvásty. Celou dobu tu pršelo a máš plný sklad obilí. Zaplať hned teď, nebo tě zabiju.
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_01");	//(podlézavě) Ne, prosím, tady je zlato. Ještě ti přidám, když mě necháš naživu.
	B_GiveInvItems(self,other,ItMi_Gold,60);
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_02");	//Ani to nebolelo, co?
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_03");	//(zoufale) Jsem na mizině.
	Sekob_Pachtbezahlt = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Defeated_hart()
{
	B_Sekob_Kassieren();
};


instance DIA_Sekob_Again(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_Again_Condition;
	information = DIA_Sekob_Again_Info;
	permanent = TRUE;
	description = "K té rentě...";
};


func int DIA_Sekob_Again_Condition()
{
	if((MIS_Sekob_RedeMitOnar == LOG_Running) && Npc_KnowsInfo(other,DIA_Sekob_Defeated) && (Sekob_Pachtbezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Again_Info()
{
	AI_Output(other,self,"DIA_Sekob_Again_15_00");	//K té rentě...
	AI_Output(self,other,"DIA_Sekob_Again_01_01");	//Mluvil jsi s Onarem, že?
	Info_ClearChoices(DIA_Sekob_Again);
	Info_AddChoice(DIA_Sekob_Again,"Změnil jsem názor.",DIA_Sekob_Again_Nein);
	if(Onar_WegenSekob == TRUE)
	{
		Info_AddChoice(DIA_Sekob_Again,"Ano, mluvil...",DIA_Sekob_Again_verarscht);
	}
	else
	{
		Info_AddChoice(DIA_Sekob_Again,"Jasně.",DIA_Sekob_Again_Ja);
	};
};

func void DIA_Sekob_Again_Nein()
{
	AI_Output(other,self,"DIA_Sekob_Again_Nein_15_00");	//Změnil jsem názor.
	B_Sekob_Kassieren();
};

func void DIA_Sekob_Again_Ja()
{
	AI_Output(other,self,"DIA_Sekob_Again_Ja_15_00");	//Jasně.
	AI_Output(self,other,"DIA_Sekob_Again_Ja_01_01");	//Můžeš to udělat.
	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Again_verarscht()
{
	MIS_Sekob_RedeMitOnar = LOG_SUCCESS;
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_00");	//Ano, mluvil...
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_01");	//A? Co říkal?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_02");	//Je mi líto, ale teď tě musím připravit o hlavu.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_03");	//Ale proč? Co jsem udělal?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_04");	//Hráls to na mě.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_05");	//Mluvil jsem pravdu - přísahám!
	B_Sekob_Kassieren();
};


instance DIA_Sekob_PERMKAP1(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 6;
	condition = DIA_Sekob_PERMKAP1_Condition;
	information = DIA_Sekob_PERMKAP1_Info;
	permanent = TRUE;
	description = "Příště už zaplatíš včas, rozumíš?";
};


func int DIA_Sekob_PERMKAP1_Condition()
{
	if((Sekob_Pachtbezahlt == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Sekob_PERMKAP1_15_00");	//Příště už zaplatíš včas, rozumíš?
	AI_Output(self,other,"DIA_Sekob_PERMKAP1_01_01");	//(pro sebe) Čím jsem si tohle zasloužil...
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_KAP3_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 999;
	condition = DIA_Sekob_KAP3_EXIT_Condition;
	information = DIA_Sekob_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_DMT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 30;
	condition = DIA_Sekob_DMT_Condition;
	information = DIA_Sekob_DMT_Info;
	description = "Něco se stalo?";
};


func int DIA_Sekob_DMT_Condition()
{
	if((Kapitel >= 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMT_Info()
{
	AI_Output(other,self,"DIA_Sekob_DMT_15_00");	//Něco se stalo?
	AI_Output(self,other,"DIA_Sekob_DMT_01_01");	//Budeš mi muset pomoct. Ty postavy v černé kápi vpadly do mého domu.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_02");	//Vy, lidé z královské gardy, byste se měli postarat o to, aby se všichni měli dobře, ne?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_03");	//Vím, že vy žoldáci se moc o charitu nezajímáte, ale můžu ti zaplatit.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04");	//Budeš mi muset pomoct, vážený pane mágu.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04A");	//Vy, kluci z Bratrstva jste přece ochotní, ne jako ti tupí žoldáci a královští psi! Že mám pravdu?
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04B");	//Adanos s tebou!... Prosím, měj slitování!
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04C");	//(třesoucím hlasem)... Prosím tě, temný mágu!
	};
	AI_Output(self,other,"DIA_Sekob_DMT_01_05");	//Ti chlápkové říkali, že něco hledají. Ale určitě ne v mém domě.
	AI_Output(self,other,"DIA_Sekob_DMT_01_06");	//Prosím, pomoz mi. Zařiď, ať vypadnou.
	Log_CreateTopic(TOPIC_SekobDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SekobDMT,LOG_Running);
	B_LogEntry(TOPIC_SekobDMT,"Temní mágové vyhnali Sekoba z domu a já je mám teď vypudit.");
};


instance DIA_Sekob_DMTWEG(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 31;
	condition = DIA_Sekob_DMTWEG_Condition;
	information = DIA_Sekob_DMTWEG_Info;
	description = "Tvůj dům je prázdný. Černé kápě už vypadly.";
};


func int DIA_Sekob_DMTWEG_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Sekob_DMT) && Npc_IsDead(DMT_DementorAmbientSekob1) && Npc_IsDead(DMT_DementorAmbientSekob2) && Npc_IsDead(DMT_DementorAmbientSekob3) && Npc_IsDead(DMT_DementorAmbientSekob4))
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMTWEG_Info()
{
	AI_Output(other,self,"DIA_Sekob_DMTWEG_15_00");	//Tvůj dům je prázdný. Černé kápě už vypadly.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01");	//Věděl jsem, že na stráž se dá spolehnout.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_02");	//Udělal jsi pořádný kus práce. Onar může být rád, že má na své straně lidi jako ty.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_03");	//Díky, vážený pane mágu. Co by s námi bylo, kdybychom nad sebou neměli ochranou ruku církve?
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_04");	//Díky, příteli z bažin. Přece jenom se zdá, že jste dobří lidé!
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_05");	//Díky, vážený pane mágu. Co by s námi bylo, kdybychom nad sebou neměli ochranou ruku Adana?
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_06");	//Přijmi můj vděk, nekromante. Nikdy jsem si nemyslel, že služebníci Beliara by mohli konat dobro!
	};
	TOPIC_END_SekobDMT = TRUE;
	B_GivePlayerXP(XP_SekobDMTWEG);
	if(Kapitel < 5)
	{
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Obsessed");
	};
	if(Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		B_StartOtherRoutine(Rosi,"Start");
		B_StartOtherRoutine(Till,"Start");
	};
	B_StartOtherRoutine(Balthasar,"Start");
	B_StartOtherRoutine(BAU_933_Rega,"Start");
	B_StartOtherRoutine(BAU_934_Babera,"Start");
	B_StartOtherRoutine(BAU_937_Bauer,"Start");
	B_StartOtherRoutine(BAU_938_Bauer,"Start");
};


instance DIA_Sekob_BELOHNUNG(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 32;
	condition = DIA_Sekob_BELOHNUNG_Condition;
	information = DIA_Sekob_BELOHNUNG_Info;
	description = "Ne tak rychle, příteli.";
};


func int DIA_Sekob_BELOHNUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_DMTWEG) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_BELOHNUNG_Info()
{
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_00");	//Ne tak rychle, příteli.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU))
		{
			AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_01");	//Od teď už nebudeš konat své špinavé skutky, místo toho se budeš činit pro obecné blaho. Jinak si na tebe došlápnu.
		};
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_02");	//Nerozumím. Co ještě chceš?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_03");	//Něco jsi blábolil o odměně, ne? Nebo jsem jen slyšel trávu růst?
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_NDW) || (hero.guild == GIL_KDW) || (hero.guild == GIL_NDM) || (hero.guild == GIL_KDM))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_04");	//Zajímá mě jen jediná věc. Co chtěly ty černé kápě ve tvém domě?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_05");	//Sám si to nedokážu vysvětlit, vážený pane mágu. Snad...
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_06");	//Co?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_07");	//Je mi líto. Před několika lety jsem přísahal, že o tom nebudu mluvit, a nemám v úmyslu porušit své slovo.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_01_07A");	//Samozřejmě, my lidé z Bratrstva vždy přijdeme na pomoc, když je to potřeba. Ale jistě chápeš, každá služba dnes něco stojí...
	};
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_08");	//Jediné, co můžu udělat, je, že ti dám trochu zlata a požádám tě, abys mě ušetřil.
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_09");	//Tak to sem teda dej. Spěchám.
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_10");	//Tady.
	CreateInvItems(self,ItMi_Gold,250);
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_PERM(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 80;
	condition = DIA_Sekob_PERM_Condition;
	information = DIA_Sekob_PERM_Info;
	permanent = TRUE;
	description = "Stalo se tu mezitím něco?";
};

func int DIA_Sekob_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_BELOHNUNG) && (Kapitel >= 3) && (NpcObsessedByDMT_Sekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERM_Info()
{
	if((hero.guild == GIL_KDF) && (Kapitel >= 5))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Sekob_PERM_15_00");	//Stalo se tu mezitím něco?

		if(MIS_bringRosiBackToSekob == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_01");	//Vypadni.
		}
		else if(MIS_bringRosiBackToSekob == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_02");	//Ne. Nic zvláštního.
		}
		else if((Kapitel >= 5) && (MIS_bringRosiBackToSekob != LOG_SUCCESS) && (MIS_bringRosiBackToSekob != LOG_Running)) 
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_03");	//Moje žena zmizela. Nejdřív jsem tomu nevěnoval moc velkou pozornost, ale už se nevrátila.
			AI_Output(self,other,"DIA_Sekob_PERM_01_04");	//Nejspíš se schovala v lese, aby unikla polním škůdcům.
			AI_Output(self,other,"DIA_Sekob_PERM_01_05");	//Udělej mi laskavost, když ji najdeš, přiveď mi ji domů.
			MIS_bringRosiBackToSekob = LOG_Running;
			Log_CreateTopic(TOPIC_bringRosiBackToSekob,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_bringRosiBackToSekob,LOG_Running);
			B_LogEntry(TOPIC_bringRosiBackToSekob,"Sekobova žena Rosi zmizela a její muž by byl rád, kdyby mu ji někdo přivedl zpět.");
		}
		else
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_06");	//Nic, od té doby, co jsou ti ničemové v černé kápi nastěhovaní v mém domě.
		};
	};
};


instance DIA_Sekob_KAP4_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 999;
	condition = DIA_Sekob_KAP4_EXIT_Condition;
	information = DIA_Sekob_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_KAP5_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 999;
	condition = DIA_Sekob_KAP5_EXIT_Condition;
	information = DIA_Sekob_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Sekob_Heilung(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 55;
	condition = DIA_Sekob_Heilung_Condition;
	information = DIA_Sekob_Heilung_Info;
	permanent = TRUE;
	description = "Máš problém.";
};


func int DIA_Sekob_Heilung_Condition()
{
	if((NpcObsessedByDMT_Sekob == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && (Kapitel >= 5))
	{
		return TRUE;
	};
};


var int DIA_Sekob_Heilung_oneTime;

func void DIA_Sekob_Heilung_Info()
{
	AI_Output(other,self,"DIA_Sekob_Heilung_15_00");	//Máš problém.
	if(DIA_Sekob_Heilung_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_01");	//Jo, to teda mám. TY jsi můj problém, ty mizernej mágu. Vypadni, nebo z tebe stáhnu kůži zaživa.
		AI_Output(other,self,"DIA_Sekob_Heilung_15_02");	//(pro sebe) To je teda těžký případ.
		B_NpcClearObsessionByDMT(self);
		DIA_Sekob_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_03");	//Ty prostě neposlechneš, co?
		AI_Output(other,self,"DIA_Sekob_Heilung_15_04");	//(pro sebe) Beznadějný případ.
		B_NpcClearObsessionByDMT(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Sekob_ROSIBACKATSEKOB(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 53;
	condition = DIA_Sekob_ROSIBACKATSEKOB_Condition;
	information = DIA_Sekob_ROSIBACKATSEKOB_Info;
	description = "Přivedl jsem ti zpět tvou ženu.";
};

func int DIA_Sekob_ROSIBACKATSEKOB_Condition()
{
	if((Kapitel >= 5) && (hero.guild != GIL_KDF) && (Npc_GetDistToWP(Rosi,"NW_FARM4_SEKOB") < 3000) && (MIS_bringRosiBackToSekob == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Sekob_ROSIBACKATSEKOB_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Sekob_ROSIBACKATSEKOB_15_00");	//Přivedl jsem ti zpět tvou ženu.
	AI_Output(self,other,"DIA_Sekob_ROSIBACKATSEKOB_01_01");	//To je báječné. Tady, vezmi si to za svoji námahu.
	MIS_BringRosiBackToSekob = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BringRosiBackToSekob,LOG_SUCCESS);
	B_GiveInvItems(self,other,ItMi_Gold,650);
	Rosi.aivar[AIV_PARTYMEMBER] = FALSE;
	Till.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	B_NpcClearObsessionByDMT(self);
	B_StartOtherRoutine(Rosi,"Start");
	B_StartOtherRoutine(Till,"Start");
};

instance DIA_Sekob_ROSINEVERBACK(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 56;
	condition = DIA_Sekob_ROSINEVERBACK_Condition;
	information = DIA_Sekob_ROSINEVERBACK_Info;
	description = "Rosi už se k tobě nikdy nevrátí. Vzal jsem ji na bezpečné místo.";
};


func int DIA_Sekob_ROSINEVERBACK_Condition()
{
	if((MIS_bringRosiBackToSekob == LOG_OBSOLETE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sekob_ROSINEVERBACK_Info()
{
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_00");	//Rosi už se k tobě nikdy nevrátí. Vzal jsem ji na bezpečné místo.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_01");	//Bezpečné? Před kým?
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_02");	//Před tebou.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_03");	//Toho budeš litovat, ty grázle.
	B_NpcClearObsessionByDMT(self);
	B_GivePlayerXP(XP_Ambient);
	MIS_BringRosiBackToSekob = LOG_OBSOLETE;
	Log_SetTopicStatus(TOPIC_BringRosiBackToSekob,LOG_OBSOLETE);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Sekob_KAP6_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 999;
	condition = DIA_Sekob_KAP6_EXIT_Condition;
	information = DIA_Sekob_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Sekob_PICKPOCKET(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 900;
	condition = DIA_Sekob_PICKPOCKET_Condition;
	information = DIA_Sekob_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sekob_PICKPOCKET_Condition()
{
	return C_Beklauen(75,230);
};

func void DIA_Sekob_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sekob_PICKPOCKET);
	Info_AddChoice(DIA_Sekob_PICKPOCKET,Dialog_Back,DIA_Sekob_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sekob_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sekob_PICKPOCKET_DoIt);
};

func void DIA_Sekob_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sekob_PICKPOCKET);
};

func void DIA_Sekob_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sekob_PICKPOCKET);
};

