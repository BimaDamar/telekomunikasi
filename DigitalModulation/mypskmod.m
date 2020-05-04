function y = mypskmod(x,A,f,t2)
y=[];
for (i=1:1:length(x))
    if (x(i)==1)
        as=A*cos(2*pi*f*t2);
    else
        as=A*cos(2*pi*f*t2+pi);   %A*cos(2*pi*f*t+pi) means -A*cos(2*pi*f*t)
    end
    y=[y as];
end