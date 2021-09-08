
instance DIA_PAL_9160_ORTO_EXIT(C_Info)
{
	npc = pal_9160_orto;
	nr = 999;
	condition = dia_pal_9160_orto_exit_condition;
	information = dia_pal_9160_orto_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9160_orto_exit_condition()
{
	return TRUE;
};

func void dia_pal_9160_orto_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9160_ORTO_MATTER(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_matter_condition;
	information = dia_pal_9160_orto_matter_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9160_orto_matter_condition()
{
	return TRUE;
};

func void dia_pal_9160_orto_matter_info()
{
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_00");	//Hej, chlape, kde ses tu vzal?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Matter_01_01");	//Šel jsem přes horský průsmyk. Co, tě překvapilo?

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_02");	//Jasně, že jo. Je to dlouho, co jsem viděl někoho nového. Hlavně ne žoldáka. (opovržlivě)
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_03");	//Jasně, že jo. Je to dlouho, co jsem viděl někoho nového. Hlavně ne nekromanta. (s obavou)
	};

	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_04");	//Je zajímavé, co přivedlo do pevnosti paladinů někoho, jako jsi ty?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Matter_01_05");	//A to mě nemůžeš jen tak pustit bez těch keců?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_06");	//Hmmm... (s úsměvem) Nemusíš si se mnou povídat.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_08");	//Dobře, běž - akorát se postarej ať nenamíchneš naše chlapce!
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_09");	//Jsou poslední dobou trošku nervózní.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_10");	//Jak sám uvidíš, další problémy zde nepotřebujeme.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Matter_01_11");	//Budu se snažit.
};


instance DIA_PAL_9160_ORTO_WHO(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_who_condition;
	information = dia_pal_9160_orto_who_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int dia_pal_9160_orto_who_condition()
{
	return TRUE;
};

func void dia_pal_9160_orto_who_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_01");	//Jmenuji se Orto. Jsem paladin krále a služebník Innose.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_02");	//Co tady děláš?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_03");	//Cha... Divná otázka ptát se paladina, jestli je ve službě králi spokojený?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_04");	//Nemám tušení. Možná mě to povíš?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_05");	//Unikátní osud paladina spočívá v bitvách za Innose a krále. Proto žiju a dýcháma!
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_06");	//Ale tady není nikdo, kdo by s tebou bojoval.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_07");	//Bohužel máš pravdu... Velmi mě to trápí. A nejen mě.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_08");	//Ta nečinnost a nuda je to nejhorší co může být.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_10");	//Tak proč jsi tady a nejdeš do Hornického údolí?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_11");	//Co vím tam se nikdo nenudí.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_12");	//S potěšením bych šel, ale lord Varus zakázal opustit pevnost.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_13");	//Tak tu jen tak sedíme a nic neděláme.
};

instance DIA_Pal_9160_Orto_Map(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = DIA_Pal_9160_Orto_Map_condition;
	information = DIA_Pal_9160_Orto_Map_info;
	permanent = FALSE;
	description = "A ty jsi kormidelník 'Esmeraldy'?";
};

func int DIA_Pal_9160_Orto_Map_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (Npc_KnowsInfo(hero,dia_pal_9160_orto_who) == TRUE) && (GotoFortMap == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9160_Orto_Map_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_00");	//A ty jsi kormidelník 'Esmeraldy'?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Map_01_01");	//Ano, je to tak... (překvapeně) I když nevím, kde ses to dozvěděl?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_02");	//Řekl mě to sám lord Hagen.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Map_01_03");	//No, to je pochopitelné! A proč jsi o tom začal mluvit?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_04");	//Potřebuju mapu, která by ukazovala cestu z ostrova na pevninu.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_05");	//Koneckonců, možná takovou máš?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Map_01_06");	//Přirozeně. Každej navigátor je na moři bez přesné mapy jako bez rukou.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Map_01_07");	//Nicméně u sebe jí nemám, zůstala na lodi.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_08");	//No co, měl jsem to vědět dřív!
	SeaMapIns = TRUE;
	B_LogEntry(Topic_SylvioCrew,"V paladinské pevnosti jsem jen marnil čas. Ortho nechal svou mapu na lodi! Nyní je třeba důkladně prohledat...");
};

instance DIA_PAL_9160_ORTO_FORT(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_FORT_condition;
	information = dia_pal_9160_orto_FORT_info;
	permanent = FALSE;
	description = "Řekni mi něco o pevnosti.";
};

func int dia_pal_9160_orto_FORT_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_FORT_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_FORT_01_00");		//Řekni mi něco o pevnosti.
	AI_Output(self,other,"DIA_Pal_9160_Orto_FORT_01_01");		//Byla založena králem Rhobarem I., k zajištění jižních hranic Khorinisu.
	AI_Output(self,other,"DIA_Pal_9160_Orto_FORT_01_02");		//Před válkou se skřety zde v podstatě žili rytíři a paladinové.
	AI_Output(self,other,"DIA_Pal_9160_Orto_FORT_01_03");		//Ale jakmile se nad Hornickým údolím rozzářila magická kopule, téměř celá posádka byla poslána zpět do Myrtany.
	AI_Output(self,other,"DIA_Pal_9160_Orto_FORT_01_04");		//A tak tady zůstal jen malý oddíl královských stráží a místní domobrana.
};

instance DIA_PAL_9160_ORTO_HOWWAY(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_HOWWAY_condition;
	information = dia_pal_9160_orto_HOWWAY_info;
	permanent = FALSE;
	description = "Jak ses sem dostal?!";
};

func int dia_pal_9160_orto_HOWWAY_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_HOWWAY_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_HOWWAY_01_00");	//Jak ses sem dostal?
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_01");	//Většinu z nás sem přivezli po moři, na lodi! Zbytek zůstal v Khorinisu.
	AI_Output(other,self,"DIA_Pal_9160_Orto_HOWWAY_01_02");	//A proč jste prostě nepřišli po souši?
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_03");	//Cesta po moři je mnohem kratší. Navíc vstup do pevnosti se nachází hned vedle Onarovi farmy s jeho žoldákama.
	AI_Output(other,self,"DIA_Pal_9160_Orto_HOWWAY_01_04");	//Máte z nich snad strach?
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_05");	//Ne, samozřejmě. (se smíchem) Královské paladiny jen stěží vyděsí obyčejní žoldáci!
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_06");	//Ale teď není vhodná doba bojovat s nima v otevřeném konfliktu.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_07");	//Navíc, dokud se nevyjasní situace v Hornickém údolí, je nepravděpodobné, že dá lord Varus pokyn k útoku.
};

instance DIA_PAL_9160_ORTO_VARUS(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_varus_condition;
	information = dia_pal_9160_orto_varus_info;
	permanent = FALSE;
	description = "Lord Varus?!";
};


func int dia_pal_9160_orto_varus_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_varus_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Varus_01_00");	//Lord Varus?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_01");	//Je to náš velitel. Osobnost, to bych ti mohl vyprávět.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Varus_01_03");	//A kde ho můžu najít?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_04");	//V druhém podlaží domu uprostřed pevnosti.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_05");	//Ale nevím, jestli tě Glantz pustí.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Varus_01_06");	//A kdo je Glantz?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_07");	//Strážce co stojí u vchodu.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_08");	//Jestli nebudeš mít důvod k setkání s Varusem, nepustí tě tam.
};


instance DIA_PAL_9160_ORTO_HOW(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_how_condition;
	information = dia_pal_9160_orto_how_info;
	permanent = TRUE;
	description = "Jak jde život?";
};


func int dia_pal_9160_orto_how_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_how_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_How_01_00");	//Jak jde život?
	if(VARUSAGREEDHUNTDONE == FALSE)
	{
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_01");	//Mohlo by být o něco veseleji...
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_02");	//Ale nejni...
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_03");	//Všechno je jednoduše úžasné, příteli!
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_04");	//Nikdy mě nenapdalo, že lov je taková zajímavá práce.
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_05");	//A je to lepší, než sedět pod borovicí a nudit se.
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_06");	//Díky, že jsi přesvědšil Varuse! Jsem ti opravdu vděčný!... (směje se)
	};
};


instance DIA_PAL_9160_ORTO_HUNT(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_hunt_condition;
	information = dia_pal_9160_orto_hunt_info;
	permanent = FALSE;
	description = "No, pokusím se ti najít nějakou zábavu.";
};


func int dia_pal_9160_orto_hunt_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_hunt_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_00");	//No, pokusím se ti najít nějakou zábavu.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_02");	//A co chceš dělat? Bez svolení Varuse si nesmíme ani prdnout!
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_03");	//Ale je pravda, že tu je jedna možnost...
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_04");	//Jaká?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_05");	//No, chtěl jsem s pár chlapama jít na druhý konec ostrova něco ulovit.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_06");	//Jsou tam nějaká nebezpečná zvířata.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_07");	//A v čem je problém?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_08");	//Eh!... Varus nám to určitě nedovolí!
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_09");	//A jak to víš. Mluvil jsi s ním o tom?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_10");	//Ty si ze mně utahuješ?... (nervózně) Ne, chlapče - to určitě zkoušet nebudu.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_12");	//Ty prostě neznáš Varuse! Kdybys znal, neptal by ses tak hloupě.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_14");	//Pak vám možná mohu pomoci.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_15");	//Ty? Hmm... To není zase tak špatný nápad...
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_16");	//Ty bys mohl, nejsi členem posádky, takže ho nemusíš poslouchat...
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_17");	//Řekni, opravdu bys to pro mě udělal?
	Info_ClearChoices(dia_pal_9160_orto_hunt);
	Info_AddChoice(dia_pal_9160_orto_hunt,"Jenom jsem si z tebe vystřelil.",dia_pal_9160_orto_hunt_no);
	Info_AddChoice(dia_pal_9160_orto_hunt,"Ano, promluvím s Varusem.",dia_pal_9160_orto_hunt_ok);
};

func void dia_pal_9160_orto_hunt_ok()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_Ok_01_00");	//Ano, promluvím s Varusem.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_Ok_01_01");	//Díky chlape! Ještě chvíle toho nicnedělání a bylo by po mě!
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_Ok_01_05");	//Udělám co budu moci.
	MIS_ORTOHUNT = LOG_Running;
	Log_CreateTopic(TOPIC_ORTOHUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORTOHUNT,LOG_Running);
	B_LogEntry(TOPIC_ORTOHUNT,"Paladin Orto mě požádal, jestli bych nepromluvil s lordem Varusem o tom, aby Orto se svými druhy mohl jít lovit na druhý konec ostrova. Půjdu si pokecat s Varusem a uvidíme!");
	Info_ClearChoices(dia_pal_9160_orto_hunt);
};

func void dia_pal_9160_orto_hunt_no()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_No_01_00");	//Jenom jsem si z tebe vystřelil.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_No_01_01");	//Pán je vtipálek... (podrážděně) Ale vlastně ti to nemůžu mít za zlé...
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_No_01_02");	//Nakonec je pravda, že to nejsou tvé problémy.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_No_01_03");	//Takže na to jednoduše zapomeneme...
	Info_ClearChoices(dia_pal_9160_orto_hunt);
};


instance DIA_PAL_9160_ORTO_HUNTDONE(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_huntdone_condition;
	information = dia_pal_9160_orto_huntdone_info;
	permanent = FALSE;
	description = "Lord Varus nemá žádné námitky proti vašemu nápadu.";
};


func int dia_pal_9160_orto_huntdone_condition()
{
	if((MIS_ORTOHUNT == LOG_Running) && (VARUSAGREEDHUNT == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_huntdone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Pal_9160_Orto_HuntDone_01_01");	//Lord Varus nemá žádné námitky proti vašemu nápadu.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_02");	//Myslíš to vážně?!... (udiveně)
	AI_Output(other,self,"DIA_Pal_9160_Orto_HuntDone_01_03");	//Jasně že jo! Můžete na lov.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_04");	//Ou, díky chlape! Nevím, jak bych ti dostatečně poděkoval!
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_05");	//No, možná mě něco napadlo... (směje se)
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_06");	//Můžu ti ukázat, jak správně používat svou sílu v boji.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_07");	//Myslím, že se ti to bude hodit!
	MIS_ORTOHUNT = LOG_SUCCESS;
	VARUSAGREEDHUNTDONE = TRUE;
	Log_SetTopicStatus(TOPIC_ORTOHUNT,LOG_SUCCESS);
	B_LogEntry(TOPIC_ORTOHUNT,"Orto byl velmi vděčný, když slyšel, že Varus ho pustí na lov. Ukázal mi, jak lépa využiju sílu svých úderů!");
	Info_ClearChoices(dia_pal_9160_orto_huntdone);
	Info_AddChoice(dia_pal_9160_orto_huntdone,"S potěšením ti budu naslouchat!",dia_pal_9160_orto_huntdone_teach);
};

func void dia_pal_9160_orto_huntdone_teach()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_HuntDone_Teach_01_00");	//Mám zrovna volný čas!
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_Teach_01_01");	//Tak, poslouchej, je to docela jednoduché - když tvůj protivník zaůtočí, využíj sílu jeho útoku ve svůj prospěch.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_Teach_01_02");	//Týká se to zejména odrážení útoků. Donuť svého protivníka zaútočit tak abys získal výhodu.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_Teach_01_03");	//Udělej to - a budeš mít vždy navrch! Zapamatůj si to?
	AI_Output(other,self,"DIA_Pal_9160_Orto_HuntDone_Teach_01_04");	//Ano - děkuji za lekci.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_Teach_01_05");	//Já ti děkuju! (směje se) No a teď - na lov!
	B_RaiseAttribute_Bonus(other,ATR_STRENGTH,1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pal_9160_orto,"Hunt");
	Npc_ExchangeRoutine(pal_9139_ritter,"Hunt");
	Npc_ExchangeRoutine(pal_9140_ritter,"Hunt");
	Npc_ExchangeRoutine(pal_9141_ritter,"Hunt");
	Npc_ExchangeRoutine(pal_9142_ritter,"Hunt");
};


instance DIA_PAL_9160_ORTO_RAYNEHELP(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_raynehelp_condition;
	information = dia_pal_9160_orto_raynehelp_info;
	permanent = FALSE;
	description = "Můžeš pomoci Rayneovi ve skladišti?";
};


func int dia_pal_9160_orto_raynehelp_condition()
{
	if(MIS_RAYNEHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_raynehelp_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_RayneHelp_01_00");	//Můžeš pomoci Rayneovi ve skladišti?
	AI_Output(self,other,"DIA_Pal_9160_Orto_RayneHelp_01_01");	//Co?! Nebudu přece celej den trčet v tom páchnoucím skladu...
	AI_Output(self,other,"DIA_Pal_9160_Orto_RayneHelp_01_02");	//Takže promiň, ale nemůžu!
	AI_Output(other,self,"DIA_Pal_9160_Orto_RayneHelp_01_03");	//Myslel jsem si to...
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if((HELPCOUNTRAYNE > 10) && (MAYTALKVARUSRAYNE == FALSE) && (MIS_RAYNEHELP == LOG_Running))
	{
		MAYTALKVARUSRAYNE = TRUE;
		B_LogEntry(TOPIC_RAYNEHELP,"Zdá se, že jen marním čas - žádný z paladinů není nakloněn myšlence Rayneovi pomoct. Možná bych měl zvolit poněkud drastičtější přístup...");
	};
};


instance DIA_PAL_9160_ORTO_PICKPOCKET(C_Info)
{
	npc = pal_9160_orto;
	nr = 900;
	condition = dia_pal_9160_orto_pickpocket_condition;
	information = dia_pal_9160_orto_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9160_orto_pickpocket_condition()
{
	return C_Beklauen(100,150);
};

func void dia_pal_9160_orto_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9160_orto_pickpocket);
	Info_AddChoice(dia_pal_9160_orto_pickpocket,Dialog_Back,dia_pal_9160_orto_pickpocket_back);
	Info_AddChoice(dia_pal_9160_orto_pickpocket,DIALOG_PICKPOCKET,dia_pal_9160_orto_pickpocket_doit);
};

func void dia_pal_9160_orto_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pal_9160_orto_pickpocket);
};

func void dia_pal_9160_orto_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9160_orto_pickpocket);
};

