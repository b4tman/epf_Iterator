Перем КонтекстЯдра;
Перем Ожидаем;
Перем Утверждения;
Перем СтроковыеУтилиты;

// { интерфейс тестирования

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	Ожидаем = КонтекстЯдра.Плагин("УтвержденияBDD");
	СтроковыеУтилиты = КонтекстЯдра.Плагин("СтроковыеУтилиты"); 
    
КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов) Экспорт
	
	НаборТестов.Добавить("ТестДолжен_ПроверитьСозданиеИтератора");
    НаборТестов.НачатьГруппу("Тесты итератора", Истина);
    
    НаборТестов.Добавить("Тест_СоздатьНовый");
    НаборТестов.Добавить("Тест_Клонировать");
    НаборТестов.Добавить("Тест_ОтклБезопасныйРежим");
    
    НаборТестов.Добавить("Тест_Начать");
    НаборТестов.Добавить("Тест_НачатьСРазмером");
    НаборТестов.Добавить("Тест_НачатьС");
    НаборТестов.Добавить("Тест_ВзятьИз");
    НаборТестов.Добавить("Тест_РазделитьСтроку");
    НаборТестов.Добавить("Тест_УстановитьКонтекст");
    
    НаборТестов.Добавить("Тест_Собрать");
    НаборТестов.Добавить("Тест_СобратьФиксированный");
    НаборТестов.Добавить("Тест_СобратьСтроку");
    НаборТестов.Добавить("Тест_Контекст");
    
    НаборТестов.Добавить("Тест_Карта");
    НаборТестов.Добавить("Тест_Фильтр");
    НаборТестов.Добавить("Тест_Свернуть");
    НаборТестов.Добавить("Тест_ВзятьНеБольше");
    НаборТестов.Добавить("Тест_Первые");
    НаборТестов.Добавить("Тест_Пропустить");
    НаборТестов.Добавить("Тест_Срез");
    НаборТестов.Добавить("Тест_Хвост");
    НаборТестов.Добавить("Тест_Последние");
    НаборТестов.Добавить("Тест_Обратить");
    НаборТестов.Добавить("Тест_Транспонировать");
    НаборТестов.Добавить("Тест_Сортировать");
    НаборТестов.Добавить("Тест_Перемешать");
    
    НаборТестов.Добавить("Тест_ВГраница");
    НаборТестов.Добавить("Тест_Количество");
    НаборТестов.Добавить("Тест_Вставить");
    НаборТестов.Добавить("Тест_Добавить");
    НаборТестов.Добавить("Тест_Найти");
    НаборТестов.Добавить("Тест_Очистить");
    НаборТестов.Добавить("Тест_Получить");
    НаборТестов.Добавить("Тест_Удалить");
    НаборТестов.Добавить("Тест_Установить");
    
    НаборТестов.Добавить("Тест_Пустой");
    НаборТестов.Добавить("Тест_Содержит");
    НаборТестов.Добавить("Тест_Первый");
    НаборТестов.Добавить("Тест_Последний");
    НаборТестов.Добавить("Тест_СнятьПервый");
    НаборТестов.Добавить("Тест_СнятьПоследний");
    
    НаборТестов.Добавить("Тест_Дополнить");
    НаборТестов.Добавить("Тест_ТолькоУникальные");
    НаборТестов.Добавить("Тест_РазностьС");
    НаборТестов.Добавить("Тест_УдалитьЗначение");
    НаборТестов.Добавить("Тест_УдалитьВсеВхождения");
    НаборТестов.Добавить("Тест_УдалитьВсеВхожденияТипа");
    
    НаборТестов.Добавить("Тест_СделатьПлоским");
    
    НаборТестов.Добавить("Тест_СброситьПозицию");
    НаборТестов.Добавить("Тест_Следующий");
    НаборТестов.Добавить("Тест_ТекущийИндекс");
    НаборТестов.Добавить("Тест_ТекущийЭлемент");
    НаборТестов.Добавить("Тест_СледующийЭлемент");
    НаборТестов.Добавить("Тест_УстановитьИндекс");
    НаборТестов.Добавить("Тест_Продвинуть");
    НаборТестов.Добавить("Тест_ИндексКорректен");
    
    НаборТестов.Добавить("Тест_Максимум");
    НаборТестов.Добавить("Тест_Минимум");
    НаборТестов.Добавить("Тест_Сумма");
    НаборТестов.Добавить("Тест_Произведение");
    НаборТестов.Добавить("Тест_Среднее");
    НаборТестов.Добавить("Тест_Медиана");
    
    НаборТестов.Добавить("Тест_КакСтроки");
    НаборТестов.Добавить("Тест_КакЧисла");
    НаборТестов.Добавить("Тест_КакДаты");
    НаборТестов.Добавить("Тест_КакБулево");
    
    НаборТестов.Добавить("Тест_ВерноВсе");
    НаборТестов.Добавить("Тест_ВерноЛюбое");
    НаборТестов.Добавить("Тест_ВерноТолькоОдно");
    
    НаборТестов.Добавить("Тест_Пронумеровать");
    
КонецПроцедуры

Процедура ПередЗапускомТеста() Экспорт
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	
КонецПроцедуры

Функция ПутьКФайлу_ОбъектаТестирования()
    ПутьКЭтойОбработке = ЭтотОбъект["ИспользуемоеИмяФайла"];
    Файл_Этот = Новый Файл(ПутьКЭтойОбработке);
    Возврат СтрШаблон("%1%2Итератор.epf", Файл_Этот.Путь, ПолучитьРазделительПути());
КонецФункции

Функция Итератор()
    ОЗООД = Новый ОписаниеЗащитыОтОпасныхДействий;
    ОЗООД.ПредупреждатьОбОпасныхДействиях = Ложь;
    Возврат ВнешниеОбработки.Создать(ПутьКФайлу_ОбъектаТестирования(), Ложь, ОЗООД);
КонецФункции


// } интерфейс тестирования


// { блок юнит-тестов - сами тесты

Процедура ТестДолжен_ПроверитьСозданиеИтератора() Экспорт
    Ожидаем.Что(Итератор().Метаданные().Синоним).Равно("Итератор");
КонецПроцедуры

Процедура Тест_СоздатьНовый() Экспорт
    Итератор_1 = Итератор();
    Итератор_2 = Итератор_1.СоздатьНовый();
    Ожидаем.Что(Итератор_2).Не_().Равно(Итератор_1);
    Ожидаем.Что(Итератор_2.Метаданные().Синоним).Равно("Итератор");
КонецПроцедуры
Процедура Тест_Клонировать() Экспорт
    Итератор_1 = Итератор().ВзятьИз(СтрРазделить("1,2,3", ","));
    Итератор_2 = Итератор_1.Клонировать();
    Итератор_1.СнятьПоследний();
    
    Ожидаем.Что(Итератор_2).Не_().Равно(Итератор_1);
    Ожидаем.Что(Итератор_1.Количество()).Меньше(Итератор_2.Количество());
КонецПроцедуры

Процедура Тест_ОтклБезопасныйРежим() Экспорт
    Статус = "Не выполнено создание без откл.безопасного режима.";
    Попытка
        Итератор().СоздатьНовый().Клонировать().СоздатьНовый();
        Статус = "ОШИБКА! Выполнено создание без откл.безопасного режима!";
    Исключение
        ;
    КонецПопытки;
    Ожидаем.Что(Статус).Равно("Не выполнено создание без откл.безопасного режима.");
    
    // - - -
    
    Статус = "ОШИБКА! Не выполнено создание с откл.безопасного режима!";
    Попытка
        Итератор().ОтклБезопасныйРежим().СоздатьНовый().Клонировать().СоздатьНовый();
        Статус = "Успешно выполнено создание с откл.безопасного режима.";
    Исключение
        ;
    КонецПопытки;
    Ожидаем.Что(Статус).Равно("Успешно выполнено создание с откл.безопасного режима.");
КонецПроцедуры

Процедура Тест_Начать() Экспорт
    Итератор = Итератор().ВзятьИз(СтрРазделить("1,2,3", ","));
    Итератор.Начать();
    
    Ожидаем.Что(Итератор.Пустой()).ЭтоИстина();
КонецПроцедуры
Процедура Тест_НачатьСРазмером() Экспорт
    Ожидаем.Что(Итератор().НачатьСРазмером(42).Количество()).Равно(42);
    Ожидаем.Что(Итератор().НачатьСРазмером(1).Первый()).ЭтоНеопределено();
КонецПроцедуры
Процедура Тест_НачатьС() Экспорт
    Итератор = Итератор().НачатьС("тест");
    
    Ожидаем.Что(Итератор.Количество()).Равно(1);
КонецПроцедуры
Процедура Тест_ВзятьИз() Экспорт
    Итератор = Итератор().ВзятьИз(СтрРазделить("1,2,3", ","));
    
    Ожидаем.Что(Итератор.Количество()).Равно(3);
КонецПроцедуры
Процедура Тест_РазделитьСтроку() Экспорт
    Итератор = Итератор().РазделитьСтроку("1,2,3", ",");
    
    Ожидаем.Что(Итератор.Количество()).Равно(3);
КонецПроцедуры
Процедура Тест_УстановитьКонтекст() Экспорт
    Итератор = Итератор().УстановитьКонтекст(1234);
    
    Ожидаем.Что(Итератор.Контекст()).Равно(1234);
КонецПроцедуры

Процедура Тест_Собрать() Экспорт
    Итератор = Итератор().РазделитьСтроку("1,2,3", ",");
    Результат = Итератор.Собрать();
    
    Ожидаем.Что(Результат.Количество()).Равно(3);
    Ожидаем.Что(Результат).ИмеетТип(Тип("Массив"));
КонецПроцедуры
Процедура Тест_СобратьФиксированный() Экспорт
    Результат = Итератор()
    .ВзятьИз("123")
    .СобратьФиксированный();
    
    Ожидаем.Что(Результат.Количество()).Равно(3);
    Ожидаем.Что(Результат).ИмеетТип(Тип("ФиксированныйМассив"));
КонецПроцедуры
Процедура Тест_СобратьСтроку() Экспорт
    Итератор = Итератор().РазделитьСтроку("1,2,3", ",");
    Результат = Итератор.СобратьСтроку("/");
    
    Ожидаем.Что(Результат).Равно("1/2/3");
КонецПроцедуры
Процедура Тест_Контекст() Экспорт
    Итератор = Итератор().УстановитьКонтекст(4321);
    
    Ожидаем.Что(Итератор.Контекст()).Равно(4321);
КонецПроцедуры

Процедура Тест_Карта() Экспорт
    Результат = Итератор()
    .УстановитьКонтекст(10)
    .Начать()
    .Добавить(1)
    .Добавить(2)
    .Добавить(3)
    .Карта("Результат = Элемент + Элемент * _")
    .КакСтроки()
    .СобратьСтроку(" ");
    
    Ожидаем.Что(Результат).Равно("11 22 33");
КонецПроцедуры
Процедура Тест_Фильтр() Экспорт
    Результат = Итератор()
    .УстановитьКонтекст(2)
    .ПоДиапазону(1,10)
    .Фильтр("Условие = 0 = Элемент % _")
    .КакСтроки()
    .СобратьСтроку(" ");
    
    Ожидаем.Что(Результат).Равно("2 4 6 8 10");
КонецПроцедуры
Процедура Тест_Свернуть() Экспорт
    Результат = Итератор()
    .УстановитьКонтекст(10)
    .ПоДиапазону(1,3)
    .Свернуть("Результат = Результат + Элемент * _ ", 0);
    
    Ожидаем.Что(Результат).Равно(10 + 20 + 30);
КонецПроцедуры
Процедура Тест_ВзятьНеБольше() Экспорт
    Результат = Итератор()
    .ПоДиапазону(1,10)
    .КакСтроки()
    .ВзятьНеБольше(5)
    .СобратьСтроку(" ");
    
    Ожидаем.Что(Результат).Равно("1 2 3 4 5");
КонецПроцедуры
Процедура Тест_Первые() Экспорт
    Результат = Итератор()
    .ВзятьИз("123456789")
    .Первые(3)
    .СобратьСтроку("");
    
    Ожидаем.Что(Результат).Равно("123");
КонецПроцедуры
Процедура Тест_Пропустить() Экспорт
    Результат = Итератор()
    .ПоДиапазону(1,10)
    .КакСтроки()
    .Пропустить(5)
    .СобратьСтроку(" ");
    
    Ожидаем.Что(Результат).Равно("6 7 8 9 10");
КонецПроцедуры
Процедура Тест_Срез() Экспорт
    Результат = Итератор()
    .ПоДиапазону(1,10)
    .КакСтроки()
    .Срез(3, 4)
    .СобратьСтроку(" ");
    
    Ожидаем.Что(Результат).Равно("4 5 6 7");
КонецПроцедуры
Процедура Тест_Хвост() Экспорт
    Результат = Итератор()
    .ПоДиапазону(1,10)
    .КакСтроки()
    .Хвост(3)
    .СобратьСтроку(" ");
    
    Ожидаем.Что(Результат).Равно("8 9 10");
КонецПроцедуры
Процедура Тест_Последние() Экспорт
    Результат = Итератор()
    .ВзятьИз("1234567890")
    .КакСтроки()
    .Последние(4)
    .СобратьСтроку("-");
    
    Ожидаем.Что(Результат).Равно("7-8-9-0");
КонецПроцедуры
Процедура Тест_Обратить() Экспорт
    Результат = Итератор()
    .ПоДиапазону(1,3)
    .КакСтроки()
    .Обратить()
    .СобратьСтроку(" ");
    
    Ожидаем.Что(Результат).Равно("3 2 1");
КонецПроцедуры
Процедура Тест_Транспонировать() Экспорт
    Длина_А = 3;
    Длина_Б = 4;
    
    // формирование
    Итератор = Итератор().Начать();
    ПодИтератор = Итератор();
    Для Каждого Тек_А Из Итератор().ПоДиапазону(1, Длина_А).Собрать() Цикл
        ПодИтератор.Начать();
        Для Каждого Тек_Б Из Итератор().ПоДиапазону(1, Длина_Б).Обратить().Собрать() Цикл
            ПодИтератор.Добавить(Тек_А * 10 + Тек_Б);
        КонецЦикла;
        Итератор.Добавить(ПодИтератор.КакСтроки().Собрать());
    КонецЦикла;
    
    // проверка исходных
    Ожидаем.Что(Итератор().ВзятьИз(Итератор.Получить(0)).СобратьСтроку(" ")).Равно("14 13 12 11");
    Ожидаем.Что(Итератор().ВзятьИз(Итератор.Получить(1)).СобратьСтроку(" ")).Равно("24 23 22 21");
    Ожидаем.Что(Итератор().ВзятьИз(Итератор.Получить(2)).СобратьСтроку(" ")).Равно("34 33 32 31");
    
    // преобразование
    Результат = Итератор.Транспонировать();
    
    // проверка результата
    Ожидаем.Что(Итератор().ВзятьИз(Итератор.Получить(0)).СобратьСтроку(" ")).Равно("14 24 34");
    Ожидаем.Что(Итератор().ВзятьИз(Итератор.Получить(1)).СобратьСтроку(" ")).Равно("13 23 33");
    Ожидаем.Что(Итератор().ВзятьИз(Итератор.Получить(2)).СобратьСтроку(" ")).Равно("12 22 32");
    Ожидаем.Что(Итератор().ВзятьИз(Итератор.Получить(3)).СобратьСтроку(" ")).Равно("11 21 31");
КонецПроцедуры
Процедура Тест_Сортировать() Экспорт
    Результат = Итератор()
    .Начать()
    .Добавить(7)
    .Добавить(9)
    .Добавить(3)
    .Добавить(6)
    .Сортировать()
    .КакСтроки()
    .СобратьСтроку(" ");
    
    Ожидаем.Что(Результат).Равно("3 6 7 9");
КонецПроцедуры
Процедура Тест_Перемешать() Экспорт
    Итератор = Итератор()
    .Начать()
    .ПоДиапазону(1,300) // чем больше тем меньше вероятность случайного провала, но дольше время теста
    .КакСтроки();
    
    Оригинал = Итератор.СобратьСтроку(" ");
    мОригинал = Итератор.Собрать();
    Результат = Итератор.Перемешать().СобратьСтроку(" ");
    
    Ожидаем.Что(Итератор.Количество()).Равно(мОригинал.Количество());
    Ожидаем.Что(Результат).Не_().Равно(Оригинал);
КонецПроцедуры


Процедура Тест_ВГраница() Экспорт
    Ожидаем.Что(Итератор().НачатьС(123).Добавить(456).ВГраница()).Равно(1);
КонецПроцедуры
Процедура Тест_Количество() Экспорт
    Ожидаем.Что(Итератор().НачатьС(123).Добавить(456).Количество()).Равно(2);
КонецПроцедуры
Процедура Тест_Вставить() Экспорт
    Ожидаем.Что(Итератор().НачатьС(123).Вставить(0, 42).Получить(0)).Равно(42);
КонецПроцедуры
Процедура Тест_Добавить() Экспорт
    Ожидаем.Что(Итератор().Начать().Добавить(42).Получить(0)).Равно(42);
КонецПроцедуры
Процедура Тест_Найти() Экспорт
    Ожидаем.Что(Итератор().НачатьС(41).Добавить(42)._Найти(42)).Равно(1);
КонецПроцедуры
Процедура Тест_Очистить() Экспорт
    Ожидаем.Что(Итератор().НачатьС(42).Очистить().Количество()).Равно(0);
КонецПроцедуры
Процедура Тест_Получить() Экспорт
    Ожидаем.Что(Итератор().НачатьС(42).Получить(0)).Равно(42);
КонецПроцедуры
Процедура Тест_Удалить() Экспорт
    Ожидаем.Что(Итератор().НачатьС(42).Удалить(0).Количество()).Равно(0);
КонецПроцедуры
Процедура Тест_Установить() Экспорт
    Ожидаем.Что(Итератор().НачатьС(333).Установить(0, 42).Получить(0)).Равно(42);
КонецПроцедуры

Процедура Тест_Пустой() Экспорт
    Ожидаем.Что(Итератор().НачатьС(42).Пустой()).ЭтоЛожь();
    Ожидаем.Что(Итератор().Начать().Пустой()).ЭтоИстина();
КонецПроцедуры
Процедура Тест_Содержит() Экспорт
    Ожидаем.Что(Итератор().Начать().Содержит(42)).ЭтоЛожь();
    Ожидаем.Что(Итератор().НачатьС(42).Содержит(42)).ЭтоИстина();
КонецПроцедуры
Процедура Тест_Первый() Экспорт
    Ожидаем.Что(Итератор().НачатьС(42).Добавить(234).Первый()).Равно(42);
КонецПроцедуры
Процедура Тест_Последний() Экспорт
    Ожидаем.Что(Итератор().НачатьС(34636).Добавить(42).Последний()).Равно(42);
КонецПроцедуры
Процедура Тест_СнятьПервый() Экспорт
    Ит = Итератор().НачатьС(42).Добавить(874);
    Ожидаем.Что(Ит.СнятьПервый()).Равно(42);
    Ожидаем.Что(Ит.Количество()).Равно(1);
КонецПроцедуры
Процедура Тест_СнятьПоследний() Экспорт
    Ит = Итератор().НачатьС(235).Добавить(42);
    Ожидаем.Что(Ит.СнятьПоследний()).Равно(42);
    Ожидаем.Что(Ит.Количество()).Равно(1);
КонецПроцедуры

Процедура Тест_Дополнить() Экспорт
    Ожидаем.Что(Итератор().НачатьС(1).Добавить(2).Дополнить(Итератор().ВзятьИз("345")).СобратьСтроку("")).Равно("12345");
КонецПроцедуры
Процедура Тест_ТолькоУникальные() Экспорт
    Ожидаем.Что(Итератор().ВзятьИз("1231245563477218980").ТолькоУникальные().СобратьСтроку("")).Равно("1234567890");
КонецПроцедуры
Процедура Тест_РазностьС() Экспорт
    Ожидаем.Что(Итератор().ВзятьИз("123456").РазностьС(Итератор().ВзятьИз("4567890")).СобратьСтроку("")).Равно("123");
КонецПроцедуры
Процедура Тест_УдалитьЗначение() Экспорт
    Ожидаем.Что(Итератор().ВзятьИз("123123123").УдалитьЗначение("3").СобратьСтроку("")).Равно("12123123");
КонецПроцедуры
Процедура Тест_УдалитьВсеВхождения() Экспорт
    Ожидаем.Что(Итератор().ВзятьИз("123123123").УдалитьВсеВхождения("3").СобратьСтроку("")).Равно("121212");
КонецПроцедуры
Процедура Тест_УдалитьВсеВхожденияТипа() Экспорт
    Ожидаем.Что(Итератор().НачатьС(1).Добавить("2").Добавить(3).Добавить("4").УдалитьВсеВхожденияТипа(Тип("Строка")).СобратьСтроку("")).Равно("13");
КонецПроцедуры

Процедура Тест_СделатьПлоским() Экспорт
    Ожидаем.Что(Итератор()
    .Добавить(Итератор().ВзятьИз("123"))
    .Добавить(Итератор().НачатьС(1).Добавить(2).Добавить(3))
    .Добавить(Итератор().РазделитьСтроку("1,2,3", ","))
    .СделатьПлоским()
    .СобратьСтроку("")
    ).Равно("123123123");
КонецПроцедуры

Процедура Тест_СброситьПозицию() Экспорт
    Ит = Итератор().ВзятьИз("1234567890").КакЧисла();
    Ит.УстановитьИндекс(4);
    Ожидаем.Что(Ит.ТекущийЭлемент()).Равно(5);
    Ит.СброситьПозицию();
    Ожидаем.Что(Ит.ТекущийЭлемент()).Равно(1);
КонецПроцедуры
Процедура Тест_Следующий() Экспорт
    Ит = Итератор().ВзятьИз("123").КакЧисла();
    Ит.Следующий();
    Ит.Следующий();
    Ожидаем.Что(Ит.ТекущийЭлемент()).Равно(2);
КонецПроцедуры
Процедура Тест_ТекущийИндекс() Экспорт
    Ит = Итератор().ВзятьИз("1234");
    Ит.Следующий();
    Ит.Следующий();
    Ит.Следующий();
    Ожидаем.Что(Ит.ТекущийИндекс()).Равно(2);
КонецПроцедуры
Процедура Тест_ТекущийЭлемент() Экспорт
    Ит = Итератор().ВзятьИз("12").КакЧисла();
    Ит.Следующий();
    Ожидаем.Что(Ит.ТекущийЭлемент()).Равно(1);
КонецПроцедуры
Процедура Тест_СледующийЭлемент() Экспорт
    Ит = Итератор().ВзятьИз("12").КакЧисла();
    Ожидаем.Что(Ит.СледующийЭлемент()).Равно(1);
КонецПроцедуры
Процедура Тест_УстановитьИндекс() Экспорт
    Ит = Итератор().ВзятьИз("1234").КакЧисла();
    Ит.УстановитьИндекс(2);
    Ожидаем.Что(Ит.ТекущийЭлемент()).Равно(3);
КонецПроцедуры
Процедура Тест_Продвинуть() Экспорт
    Ит = Итератор().ВзятьИз("12345").КакЧисла();
    Ит.Продвинуть(3);
    Ожидаем.Что(Ит.ТекущийЭлемент()).Равно(4);
КонецПроцедуры
Процедура Тест_ИндексКорректен() Экспорт
    Ит = Итератор().ВзятьИз("12345").КакЧисла();
    Ит.УстановитьИндекс(9);
    Ожидаем.Что(Ит.ИндексКорректен()).ЭтоЛожь();
    Ит.СброситьПозицию();
    Ожидаем.Что(Ит.ИндексКорректен()).ЭтоИстина();
КонецПроцедуры

Процедура Тест_Максимум() Экспорт
    Ожидаем.Что(Итератор()
    .НачатьС(1)
    .Добавить(10)
    .Добавить(42)
    .Добавить(40)
    .Добавить(42)
    .Максимум()
    ).Равно(42);
КонецПроцедуры
Процедура Тест_Минимум() Экспорт
    Ожидаем.Что(Итератор()
    .НачатьС(42)
    .Добавить(50)
    .Добавить(42)
    .Добавить(60)
    .Добавить(50)
    .Минимум()
    ).Равно(42);
КонецПроцедуры
Процедура Тест_Сумма() Экспорт
    Ожидаем.Что(Итератор()
    .НачатьС(10)
    .Добавить(5)
    .Добавить(20)
    .Добавить(2)
    .Добавить(5)
    .Сумма()
    ).Равно(42);
КонецПроцедуры
Процедура Тест_Произведение() Экспорт
    Ожидаем.Что(Итератор()
    .ВзятьИз("237")
    .КакЧисла()
    .Произведение()
    ).Равно(42);
КонецПроцедуры
Процедура Тест_Среднее() Экспорт
    Ожидаем.Что(Итератор()
    .РазделитьСтроку("74,24,32,38", ",")
    .КакЧисла()
    .Среднее()
    ).Равно(42);
КонецПроцедуры
Процедура Тест_Медиана() Экспорт
    Ожидаем.Что(Итератор()
    .РазделитьСтроку("10,20,30,54,60,70", ",")
    .КакЧисла()
    .Медиана()
    ).Равно(42);
КонецПроцедуры

Процедура Тест_КакСтроки() Экспорт
    Ожидаем.Что(Итератор()
    .НачатьС(42)
    .КакСтроки()
    .Первый()
    ).Равно("42");
КонецПроцедуры
Процедура Тест_КакЧисла() Экспорт
    Ожидаем.Что(Итератор()
    .НачатьС("42")
    .КакЧисла()
    .Первый()
    ).Равно(42);
КонецПроцедуры
Процедура Тест_КакДаты() Экспорт
    Ожидаем.Что(Итератор()
    .НачатьС("01.09.2022 00:00:00")
    .КакДаты()
    .Первый()
    ).Равно(Дата(2022, 9, 1));
КонецПроцедуры
Процедура Тест_КакБулево() Экспорт
    Ожидаем.Что(Итератор()
    .НачатьС("")
    .КакБулево()
    .Первый()
    ).ЭтоЛожь();
КонецПроцедуры

Процедура Тест_ВерноВсе() Экспорт
    Ожидаем.Что(Итератор()
    .ВзятьИз("111111")
    .КакЧисла()
    .КакБулево()
    .ВерноВсе()
    ).ЭтоИстина();
    
    Ожидаем.Что(Итератор()
    .ВзятьИз("111101")
    .КакЧисла()
    .КакБулево()
    .ВерноВсе()
    ).ЭтоЛожь();
КонецПроцедуры
Процедура Тест_ВерноЛюбое() Экспорт
    Ожидаем.Что(Итератор()
    .ВзятьИз("010100")
    .КакЧисла()
    .КакБулево()
    .ВерноЛюбое()
    ).ЭтоИстина();
КонецПроцедуры
Процедура Тест_ВерноТолькоОдно() Экспорт
    Ожидаем.Что(Итератор()
    .ВзятьИз("010100")
    .КакЧисла()
    .КакБулево()
    .ВерноТолькоОдно()
    ).ЭтоЛожь();
    
    Ожидаем.Что(Итератор()
    .ВзятьИз("000100")
    .КакЧисла()
    .КакБулево()
    .ВерноТолькоОдно()
    ).ЭтоИстина();
КонецПроцедуры

Процедура Тест_Пронумеровать() Экспорт
    Ожидаем.Что(Итератор()
    .ВзятьИз("АБВГД")
    .Пронумеровать()
    .Карта("Результат = СтрШаблон(""%1.%2"", Элемент.Ключ, Элемент.Значение)")
    .СобратьСтроку(" ")
    ).Равно("0.А 1.Б 2.В 3.Г 4.Д");
    
    Ожидаем.Что(Итератор()
    .ВзятьИз("АБВГД")
    .Пронумеровать()
    .Пронумеровать()
    .Карта("Результат = СтрШаблон(""%1.%2.%3"", Элемент.Ключ, Элемент.Значение.Ключ, Элемент.Значение.Значение)")
    .СобратьСтроку(" ")
    ).Равно("0.0.А 1.1.Б 2.2.В 3.3.Г 4.4.Д");
КонецПроцедуры


