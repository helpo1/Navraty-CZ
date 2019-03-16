
instance INFO_TPL_13_EXIT(C_Info)
{
	nr = 999;
	condition = info_tpl_13_exit_condition;
	information = info_tpl_13_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_tpl_13_exit_condition()
{
	return TRUE;
};

func void info_tpl_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TPL_13_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_tpl_13_einervoneuchwerden_condition;
	information = info_tpl_13_einervoneuchwerden_info;
	permanent = 1;
	description = "Я хочу стать Стражем, как и ты.";
};


func int info_tpl_13_einervoneuchwerden_condition()
{
	if((other.guild != GIL_TPL) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_13_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00");	//Я хочу стать Стражем, как и ты.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01");	//А знаешь ли ты, от чего мне пришлось отказаться, прежде чем я смог встать на страже покоя избранных Братства?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02");	//Не думай, что сможешь так вот запросто попасть на это место и получить подобающий почет и уважение.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03");	//Прежде чем говорить об этом, ты должен узнать немного об нашем новом учении.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04");	//Это займет некоторое время и, возможно, приведет тебя в чувство.
};


instance INFO_TPL_13_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_tpl_13_wichtigepersonen_condition;
	information = info_tpl_13_wichtigepersonen_info;
	permanent = 1;
	description = "Кто здесь командует?";
};


func int info_tpl_13_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_tpl_13_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00");	//Кто здесь командует?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01");	//Наши Гуру и избранные Стражи. Наша вера определяет нашу судьбу, и Гуру служат ему пророками.
};


instance INFO_TPL_13_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_tpl_13_dielage_condition;
	information = info_tpl_13_dielage_info;
	permanent = 1;
	description = "Как дела?";
};


func int info_tpl_13_dielage_condition()
{
	if((other.guild != GIL_GUR) && (other.guild != GIL_TPL) && (other.guild != GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_13_dielage_info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01");	//С тех пор как я стал одним из избранных защитников веры, я чувствую себя, как никогда раньше.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02");	//Звучит занятно...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03");	//Ты неверующий. Тебе не понять.
};

func void b_assignambientinfos_tpl_13(var C_Npc slf)
{
	info_tpl_13_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_dielage.npc = Hlp_GetInstanceID(slf);
};

