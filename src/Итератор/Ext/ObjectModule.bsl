Перем Коллекция;
Перем Контекст;
Перем ТекИндекс;
Перем ИтерацияНачата;
Перем ОтключитьБезопасныйРежим;

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
    КонецЕсли;
    
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

Функция ЭтоИтератор(Значение)
    Результат = Ложь;
    Попытка
        Результат = "Итератор" = Значение.Метаданные().Синоним;
    Исключение
        ;
    КонецПопытки;
    Возврат Результат;
КонецФункции
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
    ИначеЕсли ЭтоИтератор(_Значение) Тогда
        Результат = _Значение.Собрать();
    ИначеЕсли __ЭтоКоллекция(_Значение) Тогда
        Результат = Новый Массив;
        Для Каждого ТекСтр Из _Значение Цикл
            Результат.Добавить(ТекСтр);
        КонецЦикла;
    ИначеЕсли Неопределено = _Значение Тогда
        Результат = Неопределено;
    Иначе
        ОбщегоНазначенияКлиентСервер.ЗначениеВМассиве(_Значение);
    КонецЕсли;
    
    Возврат Результат;
КонецФункции

Функция СоздатьНовый() Экспорт
    Если Истина = ОтключитьБезопасныйРежим Тогда
        ОЗООД = Новый ОписаниеЗащитыОтОпасныхДействий;
        ОЗООД.ПредупреждатьОбОпасныхДействиях = Ложь;
        Возврат ВнешниеОбработки.Создать(ЭтотОбъект.ИспользуемоеИмяФайла, Ложь, ОЗООД).ОтклБезопасныйРежим();
    КонецЕсли;
    
    Возврат ВнешниеОбработки.Создать(ЭтотОбъект.ИспользуемоеИмяФайла);
КонецФункции
Функция Клонировать() Экспорт
    Клон = ЭтотОбъект.СоздатьНовый();
    
    Если НЕ Неопределено = Коллекция Тогда
        НоваяКоллекция = Новый ФиксированныйМассив(Коллекция);
        НоваяКоллекция = Новый Массив(НоваяКоллекция);
        Клон.ВзятьИз(НоваяКоллекция);
    КонецЕсли;
    
    Возврат Клон;
КонецФункции

Функция ОтклБезопасныйРежим() Экспорт
    ОтключитьБезопасныйРежим = Истина;
    Возврат ЭтотОбъект;
КонецФункции

Функция Начать() Экспорт
    Коллекция = Новый Массив;
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция НачатьСРазмером(Знач Размер) Экспорт
    ЭтотОбъект.Начать();
    Если 0 < Размер Тогда
        ЭтотОбъект.Вставить(Размер - 1, Неопределено);
    КонецЕсли;
    Возврат ЭтотОбъект;
КонецФункции
Функция НачатьС(_Значение) Экспорт
    Возврат ЭтотОбъект.Начать().Добавить(_Значение);
КонецФункции
Функция ВзятьИз(_Значение) Экспорт
    Коллекция = ЗагрузитьКоллекцию(_Значение);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция РазделитьСтроку(Знач Стр, Знач Разделитель, Знач ВключатьПустые=Ложь) Экспорт
    Коллекция = СтрРазделить(Стр, Разделитель, ВключатьПустые);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция ПоДиапазону(Число_С, Число_По) Экспорт
    Коллекция = __МассивПоДиапазонуЧисел(Число_С, Число_По);
    ЭтотОбъект.СброситьПозицию();
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
Функция СобратьФиксированный() Экспорт
    Если Неопределено = Коллекция Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Возврат Новый ФиксированныйМассив(ЭтотОбъект.Собрать());
КонецФункции
Функция СобратьСтроку(Знач Разделитель="") Экспорт
    Если Неопределено = Коллекция Тогда
        Коллекция = Новый Массив;
    КонецЕсли;
    Возврат СтрСоединить(Коллекция, Разделитель);
КонецФункции
Функция Контекст() Экспорт
    Возврат Контекст;
КонецФункции

Функция Карта(Знач Код) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция = __Мап(Код, Коллекция, Контекст);
    Возврат ЭтотОбъект;
КонецФункции
Функция Фильтр(Знач Код) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция = __Фильтр(Код, Коллекция, Контекст);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция Свернуть(Знач Код, Знач Результат = Неопределено) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Возврат __Свернуть(Код, Коллекция, Результат, Контекст);
КонецФункции
Функция ВзятьНеБольше(Знач Количество) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция = __ВзятьНеБольше(Коллекция, Количество);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция Первые(Знач Количество) Экспорт
    Возврат ЭтотОбъект.ВзятьНеБольше(Количество);
КонецФункции
Функция Пропустить(Знач Количество) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция = __Пропустить(Коллекция, Количество);
    ЭтотОбъект.СброситьПозицию();
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
Функция Хвост(Знач Количество) Экспорт
    Возврат ЭтотОбъект.Срез(ЭтотОбъект.Количество() - Количество, Количество);
КонецФункции
Функция Последние(Знач Количество) Экспорт
    Возврат ЭтотОбъект.Хвост(Количество);
КонецФункции
Функция Обратить() Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция = __Обратить(Коллекция);
    Возврат ЭтотОбъект;
КонецФункции
Функция Транспонировать() Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция = __Транспонировать(Коллекция);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция Сортировать(Знач Направление=Неопределено) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
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
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    НоваяКоллекция = Новый Массив;
    ГСЧ = Новый ГенераторСлучайныхЧисел;
    
    Копия = ЭтотОбъект.Клонировать();
    
    Для Сч = 1 По ЭтотОбъект.Количество() Цикл
        Индекс = ГСЧ.СлучайноеЧисло(0, Копия.ВГраница());
        НоваяКоллекция.Добавить(Копия.Получить(Индекс));
        Копия.Удалить(Индекс);
    КонецЦикла;
    
    Коллекция = НоваяКоллекция;
    
    Возврат ЭтотОбъект;
КонецФункции

Функция ВГраница() Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        Возврат 0;
    КонецЕсли;
    Возврат Коллекция.ВГраница();
КонецФункции
Функция Количество() Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        Возврат 0;
    КонецЕсли;
    Возврат Коллекция.Количество();
КонецФункции
Функция Вставить(Знач Индекс, Знач Значение) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция.Вставить(Индекс, Значение);
    Возврат ЭтотОбъект;
КонецФункции
Функция Добавить(Знач Значение) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция.Добавить(Значение);
    Возврат ЭтотОбъект;
КонецФункции
Функция _Найти(Знач Значение) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Возврат Коллекция.Найти(Значение);
КонецФункции
Функция Очистить() Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция.Очистить();
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция Получить(Индекс) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Возврат Коллекция.Получить(Индекс);
КонецФункции
Функция Удалить(Индекс) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция.Удалить(Индекс);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция Установить(Индекс, Знач Значение) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
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
    ЭтотОбъект.СброситьПозицию();
    Возврат Значение;
КонецФункции
Функция СнятьПоследний() Экспорт
    Если ЭтотОбъект.Пустой() Тогда
        Возврат Неопределено;
    КонецЕсли;
    Индекс = ЭтотОбъект.ВГраница();
    Значение = ЭтотОбъект.Получить(Индекс);
    ЭтотОбъект.Удалить(Индекс);
    ЭтотОбъект.СброситьПозицию();
    Возврат Значение;
КонецФункции

Функция Дополнить(Источник, ТолькоУникальныеЗначения=Ложь) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    ОбщегоНазначенияКлиентСервер.ДополнитьМассив(Коллекция, ЗагрузитьКоллекцию(Источник), ТолькоУникальныеЗначения);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция ТолькоУникальные() Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    Коллекция = ОбщегоНазначенияКлиентСервер.СвернутьМассив(Коллекция);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция РазностьС(ВычитаемаяКоллекция) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    НоваяКоллекция = ОбщегоНазначенияКлиентСервер.РазностьМассивов(Коллекция, ЗагрузитьКоллекцию(ВычитаемаяКоллекция));
    Возврат ЭтотОбъект.СоздатьНовый().ВзятьИз(НоваяКоллекция);
КонецФункции
Функция УдалитьЗначение(Знач _Значение) Экспорт
    Индекс = ЭтотОбъект._Найти(_Значение);
    Если Индекс <> Неопределено Тогда
		ЭтотОбъект.Удалить(Индекс);
    КонецЕсли;
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция УдалитьВсеВхождения(Знач _Значение) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    ОбщегоНазначенияКлиентСервер.УдалитьВсеВхожденияЗначенияИзМассива(Коллекция, _Значение);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции
Функция УдалитьВсеВхожденияТипа(Знач Тип) Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
    ОбщегоНазначенияКлиентСервер.УдалитьВсеВхожденияТипаИзМассива(Коллекция, Тип);
    ЭтотОбъект.СброситьПозицию();
    Возврат ЭтотОбъект;
КонецФункции

Функция СделатьПлоским() Экспорт
    Если НЕ Тип("Массив") = ТипЗнч(Коллекция) Тогда
        ЭтотОбъект.Начать();
    КонецЕсли;
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
    Возврат ЭтотОбъект;
КонецФункции
Функция Следующий() Экспорт
    Если ЭтотОбъект.Пустой() Тогда
        Возврат Ложь;
    КонецЕсли;
    
    Если Неопределено = ТекИндекс Тогда
        ЭтотОбъект.СброситьПозицию();
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
        ЭтотОбъект.СброситьПозицию();
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
Функция Произведение() Экспорт
    Результат = 1;
    Результат = ЭтотОбъект.Свернуть("Результат = Результат * Элемент", Результат);
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

Функция КакСтроки(Знач Формат="") Экспорт
    НоваяКоллекция = Новый Массив;
    Для Каждого ТекЭлемент Из Коллекция Цикл
        НоваяКоллекция.Добавить(Формат(ТекЭлемент, Формат));
    КонецЦикла;
    Коллекция = НоваяКоллекция;
    Возврат ЭтотОбъект;
КонецФункции
Функция КакЧисла() Экспорт
    НоваяКоллекция = Новый Массив;
    Для Каждого ТекЭлемент Из Коллекция Цикл
        НовоеЗначение = 0;
        Если ЗначениеЗаполнено(ТекЭлемент) Тогда
            НовоеЗначение = Число(ТекЭлемент);
        КонецЕсли;
        НоваяКоллекция.Добавить(НовоеЗначение);
    КонецЦикла;
    Коллекция = НоваяКоллекция;
    Возврат ЭтотОбъект;
КонецФункции
Функция КакДаты() Экспорт
    НоваяКоллекция = Новый Массив;
    Для Каждого ТекЭлемент Из Коллекция Цикл
        НовоеЗначение = '00010101';
        Если ЗначениеЗаполнено(ТекЭлемент) Тогда
            НовоеЗначение = Дата(ТекЭлемент);
        КонецЕсли;
        НоваяКоллекция.Добавить(НовоеЗначение);
    КонецЦикла;
    Коллекция = НоваяКоллекция;
    Возврат ЭтотОбъект;
КонецФункции
Функция КакБулево() Экспорт
    НоваяКоллекция = Новый Массив;
    Для Каждого ТекЭлемент Из Коллекция Цикл
        НовоеЗначение = Ложь;
        Если ЗначениеЗаполнено(ТекЭлемент) Тогда
            НовоеЗначение = Булево(ТекЭлемент);
        КонецЕсли;
        НоваяКоллекция.Добавить(НовоеЗначение);
    КонецЦикла;
    Коллекция = НоваяКоллекция;
    Возврат ЭтотОбъект;
КонецФункции

Функция ВерноВсе() Экспорт
    Если ЭтотОбъект.Пустой() Тогда
        Возврат Ложь;
    КонецЕсли;
    
    Результат = ЭтотОбъект.Свернуть("Результат = Результат И Элемент", Истина);
    Возврат Результат;
КонецФункции
Функция ВерноЛюбое() Экспорт
    Результат = ЭтотОбъект.Свернуть("Результат = Результат ИЛИ Элемент", Ложь);
    Возврат Результат;
КонецФункции
Функция ВерноТолькоОдно() Экспорт
    Результат = 1 = ЭтотОбъект.Клонировать().Фильтр("Условие = Элемент").Количество();
    Возврат Результат;
КонецФункции

Функция Пронумеровать(Знач ПервыйНомер=0) Экспорт
    Если ЭтотОбъект.Пустой() Тогда
        Возврат ЭтотОбъект;
    КонецЕсли;
    
    // создание пары Ключ => Значение
    Набор = Новый Соответствие;
    КлючиПоПорядку = Новый Массив;
    
    ЭтотОбъект.СброситьПозицию();
    Счетчик = ПервыйНомер;
    Пока ЭтотОбъект.Следующий() Цикл
        Набор.Вставить(Счетчик, ЭтотОбъект.ТекущийЭлемент());
        КлючиПоПорядку.Добавить(Счетчик);
        
        Счетчик = 1 + Счетчик;
    КонецЦикла;
    
    // заполнение новой коллекции
    ЭтотОбъект.НачатьСРазмером(КлючиПоПорядку.Количество());
    Для Каждого ТекПара Из Набор Цикл
        Индекс = КлючиПоПорядку.Найти(ТекПара.Ключ);
        ЭтотОбъект.Установить(Индекс, ТекПара);
    КонецЦикла;
    
    Возврат ЭтотОбъект;
КонецФункции
