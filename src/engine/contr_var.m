function contr=contr_var(gp,status,param,type)
if (type==1)
    p1=param(1);
    p2=param(2);
    p3=param(3);
    if status==1
        contr=(p2-p1)*gp+p1;
    elseif status==2
        contr=p2;
    elseif status==3
        contr=-(p3-p2)*gp+p3;
    end
elseif (type==2)
    p1=param(1);
    p2=param(2);
    p3=param(3);
    p4=param(4);
    if status==1
        if gp==1
            contr=(p2+p3)/2;
        else
            contr=gp*(p2-p1)+p1;
        end
    elseif status==2
        contr=(p2+p3)/2;
    elseif status==3
        if gp==1
            contr=(p2+p3)/2;
        else
            contr=-(p4-p3)*gp +p4;
        end
    end
elseif (type==3)
    m=param(1);
    s=param(2);
    s2=s*s;
    if gp<0.01
        flaggp=1;
    else
        flaggp=0;
    end
    if status==1
        if flaggp==1
            contr=m-3*s;
        else
            contr=m-sqrt(-2*s2*log(gp));
        end
    elseif status==2
        contr=m;
    elseif status==3
        if flaggp==1
            contr=m+3*s;
        else
            contr=m+sqrt(-2*s2*log(gp));
        end
    end
end
end