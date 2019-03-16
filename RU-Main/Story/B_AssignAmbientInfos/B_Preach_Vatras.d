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
		AI_Output(self,self,"DIA_Vatras_PREACH_05_00");	//Но свет был пыткой для Белиара. И все, что создал Иннос, было Белиаром уничтожено.
	};
	if(satz == 1)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_01");	//Но Аданос понял, что так не будет существовать ничего. Ни света и ни тьмы.
	};
	if(satz == 2)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_02");	//И он решил встать между двумя братьями, чтобы погасить этот конфликт. Но у него ничего не вышло.
	};
	if(satz == 3)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_03");	//Но там, где стоял Аданос, находилось место, где ни у Инноса, ни у Белиара не было силы.
	};
	if(satz == 4)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_04");	//В этом месте Порядок и Хаос были равны. И так было создано море.
	};
	if(satz == 5)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_05");	//И это море освободило землю. И появились различные создания. Деревья и животные. Волки и овцы. И, наконец, появился человек.
	};
	if(satz == 6)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_06");	//И Аданос был удовлетворен тем, что вышло. Он был доволен всеми существами в равной степени.
	};
	if(satz == 7)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_07");	//Но так велик был гнев Белиара, что он вышел на землю и выбрал зверя. И Белиар заговорил с ним. И это зверь стал его подданным.
	};
	if(satz == 8)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_08");	//И Белиар дал ему часть своей божественной силы, чтобы зверь уничтожил землю.
	};
	if(satz == 9)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_09");	//Но Иннос видел, что сделал Белиар. И он тоже спустился на землю и выбрал человека. И Иннос заговорил с ним. И человек стал его подданным.
	};
	if(satz == 10)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_10");	//И Иннос дал ему часть своей божественной силы, чтобы тот мог противостоять деяниям Белиара.
	};
	if(satz == 11)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_11");	//И Белиар заговорил еще с одним существом. Но Аданос послал прилив, и это существо было смыто с лица земли.
	};
	if(satz == 12)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_12");	//Но вместе с ним были смыты и деревья, и животные. И глубокая печаль охватила Аданоса.
	};
	if(satz == 13)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_13");	//И заговорил Аданос со своими братьями: 'Никогда больше не должны вы ступать на мою землю. Она священна. Да будет так.'
	};
	if(satz == 14)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_14");	//Но человек и зверь начали войну на земле Аданоса. И гнев богов был с ними.
	};
	if(satz == 15)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_15");	//И человек убил зверя и вошел в царство Белиара.
	};
	if(satz == 16)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_16");	//Но Аданос увидел, что Порядок и Хаос теперь неравны, и предложил Инносу лишить человека божественной силы.
	};
	if(satz == 17)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_17");	//И Иннос, рассудив мудро, сделал это.
	};
	if(satz == 18)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_18");	//Но Аданос боялся, что настанет день, когда зверь вернется на землю.
	};
	if(satz == 19)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_19");	//И он попросил Инноса оставить часть своей силы в это мире, чтобы он мог вернуть ее человеку, если зверь вернется.
	};
	if(satz == 20)
	{
		AI_Output(self,self,"DIA_Vatras_PREACH_05_20");	//И Иннос, рассудив мудро, сделал это.
	};
};

func void B_Preach_Marduk(var int satz)
{
	B_Dialoge_Ani(self);

	if(satz == 0)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_00");	//В давние времена, когда закончили бушевать войны первородных стихий, в этот мир явились посланники стихий, которых мы сейчас знаем как богов.
	};
	if(satz == 1)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_01");	//Так в этот мир пришли Иннос, бог света и огня, Аданос, владыка безмятежных вод и ветров, и повелитель тьмы и смерти, Белиар.
	};
	if(satz == 2)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_02");	//В ту эпоху, сам мир был более дик и пустынен, чем мы можем видеть это сейчас, и требовал обустройства.
	};
	if(satz == 3)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_03");	//Иннос давал миру свет и тепло. Аданос, повелевая водой и ветрами, орошал земную твердь, делая ее плодородной. А Белиар, в свой черед, порождал тьму и прохлада ночи не позволяла лгню Инноса сжечь эту землю. 
	};
	if(satz == 4)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_04");	//Так соблюдалось равновесие! Их общими усилиями зародилась в этом мире жизнь и начали появляться разные живые существа.
	};
	if(satz == 5)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_05");	//Одним из существ был человек, которого сам Иннос выбрал проводником своей воли и которому передал частицу своих знаний, научив закону и порядку.
	};
	if(satz == 6)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_06");	//Тогда люди начали почитать Инноса, как бога света и правосудия. Аданоса как покровителя морских вод и мореходов. А Белиара, как бога тьмы и войны.
	};
	if(satz == 7)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_07");	//Но людей манил дневной свет и тепло, а тьма ночи наоборот пугала их своими опасностями. Поэтому они страшились Белиара и втайне ненавидели его.
	};
	if(satz == 8)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_08");	//В конце концов люди навлекли на себя его гнев и тот решил создать существ, которые покланялись бы только ему.
	};
	if(satz == 9)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_09");	//Но все, что он создавал, принимало ужасные, немыслемые формы. Опасные твари начали нарушать спокойствие и нападать на людей. Иннос осудил это и Белиар преисполнился злости к брату.
	};
	if(satz == 10)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_10");	//Спустя время, между двумя богами началась война! Люди в ней приняли сторону Инноса, а существа, созданные темной магией, поддержали Белиара. Аданос же не принял ничей стороны. Он лишь смотрел на разрушения, устраиваемые его братьями, врачевал и думал о грядущем восстановлении страдающей в ходе войны земли. 
	};
	if(satz == 11)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_11");	//Именно с тех пор, человек и зверь отчаяно бьются за своих божественных повелителей. Эта борьба увы не утихает с годами. Напротив, она уверено усиливается, ужесточается, заставляет ее участников с обеих сторон придумывать все более коварные уловки, которые могут помочь им одержать победу.  
	};
	if(satz == 12)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_12");	//Мы, как служители Инноса, без тени сомнения признаем его верховенство среди всех божеств и готовы во славу его уничтожать белиаровых порождений.
	};
	if(satz == 13)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_13");	//Путь, озаряемый светом его, путь добра, благоденствия, правды, совести и справедливости есть истинно верный для нас курс. 
	};
	if(satz == 14)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_14");	//Никогда не сворачивайте с него, оставайтесь верными нашему владыке и святому огню.
	};
	if(satz == 15)
	{
		AI_Output(self,self,"DIA_Marduk_PREACH_01_15");	//С нашей поддержкой именно победа Инноса станет венцом этого долгоиграющего противостояния.
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