[![Build Status](https://travis-ci.org/gcpmendez/prct09.svg?branch=master)](https://travis-ci.org/gcpmendez/prct09)

# Práctica de laboratorio \#9
      
Este práctica ha sido desarrollado en la asignatura de **Lenguajes y Paradigmas de la Programación** del **_Grado en Ingeniería Informática_** de la **ULL**.

## Descripción de la práctica: POO. módulos.
1. Considere la jerarquía de clases Ruby para representar referencias bibliográficas de prácticas
anteriores.
Modifíquela de manera que las instancias sean comparables.
Utilizar la metodología de desarrollo dirigido por pruebas (Test Driven Development - TDD) y
la herramienta RSpec.
2. Considere la clase Ruby para representar y gestionar listas doblemente enlazadas de prácticas
anteriores.
Modifíquela de manera que las instancias sean enumerables.
Utilizar la metodología de desarrollo dirigido por pruebas (Test Driven Development - TDD) y
la herramienta RSpec.
3. Comprobar con la herramienta Travis de Integración Continua. el código Ruby desarrollado.
Con ella se comprueba la portabilidad de los desarrollos entre distintas plataformas y versiones
de Ruby.
Darse de alta en [(https://travis-ci.org/) y permitir que se acceda desde Github (poniendo
a ON el proyecto).
Crear un fichero .travis.yml que contenga el listado de plataformas sobre las que se quiere
comprobar el correcto funcionamiento, por ejemplo:

```ruby
language: ruby
rvm:
- 2.2.0
- 1.9.3
- jruby-19mode # JRuby in 1.9 mode
- rbx-19mode
```
Para trabajar con Travis el repositorio debe estar en Github. Crear un ‘repositorio’ en Github.  
4. Escribir la dirección http del repositorio que se ha creado en Github en la tarea habilitada en
el Campus Virtual.

## Árbol de ficheros y directorios
```
.
├── CODE_OF_CONDUCT.md
├── Gemfile
├── Gemfile.lock
├── Guardfile
├── LICENSE.txt
├── README.md
├── Rakefile
├── bin
│   ├── console
│   └── setup
├── lib
│   ├── prct09
│   │   ├── book.rb
│   │   ├── electronicdocument.rb
│   │   ├── journalarticle.rb
│   │   ├── linkedList.rb
│   │   ├── magazinearticle.rb
│   │   ├── reference.rb
│   │   ├── regularpublications.rb
│   │   └── version.rb
│   └── prct09.rb
├── prct09.gemspec
├── spec
│   ├── Comparable_spec.rb
│   ├── Enumerable_spec.rb
│   ├── book_spec.rb
│   ├── electronicdocument_spec.rb
│   ├── journalarticle_spec.rb
│   ├── linkedlist_spec.rb
│   ├── magazinearticle_spec.rb
│   ├── reference_spec.rb
│   ├── regularpublications_spec.rb
│   └── spec_helper.rb
└── tmp
```