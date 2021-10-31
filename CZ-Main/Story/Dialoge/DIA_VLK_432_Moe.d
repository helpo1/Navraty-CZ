
instance DIA_Moe_EXIT(C_Info)
{
	npc = VLK_432_Moe;
	nr = 999;
	condition = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Moe_PICKPOCKET(C_Info)
{
	npc = VLK_432_Moe;
	nr = 900;
	condition = DIA_Moe_PICKPOCKET_Condition;
	information = DIA_Moe_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Moe_PICKPOCKET_Condition()
{
	return C_Beklauen(25,30);
};

func void DIA_Moe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
	Info_AddChoice(DIA_Moe_PICKPOCKET,Dialog_Back,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Moe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
};

func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
};


instance DIA_Moe_Hallo(C_Info)
{
	npc = VLK_432_Moe;
	nr = 2;
	condition = DIA_Moe_Hallo_Condition;
	information = DIA_Moe_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Moe_Hallo_Condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Moe_Hallo_Info()
{
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//Hej ty, tebe neznám. Co tady chceš? Máš namířeno do krčmy?
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Ne, nemám namířeno do krčmy...",DIA_Moe_Hallo_Gehen);
	Info_AddChoice(DIA_Moe_Hallo,"Aha, takže tohle je místní nálevna...",DIA_Moe_Hallo_Witz);
	Info_AddChoice(DIA_Moe_Hallo,"Jo, vadí ti to?",DIA_Moe_Hallo_Reizen);
};

func void DIA_Moe_Hallo_Gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//Ne, nemám namířeno do krčmy...
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//Jo, to bych řekl. To je ale fuk - právě proto můžeme jít přímo k věci.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//Když už jsi tady, něco ti nabídnu. Dej mi 50 zlatých a můžeš jít dál.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//To je vstupné do krčmy.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Uvidíme, jestli si to samé myslí i domobrana.",DIA_Moe_Hallo_Miliz);
	Info_AddChoice(DIA_Moe_Hallo,"Na to zapomeň, nedostaneš ani měďák!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo,"No tak já ti teda zaplatím.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice(DIA_Moe_Hallo,"Ale já nechci jít do krčmy!",DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hallo_Kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//Ale já nechci jít do krčmy!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//Víš, dřív nebo později chce do krčmy každý. Takže když mi zaplatíš hned, budeš to mít pro příště z krku.
};

func void DIA_Moe_Hallo_Witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//Aha, tohle je přístavní nálevna? A já si myslel, že je to palác místodržícího!
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//Hele, nech si ty hloupé šprýmy, skrčku, nebo budeš brzo žvejkat dlažební kostky.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Chápu, budu ti muset dát pár přes držku!",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo,"Ty mě chceš dostat do maléru, co?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo,"Dám si jen jedno pivo.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice(DIA_Moe_Hallo,"Ale já nechci do krčmy!",DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hallo_Reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//Jo, vadí ti to?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//Jasně, že ano.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Chápu, budu ti muset dát pár přes držku!",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo,"Ty mě chceš dostat do maléru, co?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo,"Uklidni se, chci si dát jenom jedno pivo.",DIA_Moe_Hallo_Ruhig);
};

func void DIA_Moe_Hallo_Miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//Uvidíme, jestli si to samé myslí i domobrana...
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//(směje se) Nikdo z domobrany tady není. A víš proč?
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//Protože tady jsi v přístavní čtvrti, skrčku. Nikdo z domobrany se tu se mnou rvát nebude.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//Většinou jsou všichni zalezlí u 'Červené lucerny'. Tak vidíš - jsme tu jen my dva. (zlý úšklebek)
};

func void DIA_Moe_Hallo_Pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//Chápu. Než půjdu dál, budu tě muset stáhnout z kůže.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//Jen si to zkus, skrčku. Ukaž, co umíš!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//Ty mě chceš dostat do maléru, co?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//Jo, v tom, jak dostat někoho do maléru, jsem mistr. Takže se koukej bránit, skrčku!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//Uklidni se, chci si dát jenom jedno pivo.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//Fajn, ale vstupné tě bude stát 50 zlatých. (šklebí se)
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Na to zapomeň, nedostaneš ani měďák!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo,"No tak já ti teda zaplatím.",DIA_Moe_Hallo_Zahlen);
};

func void DIA_Moe_Hallo_Zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//No tak já ti teda zaplatím.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//Výborně. A když jsme to tak hezky vyřešili, teď mi můžeš dát i to ostatní, co máš u sebe.
		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo,"Na to zapomeň, nedostaneš ani měďák!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo,"Tohle je všechno, co mám.",DIA_Moe_Hallo_Alles);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//Ale já u sebe nemám tolik zlaťáků.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//To nevadí, tak prostě naval všechno, co máš u sebe.
		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo,"Na to zapomeň, nedostaneš ani měďák!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo,"Tohle je všechno, co mám.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//... ale já nemám ani 10 zlaťáků.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//Chlape, ty nemáš ani vindru?!
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//No dobře... (povzdech) Můžeš jít.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Moe_Hallo_Vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//Na to zapomeň, nedostaneš ani měďák!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//Pak si vezmu všechno, co máš - jen co mi budeš ležet u nohou.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//Fajn, tohle je všechno, co mám.
	B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
	b_givealltobayguy(other,self);
	AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//Dobrá, to mi teda stačí. To jsem celý já - vždycky velkorysý. (šklebí se)
	AI_StopProcessInfos(self);
};


instance DIA_Moe_Harbor(C_Info)
{
	npc = VLK_432_Moe;
	nr = 998;
	condition = DIA_Moe_Harbor_Condition;
	information = DIA_Moe_Harbor_Info;
	permanent = TRUE;
	description = "Ty se tady v přístavu dost vyznáš, viď?";
};


func int DIA_Moe_Harbor_Condition()
{
	return TRUE;
};

func void DIA_Moe_Harbor_Info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//Ty se tady v přístavu dost vyznáš, viď?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//Jasná věc. Proč?
	Info_ClearChoices(DIA_Moe_Harbor);
	Info_AddChoice(DIA_Moe_Harbor,Dialog_Back,DIA_Moe_Harbor_Back);
	Info_AddChoice(DIA_Moe_Harbor,"Jaký je tu provoz lodí?",DIA_Moe_Harbor_Ship);
	Info_AddChoice(DIA_Moe_Harbor,"Jak to, že tu nevidím nikoho z domobrany?",DIA_Moe_Harbor_Militia);
	Info_AddChoice(DIA_Moe_Harbor,"O čem se tu asi tak nejvíc povídá?",DIA_Moe_Harbor_Rumors);
};

func void DIA_Moe_Harbor_Back()
{
	Info_ClearChoices(DIA_Moe_Harbor);
};

func void DIA_Moe_Harbor_Ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//Jaký je tu provoz lodí?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//Jediná loď, která sem v poslední době připlula, je ta paladinská galéra.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//Najdeš ji tamhle za tím útesem na jihozápadě.
};

func void DIA_Moe_Harbor_Militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//Jak to, že tu nevidím nikoho z domobrany?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//Netroufají si sem chodit - vždycky si všechno vyřídíme sami.
};

func void DIA_Moe_Harbor_Rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//O čem se tu asi tak nejvíc povídá?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//Nemáme rádi lidi, kteří se moc vyptávají. Zvlášť když jsou to cizinci.
	}
	else if(Kapitel == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//Coby - nic. Všechno je tu v klidu a pohodě.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//(nepřirozeně) Je to špatné. Časy jsou zlé, ale všichni se snažíme zůstat čestní a poctiví.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//Nedělej si ze mě šoufky.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//Jak si o mně můžeš něco takového myslet? Teď ses mě teda hluboce dotkl.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//Je tu fakt horko. Lord Andre se už nějakou dobu snaží strkat nos do věcí, po kterých mu pranic není.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//Ti nafoukanci nikdy nepochopí, jak to tady dole chodí.
		};
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//My s tím nemáme nic společného.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//S čím?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//S tím paladinem, kterého tu zabili. Opravdu by ses o ty žoldáky neměl starat - jenom tím maříš čas.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//Vím, že s tím nemáš nic společného, ale ta vražda paladina všechny urozené džentlmeny pořádně vylekala.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//Jestli ti můžu dát přátelskou radu, tak zmiz z města. Aspoň na chvíli.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//Když vyšlo najevo, že žoldáci s tím paladinem neměli nic společného, domobrana si sem už netroufá ani vkročit.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//Myslím, že se bojí, aby jim nikdo nerozbil držku. Mně osobně to vůbec nevadí.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//Neděje se tu absolutně nic.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//Konečně ti nabubřelí paladinové opustili přístav. Bylo načase.
	};
};


instance DIA_Moe_LEHMARGELDEINTREIBEN(C_Info)
{
	npc = VLK_432_Moe;
	nr = 2;
	condition = DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information = DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition()
{
	if((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)) && (Lehmar_GeldGeliehen != 0) && (RangerHelp_LehmarKohle == FALSE) && (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE) && (LehmarIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Moe_LEHMARGELDEINTREIBEN_Info()
{
	AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");	//Hej, ty tam! Lehmar tě zdraví.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_MOE_MOEBORED(C_Info)
{
	npc = VLK_432_Moe;
	nr = 1;
	condition = dia_moe_moebored_condition;
	information = dia_moe_moebored_info;
	permanent = FALSE;
	description = "Kardif si na tebe stěžuje!";
};


func int dia_moe_moebored_condition()
{
	if(MIS_MOEBORED == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_moe_moebored_info()
{
	AI_Output(other,self,"DIA_Moe_MoeBored_01_00");	//Kardif si na tebe stěžuje!
	AI_Output(self,other,"DIA_Moe_MoeBored_01_01");	//Opravdu?... (škleb) A co říká?
	AI_Output(other,self,"DIA_Moe_MoeBored_01_02");	//Říká, že tím tvojím vstupným odháníš lidi od krčmy.
	AI_Output(other,self,"DIA_Moe_MoeBored_01_03");	//A je přirozené, že mu to vadí.
	AI_Output(other,self,"DIA_Moe_MoeBored_01_04");	//Lidé se zde začínají bát chodit!
	AI_Output(self,other,"DIA_Moe_MoeBored_01_05");	//No a co?!... (hrubě) Je to moje věc!
	if(MOEISBEATEN == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Moe_MoeBored_01_07");	//Pak si na ten svůj život vydělávej někde jinde!
		AI_Output(other,self,"DIA_Moe_MoeBored_01_08");	//Jinak ti budu nucen znovu udělit lekci slušného chování.
		AI_Output(self,other,"DIA_Moe_MoeBored_01_11");	//No jo, jo... (bojácně) Všemu rozumím, jen se tak nečerti.
		AI_Output(self,other,"DIA_Moe_MoeBored_01_12");	//Jestli ti to udělá radost, půjdu jinam.
		AI_Output(self,other,"DIA_Moe_MoeBored_01_13");	//A tady už nepůjdu!
		B_LogEntry(TOPIC_MOEBORED,"Moe mi slíbil, že už nebude obtěžovat Kardifovy zákazníky.");
		MOEISAWAYFROMTAVERNE = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"AwayFromTaverne");
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(other,self,"DIA_Moe_MoeBored_01_17");	//Pak si na ten svůj život vydělávej někde jinde!
		AI_Output(other,self,"DIA_Moe_MoeBored_01_18");	//Jinak ti budu muset udělit lekci slušného chování.
		AI_Output(self,other,"DIA_Moe_MoeBored_01_19");	//CO?! Ty by ses mě odvážil napadnout?!
		AI_Output(self,other,"DIA_Moe_MoeBored_01_20");	//No dobrá! Já už ti ukážu.
		B_LogEntry(TOPIC_MOEBORED,"Jak to vypadá, měl bych Moea naučit slušným mravům.");
		MOEATTACKME = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_MOE_MOEBOREDDONE(C_Info)
{
	npc = VLK_432_Moe;
	nr = 1;
	condition = dia_moe_moeboreddone_condition;
	information = dia_moe_moeboreddone_info;
	permanent = FALSE;
	description = "Stačilo ti to?";
};


func int dia_moe_moeboreddone_condition()
{
	if((MIS_MOEBORED == LOG_Running) && (MOEISBEATEN == TRUE) && (MOEATTACKME == TRUE))
	{
		return TRUE;
	};
};

func void dia_moe_moeboreddone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Moe_MoeBoredDone_01_01");	//Stačilo ti to?
	AI_Output(self,other,"DIA_Moe_MoeBoredDone_01_02");	//No jo, jo... (bojácně) Všemu rozumím, jen se tak nečerti.
	AI_Output(self,other,"DIA_Moe_MoeBoredDone_01_03");	//Jestli ti to udělá radost, půjdu jinam.
	AI_Output(self,other,"DIA_Moe_MoeBoredDone_01_04");	//A tady už nepůjdu!
	B_LogEntry(TOPIC_MOEBORED,"Moe mi slíbil, že už nebude obtěžovat Kardifovy zákazníky.");
	MOEISAWAYFROMTAVERNE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AwayFromTaverne");
};


instance DIA_MOE_MOEBOREDFAIL(C_Info)
{
	npc = VLK_432_Moe;
	nr = 1;
	condition = dia_moe_moeboredfail_condition;
	information = dia_moe_moeboredfail_info;
	permanent = FALSE;
	description = "Hej, ještě jsme neskončili.";
};


func int dia_moe_moeboredfail_condition()
{
	if((MIS_MOEBORED == LOG_Running) && (MOEBEATME == TRUE) && (MOEATTACKME == TRUE))
	{
		return TRUE;
	};
};

func void dia_moe_moeboredfail_info()
{
	AI_Output(other,self,"DIA_Moe_MoeBoredFail_01_01");	//Hej, ještě jsme neskončili.
	AI_Output(self,other,"DIA_Moe_MoeBoredFail_01_02");	//Už jsem tě porazil, tak toho nech.
	AI_Output(self,other,"DIA_Moe_MoeBoredFail_01_03");	//Každá ženská se pere lépe než ty!
	AI_Output(self,other,"DIA_Moe_MoeBoredFail_01_05");	//Zmiz...
	AI_StopProcessInfos(self);
};

