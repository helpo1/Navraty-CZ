
instance DIA_NOV_8_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_8_EXIT_Condition;
	information = DIA_NOV_8_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_Fegen(C_Info)
{
	nr = 2;
	condition = DIA_NOV_8_Fegen_Condition;
	information = DIA_NOV_8_Fegen_Info;
	permanent = TRUE;
	description = "Potřebuju pomoci zamést pokoje noviců.";
};


func int DIA_NOV_8_Fegen_Condition()
{
	if((Kapitel == 1) && (MIS_KlosterArbeit == LOG_Running) && (NOV_Helfer < 4))
	{
		return TRUE;
	};
	return FALSE;
};


var int Feger3_Permanent;

func void DIA_NOV_8_Fegen_Info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//Potřebuju pomoci zamést pokoje noviců.
	if(Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self))
	{
		if(Feger3_Permanent == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//No nazdar. Právě jsi přišel a hned ze sebe necháš dělat uklízečku?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//Uklidni se, se mnou to bylo to samé, když jsem sem poprvé přišel. A proto se ti chystám pomoct. Asi by se nám pěkně vysmáli, kdybychom to nezvládli.
			NOV_Helfer = NOV_Helfer + 1;
			Feger3_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			B_LogEntry(Topic_ParlanFegen,"Už jsem narazil na novice, který mi s úklidem komnat pomůže.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//Bratře, jsem obeznámen se situací, do které ses dostal. A už jsem ti řekl, že ti pomohu. A to právě dělám.
		};
	};
	if(Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//Hele, rád bych, ale fakt nemám čas.
	};
};


instance DIA_NOV_8_Wurst(C_Info)
{
	nr = 3;
	condition = DIA_NOV_8_Wurst_Condition;
	information = DIA_NOV_8_Wurst_Info;
	permanent = TRUE;
	description = "Co takhle jemňoučká skopová klobáska?";
};


func int DIA_NOV_8_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_NOV_8_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//Co takhle jemňoučká skopová klobáska?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//Tak tomu se nedá říct ne. Díky, chlape, přesně to jsem potřeboval.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};


instance DIA_NOV_8_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_NOV_8_JOIN_Condition;
	information = DIA_NOV_8_JOIN_Info;
	permanent = TRUE;
	description = "Co musím udělat, abych se stal mágem?";
};


func int DIA_NOV_8_JOIN_Condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_NOV_8_JOIN_Info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//Co musím udělat, abych se stal mágem?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//Innosovým Vyvoleným se můžeš stát pouze v případě, že k tomu dá svolení Nejvyšší rada.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//Jako novicové máme zakázáno studovat runovou magii - a staré posvátné spisy můžeme pročítat jen se svolením mágů.
};


instance DIA_NOV_8_PEOPLE(C_Info)
{
	nr = 5;
	condition = DIA_NOV_8_PEOPLE_Condition;
	information = DIA_NOV_8_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo vede tenhle klášter?";
};


func int DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//Kdo vede tenhle klášter?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//Nejvyšší rada, kterou tvoří tři nejmocnější mágové. Každodenně se scházejí v chrámu.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//Innosovi Vyvolení jsou všichni mágové. Innos jim poskytl tento dar, a tak mohou na zemi plnit jeho vůli.
};


instance DIA_NOV_8_LOCATION(C_Info)
{
	nr = 6;
	condition = DIA_NOV_8_LOCATION_Condition;
	information = DIA_NOV_8_LOCATION_Info;
	permanent = TRUE;
	description = "Řekni mi o klášteru něco víc.";
};


func int DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_LOCATION_Info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//Řekni mi o klášteru něco víc.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//Jeho původ sahá hluboko do minulosti. Pochází z dob vlády Rhobara I.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//Pod klášterem se rozkládají katakomby. Vedou hluboko do hor.
};


instance DIA_NOV_8_STANDARD(C_Info)
{
	nr = 10;
	condition = DIA_NOV_8_STANDARD_Condition;
	information = DIA_NOV_8_STANDARD_Info;
	permanent = TRUE;
	description = "Něco nového?";
};


func int DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_STANDARD_Info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//Něco nového?
	if(Kapitel == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//Dalo by se říct, že ano. Už je to víc než sto let, co byl nějaký novic tak rychle přijat do Kruhu Ohně.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//Doufám, že se mi této cti také jednou dostane. Budu na tom tvrdě pracovat.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//Nedávno do Khorinisu přijeli paladinové. Jeden z nich je tady v klášteře, aby se tu modlil k Innosovi.
		};
	};
	if((Kapitel == 2) || (Kapitel == 3))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//Pořád tomu nemohu uvěřit. Jeden z nás zradil klášter a ukradl Innosovo oko.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//Naším úkolem bylo vybudovat soudržnou společnost, ale byli jsme příliš slabí. To je jediný důvod, proč se mohlo Beliarovi podařit přetáhnout jednoho z nás na svou stranu.
		}
		else if(MIS_NovizenChase == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//Innos buď pochválen. Podařilo se nám Oko dostat od nepřítele zpět.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//Tvá odvaha by mohla být příkladem mnoha zoufalým duším, a pomoci jim tak přečkat tyto temné časy.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//Zaslechl jsem něco o dracích a armádě Zla. Innos nás opatruj!
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//Nejvyšší rada má na situaci našich paladinů zvláštní zájem. Už nějakou dobu jsme z Hornického údolí nedostali žádné zprávy.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//Ne. A jsem za to našemu Pánu vděčný. S Innosovým okem budeme moci ty draky porazit!
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//Ano. Dosáhli jsme vítězství nad draky! Innos nám ukázal, že nikdy nesmíme ztrácet naději.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//V současnosti se musíme potýkat s množstvím temnoty a bude potřeba ještě zažehnout mnoho ohňů, abychom ji zprovodili ze světa.
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_13");	//Jestli nás neochrání ani mágové Kruhu Ohně a stěny kláštera, jakou mají potom šanci města?
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_14");	//Kdoví, kolik ještě vydržíme.
	};
};

func void B_AssignAmbientInfos_NOV_8(var C_Npc slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc = Hlp_GetInstanceID(slf);
};

