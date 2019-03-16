//#################################################################
//
//  32-битные (стандарт IEEE 754) числа с плавающей запятой
//  (вещественные) для Daedalus:
//      Первоначальный скрипт от 26.11.2008:
// http://forum.worldofplayers.de/forum/threads/500080-Instrumentarium-Floats
//
//  Эта версия сохраняет оригинальный интерфейс, но использует 
//  современные инструкции для чисел с плавающей запятой.
//  Так что эта версия быстрее и точнее.
//
//  Требуется Ikarus.
//
//  Завершено 6.4.2012:
//    - переход на Ikarus
//    - добавлены castFromIntf и castToIntf
//
//  Перевод на русский язык: НастасьСанна /*NS*/
//
//#################################################################


/*####################################
//      Краткие сведения
//####################################

//*********************
//  Принципиально
//*********************

Функции в этом сценарии могут выполнять действия с числами с плавающей запятой (вещественные). В качестве контейнера для вещественных чисел служат обычные 32-разрядные целые int (integer).
"За кулисами" синтаксические отличия между целыми и вещественными числами отсутствуют, так что вещественное представление весьма ограничено парсером Готики.
Поэтому необходимо четко понимать, что имеется в виду, поскольку формально целые и вещественные числа представлены одним типом данных. Если вещественное число обрабатывается как целое, или в функцию для вещественных чисел передается целое значение, или наоборот, в лучшем случае получится просто ерунда. 

//************************************
//  Инструментарий
//************************************

Чтобы работать с вещественными числа, их необходимо сначала сгенерировать. Здесь присутствуют функции mkf и fracf, первая из которых из целого числа получает соответствующее вещественное, а вторая дает результат от деления двух целых чисел.
Между собой вещественные числа можно складывать, вычитать, умножать и делить. Также добавлена функция извлечения квадратного корня.
Для операций сравнения необходимо использовать функции ge, g, l, le (вместо операторов >=, >, <, <=).
Затем вещественные числа можно конвертировать обратно в целые с помощью truncf и roundf.

//************************************
//  Обзор функций
//************************************

формулировка "func float" и "var float", как было указано, недопустима (для Готики все числа являются целыми). Такая запись используется только для иллюстративных целей.
Для запоминания функций может пригодиться следующий список с расшифровкой сокращений:

mkf    = make float
truncf = truncate float
roundf = round float
addf   = add floats
subf   = subtract floats
negf   = negate float
mulf   = multiply floats
divf   = divide floats
invf   = inverse float
gf     = greater
gef    = greater or equal
lf     = lower
lef    = lower or equal
sqrtf  = square root of float
printf = print float

*************** Конвертирование ******************
func float mkf (var int x) //Создает вещественное число из целого.
func int truncf (var float x) //обрезает вещественное значение до целого, отбрасывая дробную часть. Возвращает целое число. (для -1.5 получим -1.0, а не -2)
func int roundf (var float x) //преобразует вещественное число к целому, округляя его. Возвращает целое число.

**************** Сложение ************************
func float addf (var float x, var float y) //складывает x и y и возвращает результат.
func float subf (var float x, var float y) //вычитает y из x и возвращает результат.
func float negf (var float x) //Возвращает число, противоположное к x (т.е. -x).

**************** Умножение ***********************
func float mulf (var float x, var float y) //умножает x на y и возвращает результат
func float divf (var float x, var float y) //делит x на y и возвращает результат.
func float invf (var float x) //Возвращает число, обратное к x, т.е. 1/x. Если x = 0, возникает ошибка.
func float fracf (var int p, var int q) //Возвращает результат деления p/q как вещественое число. Эквивалентно divf(mkf(p), mkf(q))

**************** Операции сравнения **************
func int gf (var float x, var float y) //если x > y возвращает TRUE, иначе FALSE
func int gef (var float x, var float y) //если fur x >= y возвращает TRUE, иначе FALSE
func int lef (var float x, var float y) //если fur x <= y возвращает TRUE, иначе FALSE
func int lf (var float x, var float y) //если fur x < y возвращает TRUE, иначе FALSE

**************** Разное **************************
func float sqrf  (var float x) //возвращает квадрат числа x
func float sqrtf (var float x) //возвращает квадратный корень из x
func string toStringf(var float x) //Дает строковое представление числа x, напр. "12.345"

**************** Casts ************************
В Daedalus есть свой собственный, очень ограниченный "var float".
Чтобы floats в формате этого скрипта в Floats преобразовать в формат Daedalus, и наоборот, есть две функции.

func float castFromIntf(var int   f) //Преобразует float в формате этого скрипта в формат Daedalus
func int   castToIntf  (var float f) //Преобразует float в формате Daedalus  в формат этого скрипта

Обе функции, в конечном счете, ничего не делают. Они "обманывают" парсер путем простого изменения типа данных.
В обоих случаях параметры и возвращаемые значения обеих функций фактически имеют тип float.

//************************************
//  Прочее
//************************************

Определены 5 констант, которые можно использовать без вычисления/конвертирования целых чисел:

FLOATNULL = 0
FLOATEINS = 1
FLOATHALB = 0.5
PI = 3.1415...
E = 2.7182...

//************************************
//  Примеры
//************************************

Следующая функция вычисляет объем цилиндра в куб.см и возвращает округленное значение.
Параметры передаются как целые числа.

func int CylinderVolume (var int radius, var int height) {
    var int radiusf, var int heightf;
    radiusf = mkf (radius);
    heightf = mkf (height);

    //V = r * PI * h

    var int resultf;
    resultf = mulf (radiusf, radiusf);
    resultf = mulf (resultf, PI);
    resultf = mulf (resultf, h);

    return roundf (resultf);
};

Следующая функция вычисляет значение и выводит его на экран. Несколько вложенных функций

func void reply () {
    var int foo;

    foo = mulf (mkf (1337), PI);
    printf (divf (foo, mkf (100)));

    //(1337*PI)/100 с удивительной точностью равно 42. ;-)
	//NS: Увы, увы, только в формате single. При более точных расчетах, отличие уже в 3 знаке после запятой
};

Следующая функция выполняет несколько сравнений. Ни в одном случае не выдается "ERROR".

func void floattest()
{
    var int halb; var int eins; var int zwei;	//NS: 0.5, 1, 2
    var int null;	//NS: 0
    var int minuseins; var int minuszwei;	//NS: -1, -2

    halb = invf (mkf (2));
    eins = mkf (1);
    zwei = mkf (2);
    null = mkf (0);
    minuseins = mkf (-1);
    minuszwei = mkf (-2);

    if (gf (zwei,eins))           {} else { print ("ERROR!"); };
    if (gf (eins,null))           {} else { print ("ERROR!"); };
    if (lf (minuseins,null))      {} else { print ("ERROR!"); };
    if (lf (minuszwei,minuseins)) {} else { print ("ERROR!"); };
    if (gf (halb,minuseins))      {} else { print ("ERROR!"); };
    if (lf (halb,zwei))           {} else { print ("ERROR!"); };
    if (lef (null,null))          {} else { print ("ERROR!"); };
    if (gef (null,null))          {} else { print ("ERROR!"); };
};

//************************************
//  Ограничения и подводные камни
//************************************

***********  Ошибки пользователя *****************
Ни при каких обстоятельствах не применяйте операторы +, -, * или / к вещественным числам. Тут они бесполезны. В лучшем случае, получится просто ерунда. Используйте addf, subf, mulf и divf, как написано выше.
Если вы знаете внутреннее представление вещественных чисел, например, только для положительных вещественных, можно использовать операторы сравнения (>, <, <= >=). Если вы не уверены, лучше используйте предоставленные функции.
Разумеется, вещественные функции не подходят для целых чисел. Запись sqrtf (4) не равна 2, а просто неправильна, поскольку это будет 81 в виде целого! Чтобы извлечь квадратный корень из 4, нужно сделать так: roundf(sqrtf(mkf(4))). Тогда получится 2.

*********** Погрешность представления ************
Точность представления вещественных чисел весьма ограничена, поэтому начиная с 4 знака после запятой может возникнуть погрешность округления. Это касается очень больших или очень маленьких чисел.
Есть обычные рекомендации и ограничения для вещественных чисел. Например, часто бывает необходимо проверить вещественные числа на равенство, но из-за погрешности округления получается так, что два числа, которые фактически должны быть равны друг другу, немного различаются. В этом случае лучше проверить, будет ли разница между этими двумя числами меньше некоторой малой величины (относительно решаемой задачи).

*/

//#################################################################
//
//  ФУНКЦИИ
//
//#################################################################

const int FLOAT_SIGN_MASK = 1 << 31;

const int FLOATNULL = 0;
const int FLOATEINS = 1065353216; //vz 0, exp 0 (also char 127), mt 1.0
const int FLOATONE  = FLOATEINS;  //то же
const int FLOATHALB = 1056964608; //vz 0, exp -1 (also char 126), mt 1.0
const int FLOATHALF = FLOATHALB;  //то же

const int PI = 1078530011;
const int E =  1076754516;

/* Следующие массивы содержат код ассемблера. */
const int FLTINT_trunc_code[9] = { -2082109099, 2111375596, 1166763774, 1712108798, -637778551, 1842939973, -128066564, -1946260007, -1010173883 };
const int FLTINT_mul_code  [3] = { -639268523, 1306004549, 12830984 };
const int FLTINT_div_code  [3] = { -639268523, 2111310917, 12830984 };
const int FLTINT_add_code  [3] = { -639268523, 1171786821, 12830984 };
const int FLTINT_mk_code   [2] = { -605714091, -1010235323 };

/* Вспомогательная функция: */
func int _FLT_Build_Func(var int codePtr, var int param1Ptr, var int param2Ptr, var int retValIsFloat, var int resultPtr) {
    CALL_Open();
    if (param2Ptr) {
        CALL_IntParam(param2Ptr);
    };
    if (param1Ptr) {
        CALL_IntParam(param1Ptr);
    };
    if (retValIsFloat) {
        CALL_RetValIsFloat();
    };
    CALL_PutRetValTo(resultPtr);
    CALL__cdecl(codePtr);
    return CALL_Close();
};

//************************************
//      Упаковщик:
//************************************

func int mkf (var int x) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_mk_code), _@(x), 0, 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int truncf (var int x) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_trunc_code), _@(x), 0, 0, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int addf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_add_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int mulf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_mul_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int divf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_div_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

//************************************
//  Возведение в квадрат и извлечение корня
//************************************

func int sqrf(var int f) {
    return mulf(f,f);
};

func int sqrtf(var int f) {
    const int sqrtf_G1 = 7757593; //0x765F19
    const int sqrtf_G2 = 8123917; //0x7BF60D
    
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(MEMINT_SwitchG1G2(sqrtf_G1, sqrtf_G2),
                               _@(f), 0, 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

//************************************
//  Можно реализовать 5
//  небольших вспомогательных функции:
//************************************

func int negf (var int x) {
    if (x < 0) { return x & (~FLOAT_SIGN_MASK); }
    else       { return x |   FLOAT_SIGN_MASK ; };
};

func int absf (var int x) {
    return x & (~FLOAT_SIGN_MASK);
};

func int subf (var int x, var int y) {
    return addf(x, negf(y));
};

func int roundf (var int x) {
    if (x < 0) {
        return truncf(subf(x, FLOATHALB));
    } else {
        return truncf(addf(x, FLOATHALB));
    };
};

func int invf (var int x) {
    return divf(FLOATEINS, x);
};

/* спасибо orcwarriorPL за идею! */
func int fracf (var int p, var int q) {
    if (!q) {
        MEM_Error("fracf: Denominator is 0.");
    };
    return divf(mkf(p), mkf(q));
};

 /* обесценена */
func int sqrtf_approx(var int f) { return sqrtf(f); };

//************************************
//  Операции сравнения
//************************************

func int gf (var int x, var int y) {
    var int isnegX; isnegX = x & FLOAT_SIGN_MASK;
    var int isnegY; isnegY = y & FLOAT_SIGN_MASK;

    if (isNegX && isNegY) { //оба отрицательные
        if (x < y) {
            return TRUE;
        };
    }
    else {
        if (x > y) {
            return TRUE;
        };
    };

    return FALSE;
};

func int gef (var int x, var int y) {
    if (x == y) { return true; };
    return gf (x,y);
};

func int lef (var int x, var int y) {
    return !gf(x,y);
};

func int lf (var int x, var int y) {
    return !gef (x,y);
};

//*****************************************
//  Функции вывода, спасибо Gottfried!
//*****************************************

func float castFromIntf(var int   f) { f; };
func int   castToIntf  (var float f) { return MEM_ReadInt(_@f(f)); };

func string toStringf(var int x) {
    var float f; f = castFromIntf(x);
    return FloatToString(f);
};

/* Неудачное имя. Сохранено ради совместимости. */
func void printf(var int x) {
    Print(toStringf(x));
};

