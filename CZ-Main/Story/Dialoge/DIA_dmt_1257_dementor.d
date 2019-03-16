
instance DIA_DMT_1257_DEMENTOR_EXIT(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 999;
	condition = dia_dmt_1257_dementor_exit_condition;
	information = dia_dmt_1257_dementor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dmt_1257_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1257_dementor_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_DMT_1257_DEMENTOR_FIRST(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_first_condition;
	information = dia_dmt_1257_dementor_first_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_dmt_1257_dementor_first_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DEMENTORMEET == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_first_info()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
};


instance DIA_DMT_1257_DEMENTOR_HELLO(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_hello_condition;
	information = dia_dmt_1257_dementor_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dmt_1257_dementor_hello_condition()
{
	if(BELIARSERVANTHERE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_hello_info()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_00");	//Slyšel jsem tvé volání, opovrženíhodný smrtelníku...
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_01_01");	//COŽE?!... (poté oněměl) Kdo jsi?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_02");	//Jmenuji se Zigos a jsem ten, kterého můj pán poslal, aby ti pomohl. Nebo ses nemodlil k oltáři a nežádal o pomoc?
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_01_03");	//Takže tebe poslal sám Beliar?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_04");	//Jsi bystrý, smrtelníku.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_06");	//Můj pán ví, že chceš získat amulet, který vlastní paladinové.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_07");	//Je připraven ti poskytnout cestu, která ti usnadní přístup k amuletu.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_09");	//Poslouchej pozorně, smrtelníku... A zapamatuj si každé mé slovo!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_10");	//Před mnoha staletími si můj pán vybral služebníka mezi smrtelníky, kterému dal schopnost proměňovat se v osobu jakoukoliv chtěl - jmenuje se Fellangor!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_11");	//Pán chtěl, aby vykonával špatnosti za mágy Ohně a paladiny a pošpinil tak jejich jména.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_12");	//Ale stejně jako každý smrtelník nebyl hoden tohoto daru! Byl příliš slabý a nedokázal odolat síle takové moci.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_13");	//Tento bezvýznamný červ absolutně zešílel, zapomněl na své skutečné předurčení a přestal sloužit našemu pánu.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_14");	//Od té doby putuje po světě a přijímá podobu různých lidí...
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_01_15");	//To je velice zajímavé, ale jak mi to může pomoci?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_16");	//Stále nerozumíš?... Pokud bys byl na místě tohoto šílence, mohl bys snadno projít kolem celé jednotky paladinů, kteří střeží amulet Triramaru.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_17");	//Nicméně budeš muset najít osobu, které oni velmi věří. Ale určitě to pro tebe nebude problém.
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_01_18");	//Chceš říci, že mi Beliar může pomoci změnit podobu?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_20");	//Umožní ti využít jeho dar jen jednou!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_21");	//A to jen když mu učiníš malou službičku. Tak co říkáš?
	DEMENTORMEET = TRUE;
	Info_ClearChoices(dia_dmt_1257_dementor_hello);
	Info_AddChoice(dia_dmt_1257_dementor_hello,"Ne, je toho na mně trochu moc.",dia_dmt_1257_dementor_hello_no);
	Info_AddChoice(dia_dmt_1257_dementor_hello,"Ano, samozřejmě.",dia_dmt_1257_dementor_hello_yes);
};

func void dia_dmt_1257_dementor_hello_no()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_No_01_01");	//Ne, je toho na mně trochu moc.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_No_01_02");	//Tak sbohem, smrtelníku! Již se neuvidíme...
	Info_ClearChoices(dia_dmt_1257_dementor_hello);
	Info_AddChoice(dia_dmt_1257_dementor_hello,Dialog_Ende,dia_dmt_1257_dementor_hello_ext);
};

func void dia_dmt_1257_dementor_hello_ext()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};

func void dia_dmt_1257_dementor_hello_yes()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_Yes_01_01");	//Ano, samozřejmě. Jsem připraven splnit Beliarovi službu!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_02");	//Dobrá, pro začátek si vezmi tuto věc.
	CreateInvItems(self,itam_zigosmagic,1);
	B_GiveInvItems(self,other,itam_zigosmagic,1);
	MIS_BELIARHELPME = LOG_Running;
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_Yes_01_03");	//To je magický amulet?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_04");	//Ano, ale jak vidíš, nejsou v něm přítomny žádné magické vlastnosti.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_07");	//Musíš najít toho šílence, který zradil mého pána - najdi ho a zabij!
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_Yes_01_10");	//Ta osoba může být kdokoliv!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_13");	//To je velmi jednoduché, jen řekni slova - '... ARH BELIAR NOMEN SAKT DAGAR JARAS... ' a část jeho síly vstoupí do amuletu.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_14");	//Obávám se, že ho budeš muset zbavit i života, nejen jeho síly.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_17");	//Blázne! Je nesmrtelný... Nebo si myslíš, že služebník temného pána by se zabýval věcmi jako je život?!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_19");	//Nyní odejdi. Jakmile se úspěšně vrátíš, můj pán ti splní tvé přání.
	Log_CreateTopic(TOPIC_BELIARHELPME,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_Running);
	B_LogEntry(TOPIC_BELIARHELPME,"Beliar vyslyšel mé volání a poslal za mnou svého služebníka - Zigose. Pověděl mi historii jednoho Beliarova služebníka jménem Fellangor, který dostal od Beliara dar proměnit se v koho chce. Nicméně nevydržel nápor takové síly a zbláznil se - Beliara nadobro opustil.");
	Log_AddEntry(TOPIC_BELIARHELPME,"Zigos mi řekl příběh o tom bláznovi. Potom mi svěří dar proměny a pouze jednou se budu moci proměnit v jinou osobu. Měl bych pak najít někoho, komu věří paladinové chránící Triramar!");
	Log_AddEntry(TOPIC_BELIARHELPME,"Nicméně Zigos mi řekl, že nejdříve musím zabít toho pomatence, který se odvrátil od Beliara. Bude to příklad pro ostatní. Avšak tato osoba se může proměnit v kohokoliv chce, takže budu muset hledat. Zigos mi dal amulet, jehož síla mi pomůže překonat nesmrtelného Fellangora.");
	Log_AddEntry(TOPIC_BELIARHELPME,"Než však použiju amulet, budu muset vyslovit příslušná slova - '... ARH BELIAR NOMEN SAKT DAGAR JARAS... ' Bez těchto slov amulet fungovat nebude. Zigos mě také varoval, že amulet nebude schopen toho šílence zabít napoprvé, takže je možné, že to budu muset opakovat.");
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		B_StartOtherRoutine(Fellan,"Insane");
		AI_Teleport(Fellan,"NW_FELLAN_REPAIR_01");
	}
	else
	{
		FLAGFELLANUP = TRUE;
	};
	Info_ClearChoices(dia_dmt_1257_dementor_hello);
};


instance DIA_DMT_1257_DEMENTOR_WHATITMEANS(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_whatitmeans_condition;
	information = dia_dmt_1257_dementor_whatitmeans_info;
	permanent = FALSE;
	description = "Co znamenají ta slova - 'ARH BELIAR NOMEN SAKT DAGAR JARAS'?";
};


func int dia_dmt_1257_dementor_whatitmeans_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORSAVE == FALSE) && (INSANEKILLDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_whatitmeans_info()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_WhatItMeans_01_00");	//Co znamenají ta slova - '... ARH BELIAR NOMEN SAKT DAGAR JARAS...'?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_WhatItMeans_01_01");	//V klasickém jazyce démonů něco jako - ' V zájmu Beliara, pána Temnoty a ďábelského lorda, navrať sílu Temnému bohu a zaplať za to svým životem'.
};


instance DIA_DMT_1257_DEMENTOR_DONEPRICE(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_doneprice_condition;
	information = dia_dmt_1257_dementor_doneprice_info;
	permanent = FALSE;
	description = "Vyřídil jsem co jsi chtěl.";
};


func int dia_dmt_1257_dementor_doneprice_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (INSANEKILLDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_doneprice_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePrice_01_00");	//Vyřídil jsem co jsi chtěl.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_01");	//Už jsem se to dozvěděl - můj pán bude potěšen touto zprávou!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_04");	//Ale první mi řekni - máš ještě ten amulet, který jsem ti dal?
	if(Npc_HasItems(hero,itam_zigosmagic) >= 1)
	{
		AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePrice_01_05");	//Ano, je tady.
		AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_06");	//Dobrá, tak si ho nech jako tvou odměnu!
		AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_07");	//Asi teď nechápeš, jak ti to pomůže ve tvojí věci, ale časem pochopíš...
	}
	else
	{
		AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePrice_01_08");	//Nemám ho.
		AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_09");	//Blázne!... (zlostně) Opravdu jsi ho ztratil?!
		AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_10");	//Dobrá, tím hůře pro tebe, to byla tvá odměna!
	};
	AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePrice_01_12");	//Můžeš mi vysvětlit na co mi je?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_13");	//Samozřejmě... Tento artefakt má v sobě část Beliarovy síly.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_14");	//Se správným použitím můžeš přijmout podobu jakéhokoliv smrtelníka.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_15");	//Ale jen jednou, pak se jeho moc vrátí k Beliarovi.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_19");	//Při použití amuletu nemůžeš bojovat ani sesílat kouzla.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_20");	//Takovéto kouzlo má velmi křehkou auru a bylo by okamžitě zničeno.
	MIS_BELIARHELPME = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_SUCCESS);
	B_LogEntry(TOPIC_BELIARHELPME,"Řekl jsem Zigosovi, že jsem to vyřídil a chci odměnu. Zigos mi odpověděl, že má odměna je amulet, který mi dal dříve. Tento amulet do sebe vstřebal část síly Beliara, kterou dříve užíval jeho sluha. Můžu ho použít k přijetí podoby jiného člověka, ale pouze jednou. Zigos mě také varoval, že kouzlo je křehké, a proto nesmím v průběhu kouzla bojovat, nebo sesílat magii, jinak by se zbortilo a cenná příležitost by byla promrhána.");
};


instance DIA_DMT_1257_DEMENTOR_HOWUSEAM(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_howuseam_condition;
	information = dia_dmt_1257_dementor_howuseam_info;
	permanent = FALSE;
	description = "Jak můžu ten amulet použít?";
};


func int dia_dmt_1257_dementor_howuseam_condition()
{
	if((MIS_BELIARHELPME == LOG_SUCCESS) && (MEHASTRIRAVAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_howuseam_info()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_HowUseAm_01_00");	//Jak můžu ten amulet použít?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_HowUseAm_01_01");	//Velmi jednoduše... Nasaď si ho a začni mluvit s tím, jehož podobu chceš.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_HowUseAm_01_02");	//Poté vyslov kouzlo, které probudí sílu amuletu.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_HowUseAm_01_04");	//Poslouchej a pamatuj - '... GVAR SAKHAS ESK SHATAR...'! Bez této formule amulet nefunguje.
	B_LogEntry(TOPIC_BELIARHELPME,"Zigos mi vysvětlil jak používat amulet. Je nutné, abych si ho nasadil a pak promluvil s osobou, ve kterou se chci proměnit. Poté musím vyslovit magická slova - '... GVAR SAKHAS ESK SHATAR...'!.");
	CANUSEZIGOSMAGIC = TRUE;
	Info_ClearChoices(dia_dmt_1257_dementor_howuseam);
	Info_AddChoice(dia_dmt_1257_dementor_howuseam,Dialog_Ende,dia_dmt_1257_dementor_howuseam_ext);
};

func void dia_dmt_1257_dementor_howuseam_ext()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_DMT_1257_DEMENTOR_DONEPRICEFAILED(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_donepricefailed_condition;
	information = dia_dmt_1257_dementor_donepricefailed_info;
	permanent = FALSE;
	description = "Nedokázal jsem to.";
};


func int dia_dmt_1257_dementor_donepricefailed_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORSAVE == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_donepricefailed_info()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePriceFailed_01_00");	//Nedokázal jsem to.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePriceFailed_01_01");	//Nic neříkej, všechno vím!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePriceFailed_01_02");	//Doufám, že chápeš, že se už nemůžeš spolehnout na pomoc mého pána.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePriceFailed_01_04");	//Sbohem smrtelníku, již se neuvidíme...
	MIS_BELIARHELPME = LOG_OBSOLETE;
	Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
	Info_ClearChoices(dia_dmt_1257_dementor_donepricefailed);
	Info_AddChoice(dia_dmt_1257_dementor_donepricefailed,Dialog_Ende,dia_dmt_1257_dementor_donepricefailed_ext);
};

func void dia_dmt_1257_dementor_donepricefailed_ext()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};