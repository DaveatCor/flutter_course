1. Testing with dart
2. A Few Import
4. Create table with sqlite
5. Issuing query
    - db.query(
        "Items",
        columns: null,
        where: "id = ?", => ? refer to whereArgs list
        whereArgs: [id]
    )

6. Multiple line, 
7. Issuing query,
8. Multiple Named Constructor
    - create named fromDb constructor
    - jsonDecode data
9. Massaging DB return Maps
    - get data from db and return object
    - create toMap and insrt data inside item_m
10. Turning class Instances to maps
    - jsonEncode data
    - complete turn data to db