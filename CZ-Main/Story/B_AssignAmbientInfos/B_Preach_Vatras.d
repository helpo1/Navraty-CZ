func void B_Dialoge_Ani(var C_Npc slf)
{
	var int zufall;

	zufall = Hlp_Random(20);

	if(zufall == 0)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_01",BS_STAND);
	}
	else if(zufall == 1)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_02",BS_STAND);
	}
	else if(zufall == 2)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_03",BS_STAND);
	}
	else if(zufall == 3)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_04",BS_STAND);
	}
	else if(zufall == 4)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_05",BS_STAND);
	}
	else if(zufall == 5)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_06",BS_STAND);
	}
	else if(zufall == 6)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_07",BS_STAND);
	}
	else if(zufall == 7)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_08",BS_STAND);
	}
	else if(zufall == 8)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_09",BS_STAND);
	}
	else if(zufall == 9)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_10",BS_STAND);
	}
	else if(zufall == 10)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_11",BS_STAND);
	}
	else if(zufall == 11)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_12",BS_STAND);
	}
	else if(zufall == 12)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_13",BS_STAND);
	}
	else if(zufall == 13)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_14",BS_STAND);
	}
	else if(zufall == 14)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_15",BS_STAND);
	}
	else if(zufall == 15)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_16",BS_STAND);
	}
	else if(zufall == 16)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_17",BS_STAND);
	}
	else if(zufall == 17)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_18",BS_STAND);
	}
	else if(zufall == 18)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_19",BS_STAND);
	}
	else if(zufall == 19)
	{
		AI_PlayAniBS(slf,"T_DIALOGGESTURE_20",BS_STAND);
	};
};

func void B_Preach_Vatras(var int satz)
{
	B_Dialoge_Ani(self);

	if(satz == 0)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_00");	//Ale světlo bylo Beliarovi utrpením. A vše, co Innos vytvořil, Beliar obrátil v prach.
	};
	if(satz == 1)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_01");	//Adanos však řekl, že takto nemůže vůbec nic existovat. Žádné světlo, ani žádná tma.
	};
	if(satz == 2)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_02");	//A tak se vložil mezi oba bratry, aby ukončil jejich spor. A neuspěl.
	};
	if(satz == 3)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_03");	//Ale na místě, kam Adonos vstoupil, nemá ani Innos, ani Beliar žádnou moc.
	};
	if(satz == 4)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_04");	//A na tomto místě si jsou Řád a Chaos rovny. A tak vzniklo moře.
	};
	if(satz == 5)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_05");	//A moře dalo vzniknout zemi, jež byla na počátku existence všech stvoření. Stromů, stejně jako zvířat. Vlků i ovcí. A nakonec z ní povstal člověk.
	};
	if(satz == 6)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_06");	//Adanos byl velmi spokojen s tím, co se přihodilo. A jeho radost se stejnou měrou týkala všech bytostí bez výjimky.
	};
	if(satz == 7)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_07");	//Ale stejně tak velká byla i Beliarova zlost. I jal se procházet zemí a hledat, dokud nenašel bestii. A Beliar k ní promluvil. Bestie se stala jeho služebníkem.
	};
	if(satz == 8)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_08");	//Beliar jí vdechl část své božské moci, a bestie tak mohla ničit zemi.
	};
	if(satz == 9)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_09");	//Innos však spatřil, co Beliar provedl. A tak i on prohledal celou zemi, aby nakonec zvolil člověka. Innos k němu promluvil. A člověk se stal jeho služebníkem.
	};
	if(satz == 10)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_10");	//Innos vdechl člověku část své božské moci, a ten pak mohl mařit Beliarovy snahy.
	};
	if(satz == 11)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_11");	//I Beliar promluvil k jinému stvoření. Adanos však stvořil příliv a ten toto stvoření smetl z povrchu zemského.
	};
	if(satz == 12)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_12");	//Ale s ním byly smeteny i stromy a zvířata. A Adana obklopil hluboký smutek.
	};
	if(satz == 13)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_13");	//Proto Adanos promluvil ke svým bratrům: Už nikdy nevstoupíte na moji zem. Tato zem bude nazývána svatou. A tak se stalo.
	};
	if(satz == 14)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_14");	//Ale člověk a bestie vedli válku v Adanově zemi a stihl je božský hněv.
	};
	if(satz == 15)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_15");	//A člověk zabil bestii, jež pak vstoupila do Beliarova panství.
	};
	if(satz == 16)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_16");	//Ale Adanos viděl, že Řád a Chaos už si nejsou rovny, i vyzval Innose, aby si od člověka vzal zpět svou božskou sílu.
	};
	if(satz == 17)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_17");	//A Innos tak ve své moudrosti učinil.
	};
	if(satz == 18)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_18");	//Adanos se však hrozil okamžiku, kdy se bestie vrátí na zem.
	};
	if(satz == 19)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_19");	//A tak vyzval Innose, aby přenechal část své moci Adanově království, aby ji mohl opět propůjčit člověku pro případ, že by se bestie vrátila.
	};
	if(satz == 20)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_20");	//A Innos tak ve své moudrosti učinil.
	};
};

func void B_Preach_Marduk(var int satz)
{
	B_Dialoge_Ani(self);

	if(satz == 0)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_00");	//Za starých časů, když válka prvních elementů končila, se v tomto světě objevili jejich poslové, které dnes známe jako bohy.
	};
	if(satz == 1)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_01");	//Tak na tento svět přišel Innos - bůh světla a ohně, Adanos - bůh klidných vod a větru a pán temnot a smrti Beliar.
	};
	if(satz == 2)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_02");	//V té době byl svět divoký a opuštěný, jak můžeme spatřit kolem sebe, vyžadoval mnoho.
	};
	if(satz == 3)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_03");	//Innos daroval světu světlo a zahnal chlad. Adanos zavelil vodám, větrům a vyryl do země životodárné řeky. A Beliar zase stvořil tmu a chladnou noc, aby Innosova moc nespálila vše na zemi.
	};
	if(satz == 4)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_04");	//Takže vznikla rovnováha! Díky jejich společnému úsilí se na zemi začali objevovat různí tvorové.
	};
	if(satz == 5)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_05");	//Jeden z těch tvorů byl člověk, kterého si vybral Innos jako posla své vůle, kterému na oplátku daroval své znalosti tím, že je naučil zákonu a pořádku.
	};
	if(satz == 6)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_06");	//Pak se lidé začali o Innosovi učit jako o bohu světla a spravedlivosti. Adanos byl patron námořníků a mořských vod. Beliar byl bůh temnoty a války.
	};
	if(satz == 7)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_07");	//Jenomže lidi přitahovalo více světlo a tmy se báli kvůli nebezpečí jenž přináší. Proto se Beliara báli a začali ho tajně nenávidět.
	};
	if(satz == 8)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_08");	//Nakonec lidé pocítili jeho hněv, rozhodl se stvořit si vlastní služebníky, bytosti které ho uctívaly.
	};
	if(satz == 9)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_09");	//Všechno to, co stvořil na sebe vzalo různé strašné podoby. Nebezpeční tvorové začali narušovat klid a zabíjet lidi. Innos ho odsoudil a Beliar byl plný hněvu vůči bratrovi.
	};
	if(satz == 10)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_10");	//Po chvíli začala válka mezi dvěma bohy! Lidé se stavěli na stranu Innose a zplozenci temných sil se obrátili k Beliarovi. Adanos si však nezvolil stranu. Jenom pozoroval jaká pohroma se s jeho bratry hnala přes zemi a bděl o budoucnu.
	};
	if(satz == 11)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_11");	//Od té doby lidé i zvěř zoufale bojují na stranách svých božských vládců. Naneštěstí tento boj stále neustává. Naopak se stupňuje, stojí stále více životů, bolesti a strachu, nutí obě strany vyvíjet nové zbraně, díky kterým by mohly zvítězit.
	};
	if(satz == 12)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_12");	//My mágové Innose, nepochybujeme a umíme správně rozpoznat jeho nadřazenost nad ostatními bohy a jsme ochotni zapudit Beliarovo zlo.
	};
	if(satz == 13)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_13");	//Cesta osvícení musí vést zkrz cestu dobra, tolerance, pravdy, moudrosti a spravedlivosti - to jsou ctnosti mágů Ohně. 
	};
	if(satz == 14)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_14");	//Nikdy se od této cesty neodpoutáme, ve jménu svatého ohně.
	};
	if(satz == 15)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_15");	//S naší službou je Innosovo vítěztví jen otázkou času a nastane konec této dlouhé války.
	};
};

func void B_Preach_MageSpeech_Pyr(var int satz)
{
	if(satz == 2)
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_02");	//
	};
	if(satz == 4)
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_04");	//
	};
	if(satz == 6)
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_06");	//
	};
	if(satz == 8)
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_08");	//
	};
	if(satz == 10)
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_10");	//
	};
	if(satz == 12)
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_12");	//
	};
	if(satz == 14)
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_14");	//
	};
	if(satz == 16)
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_16");	//
	};
	if(satz == 18)
	{
		AI_Output(self,self,"DIA_Pyrokar_MageSpeech_18");	//
	};
};

func void B_Preach_MageSpeech_Xar(var int satz)
{
	if(satz == 1)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_01");	//
	};
	if(satz == 3)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_03");	//
	};
	if(satz == 5)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_05");	//
	};
	if(satz == 7)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_07");	//
	};
	if(satz == 9)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_09");	//
	};
	if(satz == 11)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_11");	//
	};
	if(satz == 13)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_13");	//
	};
	if(satz == 15)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_15");	//
	};
	if(satz == 17)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_17");	//
	};
	if(satz == 19)
	{
		AI_Output(self,self,"DIA_Xardas_MageSpeech_19");	//
	};
};