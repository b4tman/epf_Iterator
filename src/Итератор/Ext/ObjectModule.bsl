﻿Перем Коллекция;
Перем Контекст;
Перем ТекИндекс;
Перем ИтерацияНачата;

#Область Служебные
Функция __ВыполнитьФрагмент(Знач Код, Знач Вход, Знач ИмяВход = "Вход", Знач ИмяВыход = "Выход", Знач Инициализировать = Ложь, Знач _ = Неопределено)
    Выход = ?(Инициализировать, Вход, Неопределено);
    
    Если НЕ "Вход" = ИмяВход Тогда
        Код = СтрШаблон("%1=Вход;%2", ИмяВход, Код);
    КонецЕсли;
    Если НЕ "Выход" = ИмяВыход Тогда
        Код = СтрШаблон("%1;Выход=%2", Код, ИмяВыход);
    КонецЕсли;
    
    Выполнить(Код);
    
    Возврат Выход;
КонецФункции
Функция __Мап(Знач Код, Знач Коллекция, Знач _ = Неопределено)
    Результат = Новый Массив;
    
    Для Каждого Элемент Из Коллекция Цикл
        НовыйЭлемент = __ВыполнитьФрагмент(Код, Элемент, "Элемент", "Результат", Истина, _);
        Результат.Добавить(НовыйЭлемент);
    КонецЦикла;
    
    Возврат Результат;
КонецФункции
Функция __Фильтр(Знач КодУсловия, Знач Коллекция, Знач _ = Неопределено)
    Результат = Новый Массив;
    
    Для Каждого Элемент Из Коллекция Цикл
        Условие = __ВыполнитьФрагмент(КодУсловия, Элемент, "Элемент", "Условие", , _);
        Если Условие Тогда
            Результат.Добавить(Элемент);
        КонецЕсли;
    КонецЦикла;
    
    Возврат Результат;
КонецФункции
Функция __ВыполнитьФрагмент_ДляСвертки(Знач Код, Знач Элемент, Знач Результат, Знач _ = Неопределено)
    Выполнить(Код);
    Возврат Результат;
КонецФункции
Функция __Свернуть(Знач Код, Знач Коллекция, Знач Результат = Неопределено, Знач _ = Неопределено)
    Для Каждого Элемент Из Коллекция Цикл
        Результат = __ВыполнитьФрагмент_ДляСвертки(Код, Элемент, Результат, _);
    КонецЦикла;
    
    Возврат Результат;
КонецФункции

Функция __ВзятьНеБольше(Знач Коллекция, Знач Количество)
    Результат = Новый Массив;
    Для Каждого ТекСтр Из Коллекция Цикл
        Если 1 > Количество Тогда
            Прервать;
        КонецЕсли;
        
        Результат.Добавить(ТекСтр);
        
        Количество = Количество - 1;
    КонецЦикла;
    Возврат Результат;
КонецФункции
Функция __Пропустить(Знач Коллекция, Знач Количество)
    Результат = Новый Массив;
    Для Каждого ТекСтр Из Коллекция Цикл
        Если 0 < Количество Тогда
            Количество = Количество - 1;
            Продолжить;
        КонецЕсли;
        
        Результат.Добавить(ТекСтр);
    КонецЦикла;
    Возврат Результат;
КонецФункции
Функция __Обратить(Знач Коллекция)
    Если 0 = Коллекция.Количество() Тогда
        Возврат Коллекция;
    КонецЕсли;      
    Результат = Новый Массив;
    Для Смещение = 1 По Коллекция.Количество() Цикл
        ТекИндекс = Коллекция.Количество() - Смещение;
        Результат.Добавить(Коллекция[ТекИндекс]);
    КонецЦикла;
    Возврат Результат;
КонецФункции

Функция __СимволыВСтроке(Знач Стр)
    Результат = Новый Массив;
    Для Сч = 1 По СтрДлина(Стр) Цикл
        Результат.Добавить(Сред(Стр, Сч, 1));
    КонецЦикла;
    Возврат Результат;
КонецФункции
Функция __МассивПоДиапазонуЧисел(Число_С, Число_По)
    Результат = Новый Массив;
    Для ТекЧисло = Число_С По Число_По Цикл
        Результат.Добавить(ТекЧисло);
    КонецЦикла;
    Возврат Результат;
КонецФункции
Функция __ЭтоКоллекция(ЧтоТо)
    Результат = Ложь;
    Если Неопределено = ЧтоТо Тогда
        Возврат Результат;
    Конецесли;
    
    Попытка
        Для Каждого ТекСтр Из ЧтоТо Цикл
            Прервать;
        КонецЦикла;
        Результат = Истина;
    Исключение
        ;
    КонецПопытки;
    Возврат Результат;
КонецФункции
Функция __ОбходДерева(Дерево, Знач КодПолученияСтрок = "", Знач ВШирину = Ложь)
    Результат = Новый Массив;
    Если ПустаяСтрока(КодПолученияСтрок) Тогда
        Если Тип("ДеревоЗначений") = ТипЗнч(Дерево) Тогда
            КодПолученияСтрок = "Строки = Узел.Строки";
        КонецЕсли;
    КонецЕсли;
    
    Очередь = Новый Массив;
    Очередь.Добавить(Дерево);
    Пока Очередь.Количество() > 0 Цикл
        Следующий = ?(ВШирину, 0, Очередь.ВГраница());
        Узел = Очередь.Получить(Следующий);
        Очередь.Удалить(Следующий);
        
        Результат.Добавить(Узел);
        
        Строки = Неопределено;
        Если ПустаяСтрока(КодПолученияСтрок) Тогда
            // для массива массивов не нужно определять свойство где лежат строки
            Строки = Узел;
        Иначе
            Строки = __ВыполнитьФрагмент(КодПолученияСтрок, Узел, "Узел", "Строки", Истина);
        КонецЕсли;
        
        Если НЕ __ЭтоКоллекция(Строки) Тогда
            Продолжить;
        КонецЕсли;
        
        Для Каждого ТекСтр Из Строки Цикл
            Очередь.Добавить(ТекСтр);
        КонецЦикла;
    КонецЦикла;
    Возврат Результат;
КонецФункции
Функция __Транспонировать(МассивМассивов)
    Результат = Новый Массив;
    МинКоличество = Неопределено;
    
    Для Каждого ТекМассив Из МассивМассивов Цикл
        Если Неопределено = МинКоличество Тогда
            МинКоличество = ТекМассив.Количество();
            Продолжить;
        КонецЕсли;
        МинКоличество = Мин(МинКоличество, ТекМассив.Количество());
    КонецЦикла;
    
    Если 0 = МинКоличество Тогда
        Возврат Результат;
    КонецЕсли;
    
    Для Индекс = 0 По МинКоличество - 1 Цикл
        Элемент = Новый Массив;
        
        Для Каждого ТекМассив Из МассивМассивов Цикл
            Элемент.Добавить(ТекМассив[Индекс]);
        КонецЦикла;
        
        Результат.Добавить(Элемент);
    КонецЦикла;
    
    Возврат Результат;
КонецФункции
#КонецОбласти

Функция ЗагрузитьКоллекцию(_Значение)
    Результат = Неопределено;
    Если Тип("Строка") = ТипЗнч(_Значение) Тогда
        Результат = __СимволыВСтроке(_Значение);
    ИначеЕсли Тип("Массив") = ТипЗнч(_Значение) Тогда
        Результат = _Значение;
    ИначеЕсли Тип("ФиксированныйМассив") = ТипЗнч(_Значение) Тогда
        Результат = Новый Массив(_Значение);
    ИначеЕсли Тип("ДеревоЗначений") = ТипЗнч(_Значение) Тогда
        Результат = __ОбходДерева(_Значение);
    ИначеЕсли Тип("ВнешниеОбработкиОбъект.Итератор") = ТипЗнч(_Значение) Тогда
        Результат = _Значение.Собрать();
    ИначеЕсли __ЭтоКоллекция(_Значение) Тогда
        Результат = Новый Массив;
        Для Каждого ТекСтр Из _Значение Цикл
            Результат.Добавить(ТекСтр);
        КонецЦикла;
    Иначе ОбщегоНазначенияКлиентСервер.ЗначениеВМассиве(_Значение);
    КонецЕсли;
    
    Возврат Результат;
Конецфункции

Функция СоздатьНовый() Экспорт
    Возврат ВнешниеОбработки.Иттератор.Создать();
КонецФункции
Функция Клонировать() Экспорт
    НоваяКоллекция = Новый ФиксированныйМассив(Коллекция);
    НоваяКоллекция = Новый Массив(НоваяКоллекция);
    Возврат ЭтотОбъект.СоздатьНовый().ВзятьИз(НоваяКоллекция);
КонецФункции

Функция Начать() Экспорт
    Коллекция = Новый Массив;
    Возврат ЭтотОбъект;
Конецфункции
Функция НачатьС(_Значение) Экспорт
    Возврат ЭтотОбъект.Начать().Добавить(_Значение);
Конецфункции
Функция ВзятьИз(_Значение) Экспорт
    Коллекция = ЗагрузитьКоллекцию(_Значение);
    Возврат ЭтотОбъект;
Конецфункции
Функция РазделитьСтроку(Знач Стр, Знач Разделитель, Знач ВключатьПустые=Ложь) Экспорт
    Коллекция = СтрРазделить(Стр, Разделитель, ВключатьПустые);
    Возврат ЭтотОбъект;
Конецфункции
Функция ПоДиапазону(Число_С, Число_По) Экспорт
    Коллекция = __МассивПоДиапазонуЧисел(Число_С, Число_По);
    Возврат ЭтотОбъект;
КонецФункции
Функция УстановитьКонтекст(_Контекст) Экспорт
    Контекст = _Контекст;
    Возврат ЭтотОбъект;
КонецФункции

Функция Собрать() Экспорт
    Если Неопределено = Коллекция Тогда
        Коллекция = Новый Массив;
    КонецЕсли;
    Возврат Коллекция;
КонецФункции
Функция СобратьСтроку(Знач Разделитель) Экспорт
    Если Неопределено = Коллекция Тогда
        Коллекция = Новый Массив;
    КонецЕсли;
    Возврат СтрСоединить(Коллекция, Разделитель);
КонецФункции
Функция Контекст() Экспорт
    Возврат Контекст;
КонецФункции

Функция Карта(Знач Код) Экспорт
    Коллекция = __Мап(Код, Коллекция, Контекст);
    Возврат ЭтотОбъект;
КонецФункции
Функция Фильтр(Знач Код) Экспорт
    Коллекция = __Фильтр(Код, Коллекция, Контекст);
    Возврат ЭтотОбъект;
КонецФункции
Функция Свернуть(Знач Код, Знач Результат = Неопределено) Экспорт
    Возврат __Свернуть(Код, Коллекция, Результат, Контекст);
КонецФункции
Функция ВзятьНеБольше(Знач Количество) Экспорт
    Коллекция = __ВзятьНеБольше(Коллекция, Количество);
    Возврат ЭтотОбъект;
КонецФункции
Функция Пропустить(Знач Количество) Экспорт
    Коллекция = __Пропустить(Коллекция, Количество);
    Возврат ЭтотОбъект;
КонецФункции
Функция Срез(Знач Начало=0, Знач Количество=0) Экспорт
    Если 0 > Начало Тогда
        Начало = ЭтотОбъект.Количество() + Начало;
    КонецЕсли;
    
    Если 0 >= Количество Тогда
        Количество = ЭтотОбъект.Количество() - Начало + Количество;
    КонецЕсли;
    
    Возврат ЭтотОбъект.Пропустить(Начало).ВзятьНеБольше(Количество);
КонецФункции
Функция Обратить() Экспорт
    Коллекция = __Обратить(Коллекция);
    Возврат ЭтотОбъект;
КонецФункции
Функция Транспонировать() Экспорт
    Коллекция = __Транспонировать(Коллекция);
    Возврат ЭтотОбъект;
КонецФункции
Функция Сортировать(Знач Направление=Неопределено) Экспорт
    Если Неопределено = Направление Тогда
        Направление = НаправлениеСортировки.Возр;
    КонецЕсли;
    
    мСписокЗнч = Новый СписокЗначений;
    мСписокЗнч.ЗагрузитьЗначения(Коллекция);
    мСписокЗнч.СортироватьПоЗначению(Направление);
    
    Коллекция = мСписокЗнч.ВыгрузитьЗначения();
    
    Возврат ЭтотОбъект;
КонецФункции
Функция Перемешать() Экспорт
    НоваяКоллекция = Новый Массив;
    ГСЧ = Новый ГенераторСлучайныхЧисел;
    
    Копия = ЭтотОбъект.Клонировать();
    
    Для Сч=1 По ЭтотОбъект.Количество() Цикл
        Индекс = ГСЧ.СлучайноеЧисло(0, Копия.ВГраница());
        НоваяКоллекция.Добавить(Копия.Получить(Индекс));
        Копия.Удалить(Индекс);
    КонецЦикла;
    
    Коллекция = НоваяКоллекция;
    
    Возврат ЭтотОбъект;
КонецФункции

Функция ВГраница() Экспорт
    Возврат Коллекция.ВГраница();
КонецФункции
Функция Количество() Экспорт
    Возврат Коллекция.Количество();
КонецФункции
Функция Вставить(Знач Индекс, Знач Значение) Экспорт
    Коллекция.Вставить(Индекс, Значение);
    Возврат ЭтотОбъект;
КонецФункции
Функция Добавить(Знач Значение) Экспорт
    Коллекция.Добавить(Значение);
    Возврат ЭтотОбъект;
КонецФункции
Функция _Найти(Знач Значение) Экспорт
    Возврат Коллекция.Найти(Значение);
КонецФункции
Функция Очистить() Экспорт
    Коллекция.Очистить();
    Возврат ЭтотОбъект;
КонецФункции
Функция Получить(Индекс) Экспорт
    Возврат Коллекция.Получить(Индекс);
КонецФункции
Функция Удалить(Индекс) Экспорт
    Коллекция.Удалить(Индекс);
    Возврат ЭтотОбъект;
КонецФункции
Функция Установить(Индекс, Знач Значение) Экспорт
    Коллекция.Установить(Индекс, Значение);
    Возврат ЭтотОбъект;
КонецФункции

Функция Пустой() Экспорт
    Возврат 0 = ЭтотОбъект.Количество();
КонецФункции
Функция Содержит(Знач Значение) Экспорт
    Возврат НЕ Неопределено = ЭтотОбъект._Найти(Значение);
КонецФункции
Функция Первый() Экспорт
    Если ЭтотОбъект.Пустой() Тогда
        Возврат Неопределено;
    КонецЕсли;
    Возврат ЭтотОбъект.Получить(0);
КонецФункции
Функция Последний() Экспорт
    Если ЭтотОбъект.Пустой() Тогда
        Возврат Неопределено;
    КонецЕсли;
    Возврат ЭтотОбъект.Получить(ЭтотОбъект.ВГраница());
КонецФункции
Функция СнятьПервый() Экспорт
    Если ЭтотОбъект.Пустой() Тогда
        Возврат Неопределено;
    КонецЕсли;
    Значение = ЭтотОбъект.Получить(0);
    ЭтотОбъект.Удалить(0);
    Возврат Значение;
КонецФункции
Функция СнятьПоследний() Экспорт
    Если ЭтотОбъект.Пустой() Тогда
        Возврат Неопределено;
    КонецЕсли;
    Индекс = ЭтотОбъект.ВГраница();
    Значение = ЭтотОбъект.Получить(Индекс);
    ЭтотОбъект.Удалить(Индекс);
    Возврат Значение;
КонецФункции

Функция Дополнить(Источник, ТолькоУникальныеЗначения=Ложь) Экспорт
    ОбщегоНазначенияКлиентСервер.ДополнитьМассив(Коллекция, ЗагрузитьКоллекцию(Источник), ТолькоУникальныеЗначения);
    Возврат ЭтотОбъект;
КонецФункции
Функция ТолькоУникальные() Экспорт
    Коллекция = ОбщегоНазначенияКлиентСервер.СвернутьМассив(Коллекция);
    Возврат ЭтотОбъект;
КонецФункции
Функция РазностьС(ВычитаемаяКоллекция) Экспорт
    НоваяКоллекция = ОбщегоНазначенияКлиентСервер.РазностьМассивов(Коллекция, ЗагрузитьКоллекцию(ВычитаемаяКоллекция));
    Возврат ЭтотОбъект.СоздатьНовый().ВзятьИз(НоваяКоллекция);
КонецФункции
Функция УдалитьЗначение(Знач _Значение) Экспорт
    Индекс = ЭтотОбъект._Найти(_Значение);
    Если Индекс <> Неопределено Тогда
		ЭтотОбъект.Удалить(Индекс);
	КонецЕсли;
    Возврат ЭтотОбъект;
КонецФункции
Функция УдалитьВсеВхождения(Знач _Значение) Экспорт
    ОбщегоНазначенияКлиентСервер.УдалитьВсеВхожденияЗначенияИзМассива(Коллекция, _Значение);
    Возврат ЭтотОбъект;
КонецФункции
Функция УдалитьВсеВхожденияТипа(Знач Тип) Экспорт
    ОбщегоНазначенияКлиентСервер.УдалитьВсеВхожденияТипаИзМассива(Коллекция, Тип);
    Возврат ЭтотОбъект;
КонецФункции

Функция СделатьПлоским() Экспорт
    КоллекцияРезультат = Новый Массив;
    
    Очередь = Новый Массив;
    Очередь.Добавить(Коллекция);
    Пока Очередь.Количество() > 0 Цикл
        Следующий = 0;
        ТекЭлемент = Очередь.Получить(Следующий);
        Очередь.Удалить(Следующий);
        
        ЭтоКоллекция = Ложь;
        Если ТипЗнч(ЭтотОбъект) = ТипЗнч(ТекЭлемент) Тогда
            ТекЭлемент = ТекЭлемент.Собрать();
            ЭтоКоллекция = Истина;
        ИначеЕсли __ЭтоКоллекция(ТекЭлемент) Тогда
            ЭтоКоллекция = Истина;
        КонецЕсли;
        
        Если ЭтоКоллекция Тогда
            Для Каждого НовЭлемент Из ТекЭлемент Цикл
                Очередь.Добавить(НовЭлемент);
            КонецЦикла;
        Иначе
            КоллекцияРезультат.Добавить(ТекЭлемент);
        КонецЕсли;
    КонецЦикла;
    
    Коллекция = КоллекцияРезультат;
    
    Возврат ЭтотОбъект;
КонецФункции

Функция СброситьПозицию() Экспорт
    ТекИндекс = 0;
    ИтерацияНачата = Неопределено;
КонецФункции
Функция Следующий() Экспорт
    Если ЭтотОбъект.Пустой() Тогда
        Возврат Ложь;
    КонецЕсли;
    
    Если Неопределено = ТекИндекс Тогда
        ЭтотОбъект.СброситьПозицию()
    КонецЕсли;
    
    Если Неопределено = ИтерацияНачата Тогда
        ИтерацияНачата = Истина;
        Возврат ТекИндекс < ЭтотОбъект.ВГраница();
    КонецЕсли;
    
    Если ТекИндекс + 1 > ЭтотОбъект.ВГраница() Тогда
        Возврат Ложь;
    КонецЕсли;
    
    ТекИндекс = 1 + ТекИндекс;
    Возврат Истина;
КонецФункции
Функция ТекущийИндекс() Экспорт
    Если Неопределено = ТекИндекс Тогда
        ЭтотОбъект.СброситьПозицию()
    КонецЕсли;
    Возврат ТекИндекс;
КонецФункции
Функция ТекущийЭлемент() Экспорт
    Если НЕ ЭтотОбъект.ИндексКорректен() Тогда
        Возврат Неопределено;
    КонецЕсли;
    
    Возврат ЭтотОбъект.Получить(ЭтотОбъект.ТекущийИндекс());
КонецФункции
Функция СледующийЭлемент() Экспорт
    Если НЕ ЭтотОбъект.Следующий() Тогда
        Возврат Неопределено;
    КонецЕсли;
    
    Возврат ЭтотОбъект.ТекущийЭлемент();
КонецФункции
Функция УстановитьИндекс(_Индекс) Экспорт
    ИтерацияНачата = Истина;
    ТекИндекс = _Индекс;
    Возврат ЭтотОбъект;
КонецФункции
Функция Продвинуть(НаСколько=1) Экспорт
    ИтерацияНачата = Истина;
    ЭтотОбъект.УстановитьИндекс(ЭтотОбъект.ТекущийИндекс() + НаСколько);
    Возврат ЭтотОбъект;
КонецФункции
Функция ИндексКорректен() Экспорт
    Возврат ЭтотОбъект.ТекущийИндекс() <= ЭтотОбъект.ВГраница() И 0 <= ЭтотОбъект.ТекущийИндекс();
КонецФункции

Функция Максимум() Экспорт
    Результат = ЭтотОбъект.Первый();
    Результат = ЭтотОбъект.Свернуть("Результат = Макс(Результат,Элемент)", Результат);
    Возврат Результат;
КонецФункции
Функция Минимум() Экспорт
    Результат = ЭтотОбъект.Первый();
    Результат = ЭтотОбъект.Свернуть("Результат = Мин(Результат,Элемент)", Результат);
    Возврат Результат;
КонецФункции
Функция Сумма() Экспорт
    Результат = 0;
    Результат = ЭтотОбъект.Свернуть("Результат = Результат + Элемент", Результат);
    Возврат Результат;
КонецФункции
Функция Среднее() Экспорт
    Результат = ЭтотОбъект.Сумма() / ЭтотОбъект.Количество();
    Возврат Результат;
КонецФункции
Функция Медиана() Экспорт
    Результат = ЭтотОбъект.Первый();
    
    мСорт = ЭтотОбъект.Клонировать().Сортировать();
    Если 0 < мСорт.Количество() % 2 Тогда
        Возврат мСорт.Получить(мСорт.ВГраница() / 2);
    КонецЕсли;
    
    Индекс1 = Окр(мСорт.ВГраница() / 2, 0, РежимОкругления.Окр15как10);
    Индекс2 = Окр(мСорт.ВГраница() / 2, 0, РежимОкругления.Окр15как20);
    
    Если Индекс1 <= мСорт.ВГраница() И Индекс2 <= мСорт.ВГраница() Тогда
        Значение1 = мСорт.Получить(Индекс1);
        Значение2 = мСорт.Получить(Индекс2);
        Если Тип("Число") = ТипЗнч(Значение1) Тогда
            Результат = (Значение1 + Значение2) / 2;
        Иначе
            Результат = Значение1;
        КонецЕсли;
    КонецЕсли;
    
    Возврат Результат;
КонецФункции
