
instance DIA_DRAGON_BLACK_EXIT(C_Info)
{
	npc = dragon_black;
	nr = 999;
	condition = dia_dragon_black_exit_condition;
	information = dia_dragon_black_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dragon_black_exit_condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_black_exit_info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_BLACK_HELLO(C_Info)
{
	npc = dragon_black;
	nr = 5;
	condition = dia_dragon_black_hello_condition;
	information = dia_dragon_black_hello_info;
	important = TRUE;
};


func int dia_dragon_black_hello_condition()
{
	if((DRAGONBLACKMEET == FALSE) && (AZGOLORAPPEAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_dragon_black_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_00");	//Človek?!... (Vrčí) Myslel som, že som zničil všetkých úbohých človiečikov!
	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_01");	//Ako vidíš, trochu si sa zmýlil. Ale myslím si, že to bola tvoja posledná chyba.
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_05");	//Arrrgkh... (Vrčí) Myslím tým že problémy sú s tebou spojené!... Nemohol by som si myslieť v žiadnom prípade, čo by mohlo byť naozaj smrtelné.
	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_03");	//Tak to je, drak. Prišiel som sem aby som zrazil tvoju odpornú hlavu!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_07");	//Je čas keď si ma dosiahol nejprve můj správny služobník - Dakat, neuspel... Velmi (vrčí) ma to trápi.
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_08");	//A ty - odvážny muž, ma chceš poraziť! A podla všetkých zvestí si pre mňa poriadny súper. Ale isto ti to ťažko pomůže!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_09");	//... Natiahnem, (vrčí) tvoje srdce, zoberiem si tvoju dušu a maso ti dolámem na plátky!
	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_10");	//Že ťa slina nezadrhne! Ty, kus hnoja. Tvoje vyhrážky ma nevystrašia.
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_14");	//Ur-Thrall! Pamatám si to... (vrčí) Aká škoda, že som sa nepostaral o zničenie toho slimáka.

	if(MEETURGROM == 4)
	{
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_19");	//Vidím že si so mnou neskončíl mocný Ur-Grom!
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_20");	//Spňška toho patrí mne ako aj váha ich nešťastných ludí!
	};
	if(Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1)
	{
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_21");	//Vidím, že si tiež našiel Exekutor - zbraň bojového ducha, podhodenú mnou! Ha, ha, ha!...
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_22");	//Viditelne láskavo veríš, že ti pomůže ma premocť...
	};

	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_17");	//Dobre, stačilo zbytočne strácať čas debatovaním. Je čas zapojiť aj povinnosť.
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_18");	//Je čas... (Vrčí) Už som si dlho nepochutil na čerstvom mase človeka, ako si ty. Priprav sa na smrť, hrdina!
	AI_PlayAni(self,"T_WARN");
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_23");	//MOJE ZUBY - MEČE! PAZÚRY - KÓPIA! MÁ KRÍDLA - URAGÁNY! 
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_24");	//I - TENTO PLAMEN! TO - TO JE... SMRŤ!
	B_LogEntry(TOPIC_URNAZULRAGE,"Velký Stín - Azgalor, je tu! Oko hněvu je oslabnuté čiernym drakom a on v Údolí stínů, viedol volanie tohto mocného artefaktu. Ja som ho však získal. Teraz, len můj meč vied odpovedať - či toto všetko bolo vyrobené?");
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	DRAGONBLACKMEET = TRUE;
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE;
};

