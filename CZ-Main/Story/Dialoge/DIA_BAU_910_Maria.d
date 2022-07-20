
instance DIA_Maria_EXIT(C_Info)
{
	npc = BAU_910_Maria;
	nr = 999;
	condition = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maria_Hallo(C_Info)
{
	npc = BAU_910_Maria;
	nr = 1;
	condition = DIA_Maria_Hallo_Condition;
	information = DIA_Maria_Hallo_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int DIA_Maria_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//Jsem Onarova žena, Maria.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//Co tady chceš?
};


instance DIA_Maria_Umsehen(C_Info)
{
	npc = BAU_910_Maria;
	nr = 2;
	condition = DIA_Maria_Umsehen_Condition;
	information = DIA_Maria_Umsehen_Info;
	permanent = FALSE;
	description = "Jenom jsem si to tu chtěl prohlédnout...";
};


func int DIA_Maria_Umsehen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//Jenom jsem si to tu chtěl prohlédnout...
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//S tolika chlapama na farmě nemám klid ani ve vlastním domě!
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//Prostě mi sem každý jen tak chodí!
};


instance DIA_Maria_Soeldner(C_Info)
{
	npc = BAU_910_Maria;
	nr = 3;
	condition = DIA_Maria_Soeldner_Condition;
	information = DIA_Maria_Soeldner_Info;
	permanent = FALSE;
	description = "Obtěžují tě ti žoldáci?";
};


func int DIA_Maria_Soeldner_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//Obtěžují tě ti žoldáci?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//Hele, zapomeň na to, co jsem právě řekla - je tu teď mnohem bezpečněji, co se ti chlapi objevili.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//No, přinejmenším je tu teď, co jsou tu žoldáci, mnohem bezpečněji.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//Dokud jsme tu byli sami, pokaždé přišla domobrana z města a sebrala naši úrodu.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//Sebrali nejlepší část úrody. A taky si vzali pár ovcí. Nedali nám za to vůbec nic.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//Někteří z těch ničemů se tu dokonce odvážili krást.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//Nevysvětluj si to nijak zle, vojáku. Vím, že takoví nejsou všichni.
	};
};


instance DIA_Maria_Mission(C_Info)
{
	npc = BAU_910_Maria;
	nr = 4;
	condition = DIA_Maria_Mission_Condition;
	information = DIA_Maria_Mission_Info;
	permanent = FALSE;
	description = "A co ti ukradli?";
};


func int DIA_Maria_Mission_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Soeldner) && (MIS_Maria_BringPlate != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//A co ti ukradli?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//Většinou zlato a stříbro. Taky nám sebrali svatební dar. Zlatý talíř.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//Vsadím se, že teď se na něm usazuje prach v truhle nějakého mizerného městského strážného...
	};
	MIS_Maria_BringPlate = LOG_Running;
};


instance DIA_Maria_BringPlate(C_Info)
{
	npc = BAU_910_Maria;
	nr = 5;
	condition = DIA_Maria_BringPlate_Condition;
	information = DIA_Maria_BringPlate_Info;
	permanent = FALSE;
	description = "Mám u sebe zlatý talíř. Není náhodou tvůj?";
};


func int DIA_Maria_BringPlate_Condition()
{
	if(Npc_HasItems(other,ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info()
{
	B_GiveInvItems(other,self,ItMi_MariasGoldPlate,1);
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//Mám u sebe zlatý talíř. Není náhodou tvůj?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Ano! To je on! Tisíceré díky!
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP(XP_Maria_Teller);
};


var int Maria_Belohnung;

instance DIA_Maria_Belohnung(C_Info)
{
	npc = BAU_910_Maria;
	nr = 6;
	condition = DIA_Maria_Belohnung_Condition;
	information = DIA_Maria_Belohnung_Info;
	permanent = TRUE;
	description = "A co takhle nějakou odměnu?";
};


func int DIA_Maria_Belohnung_Condition()
{
	if((MIS_Maria_BringPlate == LOG_SUCCESS) && (Maria_Belohnung == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//A co takhle nějakou odměnu?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,DIA_Onar_HowMuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//Pracuješ pro mého manžela jako žoldák, ne?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//Správně.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//Kolik ti platí?
		B_Say_Gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//To tedy moc není. Zajdi za ním a řekni mu, ať ti přidá.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//Myslíš, že to udělá?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//Ví, co by se stalo, kdyby ne. Věř mi.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//Chceš se tady na farmě nechat najmout jako žoldák?
		Info_ClearChoices(DIA_Maria_Belohnung);
		Info_AddChoice(DIA_Maria_Belohnung,"Vlastně ne.",DIA_Maria_Belohnung_Gold);
		Info_AddChoice(DIA_Maria_Belohnung,"Ano.",DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Maria_Belohnung = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//Tady, vezmi si to. Zasloužíš si to.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//Vlastně ne.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Maria_Belohnung = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//Tak si na oplátku vezmi tohle zlato. Zasloužil sis to.
	Info_ClearChoices(DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//Ano.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//Dobrá, pokud tady pracuješ, tak dohlédnu na to, abys dostával slušný žold.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//Vrať se, až si s mým manželem promluvíš o tvém platu.
	Info_ClearChoices(DIA_Maria_Belohnung);
};


instance DIA_Maria_AboutOnar(C_Info)
{
	npc = BAU_910_Maria;
	nr = 7;
	condition = DIA_Maria_AboutOnar_Condition;
	information = DIA_Maria_AboutOnar_Info;
	permanent = FALSE;
	description = "Řekni mi něco o Onarovi.";
};


func int DIA_Maria_AboutOnar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//Řekni mi něco o Onarovi.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//Je to fajn chlap. Trochu nabručený a hodně netrpělivý, ale všichni máme své chyby.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//Řekla jsem svému muži: 'Proč necháváš ty vojáky aby s tebou takhle zacházeli'?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//'Udělej něco', říkám.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//Tak najal žoldáky. Teď se cítím jako uprostřed války.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//Ale my vlastně jsme ve válce, nebo ne?
};


instance DIA_Maria_PERM(C_Info)
{
	npc = BAU_910_Maria;
	nr = 8;
	condition = DIA_Maria_PERM_Condition;
	information = DIA_Maria_PERM_Info;
	permanent = TRUE;
	description = "Stalo se poslední dobou něco zajímavého?";
};


func int DIA_Maria_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//Stalo se poslední dobou něco zajímavého?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//Prošli tudy paladinové.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//Nejdřív jsme si mysleli, že přišli napadnout farmu, ale ve skutečnosti měli namířeno do Hornického údolí.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//Wasili načapal před pár dny v noci zloděje. Jinak je tady klid!
	};
	if((Kapitel == 4) || (Kapitel == 5))
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//Je to tu mnohem klidnější, co někteří ze žoldáků odešli.
	};
	if(Kapitel == 6)
	{
		if(BIGBATTLEBACKPOSITION == TRUE)
		{
			AI_Output(self,other,"DIA_Maria_PERM_17_05");	//Po tom boji o naši farmu se všechno uklidnilo.
		}
		else
		{
			AI_Output(self,other,"DIA_Maria_PERM_17_06");	//Všechny teď zajímá jedno - kdy se skřeti rozhodnou zavítat na naši farmu!
			AI_Output(self,other,"DIA_Maria_PERM_17_07");	//Když si to představím, tak se bojím, že s námi všemi bude amen.
		};
	};
};


instance DIA_Maria_PICKPOCKET(C_Info)
{
	npc = BAU_910_Maria;
	nr = 900;
	condition = DIA_Maria_PICKPOCKET_Condition;
	information = DIA_Maria_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Maria_PICKPOCKET_Condition()
{
	return C_Beklauen(60,110);
};

func void DIA_Maria_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
	Info_AddChoice(DIA_Maria_PICKPOCKET,Dialog_Back,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Maria_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
};

func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
};


instance DIA_MARIA_LEENURSE(C_Info)
{
	npc = BAU_910_Maria;
	nr = 8;
	condition = dia_maria_leenurse_condition;
	information = dia_maria_leenurse_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int dia_maria_leenurse_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_neworders) && (LEERECOVERED == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_leenurse_info()
{
	AI_Output(other,self,"DIA_Maria_LeeNurse_01_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Maria_LeeNurse_01_01");	//Pokud to nevidíš... (překvapeně) Starám se o raněné.
	AI_Output(self,other,"DIA_Maria_LeeNurse_01_02");	//Kdo by to měl podle tebe dělat?
	AI_Output(other,self,"DIA_Maria_LeeNurse_01_03");	//Rozumím. Jak je na tom Lee?
	AI_Output(self,other,"DIA_Maria_LeeNurse_01_04");	//Zatím nic moc... (s obavami) Jeho zranění byla vážná, ale ne smrtelná.
	AI_Output(self,other,"DIA_Maria_LeeNurse_01_05");	//Myslím, že by se měl brzy začít zotavovat.
};

instance DIA_MARIA_ONARPASS(C_Info)
{
	npc = BAU_910_Maria;
	nr = 7;
	condition = dia_maria_onarpass_condition;
	information = dia_maria_onarpass_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_maria_onarpass_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CRYPT_05") && (ONARTOMM1 == 5) && !Npc_IsDead(BAU_910_Maria) && !Npc_IsDead(BAU_911_Elena))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_maria_onarpass_info()
{
	AI_Output(self,other,"DIA_Maria_Onarpass_17_01");	//Jdeme na to! Měj u sebe nějaké zlato, kdyby nastaly nějaké problémy.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Maria_Onarpass_17_02");	//Můžeš se vrátit k Onarovi. Myslím, že si máte o čem promluvit.
	ONARTOMM1 = 6;
};

instance DIA_MARIA_TOWER(C_Info)
{
	npc = BAU_910_Maria;
	nr = 3;
	condition = dia_maria_tower_condition;
	information = dia_maria_tower_info;
	permanent = FALSE;
	description = "Jak to vypadá na farmě?";
};

func int dia_maria_tower_condition()
{
	if((MIS_Maria_BringPlate == LOG_SUCCESS) && (MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_tower_info()
{
	AI_Output(other,self,"DIA_Maria_Tower_15_00");	//Jak to vypadá na farmě?
	AI_Output(self,other,"DIA_Maria_Tower_17_01");	//Ach, to jsi ty! Velmi ráda, tě zase vidím.
	AI_Output(self,other,"DIA_Maria_Tower_17_02");	//Bylo by to dobré, ale ti černí cizinci mne znepokojují.
	AI_Output(self,other,"DIA_Maria_Tower_17_03");	//Nedávno se celá skupina usadila nedaleko ve staré věži, dokud je odtamtud někdo nevyhnal.
	AI_Output(self,other,"DIA_Maria_Tower_17_04");	//Innos odpusť, jsem ráda že se tak stalo.
	AI_Output(self,other,"DIA_Maria_Tower_17_05");	//Bylo na nich něco zlého.
	AI_Output(other,self,"DIA_Maria_Tower_15_06");	//Onar nezakročil?
	AI_Output(self,other,"DIA_Maria_Tower_17_07");	//Můj manžel? Kdepak. Jen poštěkával že děsí rolníky a ti méně pracují.
	AI_Output(self,other,"DIA_Maria_Tower_17_08");	//Ta věž přitahuje problémy. Nejdříve banditi a teď tyhle.
	AI_Output(other,self,"DIA_Maria_Tower_15_09");	//Neuvažovali jste někdy o obnovení té věže? Znovu ji obsadit, zajistit, postavit stráže...?
	AI_Output(self,other,"DIA_Maria_Tower_17_10");	//Ale jistě! To by bylo skvělé, ale to můj manžel nikdy neudělá.
	AI_Output(self,other,"DIA_Maria_Tower_17_11");	//Stálo by to spoustu peněz. Ale co z toho budeme mít? Pouze náklady...
	AI_Output(self,other,"DIA_Maria_Tower_17_12");	//Možná kdyby proto našel využití někdo jiný...
	AI_Output(other,self,"DIA_Maria_Tower_15_13");	//Co kdybych vzal situaci do svých rukou?
	AI_Output(self,other,"DIA_Maria_Tower_17_14");	//Ty? Proč bys to dělal? Kde bys vzal peníze a čas?
	Info_ClearChoices(dia_maria_tower);
	Info_AddChoice(dia_maria_tower,"Chtěl bych se tam usadit.",dia_maria_tower_win);
	Info_AddChoice(dia_maria_tower,"Chci tam udělat tábor.",dia_maria_tower_fail_a);
	Info_AddChoice(dia_maria_tower,"Mám s ní své zájmy.",dia_maria_tower_fail_b);
};

func void dia_maria_tower_win()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Maria_Tower_win_15_00");	//Chtěl bych se tam usadit.
	AI_Output(other,self,"DIA_Maria_Tower_win_15_01");	//Nemám žádný domov. Ta věž se zdá být dobrá, i když trochu nebezpečná.
	AI_Output(other,self,"DIA_Maria_Tower_win_15_02");	//Mohl bych se o ní postarat, ale obávám se, že Onar bude proti.
	AI_Output(self,other,"DIA_Maria_Tower_win_17_03");	//Víš co, promluvím s ním.
	AI_Output(self,other,"DIA_Maria_Tower_win_17_04");	//Jsi dobrý člověk. Věřím že to povedeš správným směrem. I přesto, že je to nebezpečné.
	AI_Output(other,self,"DIA_Maria_Tower_win_15_05");	//Děkuji ti!
	AI_Output(self,other,"DIA_Maria_Tower_win_17_06");	//Neděkuj. Pokud uspěješ, užitek budeme mít všichni.
	MARIA_APPROVES_TOWER = TRUE;
	B_LogEntry(TOPIC_MYNEWMANSION,"Podařilo se mi přesvědčit Marii, aby se za mě u Onara přimluvila.");
	AI_StopProcessInfos(self);
};

func void dia_maria_tower_fail_a()
{
	AI_Output(other,self,"DIA_Maria_Tower_fail_a_15_00");	//Chci tam udělat tábor.
	AI_Output(other,self,"DIA_Maria_Tower_fail_a_15_01");	//Lord Hagen si to přeje. Tak se zamezí aby tam nelezla další verbež.
	AI_Output(self,other,"DIA_Maria_Tower_fail_a_17_02");	//Lord Hagen ti to dovolil? To je ale naše věž!
	AI_Output(self,other,"DIA_Maria_Tower_fail_a_17_03");	//Jsi dobrý člověk ale lord Hagen nás nemůže jen tak připravit o majetek!
	AI_Output(self,other,"DIA_Maria_Tower_fail_a_17_04");	//Tohle se mi nelíbí. Prosím odejdi!
	AI_StopProcessInfos(self);
};

func void dia_maria_tower_fail_b()
{
	AI_Output(other,self,"DIA_Maria_Tower_fail_b_15_00");	//Mám s ní své zájmy. 
	AI_Output(self,other,"DIA_Maria_Tower_fail_b_17_01");	//Něco skrýváš?
	AI_Output(self,other,"DIA_Maria_Tower_fail_b_17_02");	//Obávám se že tě nemohu podpořit.
	AI_StopProcessInfos(self);
};
