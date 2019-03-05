﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"КликНаКартинку(Парам01)","КликНаКартинку","Затем клик на картинку ""ИмяКартинки""","Делает клик на картинке. Картинка ищется в каталоге проекта.","Прочее.SikuliX");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯРисуюСтрелкуОтДо(Парам01,Парам02,ТабПарам)","ЯРисуюСтрелкуОтДо","Затем я рисую стрелку от ""Vanessa_Automation"" до ""Запуск_сценариев""","Рисует стрелку от одной картинки до другой. Поиск картинок на экране делается с помощью SikuliX. Если первый параметр равен пустой сроке, тогда точкой ""от"" будет центр экрана. Дополнительные параметры задаются через таблицу Gherkin.","Прочее.SikuliX");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗапускаюSikuliXСервер()","ЯЗапускаюSikuliXСервер","И    я запускаю SikuliX сервер","Запускает SikuliX сервер.","Прочее.SikuliX");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯНажимаюХоткей(Парам01,Парам02)","ЯНажимаюХоткей","Дано я нажимаю хоткей ""ХотКей"" ""Модификатор""","Эмулирует нажатие хоткея с помощью SikuliX.","Прочее.SikuliX");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯНажимаюENTER()","ЯНажимаюENTER","Дано я нажимаю ENTER","Эмулирует нажатие клавиши ENTER с помощью SikuliX.","Прочее.SikuliX");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЖдуКартинкиВТечениеСекунд(Парам01,Парам02)","ЯЖдуКартинкиВТечениеСекунд","И я жду картинки ""ИмяКартинки"" в течение 20 секунд","Ожидает появления картинки на экране в течение нужного числа секунд.","Прочее.SikuliX");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОпределяюКоординатыКартинкиКак(Парам01,Парам02)","ЯОпределяюКоординатыКартинкиКак","И я определяю координаты картинки ""ИмяКартинки"" как ""ИмяПеременной""","Определяет коордианты картинки с помощью SikuliX и сохраняет структуру с координатами в переменную","Прочее.SikuliX");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
Функция ПереданныеПараметры(ТабПарам)
	Структура = Новый Структура;
	Для Каждого СтрокаТабПарам Из ТабПарам Цикл
		Попытка
			Структура.Вставить(СтрокаТабПарам.Кол1,СтрокаТабПарам.Кол2);
		Исключение
			Сообщить(ОписаниеОшибки());
		КонецПопытки;
	КонецЦикла;	 
	
	Возврат Структура;
КонецФункции	

&НаСервереБезКонтекста
Функция АбсолютыйЦвет(ИсходныйЦвет)
    ТабДок = Новый ТабличныйДокумент;
    ТабДок.Область("R1C1").ЦветФона = ИсходныйЦвет;
	ВременныйФАйл = ПолучитьИмяВременногоФайла("mxl");
    ТабДок.Записать(ВременныйФАйл, ТипФайлаТабличногоДокумента.MXL7); 
    ТабДок.Прочитать(ВременныйФАйл);
	УдалитьФайлы(ВременныйФАйл);
    АЦвет = ТабДок.Область("R1C1").ЦветФона;
    Возврат АЦвет;
КонецФункции	 

&НаКлиенте
Функция ЦветЧислом(Цвет)
	АбсолютныйЦвет = АбсолютыйЦвет(Цвет);
	Возврат АбсолютныйЦвет.Синий + 255*АбсолютныйЦвет.Зеленый + 255*255*АбсолютныйЦвет.Красный;
КонецФункции	 

&НаКлиенте
Функция Центр(Знач Точка1,Знач Точка2)
	Возврат Точка1 + Окр((Точка2-Точка1)/2);
КонецФункции	 

&НаКлиенте
Функция ПрочитатьФайлJson(ИмяФайла)
	ЧтениеJSON = Вычислить("Новый ЧтениеJSON");
	ЧтениеJSON.ОткрытьФайл(ИмяФайла);
	СтруктураПараметров = Вычислить("ПрочитатьJSON(ЧтениеJSON)");
	ЧтениеJSON.Закрыть();
	Возврат СтруктураПараметров; 
КонецФункции	 

&НаКлиенте
Функция ПолучитьФайлКартинки(ИмяФайла)
	Путь = Ванесса.Объект.КаталогПроекта;
	Если НЕ ЗначениеЗаполнено(Путь) Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не указано значение настройки Vanessa-automation: <КаталогПроекта>.");
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	СписокКаталогов = Новый СписокЗначений;
	СписокФайлов    = Новый СписокЗначений;
	Ванесса.НайтиФайлыКомандаСистемы(Путь, СписокКаталогов, СписокФайлов, Истина,ИмяФайла + ".png");
	Если СписокФайлов.Количество() = 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("В каталоге <%1> не найден файл <%2>.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",Путь);
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",ИмяФайла);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	Если СписокФайлов.Количество() > 1 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("В каталоге <%1> найдено больше одного файла <%2>: %3.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",Путь);
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",ИмяФайла);
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%3",СписокФайлов.Количество());
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	Возврат СписокФайлов[0].Значение; 
КонецФункции	 

&НаКлиенте
Процедура КоординатыТочкиИзТекста(X,Y,Rect,Стр)
	Если Стр = "СерединаПраво" Тогда
		X = Rect.X2;
		Y = Rect.Y1 + Окр((Rect.Y2-Rect.Y1)/2);
	ИначеЕсли Стр = "СерединаЛево" Тогда
		X = Rect.X1;
		Y = Rect.Y1 + Окр((Rect.Y2-Rect.Y1)/2);
	ИначеЕсли Стр = "СерединаВерх" Тогда
		X = Rect.X1 + Окр((Rect.X2-Rect.X1)/2);
		Y = Rect.Y1;
	ИначеЕсли Стр = "СерединаНиз" Тогда
		X = Rect.X1 + Окр((Rect.X2-Rect.X1)/2);
		Y = Rect.Y2;
	ИначеЕсли Стр = "Центр" Тогда
		X = Rect.X1 + Окр((Rect.X2-Rect.X1)/2);
		Y = Rect.Y1 + Окр((Rect.Y2-Rect.Y1)/2);
	КонецЕсли;	 
КонецПроцедуры 

&НаКлиенте
//Затем клик на картинку "Тестовый Элемент 2"
//@КликНаКартинку(Парам01)
Процедура КликНаКартинку(ИмяФайла) Экспорт
	Файл = ПолучитьФайлКартинки(ИмяФайла);
	ПутьКФайлу = СтрЗаменить(Файл.ПолноеИмя,"\","/");
	
	Рез = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\ClickOnPicture.sikuli --args """ + ПутьКФайлу + """" , -1, Истина);
	Если Рез <> 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не получилось сделать клик мышкой по картинке <%1>.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяФайла);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
//Затем я рисую стрелку от "Vanessa_Automation" до "Запуск_сценариев"
//@ЯРисуюСтрелкуОтДо(Парам01,Парам02)
Процедура ЯРисуюСтрелкуОтДо(КартинкаОт,КартинкаДо,ТабПарам) Экспорт
	ИмяФайлСтрелки = Ванесса.Объект.КаталогИнструментов + "/tools/VideoTools/Arrow.exe";
	Если НЕ Ванесса.ФайлСуществуетКомандаСистемы(ИмяФайлСтрелки) Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не найден файл <%1>");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяФайлСтрелки);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	Если ЗначениеЗаполнено(КартинкаОт) Тогда
		ФайлКартинкаОт = ПолучитьФайлКартинки(КартинкаОт);
		ПутьКФайлуКартинкаОт = СтрЗаменить(ФайлКартинкаОт.ПолноеИмя,"\","/");
		ИмяФайлаОтветаОт = ПолучитьИмяВременногоФайла("json");
		СтрокаКоманды = Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\GetPictureCoordinats.sikuli --args ""%1"" ""%2""";
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%1",ПутьКФайлуКартинкаОт);
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%2",ИмяФайлаОтветаОт);
		Рез = Ванесса.ВыполнитьSikuliСкрипт(СтрокаКоманды, -1, Истина);
		Если Рез <> 0 Тогда
			ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не получилось найти на экране картинку <%1>.");
			ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",КартинкаОт);
			ВызватьИсключение ТекстСообщения;
		КонецЕсли;	 
		ДанныеОт = ПрочитатьФайлJson(ИмяФайлаОтветаОт);
		ТочкаОткудаX = Центр(ДанныеОт.X1,ДанныеОт.X2);
		ТочкаОткудаY = Центр(ДанныеОт.Y1,ДанныеОт.Y2);
	Иначе	
		ИнформацияЭкранаКлиента = Вычислить("ПолучитьИнформациюЭкрановКлиента()[0]");
		Ширина = ИнформацияЭкранаКлиента.Ширина;
		Высота = ИнформацияЭкранаКлиента.Высота;
		
		ТочкаОткудаX = Окр(Ширина/2);
		ТочкаОткудаY = Окр(Высота/2);
		
		ДанныеОт = Новый Структура;
		ДанныеОт.Вставить("X1",ТочкаОткудаX);
		ДанныеОт.Вставить("X2",ТочкаОткудаX);
		ДанныеОт.Вставить("Y1",ТочкаОткудаY);
		ДанныеОт.Вставить("Y2",ТочкаОткудаY);
	КонецЕсли;	 
	
	ДанныеДо = Неопределено;
	Если Лев(КартинкаДо,1) = "$" Тогда
		Данные = Ванесса.ПолучитьЗначениеИзКонтекстаЕслиЭтоВозможно(КартинкаДо);
		Если ТипЗнч(Данные) = Тип("Структура") Тогда
			ДанныеДо = Данные;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Если ДанныеДо = Неопределено Тогда
		ФайлКартинкаДо = ПолучитьФайлКартинки(КартинкаДо);
		ПутьКФайлуКартинкаДо = СтрЗаменить(ФайлКартинкаДо.ПолноеИмя,"\","/");
		ИмяФайлаОтветаДо = ПолучитьИмяВременногоФайла("json");
		СтрокаКоманды = Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\GetPictureCoordinats.sikuli --args ""%1"" ""%2""";
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%1",ПутьКФайлуКартинкаДо);
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%2",ИмяФайлаОтветаДо);
		Рез = Ванесса.ВыполнитьSikuliСкрипт(СтрокаКоманды, -1, Истина);
		Если Рез <> 0 Тогда
			ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не получилось найти на экране картинку <%1>.");
			ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",КартинкаДо);
			ВызватьИсключение ТекстСообщения;
		КонецЕсли;	 
		ДанныеДо = ПрочитатьФайлJson(ИмяФайлаОтветаДо);
	КонецЕсли;	 
	
	ПереданныеПараметры = ПереданныеПараметры(ТабПарам);
	
	Цвет = WebЦвета.ЗеленыйЛес;
	Если ПереданныеПараметры.Свойство("Цвет") Тогда
		Попытка
			Цвет = WebЦвета[ПереданныеПараметры.Цвет];
		Исключение
			Сообщить(ОписаниеОшибки());
		КонецПопытки;
	КонецЕсли;	 
	АбсолютыйЦвет = АбсолютыйЦвет(Цвет);
	
	
	ТочкаКудаX   = Центр(ДанныеДо.X1,ДанныеДо.X2);
	ТочкаКудаY   = Центр(ДанныеДо.Y1,ДанныеДо.Y2);
	
	Если ПереданныеПараметры.Свойство("ТочкаОткуда") Тогда
		КоординатыТочкиИзТекста(ТочкаОткудаX,ТочкаОткудаY,ДанныеОт,ПереданныеПараметры.ТочкаОткуда);
	КонецЕсли;	 
	Если ПереданныеПараметры.Свойство("ТочкаКуда") Тогда
		КоординатыТочкиИзТекста(ТочкаКудаX,ТочкаКудаY,ДанныеДо,ПереданныеПараметры.ТочкаКуда);
	КонецЕсли;	 
	
	Длительность = "10000";
	Если ПереданныеПараметры.Свойство("Длительность") Тогда
		Длительность = ПереданныеПараметры.Длительность;
	КонецЕсли;	 
	
	
	СтрокаКоманды = ИмяФайлСтрелки + " %1 %2 %3 %4 %5 %6 %7 %8 %9";	
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%1",XMLСтрока(ТочкаОткудаX));
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%2",XMLСтрока(ТочкаОткудаY));
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%3",XMLСтрока(ТочкаКудаX));
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%4",XMLСтрока(ТочкаКудаY));
	Попытка
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%5",XMLСтрока(АбсолютыйЦвет.Красный));//R
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%6",XMLСтрока(АбсолютыйЦвет.Зеленый));//G
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%7",XMLСтрока(АбсолютыйЦвет.Синий));//B
	Исключение
		Сообщить(ОписаниеОшибки());
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%5",XMLСтрока(10));
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%6",XMLСтрока(10));
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%7",XMLСтрока(10));
	КонецПопытки;
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%8",XMLСтрока(Длительность));//длительность в мс
	СтопФайл = ПолучитьИмяВременногоФайла("txt");
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%9","stopfilename="+XMLСтрока(СтопФайл));
	Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(СтрокаКоманды,0);
КонецПроцедуры


&НаКлиенте
//И    я запускаю SikuliX сервер
//@ЯЗапускаюSikuliXСервер()
Процедура ЯЗапускаюSikuliXСервер() Экспорт
	Ванесса.ЗапуститьSikuliXСевер();
КонецПроцедуры


&НаКлиенте
//Дано я нажимаю хоткей "r" "win"
//@ЯНажимаюХоткей(Парам01,Парам02)
Процедура ЯНажимаюХоткей(ХотКей,Модификатор = "no") Экспорт
	СтрокаКоманды = Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\HotKey.sikuli --args ""%1"" ""%2""";
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%1",ХотКей);
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%2",Модификатор);
	Рез = Ванесса.ВыполнитьSikuliСкрипт(СтрокаКоманды, -1, Истина);
	Если Рез <> 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не получилось выполнить эмуляцию хоткея <%1> <%2>.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ХотКей);
		Если Модификатор = "no" Тогда
			ТекстСообщения = СтрЗаменить(ТекстСообщения," <%2>","");
		Иначе	
			ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",Модификатор);
		КонецЕсли;	 
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
//Дано я нажимаю ENTER
//@ЯНажимаюENTER()
Процедура ЯНажимаюENTER() Экспорт
	СтрокаКоманды = Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\TypeENTER.sikuli";
	Рез = Ванесса.ВыполнитьSikuliСкрипт(СтрокаКоманды, -1, Истина);
	Если Рез <> 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не получилось выполнить эмуляцию ENTER.");
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
КонецПроцедуры


&НаКлиенте
//И я жду картинки "ИмяКартинки" в течение 20 секунд
//@ЯЖдуКартинкиВТечениеСекунд(Парам01,Парам02)
Процедура ЯЖдуКартинкиВТечениеСекунд(ИмяКартикни,КолСек) Экспорт
	Файл = ПолучитьФайлКартинки(ИмяКартикни);
	ПутьКФайлу = СтрЗаменить(Файл.ПолноеИмя,"\","/");
	
	СтрокаКоманды = Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\WaitPict.sikuli --args ""%1"" ""%2""";
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%1",ПутьКФайлу);
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%2",XMLСтрока(КолСек));
	Рез = Ванесса.ВыполнитьSikuliСкрипт(СтрокаКоманды, -1, Истина);
	Если Рез <> 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не получилось дождаться картинки <%1> в течение <%2> секунд.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяКартикни);
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",КолСек);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
КонецПроцедуры


&НаКлиенте
//И я определяю координаты картинки "ИмяКартинки" как "ИмяПеременной"
//@ЯОпределяюКоординатыКартинкиКак(Парам01,Парам02)
Процедура ЯОпределяюКоординатыКартинкиКак(ИмяКартинки,ИмяПеременной) Экспорт
	ФайлКартинкаОт = ПолучитьФайлКартинки(ИмяКартинки);
	ПутьКФайлуКартинки = СтрЗаменить(ФайлКартинкаОт.ПолноеИмя,"\","/");
	ИмяФайлаОтвета = ПолучитьИмяВременногоФайла("json");
	СтрокаКоманды = Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\GetPictureCoordinats.sikuli --args ""%1"" ""%2""";
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%1",ПутьКФайлуКартинки);
	СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%2",ИмяФайлаОтвета);
	Рез = Ванесса.ВыполнитьSikuliСкрипт(СтрокаКоманды, -1, Истина);
	Если Рез <> 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не получилось найти на экране картинку <%1>.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяКартинки);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	Данные = ПрочитатьФайлJson(ИмяФайлаОтвета);
	Контекст.Вставить(ИмяПеременной,Данные);
КонецПроцедуры
