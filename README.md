# avs_idz3
Здравствуйте, дорогие проверяющие! 

Это ИДЗ №3 по АВС студента БПИ215 Колпакова Егора Евгеньевича. 

Мой вариант 6 представлен ниже:

![v6](https://github.com/kolpakovee/avs_idz3/blob/main/v6.png)

---
**Формат ввода:**
- Вводится строка, содержащая n (n <= 1 000 000) символов только из первой половины ASCII-таблицы (коды в диапазоне 0–127), затем НЕОБХОДИМО нажать ctrl + D! Так обозначается конец ввода. 
---
**Формат вывода.**
- Для каждого отображаемого (ASCII-код >= 32) символа из вводимой строки выводится число k, которое показывает сколько раз этот символ встречался в строке. Затем выводится число m - кол-во различный отображаемых символов в строке. Например для строки "Egor" вывод будет:
```
E => 1
g => 1
o => 1
r => 1
4
```
---
## 4 балла
![4_1](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/4_1.png)
 - В проекте это файл main.c
---
![4_2](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/4_2.png)

- Компиляция без отладочных опций:

![compilation1](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/compilation1.png)

- После компиляции создался файл first.s, комментарии написаны в нём
---

![4_3](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/4_3.png)

- Использованы аргументы командой строки и ручное редактирование, получился файл second.s

![compilation2](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/compilation2.png)

---
![4_4](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/4_4.png)

- Программа скомпилирована и скомпонована без опций отладки
![compilation3](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/compilation3)

---
![4_5](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/4_5.png)

**Тесты**



---
![4_6](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/4_6.png)

- Отчёт сформирован.
---
## 5 баллов
![5_1](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/5_1.png)

- Функции с передачей данных через параметры использованы (файл part2.c)

```
double factorial(double x) {
    double i = 1;
    while (x > 0) {
        i *= x;
        --x;
    }
    return i;
}
```

---
![5_2](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/5_2.png)

- Локальные переменные использованы. Это можно увидеть в файле part1.c
```
double val;
double result = 0;
double next;
double a = 0;
```
---
![5_3](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/5_3.png)
-   В ассемблерную программу при вызове функции добавлены комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата. Это можно увидеть в файле second.s
---
![5_4](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/5_4.png)
-    В функциях для формальных параметров добавлены комментарии, описывающие связь между параметрами языка Си и регистрами (стеком). Это можно увидеть в фале second.s
---
![5_5](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/5_5.png)

- Информация добавлена в отчёт

## 6 баллов
![6_1](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/6_1.png)

- Произведёе рефакторинг программы, все изменения можно увидеть в файле optimized.s:
1) DWORD PTR -4[rbp] -> r12d
2) DWORD PTR -8[rbp] -> r13d
3) DWORD PTR -28[rbp] -> r14d
4) QWORD PTR -24[rbp] -> r15

 - Чтобы увидеть все изменения можно сравнить файлы second.s и optimized.s!

---
![6_2](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/6_2.png)
- Комментарии добавлены в файл optimized.s (внизу файла зафиксированы все произведённые замены).
---
![6_3](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/6_3.png)

---
![6_5](https://github.com/kolpakovee/avs_idz2/blob/main/6.png)
- Вес файла second.s - 3 837 Б.
- Вес файла optimized.s - 3 626 Б.
- Таким образом, размер программы, использующей регистры, меньше на 211 Б.
---
![6_4](https://github.com/kolpakovee/avs_idz1/blob/main/criteria/6_4.png)
- Информация добавлена в отчёт.

##7 баллов


##8 баллов
