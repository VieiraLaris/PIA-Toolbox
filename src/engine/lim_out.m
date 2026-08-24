function output=lim_out(output,limite)

if output>limite(2)
    output=limite(2);
elseif output<limite(1)
    output=limite(1);
end

end