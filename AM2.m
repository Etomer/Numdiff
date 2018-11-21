function yn=AM2(f,t,timeStep,y,Fo)

yn = y + timeStep.*f(y)./2+Fo(end)./2;

end