function [adimensional_lambda] = SingolPredictor(adimensional_Ab,params)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a = params(1);
b = params(3);
c = params(3);
d = params(4);
adimensional_lambda = 1./(a+b.*adimensional_Ab.*(1-exp(-(c.*adimensional_Ab).^d)));
end

