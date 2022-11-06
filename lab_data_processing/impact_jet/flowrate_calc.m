function flowrate = flowrate_calc(volume, time)
%FLOWRATE_CALC
% flowrate = flowrate_calc[volume,time]
% volume in litres, time in seconds returns m^6/s^2
    if length(volume) == length(time)
        for i = 1:length(volume)
        flowrate(i) = (volume(i) / (1000*time(i))).^2;
        end
    else
        error("Invalid input lists")
    end
end

