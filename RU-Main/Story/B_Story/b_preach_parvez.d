
func void b_preach_parvez(var int satz)
{
	if(satz == 0)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_00");	//Давным давно появился Спящий, и послал он роду человеческому видение.
	};
	if(satz == 1)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_01");	//Но люди не смогли увидеть его, ибо ослепляла их жадность.
	};
	if(satz == 2)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_02");	//Лишь Ю`Берион и с ним несколько избранных отделились от слепой толпы и основали Братство.
	};
	if(satz == 3)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_03");	//Спящий привел Ю`Бериона и его верных учеников в это место, где они основали храм.
	};
	if(satz == 4)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_04");	//Они трудились, не покладая рук, - день за днем, неделя за неделей, месяц за месяцем. Лагерь рос. Все больше и больше людей присоединялось к нему, следуя зову Спящего.
	};
	if(satz == 5)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_05");	//Вместе они пытались говорить со Спящим на спиритическом уровне.
	};
	if(satz == 6)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_06");	//Видения прояснялись, но спиритической силы Братства было недостаточно для того, чтобы призвать Спящего.
	};
	if(satz == 7)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_07");	//Решение нашел один из Гуру, алхимик. Они приготовил эликсир из слюны ползунов. Братья выпили его перед молитвой, и впервые их силы объединились.
	};
	if(satz == 8)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_08");	//В то самое время по другим Лагерям разошлись послушники - нести людям слово Спящего и обращать язычников в истинную веру.
	};
	if(satz == 9)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_09");	//Вера людей росла, распространялась и крепла.
	};
	if(satz == 10)
	{
		AI_Output(self,self,"DIA_Parvez_PREACH_05_10");	//Много воды утекло со времен основания Лагеря. Многое изменилось.
	};
};


func void b_preach_haniar(var int satz)
{
	if(satz == 0)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_00");	//Когда вы сражаетесь - сражайтесь, чтобы победить. Сражайтесь, чтобы убить!
	};
	if(satz == 1)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_01");	//Вы не просто исполняете приказы - вы выполняете волю Белиара!
	};
	if(satz == 2)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_02");	//И каждый раз, когда вы убиваете врага Белиара, его власть растет.
	};
	if(satz == 3)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_03");	//Вы приводите в исполнение его приговор! Вы несете его врагам смерть!
	};
	if(satz == 4)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_04");	//Я могу показать вам, как одолеть врага. Но силу для этого вам даст Белиар.
	};
	if(satz == 5)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_05");	//Как гнев Белиара, должны поражать вы своих врагов.
	};
	if(satz == 6)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_06");	//Я могу научить вас стражаться, а побеждать вас научит Белиар!
	};
	if(satz == 7)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_07");	//Только Белиар может разбудить в вас бурю, которую никто и ничто не сможет остановить.
	};
	if(satz == 8)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_08");	//После каждого сражения, выиграного во имя Белиара, он будет награждать вас силой.
	};
	if(satz == 9)
	{
		AI_Output(self,self,"DIA_Haniar_PREACH_05_09");	//Потому что вы являетесь его избранным орудием. Побеждаете вы - побеждает он!
	};
};

func void b_preach_orc(var int satz)
{
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		if(satz == 0)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_01");	//
		};
		if(satz == 1)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_03");	//
		};
		if(satz == 2)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_05");	//
		};
		if(satz == 3)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_07");	//
		};
		if(satz == 4)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_09");	//
		};
		if(satz == 5)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_11");	//
		};
		if(satz == 6)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_13");	//
		};
		if(satz == 7)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_15");	//
		};
		if(satz == 8)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_17");	//
		};
		if(satz == 9)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_19");	//
		};
		if(satz == 10)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_21");	//
		};
		if(satz == 11)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_23");	//
		};
		if(satz == 12)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_25");	//
		};
		if(satz == 13)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_27");	//
		};
		if(satz == 14)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_29");	//
		};
		if(satz == 15)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_31");	//
		};
		if(satz == 16)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_33");	//
		};
		if(satz == 17)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_35");	//
		};
		if(satz == 18)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_37");	//
		};
		if(satz == 19)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_39");	//
		};
	}
	else
	{
		if(satz == 0)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_02");	//
		};
		if(satz == 1)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_04");	//
		};
		if(satz == 2)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_06");	//
		};
		if(satz == 3)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_08");	//
		};
		if(satz == 4)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_10");	//
		};
		if(satz == 5)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_12");	//
		};
		if(satz == 6)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_14");	//
		};
		if(satz == 7)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_16");	//
		};
		if(satz == 8)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_18");	//
		};
		if(satz == 9)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_20");	//
		};
		if(satz == 10)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_22");	//
		};
		if(satz == 11)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_24");	//
		};
		if(satz == 12)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_26");	//
		};
		if(satz == 13)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_28");	//
		};
		if(satz == 14)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_30");	//
		};
		if(satz == 15)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_32");	//
		};
		if(satz == 16)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_34");	//
		};
		if(satz == 17)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_36");	//
		};
		if(satz == 18)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_38");	//
		};
		if(satz == 19)
		{
			AI_Output(self,self,"DIA_ORC_PREACH_01_40");	//
		};
	};
};