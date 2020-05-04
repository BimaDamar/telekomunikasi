function y = myfskdemod(m,t2,bp,A,fc1,fc0)
ss=length(t2);
y=[];
for n=ss:ss:length(m)
    t=bp/99:bp/99:bp;
    y1=cos(2*pi*fc1*t);                    % carrier siignal for information 1
    y2=cos(2*pi*fc0*t);                    % carrier siignal for information 0
    mm=y1.*m((n-(ss-1)):n);
    mmm=y2.*m((n-(ss-1)):n);
    t4=bp/99:bp/99:bp;
    z1=trapz(t4,mm)                                             % intregation 
    z2=trapz(t4,mmm)                                            % intregation 
     zz1=round(2*z1/bp)
    zz2= round(2*z2/bp)
    if(zz1>A/2)      % logic lavel= (0+A)/2 or (A+0)/2 or 2.5 ( in this case)
        a=1;
    else(zz2>A/2)
        a=0;
    end
    y=[y a];
end