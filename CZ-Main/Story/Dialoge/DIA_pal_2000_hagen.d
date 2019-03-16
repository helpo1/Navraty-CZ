
instance DIA_PAL_2000_HAGEN_EXIT(C_Info)
{
	npc = pal_2000_hagen;
	nr = 999;
	condition = dia_pal_2000_hagen_exit_condition;
	information = dia_pal_2000_hagen_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2000_hagen_exit_condition()
{
	return TRUE;
};

func void dia_pal_2000_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2000_HAGEN_TEACH(C_Info)
{
	npc = pal_2000_hagen;
	nr = 100;
	condition = dia_pal_2000_hagen_teach_condition;
	information = dia_pal_2000_hagen_teach_info;
	permanent = TRUE;
	description = "Pojďme cvičit.";
};


func int dia_pal_2000_hagen_teach_condition()
{
	if((LordHagen_Teach2H == TRUE) && (DIA_Hagen_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_teach_info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Pojďme cvičit.
	Info_ClearChoices(dia_pal_2000_hagen_teach);
	Info_AddChoice(dia_pal_2000_hagen_teach,Dialog_Back,dia_pal_2000_hagen_teach_back);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_pal_2000_hagen_teach_2h_1);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_pal_2000_hagen_teach_2h_5);
};

func void dia_pal_2000_hagen_teach_back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//Jsi zkušený šermíř. Už tě nic nedokážu naučit.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//Nechť tvé další skutky provádí moudrost mistra meče.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices(dia_pal_2000_hagen_teach);
};

func void dia_pal_2000_hagen_teach_2h_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_pal_2000_hagen_teach);
	Info_AddChoice(dia_pal_2000_hagen_teach,Dialog_Back,dia_pal_2000_hagen_teach_back);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_pal_2000_hagen_teach_2h_1);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_pal_2000_hagen_teach_2h_5);
};

func void dia_pal_2000_hagen_teach_2h_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_pal_2000_hagen_teach);
	Info_AddChoice(dia_pal_2000_hagen_teach,Dialog_Back,dia_pal_2000_hagen_teach_back);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_pal_2000_hagen_teach_2h_1);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_pal_2000_hagen_teach_2h_5);
};


instance DIA_PAL_2000_HAGEN_WARSTART(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_warstart_condition;
	information = dia_pal_2000_hagen_warstart_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_2000_hagen_warstart_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_warstart_info()
{
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_00");	//Ty? Hmm... (překvapeně) Už jsem ani nedoufal, že tě ještě někdy uvidím!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_01");	//Zejména poté, co jsi přímo pod mým nosem odplaval s naší jedinou lodí! (nahněvaně) Nebo si myslíš, že o tom snad nevím?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_WarStart_01_02");	//Teď není zrovna nejlepší doba to řešit.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_03");	//Ano?! (nahněvaně) Myslíš? A proč asi?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_WarStart_01_04");	//Protože Khorinis napadli skřeti!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_WarStart_01_05");	//A zdá se mi, že to je teď nejdůležitější věc, nad kterou bys měl přemýšlet.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_06");	//Jo, to jo... Prašiví skřeti! Ty zatracené stvůry zaplavili téměř celé údolí.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_WarStart_01_07");	//Přesně tak. Je třeba s tím něco udělat.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_08");	//Hmmm... (zamyšleně) No dobrá! O těch naších záležitostech si promluvíme později. Ale nezapomenu na to, to si piš!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_09");	//Teď mi řekni, co tě ke mně přivádí?
};


instance DIA_PAL_2000_HAGEN_HIDDENORE(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_hiddenore_condition;
	information = dia_pal_2000_hagen_hiddenore_info;
	permanent = FALSE;
	description = "Mám pro tebe velmi důležitou zprávu.";
};


func int dia_pal_2000_hagen_hiddenore_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_warstart) && (Npc_HasItems(hero,itmi_seamaplostisland) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_hiddenore_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_00");	//Mám pro tebe velmi důležitou zprávu.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_01");	//Ano? (pyšně) A čeho se týká?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_03");	//Když jsme byli na moři, narazili jsme na pustý ostrov skrz-naskrz prolezlý ložisky magické rudy.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_04");	//Napadlo mě, že by o něm paladinové možná chtěli vědět.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_05");	//Co?! Myslíš to vážně? (překvapeně) To není možné!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_06");	//Veř mi, je to tak. Nalezli jsme magickou rudu. To byl taky jeden z důvodů, proč jsme se vrátili zpět.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_07");	//Neuvěřitelné! Ani jsem nevěřil, že by to bylo možné!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_08");	//Pokud to, co říkáš, je pravda, je to ta nejlepší zpráva, jakou jsem kdy slyšel!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_09");	//A dobré zprávy jsou poslední dobou velká vzácnost.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_12");	//Jak je ten ostrov daleko?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_13");	//Jen pár dní plavby od Khorinisu. Tady, podívej.
	B_GiveInvItems(other,self,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_14");	//Co je to?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_15");	//Námořní mapa. Můj kapitán tam udělal několik poznámek a vyznačil přesný kurz.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_16");	//Takže najít tento ostrov bude pro vás snadné jako facka.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_17");	//(pozorně) Velmi zajímavé!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_18");	//Podle téhle mapy jste na dosud neprozkoumané části oceánu našli kousek souše. Jak jste se tam dostali?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_19");	//Na cestě jsme se dostali velice silné bouře. To ona nás zavedla na ten ostrov.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_20");	//Ano. Cesty Innose jsou vskutku nevyzpytatelné.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_21");	//Jsem si jistý, že kdyby tak nechtěl On, rozhodně by se vám to nepodařilo.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_23");	//Dobrá. (vážně) Přijmi mé upřímné poděkování ve jménu celého našeho řádu!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_24");	//Doufám, že ta nalezená ruda pomůže králi ve válce proti skřetům.
	HAGENTAKESMAPSORE = TRUE;

	if(LIGOFORGOLD == TRUE)
	{
		Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
		Info_AddChoice(dia_pal_2000_hagen_hiddenore,"Ne tak rychle, paladine!",dia_pal_2000_hagen_hiddenore_gold);
	}
	else if(LIGOFORUNKNOWN == TRUE)
	{
		Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
		Info_AddChoice(dia_pal_2000_hagen_hiddenore,"Ne tak rychle, paladine!",dia_pal_2000_hagen_hiddenore_gold);
		Info_AddChoice(dia_pal_2000_hagen_hiddenore,"Samo sebou.",dia_pal_2000_hagen_hiddenore_nothing);
	}
	else if(LIGOFORFREE == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_25");	//Samo sebou.
	};
};

func void dia_pal_2000_hagen_hiddenore_gold()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_01");	//Ne tak rychle, paladine! Obávám se, že pouhá vděčnost je trochu málo.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_02");	//Cože? (překvapeně) Co tím chceš říct?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_03");	//Každá informace něco stojí. A takhle důležité ještě více.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_06");	//(pyšně) O, ano. Přirozeně! Bylo by mi divné, kdybys o tom nezačal.
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_07");	//I když, po pravdě řečeno, bych taková slova od paladina nečekal!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_08");	//I když, po pravdě řečeno, bych taková slova od ctihodného mága Ohně nečekal!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_09");	//I když, po pravdě řečeno, bych taková slova od ctihodného mága Vody nečekal!
	};
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_10");	//Podrobnosti vynech. Raději řekni - kolik si ochoten zaplatit?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_11");	//Hmm... Řekněme deset tisíc zlatých. Co říkáš?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_12");	//Beru. Doufám, že jsem neudělal špatný obchod.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_13");	//O tom rozhoduješ ty! Tady máš, vezmi si své zlato.
	B_GiveInvItems(self,other,ItMi_Gold,10000);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_14");	//Bylo mi potěšením s tebou obchodovat.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_15");	//(nespokojeně) Hmm...
	Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
};

func void dia_pal_2000_hagen_hiddenore_nothing()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Nothing_01_01");	//Samo sebou.
	Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
};


instance DIA_PAL_2000_HAGEN_TELLFROMPYROKAR(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_tellfrompyrokar_condition;
	information = dia_pal_2000_hagen_tellfrompyrokar_info;
	permanent = FALSE;
	description = "Posílá mě Pyrokar.";
};


func int dia_pal_2000_hagen_tellfrompyrokar_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_warstart) && (MIS_ORсGREATWAR == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_tellfrompyrokar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_00");	//Posílá mě Pyrokar.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_01");	//A co chce?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_02");	//Pro začátek chce zjistit, jak na tom jste. Jak velké byly ztráty?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_03");	//(s odporem) Zatímco on sám neví, jak na tom je.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_04");	//Ve městě jsem ztratil asi třetinu svých lidí, což rozhodně nedá nazvat dobrým vývojem událostí.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_05");	//A co ostatní?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_06");	//Všichni, co přežili tu melu, jsou zde.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_07");	//A pokud mám mluvit konkrétně, na můj rozkaz mě poslechne kolem padesáti válečníků. Možná o několik více.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_08");	//A jak je na tom jejich morálka?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_09");	//(výhrůžně) Pokud si myslíš, že ztratili odvahu, jsi na omylu.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_10");	//Jejich bojovnost je vysoká jako nikdy. A brzy se o tom sám přesvědčíš.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_11");	//Tak proč jste ještě pořád zde?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_12");	//Skřeti se už usadili v údolí a ničí vše, co jim přijde do cesty.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_13");	//Nebo se jenom bojíte otevřené bitvy?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_17");	//Na otevřenou bitvu máme moc málo lidí. Prostě nemáme sílu na to, abychom se s nimi utkali.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_18");	//A co budete dělat dál?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_19");	//Zřejmě tady zůstaneme. Musíme přeskupit armádu a pořádně se připravit na další boje.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_20");	//Azgan je navíc prakticky nepřístupný, takže jsme tady v bezpečí.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_21");	//Pokud se tyhle stvůry pokusí nás napadnout, jednou věcí si můžeš být jistý - na téhle pevnosti si vylámou zuby.
	B_LogEntry(TOPIC_ORсGREATWAR,"Poté, co v bitvě o Khorinis zemřela téměř třetina Hagenových paladinů, lord Hagen neplánuje okamžitý výpad proti skřetí invazi. Zatím je pro paladiny výhodnější zůstat v pevnosti. Azgan je téměř nedobytný a připraven odolávat jakýmkoli skřetím útokům.");
	TELLTOHAGENFORT = TRUE;
};


instance DIA_PAL_2000_HAGEN_MAYJOINOTHERS(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_mayjoinothers_condition;
	information = dia_pal_2000_hagen_mayjoinothers_info;
	permanent = FALSE;
	description = "Nemůžeme přece jen tak čekat!";
};


func int dia_pal_2000_hagen_mayjoinothers_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_tellfrompyrokar) && (MIS_ORсGREATWAR == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_mayjoinothers_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_00");	//Nemůžeme přece jen tak čekat!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_01");	//Dříve nebo později skřeti zmasakrují všechny v údolí a pak přijdou zde.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_03");	//To vím i bez tebe!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_04");	//Jak jsem řekl, mám moc málo lidí na to, abych otevřeně vyrazil proti takové hordě skřetů.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_05");	//Pak musíš najít další vojáky.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_06");	//Opravdu? (sarkasticky) A kde je navrhuješ asi tak hledat?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_07");	//Kde chceš sebrat byť jen půlstovku mužů dost odvážných a ochotných položit život kvůli iluzi vítězství?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_08");	//Ne, příteli, v téhle bitvě jsme zůstali sami. Nemůžeme čekat žádnou pomoc.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_09");	//A co žoldáci nebo sektáři z Bratrstva? Co kdybychom je požádali o pomoc?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_10");	//Cože?! Mám bojovat bok po boku se zločinci a uprchlými trestanci?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_11");	//Zbláznil ses? Nikdy nepřistoupím na to, abych vyjednával s těmihle... individui! To raději zemřu.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_12");	//Nikdy bych takhle nepotupil dobré jméno paladinů! Navíc, většině z nich se stejně nedá věřit.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_13");	//Vím, že paladinská čest je pro tebe všechno, ale ne v téhle situaci!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_15");	//Pořád tady postáváš a mluvíš o vaší 'cti', zatímco v údolí skřetí sekery stínají hlavy dalších nevinných lidí!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_16");	//(zmateně) Co... Co tím myslíš?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_17");	//Tvá povinnost královského paladina ti přikazuje chránit bezbranné a udělat vše pro jejich záchranu!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_21");	//Hmm... No... (neochotně) Máš pravdu.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_22");	//Asi jsem skutečně neměl být tak arogantní a pyšný. Radši jsem měl chránit životy králových poddaných.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_23");	//Jejich ochrana je naší svatou povinností. A nyní jsme jejich jedinou nadějí.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_25");	//Zřejmě bys opravdu měl jít požádat o pomoc všechny, co udrží zbraň.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_26");	//A takových, myslím, nebude v téhle době zrovna málo.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_27");	//Kromě toho, jestli ti 'zločinci', jak je nazýváš, nám budou chtít pomoct proti skřetem, zaslouží si naši úctu.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_28");	//Koneckonců mnoho z nich zřejmě zaplatí svým životem - a taková odvaha se cení.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_29");	//Dobře, dobře! Už jsi mě téměř přesvědčil. Potřebuji si to však celé ještě pořádně promyslet.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_30");	//Ale přemýšlej rychle, moc času nám nezbývá.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_31");	//Budu se snažit!
	B_LogEntry(TOPIC_ORсGREATWAR,"Po dlouhé diskuzi s lordem Hagenem se mi ho povedlo přesvědčit, že jediný možný způsob, jak porazit skřety, je shromáždit pod paladinským velením všechny, kteří mohou bojovat - žoldáky, sektáře i všechny ostatní. Vůdce paladinů si vyhradil čas na promyšlení tohoto návrhu, ale nepochybuji, že se nakonec rozhodne správně.");
};


instance DIA_PAL_2000_HAGEN_MAYJOINOTHERSAGREED(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_mayjoinothersagreed_condition;
	information = dia_pal_2000_hagen_mayjoinothersagreed_info;
	permanent = TRUE;
	description = "Tak už ses tedy rozhodl?";
};


func int dia_pal_2000_hagen_mayjoinothersagreed_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_mayjoinothers) && (HAGENOTHERSAGREED == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_mayjoinothersagreed_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_00");	//Tak už ses tedy rozhodl?
	if((MIS_RESCUEGAROND == LOG_SUCCESS) || (GARONDISBACK == TRUE))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_01");	//No... (zamyšleně) No dobrá, souhlasím s přijetím pomoci od žoldáků a kohokoliv dalšího, kdo může pomoct.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_02");	//Ale jen proto, že nemáme na výběr.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_03");	//Jsem si jistý, že ses rozhodl správně.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_04");	//To doufám. (vážně) Nechtěl bych litovat tohohle rozhodnutí. Stejně nebylo lehké.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_05");	//A co teď?
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_06");	//To se ptáš ty mě? Už jsem ti řekl všechno, co o tom vím a co si o tom myslím.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_07");	//Zbytek je teď na tobě.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_09");	//Nebo si myslíš, že budu osobně běhat po ostrově a prosit každého, ať vstoupí do paladinské armády?
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_10");	//Je už dost špatné, že se už brzo budu pravděpodobně muset prodírat zástupy kriminálníků a ostatních pokoutních živlů.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_11");	//Kromě toho, tenhle nápad jsi vymyslel ty - teď vymýšlej, co dál.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_12");	//Tak jo, něco vymyslím.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_13");	//Jen se s tím moc nezdržuj. Skřeti nám moc času na rozmyšlenou rozhodně nedají.
		ALLFRACTIONS = 6;
		HAGENOTHERSAGREED = TRUE;
		HAGENCOUNTSTIME = Wld_GetDay();
		B_LogEntry(TOPIC_ORсGREATWAR,"Lord Hagen souhlasil s mým návrhem svolat soubor dobrovolníků do armády paladinů. Uvidíme, jak se to povede.");
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_15");	//(nervózně) Ne, tak mě radši nerozčiluj!
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_16");	//Radši dělej, co jsem ti řekl a zjisti, co se stalo s Garondem.
		};
		AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_17");	//Jak myslíš.
	};
};


instance DIA_PAL_2000_HAGEN_ALREADYJOINOTHERSAGREED(C_Info)
{
	npc = pal_2000_hagen;
	nr = 1;
	condition = dia_pal_2000_hagen_alreadyjoinothersagreed_condition;
	information = dia_pal_2000_hagen_alreadyjoinothersagreed_info;
	permanent = TRUE;
	description = "Ohledně lidí, co nás podpoří...";
};


func int dia_pal_2000_hagen_alreadyjoinothersagreed_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (PREGATHERALLONBIGFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_01_00");	//Ohledně lidí, co nás podpoří...
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_01_01");	//Ano? (se zájmem) Máš nějaké novinky?
	Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_sldanswer) && (SLD_JOINHAGEN == TRUE) && (FRACTIONSLDJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Žoldáci budou bojovat na naší straně.",dia_pal_2000_hagen_alreadyjoinothersagreed_sld);
	};
	if((PIR_JOINHAGEN == TRUE) && (FRACTIONPIRJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Piráti souhlasili, že se připojí k armádě.",dia_pal_2000_hagen_alreadyjoinothersagreed_pir);
	};
	if((TPL_JOINHAGEN == TRUE) && (FRACTIONTPLJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Lidi ze Bratrstva jsou ochotni pomoct nám se skřety.",dia_pal_2000_hagen_alreadyjoinothersagreed_tpl);
	};
	if((HUN_JOINHAGEN == TRUE) && (FRACTIONHUNJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Lovci jsou taky s námi.",dia_pal_2000_hagen_alreadyjoinothersagreed_hun);
	};
	if((KDW_JOINHAGEN == TRUE) && (FRACTIONKDWJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Mágové Vody ochotně přijali naši nabídku.",dia_pal_2000_hagen_alreadyjoinothersagreed_kdw);
	};
	if((KDF_JOINHAGEN == TRUE) && (FRACTIONKDFJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Můžeš počítat i s pomocí mágů Ohně.",dia_pal_2000_hagen_alreadyjoinothersagreed_kdf);
	};
	Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Nic nového.",dia_pal_2000_hagen_alreadyjoinothersagreed_no);
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_sld()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_00");	//Žoldáci budou bojovat na naší straně.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_01");	//To už vím! (rozezleně) Máš nějaký důvod, proč mi to připomínáš?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_02");	//Jen tak.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_03");	//Nedělej ze mě idiota! Vždy si přesně pamatuji, co mi lidé řeknou.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_04");	//Dobře, jak říkáš.
	FRACTIONSLDJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_pir()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_00");	//Piráti souhlasili, že se připojí k armádě.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_01");	//Nemohu říct, že to rád slyším... (neochotně) Ale lepší než nic!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_02");	//I když, upřímně, raději bych je viděl na šibenici než pod svým velením.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_03");	//Povedlo se mi je přesvědčit. Přesněji, když jsi jim slíbil svou loď.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_04");	//No jo, vím! Dodržím svůj slib.
	FRACTIONPIRJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_tpl()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_00");	//Lidi ze Bratrstva jsou ochotni pomoct nám se skřety.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_01");	//Hmm... (překvapeně) Vážně? Popravdě jsem s nimi moc nepočítal!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_02");	//Vždycky jsem si myslel, že se nezajímají o to, co se děje kolem.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_03");	//Zřejmě jsem se tentokrát mýlil. Nu, možná je to takhle lepší.
	FRACTIONTPLJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_hun()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_00");	//Lovci jsou taky s námi.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_01");	//Lovci? Vždyť jsou to rolníci, ne vojáci! Začínáš pod naši vlajku svolávat i nevolníky, nebo co?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_02");	//Myslím, že lidi navíc se vždy hodí.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_03");	//Hmmm... (neochotně) No dobře! Doufám, že budou alespoň k něčemu dobří.
	FRACTIONHUNJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_kdw()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDW_01_00");	//Mágové Vody ochotně přijali naši nabídku.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDW_01_01");	//No, to je velmi dobrá zpráva! Jak znám Saturase, tak se nemohl rozhodnout jinak než nám pomoci.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDW_01_02");	//Bude mi velkou ctí bojovat bok po boku s tak šlechetným člověkem, jako je on.
	FRACTIONKDWJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_kdf()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_00");	//Můžeš počítat i s pomocí mágů Ohně.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_01");	//Tím jsem si byl od začátku jistý. (s respektem) Boj proti zlu je jejich svatou povinností k Innosovi.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_02");	//Jsem přesvědčen, že jejich znalosti a moudrost budou v našem boji proti skřetům neocenitelné.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_03");	//Samozřejmě.
	FRACTIONKDFJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_no()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_No_01_00");	//Nic nového.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_No_01_01");	//Tak proč plýtváš mým časem? (rozezlen) Měl bys raději jít dělat něco užitečného!
	Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
};


instance DIA_PAL_2000_HAGEN_DONEJOINOTHERSAGREED(C_Info)
{
	npc = pal_2000_hagen;
	nr = 1;
	condition = dia_pal_2000_hagen_donejoinothersagreed_condition;
	information = dia_pal_2000_hagen_donejoinothersagreed_info;
	permanent = FALSE;
	description = "Myslím, že to už jsou všichni, kdo by se mohl přidat.";
};


func int dia_pal_2000_hagen_donejoinothersagreed_condition()
{
	if(PREGATHERALLONBIGFARM == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_donejoinothersagreed_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_00");	//Myslím, že to už jsou všichni, kdo by se mohl přidat.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_01");	//No, není to špatné. Konečně máme dost lidí, abychom se mohli postavit skřetům. Už nemá význam déle čekat.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_02");	//Obzvlášť proto, že podle mých informací se již skřeti blíží k Onarově farmě a chtějí co nejdříve zaútočit.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_03");	//Pak musíme upozornit ostatní, že je čas vyrazit.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_04");	//Neměj obavy, postarám se o to. (vážně) Samozřejmě, kromě mágů Ohně. S tím by mohli být problémy.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_05");	//Proč?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_06");	//Pokud víme, klášter je pořád obklíčen a skřeti by zřejmě mého posla nepřivítali s otevřenou náručí.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_07");	//Myslím, že to zvládnu. Mám už nějaké zkušenosti s průniky do střežených oblastí.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_08");	//Dobrá, tak tedy jdi. Řekni Pyrokarovi, že zřídíme tábor nedaleko farmy a připomeň, ať si pospíší.
	B_LogEntry(TOPIC_ORсGREATWAR,"Lord Hagen je teď připraven vyrazit se svými lidmi z pevnosti. Musím okamžitě vyrazit do kláštera a informovat mágy Ohně.");
	HAGENNOMORETIMEWAIT = TRUE;
	OTH_JOINHAGEN = TRUE;
};


instance DIA_PAL_2000_HAGEN_RESCUEGAROND(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_rescuegarond_condition;
	information = dia_pal_2000_hagen_rescuegarond_info;
	permanent = FALSE;
	description = "Můžu nějak pomoct?";
};


func int dia_pal_2000_hagen_rescuegarond_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_mayjoinothers) && (GARONDISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_rescuegarond_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_01");	//Můžu nějak pomoct?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_02");	//Hmm... (zamyšleně) Možná bych pro tebe měl jednu důležitou misi.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_03");	//Ale, popravdě, bude zřejmě dost riskantní a nebezpečná.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_04");	//To zní zajímavě! O co jde?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_06");	//Ještě pořád nevíme, co se stalo s expedicí v Hornickém údolí.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_07");	//Garond se už dlouho neozval a já, upřímně, nevím, co si o tom mám myslet.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_08");	//Je možné, že už jsou všichni mrtví, ale možná ne. (vážně) A tahle nejistota je na mě moc.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_09");	//Proto chci, abys okamžitě vyrazil do údolí a prozkoumal situaci na hradě.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_10");	//Podle posledních informací jejich situace vypadala bledě.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_11");	//Skřeti se pokusili zaútočit, ale paladinové jejich útok odrazili.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_12");	//Nicméně to tak nemohlo jít věčně.
	};
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_13");	//V každém případě potřebuji vědět, co se stalo s mými lidmi, i když by už byli mrtví.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_14");	//No, pokusím se to zjistit.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_15");	//Tak jdi. A Innos tě provázej!
	MIS_RESCUEGAROND = LOG_Running;
	Log_CreateTopic(TOPIC_RESCUEGAROND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGAROND,LOG_Running);
	B_LogEntry(TOPIC_RESCUEGAROND,"Lord Hagen mi dal za úkol zjistit, co se stalo s výpravou v Hornickém údolí. Posledně, když od Garonda nedostal žádné zprávy, to neskončilo dobře. Chce vědět, co je s jeho lidmi.");
};


instance DIA_PAL_2000_HAGEN_HOWTHINGS(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_howthings_condition;
	information = dia_pal_2000_hagen_howthings_info;
	permanent = TRUE;
	description = "Jaká je situace v pevnosti?";
};


func int dia_pal_2000_hagen_howthings_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_mayjoinothers))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_howthings_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HowThings_01_01");	//Jaká je situace v pevnosti?
	if((PERMGARONDNEWS == FALSE) && (GARONDISBACK == TRUE))
	{
		B_GivePlayerXP(50);
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_02");	//Hmm... (nadšeně) O hodně lepší. Garondův návrat byl pro mnohé dobrým znamením do budoucna.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_HowThings_01_03");	//Myslíš to vážně?
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_04");	//Jistěže! Koneckonců, dostat se živý ven z údolí bylo již dříve téměř nemožné.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_06");	//Ale on to teď navzdory všemu - a díky tvé pomoci - dokázal.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_07");	//Kromě toho nesmíme zapomenout, že jeho malý oddíl celou tu dobu udržoval na uzdě celou armádu skřetů a bránil jim v postupu do vnitrozemí.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_08");	//A to je taky velmi důležité... (vážně) Obzvlášť v současné situaci.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_HowThings_01_09");	//Samo sebou.
		PERMGARONDNEWS = TRUE;
	}
	else if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_donejoinothersagreed))
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_16");	//Jako bys to sám nevěděl... (sarkasticky) Jdeme připravit pozice v Khorinisu a zřídit tábor blízko Onarovy farmy.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_17");	//Doufám, že to pro skřety bude překvapení! Přinejmenším se na to těším.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_14");	//Moc se toho poslední dobou nezměnilo.
	};
};


instance DIA_PAL_2000_HAGEN_RESCUEGARONDOTHERS(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_rescuegarondothers_condition;
	information = dia_pal_2000_hagen_rescuegarondothers_info;
	permanent = FALSE;
	description = "Poslal jsi už někoho obhlédnout situaci v údolí?";
};


func int dia_pal_2000_hagen_rescuegarondothers_condition()
{
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_rescuegarondothers_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_01");	//Poslal jsi už někoho obhlédnout situaci v údolí?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_02");	//Ano, už jsem tam poslal svého muže, ale ani od něj nemám zprávy.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_03");	//Eh... (sklesle) Bojím se, že skřeti ho nenechali zajít moc daleko. Doufám, že ještě žije!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_04");	//Jak se jmenoval?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_05");	//Nathan. Příjemný chlapík.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_06");	//Taky byl paladin?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_07");	//Samozřejmě! (usměvavě) Nikdo jiný by se na tak nebezpečný úkol dobrovolně nepřihlásil.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_08");	//Nathan byl jedním z lidí lorda Varuse, který se na expedici na tenhle ostrov nabídl jako dobrovolník.
	B_LogEntry(TOPIC_RESCUEGAROND,"Lord Hagen již poslal na misi do údolí paladina jménem Nathan. Ten se však už také neohlásil.");
};


instance DIA_PAL_2000_HAGEN_GARONDISBACK(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_garondisback_condition;
	information = dia_pal_2000_hagen_garondisback_info;
	permanent = FALSE;
	description = "Garond a jeho lidé se vrátili do pevnosti!";
};


func int dia_pal_2000_hagen_garondisback_condition()
{
	if(GARONDISBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_garondisback_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_GarondIsBack_01_01");	//Garond a jeho lidé se vrátili do pevnosti!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_GarondIsBack_01_02");	//To jsou opravdu skvělé zprávy. A rozhodně to posílí morálku a bojového ducha našich vojáků!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_GarondIsBack_01_03");	//Přijmi tedy za svoje zásluhy mou vděčnost a toto zlato. Zasloužil sis to!
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_GarondIsBack_01_04");	//Díky.
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		MIS_RESCUEGAROND = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_RESCUEGAROND,LOG_SUCCESS);
		B_LogEntry(TOPIC_RESCUEGAROND,"Garond a jeho lidé se vrátili do paladinské pevnosti. Myslím, že teď už lord Hagen musí souhlasit s mou nabídkou.");
	};
};


instance DIA_PAL_2000_HAGEN_PIRATENEEDSHIP(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_pirateneedship_condition;
	information = dia_pal_2000_hagen_pirateneedship_info;
	permanent = FALSE;
	description = "Piráti potřebují tvoji loď.";
};


func int dia_pal_2000_hagen_pirateneedship_condition()
{
	if(MIS_PIRATENEEDSHIP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_pirateneedship_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_01");	//Piráti potřebují tvoji loď.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_02");	//Jen pod touhle podmínkou se připojí k armádě.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_03");	//Dát jim moji loď? (nahněvaně) Co si o sobě sakra myslí?!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_04");	//To se radši nechám zajmout skřety!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_05");	//Ale jejich pomoc je pro nás nezbytná!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_06");	//Nakonec, pokud prohrajeme, ta loď ti bude stejně zbytečná.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_07");	//Máš pravdu! Ale nemůžu těm špinavým podvodníkům dát všechno, co si zamanou!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_08");	//Kdyby příště všichni chtěli mezi paladiny, taky bys to po mě chtěl?!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_09");	//To není až tak špatný nápad.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_10");	//Co?! (nahněvaně) Co tím myslíš? Ty ses snad zbláznil!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_11");	//Kdepak! Když z nich uděláš paladiny a dáš jim loď, tak nic neztratíš!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_12");	//Ale úřad paladina je posvátný! A jen ti, kdož jsou hodni téhle cti, se mohou stát paladiny.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_13");	//Možná už brzo paladinové žádnou čest mít nebudou.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_14");	//Všechny je totiž zmasakrují skřeti.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_15");	//Innosi! (sklesle) Proč mě tak těžce zkoušíš?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_16");	//Vidím, že již téměř souhlasíš. Nemám pravdu?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_17");	//Eh... (ztraceně) No dobrá! Dejme tomu, že jsi mě přesvědčil.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_18");	//Řekni jim, že jestli budou sloužit Innosově věci a připojí se k nám, dám jim svou loď.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_19");	//Innos mi odpusť tohle rozhodnutí.
	HAGENINVITEPIRATES = TRUE;
	B_LogEntry(TOPIC_PIRATENEEDSHIP,"Lord Hagen nechtěl ani slyšet o požadavcích pirátů, ale nakonec jsem ho přesvědčil ohledně nutnosti této dohody. Vyhradil si však, že piráti ho budou poslouchat do slova a do písmene.");
};


instance DIA_PAL_2000_HAGEN_SLDANSWER(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_sldanswer_condition;
	information = dia_pal_2000_hagen_sldanswer_info;
	permanent = FALSE;
	description = "Přináším odpověď od žoldáků.";
};


func int dia_pal_2000_hagen_sldanswer_condition()
{
	if(MIS_OREWEAPONSLD == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_sldanswer_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_01");	//Přináším odpověď od žoldáků.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_02");	//Hmm... (pochmurně) A co říkají?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_03");	//Lee souhlasil, že tě podpoří v boji proti skřetům.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_04");	//Nicméně chce, aby byli jeho žoldáci vyzbrojeni meči z magické rudy.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_05");	//Co?! Nechce náhodou trochu moc?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_06");	//Jeho lidi tak prý budou líp připraveni na boj. Zbytek je na tobě.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_07");	//Já to věděl... (nahněvaně) Jakmile jednou začneme vyjednávat s těmihle parchanty, okamžitě po nás budou chtít modré z nebe!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_08");	//Doufám, že víš, že jen královští paladinové mohou užívat zbraně z magické rudy. Proč bych měl tohle pravidlo porušit?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_09");	//Protože situace si to vyžaduje!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_10");	//Dobrá, řekněme... Ale i kdybych souhlasil, pořád nemám odkud vzít takový počet zbraní, abych tyhle lapky vyzbrojil.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_11");	//Pak je třeba je vykovat.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_12");	//A jak asi? Vždyť budu potřebovat spoustu magické rudy!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_13");	//A jediné místo, kde se pořád dá ruda kutat - Hornické údolí - ovládají skřeti.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_14");	//Jestli je magická ruda jediný problém, půjdu ji sehnat.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_15");	//Ty... Jaktěživ jsem se nesetkal s tak tvrdohlavým chlapem!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_16");	//Eh, tak dobře! Jestli sis tak jistý, ať je po tvém.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_17");	//Najdi rudu a vykovej tolik čepelí, kolik bude Lee potřebovat.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_18");	//Vezmi si tenhle svitek. Jsou na něm všechny instrukce na vykování takovéhle čepele.
	B_GiveInvItems(self,other,itwr_letteroresword,1);
	B_LogEntry(TOPIC_OREWEAPONSLD,"Po dlouhé diskuzi jsem přesvědčil lorda Hagena o potřebě vyzbrojit Leeho žoldáky čepelemi z magické rudy. Dal mi svitek, na kterém je zaznamenán postup kování těchhle posvátných zbraní. Na mě ještě zůstává najít dost magické rudy a zjistit, kolik čepelí Lee a jeho lidé potřebují.");
};

