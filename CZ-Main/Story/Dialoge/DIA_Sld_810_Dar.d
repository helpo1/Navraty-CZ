
instance DIA_Dar_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_EXIT_Condition;
	information = DIA_Dar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_Hallo(C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_Hallo_Condition;
	information = DIA_Dar_Hallo_Info;
	permanent = FALSE;
	description = "Co to tu kouříš?";
};


func int DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Dar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Dar_Hallo_15_00");	//Co to tu kouříš?
	AI_Output(self,other,"DIA_Dar_Hallo_03_01");	//Chceš šluka?
	Info_ClearChoices(DIA_Dar_Hallo);
	Info_AddChoice(DIA_Dar_Hallo,"Ne.",DIA_Dar_Hallo_Nein);
	Info_AddChoice(DIA_Dar_Hallo,"Jasně!",DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_00");	//Jasně!
	CreateInvItem(other,ItMi_Joint);
	B_UseItem(other,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//Není špatná, co?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//Kde jsi tenhle matroš sehnal?
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//Mám své zdroje... (kření se)
	Info_ClearChoices(DIA_Dar_Hallo);
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Nein_15_00");	//Ne.
	Info_ClearChoices(DIA_Dar_Hallo);
};


var int Dar_einmal;

instance DIA_Dar_PERM(C_Info)
{
	npc = Sld_810_Dar;
	nr = 2;
	condition = DIA_Dar_PERM_Condition;
	information = DIA_Dar_PERM_Info;
	permanent = TRUE;
	description = "Děláš taky kromě hulení něco jinýho?";
};


func int DIA_Dar_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dar_PERM_Info()
{
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//Děláš taky kromě hulení něco jinýho?

	if((Dar_LostAgainstCipher == TRUE) && (Dar_einmal == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//(sarkasticky) Někdy se nechám zmlátit od několika pomstychtivých feťáků kvůli týhle trávě...
		Dar_einmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_02");	//V tuhle chvíli ne.
	};
};


instance DIA_Dar_WannaJoin(C_Info)
{
	npc = Sld_810_Dar;
	nr = 3;
	condition = DIA_Dar_WannaJoin_Condition;
	information = DIA_Dar_WannaJoin_Info;
	permanent = FALSE;
	description = "Chci se přidat k žoldákům. Bude ti to vadit?";
};


func int DIA_Dar_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_Hallo) && (other.guild == GIL_NONE) && (Dar_LostAgainstCipher == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dar_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//Chci se přidat k žoldákům. Bude ti to vadit?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//Je mi to jedno.
};


instance DIA_Dar_DuDieb(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_DuDieb_Condition;
	information = DIA_Dar_DuDieb_Info;
	permanent = FALSE;
	description = "Cipher mi řekl, že mu někdo ukradnul jeho balíček trávy...";
};


func int DIA_Dar_DuDieb_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dar_DuDieb_Info()
{
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//Cipher mi řekl, že mu někdo ukradnul jeho balíček trávy.
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//... (směje se)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//Nevíš o tom něco?
	AI_Output(self,other,"DIA_Dar_DuDieb_03_03");	//(velmi krátce) Ne.
	Dar_Verdacht = TRUE;
};


instance DIA_Dar_WoPaket(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_WoPaket_Condition;
	information = DIA_Dar_WoPaket_Info;
	permanent = TRUE;
	description = "Kde je ten balíček?";
};


func int DIA_Dar_WoPaket_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_DuDieb) && (Dar_Dieb == FALSE) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dar_WoPaket_Info()
{
	AI_Output(other,self,"DIA_Dar_WoPaket_15_00");	//(výhrůžně) Kde je ten balíček?

	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//Dobře, dobře, dobře. Prodal jsem ho nějakýmu pobudovi ve městě.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//Bylo to v přístavu. Nemůžu si vzpomenout, jak vypadal.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//Vypadá to, že potřebuješ další výprask?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//Upřímně, chlape, byl jsem totálně zfetovanej. Nemám nejmenší ponětí jak ten chlápek vypadal.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//Bylo to v přístavu blízko stavitelů lodí. To je všechno, na co si vzpomínám.
		Dar_Dieb = TRUE;
		B_LogEntry(Topic_CipherPaket,"Dar se přiznal, že balík s trávou ukradl on. Prodal ho v khoriniské přístavní čtvrti, hned vedle loďařovy dílny.");
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_06");	//Co já vím?
	};
};


instance DIA_Dar_AufsMaul(C_Info)
{
	npc = Sld_810_Dar;
	nr = 5;
	condition = DIA_Dar_AufsMaul_Condition;
	information = DIA_Dar_AufsMaul_Info;
	permanent = FALSE;
	description = "Já to z tebe vymlátím!";
};


func int DIA_Dar_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dar_DuDieb) && (Dar_Dieb == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Dar_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//Já to z tebe vymlátím!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//Klídek. Jsem moc zhulenej na to, abych s tebou bojoval!
	B_GiveInvItems(self,other,ItMi_Joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//Na, dej si nejdřív velkýho šluka!
};


instance DIA_Dar_Kameradenschwein(C_Info)
{
	npc = Sld_810_Dar;
	nr = 1;
	condition = DIA_Dar_Kameradenschwein_Condition;
	information = DIA_Dar_Kameradenschwein_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dar_Kameradenschwein_Condition()
{
	if(Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] = FALSE;
		return TRUE;
	};
};

func void DIA_Dar_Kameradenschwein_Info()
{
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//Kecale! Řekl jsi Cipherovi, že jsem mu vzal jeho trávu!
	if(Npc_KnowsInfo(other,DIA_Dar_WannaJoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_01");	//Nebudu pro tebe hlasovat.
	};
};


instance DIA_Dar_Pilztabak(C_Info)
{
	npc = Sld_810_Dar;
	nr = 6;
	condition = DIA_Dar_Pilztabak_Condition;
	information = DIA_Dar_Pilztabak_Info;
	permanent = FALSE;
	description = "Už jsi někdy balil tabák?";
};


func int DIA_Dar_Pilztabak_Condition()
{
	if(Npc_HasItems(other,ItMi_PilzTabak) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dar_Pilztabak_Info()
{
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//Už jsi někdy balil tabák?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//To zní zajímavě. Dej to sem.
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//Jasně, jdeme na to...
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//Už jsi někdy kouřil takovejhle materiálek?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//Ne...
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//Kouřil, nebo nekouřil?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//Nějak jsem se k tomu nedostal...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//Sakra!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//Svatý Rhobare!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//Tenhle matroš je dost krutej! Ani ho nezkoušej!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Dar_KAP3_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP3_EXIT_Condition;
	information = DIA_Dar_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP4_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP4_EXIT_Condition;
	information = DIA_Dar_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_ORCRING(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_ORCRING_Condition;
	information = DIA_Dar_ORCRING_Info;
	description = "Vypadá to, že tu chybí nějací žoldáci.";
};


func int DIA_Dar_ORCRING_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_ORCRING_Info()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//Vypadá to, že tu chybí nějací žoldáci.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//Jistě. To je pravda. Sylvio je na míle daleko a vzal půlku posádky s sebou.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//To je jedno. Mám alespoň lepší šanci stát se jedním z Leeových chlapců. Všechno, co potřebuju, je se porvat.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//Kdybych mohl dokázat, že jsem skutečně ostrej chlápek, možná bych se dokonce mohl stát jedním z Leeových tělesných strážců.
	Info_ClearChoices(DIA_Dar_ORCRING);
	Info_AddChoice(DIA_Dar_ORCRING,"To mě neznepokojuje.",DIA_Dar_ORCRING_no);
	Info_AddChoice(DIA_Dar_ORCRING,"Ostrej chlápek? Ty?",DIA_Dar_ORCRING_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		Info_AddChoice(DIA_Dar_ORCRING,"Co by to mělo být?",DIA_Dar_ORCRING_wie);
	};
};

func void DIA_Dar_ORCRING_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//Ostrej chlápek? Ty?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//(naštvaně) Oj, ale no tak, sklapni. Kdopak jsi ve skutečnosti?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//Nějakej nafoukanej trouba z města. Vy chcípáci nemáte nic, co byste mohli nabídnout.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//Jsi tu jenom pár dní a už máš takovýhle kecy.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//Koho si myslíš, že těma svejma blbejma magickýma kecama vystrašíš? Mě teda rozhodně ne.
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//Když o tom tak přemýšlím, rozbití tvojí lebky je přesně to, čím bych si mohl u Leeovým chlapců vysloužit ten správný respekt.
		Info_ClearChoices(DIA_Dar_ORCRING);
		Info_AddChoice(DIA_Dar_ORCRING,"Nemám čas na tyhle kecy.",DIA_Dar_ORCRING_necken_no);
		Info_AddChoice(DIA_Dar_ORCRING,"Fajn. Tak to zkus.",DIA_Dar_ORCRING_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//Tak počkej. Najdu si způsob, jak udělat na Leeho dojem.
	};
};


var int Dar_FightAgainstPaladin;

func void DIA_Dar_ORCRING_necken_schlagen()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//Fajn. Tak to zkus.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//Ooch, nemůžu se dočkat.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Dar_ORCRING_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//Nemám čas na tyhle kecy.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//Jo, jasně. Zapomněl jsem, rytíř spravedlnosti bez bázně a hany. To je zlý. Myslel jsem, že máš víc kuráže.
	AI_StopProcessInfos(self);
};

func void DIA_Dar_ORCRING_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//Co by to mělo být?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//Nevím přesně. Nějaká skřetí trofej by nebyla k zahození.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//Třeba odznak od vůdce skřetů nebo něco takového. Prapor, prsten, nebo tak něco.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//S ničím menším tady prorazit nejde. To je zřejmé.
	Log_CreateTopic(TOPIC_Dar_BringOrcEliteRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing,LOG_Running);
	B_LogEntry(TOPIC_Dar_BringOrcEliteRing,"Dar to chce někam mezi žoldáky dotáhnout, a k tomu potřebuje nějakou skřetí trofej. Praporec, nárameník, prsten nebo něco takového.");
	MIS_Dar_BringOrcEliteRing = LOG_Running;
	Info_ClearChoices(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//To mě neznepokojuje.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//(naštvaně) Samozřejmě, že ne. To by mě ohromilo.
	Info_ClearChoices(DIA_Dar_ORCRING);
};


instance DIA_Dar_FIGHTAGAINSTPALOVER(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	information = DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important = TRUE;
};


func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition()
{
	if((Dar_FightAgainstPaladin == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info()
{
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//Jasně, vím, že Lee nebude úplně nadšenej, když se v tom s tebou budu zase angažovat.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//Nechci si tu nikoho znepřátelit, tak na ten nesmysl prostě zapomeňme, jo?
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Dar_BRINGORCELITERING(C_Info)
{
	npc = Sld_810_Dar;
	nr = 4;
	condition = DIA_Dar_BRINGORCELITERING_Condition;
	information = DIA_Dar_BRINGORCELITERING_Info;
	description = "Mám tu skřetí trofej, jak jsi chtěl.";
};


func int DIA_Dar_BRINGORCELITERING_Condition()
{
	if((MIS_Dar_BringOrcEliteRing == LOG_Running) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)) && Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};

func void DIA_Dar_BRINGORCELITERING_Info()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//Mám tu skřetí trofej, jak jsi chtěl.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//Cos mi to přinesl?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//Prsten skřetího vojevůdce.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//Fíha, no když je to tak... Co za to chceš?
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Co mi můžeš nabídnout?",DIA_Dar_BRINGORCELITERING_was);

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Dej mi nějaké zlato.",DIA_Dar_BRINGORCELITERING_geld);
	};
};

func void DIA_Dar_BRINGORCELITERING_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//Dej mi nějaké zlato.

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//Hmm... Třeba 60 zlatých?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//Kolik že?
	};

	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//No dobře, dám ti za to 120 zlatých.

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//Buď ber, nebo si ten prsten nech.
	};

	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"To nestačí.",DIA_Dar_BRINGORCELITERING_geld_no);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Dojednáno - tady je.",DIA_Dar_BRINGORCELITERING_geld_ok);
};

func void DIA_Dar_BRINGORCELITERING_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//Dojednáno - tady je.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//Díky, už se nemůžu dočkat, co na to řeknou ostatní.
	CreateInvItems(self,ItMi_Gold,120);
	B_GiveInvItems(self,other,ItMi_Gold,120);
	B_GivePlayerXP(200);
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//To nestačí.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//A já zase myslím, že je to nějak moc. Bez urážky, tahle záležitost se mi zdá nějak podezřelá.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//Co mi můžeš nabídnout?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//Buď si vezmi peníze, nebo tenhle amulet, který jsem... no, řekněme že jsem ho před časem nějak získal.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//Zvyšuje obratnost, sám jsem to vyzkoušel.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Dej mi nějaké zlato.",DIA_Dar_BRINGORCELITERING_geld);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Dej mi ten amulet.",DIA_Dar_BRINGORCELITERING_was_am);
};

func void DIA_Dar_BRINGORCELITERING_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//Dej mi ten amulet.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//Jasňačka, jen si ho užij. A teď naval ten prsten.
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	CreateInvItems(self,ItAm_Dex_01,1);
	B_GiveInvItems(self,other,ItAm_Dex_01,1);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//Dej mi nějaké zlato.
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};


instance DIA_Dar_KAP5_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP5_EXIT_Condition;
	information = DIA_Dar_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_KAP6_EXIT(C_Info)
{
	npc = Sld_810_Dar;
	nr = 999;
	condition = DIA_Dar_KAP6_EXIT_Condition;
	information = DIA_Dar_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dar_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dar_PICKPOCKET(C_Info)
{
	npc = Sld_810_Dar;
	nr = 900;
	condition = DIA_Dar_PICKPOCKET_Condition;
	information = DIA_Dar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Dar_PICKPOCKET_Condition()
{
	return C_Beklauen(67,35);
};

func void DIA_Dar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
	Info_AddChoice(DIA_Dar_PICKPOCKET,Dialog_Back,DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

