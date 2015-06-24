# This is a test project

## Ruby on Rails Developer Applicants Test

To understand your coding ability and style, we have devised a simple practical coding test.
We use this as a dicussion topic during interviews and may use it as a sample of your knowledge when presenting your profile to customers.

#### Objective:

* Make this data searchable

### #Minimum requirements:

* Implementation must use Ruby on Rails, JavaScript and HTML (all three)
* Search logic should be implemented in Ruby on Rails
* A search for Lisp Common should match a programming language named "Common Lisp"
* Your solution will be tested on a server running Ubuntu, Ruby 2.1 and Rails 4.2.0
* Deliver your solution as a zip or tar.gz file
* We will unpack your solution and run it from our server

#### Meriting:

* Writing code with reusability in mind
* Search match precision
* Search results ordered by relevance
* Support for exact matches, eg. Interpreted "Thomas Eugene", which should match "BASIC", but not "Haskell"
* Match in different fields, eg. Scripting Microsoft should return all scripting languages designed by "Microsoft"
* Support for negative searches, eg. john -array, which should match "BASIC", "Haskell", "Lisp" and "S-Lang", but not "Chapel", "Fortran" or "S".
* Solution elegance
* Visual design

#### Keep in mind:

* Frameworks are allowed, but not required.
** If you use a framework, please do not include the framework code. Write instructions allowing us to install the framework by ourselves (and where to add your code).
* Comments are VERY useful, they help us understand your thought process
* This exercise is not meant to take more than a few hours
* A readme file is encouraged

## Requirement

* Ruby 2.1.6
* PostreSQL

## Assumptions

* We assume that partial words should be compared

## Deploy

Standard RoR application deploy. Do not forget to seed the database.

## TODO

* Add checkbox `case (un)sensitive`
* Add colorizing the found search words
* Add design ;-)
