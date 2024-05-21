# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"C108700","system":"readv2"},{"code":"C10E112","system":"readv2"},{"code":"C109600","system":"readv2"},{"code":"C108100","system":"readv2"},{"code":"C108F00","system":"readv2"},{"code":"C109100","system":"readv2"},{"code":"C10E712","system":"readv2"},{"code":"C10EF12","system":"readv2"},{"code":"C109E00","system":"readv2"},{"code":"E11.3","system":"readv2"},{"code":"E10.3","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('diabetic-ophthalmic-complications-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["noninsulindependent-diabetic-ophthalmic-complications---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["noninsulindependent-diabetic-ophthalmic-complications---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["noninsulindependent-diabetic-ophthalmic-complications---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
