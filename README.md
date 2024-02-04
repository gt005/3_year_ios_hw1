# Домашнее задание 1 по IOS разработке
## TODO List App

Я решил не просто переписать с туториала, а попытался сделать красиво. Сделал отдельную папку сервисов для работы с CoreData. То есть все CRUD работают через этот сервис и нет бизнес логики элементов списка в view.


### Возникшие проблемы(просто для интереса)
- Возникала ошибка `Context in environment is not connected to a persistent store coordinator: <NSManagedObjectContext: 0x600003909c70>`, что в туториале не было описано. Для этого я и создал Persistence.swift файл и прокинул `persistenceController.container.viewContext`
