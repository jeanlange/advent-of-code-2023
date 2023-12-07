this looks like a db problem.
multiple tables. Lots of ids. tracing a thing through multiple tables until I get to location.
In the real input, there will be MILES of possible values. a db could certainly handle that. I wonder what part 2 is :P

If not using a db, I could trace it forwards or backwards. There are few starting values, so forwards seems like a better option.

Read the maps in:
    name
    input type
    output type
    array of ranges
        original text
        source range - start and end
        destination - offset
an array of maps.

So in approaching a 'map', I ask the map to map it for me:
- for each line
  - Is it in the source range?
  - if so, mapping is applying the offset.
- if it wasn't in any line, then just return the same number

And then I have to map through repeated maps.

map to string:
Map: [name]
input [input type] [input] is in range [text] and corresponds to destination [output type] [output]



=== part 2! ===
Thoughts about optimization.
* truncate numbers somehow?
* where can I use a hash?
* working backwards?
* can I not repeat lookups somehow?
* can I invalidate large swaths of possibilities?
* check fewer ranges by ordering them
* spend time on building instead of on checking against built thing