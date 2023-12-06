Time:      7  15   30
Distance:  9  40  200

* So I have to find a top number that will work and a bottom
    * like for the first one, `bottom = 2` and `top = 5``
    * then `top - bottom + 1`` is how many ways to win.
* I could binary search to find those...
    * find_working(middle)
    * if it works, find_bottom(down) and find_top(up)
    * if not, find_working(down_middle)? Will the middle always work? Maybe let's assume :P
        * In the examples they gave, the middle always works and there is an even number of answers around it
            * maybe the middle is always the longest distance you can possibly go?
        * so maybe - from middle, find bottom, then assume top is same distance?
        * looks like if it's odd, there will be an even number of answers, and if it's even, there will be an odd number. Makes sense.
