class MinStack
        def initialize()
            @datas = []
            @mins = []
        end
    
        def push(x)
            @datas << x
            @mins << x if @mins.empty? || x < @mins.last
        end
    
        def pop()
            a = @datas.pop
            @mins.pop if @mins.last == a
        end
    
        def top()
            @datas.last
        end
    
        def get_min()
            @mins.last
        end
    end

    stack = MinStack.new
    stack.push -2
    puts stack