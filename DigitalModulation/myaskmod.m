function y = myaskmod(x,A0,A1,f,t2)
y=[];
for (i=1:1:length(x))
    if (x(i)==1)
        as=A1*cos(2*pi*f*t2);
    else
        as=A0*cos(2*pi*f*t2);
    end
    y=[y as];
end