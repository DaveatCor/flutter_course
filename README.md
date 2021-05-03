1. App Setup
    - Reinitailize apps
2. A Touch Of Boilerplate
    - Create some widget
3. Data fetching concern.
    - concept of Bloc
4. Solution Outline
    - concept of FutureBuilder
5. Futurebuilder In Action
    - add example function for future Builder
6. The stories provider
    - create bloc(folder, stories bloc and provider)
    - write code in stories_provider.dart
7. Bloc Design
    - design bloc 
    - add PublishSubject (Similar StreamController)
    + add Observable (Similar Stream)
        - Rxdart no longer needs a custom class to work
        - A recent Dart feature (Dart 2.6) to implement all of the Observable features directly on Stream
        - replace all Observale with stream.
    - add dispose ob instance PublishSubject

8. Exposing Bloc Getters
    - add fuction fetchTopId into stories bloc

9. Wiring Up The Stories Provider
    - implement stories bloc

10. Bloc Testing
    - add Widget function of Stream builder