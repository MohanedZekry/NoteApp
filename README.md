# Note App
This is an example project to show what Clean Architecture would look like (in Flutter) 

<img src="https://img.shields.io/badge/Note%20App-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white">

| Layers       | Progress   |
| :---------   | :-------:  |
| Data         |    ✅     | 
| Domain       |    ✅     |
| Presentation |    ☑️     |

## Layers
 - Presentation Layer
 - Domain Layer
 - Data Layer
<p align="center">
<img src="images/clean_arch.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;"/>
</p>

## Why Clean Architecture?
Clean architecture helps us solve, or at least mitigate, these common problems with architecture:
* **Decisions are taken too early**, often at the beginning of a project, when we know the least about the problem that we have to solve
* **It's hard to change**, so when we discover new requirements we have to decide if we want to hack them in or go through an expensive and painful re-design. We all know which one usually wins. _The best architectures are the ones that allow us to defer commitment to a particular solution and let us change our mind_
* **It's centered around frameworks**. Frameworks are tools to be used, not architectures to be conformed to. Frameworks often require commitments from you, but they don’t commit to you. They can evolve in different directions, and then you’ll be stuck following their rules and quirks
* **It's centered around the database**. We often think about the database first, and then create a CRUD system around it. We end up using the database objects everywhere and treat everything in terms of tables, rows and columns
* **We focus on technical aspects** and when asked about our architecture we say things like “it’s servlets running in tomcat with an oracle db using spring”
* **It's hard to find things** which makes every change longer and more painful
* **Business logic is spread everywhere**, scattered across many layers, so when checking how something works our only option is to debug the whole codebase. Even worse, often it's duplicated in multiple places
* **Forces/Encourages slow, heavy tests**. Often our only choice for tests is to go through the GUI, either because the GUI has a lot of logic, or because the architecture doesn't allow us to do otherwise. This makes tests slow to run, heavy and brittle. It results in people not running them and the build beind broken often
* **Infrequent deploys** because it's hard to make changes without breaking existing functionalities. People resort to long-lived feature branches that only get integrated at the end and result in big releases, rather than small incremental ones

Clean architecture gives us all these benefits:
* **Effective testing strategy** that follows the [testing pyramid](http://martinfowler.com/bliki/TestPyramid.html) and gives us a fast and reliable build
* **Frameworks are isolated** in individual modules so that when (not if) we change our mind we only have to change one place, with the rest of the app not even knowing about it
* **Independent from Database**, which is treated just like any other data provider. Our app has real use cases rather than being a CRUD system
* **Screaming architecture** a.k.a. it screams its intended usage. When you look at the package structure you get a feel for what the application does rather than seeing technical details
* **All business logic is in a use case** so it's easy to find and it's not duplicated anywhere else
* **Hard to do the wrong thing** because modules enforce compilation dependencies. If you try to use something that you're not meant to, the app doesn't compile
* **We're always ready to deploy** by leaving the wiring up of the object for last or by using feature flags, so we get all the benefits of continuous integration (no need for feature branches)
* **Swarming on stories** so that different pairs can easily work on the same story at the same time to complete it quicker
* **Good monolith** with clear use cases that you can split in microservices later one, once you've learnt more about them

Of course, it comes at a cost:
* **Perceived duplication of code**. Entities might be represented differently when used in business logic, when dealing with the database and when presenting them in a json format. You might feel like you're duplicating code, but you're actually favouring _decoupling over DRY_
* **You need interesting business logic** to "justify" the structure. If all you do in your use case is a one-line method to read or save from a database, then maybe you can get away with something simpler.

## Tools & Libraries 
- cupertino_icons 
- Equatable
- Flutter_Bloc
- Formz
- Service Locator
- Dio
- http
- Dartz
- Intl
- Shared_preferences
- Provider
- Faker
