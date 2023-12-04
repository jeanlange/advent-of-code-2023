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