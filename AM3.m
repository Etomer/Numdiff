function yn=AM3(f,timeStep,y,Fo,ToL,max)
%Fo ?r en vektor med de n-1 sista funktionsutvecklingarna
it=0;
yLast=1;
ynew=12;

while abs(ynew-yLast)<ToL
    %bara f?r att se till att den inte totalkrashar datorn och
    %programmet...
    if it<max


        yLast=ynew;

        ynew = yLast + timeStep.*(5./12.*f(yLast)+2./3.*Fo(end)-1./12.*Fo(end-1));


    end
    
    if it==max
        break
    end
    it=it+1;
end

yn=ynew;

end