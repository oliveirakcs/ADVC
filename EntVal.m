function num = EntVal(prompt)

while true
    num = str2double(input(prompt, 's'));
    if ~isnan(num)
        break
    end
end
