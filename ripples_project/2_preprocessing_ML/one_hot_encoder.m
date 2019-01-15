function M = one_hot_encoder(V)
%one_hot_encoder Splits a vector V containg integer numbers in a matrix
%   exp: V = [1 2 3 1] --> M = [1 0 0;
%                               0 1 0;
%                               0 0 1;
%                               1 0 0]
f = min(V):max(V);
D = length(f);
M = zeros(length(V),D);
for i = 1:D    
    M(V==(i-1),i) = 1;   
end

end

