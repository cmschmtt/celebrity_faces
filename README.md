# celebrity_faces
Проект сайта "на какую знаменитость ты похож". 

http://159.65.84.144/

#### Архитектура.
Состоит из трех сервисов.
1. Веб-морда. Страничка загрузки пользовательской картинки и страничка с результатами. Полученную картинку посылает на сервис эмбеддинга и получает эмбеддинг. Полученный эмбеддинг посылает сервису индекса и получает имя файла с фото самой похожей знаменитости, которое отображается на страничке с результатами. 
2. Сервис эмбеддинга. Принимает картинку через POST-запрос, выделяет лицо и делает необходимую предобработку для [facenet](https://github.com/davidsandberg/facenet) и считает эмбеддинг по предобученной модели facenet. Используются фото знаменитостей датасета [CelebA](http://mmlab.ie.cuhk.edu.hk/projects/CelebA.html)
3. Сервис индекса. Строит индекс по предварительно подсчитанным эмбеддингам для raw celebrities, принимает POST-запросы с векторами, возвращает имя картинки, соответствующей ближайшему вектору. Пока что в качестве индекса используется [Annoy](https://github.com/spotify/annoy)
4. Все сервисы запускаются в docker'ах через docker-compose.
Все сервисы написаны на Python/Flask.

#### Что изменилось с промежуточного дедлайна и что нужно доделать.
1. Написан на C++ идекс [Navigable Small World algorithm](https://publications.hse.ru/mirror/pubs/share/folder/x5p6h7thif/direct/128296059), который подключается через cython. Нужно пофиксить тип выдачи поиска соседей и заменить на него annoy. 
2. Добавлены тест accuracy для нейросети на датасете LFW.
<img src="https://latex.codecogs.com/gif.latex?Accuracy \geq 0.95  " /> 
3. Добавлены [тест accuracy](https://github.com/spotify/annoy/blob/master/test/accuracy_test.py) для индекса, сейчас только результаты для annoy. Когда индекс будет пофиксен, в этом тесте будет сравнение accuracy своего индекса и annoy.

