function signal=location(input,param,type)

if (type==1) 
    m=param(2);  
elseif (type==2)
    m=(param(2)+param(3))/2;
elseif (type==3)
    m=param(1);
end

if (input-m)>0
    signal=1;
else
    signal=-1;
end

end