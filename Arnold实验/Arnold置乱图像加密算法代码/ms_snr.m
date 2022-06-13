

function snr= ms_snr(A,B)

snr=sum(sum((A).^2))/sum(sum((A-B).^2));

end