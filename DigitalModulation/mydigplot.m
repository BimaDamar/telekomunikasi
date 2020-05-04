function y = mydigplot(x)

y=[];
for n=1:1:length(x)
    if x(n)==1;
        se=ones(1,100);
    else x(n)==0;
        se=zeros(1,100);
    end
    y=[y se];
end
