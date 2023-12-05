# what is this
I'm working through the [Advent of Code for 2023](https://adventofcode.com/2023). Let's see how I do on the streak this time! My intention is to do each day on its day.
# Things I learned
## Day 4
* if counting `lines`, gotta actually change `lines`, not just what I'm `each`-ing over.
* proud of myself for using a hash map :P
* tests were a delight today
* found `Array#intersection`, ahhh, so glad it's there
## Day 3
* sometimes it's not `gsub`. Sometimes `sub` is actually what you want.
* `File.readlines("name")`
* a use for `next` - really just to soothe my 'you don't have to check EVERYTHING' heart
* viewing terminal: control-tick
## Days 1/2
* Use a class to parse each line
* I want 'scan', not 'match', to find multiple regex matches
* refresh on something I always have to look up: `File.open("name.txt").each do |line|`
* refresh on that map syntax:
  * `.map{|value| value.function}` becomes
  * `.map(&:function)`
  * the parens change. That always gets me.