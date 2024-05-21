# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"100770.0","system":"readv2"},{"code":"10659.0","system":"readv2"},{"code":"47649.0","system":"readv2"},{"code":"13103.0","system":"readv2"},{"code":"97894.0","system":"readv2"},{"code":"52630.0","system":"readv2"},{"code":"48192.0","system":"readv2"},{"code":"44779.0","system":"readv2"},{"code":"50429.0","system":"readv2"},{"code":"9835.0","system":"readv2"},{"code":"58604.0","system":"readv2"},{"code":"100964.0","system":"readv2"},{"code":"69748.0","system":"readv2"},{"code":"13101.0","system":"readv2"},{"code":"17545.0","system":"readv2"},{"code":"2986.0","system":"readv2"},{"code":"3286.0","system":"readv2"},{"code":"98071.0","system":"readv2"},{"code":"7069.0","system":"readv2"},{"code":"47377.0","system":"readv2"},{"code":"13099.0","system":"readv2"},{"code":"13108.0","system":"readv2"},{"code":"30477.0","system":"readv2"},{"code":"18496.0","system":"readv2"},{"code":"17313.0","system":"readv2"},{"code":"102740.0","system":"readv2"},{"code":"34283.0","system":"readv2"},{"code":"44260.0","system":"readv2"},{"code":"49554.0","system":"readv2"},{"code":"101881.0","system":"readv2"},{"code":"47321.0","system":"readv2"},{"code":"42762.0","system":"readv2"},{"code":"47584.0","system":"readv2"},{"code":"41389.0","system":"readv2"},{"code":"49655.0","system":"readv2"},{"code":"93727.0","system":"readv2"},{"code":"17262.0","system":"readv2"},{"code":"18387.0","system":"readv2"},{"code":"11433.0","system":"readv2"},{"code":"10755.0","system":"readv2"},{"code":"1323.0","system":"readv2"},{"code":"3837.0","system":"readv2"},{"code":"33254.0","system":"readv2"},{"code":"25591.0","system":"readv2"},{"code":"13097.0","system":"readv2"},{"code":"41049.0","system":"readv2"},{"code":"93875.0","system":"readv2"},{"code":"38161.0","system":"readv2"},{"code":"47144.0","system":"readv2"},{"code":"10099.0","system":"readv2"},{"code":"6509.0","system":"readv2"},{"code":"11599.0","system":"readv2"},{"code":"13102.0","system":"readv2"},{"code":"11129.0","system":"readv2"},{"code":"52041.0","system":"readv2"},{"code":"11626.0","system":"readv2"},{"code":"44982.0","system":"readv2"},{"code":"47328.0","system":"readv2"},{"code":"22871.0","system":"readv2"},{"code":"99311.0","system":"readv2"},{"code":"49276.0","system":"readv2"},{"code":"95343.0","system":"readv2"},{"code":"65463.0","system":"readv2"},{"code":"110400.0","system":"readv2"},{"code":"59725.0","system":"readv2"},{"code":"70316.0","system":"readv2"},{"code":"69278.0","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('diabetic-ophthalmic-complications-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["complications---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["complications---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["complications---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
