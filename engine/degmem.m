function gp=degmem(input,param,type)

if (type==1)
    p1=param(1);
    p2=param(2);
    p3=param(3);
    if ((input>p1)&&(input<=p2))
        gp=(input-p1)/(p2-p1);
    elseif ((input>p2)&&(input<p3))
        gp=(input-p3)/(-(p3-p2));
    else
        gp=0;
    end
elseif (type==2)
    p1=param(1);
    p2=param(2);
    p3=param(3);
    p4=param(4);
    if ((input>p1)&&(input<p2))
        gp=(input-p1)/(p2-p1);
    elseif ((input>=p2)&&(input<=p3))
        gp=1;
    elseif ((input>p3)&&(input<p4))
        gp= (input-p4)/(-(p4-p3));
    else
        gp=0;
    end
elseif (type==3)
    m=param(1);
    s=param(2);
    s2=s*s;
    gp=exp(-(input-m)^2/(2*s2));
    if gp<0.01
        gp=0;
    end
end
end