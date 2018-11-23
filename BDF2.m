function yn=BDF2(f,timeStep,y,Fo)

yn=y+timeStep.*(3/2.*Fo(:,end)-1/2.*Fo(:,end-1))

end