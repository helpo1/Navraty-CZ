
instance DIA_Gerbrandt_EXIT(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 999;
	condition = DIA_Gerbrandt_EXIT_Condition;
	information = DIA_Gerbrandt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gerbrandt_EXIT_Info()
{
	if(DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc(PC_Thief_NW);

		if(Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine(DiegoNW,"GERBRANDT");
		};

		Npc_ExchangeRoutine(self,"NEWLIFE");
		B_StartOtherRoutine(GerbrandtsFrau,"NEWLIFE");
		DIEGO_COMING = 2;
	};
	AI_StopProcessInfos(self);
	AI_SetWalkMode(self,NPC_RUN);
};

instance DIA_Gerbrandt_Hello(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 5;
	condition = DIA_Gerbrandt_Hello_Condition;
	information = DIA_Gerbrandt_Hello_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Gerbrandt_Hello_Condition()
{
	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (DIEGO_COMING == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Hello_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//Tak kdo jsi? Vypadá to, že jsi to novej a nemáš ani tucha, jak to tady chodí.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//Říkají mi Gerbrandt. Pro tebe to znamená: pane Gerbrandte, sire. Jasný?
	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Jo jasný, Gerbrandte.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Rozumím, pane Gerbrandte, sire.",DIA_Gerbrandt_Hello_Yes);
};

func void DIA_Gerbrandt_Hello_No()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//Jo jasný, Gerbrandte.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//Bacha na tu svou nevymáchanou hubu. Měl bys mi radši prokazovat víc úcty, nebo si tady zaděláš na pořádný trable...
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//Tady rozkazuju já. Kdokoli tu způsobí nějaké potíže, bude se zodpovídat mně a udělá nejlíp, když kvaltem opustí město. Protože jestli se mi dostane do rukou, tak bude velmi litovat toho, že se se mnou kdy setkal.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//Většina lidí z okolí přístavu pracuje pro mě. Jestli hledáš práci, měl by sis dávat velký pozor na to, abys mi utkvěl v paměti jako hodnej hoch.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//Rozumím, pane Gerbrandte, sire.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//Nakonec ti netrvalo moc dlouho, než ti došlo, která bije.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//Jakmile se začnou hejbat obchody, budu potřebovat urostlýho chlapa, jako jsi ty.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//Máte tu pěkný doky.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//Umíš číst?
	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Ne.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Nehledám práci.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice(DIA_Gerbrandt_Hello,"Samozřejmě.",DIA_Gerbrandt_Hello_Yes_Yes);
};

func void DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//Nevadí. Alespoň můžeš odnést pár pytlů.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//Jsem s tebou spokojený, můžu ti nabídnout stálou práci. Je toho tady dost na práci.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//Dobrá, dám ti vědět, až se první loď vrátí do doků.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_NoJob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//Nehledám práci.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//Asi si myslíš, jak jsi strašně chytrej. Koukej, nikdo tu nemůže dostat práci, dokud s tím já nebudu souhlasit.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//Takže jestli budeš takhle pyskovat, můžeš si začít hledat tou nejhnusnější havětí prolezlej slamník na spaní, protože to bude všechno, co si budeš moct dovolit.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//Ještě za mnou přilezeš a budeš žadonit o práci.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes_Yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Samozřejmě.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//Fajn, fajn, dostat se ke kvalifikovanýmu personálu není nic lehkýho.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//Co tvá doporučení?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//Doporučení?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//Dobrá, budu si tě pamatovat. Jakmile se zase začnou hejbat obchody, přijď se mi ukázat. Pak pro tebe budu možná mít nějakou práci.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void B_GErbrandt_PissOff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//Co jako má být tohle - děláš si ze mě srandu?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//Ty a ten tvůj kámoš Diego už jste nadělali dost škody.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//Nech mě být!
	if(DIEGO_COMING != TRUE)
	{
		AI_StopProcessInfos(self);
	};
	if(MIS_GERBRANDTHELP == LOG_Running)
	{
		MIS_GERBRANDTHELP = LOG_FAILED;
		GERBRANDTPISSOFF = TRUE;
		B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
	};
};


instance DIA_Gerbrandt_Perm(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 800;
	condition = DIA_Gerbrandt_Perm_Condition;
	information = DIA_Gerbrandt_Perm_Info;
	permanent = TRUE;
	description = "Něco nového?";
};


func int DIA_Gerbrandt_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Perm_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//Něco nového?
	if(Kapitel <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM))
		{
			if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (GERBRANDTPISSOFF == FALSE))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_20");	//Ne. Nic se v poslední době nestalo.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_21");	//Snad se něco zlepší.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//Lidi jako ty nemají tady nahoře co dělat. Tady bydlí vážení občané, ne nějací tuláci nebo podvodníci.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//Jestli se ti někdy podaří zbohatnout a dojít úcty, pak tady možná budeš vítanější.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//Nemůžu si stěžovat, vážený pane.
		};
	}
	else if(Kapitel >= 3)
	{
		if(MIS_DiegosResidence != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM))
			{
				if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (GERBRANDTPISSOFF == FALSE))
				{
					AI_Output(self,other,"DIA_Gerbrandt_Perm_10_22");	//Ne. Nic se v poslední době nestalo.
					AI_Output(self,other,"DIA_Gerbrandt_Perm_10_23");	//Je dobře, že se někdy zastavíš - rád tě vidím.
				}
				else
				{
					AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//Už jsem viděl tobě podobné - prostě nevíte, kam patříte.
					AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//Musím si promluvit s místodržícím ohledně odpovídajícího zabezpečení horní čtvrti.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//Tohle je jenom moje záležitost. Nemám čas!
			};
		}
		else
		{
			B_GErbrandt_PissOff();
		};
	};
};


instance DIA_GERBRANDT_FUCKOFF(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_fuckoff_condition;
	information = dia_gerbrandt_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gerbrandt_fuckoff_condition()
{
	if((GERBRANDTPISSOFF == TRUE) && (MIS_DiegosResidence != LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_Gerbrandt_GreetingsFromDiego(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information = DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent = FALSE;
	description = "Diego se nechá pozdravovat.";
};


func int DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	if((MIS_DiegosResidence == LOG_Running) && (Npc_HasItems(other,ItWr_DiegosLetter_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//Diego se nechá pozdravovat.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//(vyděšeně) Co? Kdo? Jaký Diego?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//A taky mě požádal, abych ti dal tenhle dopis.
	B_GiveInvItems(other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//(znepokojeně) To nemůže být pravda. Ne. Jsem mrtvý muž!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//(ustrašeně) Je teda ve městě?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Kdo?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//Diego, přece!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//Ano, zanedlouho se s ním setkám.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//(zoufale, pro sebe) Tak to je konec. Všechno je v tahu.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//Nemám čas, musím odtud vypadnout. Jestli mě tu najde, jsem vyřízenej!
	MIS_DiegosResidence = LOG_SUCCESS;
	B_GivePlayerXP(XP_DiegosResidence);
	DIEGO_COMING = TRUE;
};

instance DIA_GERBRANDT_WORKSFOR(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_worksfor_condition;
	information = dia_gerbrandt_worksfor_info;
	permanent = FALSE;
	description = "Nemáš pro mě práci?";
};

func int dia_gerbrandt_worksfor_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_DiegosResidence != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_worksfor_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_01_00");	//Nemáš pro mě práci?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_01_01");	//A proč si myslíš, že bych potřeboval tvoje služby?
	Info_ClearChoices(dia_gerbrandt_worksfor);
	Info_AddChoice(dia_gerbrandt_worksfor,"Jenom mě to zajímalo.",dia_gerbrandt_worksfor_interes);
	Info_AddChoice(dia_gerbrandt_worksfor,"Myslím, že ano.",dia_gerbrandt_worksfor_think);
	Info_AddChoice(dia_gerbrandt_worksfor,"No, to nevím. Ty netušíš?",dia_gerbrandt_worksfor_dontknow);
	Info_AddChoice(dia_gerbrandt_worksfor,"Tu práci velmi potřebuji.",dia_gerbrandt_worksfor_needwork);
};

func void dia_gerbrandt_worksfor_interes()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Interes_01_00");	//Jenom mě to zajímalo.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Interes_01_02");	//Tak to ti jednoduše odpovím - nemám pro tebe žádnou práci!
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Interes_01_03");	//Podívej se po ní jinde - například v přístavu.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Interes_01_04");	//Tady se takový zabedněnec neuchytí!
	AI_StopProcessInfos(self);
};

func void dia_gerbrandt_worksfor_dontknow()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_DontKnow_01_00");	//No, to nevím. Ty netušíš?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_DontKnow_01_01");	//COŽE?! Nabízíš mi své služby a nevíš, co mi můžeš nabídnout?!
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_DontKnow_01_02");	//Pak já nevím jakou práci bych mohl nabídnout idiotovi jako jsi ty.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_DontKnow_01_03");	//A teď zmiz!
	AI_StopProcessInfos(self);
};

func void dia_gerbrandt_worksfor_needwork()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_NeedWork_01_00");	//Tu práci velmi potřebuji.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_NeedWork_01_01");	//Práci potřebuje každý, to není důvod proč ji dát tobě!
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_NeedWork_01_02");	//Jsou tu jen samí hlupáci jako jsi ty!
	AI_StopProcessInfos(self);
};

func void dia_gerbrandt_worksfor_think()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_00");	//Myslím, že ano.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_02");	//Ano! Myslel jsem, že podnikatel jako jsi ty bude mít vždy důležité zásilky.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_07");	//Vidím, že bys mohl být dobrý pomocník!
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_08");	//Tvá pomoc by se mohla hodit...
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_10");	//Hmm... Je tu jedna prácička, která by byla akorát pro tebe.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_11");	//A co by to bylo?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_12");	//Nic důležitého - jen se setkat s jedním člověkem a něco mu předat.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_13");	//Co přesně bych mu měl předat a kde?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_14");	//Mám dneska krátce po půlnoci setkání v hostinci 'U Mrtvé harpyje'.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_15");	//Předáš mu tento měšec s dopisem a penězi.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_16");	//Jak ho poznám?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_17");	//Věř mi, nebude to nic složitého.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_19");	//Ta osoba, kterou máš potkat, by o tobě neměla vědět, takže to nebude nic složitého.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_1A");	//Chceš říci, že bych měl dělat podle sebe?
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_1B");	//Ano! Chci ti říci, žě tě nebude nijak podezírat.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_22");	//Tady je ten měšec...
	B_GiveInvItems(self,other,itse_gerbrandpocket,1);
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_23");	//... A dopis.
	B_GiveInvItems(self,other,itwr_gerbrandseclet,1);
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_24");	//Nezkoušej ho číst a peníze nech penězi.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_26");	//Ohledně tvé platby - Když nikomu nic neřekneš, bude to 500 zlatých.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_27");	//Peníze pro mě nejsou absolutně důležité.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_30");	//A co teda chceš?
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_31");	//Nic moc, jen bys mohl napsat jeden dopis.
	AI_Output(other,self,"DIA_Gerbrandt_WorksFor_Think_01_33");	//Dopis pro místodržícího Lariuse. Měl bys v něm pochválit kvality jisté osoby.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_36");	//Gallahad! Toho znám! Nemůžu říci, že jsme byli zadobře, ale nepřátelé jsme nebyli.
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_37");	//Hmm... Takže on potřebuje mou pomoc... Zdá se že chce obnovit své vztahy v centru města...
	AI_Output(self,other,"DIA_Gerbrandt_WorksFor_Think_01_40");	//Dobrá! Vyřiď to a až přijdeš, bude dopis hotový.
	MIS_GERBRANDT_MEETINTAVERNE_DAY = Wld_GetDay();
	MIS_GERBRANDTHELP = LOG_Running;
	Log_CreateTopic(TOPIC_GERBRANDTHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_Running);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Gerbrandt napíše Gallahadovi dopis s doporučením, ale musím pro něj splnit jistou práci. Musím se setkat s jednou osobou. Po půlnoci mám přijít do hostince 'U Mrtvé harpyje' a předat dopis a měšec s penězi.");
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_WORKSFORDONE(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_worksfordone_condition;
	information = dia_gerbrandt_worksfordone_info;
	permanent = FALSE;
	description = "Ohledně setkání...";
};


func int dia_gerbrandt_worksfordone_condition()
{
	if((MIS_GERBRANDTHELP == LOG_Running) && (MIS_DiegosResidence != LOG_SUCCESS) && ((MEETCHIEFKILLERS == TRUE) || (MEETCHIEFKILLERSLAIT == TRUE)))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_worksfordone_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_00");	//Ohledně setkání...
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_01");	//Ano?
	if(MEETCHIEFKILLERSLAIT == TRUE)
	{
		AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_02");	//Bohužel jsem ho zmeškal...
		AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_03");	//(naštvaně) COŽE?! Ty stupidní idiote!
		AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_07");	//Doufám, že peníze a dopis máš?
		if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
		{
			if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_08");	//Ano, tady jsou.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_09");	//Dej to sem!
				B_GiveInvItems(other,self,itse_gerbrandpocket,1);
				B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_10");	//Alespoň jsi myslel na to, abys mi je přinesl!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_13");	//A teď mi jdi z očí!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_14");	//Vysmahni!
				MIS_GERBRANDTHELP = LOG_FAILED;
				GERBRANDTPISSOFF = TRUE;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_15");	//Ano, tady.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_16");	//Dej to sem!
				B_GiveInvItems(other,self,itse_gerbrandpocket,1);
				B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_17");	//Alespoň jsi měl dost rozumu, že jsi mi je přinesl! Počkat... (přejede pohledem)
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_18");	//Tak ty jsi četl můj dopis?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_20");	//Ty hajzle!... (rozhněvaně)
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_21");	//Takže varování ti nestačilo.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_22");	//Budeš litovat!
				MIS_GERBRANDTHELP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				GERBRANDTPISSOFF = TRUE;
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			};
		}
		else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
		{
			if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_23");	//Mám jen dopis. Tady vem si ho.
				B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_24");	//Cože?! A kde je můj měšec?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_26");	//Ty hajzle!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_27");	//Já tě naučím! Tohle to si ke mě dovolovat nebudeš slyšiš?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_28");	//Tohle je naposled co mě někdo okradl!
				MIS_GERBRANDTHELP = LOG_FAILED;
				GERBRANDTPISSOFF = TRUE;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			}
			else
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_29");	//Mám jen dopis. Tady vem si ho.
				B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_30");	//Cože?! A kde je můj měšec?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_32");	//Ty hajzle!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_33");	//Já tě naučím! Tohle to si ke mě dovolovat nebudeš slyšiš?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_34");	//Počkat... Ty jsi četl můj dopis?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_36");	//Varoval jsem tě, abys to nedělal.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_37");	//Teď budeš litovat!
				MIS_GERBRANDTHELP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				GERBRANDTPISSOFF = TRUE;
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			};
		}
		else if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
		{
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_38");	//Mám jen peníze.
			B_GiveInvItems(other,self,itse_gerbrandpocket,1);
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_39");	//Cože?! Kde je můj dopis?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_41");	//Ty hajzle!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_42");	//Já tě naučím! Tohle to si ke mě dovolovat nebudeš slyšiš?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_43");	//Teď ti ukážu co se stane těm, co mě okradou!
			MIS_GERBRANDTHELP = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
			GERBRANDTPISSOFF = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_ReactToWeapon,0);
		}
		else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
		{
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_44");	//Nemám ani jedno.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_45");	//Cože?! TY HAJZLE!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_46");	//Říkal jsem ti ať na to nesaháš!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_47");	//Já ti ukážu, co se stane těm, co mě okradou!
			MIS_GERBRANDTHELP = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
			GERBRANDTPISSOFF = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_ReactToWeapon,0);
		};
	};
	if(MEETCHIEFKILLERS == TRUE)
	{
		if(MEETCHIEFKILLERSMISSTIME == TRUE)
		{
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_48");	//Setkal jsem se s tím člověkem.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_49");	//A jak to dopadlo? Předal jsi mu dopis a měšec?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_50");	//Bohužel ne. Neměl jsem je sebou.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_52");	//COŽE?! Co jsi to řekl?!... (rozhněvaně)
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_53");	//Ty jeden idiote! Zničíš mi věškeré podnikání!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_54");	//Jak jsem ti jen mohl věřít?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_59");	//Doufám, že peníze a dopis máš?
			if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
			{
				if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
				{
					AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_60");	//Ano, tady.
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_61");	//Dej to sem!
					B_GiveInvItems(other,self,itse_gerbrandpocket,1);
					B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_62");	//Alespoň jsi dost chytrý na to, abys mi je přinesl!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_65");	//A teď mi zmiz z očí ty hajzle!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_66");	//Vypadni!
					MIS_GERBRANDTHELP = LOG_FAILED;
					GERBRANDTPISSOFF = TRUE;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					AI_StopProcessInfos(self);
				}
				else
				{
					AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_67");	//Ano, tady.
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_68");	//Dej to sem!
					B_GiveInvItems(other,self,itse_gerbrandpocket,1);
					B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_69");	//Alespoň jsi dost chytrý na to, abys mi je přinesl! Počkat... (divá se)
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_70");	//Ty jsi četl můj dopis?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_72");	//Ty hajzle!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_73");	//Varoval jsem tě, abys to nedělal.
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_74");	//Budeš litovat!
					MIS_GERBRANDTHELP = LOG_FAILED;
					GERBRANDTPISSOFF = TRUE;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					AI_StopProcessInfos(self);
					B_Attack(self,other,AR_ReactToWeapon,0);
				};
			}
			else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
			{
				if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
				{
					AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_75");	//Mám jen dopis.
					B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_76");	//Cože?! Kde jsou moje peníze?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_78");	//Ty jeden hajzle!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_79");	//Já tě naučím! Tohle to si ke mě dovolovat nebudeš slyšiš?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_80");	//Teď ti ukážu co se stane těm co se mě snaží okrást!
					MIS_GERBRANDTHELP = LOG_FAILED;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					GERBRANDTPISSOFF = TRUE;
					AI_StopProcessInfos(self);
					B_Attack(self,other,AR_ReactToWeapon,0);
				}
				else
				{
					AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_81");	//Mám jen dopis.
					B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_82");	//Cože? Kde je můj měšec?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_84");	//Ty jeden hajzle!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_85");	//Já tě naučím! Tohle to si ke mě dovolovat nebudeš slyšiš?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_86");	//(vztekle) Počkat... Ty jsi četl ten dopis?!
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_88");	//Varoval jsem tě, abys to nedělal.
					AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_89");	//Teď budeš litovat!
					MIS_GERBRANDTHELP = LOG_FAILED;
					GERBRANDTPISSOFF = TRUE;
					B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
					AI_StopProcessInfos(self);
					B_Attack(self,other,AR_ReactToWeapon,0);
				};
			}
			else if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_90");	//Mám jen peníze.
				B_GiveInvItems(other,self,itse_gerbrandpocket,1);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_91");	//Cože? Kde je můj dopis?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_93");	//Ty jeden hajzle!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_94");	//Já tě naučím! Tohle to si ke mě dovolovat nebudeš slyšiš?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_95");	//Teď ti ukážu co se stane těm co se mě snaží okrást!
				MIS_GERBRANDTHELP = LOG_FAILED;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				GERBRANDTPISSOFF = TRUE;
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			}
			else if((Npc_HasItems(other,itse_gerbrandpocket) < 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) < 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) < 1)))
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_01_96");	//Ani jedno nemám.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_97");	//CO?! Ty jeden hajzle!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_98");	//Já tě naučím! Tohle to si ke mě dovolovat nebudeš slyšiš?!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_01_99");	//Teď ti ukážu co se stane těm co se mě snaží okrást!
				MIS_GERBRANDTHELP = LOG_FAILED;
				GERBRANDTPISSOFF = TRUE;
				B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
				AI_StopProcessInfos(self);
				B_Attack(self,other,AR_ReactToWeapon,0);
			};
		}
		else if((MEETCHIEFKILLERSOK == TRUE) && (MEETCHIEFKILLERSNOTOK == TRUE) && (MEETCHIEFKILLERSTELLSGER == FALSE))
		{
			B_GivePlayerXP(100);
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_00");	//Setkal jsem se s tou osobou.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_01");	//A jak to dopadlo? Předal jsi mu dopis a měšec?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_02");	//Ano, má to.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_03");	//A nějaké problémy byly?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_06");	//Prokoukl, že z něj dělám blázna - že nejsem ty.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_08");	//COŽE?! Ty zatracený blbe!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_09");	//Doufám, že nezná mé jméno?!
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_10");	//Bez obav! Nepozná tě.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_11");	//(uleveně) Alespoň že tak!
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_02_14");	//A co ten dopis?
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_15");	//Hmmm... (zaskočen)
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_16");	//Dal jsi mu to, takže ti ten dopis dám.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_17");	//Ale budež držet jazyk za zuby.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_18");	//Tady je.
			B_GiveInvItems(self,other,itwr_gerbrantletter,1);
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_19");	//Ale práci ti již nedám!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_02_21");	//A teď jdi!
			MIS_GERBRANDTHELP = LOG_SUCCESS;
			GERBRANDTPISSOFF = TRUE;
			Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_SUCCESS);
			B_LogEntry(TOPIC_GERBRANDTHELP,"Splnil jsem úkol pro Gerbrandta, ale nebyl moc potěšen tím, že jsem naštval tu osobu... Dopis mi sice dal, ale už mi nikdy nedá práci.");
			AI_StopProcessInfos(self);
		}
		else if((MEETCHIEFKILLERSOK == TRUE) && (MEETCHIEFKILLERSNOTOK == TRUE) && (MEETCHIEFKILLERSTELLSGER == TRUE))
		{
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_00");	//Setkal jsem se s tou osobou.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_01");	//A dal jsi mu ten dopis a měšec?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_02");	//Ano, má to.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_03");	//Bezva, nějaké problémy?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_06");	//Pochopil, že jsem někdo jiný.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_08");	//Cože?! Idiote!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_09");	//Doufám, že nezná mé jméno?!
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_10");	//Odpust, ale jinak by mě podřezal!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_12");	//COŽE?! (vztekle) On mě zabije! U Innose!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_13");	//U Innose, ty idiote, chcípni!... (v panice)
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_14");	//Nikdy jsem tě tam neměl posílat!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_15");	//Proč já vůl neposlal někoho jiného?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_03_18");	//A co dopis?
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_19");	//(vztekle) COŽE?! Ty máš ještě tu drzost o něj žádat?!
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_03_20");	//Zmiz mi z očí!
			MIS_GERBRANDTHELP = LOG_FAILED;
			GERBRANDTPISSOFF = TRUE;
			B_LogEntry_Failed(TOPIC_GERBRANDTHELP);
			AI_StopProcessInfos(self);
		}
		else if((MEETCHIEFKILLERSOK == TRUE) && (MEETCHIEFKILLERSNOTOK == FALSE) && (MEETCHIEFKILLERSTELLSGER == FALSE))
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_04_01");	//Setkal jsem se s tím člověkem.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_02");	//A jak to dopadlo?
			AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_04_03_01");	//Předal jsem mu ty věci.
			AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_03");	//Bezva! Nějaké problémy byly?
			if(MEETCHIEFKILLERSDANGER == TRUE)
			{
				Info_ClearChoices(dia_gerbrandt_worksfordone);
				Info_AddChoice(dia_gerbrandt_worksfordone,"Bohužel ano.",dia_gerbrandt_worksfordone_ok);
			}
			else
			{
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_04_05");	//Žádné, odvádím čistou práci.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_06");	//Bezva, vidím, že se na tebe můžu spolehnout... Snad jsi mu o mě nic neřekl, že ne?
				AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_04_08");	//Ne a co ten dopis?
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_09");	//Ach, ano! Tady je, jak jsme se dohodli.
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_10");	//Tady - je tvůj.
				B_GiveInvItems(self,other,itwr_gerbrantletter,1);
				B_UseItem(other,itwr_gerbrantletter);
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_13");	//Ještě bych ti rád řekl jednu věc...
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_14");	//Jestli ještě budeš něco potřebovat, zastav se!
				AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_04_15");	//Snad pro tebe budu něco mít!
				MIS_GERBRANDTHELP = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_SUCCESS);
				B_LogEntry(TOPIC_GERBRANDTHELP,"Gerbrandt byl rád, má práce ho potěšila. Dopis s doporučením mám v kapse.");

				if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (CHIEFKILLERISDEAD == FALSE) && (STARTKILLERWAY == FALSE) && (STARTKILLERWAY_ANDRE == FALSE))
				{
					STARTKILLERWAY = TRUE;
				};

				AI_StopProcessInfos(self);
			};
		};
	};
};

func void dia_gerbrandt_worksfordone_ok()
{
	Snd_Play("LevelUp");
	hero.exp = hero.exp + 500;
	AI_NoticePrint(3000,4098,NAME_ADDON_BRAVEBONUS);
	BRAVEBONUS = TRUE;
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_00");	//Bohužel ano.
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_01");	//(zmateně) CO?
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_02");	//Pochopil, že jsem někdo jiný.
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_03");	//Vyhrožoval mi a chtěl mě donutit prozradit tvé jméno.
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_04");	//Ale nakonec toho nechal a dohodli jsme se.
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_06");	//Takže se nemusíš obávat.
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_07");	//Ach!... (chytání u srdce) Ty... Jsi mě opravdu překvapil!
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_08");	//Pokud je to vše, je to výborné.
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_09");	//Ha! Věděl jsem že to dáš.
	AI_Output(other,self,"DIA_Gerbrandt_WorksForDone_Ok_04_11");	//A co ten dopis?
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_12");	//Á, ano. Tu je - jak jsme se dohodli.
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_13");	//Vem si ho, je tvůj.
	B_GiveInvItems(self,other,itwr_gerbrantletter,1);
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_16");	//Ještě jedna věc...
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_17");	//Jestli budeš potřebovat práci, zastav se!
	AI_Output(self,other,"DIA_Gerbrandt_WorksForDone_Ok_04_18");	//Nějaké to zlato se průběhem časů vždy hodí!
	MIS_GERBRANDTHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GERBRANDTHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Gerbrandt byl rád, má práce ho potěšila a byl překvapen jak jsem se dohodnul s tou osobou v hostinci. Dopis s doporučením mám v kapse.");

	if((MIS_GERBRANDTHELP == LOG_SUCCESS) && (CHIEFKILLERISDEAD == FALSE) && (STARTKILLERWAY == FALSE) && (STARTKILLERWAY_ANDRE == FALSE))
	{
		STARTKILLERWAY = TRUE;
	};

	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_HEARKILL(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_hearkill_condition;
	information = dia_gerbrandt_hearkill_info;
	permanent = FALSE;
	description = "A kdo byl ten člověk v hostinci?";
};


func int dia_gerbrandt_hearkill_condition()
{
	if((STARTKILLERWAY == TRUE) && (MEETSTIDGERBRANT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_hearkill_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_HearKill_01_00");	//A kdo byl ten člověk v hostinci?
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_01");	//Věř, že raději to nechceš vědět!
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_03");	//Nevím, proč se o to zajímáš?
	AI_Output(other,self,"DIA_Gerbrandt_HearKill_01_04");	//Řekneš mi to teda nebo ne?
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_05");	//Kheh... Dobrá, ale ani slovo, jasné?!
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_07");	//Dobrá, poslouchej...
	AI_Standup(self);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Gerbrandt_HearKill_01_08");	//Jestli chceš něco zjistit, tak dnes v noci nespi, ale buď v horní čtvrti u soudcova domu!
	ASMALCANAPPEAR = TRUE;
	AsmalDayMeet = Wld_GetDay();
	AI_StopProcessInfos(self);
};