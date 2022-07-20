
instance DIA_Addon_Quarhodron_EXIT(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 999;
	condition = DIA_Addon_Quarhodron_EXIT_Condition;
	information = DIA_Addon_Quarhodron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Quarhodron_Hello(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_Hello_Condition;
	information = DIA_Addon_Quarhodron_Hello_Info;
	important = TRUE;
	permanent = TRUE;
};

var int DIA_Addon_Quarhodron_Hello_NoPerm;

func int DIA_Addon_Quarhodron_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Addon_Quarhodron_Hello_NoPerm == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Quarhodron_Hello_Info()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_00");	//Proč rušíš můj klid, Strážce?
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_01");	//Řekni mi, co chceš?
		Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Co se skrývá v Adanově chrámu?",DIA_Addon_Quarhodron_Hello_schwert);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Někdo vstoupil do Adanova chrámu.",DIA_Addon_Quarhodron_Hello_raven);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Uděl mi vstup do Adanova chrámu.",DIA_Addon_Quarhodron_Hello_tempel);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Země je rozbita zemětřeseními.",DIA_Addon_Quarhodron_Hello_erdbeben);
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems(hero,ItWr_Addon_SUMMONANCIENTGHOST,1);
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_02");	//Bengla anthani, Osiri?
		B_Say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_03");	//Bengla anthani?
		AI_StopProcessInfos(self);
	};
};


var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;

func void B_Quarhodron_Hello_KommZumPunkt()
{
	if((DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3) && (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE))
	{
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Něco od tebe potřebuji.",DIA_Addon_Quarhodron_Hello_frech);
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_erdbeben_15_00");	//Země je rozbita zemětřeseními. Pokud nic neuděláme, celý ostrov se potopí.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_01");	//Tady není nic, co bychom mohli udělat.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_02");	//Adanův hněv přišel na Jharkendar, aby ztrestal bezvěrce.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_raven()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_00");	//Někdo vstoupil do Adanova chrámu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_raven_11_01");	//Nesmysl. Sám jsem zapečetil vstup. Je nemožné se dostat dovnitř.
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_02");	//Vskutku?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_tempel()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_tempel_15_00");	//Uděl mi vstup do Adanova chrámu.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_tempel_11_01");	//Chrám zůstane uzavřen navěky, jak rada nařídila.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_schwert()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_schwert_15_00");	//Co se skrývá v Adanově chrámu?
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_schwert_11_01");	//Můj největší zármutek, má největší zklamání.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_frech()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_frech_15_00");	//Něco od tebe potřebuji.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_01");	//Muž s tvým postavením by se mnou neměl takto mluvit.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_02");	//Nemohu se zbavit pocitu, že nejsi ten, za koho se vydáváš.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_03");	//Jestli chceš mou pomoc, budeš muset prvně zodpovědět několik otázek.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_04");	//Odpovědí na mé otázky mě ujistíš, že neodhaluji svá tajemství někomu cizímu.
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Quarhodron mi pomůže poté, co zodpovím nějaké obtížné otázky. Musím je zodpovědět správně, aby mi pomohl.");
	Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
};


instance DIA_Addon_Quarhodron_Fragen(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_Fragen_Condition;
	information = DIA_Addon_Quarhodron_Fragen_Info;
	permanent = TRUE;
	description = "Ptej se!";
};


func int DIA_Addon_Quarhodron_Fragen_Condition()
{
	if(QuarhodronIstZufrieden == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};


var int Quarhodrons_NextQuestion;
var int QuarhodronIstZufrieden;
var int Quarhodrons_RichtigeAntworten;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed()
{
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_00");	//Tvé odpovědi jsou chybné jako tvé záměry.
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_01");	//Nepomůžu ti.
	AI_StopProcessInfos(self);
};

func void B_Quarhodron_Fragen_Choices()
{
	Log_AddEntry(TOPIC_Addon_Quarhodron," --- QUARHODRONOVY OTÁZKY --- ");
	if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else if((Quarhodrons_NextQuestion == 1) && (Quarhodrons_RichtigeAntworten == 0))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_00");	//Nevěřím ti.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_01");	//Myslím, že by ses měl vrátit, jakmile se rozhodneš mluvit pravdu.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Quarhodrons_NextQuestion == 1)
		{
			if(B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_02");	//(přemýšlivě) Schopnost Strážce smrti ti dovolila probudit mě, není-li pravda.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_03");	//Jestli jsi ten, za koho se vydáváš, měl bys být schopen zodpovědět všechny mé otázky.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Add_11_00");	//Až na jednu...
				B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
			};
			Quarhodrons_NextQuestion = 2;
		};
		if(Quarhodrons_NextQuestion == 7)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_04");	//Kdo zapečetil portál, který chránil svět před zlem?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo zapečetil portál, který chránil svět před zlem? --- ");
			Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
		}
		else if(Quarhodrons_NextQuestion == 6)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_05");	//Kdo ulehčuje utrpení zraněných a ošetřuje nemocné?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo ulehčuje utrpení zraněných a ošetřuje nemocné? --- ");
			Quarhodrons_NextQuestion = 7;
		}
		else if(Quarhodrons_NextQuestion == 5)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_06");	//Kdo má konečné slovo v radě pěti?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo má konečné slovo v radě pěti? --- ");
			Quarhodrons_NextQuestion = 6;
		}
		else if(Quarhodrons_NextQuestion == 4)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_07");	//Kdo je zodpovědný za zlo, které nás přepadlo?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo je zodpovědný za zlo, které nás přepadlo? --- ");
			Quarhodrons_NextQuestion = 5;
		}
		else if(Quarhodrons_NextQuestion == 3)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_08");	//Kdo mi může dát přímý rozkaz?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo mi může dát přímý rozkaz? --- ");
			Quarhodrons_NextQuestion = 4;
		}
		else if(Quarhodrons_NextQuestion == 2)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_09");	//Kdo kdysi chránil lid Jharkendaru před nepřátelskými útoky?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Kdo kdysi chránil lid Jharkendaru před nepřátelskými útoky? --- ");
			Quarhodrons_NextQuestion = 3;
		};
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
		if(Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"To nevím.",DIA_Addon_Quarhodron_Fragen_NoPlan);
		}
		else
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Nevím.",DIA_Addon_Quarhodron_Fragen_NoPlan);
		};
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Učenci.",DIA_Addon_Quarhodron_Fragen_gele);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Strážci smrti.",DIA_Addon_Quarhodron_Fragen_totenw);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Kněží.",DIA_Addon_Quarhodron_Fragen_prie);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Válečnická kasta.",DIA_Addon_Quarhodron_Fragen_warr);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Léčitelé.",DIA_Addon_Quarhodron_Fragen_heiler);
	};
};


var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info()
{
	Quarhodrons_NextQuestion = 0;
	Quarhodrons_RichtigeAntworten = 0;
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_15_00");	//Ptej se!
	if(DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_01");	//Já jsem Quarhodron, bývalý válečník Jharkendaru.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_02");	//Probudil jsi mne.
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_03");	//Ke které kastě jsi patřil?
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//Válečnická kasta.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 3)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	if(Quarhodrons_NextQuestion == 5)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_prie()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//Kněží.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 4)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_gele()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_gele_15_00");	//Učenci.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 6)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_totenw()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_totenw_15_00");	//K Strážcům smrti.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_heiler()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_heiler_15_00");	//Léčitelé.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 7)
	{
		Quarhodrons_RichtigeAntworten = Quarhodrons_RichtigeAntworten + 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_NoPlan()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_NoPlan_15_00");	//Nevím.
	if((Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt) && (Quarhodrons_RichtigeAntworten >= 6))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_01");	//Dobře, věřím ti a poskytnu ti svou pomoc.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
	}
	else if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_02");	//Pak neplýtvej mým časem.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Quarhodron_GibMirKey(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_GibMirKey_Condition;
	information = DIA_Addon_Quarhodron_GibMirKey_Info;
	description = "(požaduj klíč od chrámu)";
};


func int DIA_Addon_Quarhodron_GibMirKey_Condition()
{
	if(QuarhodronIstZufrieden == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Quarhodron_GibMirKey_Info()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_00");	//Slyš, někdo se dostal svou vlastní mocí do Adanova chrámu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_01");	//Jestli mi nepomůžeš dostat se dovnitř, pak bude pravděpodobně příliš pozdě a vše navždy skončí.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_02");	//To nemůže být pravda! Nejvyšší kněz KHARDIMON a JÁ jsme jediní v JHARKENDARU, kteří ví, jak otevřít portál v Adanově chrámu.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_03");	//Dobrá. Zdá se, že tvůj přítel KHARDIMON asi povídal.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_04");	//Říkám, že brána je otevřena. Viděl jsem to na vlastní oči!
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_05");	//Dobrá, v tvém hlasu je slyšet pravda. Nebudu déle pochybovat o tvých slovech.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//Doufám v to.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_07");	//Přijmi nyní slova, která ti umožní vstup. Jsou napsána na kamenné tabulce. Řekni slova před zavřenými dveřmi chrámu a měly by se otevřít.
	CreateInvItems(self,ItMi_TempelTorKey,1);
	B_GiveInvItems(self,other,ItMi_TempelTorKey,1);
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_08");	//Můj čas je u konce, už ti déle nemohu být nápomocen.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_09");	//Ale opatrně. Mysli na Adanovy komnaty. Nebo to bude tvá jistá smrt.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_10");	//Počkej! CO JSOU tyto Adanovy komnaty?
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_11");	//Moje síly jsou u konce. Sbohem. Opět se setkáme v zemi mrtvých...
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Quarhodron mi dal kamennou tabulku, která otevírá bránu v Adanově chrámu.");
	Log_CreateTopic(TOPIC_Addon_Kammern,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry_Quiet(TOPIC_Addon_Kammern,"Quarhodron zmínil 'Adanovy komnaty' a říkal, že bych měl být opatrný. Musím zjistit co to znamená, protože nechci skončit v pasti.");
	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};

//---------------------------------zloy Kuarkhodron---------------------


instance DIA_NONE_ADDON_1158_Quarhodron_EXIT(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 999;
	condition = DIA_NONE_ADDON_1158_Quarhodron_EXIT_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_ADDON_1158_Quarhodron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_ADDON_1158_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_ADDON_1158_Quarhodron_Hello(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 5;
	condition = DIA_NONE_ADDON_1158_Quarhodron_Hello_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_Hello_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_NONE_ADDON_1158_Quarhodron_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_Hello_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_Hello_01_00");	//Zase ty... Co chceš?
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_Hello_01_01");	//Potřebuji s tebou mluvit.
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_Hello_01_02");	//Přišel jsi pro nic! Tady tě čeká jenom smrt...
};

instance DIA_NONE_ADDON_1158_Quarhodron_Why(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 5;
	condition = DIA_NONE_ADDON_1158_Quarhodron_Why_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_Why_Info;
	permanent = FALSE;
	description = "Takže ty jsi vůdce této kopy nemrtvých?";
};

func int DIA_NONE_ADDON_1158_Quarhodron_Why_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_ADDON_1158_Quarhodron_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_Why_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_00");	//Takže ty jsi vůdce všech těch nemrtvých?
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_01");	//Já jsem velký generál předků... A tohle jsou mí válečníci. Všichni ti, kteří mi sloužili za života.
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_02");	//Nechápu... Nač tohle všechno?
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_03");	//Všichni živí si zaslouží smrt! Za znesvěcení této Adanovy země Beliarem.
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_04");	//Všichni zaplatí svými životy za znesvěcování a ničení starověkých svatyní.
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_05");	//To oni jsou zodpovědní za toto prokletí na mém lidu, která nám nedá pokoje po mnoho staletí.
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_06");	//Za toto všichni zemřou! Nikdo neunikne Adanově spravedlnosti! (chladně) A já, Quarhodron, se o to postarám.
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_07");	//Ale to bylo už hodně dávno! A ten, který znesvětil starobylý chrám v Jharkendaru, je už dávno po smrti.
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_08");	//Zbytek lidí je nevinný.
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_Why_01_09");	//Na tom nezáleží... Zaslouží si dostat lekci! A také ji dostanou. Nikdo mě nezastaví!
};

instance DIA_NONE_ADDON_1158_Quarhodron_GoBack(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 5;
	condition = DIA_NONE_ADDON_1158_Quarhodron_GoBack_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_GoBack_Info;
	permanent = FALSE;
	description = "Ale Adanos tvým lidem odpustil!";
};

func int DIA_NONE_ADDON_1158_Quarhodron_GoBack_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_ADDON_1158_Quarhodron_Why) == TRUE) && (MIS_CurseAncient == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBack_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_GoBack_01_00");	//Ale Adanos tvým lidem odpustil!
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_GoBack_01_01");	//Tím myslíš, že kletba už nám nehrozí?
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_GoBack_01_02");	//Ano! Už nemusíte s nikým bojovat.
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_GoBack_01_03");	//To nemůže být... Lžeš! To by nikdo nedokázal.
};

instance DIA_NONE_ADDON_1158_Quarhodron_GoBackNow(C_Info)
{
	npc = NONE_ADDON_1158_Quarhodron;
	nr = 5;
	condition = DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Condition;
	information = DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Info;
	permanent = TRUE;
	description = "Pošli své muže tam odkud přišli!";
};

func int DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_ADDON_1158_Quarhodron_GoBack) == TRUE) && (KvarhBattle == FALSE) && (KvarhPeace == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_01_00");	//Pošli své muže tam odkud přišli!
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_01_01");	//Kdo jsi ty, abys mi něco přikazoval? Mě! Velkému Quarhodronovi!
	Info_ClearChoices(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow);
	Info_AddChoice(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow,"Promyslím si to.",DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_NoIdea);
	Info_AddChoice(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow,"Protože jinak tě zabiju.",DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle);

	if(CrownIsUp == TRUE)
	{
		Info_AddChoice(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow,"Ve jménu Adana! Běž zpátky nebo zemři...",DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace);
	};
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_NoIdea()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_NoIdea_01_00");	//Přemyslím si to.
	Info_ClearChoices(DIA_NONE_ADDON_1158_Quarhodron_GoBackNow);
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle_01_00");	//Dělej co jsem řekl - jinak tě zabiju.
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle_01_01");	//Hlupáku! Pak je čas zemřít!
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Battle_01_02");	//Nikdo nemůže vzdorovat vůli Adana! Ani ty ne.
	B_LogEntry(TOPIC_JarCurse,"Jediná možnost jak poslat Quarhodrona zpátky tam, odkud přišel, je porazit ho.");	
	KvarhBattle = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_MagicUser] = FALSE;
	B_Attack(self,other,AR_NONE,0);
};

func void DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace()
{
	B_GivePlayerXP(5000);
	Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_00");	//Ve jménu Adana! Běž zpátky nebo zemři...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_01");	//To nemůže být... Kdo jsi?
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_02");	//Jsem jedním z Adanových vyvolených.
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_03");	//A říkám ti - vrať se zpátky nebo tě potrestá.
	AI_Output(other,self,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_04");	//A už nikdy nenajdeš pokoj v tomhle světě nebo jiném.
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_05");	//Dobrá. Nenecháváš mi jinou možnost...
	AI_Output(self,other,"DIA_NONE_ADDON_1158_Quarhodron_GoBackNow_Peace_01_06");	//Pokud je tohle vůle Adana, tak poslechnu...
	KvarhPeace = TRUE;
	MIS_JarCurse = LOG_Success;
	Log_SetTopicStatus(TOPIC_JarCurse,LOG_Success);
	B_LogEntry(Topic_JarCurse,"Díky Adanovi jsem byl schopen Quarhodrona přesvědčit, aby zastavil svou armádu nemrtvých. Údolí je nyní bezpečné.");
	AI_StopProcessInfos(self);
	B_RemoveMonster(Ancient_Warrior_Q1);
	B_RemoveMonster(Ancient_Warrior_Q2);
	B_RemoveMonster(Ancient_Warrior_Q3);
	B_RemoveMonster(Ancient_Warrior_Q4);
	B_RemoveMonster(Ancient_Warrior_Q5);
	B_RemoveMonster(Ancient_Warrior_Q6);
	B_RemoveMonster(Ancient_Warrior_Q7);
	B_RemoveMonster(Ancient_Warrior_Q8);
	B_RemoveMonster(Ancient_Warrior_Q9);
	B_RemoveNpcQuarh(Ancient_Warrior_QT1);
	B_RemoveNpcQuarh(Ancient_Warrior_QT2);
	B_RemoveNpcQuarh(Ancient_Warrior_QT3);
	B_RemoveNpcQuarh(Ancient_Warrior_QT4);
	B_RemoveNpcQuarh(Ancient_Warrior_QT5);
	B_RemoveNpcQuarh(Ancient_Warrior_QT6);
	B_RemoveNpcQuarh(Ancient_Warrior_QT7);
	B_RemoveNpcQuarh(Ancient_Warrior_QT8);
	B_RemoveNpcQuarh(Ancient_Warrior_QT9);
	B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q1);
	B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q2);
	B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q3);
	B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q4);
	B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q5);
	B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q6);
	B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q7);
	B_RemoveMonster(SKELETON_WARRIOR_AV_ELITE_Q8);
	B_RemoveMonster(SKELETON_WARRIOR_AV_Q1);
	B_RemoveMonster(SKELETON_WARRIOR_AV_Q2);
	B_RemoveMonster(SKELETON_WARRIOR_AV_Q3);
	B_RemoveMonster(SKELETON_WARRIOR_AV_Q4);
	B_RemoveMonster(SKELETON_WARRIOR_AV_Q5);
	B_RemoveMonster(SKELETON_WARRIOR_AV_Q6);
	B_RemoveMonster(SKELETON_WARRIOR_AV_Q7);
	B_RemoveMonster(SKELETON_WARRIOR_AV_Q8);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q1);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q2);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q3);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q4);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q5);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q6);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q7);
	B_RemoveMonster(Skeleton_Mage_AV_Elite_Q8);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q1);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q2);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q3);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q4);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q5);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q6);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q7);
	B_RemoveMonster(Skeleton_Shadow_Priest_Q8);
};
