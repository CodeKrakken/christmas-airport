Airport Challenge
=================

This application provides a basic air traffic control system. It was programmed in Ruby using TDD, as revision over Christmas 2019.

User stories
------

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Setup
----

You will need Ruby 2.6.0. To get it, enter these commands in your terminal:

* `gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`

* `\curl -sSL https://get.rvm.io | bash -s stable --ruby`

* `source /home/pea/.rvm/scripts/rvm`

To install the project:

* `git clone https://github.com/CodeKrakken/christmas-airport.git`

Usage
---

* Run `rspec` in the parent folder to run the unit tests
* You can explore the programme in `irb` - first enter `require './lib/plane'` and you can then use the programme's various commands
* You can run the complete feature test by entering `irb features/feature.rb`

Feature test screenshot:

<img width="1280" alt="Screenshot 2019-12-31 at 15 55 47" src="https://user-images.githubusercontent.com/52076323/71627486-9461cb00-2bea-11ea-9812-11879bf5ab9e.png">
