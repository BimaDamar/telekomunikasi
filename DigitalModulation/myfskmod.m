function y = myfskmod(x,A,fc1,fc0,t2)
y=[];
for (i=1:1:length(x))
    if (x(i)==1)
        as=A*cos(2*pi*fc1*t2);
    else
        as=A*cos(2*pi*fc0*t2);
    end
    y=[y as];
end