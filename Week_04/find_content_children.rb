# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)
    g.sort!
    s.sort! # sort the arrays because it didn't mention if the inputs are sorted
    gi = g.length - 1
    si = s.length - 1
    ans = 0
    while gi >= 0 && si >= 0 # always use the cookie with the largest value to find the child it can feed
        if s[si] >= g[gi]
            ans += 1
            gi -= 1
            si -= 1
        else 
            gi -= 1 # if the child wants more, skip them
        end
    end
    ans
end