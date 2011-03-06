    function [value,isterminal,direction] =events(t,M)
        value = M(3)+1;
        isterminal = 1;
        direction = -1;
    end