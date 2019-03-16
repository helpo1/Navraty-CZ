//######################################################
//
//  Ядро скрипт-пакета "Ikarus"
//      Автор      : Sektenspinner
//      Соавтор    : Gottfried
//	    Версия     : 1.2.0
//      Перевод    : НастасьСанна /*NS*/
//
//######################################################

//************************************************
// Содержание:
//************************************************
/*
    ## Преамбула ##
        -Проверка версии
        -Функции ведения лога (предварительные) 
        -Извлечение информации из стека парсера
        
    ## Базовые операции чтения и записи ##
        -Чтение/запсь целых чисел, строк, массивов, байт
    
    ## Основные функции, связанные с zCParser ##
        -MEM_ReinitParser: Локализация структур данных парсера.
        -Получение и назначение смещения инстанций (MEM_PtrToInst)
        -Переходы (через MEM_StackPos)
        -MEM_GetFuncID и иже с ним
        -Оператор адреса _@ и иже с ним
        -Доступ к статическим массивам
        
    ## Подготовка MEM_Alloc и MEM_Free ##
        -Выделение и освобождение памяти с помощью строк
        
    ## Пакет CALL ##
        -ASM: Запись и выпонение машинного кода
        -CALL_Begin / End: Ускоренный режим пакета
        -Проталкивание параметров в стек
        -Извлечение результата из стека
        -Соглашения о вызовах
        
    ## УТИЛИТЫ ##
        -MEM_SetShowDebug
        -MEM_Copy
        -MEM_Swap
        -MEM_Clear
        -MEM_Realloc
        -MEM_Compare
        
    ## Утилиты Windows ##
        -LoadLibrary / GetProcAddress
        -VirtualProtect / MemoryProtectionOverride
        -MEM_MessageBox / MEM_InfoBox
        
    ## Массивы ##
        -Alloc / Clear / Free / Size / Read / Write
        -Insert / Push / Pop / Top
        -IndexOf / RemoveIndex / RemoveValue[Once]
        -Sort / Unique
        -ToString
        
    ## Работа со строками ##
        -GetCharAt / Length
        -Substring / Prefix
        -Compare
        -STR_ToInt
        -STR_IndexOf
        -STR_Split
        -STR_Upper
        
    ## Обработка функций, связаных с zCParser ##
        -MEM_(Find/Get)ParserSymbol
        -MEM_Call[, ByID, ByString]
        -Поиск функции по смещению в стеке
        -Поиск текущей позиции в машинном стеке
            * MEM_GetCallerStackPos
            * MEM_SetCallerStackPos
        -Label / goto / while / repeat
            * Разбиение функции на токены
            * Трассировка расчета параметра
            * Функция-заплатка (патч)
            * Обработчик while
            * Обработчик goto
            * Обработчик repeat
            
    ## Доступ к объектам меню ##
        -Поиск меню и пунктов меню по строке текста
        
    ## zCObjects ##
        -Часто используемые объекты (MEM_InitGlobalInst)
        -Проверка соответствий (Hlp_Is_*)
        -Поиск zCClassDef и имени класса объекта
        -Создание и удаление vob'ов
            * MEM_InsertVob
            * MEM_DeleteVob
        -Поиск объектов в хэш-таблице мира
            * Расчет хэш-функции
            * Поиск объекта по имени
            * Правильное изменение имени объекта
        -Запуск и отмена триггеров
        
    ## Клавиатура ##
        -MEM_KeyState
        -MEM_InsertKeyEvent
        
    ## Чтение и запись Ini-параметров ##
        -Чтение
            * Настройки Готики
            * Настройки мода
            * Доступ к командной строке
            * Получение клавиш управления
        -Запись
            * Настройки Готики
            * Применение изменений и запись на диск
            
    ## Разметка и контроль времени исполнения ##
        -Время исполнения
            * Миллисекунды
            * Счетчик производительности
        -Тест производительности
        
    ## Ведение лога и отладка ##
        -Отправка сообщений Info/Warning/Error в zSpy
        -Трассиовка стека
            * Вывод отдельной строки трассировки
            * Вывод полной трассировки
            * Обработчик исключительных ситуаций
            * Установка обработчика
            
    ## Переработанные функции ##
        -Ускоренная MEM_ReadInt / MEM_WriteInt
        -Ускоренная MEM_Alloc and MEM_Free
        
    ## MEM_InitAll
*/

//#################################################
//
//    Преамбула
//
//#################################################

//----------------------------------------------
//   Проверка версии
//   Если ваш код зависит от изменений, введенных
//   в определенной версии Икаруса,
//   и вы хотите предоставить ваш код пользователям,
//   у которых может быть старая версия, используйте:
//----------------------------------------------

const int IKARUS_VERSION = 10200; //по 2 цифры для главного и второстепенного номеров версий.

/* возвращает 1, если версия Икакруса такая же или более новая */
func int MEM_CheckVersion(var int base, var int major, var int minor) {
    if (major > 99 || minor > 99) {
        return false;
    };
    
    return base*10000 + major * 100 + minor <= IKARUS_VERSION;
};

//--------------------------------------
//  Функции ведения лога
//  MEM_SendToSpy пересмотрена в MEM_InitAll
//  для более точного вывода
//--------------------------------------

/* должно ли следующее сообщение выводиться в окне ошибки? */
var int MEMINT_ForceErrorBox;

func void MEM_SendToSpy(var int errorType, var string text) {
    /* Реализация заменена в MEM_InitAll! */
    PrintDebug(ConcatStrings(text, "<<< (This is a preliminary printing variant, use MEM_InitAll to get neat 'Q:' prefixed messages.) >>>")); /* Q: is the Ikarus mark */
};

func void MEM_ErrorBox(var string text) {
    MEMINT_ForceErrorBox = true;
    MEM_SendToSpy(zERR_TYPE_FAULT, text);
};

func void MEM_PrintStackTrace() {
    var string error; error = "MEM_PrintStackTrace: Cannot print the stacktrace before MEM_InitAll was called!";
    MEM_SendToSpy(zERR_TYPE_FAULT, error);
};

func void MEMINT_HandleError(var int errorType, var string text) {
    if (errorType >= zERR_PrintStackTrace) {
        const int once = 0;
        if (!once || !zERR_StackTraceOnlyForFirst) {
            once = true;
            MEM_PrintStackTrace();
        };
    };

    if (errorType >= zERR_ReportToZSpy) {
        const int errorBoxOnce = 0;
        if (errorType >= zERR_ShowErrorBox)
        && (!zERR_ErrorBoxOnlyForFirst || !errorBoxOnce) {
            MEMINT_ForceErrorBox = true;
            errorBoxOnce = true;
        };
        
        MEM_SendToSpy(errorType, text);
    };
};

func void MEM_Error(var string error) {
    MEMINT_HandleError(zERR_TYPE_FAULT, error);
};

func void MEM_Warn(var string warn) {
    MEMINT_HandleError(zERR_TYPE_WARN, warn);
};

func void MEM_Info(var string info) {
    if (zERR_ReportToZSpy > zERR_TYPE_INFO)
    && (zERR_PrintStackTrace > zERR_TYPE_INFO) {
        return; //не теряем времени
    };
    
    MEMINT_HandleError(zERR_TYPE_INFO, info);
};

func void MEM_AssertFail (var string assertFailText) {
    assertFailText = ConcatStrings ("Assertion failed. Report this: ", assertFailText);
    MEM_Error (assertFailText);
};

/* пользовательский канал */

func void MEM_Debug(var string message) {
    message = ConcatStrings(zERR_DEBUG_PREFIX, message);
    
    if (zERR_DEBUG_TOSCREEN) {
        Print(message);
    };
    
    if (zERR_DEBUG_ERRORBOX) {
        MEMINT_ForceErrorBox = true;
    };
    
    if (zERR_DEBUG_ERRORBOX || zERR_DEBUG_TOSPY) {
        MEM_SendToSpy(zERR_DEBUG_TYPE, message);
    };
};

//--------------------------------------
//  Извлечение информации из стека парсера
//--------------------------------------

class MEMINT_HelperClass {};
var MEMINT_HelperClass MEMINT_INSTUNASSIGNED;
var MEMINT_HelperClass MEMINT_PopDump;

func int MEMINT_StackPushInt (var int val) {
    return +val;
};

//Внимание: в стек проталкивается ссылка!
func string MEMINT_StackPushString (var string val) {
    return val;
};

func MEMINT_HelperClass MEMINT_StackPopInstSub () {};
func void MEMINT_StackPopInst () {
    MEMINT_PopDump = MEMINT_StackPopInstSub();
};

func void MEMINT_StackPushInst (var int val) {
    MEMINT_StackPushInt (val);
    MEMINT_StackPopInst();
};

func void MEMINT_StackPushVar (var int adr) {
    MEMINT_StackPushInst (adr);
    MEMINT_StackPushInst (zPAR_TOK_PUSHVAR);
};

//Альтернативные формулировки:
func int    MEMINT_PopInt() {};
func string MEMINT_PopString() {};
func int    MEMINT_StackPopInt() {};
func string MEMINT_StackPopString() {};
func int    MEMINT_StackPopInstAsInt() {
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};

//--------------------------------------
//  MEM_Helper
//--------------------------------------

INSTANCE MEM_HELPER_INST (C_NPC)
{
    name = MEM_HELPER_NAME;
    id = 42;

    /* бессмертный: */
    flags = 2;
    attribute   [ATR_HITPOINTS_MAX] = 2;
    attribute   [ATR_HITPOINTS]     = 2;

    /* любая визуализация: */
    Mdl_SetVisual           (self,  "Meatbug.mds");
};

var oCNpc MEM_Helper;

func void MEMINT_GetMemHelper() {
    MEM_Helper = Hlp_GetNpc (MEM_HELPER_INST);

    if (!Hlp_IsValidNpc (MEM_Helper)) {
        //временно помещается в self
        var C_NPC selfBak;
        selfBak = Hlp_GetNpc (self);
        Wld_InsertNpc (MEM_HELPER_INST, MEM_FARFARAWAY);
        MEM_Helper = Hlp_GetNpc (self);
        self = Hlp_GetNpc (selfBak);
    };
};

//GOTHIC_BASE_VERSION == 1 ? g1Val : g2Val
func int MEMINT_SwitchG1G2(var int g1Val, var int g2Val) {
    if (GOTHIC_BASE_VERSION == 1) {
        return g1Val;
    } else {
        return g2Val;
    };
	
	return g2Val;
};

//######################################################
//
//  Базовые операции чтения и записи
//
//######################################################

//--------------------------------------
// Чтение информации из стека парсера
//--------------------------------------

func int MEM_ReadInt (var int address) {
    /* Примечание: не вызовет ошибки, если Ikarus полностью
     * запущен из MEM_InitAll. Эта функция будет заменена. */
    if (address <= 0) {
        MEM_Error (ConcatStrings ("MEM_ReadInt: Invalid address: ", IntToString (address)));
        return 0;
    };
    
    MEMINT_StackPushVar (address);
    MEMINT_StackPushInt (MEMINT_StackPopInt()); //как int, а не как var из стека
};

func string MEM_ReadString (var int address) {
    if (address <= 0) {
        MEM_Error (ConcatStrings ("MEM_ReadString: Invalid address: ", IntToString (address)));
        return "";
    };

    MEMINT_StackPushVar (address);
};

//--------------------------------------
// Присваивание
//--------------------------------------

//Старый метод чтения используется только для загрузки новой системы.
func void MEMINT_OldWriteInt (var int address, var int val) {
    /* other = address - MEM_NpcID_Offset */
    MEM_Helper.enemy = address - MEM_NpcID_Offset;
    /* res не нужен, но иначе в стеке будет мусор! */
    var int res; res = Npc_GetTarget (MEM_Helper);

    /* *(other + oCNpc_idx_offset) = val */
    other.id = val;
};

func void MEMINT_PrepareAssignments() {
    /* гарантирует, что MEMINT_Assign и MEMINT_StrAssign точно
     * вызовут функцию zPAR_OP_IS или zPAR_TOK_ASSIGNSTR.
     * Эта функция вызывается после старта Готики ровно один раз. */

    var int symTab; var int MEMINT_Assign_Sym; var int MEMINT_Assign_StackPos; var int stackStart;

    //Навигация в коде данных функций:
    symTab                  = MEM_ReadInt (ContentParserAddress + zCParser_symtab_table_array_offset);
    stackStart              = MEM_ReadInt (ContentParserAddress + zCParser_stack_offset);
    MEMINT_Assign_Sym       = MEM_ReadInt (symTab + 4 * (MEMINT_AssignPredecessor + 1));
    MEMINT_Assign_StackPos  = MEM_ReadInt (MEMINT_Assign_Sym + zCParSymbol_content_offset);

    //старый метод чтения использует NPC
    MEMINT_GetMemHelper();
    var C_NPC othBak;
    othBak = Hlp_GetNpc (other);

    //Код переписывается. Внимание: Первый вызов будет также работать!
    MEMINT_OldWriteInt (stackStart + MEMINT_Assign_StackPos     , (zPAR_OP_IS          << 0) | (zPAR_TOK_RET       << 8) | (zPAR_TOK_RET << 16) | (zPAR_TOK_RET << 24));
    MEMINT_OldWriteInt (stackStart + MEMINT_Assign_StackPos +  4, (zPAR_TOK_RET        << 0) | (zPAR_OP_IS         << 8) | (zPAR_TOK_RET << 16) | (zPAR_TOK_RET << 24));
    MEMINT_OldWriteInt (stackStart + MEMINT_Assign_StackPos +  8, (zPAR_TOK_ASSIGNSTR  << 0) | (zPAR_TOK_RET       << 8) | (zPAR_TOK_RET << 16) | (zPAR_TOK_RET << 24));
    MEMINT_OldWriteInt (stackStart + MEMINT_Assign_StackPos + 12, (zPAR_TOK_RET        << 0) | (zPAR_TOK_ASSIGNSTR << 8) | (zPAR_TOK_RET << 16) | (zPAR_TOK_RET << 24));

    //нужно почистить после старого метода чтения
    MEM_Helper.enemy = 0;
    other = Hlp_GetNpc (othBak);
};

var MEMINT_HelperClass MEMINT_AssignPredecessor;
func void MEMINT_Assign() {
    /* Здесь должно быть:
     *  zPAR_OP_IS
     *  zPAR_TOK_RET
     *
     * что я и записываю: */

    MEMINT_PrepareAssignments (); //zPAR_TOK_CALL + 4 байта
    return;                       //zPAR_TOK_RET
    return;                       //zPAR_TOK_RET
                                  //zPAR_TOK_RET

    //В сумме: 8 байт
};

func void MEMINT_StrAssign() {
    /* Здесь должно быть:
     *  zPAR_TOK_ASSIGNSTR
     *  zPAR_TOK_RET
     *
     * что я и записываю: */

    MEMINT_PrepareAssignments (); //zPAR_TOK_CALL + 4 байта
    return;                       //zPAR_TOK_RET
    return;                       //zPAR_TOK_RET
                                  //zPAR_TOK_RET

    //В сумме: 8 байт
};

//--------------------------------------
// Операции записи
//--------------------------------------

func void MEM_WriteInt (var int address, var int val) {
    /* Примечание: не вызовет ошибки, если Ikarus полностью
     * запущен из MEM_InitAll. Эта функция будет заменена. */

    if (address <= 0) {
        MEM_Error (ConcatStrings ("MEM_WriteInt: Invalid address: ", IntToString (address)));
        return;
    };

    MEMINT_StackPushInt (val);
    MEMINT_StackPushVar (address);

    MEMINT_Assign();
};

func void MEM_WriteString (var int address, var string val) {
    if (address <= 0) {
        MEM_Error (ConcatStrings ("MEM_WriteString: Invalid address: ", IntToString (address)));
        return;
    };

    MEMINT_StackPushString (val);
    MEMINT_StackPushVar (address);

    MEMINT_StrAssign();
};

//------------------------------------------------
//  Побайтный доступ
//------------------------------------------------

func int MEM_ReadByte (var int adr) {
    return MEM_ReadInt (adr) & 255;
};

func void MEM_WriteByte (var int adr, var int val) {
    if (val & ~ 255) {
        MEM_Warn ("MEM_WriteByte: Val out of range! Truncating to 8 bits.");
        val = val & 255;
    };
    
    MEM_WriteInt (adr, (MEM_ReadInt (adr) & ~ 255) | val);
};

//--------------------------------------
// Доступ к массивам
//--------------------------------------

func int MEM_ReadIntArray (var int arrayAddress, var int offset) {
    return MEM_ReadInt (arrayAddress + 4 * offset);
};

func void MEM_WriteIntArray (var int arrayAddress, var int offset, var int value) {
    MEM_WriteInt (arrayAddress + 4 * offset, value);
};

func int MEM_ReadByteArray (var int arrayAddress, var int offset) {
    return MEM_ReadByte (arrayAddress + offset);
};

func void MEM_WriteByteArray (var int arrayAddress, var int offset, var int value) {
    MEM_WriteByte (arrayAddress + offset, value);
};
/* Теперь в LeGo добавлена:
func string MEM_ReadStringArray (var int arrayAddress, var int offset) {
    return MEM_ReadString (arrayAddress + offset * sizeof_zString);
};*/

func void MEM_WriteStringArray (var int arrayAddress, var int offset, var string value) {
    MEM_WriteString (arrayAddress + sizeof_zString * offset, value);
};

//######################################################
//
//  Основные функции, связанные с zCParser
//
//######################################################

//Устарело, используйте MEM_Parser!
const int currParserAddress              = 0; //константа, чтобы верное значение сохранялось в процессе загрузки
const int currSymbolTableAddress         = 0;
const int currSymbolTableLength          = 0;
const int currSortedSymbolTableAddress   = 0;
const int currParserStackAddress         = 0;
const int contentSymbolTableAddress      = 0;

func void MEM_ReinitParser() {
    currParserAddress = ContentParserAddress;
    
    //Таблица символов парсера:
    currSymbolTableAddress          = MEM_ReadInt (currParserAddress + zCParser_symtab_table_array_offset);
    currSymbolTableLength           = MEM_ReadInt (currParserAddress + zCParser_symtab_table_array_offset + 8);
    currSortedSymbolTableAddress    = MEM_ReadInt (currParserAddress + zCParser_sorted_symtab_table_array_offset);
    currParserStackAddress          = MEM_ReadInt (currParserAddress + zCParser_stack_offset);

    //И еще таблица символов для данных:
    contentSymbolTableAddress       = MEM_ReadInt (ContentParserAddress + zCParser_symtab_table_array_offset);
};

//удалено, осталась заглушка
func void MEM_SetParser(var int ID) {
    if (!ID) {
        MEM_Warn("MEM_SetParser was removed in Ikarus Version 1.2 and should not be used any more.");
    } else {
        MEM_Error("MEM_SetParser was removed in Ikarus Version 1.2 and cannot be used to change the current parser any more.");
    };
};

//************************************************
// Получение и назначение смещения инстанций
//************************************************

//--------------------------------------
// Получение инстанции из указателя
//--------------------------------------

var int MEM_AssignInstSuppressNullWarning;
func void MEM_AssignInst (var int inst, var int ptr) {
    if (inst <= 0) {
        /* Примечание: не может быть inst == 0,
         * но, возможно, не создано ни одной инстанции 
		 * после объявления класса. */
        MEM_Error (ConcatStrings ("MEM_AssignInst: Invalid instance: ", IntToString (inst)));
        return;
    };

    if (ptr <= 0) {
        if (ptr < 0) {
            MEM_Error (ConcatStrings ("MEM_AssignInst: Invalid pointer: ", IntToString (ptr)));
            return;
        } else if (!MEM_AssignInstSuppressNullWarning) {
            /* Нулевая инстанция не даст ничего, кроме проблем. */
            MEM_Warn ("MEM_AssignInst: ptr is NULL. Use MEM_AssignInstNull if that's what you want.");
        };
    };

    var int sym;
    sym = MEM_ReadIntArray (currSymbolTableAddress, inst);
    MEM_WriteInt (sym + zCParSymbol_offset_offset, ptr);
};

func void MEM_AssignInstNull (var int inst) {
    /* Обычно не требуется устанавливать инстанции в 0.
     * Чаще всего это приводит к ошибкам. Поэтому выше выдается предупреждение.
     * На случай, если такое все же потребуется, создана данная функция. */
    MEM_AssignInstSuppressNullWarning = true;
    MEM_AssignInst (inst, 0);
    MEM_AssignInstSuppressNullWarning = false;
};

func MEMINT_HelperClass MEM_PtrToInst (var int ptr) {
    var MEMINT_HelperClass hlp;
    const int hlpOffsetPtr = 0;
    if (!hlpOffsetPtr) {
        hlpOffsetPtr = MEM_ReadIntArray (currSymbolTableAddress, hlp) + zCParSymbol_offset_offset;
    };
    
    if (ptr <= 0) {
        if (ptr < 0) {
            MEM_Error (ConcatStrings ("MEM_PtrToInst: Invalid pointer: ", IntToString (ptr)));
            return;
        } else if (!MEM_AssignInstSuppressNullWarning) {
            /* Нулевая инстанция не даст ничего, кроме проблем.  */
            MEM_Warn ("MEM_PtrToInst: ptr is NULL. Use MEM_NullToInst if that's what you want.");
        };
        
        MEM_WriteInt(hlpOffsetPtr, 0);
    } else {
        MEM_WriteInt(hlpOffsetPtr, ptr);
    };
    MEMINT_StackPushInst (hlp);
};

func MEMINT_HelperClass _^ (var int ptr) {
    MEM_PtrToInst(ptr);
};

func MEMINT_HelperClass MEM_NullToInst () {
    var MEMINT_HelperClass hlp;
    MEMINT_StackPushInst (hlp);
};

func MEMINT_HelperClass MEM_CpyInst (var int inst) {
    MEMINT_StackPushInst (inst);
};

//--------------------------------------
// Устаревшая реликвия из времен,
// когда был возможен прямой доступ
// к парсерам menu/pfx/vfx
//--------------------------------------

func void MEM_AssignContentInst (var int inst, var int ptr) {
    const int once = 0;
    if (!once) { once = true;
        MEM_Warn("MEM_AssignContentInst: This function was deprecated in Ikarus Version 1.2. Use the equivalent MEM_AssignInst instead.");
    };
    
    MEM_AssignInst(inst, ptr);
};

func void MEM_AssignContentInstNull (var int inst) {
    const int once = 0;
    if (!once) { once = true;
        MEM_Warn("MEM_AssignContentInstNull: This function was deprecated in Ikarus Version 1.2. Use the equivalent MEM_AssignInstNull instead.");
    };
    
    MEM_AssignInstNull(inst);
};

//--------------------------------------
// Получение смещения инстанции
//--------------------------------------

func int MEM_InstToPtr(var int inst) {
    if (inst <= 0) {
        /* Примечание: не может быть inst == 0,
         * но, возможно, не создано ни одной инстанции 
		 * после объявления класса. */
        MEM_Error (ConcatStrings ("MEM_InstGetOffset: Invalid inst: ", IntToString (inst)));
        return 0;
    };

    var int symb;
    symb = MEM_ReadIntArray (currSymbolTableAddress, inst);
    return MEM_ReadInt (symb + zCParSymbol_offset_offset);
};

//Обратная совместимость
func int MEM_InstGetOffset (var int inst) {
    return MEM_InstToPtr(inst);
};

//--------------------------------------
// Басполезна. Только для обратной
// совместимости. Google говорит, что
// где-то использовалось у Lehona.
//--------------------------------------

//Можно установить указатель currParserSymb на инстанцию inst.
INSTANCE currParserSymb (zCPar_Symbol);
func void MEM_SetCurrParserSymb (var int inst) {
    if (inst <= 0) {
        MEM_Error (ConcatStrings ("MEM_SetCurrParserSymb: Invalid inst: ", IntToString (inst)));
        return;
    };

    var int symOffset; var int currParserSymOffset;
    symOffset           = MEM_ReadIntArray (currSymbolTableAddress, inst);
    currParserSymOffset = MEM_ReadIntArray (contentSymbolTableAddress, currParserSymb);

    MEM_WriteInt (currParserSymOffset + zCParSymbol_offset_offset, symOffset);
};

//************************************************
//   Переходы
//************************************************

/* Выглядит просто, да? Но его работа не столь
 * очевидна, как можно подумать.
 * Вот так, например, подействует:
{
    label = MEM_StackPos.position;

    [...]

    MEM_StackPos.position = label;
};

 * А здесь гранзиозные планы пойдут крахом:

{
    label = MEM_StackPos.position + 0;

    [...]

    MEM_StackPos.position = label;
};

 * Экспериментаторы, скорее всего, наткнутся на грабли.
 * Чистая случайность, что все так просто работает! */

class MEMINT_StackPos {
    var int position;
};

var MEMINT_StackPos MEM_StackPos;

func void MEM_InitLabels() {
    MEM_StackPos = _^(ContentParserAddress + zCParser_stack_stackPtr_offset);
};

func void MEM_CallByPtr(var int ptr) {
    MEM_StackPos.position = ptr;
};

func void MEM_CallByOffset(var int offset) {
    MEM_CallByPtr(offset + currParserStackAddress);
};

//************************************************
//   Идея Gottfried'а: идентификатор (ID) функции
//************************************************

func int MEM_GetFuncID(var func fnc) {
    var zCPar_Symbol symb; /* фиктивный символ с индексом indexOf(fnc)+1 */
    symb = MEM_PtrToInst(MEM_ReadIntArray(contentSymbolTableAddress, symb - 1));
   
    var int res;
    var int loop; loop = MEM_StackPos.position;
    
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_FUNC) {
        MEM_Warn("MEM_GetFuncID: Unresolvable request (probably uninitialised function variable).");
        return -1;
    };
    
    if (symb.bitfield & zPAR_FLAG_CONST) {
        return +res;
    } else {
        res = symb.content;
        symb = MEM_PtrToInst(MEM_ReadIntArray(contentSymbolTableAddress, res));
        MEM_StackPos.position = loop;
    };
};

func int MEM_GetFuncOffset(var func fnc) {
    var int r;
    r = MEM_GetFuncID(fnc); //ID(fnc)
    r = MEM_ReadIntArray(contentSymbolTableAddress, r); //symbolTable[ID(fnc)]
    r = MEM_ReadInt(r + zCParSymbol_content_offset); //symbolTable[ID(fnc)].content
    return r + 0;
};

func int MEM_GetFuncPtr(var func fnc) {
    return MEM_GetFuncOffset(fnc) + currParserStackAddress;
};

func void MEM_ReplaceFunc(var func f1, var func f2) {
    var int ptr;    ptr    = MEM_GetFuncPtr(f1);
    var int target; target = MEM_GetFuncOffset(f2);
    
    /* тут, пожалуйста, на одном дыхании, а вдруг кто-то изменит то, что мне нужно. */
    MEM_WriteByte(ptr, zPAR_TOK_JUMP);
    MEM_WriteInt (ptr + 1, target);
};

//************************************************
// Функции, которые помогут мне писать бинарный код
//************************************************

var int MEMINT_OverrideFunc_Ptr;
func void MEMINT_InitOverideFunc(var func f) {
    MEMINT_OverrideFunc_Ptr = MEM_GetFuncPtr(f);
};

/* override function, token */
func void MEMINT_OFTok(var int tok) {
    MEM_WriteByte(MEMINT_OverrideFunc_Ptr, tok);
    MEMINT_OverrideFunc_Ptr += 1;
};

/* override function, token + parameter */
func void MEMINT_OFTokPar(var int tok, var int param) {
    MEMINT_OFTok(tok);
    MEM_WriteInt(MEMINT_OverrideFunc_Ptr, param);
    MEMINT_OverrideFunc_Ptr += 4;
};


//************************************************
// Новые операторы
//************************************************

//--------------------------------------
//  Оператор адреса
//--------------------------------------

//Пустышки, которые будут заполнены позже:
func int MEM_GetIntAddress(var int i) {
    MEM_Error("MEM_GetIntAddress called before MEM_GetAddress_Init!");
    return 0;
};
 
func int MEM_GetFloatAddress(var float f) {
    MEM_Error("MEM_GetFloatAddress called before MEM_GetAddress_Init!");
    return 0;
};

func int MEM_GetStringAddress(var string s) {
    MEM_Error("MEM_GetStringAddress called before MEM_GetAddress_Init!");
    return 0;
};

func int _@(var int i) {
    MEM_Error("_@ called before MEM_GetAddress_Init!");
    i = i; i = i; i = i; i = i; i = i; i = i; /* немного места */
    return 0;
};

func int _@s(var string s) {
    MEM_Error("_@s called before MEM_GetAddress_Init!");
    return 0;
};

func int _@f(var float f) {
    MEM_Error("_@f called before MEM_GetAddress_Init!");
    return 0;
};

func void MEMINT_GetAddress_Init(var func f) {
    var MEMINT_HelperClass symb;
    
    MEMINT_InitOverideFunc(f);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINST  , symb            );
    MEMINT_OFTok   (zPAR_TOK_ASSIGNINST                  ); 
    MEMINT_OFTokPar(zPAR_TOK_PUSHINST  , zPAR_TOK_PUSHINT);
    MEMINT_OFTok   (zPAR_TOK_RET                         );
};

func void MEM_GetAddress_Init() {
    const int init_done = 0;
    if (!init_done) {
        MEMINT_GetAddress_Init(MEM_GetIntAddress);
        MEMINT_GetAddress_Init(MEM_GetFloatAddress);
        MEMINT_GetAddress_Init(MEM_GetStringAddress);
        MEMINT_GetAddress_Init(STR_GetAddress);
        MEMINT_GetAddress_Init(_@f);
        MEMINT_GetAddress_Init(_@s);
    
        /* кое-что еще для _@ */
        MEMINT_InitOverideFunc(_@);
        /* push zPAR_TOK_PUSHINT     */ MEMINT_OFTokPar(zPAR_TOK_PUSHINST     , zPAR_TOK_PUSHINT                 );
        /* push int zPAR_TOK_PUSHINT */ MEMINT_OFTokPar(zPAR_TOK_PUSHINT      , zPAR_TOK_PUSHINT                 );
        /* equal?                    */ MEMINT_OFTok   (zPAR_OP_EQUAL);
        /* jumpF                     */ MEMINT_OFTokPar(zPAR_TOK_JUMPF        , MEMINT_OverrideFunc_Ptr + 16 - currParserStackAddress);
        /* push zPAR_TOK_PUSHINT     */ MEMINT_OFTokPar(zPAR_TOK_PUSHINST     , zPAR_TOK_PUSHINT                 );
        /* call MEM_InstToPtr        */ MEMINT_OFTokPar(zPAR_TOK_CALL         , MEM_GetFuncOffset(MEM_InstToPtr) );
        /* ret                       */ MEMINT_OFTok   (zPAR_TOK_RET);
        /* push zPAR_TOK_PUSHINT     */ MEMINT_OFTokPar(zPAR_TOK_PUSHINST     , zPAR_TOK_PUSHINT                 );                
        /* ret                       */ MEMINT_OFTok   (zPAR_TOK_RET);
        /* return var address as int */ 
        
        init_done = true;
    };
};

/****   обратная совместимость: ****/

//псевдоним для обратной совметимости
func void STR_GetAddressInit() {
    MEM_GetAddress_Init();
};

/* для обатной совместимости здесь гарантируется, что
 * STR_GetAddress будет работать и без инициализации, но в первый раз
 * она может вернуть адрес копии строки */
 
func int STR_GetAddress(var string str) {
    str = str; //пропуск 11 байт
    MEM_GetAddress_Init(); //перезаписываем 12 байт THIS-функции 
    
    return STR_GetAddress(str);
};

//************************************************
//	Доступ к статическим массивам
//************************************************

//Рабочие
func int  MEMINT_ReadStatArr(var int offset) {
    if (offset < 0) {
        MEM_Error("MEM_ReadStatArr: Offset < 0!");
        return 0;
    };

    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
    
    var int adr;
    adr = MEMINT_StackPopInt();
    
    return MEM_ReadIntArray(adr, offset);
};

func void MEMINT_WriteStatArr(var int offset, var int value) {
    if (offset < 0) {
        MEM_Error("MEM_WriteStatArr: Offset < 0!");
        return;
    };
    
    /* выталкиваем только два первых, третий по-другому: */
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
    
    var int adr;
    adr = MEMINT_StackPopInt();
    
    MEM_WriteIntArray(adr, offset, value);
};

func void MEMINT_WriteStatStringArr(var int offset, var string value) {
    if (offset < 0) {
        MEM_Error("MEM_WriteStatStringArr: Offset < 0!");
        return;
    };
    
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
    
    var int adr; adr = MEMINT_StackPopInt();
    adr += sizeof_zString * offset;
    MEM_WriteString(adr, value);
};

func string MEMINT_ReadStatStringArr(var int offset) {
    if (offset < 0) {
        MEM_Error("MEM_ReadStatStringArr: Offset < 0!");
        return "";
    };
    
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
    
    var int adr; adr = MEMINT_StackPopInt();
    adr += sizeof_zString * offset;
    return MEM_ReadString(adr);
};

//Заглушки
func void MEM_WriteStatArr (var int array, var int offset, var int value)  {
    MEM_Error ("MEM_WriteStatArr was called before MEM_InitStatArrs!");
};

func int  MEM_ReadStatArr (var int array, var int offset) {
    MEM_Error ("MEM_ReadStatArr was called before MEM_InitStatArrs!");
    return 0;
};

func void MEM_WriteStatStringArr(var string array, var int offset, var string value) {
    MEM_Error ("MEM_WriteStatStringArr was called before MEM_InitStatArrs!");
};

func string MEM_ReadStatStringArr(var string array, var int offset) {
    MEM_Error ("MEM_ReadStatStringArr was called before MEM_InitStatArrs!");
};

func void MEM_InitStatArrs() {
    const int done = 0;
    
    if (!done) {
        MEM_ReplaceFunc(MEM_WriteStatArr,  MEMINT_WriteStatArr);
        MEM_ReplaceFunc(MEM_ReadStatArr,   MEMINT_ReadStatArr);
        MEM_ReplaceFunc(MEM_WriteStatStringArr,  MEMINT_WriteStatStringArr);
        MEM_ReplaceFunc(MEM_ReadStatStringArr,   MEMINT_ReadStatStringArr);
        done = true;
    };
};

//######################################################
//
//  Выделение памяти
//
//######################################################

func int MEM_Alloc (var int amount) {
    /* стока "AAAA" */
    var int strPtr;
    var string str; str = "AAAA";
    
    strPtr = _@s(str); //Адрес zStrings для символа str.

    var zString zstr;
    zstr = _^(strPtr); //zstr теперь указывает на str

    /* Заполняем нулями, т.к. я хочу очистить память */
    MEM_WriteInt (zstr.ptr, 0);

    /* слепляем строку саму с собой для выделения достоточного пространства */
    var int size; size = 4;

    //ВНИМАНИЕ! Цикл должен выполниться хотя бы раз.
    //Иначе(скорее всего, точно не проверял) вернется статический адрес константы "AAAA"!
    //И это действительно паршивая ошибка.
    var int loopStart; loopStart = MEM_StackPos.position;
    /* do */
        str = ConcatStrings (str, str);
        size *= 2;
    /* while */  if (size < amount) {  MEM_StackPos.position = loopStart; };

    /* Память выделена. Удаляем ссылку на строку. */
    /* Внимание: ptr строки указывает на 1 байт после первого зарезервированного!
     * Строки содержат счетчик ссылок! */
    var int res; res = zstr.ptr - 1;
    
    zstr.ptr = 0;
    zstr.len = 0;
    zstr.res = 0;
    
    /* Глобальная строка ConcatStrings-String больше не должна ссылаться на нашу строку! */
    
    //*(byte*)res == 1
    str = ConcatStrings("", "");
    //*(byte*)res == 0

    return res;
};

func void MEM_Free (var int ptr) {
    /* нулевой указатель не освобождается */
    if (!ptr) {
        MEM_Warn ("MEM_Free: ptr is 0. Ignoring request.");
        return;
    };
    
    /* Внимание: ptr строки указывает на 1 байт после первого зарезервированного!
     * Строки содержат счетчик ссылок! Обнулить! */
    
    MEM_WriteByte(ptr, 0); ptr += 1;
    
    /* Получаем вспомогательные строки */
    var int strPtr;
    var string str; str = "";
    
    strPtr = _@s(str);

    var zString zstr;
    zstr = _^(strPtr);

    /* берем строку в памяти и особождаем память, присваивая строке "" */
    zstr.ptr = ptr;
    zstr.len = 1;
    zstr.res = 1;

    str = "";
};

//#################################################
//
//    Пакет CALL
//
//#################################################

/* 1 байт */
const int ASMINT_OP_movImToECX   = 185;  //0xB9
const int ASMINT_OP_movImToEDX   = 186;  //0xBA
const int ASMINT_OP_pushIm       = 104;  //0x68
const int ASMINT_OP_call         = 232;  //0xE8
const int ASMINT_OP_retn         = 195;  //0xC3
const int ASMINT_OP_nop          = 144;  //0x90
const int ASMINT_OP_jmp          = 233;  //0xE9
const int ASMINT_OP_PushEAX      =  80;  //0x50
const int ASMINT_OP_pusha       = 96;    //0x60 //aus LeGo geklaut
const int ASMINT_OP_popa        = 97;    //0x61 //aus LeGo geklaut
const int ASMINT_OP_movMemToEAX = 161;   //0xA1 //aus LeGo geklaut

/* 2 байта */
const int ASMINT_OP_movEAXToMem     =  1417; //0x0589
const int ASMINT_OP_floatStoreToMem =  7641; //0x1DD9
const int ASMINT_OP_addImToESP      = 50307; //0xC483
const int ASMINT_OP_movMemToECX     =  3467; //0x0D8B
const int ASMINT_OP_movMemToEDX     =  5515; //0x158B
const int ASMINT_OP_movECXtoEAX     = 49547; //0xC18B  aus LeGo geklaut
const int ASMINT_OP_movESPtoEAX     = 50315; //0xC48B  aus LeGo geklaut
const int ASMINT_OP_movEAXtoECX     = 49545; //0xC189  aus LeGo geklaut
const int ASMINT_OP_movEBXtoEAX     = 55433; //0xD889  aus LeGo geklaut
const int ASMINT_OP_movEBPtoEAX     = 50571; //0xC58B  aus LeGo geklaut
const int ASMINT_OP_movEDItoEAX     = 51083; //0xC78B  aus LeGo geklaut
const int ASMINT_OP_addImToEAX      = 49283; //0xC083  aus LeGo geklaut

/* Регулировка:
   Если особо не оговорено,
   максимльный объем памяти, доступной Ассемблеру
   будет равен этой величине. */
const int ASM_StandardStreamLength = 256;

//************************************************
//   ASM
//************************************************

/* -----------------
/  ВНУТРЕННИЙ СТЕК
/  ----------------- */

/* ASM требует сохранения данных в двух случаях:
 * 1.) При вызове функций движка требуется сохранить
 * адрес текущего исполняемого кода, поскольку
 * в вызове может снова использоваться ASM!
 * 2.) При вложенности функций в пакете CALL
 * требуется проталкивать и извлекать контекст.
 * 3.) Переполнение нежелательно и приводит к вылету.
 */

const int ASMINT_InternalStack = 0;
const int ASMINT_InternalStackWalker = 0;
const int ASMINT_InternalStackSize = 1024;

func void ASMINT_Push(var int data) {
    if (ASMINT_InternalStackWalker >= ASMINT_InternalStackSize) {
        MEM_Error("ASMINT_Push: You seem to nest Engine Calls very extensively (or there is an Error in the ASM / CALL Package of Ikarus. Please contact Sekti with this problem!");
    };
    
    MEM_WriteIntArray(ASMINT_InternalStack, ASMINT_InternalStackWalker, data);
    ASMINT_InternalStackWalker += 1;
};

func int ASMINT_Pop() {
    if (ASMINT_InternalStackWalker <= 0) {
        MEM_Error("ASMINT_Pop: Underflow! This is probably connected to wrong use of the Call functions.");
    };
    
    ASMINT_InternalStackWalker -= 1;
    return MEM_ReadIntArray(ASMINT_InternalStack, ASMINT_InternalStackWalker);
};

/* -----------------
/  Ядро ASM
/  ----------------- */

const int ASMINT_CallTarget = 0;

func void ASMINT_MyExternal() {};   /* Символ этой функции превратится во внешний символ */
func void ASMINT_CallMyExternal() { /* вызывает что-то внешнее */
    ExitGame(); /* изменится, поэтому и называется MyExternal */
};

func void ASMINT_Init() {
    /* раньше использовалось для установки указателя на вызываемую функцию. */
    if (!ASMINT_InternalStack) {
        /* создаем массив для дальнейшего использования */
            ASMINT_InternalStack = MEM_Alloc(4 * ASMINT_InternalStackSize);
        
        /* ищем ASMINT_MyExternal */
            ASMINT_CallTarget = MEM_ReadIntArray (currSymbolTableAddress, MEM_GetFuncID(ASMINT_MYEXTERNAL));
            var zCPar_Symbol symb; symb = _^(ASMINT_CallTarget);
            ASMINT_CallTarget += zCParSymbol_content_offset; //сюда я впишу, что вызывать
    
        /* превращаем ASMINT_MyExternal во внешний вызов */
            symb.bitfield = zPAR_TYPE_FUNC | zPAR_FLAG_EXTERNAL | zPAR_FLAG_CONST;
            
        /* теперь ASM_CallMyExternal будет вызывать MyExternal вместо ExitGame */
            MEM_WriteInt(MEM_GetFuncPtr(ASMINT_CallMyExternal) + 1, MEM_GetFuncID(ASMINT_MyExternal));
    };
};

const int ASMINT_currRun = 0;
const int ASMINT_cursor  = 0;
const int ASMINT_Length  = 0;

func void ASM_Open(var int space) {
    if (ASMINT_currRun) {
        MEM_Error ("ASM_Open: Only one stream of assembler code can be constructed at any given time (ASM_Open was called again before closing operation).");
        return;
    };
    
    if (!space) {
        space = ASM_StandardStreamLength; //размер по умолчанию
    };
    
    ASMINT_currRun = MEM_Alloc (space + 3); /* не тратим байты в конце буфера */
    ASMINT_Length  = space;
    ASMINT_cursor  = ASMINT_currRun; /* указатель на начало */
};

func void ASM (var int data, var int length) {
    if (!ASMINT_currRun) {
        ASM_Open (0);
    };
    
    if (ASMINT_cursor - ASMINT_currRun + length > ASMINT_Length) {
        MEM_Error ("ASM: Reserved length is exceeded.");
        return;
    };
    
    MEM_WriteInt (ASMINT_cursor, data);
    ASMINT_cursor += length;
};

func void ASM_1 (var int data) { ASM (data, 1); };
func void ASM_2 (var int data) { ASM (data, 2); };
func void ASM_3 (var int data) { ASM (data, 3); };
func void ASM_4 (var int data) { ASM (data, 4); };

func int ASM_Here() {
    if (!ASMINT_currRun) {
        ASM_Open (0);
    };
    
    return ASMINT_cursor;
};

func int ASM_Close() {
    ASM (ASMINT_OP_retn, 1);
    var int res; res = ASMINT_currRun;
    ASMINT_currRun = 0;
    return res;
};

func void ASM_Run(var int ptr) {
    MEM_WriteInt(ASMINT_CallTarget, ptr);
    ASMINT_CallMyExternal();
};

func void ASM_RunOnce() {
    if (!ASMINT_currRun) {
        MEM_Error ("ASM: ASM_Open has to be called before calling ASM_RunOnce.");
    };
    
    ASM (ASMINT_OP_retn, 1);
    
    /* Сохраняем текущий код в массив кодов.
     * Причина: При вызове из другой инстанции эта функция
     * может выполнять свой собственный код */
    
    ASMINT_Push(ASMINT_currRun);
    
    MEM_WriteInt(ASMINT_CallTarget, ASMINT_currRun);
    ASMINT_currRun = 0; //можно добавить еще код, пока это выполняется.
    
    ASMINT_CallMyExternal();
    
    /* Снова сбрасываем код */
    MEM_Free(ASMINT_Pop()); //освобождаем память
};

//************************************************
//   Быстрые вызовы
//************************************************

const int CALLINT_CodeMode = 0;
    const int CALLINT_CodeMode_Disposable = 0;
    const int CALLINT_CodeMode_Recyclable = 1;
const int CALLINT_numParams = 0;
const int CALLINT_RetValStructSize = 0;
const int CALLINT_RetValIsFloat = 0;
const int CALLINT_PutRetValTo = 0;

/* --------------------
/  Проталкивание и извлечение из стека
/  ----------------- */

/* Эти функции можно использовать только в пакете CALL
 * Это потребовалось, поскольку многие базовые функции из библиотек
 * попытаются сделать вызовы, когда пользователь уже может в них нуждаться. */

func void ASMINT_PushContext() {
    ASMINT_Push(CALLINT_RetValStructSize);
    ASMINT_Push(CALLINT_RetValIsFloat);
    ASMINT_Push(CALLINT_PutRetValTo);
    ASMINT_Push(CALLINT_numParams);
    ASMINT_Push(CALLINT_CodeMode);
    
    ASMINT_Push(ASMINT_currRun);
    ASMINT_Push(ASMINT_cursor);
    ASMINT_Push(ASMINT_Length);
    
    ASMINT_currRun = 0;
    CALLINT_CodeMode = CALLINT_CodeMode_Disposable;
    CALLINT_numParams = 0;
    CALLINT_RetValIsFloat = 0;
    CALLINT_PutRetValTo      = 0;
    CALLINT_RetValStructSize = 0;
};

func void ASMINT_PopContext() {
    ASMINT_Length    = ASMINT_Pop();
    ASMINT_cursor    = ASMINT_Pop();
    ASMINT_currRun   = ASMINT_Pop();
    
    CALLINT_CodeMode        = ASMINT_Pop();
    CALLINT_numParams       = ASMINT_Pop();
    CALLINT_PutRetValTo        = ASMINT_Pop();
    CALLINT_RetValIsFloat   = ASMINT_Pop();
    CALLINT_RetValStructSize= ASMINT_Pop();
};
    
/* Есть два режима: простой режим, который обеспечивает
 * доступный вызов, который используется лишь раз. Все параметры
 * запрограммированы жестко.
 * Второй вариант выдает код, который можно использовать
 * более одного раза. Вместо параметров пользователь
 * указывает адрес, по которому их можно найти.
 * Дополнительно к выполнению кода, пользователь
 * получит адрес, который можно использовать,
 * чтобы повторить вызов. Это гораздо быстрее, чем
 * еще раз набирать тот же код. */
 
/* Получение указателя. Если указатель ненулевой,
 * соответствующий код выполняется и возвращается 0.
 * Если указатель равен нулю, текущий режим меняется
 * на повторяющийся, т.е. функции вызова ожидают
 * инструкций для построения повторяющегося кода. Этот режим
 * продолжается до ALL_End(). Таким образом, можно получить такой код:
 
func int EngineFunc_Wrapper(var int this, var int param) {
    const int call = 0;
    if(CALL_Begin(call)) {
        CALL_IntParam(MEM_GetIntAddress(param));
        CALL_thiscall(MEM_GetIntAddress(this), EngineFunc_ptr);
        call = CALL_End();
    };
    return CALL_RetValAsInt();
}; */

func void CALL_Open() {
    /* Проталкивает и пустой контекст, остается неясным как CALL_Close
     * решает, надо извлекать данные или нет.
     * Более того: Это выполняется только 1 раз. */
    ASMINT_PushContext();
    CALLINT_CodeMode = CALLINT_CodeMode_Recyclable;
};

func int CALL_Begin(var int ptr) {
    if (ptr) {
        ASM_Run(ptr);
        return 0;
    };
     
    CALL_Open();
    return 1;
};

func int CALL_Close() {
    if (CALLINT_CodeMode != CALLINT_CodeMode_Recyclable) {
        MEM_Error("CALL_Close: CALL_End or CALL_Close without matching CALL_Begin / CALL_Open? There is some serious problem with your code.");
        return 0;
    };
    
    var int ptr;
    ptr = ASM_Close();
    ASMINT_PopContext(); /* извлекаем прежний контекст */
    
    return ptr;
};

func int CALL_End() {
    var int ptr;
    ptr = CALL_Close();
    
    ASMINT_Push(ptr);
    ASM_Run(ptr); /* можно использовать CALL_End */
    return ASMINT_Pop();
};

//************************************************
//   Набор кода для размещения параметров
//   в машинном стеке.
//************************************************

/* int */
func void CALL_IntParam(var int param) {
    if (CALLINT_CodeMode == CALLINT_CodeMode_Recyclable) {
        ASM_1(ASMINT_OP_movMemToEAX);
        ASM_4(param);
        ASM_1(ASMINT_OP_PushEAX);
    } else {
        ASM_1 (ASMINT_OP_pushIm);
        ASM_4 (param);
    };
    
    CALLINT_numParams += 1;
};

/* void */
func void CALL_PtrParam (var int param) {
    CALL_IntParam (param);
};

/* float */
func void CALL_FloatParam (var int param) {
    CALL_IntParam (param);
};

//string: Проблема: Строка должна где-то существовать.
//Чтобы измежать перегруженного кода, который позволил бы
//освободить память строк после завершения, я взял 10 разных
//статических строк. Маловероятно, что кто-то захочет
//протолкнуть в машинный стек больше 10 строк за раз.
func string CALLINT_PushString (var string str) {
    var int n; n += 1; if (n == 10) { n = 0; };
    if (n == 0) { var string s0; s0 = str; return s0; };
    if (n == 1) { var string s1; s1 = str; return s1; };
    if (n == 2) { var string s2; s2 = str; return s2; };
    if (n == 3) { var string s3; s3 = str; return s3; };
    if (n == 4) { var string s4; s4 = str; return s4; };
    if (n == 5) { var string s5; s5 = str; return s5; };
    if (n == 6) { var string s6; s6 = str; return s6; };
    if (n == 7) { var string s7; s7 = str; return s7; };
    if (n == 8) { var string s8; s8 = str; return s8; };
    if (n == 9) { var string s9; s9 = str; return s9; };
    
    MEM_AssertFail ("Should be never here.");
};

func int CALLINT_GetStringAddress (var string str) {
    return _@s(CALLINT_PushString (str));
};

/* zString*  */
func void CALL_zStringPtrParam (var string param) {
    if (CALLINT_CodeMode != CALLINT_CodeMode_Disposable) {
        MEM_Error("CALL_zStringPtrParam: This function only works when writing a disposable call!");
        return;
    };
    
    /* просто проталкиваем адрес в стек */
    CALL_IntParam (CALLINT_GetStringAddress(param));
};

/* cString*  */
func void CALL_cStringPtrParam (var string param) {
    if (CALLINT_CodeMode != CALLINT_CodeMode_Disposable) {
        MEM_Error("CALL_cStringPtrParam: This function only works when writing a disposable call!");
        return;
    };

    /* получаем указатель на данные и помещаем его в стек */
    var zString str; str = _^(CALLINT_GetStringAddress(param));
    CALL_IntParam (str.ptr);
};

/* структура (не указатель на структуру, а сама структура) */
func void CALL_StructParam (var int ptr, var int words) {
    if (CALLINT_CodeMode == CALLINT_CodeMode_Recyclable) {
        CALL_IntParam (ptr + 4 * (words -1)); /* здесь я ожидаю последнее слово */
        CALL_StructParam (ptr, words - 1);
        return;
    };

    /* структура целиком должна быть размещена в стеке,
     * и ее нужно проталкивать в обратном порядке */
    if (words > 0) {
        CALL_IntParam (MEM_ReadIntArray (ptr, words - 1));
        CALL_StructParam (ptr, words - 1);
    };
};

/* переключатель: Если возвращаемое значение является структурой,
 * размером более 32 бит, пространство для возвращаеомго значения
 * должно быть выделено вызывающей стороной (т.е. нами).
 * Адрес выделенной памяти ожидается в стеке
 * как дополнительный параметр (проталкивается последним)
 *
 * Предупреждение: Под вашей ответственностью остается освобождение 
 * памяти после того, как возвращаемое значение больше не нужно.
 */
 
func void CALL_RetValIsStruct (var int size) {
    if (CALLINT_CodeMode == CALLINT_CodeMode_Recyclable) {
        MEM_Error("CALL_RetValIsStruct: Only supported in disposable calls (not with CALL_Begin and CALL_End).");
        return;
    };

    CALLINT_RetValStructSize = size;
};

/* особый случай CALL_RetValIsStruct
 * zString - это структура размером 20 байт. */
func void CALL_RetValIszString() {
    CALL_RetValIsStruct (sizeof_zString);
};

/* переключатель: если возвращаемое значение вещественное
 * (и поэтому находится наверху стека FPU вместо регистра EAX),
 * я должен об этом знать. */
func void CALL_RetValIsFloat() {
    CALLINT_RetValIsFloat = true;
};

func void CALL_PutRetValTo(var int adr) {
    if (adr == 0) {
        CALLINT_PutRetValTo =  -1;
    } else {
        CALLINT_PutRetValTo = adr;
    };
};

//************************************************
//   Получение результата вызова
//************************************************

/* возвращает значение, которое записано туда при вызове */
var int CALLINT_Result;

/* если значение - это 32-битная константа, тут нечего делать */
func int CALL_RetValAsInt  () { return +CALLINT_Result; };
func int CALL_RetValAsFloat() { return +CALLINT_Result; };
func int CALL_RetValAsPtr  () { return +CALLINT_Result; };

/* для тех, кому лень самим использовать _^: */
func MEMINT_HelperClass CALL_RetValAsStructPtr() {
    _^(CALLINT_Result);
};

/* лезем в стек парсера, чтобы получить указатель на zStrings */
func string CALL_RetValAszStringPtr() {
    if (CALLINT_Result) {
        MEMINT_StackPushVar(CALLINT_Result);
    } else {
        return "";
    };
};

/* zString - это очень особая структура, с той отличительной чертой,
 * что она использует простой тип данных. Никто добровольно не будет
 * использовать ее как указатель на память или инстанцию в Daedalus.
 * Эта функция копирует содержимое zString в строку Daedalus'а
 * и после этого освобождает zString. */
func string CALL_RetValAszString() {
    var string ret;
    if (CALLINT_Result) {
        ret = CALL_RetValAszStringPtr();
        
        MEMINT_StackPushString("");
        CALL_RetValAszStringPtr();
        
        MEMINT_StrAssign();
        
        MEM_Free (CALLINT_Result);
        CALLINT_Result = 0;
    };
    
    return ret;
};

//************************************************
//   Вызовы
//************************************************

func void CALLINT_makecall (var int adr, var int cleanStack) {
    if (CALLINT_RetValStructSize) {
        CALL_IntParam (MEM_Alloc (CALLINT_RetValStructSize));
        CALLINT_RetValStructSize = 0;
    };

    /* выполенение вызова: */
    ASM_1 (ASMINT_OP_call);
    ASM_4 (adr - ASM_Here() - 4); /* -4, потому что переход относительно инструкции _next_. */
    
    /* копируем результат в переменную daedalus'а */
    if (CALLINT_PutRetValTo != -1) {
        if (!CALLINT_RetValIsFloat) {
            ASM_2 (ASMINT_OP_movEAXToMem); /* mov CALLINT_Result eax */
        } else {
            ASM_2 (ASMINT_OP_floatStoreToMem); /* fstp CALLINT_Result */
        };
        
        if (CALLINT_PutRetValTo) {
            ASM_4 (CALLINT_PutRetValTo);
        } else {
            ASM_4 (MEM_GetIntAddress(CALLINT_Result));
        };
    };
    
    /* по умолчанию: возвращаемое значение не вещественное
     * и размещется там, где должно по умолчанию */
    CALLINT_RetValIsFloat = false; //в следующий раз придется установить заново.
    CALLINT_PutRetValTo   = 0;
    
    /* __cdecl должен очистить стек здесь: */
    if (cleanStack) {
        ASM_2 (ASMINT_OP_addImToESP);
        ASM_1 (CALLINT_numParams * 4);
    };
    
    /* сбрасываем счетчик параметров */
    CALLINT_numParams = 0;
    
    /* запускаем набранный код, а потом удаляем его */
    if (CALLINT_CodeMode != CALLINT_CodeMode_Recyclable) {
        ASM_RunOnce();
    };
};

/* все параметры помещаются в стек (справа налево)
   вызываемая функция очищает стек */
func void CALL__stdcall (var int adr) {
    CALLINT_makecall (adr, false);
};

/* все параметры помещаются в стек (справа налево)
   вызывающая функция очищает стек */ 
func void CALL__cdecl (var int adr) {
    CALLINT_makecall (adr, true);
};

/* __stdcall, но с указателем на this в регистре ecx. */
func void CALL__thiscall (var int this, var int adr) {
    /* this -> ecx */
    if (CALLINT_CodeMode == CALLINT_CodeMode_Recyclable) {
        ASM_2(ASMINT_OP_movMemToECX);
    } else {
        ASM_1(ASMINT_OP_movImToECX);
    };
    
    ASM_4 (this);
    CALL__stdcall (adr);
};

/* __stdcall, но с первыми двумя параметрами в ecx и edx. */
func void CALL__fastcall (var int ecx, var int edx, var int adr) {
    if (CALLINT_CodeMode == CALLINT_CodeMode_Recyclable) {
        ASM_2(ASMINT_OP_movMemToEDX);
    } else {
        ASM_1 (ASMINT_OP_movImToEDX);
    };
    
    ASM_4 (edx);
    
    CALL__thiscall (ecx, adr);
};

//#################################################
//
//    УТИЛИТЫ
//
//#################################################

//--------------------------------------
// Включение отладочной информации
//--------------------------------------

/* Совет: сразу включите в Startup_Global и Init_Global
 * вывод отладочной информации.
 * Никакого вреда от этого не будет.
 * Перед релизом мода опять отключите. */

func void MEM_SetShowDebug (var int on) {
    MEM_WriteInt (showDebugAddress, on);
};

//----------------------------------
//  Копирование области памяти
//----------------------------------

func void MEM_CopyBytes (var int src, var int dst, var int byteCount) {
    const int memcpy_G1 = 7846464; //0x77BA40
    const int memcpy_G2 = 8213280; //0x7D5320
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(byteCount));
        CALL_IntParam(_@(src));
        CALL_IntParam(_@(dst));
        
        CALL_PutRetValTo(0);
        CALL__cdecl(MEMINT_SwitchG1G2(memcpy_G1, memcpy_G2));
        
        call = CALL_End();
    };
};

func void MEM_CopyWords (var int src, var int dst, var int wordcount) {
    MEM_CopyBytes (src, dst, wordcount * 4);
};

//псевдоним, для обратной совместимости
func void MEM_Copy (var int src, var int dst, var int wordcount) {
    MEM_CopyBytes (src, dst, wordcount * 4);
};

//----------------------------------
//  Swap (обмен байт памяти)
//----------------------------------

func void MEM_SwapBytes(var int src, var int dst, var int byteCount) {
    const int swap_G1 = 7829281; //0x777721
    const int swap_G2 = 8196369; //0x7D1111

    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(byteCount));
        CALL_PtrParam(_@(src));
        CALL_PtrParam(_@(dst));
        
        CALL_PutRetValTo(0);
        CALL__cdecl(MEMINT_SwitchG1G2(swap_G1, swap_G2));
        call = CALL_End();
    };
};

func void MEM_Swap(var int src, var int dst, var int wordCount) {
    MEM_SwapBytes(src, dst, wordCount*4);
};

func void MEM_SwapWords(var int src, var int dst, var int wordCount) {
    MEM_SwapBytes(src, dst, wordCount*4);
};

//----------------------------------
//  memset (очистка памяти)
//----------------------------------

func void MEM_Clear(var int ptr, var int size) {
    const int memset_G1 = 7877040; //0x7831B0
    const int memset_G2 = 8243856; //0x7DCA90
    
    var int null;
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(size));
        CALL_IntParam(_@(null));
        CALL_PtrParam(_@(ptr));
        
        CALL_PutRetValTo(0);
        CALL__cdecl(MEMINT_SwitchG1G2(memset_G1, memset_G2));
        
        call = CALL_End();
    };
};

//----------------------------------
//  Realloc (перераспределение памяти)
//----------------------------------

/* Память копируется в новый массив */
func int MEM_Realloc (var int ptr, var int oldsize, var int newsize) {
    if (!ptr) {
        /* Жалоба? */
        if (!oldsize) {
            MEM_Error ("MEM_Realloc: ptr is 0 but oldsize is not 0.");
        };

        return MEM_Alloc (newsize);
    };
    
    const int realloc_G1 = 7712186; //0x75ADBA
    const int realloc_G2 = 8078522; //0x7B44BA
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(newsize));
        CALL_PtrParam(_@(ptr));
        
        CALL_PutRetValTo(_@(ptr));
        CALL__cdecl(MEMINT_SwitchG1G2(realloc_G1, realloc_G2));
        
        call = CALL_End();
    }; /* ptr теперь заполнен */
    
    if (oldsize < newsize) {
        MEM_Clear(ptr + oldsize, newsize - oldsize);
    };
    
    return +ptr;
};

//************************************************
//   Compare Memory (сравнение участков памяти)
//************************************************

/* не смог найти memcmp с первого взгляда...
 * оставим все как есть. */
 
func int MEM_CompareBytes(var int ptr1, var int ptr2, var int byteCount) {
    if (byteCount < 0) {
        MEM_Error ("MEM_CompareBytes: Cannot compare less than 0 bytes!");
        return 0;
    };
    
    if (byteCount == 0) {
        //в этом случае адрес может быть неверным.
        return 1;
    };
    
    if (ptr1 <= 0)
    || (ptr2 <= 0) {
        MEM_Error ("MEM_CompareBytes: ptr1 or ptr2 is invalid (<= 0)");
        return 0;
    };

    var int loopPos; loopPos = MEM_StackPos.position;
    if (byteCount >= 4) {
        if (MEM_ReadInt(ptr1) != MEM_ReadInt(ptr2)) {
            return 0;
        };
        ptr1 += 4; ptr2 += 4;
        byteCount -= 4;
        MEM_StackPos.position = loopPos;
    };
    
    var int mask; mask = (1 << byteCount * 8) - 1;
    return (MEM_ReadInt(ptr1) & mask) == (MEM_ReadInt(ptr2) & mask);
};

func int MEM_CompareWords(var int ptr0, var int ptr1, var int wordCount) {
    return MEM_CompareBytes(ptr0, ptr1, wordCount * 4);
};

func int MEM_Compare(var int ptr0, var int ptr1, var int wordCount) {
    return MEM_CompareBytes(ptr0, ptr1, wordCount * 4);
};

//#################################################
//
//     Утилиты Windows
//
//#################################################

//--------------------------------------
//   Загрузка функций из внешних DLL
//--------------------------------------

/*  http://msdn.microsoft.com/en-us/library/ms684175%28v=vs.85%29.aspx */
func int LoadLibrary (var string lpFileName) {
    const int call = 0;
    if (CALL_Begin(call)) {
        var int WinAPI__LoadLibrary;
        if (GOTHIC_BASE_VERSION == 2) {
            WinAPI__LoadLibrary = MEM_ReadInt (8577604); //0x82E244
        } else {
            WinAPI__LoadLibrary = MEM_ReadInt (8192588); //0x7D024C
        };
    
        CALL_PtrParam(_@s(lpFileName) + 8 /* смещение ptr */);
        
        CALL_PutRetValTo(_@(ret));
        CALL__stdcall(WinAPI__LoadLibrary);
    
        call = CALL_End();
    };
    
    var int ret;
    return +ret;
};

/* http://msdn.microsoft.com/en-us/library/ms683212%28v=vs.85%29.aspx */
func int GetProcAddress (var int hModule, var string lpProcName) {
    const int call = 0;
    
    if (CALL_Begin(call)) {
        var int WinAPI__GetProcAddress;
        if (GOTHIC_BASE_VERSION == 2) {
            WinAPI__GetProcAddress = MEM_ReadInt (8577688); //0x82E298
        } else {
            WinAPI__GetProcAddress = MEM_ReadInt (8192260); //0x7D0104
        };
        
        CALL_PtrParam(_@s(lpProcName) + 8 /* смещение ptr */);
        CALL_PtrParam (_@(hModule));
        
        CALL_PutRetValTo(_@(ret));
        CALL__stdcall (WinAPI__GetProcAddress);
        
        call = CALL_End();
    };
    
    var int ret;
    return +ret;
};  

//Простое применение этих двух функций.
func int FindKernelDllFunction (var string name) {
    const int KERNEL32DLL = 0;
    if (!KERNEL32DLL) {
        KERNEL32DLL = LoadLibrary ("KERNEL32.DLL");
    };
    
    return GetProcAddress(KERNEL32DLL, name);
};

//--------------------------------------
//   Обход защиты от записи
//--------------------------------------

const int PAGE_EXECUTE = 16; //0x10
const int PAGE_EXECUTE_READ = 32; //0x20
const int PAGE_EXECUTE_READWRITE = 64; //0x40
const int PAGE_EXECUTE_WRITECOPY = 128; //0x80

const int PAGE_NOACCESS = 1; //0x01
const int PAGE_READONLY = 2; //0x02
const int PAGE_READWRITE = 4; //0x04
const int PAGE_WRITECOPY = 8; //0x08

/* http://msdn.microsoft.com/en-us/library/aa366898%28VS.85%29.aspx */
/* Примечание: Я сделал так, чтобы lpflOldProtectPtr возвращала значение 
 * и игнорировала значение из VirtualProtect */
func int VirtualProtect (var int lpAddress, var int dwSize, var int flNewProtect) {
    const int adr = 0;
    
    if (!adr) {
        adr = FindKernelDllFunction ("VirtualProtect");
    };
    
    var int lpflOldProtect;
    var int lpflOldProtectPtr;
    lpflOldProtectPtr = _@(lpflOldProtect);
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam (_@(lpflOldProtectPtr));
        CALL_IntParam (_@(flNewProtect));
        CALL_IntParam (_@(dwSize));
        CALL_PtrParam (_@(lpAddress));
        
        CALL_PutRetValTo(0);
        CALL__stdcall (adr);
        
        call = CALL_End();
    };
    
    return lpflOldProtect;
};

func void MemoryProtectionOverride (var int address, var int size) {
    var int resDump;
    resDump = VirtualProtect (address, size, PAGE_EXECUTE_READWRITE);
};

//--------------------------------------
//    Окно сообщения (MessageBox)
//--------------------------------------

const int MB_OK                = 0;
const int MB_OKCANCEL          = 1;
const int MB_ABORTRETRYIGNORE  = 2;
const int MB_YESNOCANCEL       = 3;
const int MB_YESNO             = 4;
const int MB_RETRYCANCEL       = 5;
const int MB_CANCELTRYCONTINUE = 6;

const int MB_ICONERROR         = 16; //0x10
const int MB_ICONQUESTION      = 32; //0x20
const int MB_ICONWARNING       = 48; //0x30
const int MB_ICONINFORMATION   = 64; //0x40

//синонимы:
    const int MB_ICONEXCLAMATION = MB_ICONWARNING;
    const int MB_ICONASTERISK    = MB_ICONINFORMATION;
    const int MB_ICONSTOP        = MB_ICONERROR;
    const int MB_ICONHAND        = MB_ICONERROR;

const int MB_DEFBUTTON1 =   0; //0x000
const int MB_DEFBUTTON2 = 256; //0x100
const int MB_DEFBUTTON3 = 512; //0x200
const int MB_DEFBUTTON4 = 768; //0x300
    
const int IDOK       =  1;
const int IDCANCEL   =  2;
const int IDABORT    =  3;
const int IDRETRY    =  4;
const int IDIGNORE   =  5;
const int IDYES      =  6;
const int IDNO       =  7;
const int IDTRYAGAIN = 10;
const int IDCONTINUE = 11;

func int MEM_MessageBox (var string txt, var string caption, var int type) {
    /* Это сами функции */
    const int WinAPI__MessageBox_G2 = 8079592; //0x7B48E8
    const int WinAPI__MessageBox_G1 = 7713298; //0x75B212
    
    const int MB_TASKMODAL     = 8192;    //0x2000
    
    /* Параметры в обратном порядке */
    CALL_IntParam (type | MB_TASKMODAL); //поверх других окон
    CALL_cStringPtrParam (caption);        
    CALL_cStringPtrParam (txt);            
    CALL_IntParam (0);                     
    
    CALL__stdcall (MEMINT_SwitchG1G2(WinAPI__MessageBox_G1, WinAPI__MessageBox_G2));
    
    return CALL_RetValAsInt();
};

func void MEM_InfoBox (var string txt) {
    var int res;
    res = MEM_MessageBox (txt, "Information:", MB_OK | MB_ICONINFORMATION);
};

//#################################################################
//
//  Масивы
//
//#################################################################

//************************************************
// Alloc / Clear / Free / Size / Read / Write
//************************************************

func int MEM_ArrayCreate () {
    return MEM_Alloc (sizeof_zCArray);
};

func void MEM_ArrayFree(var int zCArray_ptr) {
    var int array; array = MEM_ReadInt (zCArray_ptr);

    if (array) {
        MEM_Free (array);
    };

    MEM_Free (zCArray_ptr);
};

func void MEM_ArrayClear (var int zCArray_ptr) {
    var zCArray array;
    array = _^(zCArray_ptr);

    if (array.array) {
        MEM_Free (array.array);
        array.array = 0;
    };

    array.numAlloc = 0;
    array.numInArray = 0;
};

func int MEM_ArraySize(var int zCArray_ptr) {
    return MEM_ReadInt(zCArray_ptr + 8);
};

func void MEM_ArrayWrite(var int zCArray_ptr, var int pos, var int value) {
    var zCArray array;
    array = _^(zCArray_ptr);
    
    if (pos < 0 || array.numInArray <= pos) {
        MEM_Error (ConcatStrings("MEM_ArrayWrite: pos out of bounds: ", IntToString(pos)));
        return;
    };
    
    MEM_WriteIntArray(array.array, pos, value);
};

func int MEM_ArrayRead(var int zCArray_ptr, var int pos) {
    var zCArray array; array = _^(zCArray_ptr);
    
    if (pos < 0 || array.numInArray <= pos) {
        MEM_Error (ConcatStrings("MEM_ArrayRead: pos out of bounds: ", IntToString(pos)));
        return 0;
    };
    
    return MEM_ReadIntArray(array.array, pos);
};

//************************************************
// Insert / Push / Pop / Top
//************************************************

func void MEM_ArrayInsert (var int zCArray_ptr, var int value) {
    var zCArray array;
    array = _^(zCArray_ptr);

    if (!array.array) {
        //Еще ни один массив не был создан. Создается впервые
        array.numAlloc = 16; //начальное значение
        array.array = MEM_Alloc (array.numAlloc * 4);
    } else if (array.numInArray >= array.numAlloc) {
        //нет свободного места
        //давайте запросим вдвое больше (или я жадничаю? должно хватить):
        array.numAlloc = 2 * array.numAlloc;
        array.array = MEM_Realloc (array.array, array.numInArray * 4, array.numAlloc * 4);
    };

    //Теперь место должно быть:
    MEM_WriteIntArray (array.array, array.numInArray, value);
    array.numInArray += 1;
};

func void MEM_ArrayPush (var int zCArray_ptr, var int value) {
    MEM_ArrayInsert(zCArray_ptr, value);
};

func int MEM_ArrayPop(var int zCArray_ptr) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayPop: Invalid address: zCArray_ptr may not be null!");
        return 0;
    };
    
    var zCArray array;
    array = _^(zCArray_ptr);
    
    if (!array.numInArray) {
        MEM_Error ("MEM_ArrayPop: Underflow! Cannot pop from empty array.");
        return 0;
    };
    
    array.numInArray -= 1;
    return MEM_ReadIntArray(array.array, array.numInArray);
};

func int MEM_ArrayTop(var int zCArray_ptr) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayTop: Invalid address: zCArray_ptr may not be null!");
        return 0;
    };
    
    var zCArray array;
    array = _^(zCArray_ptr);
    
    if (!array.numInArray) {
        MEM_Error ("MEM_ArrayTop: Underflow! Cannot pop from empty array.");
        return 0;
    };
    
    return MEM_ReadIntArray(array.array, array.numInArray - 1);
};

//************************************************
//   IndexOf / RemoveIndex / RemoveValue[Once]
//************************************************

func int MEM_ArrayIndexOf(var int zCArray_ptr, var int value) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayIndexOf: Invalid address: zCArray_ptr may not be null!");
        return -1;
    };
    
    var zCArray array;
    array = _^(zCArray_ptr);
    
    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;
    
    if (i < array.numInArray) {
        if (MEM_ReadIntArray(array.array, i) == value) {
            return i;
        };
        
        i += 1;
        MEM_StackPos.position = loop;
    };
    
    return -1;
};

func void MEM_ArrayRemoveIndex (var int zCArray_ptr, var int index) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayRemoveIndex: Invalid address: zCArray_ptr may not be null!");
        return;
    };

    var zCArray array;
    array = _^(zCArray_ptr);

    if (array.numInArray <= index) {
        MEM_Error ("MEM_ArrayRemoveIndex: index lies beyond the end of the array!");
        return;
    };

    //Ставим последнее значение вместо удаленного
    array.numInArray -= 1;
    MEM_WriteIntArray (array.array, index, MEM_ReadIntArray (array.array, array.numInArray));
};

var int MEMINT_ArrayRemoveValue_OnlyOnce;
func void MEM_ArrayRemoveValue (var int zCArray_ptr, var int value) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayRemoveValue: Invalid address: zCArray_ptr may not be null!");
        return;
    };

    var zCArray array;
    array = _^(zCArray_ptr);

    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;

    //уже закончился?
    /* while */ if (i < array.numInArray) {
        if (MEM_ReadIntArray (array.array, i) == value) {
            //удаляем элемент
            array.numInArray -= 1;
            MEM_WriteIntArray (array.array, i, MEM_ReadIntArray (array.array, array.numInArray));

            //продолжаем искать?
            if (MEMINT_ArrayRemoveValue_OnlyOnce) {
                MEMINT_ArrayRemoveValue_OnlyOnce = 2; //управление
                return;
            };
        } else {
            i += 1;
        };

        MEM_StackPos.position = loop;
    };
};

func void MEM_ArrayRemoveValueOnce (var int zCArray_ptr, var int value) {
    MEMINT_ArrayRemoveValue_OnlyOnce = true;
    MEM_ArrayRemoveValue (zCArray_ptr, value);

    if (MEMINT_ArrayRemoveValue_OnlyOnce != 2) {
        MEM_Warn (ConcatStrings ("MEM_ArrayRemoveValueOnce: Could not find value: ", IntToString (value)));
    };

    MEMINT_ArrayRemoveValue_OnlyOnce = false;
};

//************************************************
//    Sort / Unique
//************************************************

func void MEMINT_QSort(var int base, var int num, var int size, var int comparator) {
    const int qsort_G1 = 7828863; //0x77757F
    const int qsort_G2 = 8195951; //0x7D0F6F
    
    const int compare_G1 = 5502288; //0x53F550
    const int compare_G2 = 5586080; //0x553CA0
    
    if (comparator == 0) {
        comparator = MEMINT_SwitchG1G2(compare_G1, compare_G2);
    };
    
    var int qsort;
    qsort   = MEMINT_SwitchG1G2(qsort_G1,   qsort_G2  );
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(comparator));
        CALL_IntParam(_@(size));
        CALL_IntParam(_@(num));
        CALL_PtrParam(_@(base));
        
        CALL_PutRetValTo(0);
        CALL__cdecl(qsort);
        
        call = CALL_End();
    };
};

func void MEM_ArraySort(var int zCArray_ptr) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArraySort: Invalid address: zCArray_ptr may not be null!");
        return;
    };

    var zCArray array;
    array = _^(zCArray_ptr);
    
    MEMINT_QSort(array.array, array.numInArray, 4, 0);
};

func void MEM_ArrayUnique(var int zCArray_ptr) {
    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayUnique: Invalid address: zCArray_ptr may not be null!");
        return;
    };

    var zCArray array;
    array = _^(zCArray_ptr);
    
    var int reader; var int writer; var int oldVal; var int newVal;
    reader = 0; writer = 0;
    
    var int loop; loop = MEM_StackPos.position;
    
    if (reader < array.numInArray) {
        newVal = MEM_ReadIntArray(array.array, reader);
        
        if (!reader || newVal != oldVal) {
            MEM_WriteIntArray(array.array, writer, newVal);
            writer += 1;
            oldVal = newVal;
        };
    
        reader += 1;
        MEM_StackPos.position = loop;
    };
    
    array.numInArray = writer;
};

//************************************************
//    ToString
//************************************************

func string MEM_ArrayToString (var int zCArray_ptr) {
    var string res; res = "";

    if (!zCArray_ptr) {
        MEM_Error ("MEM_ArrayRemoveValue: Invalid address: zCArray_ptr may not be null!");
        return "";
    };

    var zCArray array;
    array = _^(zCArray_ptr);

    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;
    /* while */ if (i < array.numInArray) {
        res = ConcatStrings (res, IntToString (MEM_ReadIntArray (array.array, i)));
        if (i < array.numInArray - 1) {
            res = ConcatStrings (res, ",");
        };
        i += 1;

        MEM_StackPos.position = loop;
    };

    return res;
};

//######################################################
//
//  Работа со строками
//
//######################################################

//--------------------------------------
// Доступ к отдельному символу
//--------------------------------------

func int STR_GetCharAt (var string str, var int pos) {
    var zString zStr;
    zStr = _^(_@s(str));

    if (pos < 0) || (pos >= zStr.len) {
        MEM_Warn ("STR_GetCharAt: Reading out of bounds! returning 0.");
        return 0;
    };

    return MEM_ReadByte(zStr.ptr + pos);
};

//--------------------------------------
// Длина строки
//--------------------------------------

func int STR_Len (var string str) {
    var zString zStr;
    zStr = _^(_@s(str));
    return +zStr.len;
};

//--------------------------------------
// В и из char*
//--------------------------------------

/*  Осторожно, строки могут разделять буфер меджду собой!
    var string s1; var string s2;
    s1 = "Hello"; s2 = s1;
    
    Теперь в памяти существует единтсвенная копия "Hello" !
    Реализуется через счетчик ссылок
    в ptr-1.
 */

func int STR_toChar (var string str) {
    var zString zStr;
    zStr = _^(_@s(str));
    return +zStr.ptr;
};

func int STRINT_toChar (var string str) {
    return STR_ToChar(str);
};

func string STR_FromChar(var int char) {
    var string str;
    str = "";
    var int ptr; ptr = _@s(str);

    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(char));
        
        /* zString::zString(const char*) */
        CALL__thiscall(_@(ptr), MEMINT_SwitchG1G2(4199328 /* 0x4013A0 */,
                                                  4198592 /* 0x4010C0 */));
        call = CALL_End();
    };
    
    return str;
};

//************************************************
// Подстрока / префикс
//************************************************

func string STR_SubStr (var string str, var int start, var int count) {
    if (start < 0) || (count < 0) {
        MEM_Error ("STR_SubStr: start and count may not be negative.");
        return "";
    };

    /* Получение адреса двух строк, источника и целевой строки для копирования */
    var zString zStrSrc;
    var zString zStrDst; var string dstStr; dstStr = "";
    
    zStrSrc = _^(_@s(str));
    zStrDst = _^(_@s(dstStr));

    if (zStrSrc.len < start + count) {
        if (zStrSrc.len < start) {
            MEM_Warn ("STR_SubStr: The desired start of the substring lies beyond the end of the string.");
            return "";
            
        } else {
            /* Начало выходит за границы строки. Конец в полном пролете. */
            /* Осторожно! MEM_Warn сам использует STR_SubStr (но никогда не вызывает новых предупреждений) */
            var string saveStr; var int saveStart; var int saveCount;
            saveStr = str; saveStart = start; saveCount = count;
            MEM_Warn ("STR_SubStr: The end of the desired substring exceeds the end of the string.");
            str = saveStr; start = saveStart; count = saveCount;
            count = zStrSrc.len - start;
        };
    };

    zStrDst.ptr = MEM_Alloc (count+2)+1; /* +1 для байта счетчика ссылок, +1 для нулевого байта */
    zStrDst.res = count;

    MEM_CopyBytes (zStrSrc.ptr + start, zStrDst.ptr, count);

    zStrDst.len = count;

    return dstStr;
};

//Для префикса строки:
func string STR_Prefix (var string str, var int len) {
    return STR_SubStr(str, 0, len);
};

//************************************************
// Сравнение строк
//************************************************

const int STR_GREATER =  1;
const int STR_EQUAL   =  0;
const int STR_SMALLER = -1;

func int STR_Compare(var string str1, var string str2) {
    const int strncmp_G1 = 7887344; //0x7859F0
    const int strncmp_G2 = 8254144; //0x7DF2C0
    
    var int ptr1; ptr1 = _@s(str1);
    var int ptr2; ptr2 = _@s(str2);
    
    var int len1; len1 = MEM_ReadInt(ptr1 + 12);
    var int len2; len2 = MEM_ReadInt(ptr2 + 12);
    
    var int n; if (len1 > len2) { n = len2; } else { n = len1; };
    
    /* доступ к zString.ptr */
    ptr1 = MEM_ReadInt(ptr1 + 8);
    ptr2 = MEM_ReadInt(ptr2 + 8);
    
    if (!ptr1 && !ptr2) {
        return STR_EQUAL;
    } else if (!ptr1) {
        return STR_SMALLER;
    } else if (!ptr2) {
        return STR_GREATER;
    };
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(n));
    
        CALL_PtrParam(_@(ptr2));
        CALL_PtrParam(_@(ptr1));
        
        CALL_PutRetValTo(_@(ret));
        CALL__cdecl(MEMINT_SwitchG1G2(strncmp_G1, strncmp_G2));
        
        call = CALL_End();
    };
    
    /* В Готике возвращается -1, 0 или 1 */
    var int ret;
    
    if (ret == 0) {
        if (len1 > len2) {
            return STR_GREATER;
        } else if (len1 < len2) {
            return STR_SMALLER;
        };
    };
    
    return +ret;
};

//************************************************
// STR_ToInt
//************************************************

/* Кое-что еще от atol, так что я оставляю как есть */

func int STR_ToInt (var string str) {
    var int len;
    len = STR_Len (str);

    var int buf; var int index;
    buf = STR_toChar(str);
    index = 0;

    var int res; res = 0; var int minus; minus = FALSE;

    var int loopStart; loopStart = MEM_StackPos.position;
    /* while */ if (index < len) {
        var int chr; chr = MEM_ReadInt (buf + index) & 255;

        if (chr >= 48 /* 0 */) && (chr <= 57 /* 9 */) {
            res = res * 10 + (chr - 48);
        } else if (index == 0) {
            //поддерживается знак в начале
            if (chr == 43 /*+*/) {
                /* игнорируем */
            } else if (chr == 45 /*-*/) {
                minus = true;
            } else {
                MEM_Warn (ConcatStrings ("STR_ToInt: cannot convert string: ", str));
                return 0;
            };
        } else {
            MEM_Warn (ConcatStrings ("STR_ToInt: cannot convert string: ", str));
            return 0;
        };
        index += 1;
        MEM_StackPos.position = loopStart;
    };

    if (minus) {
        return -res;
    } else {
        return +res;
    };
};

//************************************************
// STR_IndexOf
//************************************************

func int STR_IndexOf(var string str, var string tok) {
    var zString zStr; zStr = _^(_@s(str));
    var zString zTok; zTok = _^(_@s(tok));
    
    if(zTok.len == 0) {
        return 0;
    };
    if (zStr.len == 0) {
        return -1;
    };
    
    var int startPos; startPos = zStr.ptr;
    var int startMax; startMax = zStr.ptr + zStr.len - zTok.len;
    
    var int loopPos; loopPos = MEM_StackPos.position;
    if (startPos <= startMax) {
        if (MEM_CompareBytes(startPos, zTok.ptr, zTok.len)) {
            return startPos - zStr.ptr;
        };
        startPos += 1;
        MEM_StackPos.position = loopPos;
    };
    return -1;
};

//************************************************
// STR_Split
//************************************************

/* оригинальный код от Gottfried */

/* STRINT_SplitArray содержит следующее:
 *
 *    struct TStringInfo {
 *        int length;
 *        char* data;
 *    };
 */

const int STRINT_SplitArray = 0;
 
func void STRINT_SplitReset() {
    if(!STRINT_SplitArray) {
        STRINT_SplitArray = MEM_ArrayCreate();
        return;
    };
    
    var zCArray arr; arr = _^(STRINT_SplitArray);
    
    var int i; i = 0;
    var int loopPos; loopPos = MEM_StackPos.position;
    
    if /*while*/ (i < arr.numInArray) {
        MEM_Free(MEM_ReadIntArray(arr.array, i + 1));
        i += 2;
        MEM_StackPos.position = loopPos;
    };
    
    MEM_ArrayClear(STRINT_SplitArray);
};
 
func void STRINT_Split(var string Str, var string seperator) {
    STRINT_SplitReset();
    
    var zString zStr; zStr = _^(_@s(Str));
    
    if (STR_Len(seperator) != 1) {
        MEM_Error("STR_Split: Seperator must be a string of length 1!");
        return;
    };
    
    if (zStr.len == 0) {
        //осторожно: нельзя считывать zStr.ptr, если zStr.len == 0!
        //обработка без скучных расчетов приведет к плачевным результатам.
        MEM_ArrayInsert(STRINT_SplitArray, 0);
        MEM_ArrayInsert(STRINT_SplitArray, MEM_Alloc(0));
        return;
    };
    
    var int cSep; cSep = STR_GetCharAt(seperator, 0);
    
    var int currTokStart; currTokStart = zStr.ptr;
    var int strEnd; strEnd = zStr.ptr + zStr.len;
    var int walker; walker = currTokStart;
    var int loopPos; loopPos = MEM_StackPos.position;
    if /* while*/ (walker <= strEnd) {
        if (walker == strEnd || MEM_ReadByte(walker) == cSep) {
            var int len; len = walker-currTokStart;
            var int subStr; subStr = MEM_Alloc(len);
            MEM_CopyBytes(currTokStart, subStr, len);
            MEM_ArrayInsert(STRINT_SplitArray, len);
            MEM_ArrayInsert(STRINT_SplitArray, subStr);
            currTokStart = walker + 1;
        };
        
        walker += 1;
        MEM_StackPos.position = loopPos;
    };
};
 
func string STRINT_SplitGet(var int offset) {
    var zCArray arr; arr = _^(STRINT_SplitArray);
    
    if (arr.numInArray / 2 <= offset) {
        MEM_Error("STR_Split: The string does not decompose into that many substrings!");
        return "";
    };
    
    var string str; str = "";
    var zString zstr; zstr = _^(_@s(str));
    
    var int len; len = MEM_ReadIntArray(arr.array, 2*offset);
    zstr.ptr = MEM_Alloc(len+2)+1;
    zstr.len = len;
    zstr.res = len;
    
    MEM_CopyBytes(MEM_ReadIntArray(arr.array, 2*offset + 1), zstr.ptr, len);
    
    return str;
};

var string STRINT_SplitCache;
var string STRINT_SplitSeperatorCache;

func string STR_Split(var string str, var string separator, var int offset) {
    if (Hlp_StrCmp(STRINT_SplitCache, str)
    && !Hlp_StrCmp(STRINT_SplitCache, "")
    &&  Hlp_StrCmp(STRINT_SplitSeperatorCache, separator)) {
        return STRINT_SplitGet(offset);
    };
    STRINT_Split(str, separator);
    STRINT_SplitCache = str;
    STRINT_SplitSeperatorCache = separator;
    
    return STRINT_SplitGet(offset);
};

func int STR_SplitCount(var string str, var string seperator) {
    if (!Hlp_StrCmp(STRINT_SplitCache, str)
    ||  !Hlp_StrCmp(STRINT_SplitSeperatorCache, seperator)
    ||   Hlp_StrCmp(STRINT_SplitCache, "")) {
        STRINT_Split(str, seperator);
        STRINT_SplitCache = str;
        STRINT_SplitSeperatorCache = seperator;
    };
    
    var zCArray arr; arr = _^(STRINT_SplitArray);
    return arr.numInArray / 2;
};

//************************************************
//    Верхний регистр (Gottfried)
//************************************************

func string STR_Upper(var string str) {
    const int zSTRING__Upper_G1 = 4608912; //0x465390
    const int zSTRING__Upper_G2 = 4631296; //0x46AB00
    
    var int ptr; ptr = _@s(str);
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PutRetValTo(0);
        CALL__thiscall(_@(ptr), MEMINT_SwitchG1G2(zSTRING__Upper_G1, zSTRING__Upper_G2));
        
        call = CALL_End();
    };
    
    return str;
};

//######################################################
//
//  Еще функции для работы с zCParser
//
//######################################################

//--------------------------------------
//   Получает указатель на 8Кб памяти.
//   Кто угодно может записывать туда,
//   никто не может быть уверен, что
//   дригие оставят его нетронутым.
//
//   Запрос, чтобы избежать временно
//   меньшего MEM_Alloc .
//--------------------------------------

/* Не знаю, должен ли я был очистить...
 * Но почему бы и нет? */
 
//func int MEMINT_GetBuf_8K_Sub() {
//    var int buf[2048];
//    return buf;
//};
func int MEMINT_GetBuf_8K() {
    //MEMINT_GetBuf_8K_Sub();
    MEMINT_StackPopInst();
    MEMINT_StackPushInst(zPAR_TOK_PUSHINT);
};

//************************************************
// Поиск символов
//************************************************

func int MEM_FindParserSymbol (var string inst) {
    const int zCParser__GetIndex_G1 = 7250112; //0x6EA0C0
    const int zCParser__GetIndex_G2 = 7943280; //0x793470
    
    var int ptr; ptr = _@s(inst);
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(ptr));
        
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(currParserAddress),
                       MEMINT_SwitchG1G2(zCParser__GetIndex_G1, zCParser__GetIndex_G2));
        
        call = CALL_End();
    };
    
    var int ret;
    return +ret;
};

func int MEM_GetSymbolIndex(var string inst) {
    return MEM_FindParserSymbol(inst);
};

func int MEM_GetParserSymbol (var string inst) {
    var int symID;
    symID = MEM_FindParserSymbol (inst); //обновляет парсер (ReinitParser)
    
    if (symID == -1) {
        return 0;
    } else {
        return MEM_ReadIntArray (currSymbolTableAddress, symID);
    };
};

func int MEM_GetSymbol(var string inst) {
    return MEM_GetParserSymbol(inst);
};

func int MEM_GetSymbolByIndex(var int id) {
    if (id < 0 || id >= currSymbolTableLength) {
        MEM_Error(ConcatStrings("MEM_GetSymbolByIndex: Index is not in valid bounds: ", IntToString(id)));
        return 0;
    };

    return MEM_ReadIntArray (currSymbolTableAddress, id);
};

//************************************************
//   MEM_CallBy*
//************************************************

//--------------------------------------
//  Передаем параметры,
//  получаем результаты.
//  Опять же ясно
//--------------------------------------

/* Небольшая вспомогательная функция,
 * не смущайтесь названием PushParam. */
func int MEMINT_PushIntParam(var int param) {
    return +param; //в стек помещается переменная, не константа!
};

/* Помещает параметр в стек */
func void MEM_PushIntParam (var int param) {
    MEMINT_PushIntParam (param);
};

func void MEM_PushInstParam (var int inst) {
    MEMINT_StackPushInst(inst);
};

/* как CALLINT_PushString, но собственные статические строки
 * идут совершенно неверно, потому что STR_Compare постоянно
 * пытается поместить строку в стек! */
func string MEMINT_PushStringParamSub (var string str) {
    var int n; n += 1; if (n == 10) { n = 0; };
    if (n == 0) { var string s0; s0 = str; return s0; };
    if (n == 1) { var string s1; s1 = str; return s1; };
    if (n == 2) { var string s2; s2 = str; return s2; };
    if (n == 3) { var string s3; s3 = str; return s3; };
    if (n == 4) { var string s4; s4 = str; return s4; };
    if (n == 5) { var string s5; s5 = str; return s5; };
    if (n == 6) { var string s6; s6 = str; return s6; };
    if (n == 7) { var string s7; s7 = str; return s7; };
    if (n == 8) { var string s8; s8 = str; return s8; };
    if (n == 9) { var string s9; s9 = str; return s9; };
    
    MEM_AssertFail ("Should be never here.");
};

func void MEM_PushStringParam (var string str) {
    MEMINT_PushStringParamSub(str);
};

/* Извлекаю значения из стека. */
func int    MEM_PopIntResult   () {};
func string MEM_PopStringResult() {};
func MEMINT_HelperClass MEM_PopInstResult() {};

//--------------------------------------
// MEM_CallBy ID/String/
//--------------------------------------

func void MEM_CallByID (var int symbID) {
    if (symbID < 0) {
        MEM_Error(ConcatStrings("MEM_CallByID: symbID may not be negative but is ", IntToString(symbID)));
        return;
    };

    var zCPar_Symbol sym;
    sym = _^(MEM_ReadIntArray (contentSymbolTableAddress, symbID));

    var int type;
    type = (sym.bitfield & zCPar_Symbol_bitfield_type);

    if (type != zPAR_TYPE_FUNC) && (type != zPAR_TYPE_PROTOTYPE) && (type != zPAR_TYPE_INSTANCE) {
       MEM_Error (ConcatStrings ("MEM_CallByID: Provided symbol is not callable (not function, prototype or instance): ", sym.name));
       return;
    };
    
    if (sym.bitfield & zPAR_FLAG_EXTERNAL) {
        CALL__stdcall(sym.content);
    } else {
        MEM_CallByPtr(sym.content + currParserStackAddress);
    };
};

func void MEM_CallByString (var string fnc) {
    if (Hlp_StrCmp (fnc, "")) {
        MEM_Error ("MEM_CallByString: fnc may not be an empty string!");
        return;
    };

    /* Микрооптимизация: Если одна и та же функция дважды 
     * вызывается из CallByString, не надо искать ее второй раз. */
    var int symbID;
    var string cacheFunc; var int cacheSymbID;

    if (Hlp_StrCmp (cacheFunc, fnc)) {
        symbID = cacheSymbID;
    } else {
        symbID = MEM_FindParserSymbol (fnc);

        if (symbID == -1) {
            MEM_Error (ConcatStrings ("MEM_CallByString: Undefined symbol: ", fnc));
            return;
        };

        cacheFunc = fnc; cacheSymbID = symbID;
    };

    MEM_CallByID (symbID);
};

func void MEM_Call(var func fnc) {
    MEM_CallByID(MEM_GetFuncID(fnc));
};

//************************************************
//	Поиск функции по смещению в стеке
//************************************************

func int MEMINT_BuildFuncStartsArray() {
    var int array; array = MEM_ArrayCreate();
    
    var int lastOffset; lastOffset = 0;
    var int wasSorted; wasSorted = 1;
    
    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;
    
    if (i < MEM_Parser.symtab_table_numInArray) {
        var zCPar_Symbol symb;
        symb = _^(MEM_ReadIntArray(MEM_Parser.symtab_table_array, i));
       
        if  (symb.bitfield & zPAR_FLAG_CONST)
        && !(symb.bitfield & zPAR_FLAG_EXTERNAL)
        && ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FUNC) {
            /* проверка целостности */
            if (wasSorted && lastOffset > symb.content) {
                wasSorted = 0;
                MEM_Info("The functions in the symbol table do not seem to be sorted by stack-offset.");
            };
            
            lastOffset = symb.content;
            MEM_ArrayInsert(array, symb.content); //смещение
            MEM_ArrayInsert(array, i);            //id
        };
        
        i += 1;
        MEM_StackPos.position = loop;
    };
    
    if (!wasSorted) {
        var zCArray zcarr; zcarr = _^(array);
        MEMINT_QSort(zcarr.array, zcarr.numInArray / 2, 8, 0);
    };
    
    return array;
};

func int MEM_GetFuncIDByOffset(var int offset) {
    const int funcStartsArray = 0;
    if (!funcStartsArray) {
        funcStartsArray = MEMINT_BuildFuncStartsArray();
    };
    
    if (offset < 0 || offset >= MEM_Parser.stack_stacksize) {
        MEM_Error("MEM_GetFuncIDByOffset: Offset is not in valid bounds (0 <= offset < ParserStackSize).");
        return -1;
    };
    
    var zCArray array; array = _^(funcStartsArray);
    
    /* дихотомический поиск */
    var int res;  res  = -1;
    var int low;  low  =  0;
    var int high; high = array.numInArray / 2 - 1;

    var int loop; loop = MEM_StackPos.position;
    
    /* while (1) { */
        /* всегда: array[low] <= offset <= array[high]
                      low < high                          */
        
        var int med; med = (low + high) / 2; /* low <= med < high */
        var int medOffset; medOffset = MEM_ReadIntArray(array.array, 2*med);
        
        if (medOffset >= offset) {
            high = med; /* идем дальше т.к. med < high */
        } else {
            if (low == med) {
                /* возможно только, если low == high - 1 */
                if (MEM_ReadIntArray(array.array, 2*high) <= offset) {
                    res = high;
                } else {
                    res = low;
                };
            } else {                
                low = med; /* идем дальше т.к. low < med */
            };
        };
        
        if (low == high) {
            res = low;
        };
        
        if (res != -1) {
            return MEM_ReadIntArray(array.array, 2*res + 1);
        };
        
        MEM_StackPos.position = loop;
    /* } end while */
};

//************************************************
//   Поиск своего фрейма в стеке
//************************************************

//Получение ESP, который указывает на текущий фрейм DoStack:
func int MEMINT_GetESP() {
    var int ESP;
    
    const int call = 0;
    if (CALL_Begin(call)) {
        ASM_2(ASMINT_OP_movESPtoEAX);
        ASM_2(ASMINT_OP_movEAXToMem);
        ASM_4(_@(ESP));
        ASM_1(ASMINT_OP_retn);
        
        call = CALL_End();
        
        if (CALL_Begin(call)) {}; //при первом вызове результат может отличаться!
    };
    return ESP;
};

//Проверяем и находим zCParser::DoStack, который сам находится в стеке
//Возвращает позицию на одно слово выше возвращаемого адреса (обычно указвает на -1, часть SEH)
func int MEMINT_IsFrameBoundary(var int ESP) {
    const int retAdr = 0;
    if (!retAdr) {
        /* Если DoStack вызывает себя, то получим этот адрес в стеке:*/
        retAdr = MEMINT_SwitchG1G2(7246244 /* 0x6E91A4 */, 7939332 /*0x792504 */);
    };

    return (MEM_ReadInt(ESP)   ==     -1)
        && (MEM_ReadInt(ESP+4) == retAdr);
};

func int MEMINT_FindFrameBoundary(var int ESP, var int searchWordsMAX) {
    var int loop; loop = MEM_StackPos.position;
    
    /* ничего не нашли */
    if (searchWordsMAX == 0) {
        return 0;
    };
    
    /* while */
        if (!MEMINT_IsFrameBoundary(ESP)) {
            /* Меня интересует только начало фрейма */
            ESP += 4;
            searchWordsMAX -= 1;
            MEM_StackPos.position = loop;
        };
    /* end while */
    
    return ESP;
};

//Теперь получаю свой собственный стековый фрейм!

/* смещение на 2 фрейма, если вызываем сами себя  */
const int MEMINT_DoStackFrameSize = 88;
/* положение oldPopPos после вызова себя */
const int MEMINT_DoStackPopPosOffset = MEMINT_DoStackFrameSize + MEMINT_DoStackFrameSize - 6 * 4;

func int MEM_GetFrameBoundary() {
    const int offset = 0;
    var int   ESP; ESP = MEMINT_GetESP();
    
    if (!offset) {
        /* Смещение зависит от выполнения CALL, но это константа.
         * Лучше вычислить ее, чем выцарапывать при каждом запуске Готики */
        
        var int realESP;
        realESP = ESP;
        /* вход в безопасную область. При чтении из ESP следующее оказывается на пути:
            * MEMINT_GetESP
            * CALL_Begin
            * ASM_Run
            * ASMINT_CallMyExternal */
            
        realESP += 4*MEMINT_DoStackFrameSize;
        
        /* MEMINT_FindFrameBoundary заходит достаточно далеко, так что она считывает верные участки стека */
        realESP = MEMINT_FindFrameBoundary(realESP, MEMINT_DoStackFrameSize);
        
        if (!realESP) {
            MEM_AssertFail("MEM_GetFrameBoundary: Could not locate start of stackframe.");
            return 0;
        };
        
        var int myID; myID = MEM_GetFuncID(MEM_GetFrameBoundary);
        
        var int loop; loop = MEM_StackPos.position;
        
        var int popPos;
        popPos = MEM_ReadIntArray(realESP-MEMINT_DoStackPopPosOffset, 0); /* для безопасности, используем функцию, которая накладывает другой слой стека */
        realESP += MEMINT_DoStackFrameSize;
        
        if (MEM_GetFuncIDByOffset(popPos) != myID) {
            MEM_StackPos.position = loop;
        };
        
        offset = realESP - ESP;
    };
    
    return ESP + offset;
};

//--------------------------------------
//   Для чего это все было:
//--------------------------------------

func int MEM_GetCallerStackPos() {
    /* получает границы своего фрейма, добавляет 1 фрейм (протому что это не про меня),
     * и добавляет еще один фрейм (потому что это не про взывавшего меня),
     * чтобы получить PopPos того, кто вызвал того, кто вызвал меня (my caller's caller) */
    return MEM_ReadInt(MEM_GetFrameBoundary() + 2*MEMINT_DoStackFrameSize - MEMINT_DoStackPopPosOffset);
};

func void MEM_SetCallerStackPos(var int popPos) {
    MEM_WriteInt(MEM_GetFrameBoundary() + 2*MEMINT_DoStackFrameSize - MEMINT_DoStackPopPosOffset, popPos);
};

//************************************************
//   JUMP / GOTO / WHILE
//************************************************

//--------------------------------------
//    Разделение функции на токены
//--------------------------------------

/* добавит -1, -1, endOfFunc после последнего токена */
func void MEMINT_TokenizeFunction(var int funcID, var int tokenArray, var int paramArray, var int posArr) {
    var int pos;
    var zCPar_Symbol symb;
    symb = _^(MEM_ReadIntArray(contentSymbolTableAddress, funcID));
    pos  = symb.content;
    pos += currParserStackAddress;
    
    var int loop; loop = MEM_StackPos.position;
    
    MEM_ArrayInsert(posArr, pos);
    var int tok; tok = MEM_ReadByte(pos); pos += 1;
    var int param;
    
    if (tok == zPAR_TOK_CALL      || tok == zPAR_TOK_CALLEXTERN)
    || (tok == zPAR_TOK_PUSHINT   || tok == zPAR_TOK_PUSHVAR)
    || (tok == zPAR_TOK_PUSHINST  || tok == zPAR_TOK_SETINSTANCE)
    || (tok == zPAR_TOK_JUMP      || tok == zPAR_TOK_JUMPF) {
        /* берем один параметр */
        param = MEM_ReadInt(pos); pos += 4;
    } else if (tok == zPAR_TOK_PUSH_ARRAYVAR) {
        param = MEM_ReadInt(pos); pos += 4;
        pos += 1; //индекс массива.
    } else if (tok > zPAR_TOK_SETINSTANCE) {
        var string err; err = ConcatStrings("MEMINT_TokenizeFunction: Invalid Token in function ", symb.name);
        err = ConcatStrings(err, ". Did you break it? This will probably cause more errors.");
        MEM_Error(err);
        return;
    } else {
        /* очевидно, верный токен без параметров */
        param = 0;
    };
    
    MEM_ArrayInsert(tokenArray, tok);
    MEM_ArrayInsert(paramArray, param);
    
    if (tok == zPAR_TOK_RET) {
        if (MEM_GetFuncIDByOffset(pos - currParserStackAddress) != funcID) {
            /* отмечаем конец функции */
            MEM_ArrayInsert(posArr, pos);
            MEM_ArrayInsert(tokenArray, -1);
            MEM_ArrayInsert(paramArray, -1);
            return;
        };
    };
    
    MEM_StackPos.position = loop;
};

//--------------------------------------
//   Трассировка расчета аргумента
//   возвращение к истокам
//--------------------------------------

//Вспомогательная функция: Трассировка истоков одного параметра:
func int MEMINT_TraceParameter(var int pos, var int tokenArr, var int paramArr) {
    /* декларация: tokenArr - это массив токенов парсера.
     * pos - это индекс токена в этом массиве,
     * где ожидается параметр.
     * Я возвращаю индекс токена, с которого начинается
     * вычисление этого параметра. */
    
    var int paramsNeeded; paramsNeeded = 1;
    
    var int loop; loop = MEM_StackPos.position;
    
    if (pos == 0) {
        MEM_Error("MEMINT_TraceParameter: The parameter was pushed outside the function.");
        return -1;
    };
    pos -= 1;
    var int tok; tok = MEM_ArrayRead(tokenArr, pos);
    
    if (tok == zPAR_TOK_PUSHINT       || tok == zPAR_TOK_PUSHVAR
    ||  tok == zPAR_TOK_PUSH_ARRAYVAR || tok == zPAR_TOK_PUSHINST) {
        paramsNeeded -= 1;
    } else if (tok >= zPAR_TOK_ASSIGNSTR && tok <= zPAR_TOK_ASSIGNINST)
    || (tok == zPAR_OP_IS) || (tok <= zPAR_OP_ISDIV && tok >= zPAR_OP_ISPLUS) {
        MEM_Error("MEMINT_TraceParameter: Assignment within expression that is expected to produce non-void result. This does not make sense.");
        paramsNeeded += 2;
    } else if (tok == zPAR_TOK_CALL || tok == zPAR_TOK_CALLEXTERN) {
        var zCPar_Symbol symb; var int symbID;
        if (tok == zPAR_TOK_CALL) {
            symbID = MEM_GetFuncIDByOffset(MEM_ArrayRead(paramArr, pos));
        } else {
            symbID = MEM_ArrayRead(paramArr, pos);
        };
        
        symb = _^(MEM_GetSymbolByIndex(symbID));
        paramsNeeded += symb.bitfield & zCPar_Symbol_bitfield_ele; /* нужно вычислить параметры */
        paramsNeeded -= symb.offset != 0; //!= 0 ==> return value!
    } else if (tok >= zPAR_OP_UNARY && tok <= zPAR_OP_MAX)
    || (tok == zPAR_TOK_SETINSTANCE) {
        /* ничего, унарные операторы не "расходуют" параметры
         * zPAR_TOK_SETINSTANCE тоже */
    } else if (tok <= zPAR_OP_HIGHER_EQ) {
        paramsNeeded += 1; //бинарная операция, двое вошли, один вышел
    } else {
        MEM_Error("MEMINT_TraceParameter: Invalid token!");
    };
    
    if (paramsNeeded == 0) {
        if (pos > 0) {
            if (MEM_ArrayRead(tokenArr, pos-1) == zPAR_TOK_SETINSTANCE) {
                pos -= 1; //не забываем этот токен, это важно
            };
        };
        /* отлично, вот оно */
        return pos;
    };
    
    MEM_StackPos.position = loop;
};

//--------------------------------------
//  Функция-заплатка (патч):
//    Сканирует функцию и заменяет вызовы
//    label, goto и while на
//    правильные токены, которые обрабатывают
//    ситуацию как надо
//--------------------------------------

//Только для вывода
func string MEMINT_GetLabelName(var int labelValue) {
    /* алхимия: константа - это индекс символа или просто константа? */
    if (1000 < labelValue && labelValue < MEM_Parser.symtab_table_numInArray) {
        var zCPar_Symbol symb;
        symb = _^(MEM_ReadIntArray(contentSymbolTableAddress, labelValue));
        return symb.name;
    } else {
        return IntToString(labelValue);
    };
};

func void MEMINT_PrepareLoopsAndJumps(var int stackPos) {
    var int tokenArr; tokenArr = MEM_ArrayCreate();
    var int paramArr; paramArr = MEM_ArrayCreate();
    var int posArr;   posArr   = MEM_ArrayCreate();
    var int size;
    
    MEMINT_TokenizeFunction(MEM_GetFuncIDByOffset(stackPos), tokenArr, paramArr, posArr);
    size = MEM_ArraySize(posArr); /* все одного размера */
    
    /* ищем все label и goto */
    var int labelFunc;   labelFunc   = MEM_GetFuncOffset(MEM_Label);
    var int labelsArr;   labelsArr   = MEM_ArrayCreate();
    var int labelPosArr; labelPosArr = MEM_ArrayCreate(); /* позиция после label */
    
    var int gotoFunc;    gotoFunc    = MEM_GetFuncOffset(MEM_Goto);
    var int gotoArr;     gotoArr     = MEM_ArrayCreate();
    var int gotoPosArr;  gotoPosArr  = MEM_ArrayCreate(); /* позиция перед размещением параметра */
    
    var int usedLabels;  usedLabels  = MEM_ArrayCreate();
    
    var int i; i = 0;
    var int loop; loop = MEM_StackPos.position;
    
    if (i < size) {
        var int type; const int goto = 1; const int label = 2;
        
        if (MEM_ArrayRead(tokenArr, i) != zPAR_TOK_CALL) {
            type = 0;
        } else if (MEM_ArrayRead(paramArr, i) == gotoFunc) {
            type = goto;
        } else if (MEM_ArrayRead(paramArr, i) == labelFunc) {
            type = label;
        } else {
            type = 0;
        };
        
        if (type) {
            /* декларация: i > 0 */
            var int labelValue;
            var int pushingTok;
            pushingTok = MEM_ArrayRead(tokenArr, i - 1);
            
            if (pushingTok == zPAR_TOK_PUSHINT) {
                labelValue = MEM_ArrayRead(paramArr, i - 1);
            } else if (pushingTok == zPAR_TOK_PUSHVAR) {
                /* проверка синтаксиса гарантирует, что здесь размещено целое число */
                labelValue = MEM_ArrayRead(paramArr, i - 1); /* это индекс символа */
                var zCPar_Symbol symb;
                symb = _^(MEM_ReadIntArray(contentSymbolTableAddress, labelValue));
                labelValue = symb.content;
            } else {
                MEM_Error("MEMINT_PrepareLoopsAndJumps: Invalid label found. The parameters for MEM_Goto and MEM_Label must be a constant!");
                i += 1;
                MEM_StackPos.position = loop;
            };
            
            if (type == label) {
                MEM_ArrayPush(labelsArr,  labelValue);
                MEM_ArrayPush(labelPosArr, MEM_ArrayRead(posArr, i+1)); /* примечание: Всегда возвращется после меня */
            } else {
                MEM_ArrayPush(gotoArr,    labelValue);
                MEM_ArrayPush(gotoPosArr, MEM_ArrayRead(posArr, i-1));
            };
        };
        
        i += 1;
        MEM_StackPos.position = loop;
    };
    
    /* выполянем все goto и jump */
    i = 0;
    loop = MEM_StackPos.position;
    
    if (i < MEM_ArraySize(gotoArr)) {
                            labelValue = MEM_ArrayRead(gotoArr, i);
        var int gotoPos;    gotoPos    = MEM_ArrayRead(gotoPosArr, i);
        
        var int labelIndex; labelIndex = MEM_ArrayIndexOf(labelsArr, labelValue);
        
        var int labelPos; 
        if (labelIndex == -1) {
            var string err; err = "MEMINT_PrepareLoopsAndJumps: Goto to non-existing label found: ";
            err = ConcatStrings(err, MEMINT_GetLabelName(labelValue));
            err = ConcatStrings(err, ".");
            MEM_Error(err);
            
            labelPos = gotoPos + 10;
        } else {
            labelPos = MEM_ArrayRead(labelPosArr, labelIndex);
        };
        
        labelPos -= currParserStackAddress; /* относительно начала стека */
        
        /* перезаписываем размещение параметров и вызов MEM_Goto */
        MEM_WriteByte(gotoPos, zPAR_TOK_JUMP); gotoPos += 1;
        MEM_WriteInt (gotoPos, labelPos);      gotoPos += 4;
        MEM_WriteByte(gotoPos, zPAR_TOK_JUMP); gotoPos += 1;
        MEM_WriteInt (gotoPos, labelPos);      gotoPos += 4;
        
        MEM_ArrayInsert(usedLabels, labelValue);
        
        i += 1;
        MEM_StackPos.position = loop;
    };
    
    /* проверка соответсвия: Все label использованы? label объявлена несколько раз? */
    loop = MEM_StackPos.position;
    
    if (MEM_ArraySize(labelsArr)) {
        labelValue = MEM_ArrayRead(labelsArr, 0);
        MEM_ArrayRemoveIndex(labelsArr, 0); /* отменяем этот вход */
        
        if (MEM_ArrayIndexOf(labelsArr, labelValue) != -1) {
            /* все еще здесь? */
            var string error; error = "MEMINT_PrepareLoopsAndJumps: Label declared more than once: ";
            error = ConcatStrings(error, MEMINT_GetLabelName(labelValue));
            error = ConcatStrings(error, ".");
            MEM_Error(error);
        } else if (MEM_ArrayIndexOf(usedLabels, labelValue) == -1) {
            error = "MEMINT_PrepareLoopsAndJumps: Unused Label: ";
            error = ConcatStrings(error, MEMINT_GetLabelName(labelValue));
            error = ConcatStrings(error, ".");
            MEM_Warn(error);
        };
        
        MEM_StackPos.position = loop;
    };
    
    MEM_ArrayFree(labelsArr   );
    MEM_ArrayFree(labelPosArr );
    MEM_ArrayFree(gotoArr     );
    MEM_ArrayFree(gotoPosArr  );
    MEM_ArrayFree(usedLabels  );
    
    /* Обработка while */
    var int whileOffset;  whileOffset  = MEM_GetFuncOffset(while);
    var int repeatOffset; repeatOffset = MEM_GetFuncOffset(repeat);
    var int endID;        endID        = MEM_FindParserSymbol("END");
    var int breakID;      breakID      = MEM_FindParserSymbol("BREAK");
    var int continueID;   continueID   = MEM_FindParserSymbol("CONTINUE");
    
    var int loopType;   loopType   = -1; const int W = 0; const int R = 1;
    var int contTarget; contTarget = -1;
    
    var int loopStack;    loopStack    = MEM_ArrayCreate(); /* содержит сохраненные данные вложенны циклах */
    var int jumpEndStack; jumpEndStack = MEM_ArrayCreate(); /* позиция всех break и -1 как разделитель при вложенности */
    
    i = 0;
    loop = MEM_StackPos.position;
    
    if (i < size) {
        var int tok;   tok   = MEM_ArrayRead(tokenArr, i);
        var int param; param = MEM_ArrayRead(paramArr, i);
        var int pos;   pos   = MEM_ArrayRead(posArr,   i);
        if (tok == zPAR_TOK_CALL && param == whileOffset) {
            MEM_ArrayPush(loopStack, loopType);
            MEM_ArrayPush(loopStack, contTarget);
            
            MEM_WriteByte(pos, zPAR_TOK_JUMPF);
            
            contTarget = MEM_ArrayRead(posArr, MEMINT_TraceParameter(i, tokenArr, paramArr));
            loopType   = W;
            
            MEM_ArrayPush(jumpEndStack, -1); /* разделитель */
            MEM_ArrayPush(jumpEndStack, pos+1); /* вставлем позицию конца цикла, как только ее узнаем */
        } else if (tok == zPAR_TOK_CALL && param == repeatOffset) {
            /* для повторения мне нужен новый сегмент кода, чтобы туда перейти */
            MEM_ArrayPush(loopStack, loopType);
            MEM_ArrayPush(loopStack, contTarget);
            
            loopType = R;
            
            var int code; code = MEM_Alloc(30);
            
            /* переход к новому коду */
            MEM_WriteByte(pos  , zPAR_TOK_JUMP);
            MEM_WriteInt (pos+1, code - currParserStackAddress);
            
            /* создане MEMINT_RepeatData */
            var int dataPtr;  dataPtr  = MEM_Alloc(8);
            var int entryFiddler; entryFiddler = MEM_GetFuncOffset(MEMINT_RepeatEntryFiddle);
            var int redoChecker;  redoChecker  = MEM_GetFuncOffset(MEMINT_RepeatRedoCheck  );
            /* позволяю своему обработчику вхождений заполнить переменную нулями и запомнить границу */
                MEM_WriteByte(code, zPAR_TOK_PUSHINT   ); code += 1; MEM_WriteInt(code, dataPtr         ); code += 4;
                MEM_WriteByte(code, zPAR_TOK_CALL      ); code += 1; MEM_WriteInt(code, entryFiddler    ); code += 4;
            /* сразу после проверки правильности границ.
             * здесь продолжается переход к */
                contTarget = code;
                MEM_WriteByte(code, zPAR_TOK_PUSHINT   ); code += 1; MEM_WriteInt(code, dataPtr         ); code += 4;
                MEM_WriteByte(code, zPAR_TOK_CALL      ); code += 1; MEM_WriteInt(code, redoChecker     ); code += 4;
            /* переход к концу, если так записано в redochecker */
                MEM_WriteByte(code, zPAR_TOK_JUMPF     ); code += 1;
                MEM_ArrayPush(jumpEndStack, -1); /* разделитель */
                MEM_ArrayPush(jumpEndStack, code); /* вставка позиции конца цикла, как только ее узнаем */
                code += 4;
            /* Если я выбираю продолжить, безусловный переход обратно к коду: */
                MEM_WriteByte(code, zPAR_TOK_JUMP      ); code += 1; MEM_WriteInt(code, pos + 5 - currParserStackAddress); code += 4;
        } else if (tok == zPAR_TOK_PUSHVAR && param == endID) {
            if (loopType == -1) {
                MEM_Error("MEMINT_PrepareLoopsAndJumps: end found outside of loop!");
                i += 1;
                MEM_StackPos.position = loop;
            };
            
            MEM_WriteByte(pos  , zPAR_TOK_JUMP);
            MEM_WriteInt (pos+1, contTarget - currParserStackAddress);
            
            /* Теперь обарабатываем все break: */
            var int brkLoop; brkLoop = MEM_StackPos.position;
            var int JmpEndPos; JmpEndPos   = MEM_ArrayPop(jumpEndStack);
            
            if (JmpEndPos != -1) { /* предохранитель */
                MEM_WriteInt (JmpEndPos, pos + 5 - currParserStackAddress);
                MEM_StackPos.position = brkLoop;
            };
            
            contTarget = MEM_ArrayPop(loopStack);
            loopType   = MEM_ArrayPop(loopStack);
        } else if (tok == zPAR_TOK_PUSHVAR && param == breakID) {
            if (loopType == -1) {
                MEM_Error("MEMINT_PrepareLoopsAndJumps: break found outside of loop!");
            } else {
                MEM_WriteByte(pos, zPAR_TOK_JUMP);
                MEM_ArrayPush(jumpEndStack, pos+1); /* вставляем адрес конца, как только его узнаем */
            };
        } else if (tok == zPAR_TOK_PUSHVAR && param == continueID) {
            if (loopType == -1) {
                MEM_Error("MEMINT_PrepareLoopsAndJumps: continue found outside of loop!");
            } else {
                MEM_WriteByte(pos  , zPAR_TOK_JUMP);
                MEM_WriteInt (pos+1, contTarget - currParserStackAddress);
            };
        };
        
        i += 1;
        MEM_StackPos.position = loop;
    };
    
    if (loopType != -1) {
        MEM_Error("MEMINT_PrepareLoopsAndJumps: Loop not closed with 'end;'.");
    };
    
    MEM_ArrayFree(loopStack);
    MEM_ArrayFree(jumpEndStack);
    
    /* очистка */
    
    MEM_ArrayFree(tokenArr);
    MEM_ArrayFree(paramArr);
    MEM_ArrayFree(posArr);
};

//--------------------------------------
//   while
//--------------------------------------

class C_Label {}; /* чтобы можно было объявить var C_Label lbl */

const int break = -42;
const int continue = -23;
const int end = -72;
func void while(var int b) {
    /* проверка соответствия */
    var int calledFrom; calledFrom = MEM_GetCallerStackPos() - 5;
    if (MEM_ReadByte(calledFrom +     currParserStackAddress) != zPAR_TOK_CALL)
    || (MEM_ReadInt (calledFrom + 1 + currParserStackAddress) != MEM_GetFuncOffset(while)) {
        MEM_Error("while: While was called in an unorthodox way! This cannot be handled.");
        return;
    };
    
    MEMINT_PrepareLoopsAndJumps(calledFrom);
    b; /* снова помещаем в стек b */
    
    MEM_SetCallerStackPos(calledFrom); /* получаем позицию перед вызовом while, теперь там условный переход */
};

//--------------------------------------
//   label / goto
//--------------------------------------

func void MEM_Label(var int lbl) {}; /* нечего делать */
func void MEM_Goto (var int lbl) {
    var int calledFrom; calledFrom = MEM_GetCallerStackPos() - 5;
    /* проверка соответствия */
    if (MEM_ReadByte(calledFrom +     currParserStackAddress) != zPAR_TOK_CALL)
    || (MEM_ReadInt (calledFrom + 1 + currParserStackAddress) != MEM_GetFuncOffset(MEM_Goto)) {
        MEM_Error("MEM_Goto: MEM_Goto was called in an unorthodox way! This cannot be handled.");
        return;
    };
    
    MEMINT_PrepareLoopsAndJumps(calledFrom);
    MEM_SetCallerStackPos(calledFrom); /* получаем позицию перед вызовом MEM_Goto, тепреь там безусловный переход */
};

//--------------------------------------
//   repeat
//--------------------------------------

func void Repeat(var int variable, var int limit) {
    MEM_Error("MEM_Repat was called before MEM_InitRepeat / MEM_InitAll");
};
func void MEMINT_Repeat() {
    var int calledFrom; calledFrom = MEM_GetCallerStackPos() - 5;
    
    /* проверка соответствия */
    if (MEM_ReadByte(calledFrom +     currParserStackAddress) != zPAR_TOK_CALL)
    || (MEM_ReadInt (calledFrom + 1 + currParserStackAddress) != MEM_GetFuncOffset(repeat)) {
        MEM_Error("repeat: repeat was called in an unorthodox way! This cannot be handled.");
        return;
    };
    
    MEMINT_PrepareLoopsAndJumps(calledFrom);
    
    /* Я оставил два параметра в стеке, можно приступать */
    MEM_SetCallerStackPos(calledFrom);
};

func void MEM_InitRepeat() {
    const int done = 0;
    if (!done) {
        MEM_ReplaceFunc(Repeat, MEMINT_Repeat);
        done = true;
    };
};

class MEMINT_RepeatData {
    var int varAdr;
    var int limit;
};

func void MEMINT_RepeatEntryFiddle(/* var int VAR */ var int limit, var int loopData) {
    var int tok; tok = MEMINT_StackPopInstAsInt();
    
    if (tok != zPAR_TOK_PUSHVAR) {
        MEM_Error("MEMINT_RepeatEntryFiddle: First Parameter given to MEM_Repeat is not an lValue (not modifiable).");
        return;
    };
    
    var int varAdr; varAdr = MEMINT_StackPopInstAsInt();
    MEM_WriteInt(varAdr, -1); //начинаем с 0 (сразу увеличивается на 1)
    
    MEM_WriteInt(loopData  , varAdr); /* переменная */
    MEM_WriteInt(loopData+4, limit);
};

func int MEMINT_RepeatRedoCheck(var int loopData) {
    var MEMINT_RepeatData data;
    data = _^(loopData);
    
    var int val; val = MEM_ReadInt(data.varAdr);
    val += 1;
    
    MEM_WriteInt(data.varAdr, val);
    
    return val < data.limit;
};

//######################################################
//
//  Доступ к объектам меню
//
//######################################################

/*
    К сожалению, одни меню при каждом вызове создаются
	заново (из скриптов), а другие один раз создаются
	в начале игры, а потом сохраняются в памяти. 
	И в зависимости от того, что именно вы хотите сделать,
	может возникнуть необходимость изменить скрипт меню
	(через записанные переменные), или получить доступ
	к меню, как объекту, и портить сам этот объект.
*/

func int MEM_GetMenuByString (var string menuName) {
    var zCArray menus;
    menus = _^(MEMINT_MenuArrayOffset);

    var int pos; pos = 0;

    var int loopStart; loopStart = MEM_StackPos.position;

    if (pos >= menus.numInArray) {
        /* Просмотрели и ничего не нашли? */
        /* Раздражающее предупреждение:
            MEM_Warn (ConcatStrings ("MEM_GetMenuByString: No Menu with the following name found: ", menuName));
        */
        return 0;
    };

    var int menuAddr; menuAddr = MEM_ReadIntArray (menus.array, pos);
    var zCMenu menu;  menu = _^(menuAddr);

    if (Hlp_StrCmp (menu.name, menuName)) {
        return menuAddr;
    };

    pos += 1;
    MEM_StackPos.position = loopStart;
};

//--------------------------------------
// Доступ к пункту меню (MenuItem)
//--------------------------------------

/* То же замечание, что и для меню */

func int MEM_GetMenuItemByString (var string menuItemName) {
    var zCArray menuItems;
    menuItems = _^(MEMINT_MenuItemArrayAddres);

    var int pos; pos = 0;

    var int loopStart; loopStart = MEM_StackPos.position;

    if (pos >= menuItems.numInArray) {
        /* Просмотрели и ничего не нашли? */
        //Предупреждение убрано: очень раздражает.
        //MEM_Warn (ConcatStrings ("MEM_GetMenuItemByString: No Menu with the following name found: ", menuItemName));
        return 0;
    };

    var int menuItemAddr; menuItemAddr = MEM_ReadIntArray (menuItems.array, pos);
    var zCMenuItem menuItem;  menuItem = _^(menuItemAddr);
    
    if (Hlp_StrCmp (menuItem.id, menuItemName)) {
        return menuItemAddr;
    };

    pos += 1;
    MEM_StackPos.position = loopStart;
};

//######################################################
//
//  zCObjects
//
//######################################################

//************************************************
//  Расположение некоторых часто используемых объектов
//************************************************

instance MEM_Game (oCGame);
instance MEM_World(oWorld);
instance MEM_Timer(zCTimer);
instance MEM_WorldTimer(oCWorldTimer);
instance MEM_Vobtree(zCTree);
instance MEM_InfoMan(oCInfoManager);
instance MEM_InformationMan (oCInformationManager);
instance MEM_Waynet(zCWaynet);
instance MEM_Camera(zCCamera);
instance MEM_SkyController(zCSkyController_Outdoor);
instance MEM_SpawnManager (oCSpawnManager);
instance MEM_GameMananger (CGameManager);
instance MEM_GameManager (CGameManager);
instance MEM_Parser(zCParser);

func void MEM_InitGlobalInst() {
    //Game:	//Игровая сессия
    MEM_Game = _^(MEM_ReadInt (MEMINT_oGame_Pointer_Address));

    //World:	//Мир (локация)
    MEM_World = _^(MEM_Game._zCSession_world);

    //Vobtree:	//Дерево Vob'ов
    MEM_Vobtree = _^(MEM_Game._zCSession_world + 36); //+ 0x0024

    //InfoManager:	//Список всех диалогов и парсер
    MEM_InfoMan = _^(MEM_Game.infoman);

    //InformationManager	//Отображение диалогов
    MEM_InformationMan = _^(MEMINT_oCInformationManager_Address);

    //Waynet:	//Сеть путей
    MEM_Waynet = _^(MEM_World.wayNet);

    //Camera	//Камера
    MEM_Camera = _^(MEM_Game._zCSession_camera);

    //SkyController:	//Контроллер неба
    if (MEM_World.skyControlerOutdoor) {
        MEM_SkyController = _^(MEM_World.skyControlerOutdoor);
    } else {
        MEM_AssignInstNull (MEM_SkyController);
    };

    //Spawnmanager	//Вставка NPC в мир
    MEM_SpawnManager = _^(MEM_Game.spawnman);

    //zTimer:	//Таймер общего типа
    MEM_Timer = _^(MEMINT_zTimer_Address);

    //WorldTimer:	//Мировой таймер
    MEM_WorldTimer = _^(MEM_Game.wldTimer);
    
    //GameManager	//Управление игрой
    MEM_GameMananger = _^(MEM_ReadInt(MEMINT_gameMan_Pointer_address)); /* Блин, опечатка! Сохранено, чтобы не нарушить код */
    MEM_GameManager  = _^(MEM_ReadInt(MEMINT_gameMan_Pointer_address));
    
    //The Content Parser	//Парсер содержимого
    MEM_Parser = _^(contentParserAddress);
};

//************************************************
// Проверка соответствий
//************************************************

func int Hlp_Is_oCMobFire (var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCMobFire_vtbl);
};

func int Hlp_Is_zCMover(var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == zCMover_vtbl);
};

func int Hlp_Is_oCMob(var int ptr) {
    if (!ptr) { return 0; };

    var int vtbl;
    vtbl = MEM_ReadInt (ptr);

    /* Тупое обозначение, потому что Gothic Sourcer ругается на ||. */
    return (vtbl == oCMob_vtbl)
        |  (vtbl == oCMobInter_vtbl)
        |  (vtbl == oCMobContainer_vtbl)
        |  (vtbl == oCMobDoor_vtbl);
};

func int Hlp_Is_oCMobInter(var int ptr) {
    if (!ptr) { return 0; };

    var int vtbl;
    vtbl = MEM_ReadInt (ptr);

    return (vtbl == oCMobInter_vtbl)
         | (vtbl == oCMobContainer_vtbl)
         | (vtbl == oCMobDoor_vtbl);
};

func int Hlp_Is_oCMobLockable(var int ptr) {
    if (!ptr) { return 0; };

    /* Есть ли запираемые объекты, кроме сундуков и дверей?
     * но их все равно никто не использует => лень проверять. */
    var int vtbl;
    vtbl = MEM_ReadInt (ptr);

    return (vtbl == oCMobContainer_vtbl)
         | (vtbl == oCMobDoor_vtbl);
};

func int Hlp_Is_oCMobContainer(var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCMobContainer_vtbl);
};

func int Hlp_Is_oCMobDoor(var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCMobDoor_vtbl);
};

func int Hlp_Is_oCNpc (var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCNpc_vtbl);
};

func int Hlp_Is_oCItem (var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == oCItem_vtbl);
};

func int Hlp_Is_zCVobLight (var int ptr) {
    if (!ptr) { return 0; };
    return (MEM_ReadInt (ptr) == zCVobLight_vtbl);
};

//************************************************
//   Поиск zCClassDef
//************************************************

func int MEM_GetClassDef (var int objPtr) {
    if (!objPtr) {
        MEM_Error ("MEMINT_GetClassDef: ObjPtr == 0.");
        return 0;
    };
    
    //obj._vtbl[0] содержит адрес виртуальной функции, которая
    //возвращает classDef для класса объекта.
    //Эта функция состоит из простого "mov eax" (1 байт), 
	//адреса (который нам и нужен) (4 байта) и "retn" (1 байт).
   
    return MEM_ReadInt (1 + MEM_ReadInt (MEM_ReadInt (objPtr)));
};

func string MEM_GetClassName (var int objPtr) {
    var int classDef;
    classDef = MEM_GetClassDef (objPtr);
    
    if (classDef) {
        return MEM_ReadString (classDef); //первое совйство zCClassDef.
    };
    return "";
};

//************************************************
//    Создание и удаление Vob'ов
//************************************************

/* Спасибо Gottfried за открытие Wld_InsertObject! */
func int MEM_InsertVob(var string vis, var string wp) {
    /* oCMob можно создавать в Готике */
    const int oCNpc__player_G1 = 9288624; //0x8DBBB0
    const int oCNpc__player_G2 = 11216516; //0xAB2684
    
    var int playerAdr;
    playerAdr = MEMINT_SwitchG1G2(oCNpc__player_G1, oCNpc__player_G2);
    
    var int wasInvalid; wasInvalid = 0;
    
    /* Wld_InsertObject вылетает, если нет игрока!
     * Например, если ее вызвать из Startup. */
    if (!Hlp_Is_oCNpc(MEM_ReadInt(playerAdr))) {
        wasInvalid = 1;
        MEMINT_GetMemHelper();
        MEM_WriteInt(playerAdr, MEM_InstGetOffset(MEM_Helper));
        var int oldWorld; oldWorld = MEM_Helper._zCVob_homeWorld; //игроку нужен "родной" мир.
        MEM_Helper._zCVob_HomeWorld = MEM_InstGetOffset(MEM_World);
    };
    
    Wld_InsertObject(vis,wp);
    
    /* снова недействителен */
    if (wasInvalid) {
        MEM_WriteInt(playerAdr, 0);
        MEM_Helper._zCVob_HomeWorld = oldWorld;
    };
    
    /* Указатель на новый объект в дереве Vob'ов
     * всегда первый в глобальном Vobtree */
    var zCTree newTreeNode;
    newTreeNode = _^ (MEM_World.globalVobTree_firstChild);
    
    return newTreeNode.data;
};

func void MEM_DeleteVob(var int vobPtr) {
    var int world; world = MEM_Game._zCSession_world;
    
    const int call = 0;
    if (CALL_Begin(call)) {
        /* oCWorld.RemoveVob */
        CALL_IntParam(_@(vobPtr));
        CALL__thiscall(_@(world), MEMINT_SwitchG1G2(7171824, 7864512));
    
        call = CALL_End();
    };
};

//************************************************
// Хэширование
//************************************************

//--------------------------------------
//  Расчет хэш-функции
//--------------------------------------

func int MEM_GetBufferCRC32 (var int buf, var int buflen)
{
    const int GetBufferCRC32_G1 = 6088464; //0x5CE710
    const int GetBufferCRC32_G2 = 6265360; //0x5F9A10
    
    var int null;
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(null));
        CALL_IntParam(_@(buflen));
        CALL_PtrParam(_@(buf));
        
        CALL_PutRetValTo(_@(ret));
        CALL__cdecl(MEMINT_SwitchG1G2(GetBufferCRC32_G1, GetBufferCRC32_G2));
        
        call = CALL_End();
    };
    
    var int ret;
    return +ret;
};

func int MEM_GetStringHash (var string str) {
    return MEM_GetBufferCRC32 (STR_toChar(str), STR_Len (str));
};

func int MEMINT_GetWorldHashBucket (var int hash) {
    var int bucketPtr;
    bucketPtr = _@(MEM_World);
    bucketPtr += zCWorld_VobHashTable_Offset + /* sizeof (zCArray) */ 12 * hash;
    return bucketPtr;
};

//--------------------------------------
//   Поиск Vob'а в хэш-функции
//--------------------------------------

func int MEM_SearchVobByName (var string str) {
    const int oCWorld__SearchVobByName_G1 = 7173120; //0x6D7400
    const int oCWorld__SearchVobByName_G2 = 7865872; //0x780610
    
    var int ptr;   ptr   = _@s(str);
    var int world; world = _@(MEM_World);
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(ptr));
        
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(world),
                       MEMINT_SwitchG1G2(oCWorld__SearchVobByName_G1, oCWorld__SearchVobByName_G2));
        
        call = CALL_End();
    };
    
    var int ret;
    return +ret;
};

func int MEM_SearchAllVobsByName (var string str) {
    const int oCWorld__SearchVobListByName_G1 = 7173296; //0x6D74B0
    const int oCWorld__SearchVobListByName_G2 = 7866048; //0x7806C0
    
    var int arr;   arr   = MEM_ArrayCreate();
    var int ptr;   ptr   = _@s(str);
    var int world; world = _@(MEM_World);
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(arr));
        CALL_PtrParam(_@(ptr));
        
        CALL_PutRetValTo(0);
        CALL__thiscall(_@(world),
                       MEMINT_SwitchG1G2(oCWorld__SearchVobListByName_G1, oCWorld__SearchVobListByName_G2));
        
        call = CALL_End();
    };
    
    MEM_ArraySort(arr);
    MEM_ArrayUnique(arr);
    return +arr;
};

//--------------------------------------
// Переименование Vob'а
//--------------------------------------

func void MEM_RenameVob (var int vobPtr, var string newName) {
    const int zCVob_SetVobName_G1 = 6113648; //0x5D4970
    const int zCVob_SetVobName_G2 = 6290896; //0x5FFDD0
    
    var int ptr;   ptr   = _@s(newName);
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(ptr));
        CALL_PutRetValTo(0);
        CALL__thiscall(_@(vobPtr),
                       MEMINT_SwitchG1G2(zCVob_SetVobName_G1, zCVob_SetVobName_G2));
        
        call = CALL_End();
    };
};

//************************************************
//  Trigger / Untrigger
//************************************************

func int MEMINT_VobGetEM(var int vobPtr) {
    const int zCVob__GetEM_G1 = 6113712; //5D49B0
    const int zCVob__GetEM_G2 = 6290960; //5FFE10
    
    const int null = 0;
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PutRetValTo(_@(ret));
        CALL__fastcall(_@(vobPtr),
                       _@(null),
                       MEMINT_SwitchG1G2(zCVob__GetEM_G1, zCVob__GetEM_G2));
        
        call = CALL_End();
    };
    
    var int ret;
    return +ret;
};

func void MEM_TriggerVob (var int vobPtr) {
    if (!vobPtr) {
        MEM_Error ("MEM_TriggerVob: VobPtr may not be null!");
        return;
    };

    const int zCEventManager_OnTrigger_G1 = 7202656; //0x6DE760
    const int zCEventManager_OnTrigger_G2 = 7895536; //0x7879F0
    
    var zCVob vob; vob = _^(vobPtr);
    var int eventMan; eventMan = MEMINT_VobGetEM(vobPtr);
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(vobPtr));
        CALL_PtrParam(_@(vobPtr));
        CALL_PutRetValTo(0);
        CALL__thiscall(_@(eventMan),
                       MEMINT_SwitchG1G2(zCEventManager_OnTrigger_G1, zCEventManager_OnTrigger_G2));
        
        call = CALL_End();
    };
};

func void MEM_UntriggerVob (var int vobPtr) {
    if (!vobPtr) {
        MEM_Error ("MEM_UntriggerVob: VobPtr may not be null!");
        return;
    };

    const int zCEventManager_OnUnTrigger_G1 = 7202848; //6DE820
    const int zCEventManager_OnUnTrigger_G2 = 7895728; //787AB0
    
    var zCVob vob; vob = _^(vobPtr);
    var int eventMan; eventMan = MEMINT_VobGetEM(vobPtr);
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(vobPtr));
        CALL_PtrParam(_@(vobPtr));
        CALL_PutRetValTo(0);
        CALL__thiscall(_@(eventMan),
                       MEMINT_SwitchG1G2(zCEventManager_OnUnTrigger_G1, zCEventManager_OnUnTrigger_G2));
        
        call = CALL_End();
    };
};

//######################################################
//
//  Клавиатура
//
//######################################################

//Возвращаемые значения
const int KEY_UP = 0;
const int KEY_PRESSED = 1;
const int KEY_HOLD = 2;
const int KEY_RELEASED = 3;

//--------------------------------------
//  Основное: Нажата ли клавиша?
//--------------------------------------

//Немного неловко, что метод, который проверяет наличие KEY_HOLD называется KeyPressed... :-(
//но теперь это так, и я ничего не буду менять.

func int MEM_KeyPressed(var int key) {
    return MEM_ReadInt (MEMINT_KeyEvent_Offset + key) & 255;
};

//--------------------------------------
//  Основано на нем: Проверка,
//  нажата ли клавиша впервые
//  или удерживается.
//--------------------------------------

//Здесь я сохраняю состояния клавиш после предыдущего опроса:
var int MEMINT_KeyState[1024]; //бОльшие значения - это кнопки джойстика и т.п.

func int MEM_KeyState(var int key) {
    var int pressed;
    pressed = MEM_KeyPressed (key);

    //Получаем адрес как Int:
    var int adr; adr = _@(MEMINT_KeyState);
    adr += 4 * key;

    //Получаем текущее состояние:
    var int keyState; keyState = MEM_ReadInt(adr);

    //Обработка состояния:
    if (keyState == KEY_UP) {
        if (pressed) {
            keyState = KEY_PRESSED;
        };
    } else if (keyState == KEY_PRESSED) {
        if (pressed) {
            keyState = KEY_HOLD;
        } else {
            keyState = KEY_RELEASED;
        };
    } else if (keyState == KEY_HOLD) {
        if (!pressed) {
            keyState = KEY_RELEASED;
        };
    } else /* keyState == KEY_RELEASED */ {
        if (pressed) {
            keyState = KEY_PRESSED;
        } else {
            keyState = KEY_UP;
        };
    };

    //Запоминаем новое состояние
    MEM_WriteInt (adr, keyState);
    return keyState; //возвращаем.
};

//--------------------------------------
//  Имитация нажатия клавиши
//--------------------------------------

/* Проблематично, возможно, будет найдено лучше решение.
 * Но многое уже можно сделать.
 * Примеры:
 *   -Открыть инвентарь.
 *   -Быстрое сохранение.
 *   -Открыть меню персонажа.
 *   -Переключение паузы (режим Marvin).
 *   -Открыть Log
 *   -Открыть клавное меню (ESC)
 *   ...
 *
 * Но в некторых случаях движок хочет, чтобы клавшиа "переключалась",
 * но эта ситуация обрабатывается по-другому и не затрагивается здесь.
 * Поэтому, например, нельзя закрыть инвентарь
 * с помощью этой функции. */

func void MEM_InsertKeyEvent(var int key) {
    MEM_ArrayInsert (MEMINT_KeyBuffer_offset, key);
};

//#################################################################
//
//  Доступ к zCOptions:
//
//#################################################################

var zCOption MEMINT_OPT_Set;
var zCOptionSection MEMINT_OPT_Section;
var zCOptionEntry MEMINT_OPT_Entry;

//************************************************
//  Чтение
//************************************************

//--------------------------------------
//  чтение в zCOptions
//--------------------------------------

/* Поиск всех вхождений в данный раздел */
func int MEMINT_OPT_FindEntry(var string optname) {
    //Число вхождений, кроме == 0 (потому что возможен только цикл с постусловием do-while, а не с предусловием while-do).
    if (!MEMINT_OPT_Section.entryList_numInArray) {
        return FALSE;
    };

    var int i; i = 0;
    var int loopStart; loopStart = MEM_StackPos.position;
    /* while */ if (i < MEMINT_OPT_Section.entryList_numInArray) {
        var int ptr; ptr = MEM_ReadIntArray (MEMINT_OPT_Section.entryList_array, i);
        MEMINT_OPT_Entry = _^(ptr);

        if (Hlp_StrCmp (MEMINT_OPT_Entry.varName, optname)) {
            return TRUE;
        };

        i += 1;

        MEM_StackPos.position = loopStart;
    }; /* end while */

    return FALSE; //ничего не найдено.
};

/* Поиск текущего множества параметров в секции */
func int MEMINT_OPT_FindSection (var string sectname) {
    //Число вхождений, кроме == 0 (потому что возможен только цикл с постусловием do-while, а не с предусловием while-do).
    if (!MEMINT_OPT_Set.sectionList_numInArray) {
        return FALSE;
    };

    var int i; i = 0;
    var int loopStart; loopStart = MEM_StackPos.position;

    /* while */ if (i < MEMINT_OPT_Set.sectionList_numInArray) {
        var int ptr; ptr = MEM_ReadIntArray (MEMINT_OPT_Set.sectionList_array, i);
        MEMINT_OPT_Section = _^(ptr);

        if (Hlp_StrCmp (MEMINT_OPT_Section.secName, sectname)) {
            return TRUE;
        };

        i += 1;

        MEM_StackPos.position = loopStart;
    }; /* end while */

    return FALSE; //ничего не найдено.
};

//--------------------------------------
//  Поиск в Gothic.ini
//--------------------------------------

func string MEM_GetGothOpt (var string sectionname, var string optionname) {
    MEMINT_OPT_Set = _^(MEM_ReadInt (zoptions_Pointer_Address));

    if (!MEMINT_OPT_FindSection (sectionname)) {
        return "";
    };

    if (!MEMINT_OPT_FindEntry (optionname)) {
        return "";
    };

    return MEMINT_OPT_Entry.varValue;
};

func int MEM_GothOptSectionExists (var string sectionname) {
    MEMINT_OPT_Set = _^(MEM_ReadInt (zoptions_Pointer_Address));
    return MEMINT_OPT_FindSection (sectionname);
};

func int MEM_GothOptExists (var string sectionname, var string optionname) {
    if (!MEM_GothOptSectionExists (sectionname)) {
        return false;
    };

    return MEMINT_OPT_FindEntry (optionname);
};

//--------------------------------------
//  Поиск в Mod.ini
//--------------------------------------

func string MEM_GetModOpt (var string sectionname, var string optionname) {
    MEMINT_OPT_Set = _^(MEM_ReadInt (zgameoptions_Pointer_Address));

    if (!MEMINT_OPT_FindSection (sectionname)) {
        return "";
    };

    if (!MEMINT_OPT_FindEntry (optionname)) {
        return "";
    };

    return MEMINT_OPT_Entry.varValue;
};

func int MEM_ModOptSectionExists (var string sectionname) {
    MEMINT_OPT_Set = _^(MEM_ReadInt (zgameoptions_Pointer_Address));
    return MEMINT_OPT_FindSection (sectionname);
};

func int MEM_ModOptExists (var string sectionname, var string optionname) {
    if (!MEM_ModOptSectionExists (sectionname)) {
        return false;
    };

    return MEMINT_OPT_FindEntry (optionname);
};

//--------------------------------------
//  Получение командной строки
//--------------------------------------

func string MEM_GetCommandLine () {
    MEMINT_OPT_Set = _^(MEM_ReadInt (zoptions_Pointer_Address));
    return MEMINT_OPT_Set.commandline;
};

//#####################################################
//  Запись
//#####################################################

/* Настройки мода никогда не сохраняются на диск, поэтому 
 * нет отдельной функции для их записи */

func void MEM_SetGothOpt (var string section, var string option, var string value) {
    var int optSetPtr; optSetPtr = MEM_ReadInt (zoptions_Pointer_Address);
    MEMINT_OPT_Set = _^(optSetPtr);

    if (!MEMINT_OPT_FindSection (section)) {
        MEM_Info (ConcatStrings ("MEM_SetGothOpt: Creating new Section: ", section));
        var int newSect_ptr;
        newSect_ptr = MEM_Alloc (sizeof_zCOptionSection);
        MEMINT_OPT_Section = _^(newSect_ptr);
        MEMINT_OPT_Section.secName = section;

        MEM_ArrayInsert (optSetPtr + 8, newSect_ptr);
    };

    if (!MEMINT_OPT_FindEntry (option)) {
        MEM_Info (ConcatStrings ("MEM_SetGothOpt: Creating new entry: ", option));
        var int newEntry_ptr;
        newEntry_ptr = MEM_Alloc (sizeof_zCOptionEntry);
        MEMINT_OPT_Entry = _^(newEntry_ptr);
        MEMINT_OPT_Entry.varName = option;

        var int sectPtr;
        sectPtr = MEM_InstGetOffset (MEMINT_OPT_Section);

        MEM_ArrayInsert (sectPtr + 20, newEntry_ptr);
    };

    MEMINT_OPT_Entry.varValue = value;
    MEMINT_OPT_Entry.varValueTemp = value; /* не забываем временное значение */
};

//--------------------------------------
// Применить изменения
// и сохранить ini-файл на диск
//--------------------------------------

func void MEM_ApplyGothOpt() {
    const int call = 0;
    if (CALL_Begin(call)) {
        /* CGameManager.ApplySomeSettings */
        CALL__thiscall(MEMINT_gameMan_Pointer_address, MEMINT_SwitchG1G2(4351936, 4355760));
        call = CALL_End();
    };
};

//--------------------------------------
//  Получение управляющих клавиш
//--------------------------------------

func int MEMINT_HexCharToInt(var int c) {
    const int ASCII_a = 97;
    const int ASCII_0 = 48;
    if (c >= ASCII_0 && c < ASCII_0 + 10) {
        return c - ASCII_0;
    } else if (c >= ASCII_a && c < ASCII_a + 6) {
        return 10 + c - ASCII_a;
    } else {
        MEM_Error(ConcatStrings("Invalid Hex Char: ", IntToString(c)));
        return 0;
    };
};

func int MEMINT_KeyStringToKey(var string hex) {
    var zString str; str = _^(_@s(hex));
    var int res; res = 0;
    
    res += MEMINT_HexCharToInt(MEM_ReadByte(str.ptr + 0)) <<  4;
    res += MEMINT_HexCharToInt(MEM_ReadByte(str.ptr + 1)) <<  0;
    res += MEMINT_HexCharToInt(MEM_ReadByte(str.ptr + 2)) << 12;
    res += MEMINT_HexCharToInt(MEM_ReadByte(str.ptr + 3)) <<  8;
    
    return res;
};

func int MEM_GetKey(var string name) {
    var string raw;
    raw = MEM_GetGothOpt("KEYS", name);
    
    if (STR_Len(raw) < 4) {
        MEM_Warn(ConcatStrings("Could not find key with name: ", name));
        return 0;
    };
    
    return MEMINT_KeyStringToKey(raw);
};

func int MEM_GetSecondaryKey(var string name) {
    var string raw;
    raw = MEM_GetGothOpt("KEYS", name);
    
    /* Только когда задано 2 клавиши: */
    if (STR_Len(raw) < 8) {
        return 0; //нет второй клавиши
    };
    
    raw = STR_SubStr(raw, 4, 4);
    
    return MEMINT_KeyStringToKey(raw);
};

func string MEMINT_ByteToKeyHex(var int byte) {
    const int ASCII_0 = 48;
    byte = byte & 255;
    
    const int mem = 0;
    if (!mem) { mem = MEM_Alloc(3); };
    
    MEM_WriteByte(mem    , (byte >>  4) + ASCII_0);
    MEM_WriteByte(mem + 1, (byte &  15) + ASCII_0);
    return STR_FromChar(mem);
};

func void MEM_SetKeys(var string name, var int primary, var int secondary) {
    var string str; str = "";
    str = ConcatStrings(str, MEMINT_ByteToKeyHex( primary        ));
    str = ConcatStrings(str, MEMINT_ByteToKeyHex((primary   >> 8)));
    str = ConcatStrings(str, MEMINT_ByteToKeyHex( secondary      ));
    str = ConcatStrings(str, MEMINT_ByteToKeyHex((secondary >> 8)));
    
    MEM_SetGothOpt("KEYS", name, str);
    
    /* Переназначение клавиш */
    const int call = 0;
    if (CALL_Begin(call)) {
        var int zInputPtr;         zInputPtr         = MEMINT_SwitchG1G2(8834208, 9246288);
        var int zCInput__BindKeys; zCInput__BindKeys = MEMINT_SwitchG1G2(5003568, 5045760);
        
        var int null;
        CALL_IntParam(_@(null));
        CALL__thiscall(zInputPtr, zCInput__BindKeys);
        call = CALL_End();
    };
};

func void MEM_SetKey(var string name, var int key) {
    MEM_SetKeys(name, key, MEM_GetSecondaryKey(name));
};

func void MEM_SetSecondaryKey(var string name, var int key) {
    MEM_SetKeys(name, MEM_GetKey(name), key);
};

//#################################################
//
// Измерение времени / Тест производительности / Ускорение
//
//#################################################

//************************************************
// Измерение времени выполнения
//************************************************

func int MEM_GetSystemTime() {
    const int sysGetTimePtr_G1 = 5204320; //0x4F6960;
    const int sysGetTimePtr_G2 = 5264000; //0x505280;
    
    const int call = 0;
    if (CALL_Begin(call)) {        
        CALL_PutRetValTo(_@(ret));
        CALL__cdecl(MEMINT_SwitchG1G2(sysGetTimePtr_G1, sysGetTimePtr_G2));
        call = CALL_End();
    };
    
    var int ret;
    return +ret;
};

func int MEM_GetPerformanceCounter() {
    var int buf[2];
    var int space; space = _@(buf);
    
    const int QueryPerformanceCounter_G1 = 7712432; //0x75AEB0
    const int QueryPerformanceCounter_G2 = 8079382; //0x7B4816
    
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(space));
        
        CALL_PutRetValTo(0);
        CALL__stdcall(MEMINT_SwitchG1G2(QueryPerformanceCounter_G1, QueryPerformanceCounter_G2));        
        call = CALL_End();
    };
    
    return buf[0];
};

//************************************************
// Тестирование производительности
//************************************************

func void MEMINT_Benchmark_Helper() {
    MEMINT_Benchmark_Helper();
};

    const int MEMINT_Benchmark_MS  = 0;
    const int MEMINT_Benchmark_PC  = 1;
    const int MEMINT_Benchmark_MMS = 2;

func int MEMINT_Benchmark(var func f, var int times, var int unit) {
    MEM_WriteInt(MEM_GetFuncPtr(MEMINT_Benchmark_Helper) + 1, //Вспомогательная функция вызывает...
                 MEM_GetFuncOffset(f)); //... f
    
    var int i; i = 0;
    var int startTime;
    
    if (unit == MEMINT_Benchmark_MS) {
        startTime = MEM_GetSystemTime();
    } else {
        startTime = MEM_GetPerformanceCounter();
    };
    
    var int loop; loop = MEM_StackPos.position;
    if (i < times) {
        MEMINT_Benchmark_Helper();
        i += 1;
        MEM_StackPos.position = loop;
    };
    
    if (unit == MEMINT_Benchmark_MS) {
        return MEM_GetSystemTime() - startTime;
    } else {
        var int pc; pc = MEM_GetPerformanceCounter() - startTime;
        
        if (unit == MEMINT_Benchmark_PC) {
            return pc;
        } else {
            if (pc > 2147483) {
                /* нельзя умножить на 1000, т.к. число достаточно большое
                 * Я немного потеряю, если сначала разделю. */
                return (pc / MEM_ReadInt(PC_TicksPerMS_Address)) * 1000;
            } else {
                return (pc * 1000) / MEM_ReadInt(PC_TicksPerMS_Address);
            };
        };
    };
};

func int MEM_BenchmarkMS(var func f) {
    return MEMINT_Benchmark(f, 1, MEMINT_Benchmark_MS);
};

func int MEM_BenchmarkMS_N(var func f, var int n) {
    return MEMINT_Benchmark(f, n, MEMINT_Benchmark_MS);
};

func int MEM_BenchmarkMMS(var func f) {
    return MEMINT_Benchmark(f, 1, MEMINT_Benchmark_MMS);
};

func int MEM_BenchmarkMMS_N(var func f, var int n) {
    return MEMINT_Benchmark(f, n, MEMINT_Benchmark_MMS);
};

func int MEM_BenchmarkPC(var func f) {
    return MEMINT_Benchmark(f, 1, MEMINT_Benchmark_PC);
};

func int MEM_BenchmarkPC_N(var func f, var int n) {
    return MEMINT_Benchmark(f, n, MEMINT_Benchmark_PC);
};

//NS: а где ускорение?

//#################################################
//
//    Ведение лога и отладка
//
//#################################################

//************************************************
//   SendToSpy (отправка сообщений в zSpy)
//************************************************

func void MEMINT_SendToSpy_Implementation(var int errorType, var string text) {
    text = ConcatStrings("Q: ", text); //! = Ikarus
    
    const int zerr_G1 = 8821208; //0x8699D8
    const int zerr_G2 = 9231568; //0x8CDCD0
    var int zerrPtr; zerrPtr = MEMINT_SwitchG1G2(zerr_G1, zerr_G2);
    
    var zERROR zerr; zerr = _^(zerrPtr);
    var int old_ack_type; old_ack_type = zerr.ack_type;
    if (MEMINT_ForceErrorBox) {
        if (GOTHIC_BASE_VERSION == 1) {
            /* Предупреждение "lost focus",
             * которое выводится постоянно, пока
             * я не снижу приоритет. */
            MEM_WriteByte(5199298, 1);
        };
    
        zerr.ack_type = zERR_TYPE_WARN;
        
        /* Нельзя включить окно Error Box, т.к.
         * создание Error Box вызывает новые сообщения */
        if (errorType < zERR_TYPE_WARN) {
            errorType = zERR_TYPE_WARN;
        };
        
        MEMINT_ForceErrorBox = 0;
    } else {
        zerr.ack_type = zERR_TYPE_FATAL;
    };
    
    const int zERROR_Report_G1 = 4489808; //0x448250
    const int zERROR_Report_G2 = 4507856; //0x44C8D0
    
    var int null;
    
    var int ptr; ptr = _@s(text);
    
    const int call  = 0;
    if (CALL_Begin(call)) {
        CALL_PtrParam(_@(null));  //char * функция
        CALL_PtrParam(_@(null));  //char * файл
        CALL_IntParam(_@(null));  //int строка
        CALL_IntParam(_@(null));  //uint флаги
        CALL_IntParam(_@(null));  //uint уровень (бесполезно?)
        CALL_PtrParam(_@(ptr));   //zString * сообщение
        CALL_PtrParam(_@(null));  //int ID ошибки (бесполезно)
        CALL_PtrParam(_@(errorType)); //zERROR_TYPE тип ошибки
        
        CALL_PutRetValTo(0);
        CALL__thiscall(_@(zerrPtr),
                       MEMINT_SwitchG1G2(zERROR_Report_G1, zERROR_Report_G2));
        
        call = CALL_End();
    };
    
    zerr.ack_type = old_ack_type;
};

//************************************************
//   Трассировка стека
//************************************************

//--------------------------------------
//   Вывод одной строки трассировки
//--------------------------------------

//Милый Print
func void MEMINT_PrintStackTraceLine(var int popPos) {
    var int valid;
    
    if (popPos < 0 || popPos >= MEM_Parser.stack_stacksize) {
        valid = false;
    } else {
        valid = true;
        var int funcID; var zCPar_Symbol symb;
        funcID = MEM_GetFuncIDByOffset(popPos);
        symb   = _^(MEM_ReadIntArray(contentSymbolTableAddress, funcID));
    };
    
    const string spaces = "                                                                                                    ";
    var string prt; prt = STR_Prefix(spaces, 8);
    
    if (valid) {
        prt = ConcatStrings(prt, symb.name);
        
        /* добавляем параметры */
        prt = ConcatStrings(prt, "(");
        
        var int loop;
        var int i; i = 1;
        loop = MEM_StackPos.position;
        
        if (i <= (symb.bitfield & zCPar_Symbol_bitfield_ele)) {
            var zCPar_Symbol param;
            param = _^(MEM_ReadIntArray (currSymbolTableAddress, funcID + i));
            
            if (i > 1) {
                prt = ConcatStrings(prt, ", ");
            };
            
            if ((param.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_INT) {
                prt = ConcatStrings(prt, IntToString(param.content));
            } else if ((param.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_STRING) {
                prt = ConcatStrings(prt, "'");
                prt = ConcatStrings(prt, MEM_ReadString(param.content));
                prt = ConcatStrings(prt, "'");
            } else if ((param.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FUNC) {
                var zCPar_Symbol funcParm;
                funcParm = _^(MEM_ReadIntArray (currSymbolTableAddress, param.content));
                prt = ConcatStrings(prt, funcParm.name);
                /* лень возвращаться по цепочке, когда он всего один */
            } else if ((param.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_INSTANCE) {
                prt = ConcatStrings(prt, "(instance)");
                prt = ConcatStrings(prt, IntToString(param.offset));
            } else {
                prt = ConcatStrings(prt, "[Parameter of Unknown type]");
            };
            
            i += 1;
            MEM_StackPos.position = loop;
        };
        prt = ConcatStrings(prt, ")");
    } else {
        prt = ConcatStrings(prt, "[UNKNOWN]");
    };
    
    if (STR_Len(prt) < 70) {
        prt = ConcatStrings(prt, STR_Prefix(spaces, 70 - STR_Len(prt)));
    };
    prt = ConcatStrings(prt, " +");
    
    var string bytes;
    if (valid) {
        bytes = IntToString(popPos - symb.content);
    } else {
        bytes = IntToString(popPos);
    };
    
    if (STR_Len(bytes) < 5) {
        bytes = ConcatStrings(STR_Prefix(spaces, 5 - STR_Len(bytes)), bytes);
    };
    bytes = ConcatStrings(bytes, " bytes");
    
    prt = ConcatStrings(prt, bytes);
    
    MEM_SendToSpy(zERR_TYPE_FAULT, prt);
};

//--------------------------------------
//   Вывод трассировки стека для 
//   вызовов функций Daedalus
//--------------------------------------

func void MEMINT_PrintStackTrace_Implementation() {
    MEM_SendToSpy(zERR_TYPE_FAULT, "[start of stacktrace]");

    var int ESP;
    ESP = MEMINT_FindFrameBoundary(MEMINT_GetESP(), -1);
    /* на первый взгляд выглядит как граница фрейма.
     * для MEMINT_FindFrameBoundary НЕ выглядит так 
     * отсюда, потому что я нахожусь глубже в стеке: */
    ESP += MEMINT_DoStackFrameSize; 
    
    /* очень неприятно: ??? в стековом фрейме функции находится не 
     * текущий PopPos, который расположен во фрейме выше,
     * с уровня, откуда вы собирались протолкнуть значение в стек: */
	 /*NS: не уверена, что правильно перевела, но общий смысл такой:
	   текущий PopPos узнаем не из фрейма текущей функции, а оттуда, где ее вызвали. Надо найти это место */
    var int passedMySelf; passedMySelf = 0;
    var int mySelf; mySelf = MEM_GetFuncID(MEMINT_PrintStackTrace_Implementation);
    
    var int loop; loop = MEM_StackPos.position;
    
    /* while */
        /* Я нахожусь в начале DoStack Frame,
         * здесь получаю вызванную функцию: */
        var int popPos;
        popPos = MEM_ReadInt(ESP-MEMINT_DoStackPopPosOffset);
        
        if (passedMySelf) {
            MEMINT_PrintStackTraceLine(popPos);
        } else if (popPos < MEM_Parser.stack_stacksize) {
            var int funcID;
            funcID = MEM_GetFuncIDByOffset(popPos);
            passedMySelf = (funcID == mySelf);
        };
        
        /* Есть ли другой DoStack, вызвавший меня? */
        if (MEMINT_IsFrameBoundary(ESP)) {
            /* продолжаем искать! */
            ESP += MEMINT_DoStackFrameSize;
            MEM_StackPos.position = loop;
        };
    /* end while */
    
    MEM_SendToSpy(zERR_TYPE_FAULT, "[end of stacktrace]");
};

//--------------------------------------
//   Вывод трассировки стека при вызове
//   обработчика исключений (SEH) из DoStack.
//--------------------------------------

var int MEMINT_ExceptionHandlerESP; /* где начинать искать трассирувку? */
var int MEMINT_TopPopPos;           /* PopPos для (вероятно, вылетевшей) инстанции DoStack. */

func void MEMINT_ExceptionHandler() {
    const int invoked_once = 0;
    
    if (!invoked_once) {
        invoked_once = true;
    
        MEM_SendToSpy(zERR_TYPE_FAULT, "[start of stacktrace]");
        
        MEMINT_PrintStackTraceLine(MEMINT_TopPopPos - MEM_Parser.stack_stack);
        
        var int ESP; ESP = MEMINT_FindFrameBoundary(MEMINT_ExceptionHandlerESP, 500);
        
        /* Здесь может не быть границы фрейма, если вылетела нижележащая функция */
        if (ESP) {
            /* примечание: первая должна обрабатываться иначе, и уже была обработана выше */
            ESP += MEMINT_DoStackFrameSize;
        
            var int loop; loop = MEM_StackPos.position;
            
            MEMINT_PrintStackTraceLine(MEM_ReadInt(ESP - MEMINT_DoStackPopPosOffset));
            
            if (MEMINT_IsFrameBoundary(ESP)) {
                ESP += MEMINT_DoStackFrameSize;
                MEM_StackPos.position = loop;
            };
        };
        
        MEM_SendToSpy(zERR_TYPE_FAULT, "[end of stacktrace]");
        MEM_ErrorBox("Exception handler was invoked. Ikarus tried to print a Daedalus-Stacktrace to zSpy. Gothic will now crash and probably give you a stacktrace of its own.");
    };
};

/* Пробуем отловить исключения: */
func void MEMINT_SetupExceptionHandler() {
    const int call = 0;
    
    if (!call) {
        CALL_Open();
        var int handlerOffset;
        handlerOffset = MEM_GetFuncOffset(MEMINT_ExceptionHandler);
        
        ASM_1(ASMINT_OP_movMemToEAX);
        ASM_4(_@(MEM_Parser.stack_stackptr));
        ASM_2(ASMINT_OP_movEAXToMem);
        ASM_4(_@(MEMINT_TopPopPos));
        ASM_2(ASMINT_OP_movESPtoEAX);
        ASM_2(ASMINT_OP_movEAXToMem);
        ASM_4(_@(MEMINT_ExceptionHandlerESP));
        
        CALL_IntParam(_@(handlerOffset));
        
        const int zCParser__DoStack_G1 = 7243264; //0x6E8600
        const int zCParser__DoStack_G2 = 7936352; //0x791960
        
        CALL_PutRetValTo(0);
        CALL__thiscall(_@(contentParserAddress),
                      MEMINT_SwitchG1G2(zCParser__DoStack_G1, zCParser__DoStack_G2));
        
        /* теперь переход к исходному обработчику (что бы он ни делал) */
        const int zCParser__DoStack_SEH_G1 = 8146176; //0x7C4D00
        const int zCParser__DoStack_SEH_G2 = 8562816; //0x82A880
        
        var int SEH; SEH = MEMINT_SwitchG1G2(zCParser__DoStack_SEH_G1, zCParser__DoStack_SEH_G2);
        
        ASM_1(ASMINT_OP_jmp);
        ASM_4(SEH - (ASM_Here() + 4));
        
        call = CALL_Close();
        
        /* устанавливаем обработчик исключений: */
        const int zCParser__DoStack_SEH_Pusher_G1 = 7243266 + 1; //0x6E8602 + 1
        const int zCParser__DoStack_SEH_Pusher_G2 = 7936354 + 1; //0x791962 + 1
        
        var int SEHPusher;
        SEHPusher = MEMINT_SwitchG1G2(zCParser__DoStack_SEH_Pusher_G1,
                                      zCParser__DoStack_SEH_Pusher_G2);
        
        MemoryProtectionOverride(SEHPusher, 4);
                                                   
        MEM_WriteInt(SEHPusher, call);
    };
};

//************************************************
//   Установка функций вывода и SEH
//************************************************

func void MEMINT_ReplaceLoggingFunctions() {
    const int init = 0;
    if (!init) {
        init = true;
        
        MEM_Info("This will be the last Ikarus message printed with PrintDebug and prefix 'U: Skript:'. Subsequent messages will be printed with prefix 'Q:'.");
        MEM_ReplaceFunc(MEM_SendToSpy, MEMINT_SendToSpy_Implementation);
        MEM_Info("Ikarus log functions now print in colour with prefix 'Q:'.");
        
        MEM_ReplaceFunc(MEM_PrintStackTrace, MEMINT_PrintStackTrace_Implementation);
        
        MEMINT_SetupExceptionHandler();
    };
};

//#################################################
//
//          Переработаные функции
//
//  С более проработанными функциями Икаруса
//  становится возможным ускорить его базу.
//  
//  Сохранил сходные имена, чтобы не смущать народ,
//  если кто-то увидит их в стеке вызовов.
//
//#################################################
 
//************************************************
//   Быстрые  чтение / Запись
//************************************************
 
func void MEM_ReadInt_() {
    var int i;
    i = i; i = i; i = i; i = i; i = i; i = i; i = i; i = i; i = i; i = i;
};

func void MEM_WriteInt_() {
    var int i;
    i = i; i = i; i = i; i = i; i = i; i = i; i = i; i = i; i = i; i = i;
};
 
func void MEMINT_InitFasterReadWrite() {
    var MEMINT_HelperClass symb;

    MEMINT_InitOverideFunc(MEM_ReadInt_);
    
    /* Далее идет быстый вариант MEM_ReadInt */
    
    //1. Чтобы ни было в стеке, извлекам из него RValue:
        MEMINT_OfTok(zPAR_OP_UN_PLUS);
    //2. Меняем местами PUSHINST и PUSHVAR
        MEMINT_OfTokPar(zPAR_TOK_PUSHINST, symb);                
        MEMINT_OfTok   (zPAR_TOK_ASSIGNINST); 
        MEMINT_OfTokPar(zPAR_TOK_PUSHINST, zPAR_TOK_PUSHVAR);    
    //3. Возвращаем как RValue:
        MEMINT_OfTok   (zPAR_OP_UN_PLUS);     
        MEMINT_OfTok   (zPAR_TOK_RET);        
    
    MEM_ReplaceFunc(MEM_ReadInt,    MEM_ReadInt_);
        
    /* теперь быстрый вариант MEM_WriteInt */
    var int id; id  = MEM_GetFuncID(MEM_WriteInt);
    
    MEMINT_InitOverideFunc(MEM_WriteInt_);
    
    //1. Временно сохраняем 2-й параметр:
        MEMINT_OfTokPar(zPAR_TOK_PUSHVAR, id + 2 /* [val] */);     
        MEMINT_OfTok   (zPAR_OP_IS);             
    //2. Временно сохраняем 1-й параметр:
        MEMINT_OfTokPar(zPAR_TOK_PUSHVAR, id + 1 /* [adr] */);     
        MEMINT_OfTok   (zPAR_OP_IS);             
    
    //3. Помещаем их в стек в обратном порядке:
        MEMINT_OfTokPar(zPAR_TOK_PUSHVAR, id + 2 /* [val] */);     
        MEMINT_OfTokPar(zPAR_TOK_PUSHVAR, id + 1 /* [adr] */);     
        
    //4. Получаем RValue из адреса:
        MEMINT_OfTok   (zPAR_OP_UN_PLUS);        
    //5. Меняем местами PUSHINST и PUSHVAR
        MEMINT_OfTokPar(zPAR_TOK_PUSHINST, symb);                   
        MEMINT_OfTok   (zPAR_TOK_ASSIGNINST);    
        MEMINT_OfTokPar(zPAR_TOK_PUSHINST, zPAR_TOK_PUSHVAR);       
    //6. Присваиваем и возвращаем:
        MEMINT_OfTok   (zPAR_OP_IS);             
        MEMINT_OfTok   (zPAR_TOK_RET);
        
    /* Осторожно, MEM_ReplaceFunc(MEM_WriteInt, MEM_WriteInt_);
     * может работать неправильно, в итоге используем MEM_WriteInt */
    var int buf; buf = MEM_Alloc(5);
    MEM_WriteByte(buf    , zPAR_TOK_JUMP);
    MEM_WriteInt (buf + 1, MEM_GetFuncOffset(MEM_WriteInt_));
    MEM_CopyBytes(buf, MEM_GetFuncPtr(MEM_WriteInt), 5);
};

func void MEMINT_InitFasterPushInst() {
    var MEMINT_HelperClass symb;

    MEMINT_InitOverideFunc(MEMINT_StackPushInst);
    
    MEMINT_OfTok   (zPAR_OP_UN_PLUS);
    MEMINT_OfTokPar(zPAR_TOK_PUSHINST, symb);                   
    MEMINT_OfTok   (zPAR_TOK_ASSIGNINST);
    MEMINT_OfTok   (zPAR_TOK_RET);
};

//************************************************
//   Ускоренные MEM_Alloc, MEM_Free
//************************************************
 
func int MEM_Alloc_(var int ele) {
    var int size; size = 1;
    const int call = 0;
    
    if (CALL_Begin(call)) {
        var int cAlloc_ptr;
        cAlloc_ptr = MEMINT_SwitchG1G2(7712240 /*0x75ADF0*/, 8078576 /*0x7B44F0*/);
    
        CALL_IntParam(_@(size));
        CALL_IntParam(_@(ele));
        CALL_PutRetValTo(_@(ret));
        CALL__cdecl(cAlloc_ptr);
        call = CALL_End();
    };
    
    var int ret;
    return +ret;
};

func void MEM_Free_(var int ptr) {
    /* нулевой указатель нельзя удалить */
    if (!ptr) {
        MEM_Warn ("MEM_Free: ptr is 0. Ignoring request.");
        return;
    };

    const int call = 0;
    
    if (CALL_Begin(call)) {
        var int free_ptr;
        free_ptr = MEMINT_SwitchG1G2(7712111 /*0x75AD6F*/, 8078540 /*0x7B44CC*/);
    
        CALL_IntParam(_@(ptr));
        
        CALL_PutRetValTo(0);
        CALL__cdecl(free_ptr);
        call = CALL_End();
    };
};

//************************************************
//   Актуальная замена
//************************************************

func void MEMINT_ReplaceSlowFunctions() {
    const int init = 0;
    if (!init) {
        init = true;
        
        /* следующая строка нужна для подготовки вызовов через СТАРУЮ 
         * функцию MEM_Alloc. CALL нуждается в MEM_Alloc для подготовки
         * вызовов, и поскольку НОВАЯ MEM_Alloc тоже нуждается в CALL, 
         * так что это не лучшая идея ;-)
         *
         * Даа, это сбивает с толку... */
         
        MEM_Free_(MEM_Alloc_(1));
        
        MEM_ReplaceFunc(MEM_Alloc,   MEM_Alloc_);
        MEM_ReplaceFunc(MEM_Free,    MEM_Free_);
        
        MEMINT_InitFasterReadWrite();
        MEMINT_InitFasterPushInst();
        
        MEM_ReplaceFunc(_^, MEM_PtrToInst); //так проще
    };
};

//#################################################################
//
//  Инициализация всего
//
//#################################################################

func void MEMINT_VersionError() {
    const string G1   = "Gothic 1.08k";
    const string G2   = "der sogenannten 'Report-Version' von Gothic 2";
    const string G2EN = "the so-called 'Report-Version' of Gothic 2";
    
    var string str;
    str = "Diese Mod funktioniert nur mit ";
    if (GOTHIC_BASE_VERSION == 1) {
        str = ConcatStrings(str, G1);
    } else {
        str = ConcatStrings(str, G2);
    };
    str = ConcatStrings(str, ", da sie Funktionalitat aus dem Skriptpaket 'Ikarus' verwendet. Es ist wahrscheinlich, dass Gothic unmittelbar nach dieser Fehlermeldung absturzt. Die genannte Version von Gothic steht zum Beispiel auf worldofgothic.de zum Download bereit. Der merkwurdige Charakter dieser Fehlermeldung ist leider nicht zu vermeiden. ### This mod only works with ");
    if (GOTHIC_BASE_VERSION == 1) {
        str = ConcatStrings(str, G1);
    } else {
        str = ConcatStrings(str, G2EN);
    };
    str = ConcatStrings(str, ", because it uses parts of the script package 'Ikarus'. Gothic will probably crash immediatly after displaying this error message. Said version of Gothic is available for download at worldofgothic.com. The weirdness of this error message is unavoidable.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                !README!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ");
    
    Wld_InsertObject(str, MEM_FARFARAWAY);
};

func int MEMINT_ReportVersionCheck() {
    /* И в G1, и в G2 первая инструкция по адрес
     * 0x401000 - это некоторая команда mov
     * для перемещения каких-то данных
     * откуда-то в раздел данных.
     * Делаем такую проверку надежной */
    
    var int val; val = MEMINT_SwitchG1G2(-521402937, 504628679);
    var int ptr; ptr = 4198400; //0x401000
    
    if (MEM_ReadInt(ptr) != val) {
        /* Сообщение об ошибке не работает под Готикой 1. Без понятия, как это исправить. */
        MEMINT_VersionError();
        return false;
    };
    
    return true;
};

func void MEM_InitAll() {
    if (!MEMINT_ReportVersionCheck()) {
        return;
    };

    MEM_ReinitParser(); /* ни от чего не зависит */
    MEM_InitLabels(); /* зависит от MEM_ReinitParser */
    MEM_InitGlobalInst(); /* зависит от MEM_ReinitParser */
    
    /* теперь можно использовать MEM_ReplaceFunc, MEM_GetFuncID */
    MEM_GetAddress_Init(); /* зависит от MEM_ReinitParser и MEM_InitLabels */
    /* теперь доступны лучшие операторы */
    
    MEM_InitStatArrs(); /* зависит от MEM_ReinitParser и MEM_InitLabels */
    ASMINT_Init();
    
    MEMINT_ReplaceLoggingFunctions();
    MEMINT_ReplaceSlowFunctions();
    MEM_InitRepeat();
    
     /* Первый вызов занимает некоторое время.
        Вызываем ее, чтобы потом не было задержки.*/
    var int dump; dump = MEM_GetFuncIDByOffset(0);
};
