# All Contributors Software Architecture

## Introduction

This is a place where architectural diagrams of all the AC projects can be found.

It's currently focused on the _new world_ (revamped) projects so it may not accurately illustrate the current systems.
<!-- ref: https://github.com/all-contributors/app/issues/329 -->
This project was made with [c4builder] using [C4-PlantUML] diagrams based on [Structurizr DSL](https://github.com/structurizr/dsl) exports.

_**Notes**:_
-  The diagrams use the [C4 model].
-  Each containers (in the [C4 sense](https://c4model.com/#faq)) have their own repo (i.e. `1 container = 1 repo`).

## Diagrams
As per the [C4 model], the diagrams go from a high level view ([system context](docs/context.svg), level 1) to components (level 3, _not files and classes as they are too low level and may frequently change_), so it's recommended to go through them in their order of levels, so you can get a better understanding of the whole system.

But with the above in mind, most of you would get a good understanding of how All Contributors is structured and how each repositories fit into the overall picture by looking at the [container diagram](docs/1%20All%20Contributors%20System/system.svg) shown below:
![AC container diagram](docs/1%20All%20Contributors%20System/system.svg)

The key elements are the [containers](https://c4model.com/#ContainerDiagram) such as the [GitHub app](https://github.com/all-contributors/app) (the bot), the [CLI](https://github.com/all-contributors/all-contributors-cli), the library (currently inexistent and integrated into the CLI and app), the [website](https://allcontributors.org/), the [Deep Learning tool](https://github.com/all-contributors/ac-learn) (AC-Learn) and the specification (currently inexistent and spread across the app, CLI and website).

## Contributing
Cf. [CONTRIBUTING](./CONTRIBUTING.md).

[C4 model]: https://c4model.com
[c4builder]: https://adrianvlupu.github.io/C4-Builder/
[C4-PlantUML]: https://github.com/RicardoNiepel/C4-PlantUML
[PlantUML]: http://plantuml.com/
[Markdown]: https://guides.github.com/features/mastering-markdown/