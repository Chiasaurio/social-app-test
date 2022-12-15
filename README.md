
Questions:

1: What are the build modes in flutter?
    - Are the different ways that we can compile our app, there are three diferent kind of build modes in Flutter, debug, profile and release

2: Which types of tests are commonly used with Flutter apps?
    - Unit test, Widget test and Integration test are the most common test on flutter.
        A unit test tests a single function, method, or class.
        A widget test (in other UI frameworks referred to as component test) tests a single widget.
        An integration test tests a complete app or a large part of an app.

3: What’s the difference between stateful and stateless widget?
    - As it names indicates a stateful Widget have a state that is mutable, this means the UI change with interaction of the user or by changes in some values, stateless by the other hand it doesn't have a state that can be changed.

4: What is BuildContext?
    - A handle to the location of a widget in the widget tree.

5: Which data structure does Flutter use to represent all of it’s widgets?
    - A tree.

6: Explain the BLoC pattern and what is it
    - BLoC stands for Bussines Logic Component, it establishes that the flow of the app its given by events and responses, a component triggers an event an the same or another component responds to the answers of that event.

7: What is null-safety?
    - It helps up to prevent errors related to null variables across the app.

8: What is the late modifier in Dart?
    - It means that a variable will be initialized later in the code.

9: Explain async and await
    - Keyword await allows to wait for a response or a method to finish before continuing to the next task, but for this we have to indicate to the app that it is an asynchronous operation with the keyword async

10: What is const in Dart, when can it be used?
    - It means constant, we can use it when we have widgets or values that we now don't change across the app.

11: What are Keys in Flutter? Explain the difference between them
    - Keys are identifiers for Widgets, Elements and SemanticsNodes, can be global and locals, Global Keys has to be unique across the entire app, Local Keys only have to be unique across the elements with the same parent.

12: What is navigator in Flutter? 
    - It's a widget that allows to navigate throught screens or pages, this screens are a set of widgets an are managed by Navigator as with a stack discipline.

13: When to use var and when to use final?
    - We use final when we don't need to change the value of a variable during his lifecycle,  and var when we need to.

14: What would happen if the BLoC package wasn’t used in conjunction with the Equatable package for state classes (extending state classes with Equatable)? Nudge if no answer: you updated state, but BLoC state class doesn’t extend Equatable, what’s the consequence on the UI? 
    - Could happen that the UI don't recognice the update, equatable allows to compare if two objects are the same, if we don't use it could happen that the UI be incapable of detect when the value of an state changed.

Got any other experience with reactive programming?
    - Maybe in java.

Got any other experience with state management libraries?
    - I have worked with GetX.

Explain SOLID principles 
    - Single Responsibility Principle: It states that a component should be responsible for a single responsability. 	
    
    - Open-Closed Principle: Establish that classes should be open for extension, but closed for changes, this means that we should be able to add new features in the software without the need of changing the existing source code.
    
    - Liskov Substitution Principle: Subclases should respect the logic of the superclases, this means we should be able to replace superclases with subclases withouth breaking the app.	
    
    - Interface Segregation Principle: We shouldn't be forced to implement methods that we don't need in a class. 	
    
    - Dependency Inversion Principle : It states that we should favor abstractions over implementations.

