# All Contributors Software Architecture

## Introduction

This is a place where architectural diagrams of all the AC projects can be found.

It's currently focused on the _new world_ (revamped) projects so it may not accurately illustrate the current systems.
<!-- ref: https://github.com/all-contributors/app/issues/329 -->
This project was made with [c4builder] using [C4-PlantUML] diagrams based on [Structurizr DSL](https://github.com/structurizr/dsl) exports.

_**Notes**:_
-  The diagrams use the [C4 model].
-  Each containers (in the [C4 sense](https://c4model.com/#faq)) have their own repo (i.e. `1 container = 1 repo`).

## Contributing
Cf. [CONTRIBUTING](./CONTRIBUTING.md).

## Abstractions used
C.f. [C4 model] for more information.

![C4 Model](https://c4model.com/img/abstractions.png)

### Person

However you think about your users (as actors, roles, personas, etc), people are the various human users of your software system.

### Software System

A software system is the highest level of abstraction and describes something that delivers value to its users, whether they are human or not. This includes the software system you are modelling, and the other software systems upon which your software system depends (or vice versa).

### Container

A container represents something that hosts code or data. A container is something that needs to be running in order for the overall software system to work. In real terms, a container is something like:

- Server-side web application: A Java EE web application running on Apache Tomcat, an ASP.NET MVC application running on Microsoft IIS, a Ruby on Rails application running on WEBrick, a Node.js application, etc.

- Client-side web application: A JavaScript application running in a web browser using Angular, Backbone.JS, jQuery, etc).

- Client-side desktop application: A Windows desktop application written using WPF, an OS X desktop application written using Objective-C, a cross-platform desktop application written using JavaFX, etc.
- Mobile app: An Apple iOS app, an Android app, a Microsoft Windows Phone app, etc.

- Server-side console application: A standalone (e.g. "public static void main")

- etc

### Component

Component
The word "component" is a hugely overloaded term in the software development industry, but in this context a component is simply a grouping of related functionality encapsulated behind a well-defined interface. If you're using a language like Java or C#, the simplest way to think of a component is that it's a collection of implementation classes behind an interface. Aspects such as how those components are packaged (e.g. one component vs many components per JAR file, DLL, shared library, etc) is a separate and orthogonal concern.

An important point to note here is that all components inside a container typically execute in the same process space.

[C4 model]: https://c4model.com
[c4builder]: https://adrianvlupu.github.io/C4-Builder/
[C4-PlantUML]: https://github.com/RicardoNiepel/C4-PlantUML
[PlantUML]: http://plantuml.com/
[Markdown]: https://guides.github.com/features/mastering-markdown/